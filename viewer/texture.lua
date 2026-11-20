-- SPDX-License-Identifier: GPL-3.0-only
-- DXT decode ported from xi-model-viewer ui/js/renderer.js decodeDxt.
local ffi,bit=require('ffi'),require('bit'); local band,rshift=bit.band,bit.rshift
local M={}
function M.decode(t)
 if t.format=='bgra' then return t.data end
 local s=t.data; local w,h=t.width,t.height; local dxt1=t.format=='dxt1'
 local out=ffi.new('uint8_t[?]',w*h*4)
 local function u16(p) local a,b=s:byte(p+1,p+2); return a+b*256 end
 local function rgb(v) return {band(rshift(v,11),31)*255/31,band(rshift(v,5),63)*255/63,band(v,31)*255/31,255} end
 local nx,ny=math.max(1,math.ceil(w/4)),math.max(1,math.ceil(h/4))
 for by=0,ny-1 do for bx=0,nx-1 do
  local off=(by*nx+bx)*(dxt1 and 8 or 16); local co=off+(dxt1 and 0 or 8)
  local a,b=u16(co),u16(co+2); local c={rgb(a),rgb(b),{}, {}}
  if dxt1 and a<=b then
   for k=1,3 do c[3][k]=(c[1][k]+c[2][k])/2; c[4][k]=0 end; c[3][4]=255; c[4][4]=0
  else
   for k=1,3 do c[3][k]=(2*c[1][k]+c[2][k])/3; c[4][k]=(c[1][k]+2*c[2][k])/3 end; c[3][4]=255; c[4][4]=255
  end
  for py=0,3 do for px=0,3 do
   local x,y=bx*4+px,by*4+py; local pi=py*4+px
   if x<w and y<h then
    local ix=band(rshift(s:byte(co+5+py),px*2),3)+1; local color=c[ix]; local alpha=color[4]
    if not dxt1 then alpha=band(rshift(s:byte(off+1+math.floor(pi/2)),(pi%2)*4),15)*17 end
    local o=(y*w+x)*4
    out[o]=math.floor(color[3]); out[o+1]=math.floor(color[2]); out[o+2]=math.floor(color[1]); out[o+3]=math.min(255,alpha*2)
   end
  end end
 end end
 return ffi.string(out,w*h*4)
end
return M
