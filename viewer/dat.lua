-- SPDX-License-Identifier: GPL-3.0-only
-- VanaViewer: Lua port of vekien/xi-model-viewer ui/js/dat.js, commit in NOTICE.md.
-- Entity subset only: skeleton, skinned mesh, textures, raw animation clips.
local ffi, bit = require('ffi'), require('bit')
local band, rshift = bit.band, bit.rshift
local M = {}
local R = {}; R.__index = R
function R:need(n) assert(n >= 0 and self.p+n <= self.limit, 'DAT truncado / lectura fuera de bloque @ '..self.p) end
function R:seek(p) assert(p >= self.base and p <= self.limit, 'Offset DAT fuera de bloque'); self.p=p end
function R:bytes(n) self:need(n); local s=self.s:sub(self.p+1,self.p+n); self.p=self.p+n; return s end
function R:u8() self:need(1); self.p=self.p+1; return self.s:byte(self.p) end
function R:u16() local a,b=self:bytes(2):byte(1,2); return a+b*256 end
function R:u32() local a,b,c,d=self:bytes(4):byte(1,4); return a+b*256+c*65536+d*16777216 end
function R:i32() local v=self:u32(); return v>=2147483648 and v-4294967296 or v end
local fv=ffi.new('float[1]')
function R:f32() ffi.copy(fv,self:bytes(4),4); local v=tonumber(fv[0]); assert(v==v and math.abs(v)<1e20,'Float DAT no valido'); return v end
function R:v3() return {self:f32(),self:f32(),self:f32()} end
function R:skip(n) self:bytes(n) end
function R:str(n) return self:bytes(n):gsub('%z.*',''):gsub(' +$','') end
local function reader(s,a,b) return setmetatable({s=s,p=a or 0,base=a or 0,limit=b or #s},R) end
local function skeleton(r)
 r:skip(2); local n=r:u8(); r:skip(1); assert(n>0,'Esqueleto vacio')
 local joints={}
 for i=1,n do
  local p=r:u8(); r:skip(1)
  assert(p<n,'Padre de hueso fuera de rango')
  joints[i]={parent=p==i-1 and 0 or p+1,rot={r:f32(),r:f32(),r:f32(),r:f32()},trans=r:v3()}
 end
 return joints
end
local function ref(v) return {band(v,127)+1,band(rshift(v,7),127)+1,rshift(v,14)} end
local function flip(v,a) local q={v[1],v[2],v[3]}; if a>=1 and a<=3 then q[a]=-q[a] end; return q end
local function mesh(r)
 local base=r.base
 r:skip(2); local flags=r:u8(); local normals=band(flags,1)==0; r:skip(1)
 local symmetric=r:u8()==1; r:skip(1)
 local instructions=2*r:i32(); r:skip(2)
 local jo,nj=2*r:i32(),r:u16()
 local co,nc=2*r:i32(),r:u16()
 local mo=2*r:i32(); r:skip(2)
 local vo=2*r:i32(); r:skip(8)
 r:seek(base+jo); local ja={}; for i=1,nj do ja[i]=r:u16()+1 end
 local function map(i) if band(flags,128)~=0 then assert(ja[i],'Indice de hueso no valido'); return ja[i] end; return i end
 r:seek(base+co); assert(nc==2,'Formato de vertices no soportado')
 local ns,nd=r:u16(),r:u16(); assert(ns+nd<=65535,'Demasiados vertices')
 local vertices,refs={},{}
 r:seek(base+mo)
 for i=1,ns+nd do
  local a,b=ref(r:u16()),ref(r:u16()); refs[i]={a,b}
  vertices[i]={joint0=map(a[1]),joint1=i>ns and map(b[1]) or 0,w0=1,w1=0,p1={0,0,0},n0={0,0,0},n1={0,0,0}}
 end
 r:seek(base+vo)
 for i=1,ns do local v=vertices[i]; v.p0=r:v3(); if normals then v.n0=r:v3() end end
 for i=ns+1,ns+nd do
  local v=vertices[i]; v.p0={}; v.p1={}
  for k=1,3 do v.p0[k]=r:f32(); v.p1[k]=r:f32() end
  v.w0=r:f32(); v.w1=r:f32()
  if normals then for k=1,3 do v.n0[k]=r:f32(); v.n1[k]=r:f32() end end
 end
 local mirrored
 if symmetric then
  mirrored={}
  for i,v in ipairs(vertices) do local a,b=unpack(refs[i]); mirrored[i]={p0=flip(v.p0,a[3]),p1=flip(v.p1,b[3]),n0=flip(v.n0,a[3]),n1=flip(v.n1,b[3]),w0=v.w0,w1=v.w1,joint0=map(a[2]),joint1=v.joint1>0 and map(b[2]) or 0} end
 end
 local pieces,texture={},''
 local ambient=1
 local function add(corners,strip)
  for _,c in ipairs(corners) do assert(c.vi>=1 and c.vi<=#vertices,'Indice de vertice no valido') end
  pieces[#pieces+1]={corners=corners,strip=strip,texture=texture,ambient=ambient,mirrored=false}
  if mirrored then pieces[#pieces+1]={corners=corners,strip=strip,texture=texture,ambient=ambient,mirrored=true} end
 end
 r:seek(base+instructions)
 while true do
  local op=r:u16()
  if op==65535 then break
  elseif op==0x8000 then texture=r:str(16)
  elseif op==0x8010 then r:skip(16); ambient=r:f32(); r:skip(24)
  elseif op==0x5453 or op==0x0054 or op==0x0043 or op==0x4353 then
   local n=r:u16(); assert(n>0 and n<=20000,'Cantidad de triangulos no valida')
   local c={}; local textured=op==0x5453 or op==0x0054
   local strip=op==0x5453 or op==0x4353
   local color=0x80808080
   local count=strip and 1 or n
   for _=1,count do
    local a,b,d=r:u16()+1,r:u16()+1,r:u16()+1
    if textured then
     c[#c+1]={vi=a,u=r:f32(),v=r:f32(),color=color}
     c[#c+1]={vi=b,u=r:f32(),v=r:f32(),color=color}
     c[#c+1]={vi=d,u=r:f32(),v=r:f32(),color=color}
    else
     color=r:u32()
     c[#c+1]={vi=a,u=0,v=0,color=color}; c[#c+1]={vi=b,u=0,v=0,color=color}; c[#c+1]={vi=d,u=0,v=0,color=color}
    end
   end
   if strip then for _=2,n do c[#c+1]={vi=r:u16()+1,u=textured and r:f32() or 0,v=textured and r:f32() or 0,color=color} end end
   local old=texture; if not textured then texture='' end; add(c,strip); texture=old
  else error(string.format('Opcode de malla no soportado 0x%04X',op)) end
 end
 return {vertices=vertices,mirrored=mirrored,pieces=pieces}
end
local function texture(r)
 local t=r:u8(); assert(t==1 or t==5 or t==0x81 or t==0x91 or t==0xa1 or t==0xb1,'Tipo de textura no soportado')
 local name=r:str(16); r:skip(4); local w,h=r:i32(),r:i32(); r:skip(2); local bits=r:u16(); r:skip(20); local pb=r:u32()
 assert(w>0 and h>0 and w<=2048 and h<=2048,'Textura demasiado grande o no valida (max 2048)')
 if t==0xa1 then
  local fmt=r:str(4); r:skip(8); assert(fmt=='1TXD' or fmt=='3TXD','DXT no soportado')
  local n=math.max(1,math.ceil(w/4))*math.max(1,math.ceil(h/4))*(fmt=='1TXD' and 8 or 16)
  return {name=name,width=w,height=h,format=fmt=='1TXD' and 'dxt1' or 'dxt3',data=r:bytes(n)}
 end
 if t==0xb1 then r:skip(4) end
 assert(bits==8 or bits==32,'Profundidad de textura no soportada')
 local pal={}
 if bits==8 then for i=0,255 do
  if pb==16 then
   local v=r:u16(); local a=band(v,32768)~=0 and 255 or 0
   pal[i]=math.floor(band(rshift(v,10),31)*255/31)*65536+math.floor(band(rshift(v,5),31)*255/31)*256+math.floor(band(v,31)*255/31)+a*16777216
  else pal[i]=r:u32() end
 end end
 local out=ffi.new('uint8_t[?]',w*h*4)
 for y=0,h-1 do for x=0,w-1 do
  local c=bits==32 and r:u32() or pal[r:u8()]; local o=((h-1-y)*w+x)*4
  -- BGRA for D3DFMT_A8R8G8B8; half-scale alpha converted to display alpha.
  out[o]=band(c,255); out[o+1]=band(rshift(c,8),255); out[o+2]=band(rshift(c,16),255); out[o+3]=math.min(255,rshift(c,24)*2)
 end end
 return {name=name,width=w,height=h,format='bgra',data=ffi.string(out,w*h*4)}
end
local function channel(r,n,frames,base)
 local off,con={},{}; local reset=false
 for i=1,n do off[i]=r:i32(); if off[i]<0 then reset=true end end
 for i=1,n do con[i]=math.fmod(r:f32(),10000) end
 if reset then return nil end
 local result={}
 for i=1,n do
  local vals={}; local saved=r.p
  if off[i]>0 then r:seek(base+off[i]*4) end
  for f=1,frames do vals[f]=off[i]==0 and con[i] or r:f32() end
  r:seek(saved); result[i]=vals
 end
 return result
end
local function animation(r,id)
 r:skip(2); local nj,nf=r:u16(),r:u16(); local duration=r:f32(); local base=r.p
 assert(nj<=256 and nf>0 and nf<=10000 and duration>0,'Animation non valide')
 local tracks={}
 for _=1,nj do
  local idx=r:i32()+1; assert(idx>=1 and idx<=256,'Indice animation no valido')
  local q=channel(r,4,nf,base); local t=channel(r,3,nf,base); local s=channel(r,3,nf,base)
  tracks[idx]=q and t and s and {q=q,t=t,s=s,frames=nf} or {q={{0},{0},{0},{1}},t={{0},{0},{0}},s={{1},{1},{1}},frames=1}
 end
 return {id=id,frames=nf,duration=duration,length=math.max(nf-1,1)/duration,tracks=tracks}
end
function M.parse(data)
 assert(#data<=64*1024*1024,'DAT demasiado grande (max 64 MiB)')
 local model={meshes={},textures={},animations={},sections={},warnings={}}
 local p=0
 while p<#data do
  local h=reader(data,p,#data); local id=h:str(4); local meta=h:u32()
  local typ=band(meta,127); local size=band(rshift(meta,7),0xfffff)*16
  assert(size>=16 and p+size<=#data,'Cabecera DAT invalida @ '..p)
  model.sections[#model.sections+1]={id=id,type=typ,size=size}
  local r=reader(data,p+16,p+size)
  if typ==0x29 and not model.joints then model.joints=skeleton(r)
  elseif typ==0x2a then model.meshes[#model.meshes+1]=mesh(r)
  elseif typ==0x20 then local tx=texture(r); model.textures[tx.name]=tx
  elseif typ==0x2b then model.animations[#model.animations+1]=animation(r,id) end
  p=p+size
 end
 assert(model.joints and #model.meshes>0,'Este DAT no contiene esqueleto y malla completos; necesita recursos adicionales')
 for _,g in ipairs(model.meshes) do
  for _,pool in ipairs({g.vertices,g.mirrored}) do for _,v in ipairs(pool) do assert(v.joint0<=#model.joints and v.joint1<=#model.joints,'Malla requiere otro esqueleto') end end
  for _,piece in ipairs(g.pieces) do if piece.texture~='' then assert(model.textures[piece.texture],'Falta textura: '..piece.texture) end end
 end
 return model
end
function M.load(path)
 local f,e=io.open(path,'rb'); assert(f,e)
 local size=f:seek('end'); if not size or size>64*1024*1024 then f:close(); error('DAT excede 64 MiB') end
 f:seek('set'); local data=f:read('*a'); f:close(); return M.parse(data)
end
return M
