-- SPDX-License-Identifier: GPL-3.0-only
-- Ashita Direct3D8 backend. Orthographic CPU-skinned model, private depth buffer.
-- Transient DEFAULT-pool resources are released before returning to the client;
-- only MANAGED textures persist. No undocumented reset hook is required.
local ffi,bit=require('ffi'),require('bit')
local d3d=require('d3d8');local pose=require('pose');local decode=require('texture').decode
local C=ffi.C
if not pcall(ffi.typeof,'VVVertex') then ffi.cdef('typedef struct { float x,y,z,rhw; uint32_t color; float u,v; } VVVertex;') end
local M={}; M.__index=M
local function check(hr,what) if tonumber(hr)<0 then error(what..': HRESULT '..tostring(tonumber(hr))) end end
local function release(p) if p~=nil then p:Release() end end
function M.new(model)
 local center,radius=pose.bounds(model)
 local self=setmetatable({model=model,center=center,radius=radius,textures={},batches={},size=512},M)
 for _,g in ipairs(model.meshes) do for _,p in ipairs(g.pieces) do
  local corners={}
  if p.strip then
   for i=1,#p.corners-2 do
    local a,b,c=p.corners[i],p.corners[i+1],p.corners[i+2]
    if i%2==0 then a,b=b,a end
    corners[#corners+1]=a;corners[#corners+1]=b;corners[#corners+1]=c
   end
  else corners=p.corners end
  self.batches[#self.batches+1]={pool=p.mirrored and g.mirrored or g.vertices,corners=corners,texture=p.texture,ambient=p.ambient,buffer=ffi.new('VVVertex[?]',#corners)}
 end end
 return self
end
function M:dispose()
 for _,tx in pairs(self.textures) do release(tx) end
 self.textures={};release(self.display);self.display=nil
end
function M:upload(device)
 if self.display then return end
 local ok,err=xpcall(function()
  for name,t in pairs(self.model.textures) do
   local hr,tx=device:CreateTexture(t.width,t.height,1,0,C.D3DFMT_A8R8G8B8,C.D3DPOOL_MANAGED);check(hr,'Crear textura');self.textures[name]=tx
   local pixels=decode(t); local lh,lock=tx:LockRect(0,nil,0);check(lh,'Lock textura')
   for y=0,t.height-1 do ffi.copy(ffi.cast('uint8_t*',lock.pBits)+y*lock.Pitch,pixels:sub(y*t.width*4+1,(y+1)*t.width*4),t.width*4) end
   check(tx:UnlockRect(0),'Unlock textura')
  end
  local hr,tx=device:CreateTexture(self.size,self.size,1,0,C.D3DFMT_A8R8G8B8,C.D3DPOOL_MANAGED);check(hr,'Crear imagen visor');self.display=tx
 end,debug.traceback)
 if not ok then self:dispose();error(err) end
end
local function shade(c,light)
 local function v(shift) return math.min(255,math.floor(bit.band(bit.rshift(c,shift),255)*2*light)) end
 return 0xff000000+v(16)*65536+v(8)*256+v(0)
end
function M:draw(clip,frame,yaw,pitch,zoom,wire,bg,panx,pany)
 local device=d3d.get_device();if device==nil then return false end
 if device:TestCooperativeLevel()~=0 then return false end
 self:upload(device)
 local state,oldrt,oldz,oldvp,rt,surface,depth,staging
 local ok,err=xpcall(function()
  local hr;hr,state=device:CreateStateBlock(C.D3DSBT_ALL);check(hr,'Guardar estado')
  hr,oldrt=device:GetRenderTarget();check(hr,'Leer destino')
  hr,oldz=device:GetDepthStencilSurface() -- no depth buffer is legal
  hr,oldvp=device:GetViewport();check(hr,'Leer viewport')
  hr,rt=device:CreateTexture(self.size,self.size,1,C.D3DUSAGE_RENDERTARGET,C.D3DFMT_A8R8G8B8,C.D3DPOOL_DEFAULT);check(hr,'Crear destino visor')
  hr,surface=rt:GetSurfaceLevel(0);check(hr,'Leer superficie')
  hr,depth=device:CreateDepthStencilSurface(self.size,self.size,C.D3DFMT_D16,C.D3DMULTISAMPLE_NONE);check(hr,'Crear profundidad')
  -- Remove any inherited stage bindings before drawing into a texture.
  for stage=0,7 do check(device:SetTexture(stage,nil),'Limpiar textura') end
  check(device:SetRenderTarget(surface,depth),'Activar destino')
  local vp=ffi.new('D3DVIEWPORT8[1]');vp[0].Width=self.size;vp[0].Height=self.size;vp[0].MinZ=0;vp[0].MaxZ=1
  check(device:SetViewport(vp),'Viewport visor')
  check(device:Clear(0,nil,bit.bor(C.D3DCLEAR_TARGET,C.D3DCLEAR_ZBUFFER),bg or 0xff171e29,1,0),'Limpiar visor')
  check(device:SetVertexShader(bit.bor(C.D3DFVF_XYZRHW,C.D3DFVF_DIFFUSE,C.D3DFVF_TEX1)),'Vertex format')
  check(device:SetPixelShader(0),'Pixel shader')
  local function rs(k,v) check(device:SetRenderState(k,v),'Render state') end
  local function ts(s,k,v) check(device:SetTextureStageState(s,k,v),'Texture state') end
  rs(C.D3DRS_ZENABLE,C.D3DZB_TRUE);rs(C.D3DRS_ZWRITEENABLE,1);rs(C.D3DRS_ZFUNC,C.D3DCMP_LESSEQUAL)
  rs(C.D3DRS_LIGHTING,0);rs(C.D3DRS_FOGENABLE,0);rs(C.D3DRS_STENCILENABLE,0);rs(C.D3DRS_ALPHABLENDENABLE,0)
  rs(C.D3DRS_ALPHATESTENABLE,1);rs(C.D3DRS_ALPHAREF,96);rs(C.D3DRS_ALPHAFUNC,C.D3DCMP_GREATER)
  rs(C.D3DRS_CULLMODE,C.D3DCULL_NONE);rs(C.D3DRS_FILLMODE,wire and C.D3DFILL_WIREFRAME or C.D3DFILL_SOLID)
  rs(C.D3DRS_SHADEMODE,C.D3DSHADE_GOURAUD);rs(C.D3DRS_COLORWRITEENABLE,15);rs(C.D3DRS_SPECULARENABLE,0)
  rs(C.D3DRS_CLIPPLANEENABLE,0);rs(C.D3DRS_ZBIAS,0)
  ts(0,C.D3DTSS_TEXCOORDINDEX,0);ts(0,C.D3DTSS_TEXTURETRANSFORMFLAGS,C.D3DTTFF_DISABLE)
  ts(0,C.D3DTSS_ADDRESSU,C.D3DTADDRESS_WRAP);ts(0,C.D3DTSS_ADDRESSV,C.D3DTADDRESS_WRAP)
  ts(0,C.D3DTSS_MINFILTER,C.D3DTEXF_LINEAR);ts(0,C.D3DTSS_MAGFILTER,C.D3DTEXF_LINEAR);ts(0,C.D3DTSS_MIPFILTER,C.D3DTEXF_NONE)
  ts(0,C.D3DTSS_COLORARG1,C.D3DTA_TEXTURE);ts(0,C.D3DTSS_COLORARG2,C.D3DTA_DIFFUSE)
  ts(0,C.D3DTSS_ALPHAARG1,C.D3DTA_TEXTURE);ts(0,C.D3DTSS_ALPHAARG2,C.D3DTA_DIFFUSE)
  for s=1,7 do ts(s,C.D3DTSS_COLOROP,C.D3DTOP_DISABLE);ts(s,C.D3DTSS_ALPHAOP,C.D3DTOP_DISABLE) end
  local evaluated=pose.evaluate(self.model,clip,frame)
  local cy,sy,cp,sp=math.cos(yaw),math.sin(yaw),math.cos(pitch),math.sin(pitch)
  local scale=self.size*0.43*zoom/self.radius;local transformed={}
  local ox,oy=self.size/2+(panx or 0),self.size/2+(pany or 0) -- the model moved on the picture (pixels)
  local function project(pool)
   if transformed[pool] then return transformed[pool] end
   local out={}
   for i,v in ipairs(pool) do
    local p=pose.skin(v,evaluated);local x,y,z=p[1]-self.center[1],-(p[2]-self.center[2]),-(p[3]-self.center[3])
    local rx,rz=x*cy+z*sy,-x*sy+z*cy;local ry=cp*y-sp*rz;rz=sp*y+cp*rz
    out[i]={ox+rx*scale,oy-ry*scale,0.5-rz/(self.radius*16)}
   end
   transformed[pool]=out;return out
  end
  for _,batch in ipairs(self.batches) do
   local points=project(batch.pool);local buf=batch.buffer;local textured=self.textures[batch.texture]
   check(device:SetTexture(0,textured and ffi.cast('IDirect3DBaseTexture8*',textured) or nil),'Aplicar textura')
   ts(0,C.D3DTSS_COLOROP,textured and C.D3DTOP_MODULATE or C.D3DTOP_SELECTARG2)
   ts(0,C.D3DTSS_ALPHAOP,textured and C.D3DTOP_SELECTARG1 or C.D3DTOP_SELECTARG2)
   for i,c in ipairs(batch.corners) do
    local p=points[c.vi];local v=buf[i-1];v.x=p[1]-0.5;v.y=p[2]-0.5;v.z=p[3];v.rhw=1;v.u=c.u;v.v=c.v;v.color=shade(c.color,1)
   end
   check(device:DrawPrimitiveUP(C.D3DPT_TRIANGLELIST,#batch.corners/3,buf,ffi.sizeof('VVVertex')),'Dibujar malla')
  end
  -- Read back to a managed display texture. Slower than a persistent render
  -- target, but DEFAULT-pool references cannot block a game device reset.
  check(device:SetRenderTarget(oldrt,oldz),'Restaurar destino')
  hr,staging=device:CreateImageSurface(self.size,self.size,C.D3DFMT_A8R8G8B8);check(hr,'Crear lectura')
  check(device:CopyRects(surface,nil,0,staging,nil),'Copiar visor')
  local lh,src=staging:LockRect(nil,C.D3DLOCK_READONLY);check(lh,'Leer visor')
  local dh,dst=self.display:LockRect(0,nil,0)
  if tonumber(dh)<0 then staging:UnlockRect();check(dh,'Actualizar visor') end
  for y=0,self.size-1 do ffi.copy(ffi.cast('uint8_t*',dst.pBits)+y*dst.Pitch,ffi.cast('uint8_t*',src.pBits)+y*src.Pitch,self.size*4) end
  check(self.display:UnlockRect(0),'Fin imagen');check(staging:UnlockRect(),'Fin lectura')
 end,debug.traceback)
 -- Always restore, even on a decode/upload/draw failure. Keep original refs
 -- alive until the entire state has been restored.
 local restore_error
 if oldrt then local hr=device:SetRenderTarget(oldrt,oldz);if tonumber(hr)<0 then restore_error='No se pudo restaurar render target' end end
 if state then local hr=device:ApplyStateBlock(state);if tonumber(hr)<0 then restore_error='No se pudo restaurar estado D3D' end;device:DeleteStateBlock(state) end
 if oldvp then local vp=ffi.new('D3DVIEWPORT8[1]');vp[0]=oldvp;device:SetViewport(vp) end
 release(staging);release(surface);release(depth);release(rt);release(oldrt);release(oldz)
 if not ok then error(err) end;if restore_error then error(restore_error) end
 return true
end
return M
