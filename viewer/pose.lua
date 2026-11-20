-- SPDX-License-Identifier: GPL-3.0-only
-- Port of xi-model-viewer/ui/js/pose.js: raw clips, bind transforms, CPU skinning.
local M={}
function M.mul(a,b)
 local x,y,z,w=unpack(a); local X,Y,Z,W=unpack(b)
 return {w*X+x*W+y*Z-z*Y,w*Y-x*Z+y*W+z*X,w*Z+x*Y-y*X+z*W,w*W-x*X-y*Y-z*Z}
end
function M.rotate(q,v)
 local x,y,z,w=unpack(q); local a,b,c=unpack(v)
 local cx,cy,cz=y*c-z*b+w*a,z*a-x*c+w*b,x*b-y*a+w*c
 return {a+2*(y*cz-z*cy),b+2*(z*cx-x*cz),c+2*(x*cy-y*cx)}
end
local function sample(t,phase)
 local pos=math.max(0,math.min(1,phase))*(t.frames-1)
 local lo=math.floor(pos)+1; local hi=math.min(lo+1,t.frames); local f=pos-math.floor(pos)
 local q,s,tr={},{},{}; local dot=0
 for k=1,4 do dot=dot+t.q[k][lo]*t.q[k][hi] end
 local sign=dot<0 and -1 or 1; local len=0
 for k=1,4 do q[k]=t.q[k][lo]*(1-f)+sign*t.q[k][hi]*f; len=len+q[k]^2 end
 if f>0 then len=math.sqrt(len); if len>0 then for k=1,4 do q[k]=q[k]/len end end end
 for k=1,3 do tr[k]=t.t[k][lo]*(1-f)+t.t[k][hi]*f; s[k]=t.s[k][lo]*(1-f)+t.s[k][hi]*f end
 return q,tr,s
end
function M.evaluate(model,clip,frame)
 local out={}; local phase=clip and frame/clip.length or 0
 local function visit(i,stack)
  if out[i] then return end
  assert(not stack[i],'Ciclo en el esqueleto'); stack[i]=true
  local j=model.joints[i]; local q={unpack(j.rot)}; local t={unpack(j.trans)}; local s={1,1,1}
  local track=clip and clip.tracks[i]
  if track then
   local aq,at,as=sample(track,phase); q=M.mul(aq,q)
   for k=1,3 do t[k]=t[k]+at[k] end
   if i~=1 then s=as end
  end
  if i==1 then t={-t[3],t[2],t[1]} end
  if j.parent>0 then
   visit(j.parent,stack); local p=out[j.parent]
   local st={p.s[1]*t[1],p.s[2]*t[2],p.s[3]*t[3]}; local rt=M.rotate(p.q,st)
   for k=1,3 do t[k]=p.t[k]+rt[k]; s[k]=p.s[k]*s[k] end
   q=M.mul(p.q,q)
  end
  out[i]={q=q,t=t,s=s}; stack[i]=nil
 end
 for i=1,#model.joints do visit(i,{}) end
 return out
end
function M.skin(v,pose)
 local a=assert(pose[v.joint0]); local p=M.rotate(a.q,{a.s[1]*v.p0[1],a.s[2]*v.p0[2],a.s[3]*v.p0[3]})
 if v.joint1==0 then for k=1,3 do p[k]=p[k]+a.t[k] end
 else
  local b=assert(pose[v.joint1]); local pp=M.rotate(b.q,{b.s[1]*v.p1[1],b.s[2]*v.p1[2],b.s[3]*v.p1[3]})
  for k=1,3 do p[k]=p[k]+v.w0*a.t[k]+pp[k]+v.w1*b.t[k] end
 end
 return p
end
function M.bounds(model)
 local pose=M.evaluate(model,nil,0); local lo={math.huge,math.huge,math.huge}; local hi={-math.huge,-math.huge,-math.huge}
 for _,g in ipairs(model.meshes) do for _,pool in ipairs({g.vertices,g.mirrored}) do for _,v in ipairs(pool) do
  local p=M.skin(v,pose); for k=1,3 do lo[k]=math.min(lo[k],p[k]); hi[k]=math.max(hi[k],p[k]) end
 end end end
 local c,r={},0; for k=1,3 do c[k]=(lo[k]+hi[k])/2; r=r+(hi[k]-lo[k])^2 end
 return c,math.max(math.sqrt(r)/2,0.01)
end
return M
