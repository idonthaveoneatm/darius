local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i=f.data,f.themeSystem,f.services local j,k=i.HttpService,f.Fusion local l,m=
k.Observer,d(c.utilities)local n,o,p,q,r,s,t=m.references,m.connections,m.customFunctions,m.randomString,m.get,m.
typecheck,d(c.layouts.main)local function u(v,w,x)x.Parent=w return d(c.components[v])(x)end local v={}function v.Window
(w,x)if p.getgenv then if p.getgenv().dariusInstance then o:deleteConnections()n:clear()p.getgenv().dariusInstance=nil
end else if _G.dariusInstance then o:deleteConnections()n:clear()_G.dariusInstance=nil end end local y,z=s(x,{Title='',
Description='',HideBind=Enum.KeyCode.T,UseConfig=false,IsMobile=false,Theme={},noOffset=false,Parent=Instance.new'Part'}
,{x.noOffset and''or'noOffset',x.IsMobile and''or'IsMobile',x.UseConfig and''or'UseConfig',x.Theme and''or'Theme',x.
Parent and''or'Parent'})assert(y,table.concat(z,'\n'))y,z=s(x,{Config=''},{x.UseConfig and''or'Config'})assert(y,table.
concat(z,'\n'))h.create(x.Theme or{})g.add({string=''},'selectedTab')g.add({boolean=false},'isFirst')g.add({number=x.
noOffset and 0 or 58},'absoluteOffset')g.add({name=q(32)},'instanceName')g.add({binds={}},'currentBinds')g.add({string=
''},'searchText')g.add({boolean=true},'isVisible')local A=g.add({boolean=x.IsMobile},'isMobile')g.add({boolean=false},
'isListening')local B,C,D,E,F=g.add({list={},names={},specialCase={}},'flags'),g.add({boolean=false},'configLoaded'),g.
add({boolean=false},'useConfig'),(g.add{data=x})if x.UseConfig then D:update('boolean',x.UseConfig)F=x.Config local G,H=
{'darius',`/{F}`},''for I=1,#G do H=H..G[I]if not p.isfolder(H)then p.makefolder(H)end end v.Folder=H F=H..
'/config.json'v.File=F if not p.isfile(F)then p.writefile(F,'{}')end end v.flags={}setmetatable(v.flags,{__index=
function(G,H)local I,J=k.New'BindableEvent'{},r(B.list)[H]or nil local K={OnChange=I.Event,Value=J}o.add(l(B.list):
onChange(function()local L,M=r(B.list),r(B.specialCase)[H]if L[H]then local N=L[H]if M then if M.Multiselect~=nil and
not M.Multiselect then N=N[1]elseif M.isToggle~=nil and M.isToggle then N=N.boolean elseif M.isKeybind then N=r(A.
boolean)and N.coordinate or N.keycode end end if N~=J then J=N K.Value=N I:Fire(K.Value)end end end))G[H]=K return K end
})local G=k.New'BindableEvent'{}v.OnDestruction=G.Event t(x,G)local H,I=n.get'tabButtonList',n.get'tabFrameList'v[E.uid]
={}local J=v[E.uid]function J.Tab(K,L)local M=u('tabButton',H,L)local N=u('tabFrame',I,{uid=M.uid})J[M.uid]={}local O=J[
M.uid]function O.Button(P,Q)Q.tab=M return u('button',N,Q)end function O.Toggle(P,Q)Q.tab=M return u('toggle',N,Q)end
function O.Dropdown(P,Q)Q.tab=M return u('dropdown',N,Q)end function O.Label(P,Q)return u('label',N,{tab=M,Text=Q})end
function O.Paragraph(P,Q)Q.tab=M return u('paragraph',N,Q)end function O.TextBox(P,Q)Q.tab=M return u('textbox',N,Q)end
function O.Slider(P,Q)Q.tab=M return u('slider',N,Q)end function O.Keybind(P,Q)Q.tab=M return u('keybind',N,Q)end
function O.Divider(P)return u('divider',N,{tab=M})end return J[M.uid]end v.Destroyed=false function v.Notify(K,L)return
u('notification',n.get'notificationList',L)end function v.Destroy(K)v.Destroyed=true G:Fire()o:deleteConnections()n:
clear()G:Destroy()end function v.LoadConfig(K)if not x.UseConfig then return end B:update('list',j:JSONDecode(p.
readfile(F)))o.add(l(B.list):onChange(function()p.writefile(F,j:JSONEncode(r(B.list)))end))C:update('boolean',true)end
function v.SetTheme(K,L)local M,N=s({['New Theme']=L},{['New Theme']={}})assert(M,table.concat(N,'\n'))h.create(L)end if
p.getgenv then p.getgenv().dariusInstance=v else _G.dariusInstance=v end return v[E.uid]end return v end)()end,function(
)local b,c,d=a(2)local e return(function(...)return setmetatable({},{__index=function(f,g)if c:FindFirstChild(g)then
return d(c[g])else error('no bundle: '..g)end end})end)()end,function()local b,c,d=a(3)local e return(function(...)local
f,g=d(c.PubTypes),d(c.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>export type CanBeState<T>
=PubTypes.CanBeState<T>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value<T>export type Computed<T>
=PubTypes.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys<KI,KO> =PubTypes.ForKeys<
KI,KO>export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.Observer export type Tween<T> =
PubTypes.Tween<T>export type Spring<T> =PubTypes.Spring<T>type Fusion={version:PubTypes.Version,New:(className:string)->
((propertyTable:PubTypes.PropertyTable)->Instance),Hydrate:(target:Instance)->((propertyTable:PubTypes.PropertyTable)->
Instance),Ref:PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey,Children:PubTypes.SpecialKey,Out:PubTypes.SpecialKey,
OnEvent:(eventName:string)->PubTypes.SpecialKey,OnChange:(propertyName:string)->PubTypes.SpecialKey,Value:<T>(
initialValue:T)->Value<T>,Computed:<T>(callback:()->T,destructor:((T)->())?)->Computed<T>,ForPairs:<KI,VI,KO,VO,M>(
inputTable:CanBeState<{[KI]:VI}>,processor:(KI,VI)->(KO,VO,M?),destructor:((KO,VO,M?)->())?)->ForPairs<KO,VO>,ForKeys:<
KI,KO,M>(inputTable:CanBeState<{[KI]:any}>,processor:(KI)->(KO,M?),destructor:((KO,M?)->())?)->ForKeys<KO,any>,ForValues
:<VI,VO,M>(inputTable:CanBeState<{[any]:VI}>,processor:(VI)->(VO,M?),destructor:((VO,M?)->())?)->ForValues<any,VO>,
Observer:(watchedState:StateObject<any>)->Observer,Tween:<T>(goalState:StateObject<T>,tweenInfo:TweenInfo?)->Tween<T>,
Spring:<T>(goalState:StateObject<T>,speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->(),doNothing:(...any)->(
)}return g('Fusion',{version={major=0,minor=2,isRelease=true},New=d(c.Instances.New),Hydrate=d(c.Instances.Hydrate),Ref=
d(c.Instances.Ref),Out=d(c.Instances.Out),Cleanup=d(c.Instances.Cleanup),Children=d(c.Instances.Children),OnEvent=d(c.
Instances.OnEvent),OnChange=d(c.Instances.OnChange),Value=d(c.State.Value),Computed=d(c.State.Computed),ForPairs=d(c.
State.ForPairs),ForKeys=d(c.State.ForKeys),ForValues=d(c.State.ForValues),Observer=d(c.State.Observer),Tween=d(c.
Animation.Tween),Spring=d(c.Animation.Spring),cleanup=d(c.Utility.cleanup),doNothing=d(c.Utility.doNothing)})::Fusion
end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,q,
r=d(f.PubTypes),d(f.Types),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Animation.unpackType),d(f.Animation.
SpringScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Dependencies.updateAll),d(f.
Utility.xtypeof),d(f.State.unwrap),{}local s,t={__index=r},{__mode='k'}function r.get(u,v:boolean?):any if v~=false then
m(u)end return u._currentValue end function r.setPosition(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType
then i('springTypeMismatch',nil,w,u._currentType)end u._springPositions=k(v,w)u._currentValue=v l.add(u)o(u)end function
r.setVelocity(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u.
_currentType)end u._springVelocities=k(v,w)l.add(u)end function r.addVelocity(u,v:PubTypes.Animatable)local w=typeof(v)
if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end local x=k(v,w)for y,z in ipairs(x)do u.
_springVelocities[y]+=z end l.add(u)end function r.update(u):boolean local v=u._goalState:get(false)if v==u._goalValue
then local w=q(u._damping)if typeof(w)~='number'then j('mistypedSpringDamping',nil,typeof(w))elseif w<0 then j(
'invalidSpringDamping',nil,w)else u._currentDamping=w end local x=q(u._speed)if typeof(x)~='number'then j(
'mistypedSpringSpeed',nil,typeof(x))elseif x<0 then j('invalidSpringSpeed',nil,x)else u._currentSpeed=x end return false
else u._goalValue=v local w,x=u._currentType,typeof(v)u._currentType=x local y=k(v,x)local z=#y u._springGoals=y if x~=w
then u._currentValue=u._goalValue local A,B=table.create(z,0),table.create(z,0)for C,D in ipairs(y)do A[C]=D end u.
_springPositions=A u._springVelocities=B l.remove(u)return true elseif z==0 then u._currentValue=u._goalValue return
true else l.add(u)return false end end end local function u<T>(v:PubTypes.Value<T>,w:PubTypes.CanBeState<number>?,x:
PubTypes.CanBeState<number>?):Types.Spring<T>if w==nil then w=10 end if x==nil then x=1 end local y={[v]=true}if p(w)==
'State'then y[w]=true end if p(x)=='State'then y[x]=true end local z=setmetatable({type='State',kind='Spring',
dependencySet=y,dependentSet=setmetatable({},t),_speed=w,_damping=x,_goalState=v,_goalValue=nil,_currentType=nil,
_currentValue=nil,_currentSpeed=q(w),_currentDamping=q(x),_springPositions=nil,_springGoals=nil,_springVelocities=nil},s
)n(z)v.dependentSet[z]=true z:update()return z end return u end)()end,[6]=function()local b,c,d=a(6)local e return(
function(...)local f,g=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',c.Parent.Parent
local h,i,j,k=d(g.Types),d(g.Animation.packType),d(g.Animation.springCoefficients),d(g.Dependencies.updateAll)type Set<T
> ={[T]:any}type Spring=Types.Spring<any>local l,m,n:Set<Spring>,o={},0.0001,{},os.clock()function l.add(p:Spring)p.
_lastSchedule=o p._startDisplacements={}p._startVelocities={}for q,r in ipairs(p._springGoals)do p._startDisplacements[q
]=p._springPositions[q]-r p._startVelocities[q]=p._springVelocities[q]end n[p]=true end function l.remove(p:Spring)n[p]=
nil end local function p()local q:Set<Spring> ={}o=os.clock()for r in pairs(n)do local s,t,u,v=j(o-r._lastSchedule,r.
_currentDamping,r._currentSpeed)local w,x,y,z,A=r._springPositions,r._springVelocities,r._startDisplacements,r.
_startVelocities,false for B,C in ipairs(r._springGoals)do local D,E=y[B],z[B]local F,G=D*s+E*t,D*u+E*v if math.abs(F)>m
or math.abs(G)>m then A=true end w[B]=F+C x[B]=G end if not A then q[r]=true end end for s in pairs(n)do s._currentValue
=i(s._springPositions,s._currentType)k(s)end for t in pairs(q)do n[t]=nil end end f:BindToRenderStep(
'__FusionSpringScheduler',Enum.RenderPriority.First.Value,p)return l end)()end,[7]=function()local b,c,d=a(7)local e
return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o=d(f.PubTypes),d(f.Types),d(f.Animation.
TweenScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Logging.logError),d(f.Logging.
logErrorNonFatal),d(f.Utility.xtypeof),{}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false
then j(t)end return t._currentValue end function o.update(t):boolean local u=t._goalState:get(false)if u==t._nextValue
and not t._currentlyAnimating then return false end local v=t._tweenInfo if t._tweenInfoIsState then v=v:get()end if
typeof(v)~='TweenInfo'then m('mistypedTweenInfo',nil,typeof(v))return false end t._prevValue=t._currentValue t.
_nextValue=u t._currentTweenStartTime=os.clock()t._currentTweenInfo=v local w=v.DelayTime+v.Time if v.Reverses then w+=v
.Time end w*=v.RepeatCount+1 t._currentTweenDuration=w i.add(t)return false end local function t<T>(u:PubTypes.
StateObject<PubTypes.Animatable>,v:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local w=u:get(false)if v==nil then v=
TweenInfo.new()end local x,y={[u]=true},n(v)=='State'if y then x[v]=true end local z=v if y then z=z:get()end if typeof(
z)~='TweenInfo'then l('mistypedTweenInfo',nil,typeof(z))end local A=setmetatable({type='State',kind='Tween',
dependencySet=x,dependentSet=setmetatable({},q),_goalState=u,_tweenInfo=v,_tweenInfoIsState=y,_prevValue=w,_nextValue=w,
_currentValue=w,_currentTweenInfo=v,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},p)k(A)u.
dependentSet[A]=true return A end return t end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f,g
=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',c.Parent.Parent local h,i,j,k,l=d(g.
Types),d(g.Animation.lerpType),d(g.Animation.getTweenRatio),d(g.Dependencies.updateAll),{}type Set<T> ={[T]:any}type
Tween=Types.Tween<any>local m,n:Set<Tween> ={__mode='k'},{}setmetatable(n,m)function l.add(o:Tween)n[o]=true end
function l.remove(o:Tween)n[o]=nil end local function o()local p=os.clock()for q:Tween in pairs(n::any)do local t=p-q.
_currentTweenStartTime if t>q._currentTweenDuration then if q._currentTweenInfo.Reverses then q._currentValue=q.
_prevValue else q._currentValue=q._nextValue end q._currentlyAnimating=false k(q)l.remove(q)else local u=j(q.
_currentTweenInfo,t)local v=i(q._prevValue,q._nextValue,u)q._currentValue=v q._currentlyAnimating=true k(q)end end end f
:BindToRenderStep('__FusionTweenScheduler',Enum.RenderPriority.First.Value,o)return l end)()end,[9]=function()local b,c,
d=a(9)local e return(function(...)local f=cloneref and cloneref(game:GetService'TweenService')or game:GetService
'TweenService'local function g(h:TweenInfo,i:number):number local j,k,l,m,n,o=h.DelayTime,h.Time,h.Reverses,1+h.
RepeatCount,h.EasingStyle,h.EasingDirection local p=j+k if l then p+=k end if i>=p*m then return 1 end local q=i%p if q
<=j then return 0 end local t=(q-j)/k if t>1 then t=2-t end local u=f:GetValue(t,n,o)return u end return g end)()end,[10
]=function()local b,c,d=a(10)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.
Oklab)local function i(j:any,k:any,l:number):any local m=typeof(j)if typeof(k)==m then if m=='number'then local n,o=k::
number,j::number return(n-o)*l+o elseif m=='CFrame'then local n,o=k::CFrame,j::CFrame return o:Lerp(n,l)elseif m==
'Color3'then local n,o=k::Color3,j::Color3 local p,q=h.to(o),h.to(n)return h.from(p:Lerp(q,l),false)elseif m==
'ColorSequenceKeypoint'then local n,o=k::ColorSequenceKeypoint,j::ColorSequenceKeypoint local p,q=h.to(o.Value),h.to(n.
Value)return ColorSequenceKeypoint.new((n.Time-o.Time)*l+o.Time,h.from(p:Lerp(q,l),false))elseif m=='DateTime'then local
n,o=k::DateTime,j::DateTime return DateTime.fromUnixTimestampMillis((n.UnixTimestampMillis-o.UnixTimestampMillis)*l+o.
UnixTimestampMillis)elseif m=='NumberRange'then local n,o=k::NumberRange,j::NumberRange return NumberRange.new((n.Min-o.
Min)*l+o.Min,(n.Max-o.Max)*l+o.Max)elseif m=='NumberSequenceKeypoint'then local n,o=k::NumberSequenceKeypoint,j::
NumberSequenceKeypoint return NumberSequenceKeypoint.new((n.Time-o.Time)*l+o.Time,(n.Value-o.Value)*l+o.Value,(n.
Envelope-o.Envelope)*l+o.Envelope)elseif m=='PhysicalProperties'then local n,o=k::PhysicalProperties,j::
PhysicalProperties return PhysicalProperties.new((n.Density-o.Density)*l+o.Density,(n.Friction-o.Friction)*l+o.Friction,
(n.Elasticity-o.Elasticity)*l+o.Elasticity,(n.FrictionWeight-o.FrictionWeight)*l+o.FrictionWeight,(n.ElasticityWeight-o.
ElasticityWeight)*l+o.ElasticityWeight)elseif m=='Ray'then local n,o=k::Ray,j::Ray return Ray.new(o.Origin:Lerp(n.Origin
,l),o.Direction:Lerp(n.Direction,l))elseif m=='Rect'then local n,o=k::Rect,j::Rect return Rect.new(o.Min:Lerp(n.Min,l),o
.Max:Lerp(n.Max,l))elseif m=='Region3'then local n,o=k::Region3,j::Region3 local p,q=o.CFrame.Position:Lerp(n.CFrame.
Position,l),o.Size:Lerp(n.Size,l)/2 return Region3.new(p-q,p+q)elseif m=='Region3int16'then local n,o=k::Region3int16,j
::Region3int16 return Region3int16.new(Vector3int16.new((n.Min.X-o.Min.X)*l+o.Min.X,(n.Min.Y-o.Min.Y)*l+o.Min.Y,(n.Min.Z
-o.Min.Z)*l+o.Min.Z),Vector3int16.new((n.Max.X-o.Max.X)*l+o.Max.X,(n.Max.Y-o.Max.Y)*l+o.Max.Y,(n.Max.Z-o.Max.Z)*l+o.Max.
Z))elseif m=='UDim'then local n,o=k::UDim,j::UDim return UDim.new((n.Scale-o.Scale)*l+o.Scale,(n.Offset-o.Offset)*l+o.
Offset)elseif m=='UDim2'then local n,o=k::UDim2,j::UDim2 return o:Lerp(n,l)elseif m=='Vector2'then local n,o=k::Vector2,
j::Vector2 return o:Lerp(n,l)elseif m=='Vector2int16'then local n,o=k::Vector2int16,j::Vector2int16 return Vector2int16.
new((n.X-o.X)*l+o.X,(n.Y-o.Y)*l+o.Y)elseif m=='Vector3'then local n,o=k::Vector3,j::Vector3 return o:Lerp(n,l)elseif m==
'Vector3int16'then local n,o=k::Vector3int16,j::Vector3int16 return Vector3int16.new((n.X-o.X)*l+o.X,(n.Y-o.Y)*l+o.Y,(n.
Z-o.Z)*l+o.Z)end end if l<0.5 then return j else return k end end return i end)()end,[11]=function()local b,c,d=a(11)
local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.Oklab)local function i(j:{number}
,k:string):PubTypes.Animatable?if k=='number'then return j[1]elseif k=='CFrame'then return CFrame.new(j[1],j[2],j[3])*
CFrame.fromAxisAngle(Vector3.new(j[4],j[5],j[6]).Unit,j[7])elseif k=='Color3'then return h.from(Vector3.new(j[1],j[2],j[
3]),false)elseif k=='ColorSequenceKeypoint'then return ColorSequenceKeypoint.new(j[4],h.from(Vector3.new(j[1],j[2],j[3])
,false))elseif k=='DateTime'then return DateTime.fromUnixTimestampMillis(j[1])elseif k=='NumberRange'then return
NumberRange.new(j[1],j[2])elseif k=='NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(j[2],j[1],j[3])elseif
k=='PhysicalProperties'then return PhysicalProperties.new(j[1],j[2],j[3],j[4],j[5])elseif k=='Ray'then return Ray.new(
Vector3.new(j[1],j[2],j[3]),Vector3.new(j[4],j[5],j[6]))elseif k=='Rect'then return Rect.new(j[1],j[2],j[3],j[4])elseif
k=='Region3'then local l,m=Vector3.new(j[1],j[2],j[3]),Vector3.new(j[4]/2,j[5]/2,j[6]/2)return Region3.new(l-m,l+m)
elseif k=='Region3int16'then return Region3int16.new(Vector3int16.new(j[1],j[2],j[3]),Vector3int16.new(j[4],j[5],j[6]))
elseif k=='UDim'then return UDim.new(j[1],j[2])elseif k=='UDim2'then return UDim2.new(j[1],j[2],j[3],j[4])elseif k==
'Vector2'then return Vector2.new(j[1],j[2])elseif k=='Vector2int16'then return Vector2int16.new(j[1],j[2])elseif k==
'Vector3'then return Vector3.new(j[1],j[2],j[3])elseif k=='Vector3int16'then return Vector3int16.new(j[1],j[2],j[3])else
return nil end end return i end)()end,[12]=function()local b,c,d=a(12)local e return(function(...)local function f(g:
number,h:number,i:number):(number,number,number,number)if g==0 or i==0 then return 1,0,0,1 end local j,k,l,m if h>1 then
local n,o=g*i,math.sqrt(h^2-1)local p,q=-0.5/o,-o-h local t,u=1/q,math.exp(n*q)local v=math.exp(n*t)j=(v*q-u*t)*p k=(u-v
)*p/i l=(v-u)*p*i m=(u*q-v*t)*p elseif h==1 then local n=g*i local o=math.exp(-n)j=o*(1+n)k=o*g l=o*(-n*i)m=o*(1-n)else
local n,o=g*i,math.sqrt(1-h^2)local p,q,t=1/o,o*n,math.exp(-n*h)local u,v=t*math.sin(q),t*math.cos(q)local w=u*p local x
=w*h j=x+v k=w l=-(x*h+u*o)m=v-x end return j,k,l,m end return f end)()end,[13]=function()local b,c,d=a(13)local e
return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.Oklab)local function i(j:any,k:string):{
number}if k=='number'then local l=j::number return{l}elseif k=='CFrame'then local l,m=j:ToAxisAngle()return{j.X,j.Y,j.Z,
l.X,l.Y,l.Z,m}elseif k=='Color3'then local l=h.to(j)return{l.X,l.Y,l.Z}elseif k=='ColorSequenceKeypoint'then local l=h.
to(j.Value)return{l.X,l.Y,l.Z,j.Time}elseif k=='DateTime'then return{j.UnixTimestampMillis}elseif k=='NumberRange'then
return{j.Min,j.Max}elseif k=='NumberSequenceKeypoint'then return{j.Value,j.Time,j.Envelope}elseif k==
'PhysicalProperties'then return{j.Density,j.Friction,j.Elasticity,j.FrictionWeight,j.ElasticityWeight}elseif k=='Ray'
then return{j.Origin.X,j.Origin.Y,j.Origin.Z,j.Direction.X,j.Direction.Y,j.Direction.Z}elseif k=='Rect'then return{j.Min
.X,j.Min.Y,j.Max.X,j.Max.Y}elseif k=='Region3'then return{j.CFrame.X,j.CFrame.Y,j.CFrame.Z,j.Size.X,j.Size.Y,j.Size.Z}
elseif k=='Region3int16'then return{j.Min.X,j.Min.Y,j.Min.Z,j.Max.X,j.Max.Y,j.Max.Z}elseif k=='UDim'then return{j.Scale,
j.Offset}elseif k=='UDim2'then return{j.X.Scale,j.X.Offset,j.Y.Scale,j.Y.Offset}elseif k=='Vector2'then return{j.X,j.Y}
elseif k=='Vector2int16'then return{j.X,j.Y}elseif k=='Vector3'then return{j.X,j.Y,j.Z}elseif k=='Vector3int16'then
return{j.X,j.Y,j.Z}else return{}end end return i end)()end,[15]=function()local b,c,d=a(15)local e return(function(...)
local f={}function f.to(g:Color3):Vector3 local h,i,j=g.R*0.4122214708+g.G*0.5363325363+g.B*0.0514459929,g.R*
0.2119034982+g.G*0.6806995451+g.B*0.1073969566,g.R*0.0883024619+g.G*0.2817188376+g.B*0.6299787005 local k,l,m=h^(
0.3333333333333333),i^(0.3333333333333333),j^(0.3333333333333333)return Vector3.new(k*0.2104542553+l*0.793617785-m*
0.0040720468,k*1.9779984951-l*2.428592205+m*0.4505937099,k*0.0259040371+l*0.7827717662-m*0.808675766)end function f.from
(g:Vector3,h:boolean?):Color3 local i,j,k=g.X+g.Y*0.3963377774+g.Z*0.2158037573,g.X-g.Y*0.1055613458-g.Z*0.0638541728,g.
X-g.Y*0.0894841775-g.Z*1.291485548 local l,m,n=i^3,j^3,k^3 local o,p,q=l*4.0767416621-m*3.3077115913+n*0.2309699292,l*-
1.2684380046+m*2.6097574011-n*0.3413193965,l*-4.196086299999999E-3-m*0.7034186147+n*1.707614701 if not h then o=math.
clamp(o,0,1)p=math.clamp(p,0,1)q=math.clamp(q,0,1)end return Color3.new(o,p,q)end return f end)()end,[17]=function()
local b,c,d=a(17)local e return(function(...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),d(f.Logging.parseError),
d(f.Dependencies.sharedState)type Set<T> ={[T]:any}local j,k=i.initialisedStack,0 local function l(m:Set<PubTypes.
Dependency>,n:(...any)->any,...):(boolean,any)local o=i.dependencySet i.dependencySet=m i.initialisedStackSize+=1 local
p,q=(i.initialisedStackSize)if p>k then q={}j[p]=q k=p else q=j[p]table.clear(q)end local t=table.pack(xpcall(n,h,...))i
.dependencySet=o i.initialisedStackSize-=1 return table.unpack(t,1,t.n)end return l end)()end,[18]=function()local b,c,d
=a(18)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Dependencies.sharedState)local i=h
.initialisedStack local function j(k:PubTypes.Dependency)local l=h.initialisedStackSize for m,n in ipairs(i)do if m>l
then return end n[k]=true end end return j end)()end,[19]=function()local b,c,d=a(19)local e return(function(...)local f
=c.Parent.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}local h:{Set<PubTypes.Dependency>},i,j:Set<PubTypes.
Dependency>?={},0 return{dependencySet=j,initialisedStack=h,initialisedStackSize=i}end)()end,[20]=function()local b,c,d=
a(20)local e return(function(...)local f=c.Parent.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}type Descendant=(
PubTypes.Dependent&PubTypes.Dependency)|PubTypes.Dependent local function h(i:PubTypes.Dependency)local j:{[Descendant]:
number},k:{[Descendant]:boolean},l:{Descendant},m,n={},{},{},0,1 for o in i.dependentSet do m+=1 l[m]=o k[o]=true end
while n<=m do local p=l[n]local q=j[p]j[p]=if q==nil then 1 else q+1 if(p::any).dependentSet~=nil then for t in(p::any).
dependentSet do m+=1 l[m]=t end end n+=1 end n=1 while n<=m do local p=l[n]local q=j[p]-1 j[p]=q if q==0 and k[p]and p:
update()and(p::any).dependentSet~=nil then for t in(p::any).dependentSet do k[t]=true end end n+=1 end end return h end
)()end,[21]=function()local b,c,d=a(21)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.
Dependencies.sharedState)local i=h.initialisedStack local function j(k:PubTypes.Dependency)local l=h.dependencySet if l
~=nil then local m=h.initialisedStackSize if m>0 then local n=i[m]if n[k]~=nil then return end end l[k]=true end end
return j end)()end,[23]=function()local b,c,d=a(23)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f
.PubTypes),d(f.Logging.logWarn),d(f.State.Observer),d(f.Utility.xtypeof)type Set<T> ={[T]:boolean}local k,l=false,{}l.
type='SpecialKey'l.kind='Children'l.stage='descendants'function l.apply(m,n:any,o:Instance,p:{PubTypes.Task})local q:Set
<Instance>,t:Set<Instance>,u:{[PubTypes.StateObject<any>]:()->()},v:{[PubTypes.StateObject<any>]:()->()},w,x:()->()={},{
},{},{},false local function y()if not w then return end w=false t,q=q,t v,u=u,v table.clear(q)table.clear(u)
local function z(A:any,B:string?)local C=j(A)if C=='Instance'then q[A]=true if t[A]==nil then A.Parent=o else t[A]=nil
end if k and B~=nil then A.Name=B end elseif C=='State'then local D=A:get(false)if D~=nil then z(D,B)end local E=v[A]if
E==nil then E=i(A):onChange(x)else v[A]=nil end u[A]=E elseif C=='table'then for D,E in pairs(A)do local F,G:string?=(
typeof(D))if F=='string'then G=D elseif F=='number'and B~=nil then G=B..'_'..D end z(E,G)end else h(
'unrecognisedChildType',C)end end if n~=nil then z(n)end for A in pairs(t)do A.Parent=nil end for B,C in pairs(v)do C()
end end x=function()if not w then w=true task.defer(y)end end table.insert(p,function()n=nil w=true y()end)w=true y()end
return l::PubTypes.SpecialKey end)()end,[24]=function()local b,c,d=a(24)local e return(function(...)local f=c.Parent.
Parent local g,h=d(f.PubTypes),{}h.type='SpecialKey'h.kind='Cleanup'h.stage='observer'function h.apply(i,j:any,k:
Instance,l:{PubTypes.Task})table.insert(l,j)end return h end)()end,[25]=function()local b,c,d=a(25)local e return(
function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Instances.applyInstanceProps)local function i(j:
Instance)return function(k:PubTypes.PropertyTable):Instance h(k,j)return j end end return i end)()end,[26]=function()
local b,c,d=a(26)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f.PubTypes),d(f.Instances.
defaultProps),d(f.Instances.applyInstanceProps),d(f.Logging.logError)local function k(l:string)return function(m:
PubTypes.PropertyTable):Instance local n,o=pcall(Instance.new,l)if not n then j('cannotCreateClass',nil,l)end local p=h[
l]if p~=nil then for q,t in pairs(p)do o[q]=t end end i(m,o)return o end end return k end)()end,[27]=function()local b,c
,d=a(27)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Logging.logError)local function
i(j:string):PubTypes.SpecialKey local k={}k.type='SpecialKey'k.kind='OnChange'k.stage='observer'function k.apply(l,m:any
,n:Instance,o:{PubTypes.Task})local p,q=pcall(n.GetPropertyChangedSignal,n,j)if not p then h('cannotConnectChange',nil,n
.ClassName,j)elseif typeof(m)~='function'then h('invalidChangeHandler',nil,j)else table.insert(o,q:Connect(function()m((
n::any)[j])end))end end return k end return i end)()end,[28]=function()local b,c,d=a(28)local e return(function(...)
local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Logging.logError)local function i(j:Instance,k:string)return(j::any)
[k]end local function j(k:string):PubTypes.SpecialKey local l={}l.type='SpecialKey'l.kind='OnEvent'l.stage='observer'
function l.apply(m,n:any,o:Instance,p:{PubTypes.Task})local q,t=pcall(i,o,k)if not q or typeof(t)~='RBXScriptSignal'then
h('cannotConnectEvent',nil,o.ClassName,k)elseif typeof(n)~='function'then h('invalidEventHandler',nil,k)else table.
insert(p,t:Connect(n))end end return l end return j end)()end,[29]=function()local b,c,d=a(29)local e return(function(
...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),d(f.Logging.logError),d(f.Utility.xtypeof)local function j(k:
string):PubTypes.SpecialKey local l={}l.type='SpecialKey'l.kind='Out'l.stage='observer'function l.apply(m,n:any,o:
Instance,p:{PubTypes.Task})local q,t=pcall(o.GetPropertyChangedSignal,o,k)if not q then h('invalidOutProperty',nil,o.
ClassName,k)elseif i(n)~='State'or n.kind~='Value'then h'invalidOutType'else n:set((o::any)[k])table.insert(p,t:Connect(
function()n:set((o::any)[k])end))table.insert(p,function()n:set(nil)end)end end return l end return j end)()end,[30]=
function()local b,c,d=a(30)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f.PubTypes),d(f.Logging.
logError),d(f.Utility.xtypeof),{}j.type='SpecialKey'j.kind='Ref'j.stage='observer'function j.apply(k,l:any,m:Instance,n:
{PubTypes.Task})if i(l)~='State'or l.kind~='Value'then h'invalidRefType'else l:set(m)table.insert(n,function()l:set(nil)
end)end end return j end)()end,[31]=function()local b,c,d=a(31)local e return(function(...)local f=c.Parent.Parent local
g,h,i,j,k=d(f.PubTypes),d(f.Utility.cleanup),d(f.Utility.xtypeof),d(f.Logging.logError),d(f.State.Observer)
local function l(m:Instance,n:string,o:any)(m::any)[n]=o end local function m(n:Instance,o:string)(n::any)[o]=(n::any)[o
]end local function n(o:Instance,p:string,q:any)if not pcall(l,o,p,q)then if not pcall(m,o,p)then if o==nil then j(
'setPropertyNilRef',nil,p,tostring(q))else j('cannotAssignProperty',nil,o.ClassName,p)end else local t,u=typeof(q),
typeof((o::any)[p])j('invalidPropertyType',nil,o.ClassName,p,u,t)end end end local function o(p:Instance,q:string,t:
PubTypes.CanBeState<any>,u:{PubTypes.Task})if i(t)=='State'then local v=false local function w()if not v then v=true
task.defer(function()v=false n(p,q,t:get(false))end)end end n(p,q,t:get(false))table.insert(u,k(t::any):onChange(w))else
n(p,q,t)end end local function p(q:PubTypes.PropertyTable,t:Instance)local u,v={self={}::{[PubTypes.SpecialKey]:any},
descendants={}::{[PubTypes.SpecialKey]:any},ancestor={}::{[PubTypes.SpecialKey]:any},observer={}::{[PubTypes.SpecialKey]
:any}},{}for w,x in pairs(q)do local y=i(w)if y=='string'then if w~='Parent'then o(t,w::string,x,v)end elseif y==
'SpecialKey'then local z=(w::PubTypes.SpecialKey).stage local A=u[z]if A==nil then j('unrecognisedPropertyStage',nil,z)
else A[w]=x end else j('unrecognisedPropertyKey',nil,i(w))end end for y,z in pairs(u.self)do y:apply(z,t,v)end for A,B
in pairs(u.descendants)do A:apply(B,t,v)end if q.Parent~=nil then o(t,'Parent',q.Parent,v)end for C,D in pairs(u.
ancestor)do C:apply(D,t,v)end for E,F in pairs(u.observer)do E:apply(F,t,v)end t.Destroying:Connect(function()h(v)end)
end return p end)()end,[32]=function()local b,c,d=a(32)local e return(function(...)return{ScreenGui={ResetOnSpawn=false,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},BillboardGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling}
,SurfaceGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,SizingMode=Enum.SurfaceGuiSizingMode.
PixelsPerStud,PixelsPerStud=50},Frame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel
=0},ScrollingFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,
ScrollBarImageColor3=Color3.new(0,0,0)},TextLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextButton={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font
.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextBox={BackgroundColor3=Color3.new(1,1,1),BorderColor3=
Color3.new(0,0,0),BorderSizePixel=0,ClearTextOnFocus=false,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0
),TextSize=14},ImageLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},
ImageButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,AutoButtonColor=false},
ViewportFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},VideoFrame={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},CanvasGroup={BackgroundColor3=
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[34]=function()local b,c,d=a(34)local e
return(function(...)local f=c.Parent.Parent local g,h=d(f.Types),d(f.Logging.messages)local function i(j:string,k:Types.
Error?,...)local l:string if h[j]~=nil then l=h[j]else j='unknownMessage'l=h[j]end local m if k==nil then m=string.
format('[Fusion] '..l..'\n(ID: '..j..')',...)else l=l:gsub('ERROR_MESSAGE',k.message)m=string.format('[Fusion] '..l..
'\n(ID: '..j..')\n---- Stack trace ----\n'..k.trace,...)end error(m:gsub('\n','\n    '),0)end return i end)()end,[35]=
function()local b,c,d=a(35)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.Types),d(f.Logging.messages
)local function i(j:string,k:Types.Error?,...)local l:string if h[j]~=nil then l=h[j]else j='unknownMessage'l=h[j]end
local m if k==nil then m=string.format('[Fusion] '..l..'\n(ID: '..j..')',...)else l=l:gsub('ERROR_MESSAGE',k.message)m=
string.format('[Fusion] '..l..'\n(ID: '..j..')\n---- Stack trace ----\n'..k.trace,...)end task.spawn(function(...)error(
m:gsub('\n','\n    '),0)end,...)end return i end)()end,[36]=function()local b,c,d=a(36)local e return(function(...)local
f=c.Parent.Parent local g=d(f.Logging.messages)local function h(i,...)local j:string if g[i]~=nil then j=g[i]else i=
'unknownMessage'j=g[i]end warn(string.format('[Fusion] '..j..'\n(ID: '..i..')',...))end return h end)()end,[37]=function
()local b,c,d=a(37)local e return(function(...)return{cannotAssignProperty=
"The class type '%s' has no assignable property '%s'.",cannotConnectChange=
"The %s class doesn't have a property called '%s'.",cannotConnectEvent="The %s class doesn't have an event called '%s'."
,cannotCreateClass="Can't create a new instance of class '%s'.",computedCallbackError=
'Computed callback error: ERROR_MESSAGE',destructorNeededValue=
[[To save instances into Values, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededComputed=
[[To return instances from Computeds, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,multiReturnComputed=
[[Returning multiple values from Computeds is discouraged, as behaviour will change soon - see discussion #189 on GitHub.]]
,destructorNeededForKeys=
[[To return instances from ForKeys, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededForValues=
[[To return instances from ForValues, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededForPairs=
[[To return instances from ForPairs, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,duplicatePropertyKey='',forKeysProcessorError='ForKeys callback error: ERROR_MESSAGE',forKeysKeyCollision=
[[ForKeys should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previously input key: '%s'; New input key: '%s']]
,forKeysDestructorError='ForKeys destructor error: ERROR_MESSAGE',forPairsDestructorError=
'ForPairs destructor error: ERROR_MESSAGE',forPairsKeyCollision=
[[ForPairs should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previous input pair: '[%s] = %s'; New input pair: '[%s] = %s']]
,forPairsProcessorError='ForPairs callback error: ERROR_MESSAGE',forValuesProcessorError=
'ForValues callback error: ERROR_MESSAGE',forValuesDestructorError='ForValues destructor error: ERROR_MESSAGE',
invalidChangeHandler=[[The change handler for the '%s' property must be a function.]],invalidEventHandler=
"The handler for the '%s' event must be a function.",invalidPropertyType=
"'%s.%s' expected a '%s' type, but got a '%s' type.",invalidRefType='Instance refs must be Value objects.',
invalidOutType='[Out] properties must be given Value objects.',invalidOutProperty=
"The %s class doesn't have a property called '%s'.",invalidSpringDamping=
[[The damping ratio for a spring must be >= 0. (damping was %.2f)]],invalidSpringSpeed=
'The speed of a spring must be >= 0. (speed was %.2f)',mistypedSpringDamping=
'The damping ratio for a spring must be a number. (got a %s)',mistypedSpringSpeed=
'The speed of a spring must be a number. (got a %s)',mistypedTweenInfo=
'The tween info of a tween must be a TweenInfo. (got a %s)',springTypeMismatch=
"The type '%s' doesn't match the spring's type '%s'.",strictReadError="'%s' is not a valid member of '%s'.",
unknownMessage='Unknown error: ERROR_MESSAGE',unrecognisedChildType=
"'%s' type children aren't accepted by `[Children]`.",unrecognisedPropertyKey=
"'%s' keys aren't accepted in property tables.",unrecognisedPropertyStage=
[['%s' isn't a valid stage for a special key to be applied at.]]}end)()end,[38]=function()local b,c,d=a(38)local e
return(function(...)local f=c.Parent.Parent local g=d(f.Types)local function h(i:string):Types.Error return{type='Error'
,raw=i,message=i:gsub('^.+:%d+:%s*',''),trace=debug.traceback(nil,2)}end return h end)()end,[39]=function()local b,c,d=
a(39)local e return(function(...)type Set<T> ={[T]:any}export type Symbol={type:string,name:string}export type
Animatable=number|CFrame|Color3|ColorSequenceKeypoint|DateTime|NumberRange|NumberSequenceKeypoint|PhysicalProperties|Ray
|Rect|Region3|Region3int16|UDim|UDim2|Vector2|Vector2int16|Vector3|Vector3int16 export type Task=Instance|
RBXScriptConnection|(()->())|{destroy:(any)->()}|{Destroy:(any)->()}|{Task}export type Version={major:number,minor:
number,isRelease:boolean}export type Dependency={dependentSet:Set<Dependent>}export type Dependent={update:(Dependent)->
boolean,dependencySet:Set<Dependency>}export type StateObject<T> =Dependency&{type:string,kind:string,get:(StateObject<T
>,asDependency:boolean?)->T}export type CanBeState<T> =StateObject<T>|T export type Value<T> =StateObject<T>&{set:(Value
<T>,newValue:any,force:boolean?)->()}export type Computed<T> =StateObject<T>&Dependent&{}export type ForPairs<KO,VO> =
StateObject<{[KO]:VO}>&Dependent&{}export type ForKeys<KO,V> =StateObject<{[KO]:V}>&Dependent&{}export type ForValues<K,
VO> =StateObject<{[K]:VO}>&Dependent&{}export type Tween<T> =StateObject<T>&Dependent&{}export type Spring<T> =
StateObject<T>&Dependent&{}export type Observer=Dependent&{onChange:(Observer,callback:()->())->(()->())}export type
SpecialKey={type:string,kind:string,stage:string,apply:(SpecialKey,value:any,applyTo:Instance,cleanupTasks:{Task})->()}
export type Children=Instance|StateObject<Children>|{[any]:Children}export type PropertyTable={[string|SpecialKey]:any}
return nil end)()end,[41]=function()local b,c,d=a(41)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k
,l,m,n,o=d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.initDependency),d(f.Dependencies.
useDependency),d(f.Logging.logErrorNonFatal),d(f.Logging.logWarn),d(f.Utility.isSimilar),d(f.Utility.needsDestruction),{
}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false then j(t)end return t._value end
function o.update(t):boolean for u in pairs(t.dependencySet)do u.dependentSet[t]=nil end t._oldDependencySet,t.
dependencySet=t.dependencySet,t._oldDependencySet table.clear(t.dependencySet)local v,E,F=h(t.dependencySet,t._processor
)if v then if t._destructor==nil and n(E)then l'destructorNeededComputed'end if F~=nil then l'multiReturnComputed'end
local G=t._value local H=m(G,E)if t._destructor~=nil then t._destructor(G)end t._value=E for I in pairs(t.dependencySet)
do I.dependentSet[t]=true end return not H else k('computedCallbackError',E)t._oldDependencySet,t.dependencySet=t.
dependencySet,t._oldDependencySet for G in pairs(t.dependencySet)do G.dependentSet[t]=true end return false end end
local function t<T>(u:()->T,v:((T)->())?):Types.Computed<T>local E=setmetatable({type='State',kind='Computed',
dependencySet={},dependentSet=setmetatable({},q),_oldDependencySet={},_processor=u,_destructor=v,_value=nil},p)i(E)E:
update()return E end return t end)()end,[42]=function()local b,c,d=a(42)local e return(function(...)local f=c.Parent.
Parent local g,h,i,j,k,l,m,n,o,p,q,t=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.
initDependency),d(f.Dependencies.useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.Logging.
logError),d(f.Logging.logWarn),d(f.Utility.cleanup),d(f.Utility.needsDestruction),{}local u,v={__index=t},{__mode='k'}
function t.get(E,F:boolean?):any if F~=false then k(E)end return E._outputTable end function t.update(E):boolean local F
=E._inputIsState local G,H,I,J,K,L,M=if F then E._inputTable:get(false)else E._inputTable,E._oldInputTable,E.
_outputTable,E._keyOIMap,E._keyIOMap,E._meta,false for N in pairs(E.dependencySet)do N.dependentSet[E]=nil end E.
_oldDependencySet,E.dependencySet=E.dependencySet,E._oldDependencySet table.clear(E.dependencySet)if F then E.
_inputTable.dependentSet[E]=true E.dependencySet[E._inputTable]=true end for O,P in pairs(G)do local Q=E._keyData[O]if Q
==nil then Q={dependencySet=setmetatable({},v),oldDependencySet=setmetatable({},v),dependencyValues=setmetatable({},v)}E
._keyData[O]=Q end local R=H[O]==nil if R==false then for S,T in pairs(Q.dependencyValues)do if T~=S:get(false)then R=
true break end end end if R then Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet table.clear(Q.
dependencySet)local S,T,U=i(Q.dependencySet,E._processor,O)if S then if E._destructor==nil and(q(T)or q(U))then o
'destructorNeededForKeys'end local V,W=J[T],K[O]if V~=O and G[V]~=nil then n('forKeysKeyCollision',nil,tostring(T),
tostring(V),tostring(T))end if W~=T and J[W]==O then local X=L[W]local Y,Z=xpcall(E._destructor or p,l,W,X)if not Y then
m('forKeysDestructorError',Z)end J[W]=nil I[W]=nil L[W]=nil end H[O]=P L[T]=U J[T]=O K[O]=T I[T]=P M=true else Q.
oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet m('forKeysProcessorError',T)end end for S in pairs(Q
.dependencySet)do Q.dependencyValues[S]=S:get(false)E.dependencySet[S]=true S.dependentSet[E]=true end end for Q,R in
pairs(J)do if G[R]==nil then local S=L[Q]local T,U=xpcall(E._destructor or p,l,Q,S)if not T then m(
'forKeysDestructorError',U)end H[R]=nil L[Q]=nil J[Q]=nil K[R]=nil I[Q]=nil E._keyData[R]=nil M=true end end return M
end local function E<KI,KO,M>(F:PubTypes.CanBeState<{[KI]:any}>,G:(KI)->(KO,M?),H:((KO,M?)->())?):Types.ForKeys<KI,KO,M>
local I=F.type=='State'and typeof(F.get)=='function'local J=setmetatable({type='State',kind='ForKeys',dependencySet={},
dependentSet=setmetatable({},v),_oldDependencySet={},_processor=G,_destructor=H,_inputIsState=I,_inputTable=F,
_oldInputTable={},_outputTable={},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},u)j(J)J:update()return J end return E
end)()end,[43]=function()local b,c,d=a(43)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,
q,t=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.initDependency),d(f.Dependencies.
useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.Logging.logError),d(f.Logging.logWarn),d(f.
Utility.cleanup),d(f.Utility.needsDestruction),{}local u,v={__index=t},{__mode='k'}function t.get(E,F:boolean?):any if F
~=false then k(E)end return E._outputTable end function t.update(E):boolean local F=E._inputIsState local G,H,I,J,K=if F
then E._inputTable:get(false)else E._inputTable,E._oldInputTable,E._keyIOMap,E._meta,false for L in pairs(E.
dependencySet)do L.dependentSet[E]=nil end E._oldDependencySet,E.dependencySet=E.dependencySet,E._oldDependencySet table
.clear(E.dependencySet)if F then E._inputTable.dependentSet[E]=true E.dependencySet[E._inputTable]=true end E.
_oldOutputTable,E._outputTable=E._outputTable,E._oldOutputTable local M,N=E._oldOutputTable,E._outputTable table.clear(N
)for O,P in pairs(G)do local Q=E._keyData[O]if Q==nil then Q={dependencySet=setmetatable({},v),oldDependencySet=
setmetatable({},v),dependencyValues=setmetatable({},v)}E._keyData[O]=Q end local R=H[O]~=P if R==false then for S,T in
pairs(Q.dependencyValues)do if T~=S:get(false)then R=true break end end end if R then Q.oldDependencySet,Q.dependencySet
=Q.dependencySet,Q.oldDependencySet table.clear(Q.dependencySet)local S,T,U,V=i(Q.dependencySet,E._processor,O,P)if S
then if E._destructor==nil and(q(T)or q(U)or q(V))then o'destructorNeededForPairs'end if N[T]~=nil then local W,X for Y,
Z in pairs(I)do if Z==T then X=G[Y]if X~=nil then W=Y break end end end if W~=nil then n('forPairsKeyCollision',nil,
tostring(T),tostring(W),tostring(X),tostring(O),tostring(P))end end local W=M[T]if W~=U then local X=J[T]if W~=nil then
local Y,Z=xpcall(E._destructor or p,l,T,W,X)if not Y then m('forPairsDestructorError',Z)end end M[T]=nil end H[O]=P I[O]
=T J[T]=V N[T]=U K=true else Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet m(
'forPairsProcessorError',T)end else local S=I[O]if N[S]~=nil then local T,U for V,W in pairs(I)do if S==W then U=G[V]if
U~=nil then T=V break end end end if T~=nil then n('forPairsKeyCollision',nil,tostring(S),tostring(T),tostring(U),
tostring(O),tostring(P))end end N[S]=M[S]end for S in pairs(Q.dependencySet)do Q.dependencyValues[S]=S:get(false)E.
dependencySet[S]=true S.dependentSet[E]=true end end for Q,R in pairs(M)do if N[Q]~=R then local S=J[Q]if R~=nil then
local T,U=xpcall(E._destructor or p,l,Q,R,S)if not T then m('forPairsDestructorError',U)end end if N[Q]==nil then J[Q]=
nil E._keyData[Q]=nil end K=true end end for S in pairs(H)do if G[S]==nil then H[S]=nil I[S]=nil end end return K end
local function E<KI,VI,KO,VO,M>(F:PubTypes.CanBeState<{[KI]:VI}>,G:(KI,VI)->(KO,VO,M?),H:((KO,VO,M?)->())?):Types.
ForPairs<KI,VI,KO,VO,M>local I=F.type=='State'and typeof(F.get)=='function'local J=setmetatable({type='State',kind=
'ForPairs',dependencySet={},dependentSet=setmetatable({},v),_oldDependencySet={},_processor=G,_destructor=H,
_inputIsState=I,_inputTable=F,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},u)
j(J)J:update()return J end return E end)()end,[44]=function()local b,c,d=a(44)local e return(function(...)local f=c.
Parent.Parent local g,h,i,j,k,l,m,n,o,p,q=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.
Dependencies.initDependency),d(f.Dependencies.useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.
Logging.logWarn),d(f.Utility.cleanup),d(f.Utility.needsDestruction),{}local t,u={__index=q},{__mode='k'}function q.get(v
,E:boolean?):any if E~=false then k(v)end return v._outputTable end function q.update(v):boolean local E=v._inputIsState
local F,G,H=if E then v._inputTable:get(false)else v._inputTable,{},false v._oldValueCache,v._valueCache=v._valueCache,v
._oldValueCache local I,J=v._valueCache,v._oldValueCache table.clear(I)for K in pairs(v.dependencySet)do K.dependentSet[
v]=nil end v._oldDependencySet,v.dependencySet=v.dependencySet,v._oldDependencySet table.clear(v.dependencySet)if E then
v._inputTable.dependentSet[v]=true v.dependencySet[v._inputTable]=true end for L,M in pairs(F)do local N=J[M]local O,P,Q
,R=(N==nil)if type(N)=='table'and#N>0 then local S=table.remove(N,#N)P=S.value Q=S.valueData R=S.meta if#N<=0 then J[M]=
nil end elseif N~=nil then J[M]=nil O=true end if Q==nil then Q={dependencySet=setmetatable({},u),oldDependencySet=
setmetatable({},u),dependencyValues=setmetatable({},u)}end if O==false then for S,T in pairs(Q.dependencyValues)do if T
~=S:get(false)then O=true break end end end if O then Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.
oldDependencySet table.clear(Q.dependencySet)local S,T,U=i(Q.dependencySet,v._processor,M)if S then if v._destructor==
nil and(p(T)or p(U))then n'destructorNeededForValues'end if P~=nil then local V,W=xpcall(v._destructor or o,l,P,R)if not
V then m('forValuesDestructorError',W)end end P=T R=U H=true else Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.
oldDependencySet m('forValuesProcessorError',T)end end local S=I[M]if S==nil then S={}I[M]=S end table.insert(S,{value=P
,valueData=Q,meta=R})G[L]=P for T in pairs(Q.dependencySet)do Q.dependencyValues[T]=T:get(false)v.dependencySet[T]=true
T.dependentSet[v]=true end end for N,O in pairs(J)do for P,Q in ipairs(O)do local R,S=Q.value,Q.meta local T,U=xpcall(v.
_destructor or o,l,R,S)if not T then m('forValuesDestructorError',U)end H=true end table.clear(O)end v._outputTable=G
return H end local function v<VI,VO,M>(E:PubTypes.CanBeState<{[any]:VI}>,F:(VI)->(VO,M?),G:((VO,M?)->())?):Types.
ForValues<VI,VO,M>local H=E.type=='State'and typeof(E.get)=='function'local I=setmetatable({type='State',kind=
'ForValues',dependencySet={},dependentSet=setmetatable({},u),_oldDependencySet={},_processor=F,_destructor=G,
_inputIsState=H,_inputTable=E,_outputTable={},_valueCache={},_oldValueCache={}},t)j(I)I:update()return I end return v
end)()end,[45]=function()local b,c,d=a(45)local e return(function(...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),
d(f.Types),d(f.Dependencies.initDependency)type Set<T> ={[T]:any}local j={}local k,l:Set<Types.Observer> ={__index=j},{}
function j.update(m):boolean for n,o in pairs(m._changeListeners)do task.spawn(o)end return false end function j.
onChange(m,n:()->()):()->()local o={}m._numChangeListeners+=1 m._changeListeners[o]=n l[m]=true local p=false return
function()if p then return end p=true m._changeListeners[o]=nil m._numChangeListeners-=1 if m._numChangeListeners==0
then l[m]=nil end end end local function m(n:PubTypes.Value<any>):Types.Observer local o=setmetatable({type='State',kind
='Observer',dependencySet={[n]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},k)i(o)n.dependentSet[o]=
true return o end return m end)()end,[46]=function()local b,c,d=a(46)local e return(function(...)local f=c.Parent.Parent
local g,h,i,j,k,l=d(f.Types),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Dependencies.updateAll
),d(f.Utility.isSimilar),{}local m,n={__index=l},{__mode='k'}function l.get(o,p:boolean?):any if p~=false then h(o)end
return o._value end function l.set(o,p:any,q:boolean?)local t=o._value if q or not k(t,p)then o._value=p j(o)end end
local function o<T>(p:T):Types.State<T>local q=setmetatable({type='State',kind='Value',dependentSet=setmetatable({},n),
_value=p},m)i(q)return q end return o end)()end,[47]=function()local b,c,d=a(47)local e return(function(...)local f=c.
Parent.Parent local g,h=d(f.PubTypes),d(f.Utility.xtypeof)local function i<T>(j:PubTypes.CanBeState<T>,k:boolean?):T
return if h(j)=='State'then(j::PubTypes.StateObject<T>):get(k)else(j::T)end return i end)()end,[48]=function()local b,c,
d=a(48)local e return(function(...)local f=c.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}export type None=PubTypes
.Symbol&{}export type Error={type:string,raw:string,message:string,trace:string}export type State<T> =PubTypes.Value<T>&
{_value:T}export type Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,
_value:T}export type ForPairs<KI,VI,KO,VO,M> =PubTypes.ForPairs<KO,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,
_processor:(KI,VI)->(KO,VO),_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:VI}>,
_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO},_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{
[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.
Dependency]:any}}}}export type ForKeys<KI,KO,M> =PubTypes.ForKeys<KO,any>&{_oldDependencySet:Set<PubTypes.Dependency>,
_processor:(KI)->(KO),_destructor:(KO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:KO}>,
_oldInputTable:{[KI]:KO},_outputTable:{[KO]:any},_keyOIMap:{[KO]:KI},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<
PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export
type ForValues<VI,VO,M> =PubTypes.ForValues<any,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(VI)->(VO),
_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[VI]:VO}>,_outputTable:{[any]:VI},
_valueCache:{[VO]:any},_oldValueCache:{[VO]:any},_meta:{[VO]:M?},_valueData:{[VI]:{dependencySet:Set<PubTypes.Dependency
>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type Tween<T> =
PubTypes.Tween<T>&{_goalState:State<T>,_tweenInfo:TweenInfo,_prevValue:T,_nextValue:T,_currentValue:T,_currentTweenInfo:
TweenInfo,_currentTweenDuration:number,_currentTweenStartTime:number,_currentlyAnimating:boolean}export type Spring<T> =
PubTypes.Spring<T>&{_speed:PubTypes.CanBeState<number>,_speedIsState:boolean,_lastSpeed:number,_damping:PubTypes.
CanBeState<number>,_dampingIsState:boolean,_lastDamping:number,_goalState:State<T>,_goalValue:T,_currentType:string,
_currentValue:T,_springPositions:{number},_springGoals:{number},_springVelocities:{number}}export type Observer=PubTypes
.Observer&{_changeListeners:Set<()->()>,_numChangeListeners:number}return nil end)()end,[50]=function()local b,c,d=a(50)
local e return(function(...)local f=c.Parent.Parent local g=d(f.Types)return{type='Symbol',name='None'}::Types.None end
)()end,[51]=function()local b,c,d=a(51)local e return(function(...)local function f(g:any)local h=typeof(g)if h==
'Instance'then g:Destroy()elseif h=='RBXScriptConnection'then g:Disconnect()elseif h=='function'then g()elseif h==
'table'then if typeof(g.destroy)=='function'then g:destroy()elseif typeof(g.Destroy)=='function'then g:Destroy()elseif g
[1]~=nil then for i,j in ipairs(g)do f(j)end end end end local function g(...:any)for h=1,select('#',...)do f(select(h,
...))end end return g end)()end,[52]=function()local b,c,d=a(52)local e return(function(...)local function f(...:any)end
return f end)()end,[53]=function()local b,c,d=a(53)local e return(function(...)local function f(g:any,h:any):boolean if
typeof(g)=='table'then return false else return g==h end end return f end)()end,[54]=function()local b,c,d=a(54)local e
return(function(...)local function f(g:any):boolean return typeof(g)=='Instance'end return f end)()end,[55]=function()
local b,c,d=a(55)local e return(function(...)local f=c.Parent.Parent local g=d(f.Logging.logError)type table={[any]:any}
local function h(i:string,j:table):table local k=getmetatable(j::any)if k==nil then k={}setmetatable(j,k)end function k.
__index(l,m)g('strictReadError',nil,tostring(m),i)end return j end return h end)()end,[56]=function()local b,c,d=a(56)
local e return(function(...)local function f(g:any)local h=typeof(g)if h=='table'and typeof(g.type)=='string'then return
g.type else return h end end return f end)()end,[57]=function()local b,c,d=a(57)local e return(function(...)local f,g=d(
c.Parent.Parent.utilities.randomString),d(c.Parent.Fusion)local h,i,j=g.Value,{},{}type uid=string type tag=string
function j.update(k:string,l:string,m:string)if l~='uid'and j.find(k)and j.find(k)[l]then local n=j.find(k)n[l]:set(m)
elseif not j.find(k)then error("couldn't find uid: "..k)elseif l=='uid'or l=='__tag'then error('cannot edit property '..
l)elseif not j.find(k)[l]then else error'how?'end end function j.find(k:uid|tag):table local l for m=1,#i do if i[m].uid
==k or i[m].__tag==k then l=i[m]end end if not l then warn('no data found by identifier: '..tostring(k))return l end
return l end function j.delete(k:string)local l=j.find(k)local m,n=table.find(i,l),{}for o=1,#i do if o~=m then table.
insert(n,i[o])end end i=n n=nil end function j.add(k:table,l:string):table for m,n in k do k[m]=h(n)end k.__tag=l or nil
k.uid=f(16)setmetatable(k,{__index={update=function(o,p,q)j.update(o.uid,p,q)end,delete=function()j.delete(k.uid)end}})
table.insert(i,k)return j.find(k.uid)end return j end)()end,[58]=function()local b,c,d=a(58)local e return(function(...)
return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize='rbxassetid://15556637715',close=
'rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown=
'rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command=
'rbxassetid://10723416765',input='rbxassetid://10734982297',search='rbxassetid://10734943674',finger=
'rbxassetid://10734929723',alert='rbxassetid://10709752996'}end)()end,[59]=function()local b,c,d=a(59)local e return(
function(...)end)()end,[60]=function()local b,c,d=a(60)local e return(function(...)local f=d(c.Parent.Parent.utilities.
customFunctions)local g,h=f.cloneref,{}h=setmetatable(h,{__index=function(i,j)return g(game:GetService(j))end})return h
end)()end,[61]=function()local b,c,d=a(61)local e return(function(...)local f,g,h={},d(c.Parent.Fusion),d(c.default)
local i,j,k,l,m=g.Value,g.Observer,d(c.Parent.Parent.utilities.get),d(c.Parent.Parent.utilities.animate),{}local n=i{}j(
n):onChange(function()for o,p in ipairs(m)do task.spawn(p)end end)local o={}table.foreach(h,function(p,q)table.insert(o,
p)end)function f.create(p)for q,t in o do if p[t]==nil then p[t]=h[t]end if typeof(p[t])~='Color3'then error(t..
" isn't type Color3")end end for u,v in p do if not table.find(o,u)then warn('Incorrect value removed "'..tostring(u)..
'"')p[u]=nil end end n:set(p)end function f.get(p:string)local t=k(n)if t[p]then return t[p]else error(p..
" isn't a theme element")end end for p,t in o do f[t]=l(function()return k(n)[t]end,40,1)end n:set(h)function f.onChange
(u)table.insert(m,u)end return f end)()end,[62]=function()local b,c,d=a(62)local e return(function(...)return{background
=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',
selectedTab=Color3.fromHex'#1A1A1B',notificationButton=Color3.fromHex'#222427',mobileButtonBackground=Color3.fromHex
'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.
fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),
orange=Color3.fromHex'#ff9b61'}end)()end,[64]=function()local b,c,d=a(64)local e return(function(...)local f=c.Parent.
Parent return function(g)local h=d(f.Bundles)local i,j,k,l=h.data,h.themeSystem,h.icons,h.Fusion local m,n,o,p,t,u,v=l.
New,l.Children,l.Value,l.Observer,l.OnEvent,l.Computed,d(f.utilities)local E,F,G,H,I=v.get,v.animate,v.typecheck,v.
customFont,d(f.simpleElements)local J,K,L,M=I.UIPadding,I.UICorner,G(g,{Name='',DisabledText='',IsEnabled=false,Callback
=function()end},{g.IsEnabled and''or'IsEnabled',g.DisabledText and''or'DisabledText'})assert(L,table.concat(M,'\n'))
local N,O,P,Q,R,S,T,U=i.find'selectedTab',i.find'searchText',i.add(g),g.Parent,g.Name,g.Callback,g.IsEnabled or o(true),
g.DisabledText or o'Component Disabled'local V=o(E(N.string)==E(P.tab).uid)p(N.string):onChange(function()V:set(E(N.
string)==E(P.tab).uid)end)local W=F(function()return E(V)and 0 or 1 end,40,1)m'TextButton'{Interactable=u(function()if
not E(T)then return false end return E(V)end),Visible=u(function()if E(O.string)~=''and not string.find(E(R):lower(),E(O
.string):lower())then return false end return true end),Parent=Q,Size=UDim2.new(1,0,0,36),BackgroundColor3=j.background2
,BackgroundTransparency=W,[t'Activated']=function()if not E(T)then return end task.spawn(E(S))end,[n]={K(6),m'Frame'{
ZIndex=2,Visible=u(function()if not E(T)then return true end return false end),BackgroundTransparency=F(function()return
E(V)and 0.2 or 1 end,40,1),BackgroundColor3=j.disabledBackground,Size=UDim2.fromScale(1,1),[n]={K(6),m'ImageLabel'{Size=
UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=k.
lock,ImageColor3=j.disabledText,ImageTransparency=W},m'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=j.disabledText,TextTransparency=W,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=U,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[n]={J(0,5)}}}},m'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[n]={J(0,8),m'TextLabel'{FontFace=H(
'Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=j.text,TextScaled=true
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=R,TextTransparency=W,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true},m'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=k.fingerprint,ImageColor3=j.text2,ImageTransparency=W}}}}}local X={}
function X.SetName(Y,Z)local _,aa=G({SetName=Z},{SetName=''})assert(_,table.concat(aa,'\n'))R:set(Z)end function X.
SetCallback(aa,Y)local Z,_=G({SetCallback=Y},{SetCallback=function()end})assert(Z,table.concat(_,'\n'))S:set(Y)end
function X.Fire(aa)task.spawn(E(S))end function X.Enable(aa)T:set(true)end function X.Disable(aa)T:set(false)end return
X end end)()end,[65]=function()local aa,b,c=a(65)local d return(function(...)local e=b.Parent.Parent return function(f)
local g=c(e.Bundles)local h,i,j=g.data,g.themeSystem,g.Fusion local k,l,m,n,o=j.New,j.Children,j.Value,j.Observer,c(e.
utilities)local p,t,u,v,E=o.get,o.animate,h.find'selectedTab',h.add(f),f.Parent local F=m(p(u.string)==p(v.tab).uid)n(u.
string):onChange(function()F:set(p(u.string)==p(v.tab).uid)end)local G=t(function()return p(F)and 0 or 1 end,40,1)k
'Frame'{Parent=E,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[l]={k'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=i.text2,BackgroundTransparency=G}}}end end)()end
,[66]=function()local aa,b,c=a(66)local d return(function(...)local e=b.Parent.Parent return function(f)local g=c(e.
Bundles)local h,i,j,k=g.data,g.themeSystem,g.icons,g.Fusion local l,m,n,o,p,t,u,v=k.New,k.Children,k.Value,k.Observer,k.
OnEvent,k.Computed,k.Ref,c(e.utilities)local E,F,G,H,I=v.get,v.animate,v.typecheck,v.customFont,c(e.simpleElements)local
J,K,L,M,N,O,P,Q,R=I.UIListLayout,I.UIPadding,I.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,G(f,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Items={},Multiselect=true,
Regex=function()end},{f.DisabledText and''or'DisabledText',f.FLAG and''or'FLAG',f.IsEnabled and''or'IsEnabled',f.
Multiselect and''or'Multiselect',f.Regex and''or'Regex'})assert(Q,table.concat(R,'\n'))Q,R=G(f,{Default=f.Multiselect
and{}or''},{f.Default and''or'Default'})assert(Q,table.concat(R,'\n'))if f.Regex then assert(typeof(f.Regex'')=='string'
,'The Regex function must always return a string')end local S,T,U,V,W,X,Y,Z,_,ab,ac,ad,ae,af,ag,ah,ai=h.find
'selectedTab',h.find'useConfig',h.find'flags',h.find'configLoaded',h.find'searchText',h.add(f),f.Parent,f.Name,f.
Callback,n{},f.Default or n{},f.IsEnabled or n(true),f.DisabledText or n'Component Disabled',f.Regex or n(function(S)
return S end),f.Multiselect or n(false),f.FLAG or n'',false if E(ah)~=''then local aj=E(U.names)assert(not table.find(aj
,E(ah)),('FLAG "%s" already exists'):format(E(ah)))table.insert(aj,E(ah))U:update('names',aj)ai=true local ak=E(U.
specialCase)ak[E(ah)]={Multiselect=E(ag)}U:update('specialCase',ak)end local aj,ak,al,am,an,ao,ap=n(),n(),n(false),n(E(
ag)and{}or''),n{},n{},n(false)o(an):onChange(function()if typeof(E(an))~='table'then an:set{E(an)}return end if#E(an)==#
E(ab)then ap:set(true)else ap:set(false)end if E(ag)then local aq={}for ar,as in E(an)do table.insert(aq,E(af)(as))end
task.spawn(E(_),aq)am:set(E(an))else if#E(an)<1 then return end task.spawn(E(_),E(af)(E(an)[1]))am:set(E(af)(E(an)[1]))
end end)o(ab):onChange(function()if#E(an)==#E(ab)then ap:set(true)else ap:set(false)end end)local aq=n(E(S.string)==E(X.
tab).uid)o(S.string):onChange(function()aq:set(E(S.string)==E(X.tab).uid)end)local ar=F(function()return E(aq)and 0 or 1
end,40,1)local function as()if E(V.boolean)then local at=E(U.list)[E(ah)]local au=G({[E(ah)]=at},{[E(ah)]={}})if at and
au then an:set(at)end o(an):onChange(function()if typeof(E(an))~='table'then return end local av=E(U.list)av[E(ah)]=E(an
)U:update('list',av)end)if not at then task.wait()an:set(E(ac))end end end l'Frame'{Parent=Y,Visible=t(function()if E(W.
string)~=''and not string.find(E(Z):lower(),E(W.string):lower())then return false end return true end),Size=F(function()
if E(al)and E(aj)then local at,au=E(aj),3 for av,aw in at:GetChildren()do if aw:IsA'UIListLayout'or aw:IsA'UICorner'or
not aw.Visible then continue end au+=(4+aw.Size.Y.Offset)end return UDim2.new(1,0,0,au)end return UDim2.new(1,0,0,36)end
,40,1),BackgroundColor3=i.background2,BackgroundTransparency=ar,ClipsDescendants=true,[u]=aj,[m]={L(6),J(M.LayoutOrder,N
.Vertical,O.Center,P.Top,UDim.new(0,4)),l'TextButton'{Interactable=t(function()if not E(ad)then return false end return
E(aq)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[p'Activated']=function()al:set(not E(al))end,[m]={l'Frame'{
ZIndex=2,Visible=t(function()if not E(ad)then return true end return false end),BackgroundTransparency=F(function()
return E(aq)and 0.2 or 1 end,40,1),BackgroundColor3=i.disabledBackground,Size=UDim2.fromScale(1,1),[m]={L(6),l
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=j.lock,ImageColor3=i.disabledText,ImageTransparency=ar},l'TextLabel'{FontFace=H(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=i.disabledText,
TextTransparency=ar,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=t(function()
return E(ae)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[m]={K(0,5)}}}},l'Frame'{Size=UDim2.fromScale(1,1
),BackgroundTransparency=1,[m]={K(8),l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,
18),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5
,0),Text=t(function()if E(ag)then return E(Z)..' '..tostring(#E(an))..'/'..tostring(#E(ab))end return E(Z)..': '..E(am)
end),TextTransparency=ar,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},l'ImageLabel'{Size=UDim2.fromOffset(24,
24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=t(function()return E(ag)
and j.multiDropdown or j.normalDropdown end),ImageColor3=i.text2,ImageTransparency=ar}}}}},l'Frame'{Size=UDim2.new(1,0,0
,32),BackgroundTransparency=1,[m]={K(0,6),l'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=i.background,
BackgroundTransparency=ar,FontFace=H('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,PlaceholderText='Search',TextColor3=i.text,TextTransparency=ar,[u]=ak,[p'Changed']=function(at)local au=
E(ak)if at=='Text'and au and au.Text then local av=au.Text for aw,ax in E(ao)do if string.find(E(af)(ax.Name):lower(),av
:lower())or av==''then ax.Visible=true else ax.Visible=false end end end end,[m]={l'UITextSizeConstraint'{MinTextSize=0,
MaxTextSize=16},L(4),K(6,6,6,6)}}}},l'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=ag,[m]={K(6,6,0,6
),l'TextButton'{Interactable=ag,Size=UDim2.new(1,0,0,24),BackgroundTransparency=ar,BackgroundColor3=i.background,[p
'Activated']=function()local at={}if not E(ap)then for au,av in E(ab)do av=typeof(av)=='table'and av.Value or av table.
insert(at,E(af)(av))end end an:set(at)end,[m]={L(4),K(8),l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size
=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=i.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position
=UDim2.new(0,0,0.5,0),Text=t(function()if E(ap)then return'Deselect All'end return'Select All'end),TextTransparency=ar,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},l'ScrollingFrame'{ZIndex=3,Size=UDim2.new(1,0,0,136),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[m]
={K(6,6,0,6),J(M.LayoutOrder,N.Vertical,O.Center,P.Top,UDim.new(0,6)),ao}}}}o(ab):onChange(function()local at={}for au,
av in E(ab)do local aw,ax,ay=(n(false))if typeof(av)=='table'then local az,aA=G(av,{Value='',Image=''},{av.Image and''or
'Image'})assert(az,table.concat(aA,'\n'))ax=av.Value ay=av.Image or nil else local az,aA=G({Item=av},{Item=''})assert(az
,table.concat(aA,'\n'))ax=av end local az=E(af)(ax)o(an):onChange(function()if typeof(E(an))~='table'then return end if
table.find(E(an),az)then aw:set(true)else aw:set(false)end end)local aA=l'TextButton'{Name=ax,Size=UDim2.new(1,0,0,28),
BackgroundTransparency=ar,BackgroundColor3=i.background,[p'Activated']=function()local aA=E(an)if E(ag)then aw:set(not
E(aw))if E(aw)then table.insert(aA,az)else table.remove(aA,table.find(aA,az))end an:set(aA)else an:set{az}al:set(false)
end end,[m]={L(4),K(8),J(M.LayoutOrder,N.Horizontal,O.Left,P.Center,UDim.new(0,6)),l'Frame'{Visible=t(function()return
E(ag)and true or false end),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=ar,BackgroundColor3=F(function()return E(aw)and i.get'toggled'or i.get'selectedTab'end,40,1),[m]=
{L(6),l'ImageLabel'{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,Image=j.check,ImageTransparency=F(function()if not E(aq)then return 1 end if E(aw)then return 0
end return 1 end,40,1),ImageColor3=i.selectedTab}}},l'ImageLabel'{Visible=t(function()return ay and true or false end),
Size=UDim2.fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image
=ay,ImageTransparency=ar,ImageColor3=i.text2},l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=t(function
()return E(ag)and UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=i.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ax,TextTransparency=ar,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}table.insert(at,aA)end ao:set(at)end)ab:set(E(f.Items))if E(T.boolean)and ai
then if not E(V.boolean)then o(V.boolean):onChange(as)else as()end else an:set(E(ac))end local at={}function at.SetName(
au,av)local aw,ax=G({SetName=av},{SetName=''})assert(aw,table.concat(ax,'\n'))Z:set(av)end function at.SetItems(au,av)
local aw,ax=G({SetItems=av},{SetItems={}})assert(aw,table.concat(ax,'\n'))an:set{}ab:set(av)local ay,az={},false for aA,
aB in E(ab)do local aC if typeof(aB)=='table'then aC=aB.Value else aC=aB end local aD=E(af)(aC)if E(ag)then if typeof(E(
am))=='table'and table.find(E(am),aD)then table.insert(ay,aD)az=true end else if E(am)==aD then az=true task.spawn(E(_),
aD)break end end end if az then if E(ag)then an:set(ay)end end end function at.SelectItem(au,av)assert(not E(ag),
':SelectItem requires Multiselect to be false')local aw,ax=G({SelectItem=av},{SelectItem=''})assert(aw,table.concat(ax,
'\n'))local ay=false for az,aA in E(ab)do local aB=aA if typeof(aA)=='table'then aB=aA.Value end local aC=E(af)(av)if E(
af)(aB)==aC then ay=true break end end assert(ay,":SelectItem couldn't find "..av)an:set{av}end function at.SelectItems(
au,av)assert(E(ag),':SelectItems requires Multiselect to be true')local aw,ax=G({SelectItems=av},{SelectItems={}})
assert(aw,table.concat(ax,'\n'))for ay,az in av do local aA=false for aB,aC in E(ab)do local aD=typeof(aC)=='table'and
E(af)(aC.Value)or E(af)(aC)if az==aD then aA=true break end end if aA then av[ay]=E(af)(az)else warn(
":SelectItems couldn't find",az,'in Items. Removing it.')av[ay]=nil end end an:set(av)end function at.Enable(au)ad:set(
true)end function at.Disable(au)ad:set(false)end return at end end)()end,[67]=function()local aa,ab,ac=a(67)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.services local al,am=ak.UserInputService,ag.Fusion local an,ao,ap,aq,ar,as,at,au=am.New,am.
Children,am.Value,am.Observer,am.OnEvent,am.Computed,am.Ref,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.
animate,au.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,b,c,d,e,f,g,h,i,j,
k=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,
Callback=function()end,Bind=Enum.KeyCode.Q},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled
and''or'IsEnabled',af.Bind and''or'Bind'})assert(j,table.concat(k,'\n'))local l,m,n,o,p,t,u,v,E,F,G,H,I,J,K,L,M=ah.find
'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.find
'isMobile',ah.find'instanceName',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ap(true),
af.DisabledText or ap'Component Disabled',ap(),false local function N(O:EnumItem,P:string)local Q=av(m.binds)if table.
find(Q,O)then i(('Key %s is already in use. %s'):format(O.Name,P))else table.insert(Q,O)if av(L)then table.remove(Q,
table.find(Q,av(L)))end m:update('binds',Q)L:set(O)M=true end end if af.Bind then if not av(n.boolean)then N(av(af.Bind)
,'At property set')end end local O,P=af.FLAG or ap'',false if av(O)~=''then local Q=av(o.names)assert(not table.find(Q,
av(O)),('FLAG "%s" already exists'):format(av(O)))table.insert(Q,av(O))o:update('names',Q)P=true local R=av(o.
specialCase)R[av(O)]={isKeybind=true}o:update('specialCase',R)end local Q=ap(av(l.string)==av(F.tab).uid)aq(l.string):
onChange(function()Q:set(av(l.string)==av(F.tab).uid)end)local R,S=aw(function()return av(Q)and 0 or 1 end,40,1),ap(
false)local T=al.InputBegan:Connect(function(T,U)if av(u.boolean)then return end if av(S)then if T.KeyCode and T.KeyCode
~=Enum.KeyCode.Unknown then N(T.KeyCode,'From input box')end S:set(false)task.wait()E:update('boolean',false)else if T.
KeyCode and T.KeyCode==av(L)and not U and not av(E.boolean)and av(J)then task.spawn(av(I))end end end)ay.add(T)local U,V
=ap(false),ap(Vector2.new(0,0))local function W()if P then if av(p.boolean)then local X=av(o.list)[av(O)]local Y=ax({[
av(O)]=X},{[av(O)]={}})if X and Y then N(Enum.KeyCode[X.keycode],'From configLoad has FLAG')end aq(L):onChange(function(
)local Z=av(o.list)Z[av(O)]=Z[av(O)]or{}Z[av(O)].keycode=av(L).Name o:update('list',Z)end)aq(V):onChange(function()local
Z=av(o.list)Z[av(O)]=Z[av(O)]or{}Z[av(O)].coordinate=tostring(av(V))o:update('list',Z)end)if not X then task.wait()N(av(
af.Bind),'From configLoad no FLAG')end end else if av(p.boolean)and not M then task.wait()N(av(af.Bind),
'From configLoad no FLAG')end end end local X,Y Y=an'TextButton'{Visible=as(function()if not av(J)then return av(J)end
return av(U)end),Parent=aA.get(av(v.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text=av(H),FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.
mobileButtonText,BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[ar
'Activated']=function()if X then X:Disconnect()X=nil V:set(Y.AbsolutePosition)else task.spawn(av(I))end end,[ao]={aD(4),
b(16),c(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=av(u.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=G,Visible=as(function()if av(t.string)~=''and not string.
find(av(H):lower(),av(t.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=as(function()if not av(J)then return true end return false end
),BackgroundTransparency=aw(function()return av(Q)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ao]={b(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=R},an
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=R,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=as(function()return av(K)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ao]={aD(0,5)}}}},an'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={d(e.LayoutOrder,f.Horizontal,g.Left,h.Center,UDim.new(0,3)),an
'TextButton'{Interactable=as(function()if not av(J)then return false end return av(Q)end),Size=UDim2.new(0.225,0,1,0),
BackgroundColor3=ai.background2,BackgroundTransparency=R,[ar'Activated']=function()if av(u.boolean)then U:set(true)X=aB(
Y,15)return end S:set(true)E:update('boolean',true)end,[ao]={b(6),aD(6),d(e.LayoutOrder,f.Horizontal,g.Left,h.Center,
UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(u.boolean)and aj.
finger or aj.command,ImageColor3=ai.text2,ImageTransparency=R},an'TextLabel'{Visible=not av(u.boolean),Size=UDim2.new(1,
-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=R,Text=as(function()return av(S)and'Listening'or av(L)and av(
L).Name or'Waiting'end)},an'TextLabel'{Visible=av(u.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=as(function()return av(U)and'Move Bind'or'Place Bind'end),TextTransparency=R}}},an'TextButton'{Visible=U,
Interactable=as(function()if not av(J)then return false end return av(Q)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=R,[ar'Activated']=function()U:set(false)Y.Position=UDim2.
fromScale(0.5,0.5)V:set(Y.AbsolutePosition)end,[ao]={b(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2
.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=R}}},an'Frame'{Size=as(function()return UDim2.new(0.775,av(U)and-42 or-3,0,36)end),BackgroundColor3=ai
.background2,BackgroundTransparency=R,[ao]={b(6),an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={aD(8
),d(e.LayoutOrder,f.Horizontal,g.Left,h.Center,UDim.new(0,10)),an'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=H,TextTransparency=R,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}}}
}}}if av(n.boolean)then if av(p.boolean)then W()else aq(p.boolean):onChange(W)end end local Z={}function Z.SetName(_,aE)
local aF,aG=ax({SetName=aE},{SetName=''})assert(aF,table.concat(aG,'\n'))H:set(aE)end function Z.SetBind(aE,aF:EnumItem)
local aG,_=ax({SetBind=aF},{SetBind=Enum.keyCode.C})assert(aG,table.concat(_,'\n'))N(aF,'At :SetBind')end function Z.
Enable(aE)J:set(true)end function Z.Disable(aE)J:set(false)end return Z end end)()end,[68]=function()local aa,ab,ac=a(68
)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data
,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.
simpleElements)local aq,ar,as=ap.UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate,
as.customFont local ax,ay=au(af,{Text=''})assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,aD=ah.find'selectedTab',ah.
find'searchText',ah.add(af),af.Parent,af.Text local aE=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function(
)aE:set(at(az.string)==at(aB.tab).uid)end)local aF=av(function()return at(aE)and 0 or 1 end,40,1)ak'Frame'{Visible=an(
function()if at(aA.string)~=''and not string.find(at(aD):lower(),at(aA.string):lower())then return false end return true
end),Size=UDim2.new(1,0,0,36),Parent=aC,BackgroundTransparency=aF,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak
'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,
TextTransparency=aF,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment
=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return at(aD)end),[al]={ak'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=18}}}}}local aG={}function aG.SetText(b,c)local d,e=au({SetText=c},{SetText=''})assert(d,table
.concat(e,'\n'))aD:set(c)end return aG end end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,
am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao
.getStringBounds,ao.customFont,ao.typecheck,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UICorner,au.
UIPadding,au.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title
='',Body='',Duration=1,Image='',ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and
''or'ImageColor',af.Buttons and''or'Buttons'})assert(aC,table.concat(aD,'\n'))local aE,aF,aG,b,c,d,e,f,g,h,i=am(af.Title
),am(af.Body),am(af.Duration),am(af.Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(
false),am(false),am(false),am'',am(250)local j=am(ar(ap(aF),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=
ap(i)-8-(b and 32 or 0)}))local k=am(20+math.clamp(ap(j).Y+4+10+(#ap(d)>0 and 26 or 0),#ap(d)>0 and 56 or 30,9e9))
local function l(m,n)local o=1 for p=1,m do o=o*10 end local p=tostring(math.round(n*o)/o)local t=string.split(p,'.')if#
t==1 then local u=''for v=1,m do u=u..'0'end p=p..'.'..u end return p end local m,n={}for o,p in ap(d)do local t,u=at({
Button=p},{Button={}})assert(t,table.concat(u,'\n'))t,u=at(p,{Name='',Callback=function()end})assert(t,table.concat(u,
'\n'))local v,E=p.Name,p.Callback local F=aj'TextButton'{Size=UDim2.new(1/#ap(d),-2,1,-4),TextSize=14,Text=v,FontFace=
as('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function
()task.spawn(E)f:set(false)task.wait(0.4)e:set(false)task.delay(0.3,function()g:set(true)end)task.wait(2)n:Destroy()end,
[al]={av(4)}}table.insert(m,F)end n=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.
fromOffset(ap(i),ap(e)and ap(k)+5 or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return
not ap(g)end),Interactable=f,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=
UDim2.fromOffset(ap(i),ap(k)),[ak'Activated']=function()f:set(false)task.wait(0.4)e:set(false)task.delay(0.3,function()g
:set(true)end)task.wait(2)n:Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=
UDim2.fromOffset(ap(i),ap(k)),Position=aq(function()return UDim2.fromScale(ap(f)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),
ax(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=ap(b)~=''and true or false,Size
=UDim2.new(0,24,1,0),BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(
0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=b,ImageColor3=c}}},aj'Frame'{Size=UDim2.new(1,
ap(b)~=''and-28 or 0,1,0),BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj
'TextLabel'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aE},aj'TextLabel'{Size=UDim2.
new(1,0,0,1),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as(
'Montserrat',Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,RichText=true,TextColor3=ah.text2,Text=aF},aj'Frame'{Visible=an(function()return#ap(
d)>0 and true or false end),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.
Center,aB.Center,UDim.new(0,2)),m}},aj'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.
Medium),Text=h,TextColor3=ah.text,TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}
task.delay(0.4,function()f:set(true)end)task.spawn(function()repeat task.wait()until ap(f)local t,u=(tick())repeat u=
tick()-t h:set(l(1,math.clamp(u,0,ap(aG))))task.wait()until u>ap(aG)end)task.spawn(function()e:set(true)repeat task.
wait()until ap(f)task.wait(ap(aG))task.wait(0.2)f:set(false)task.wait(0.4)e:set(false)task.delay(0.3,function()g:set(
true)end)task.wait(2)n:Destroy()end)end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local
ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,
al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap
.UIPadding,ap.UITextSizeConstraint,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.
customFont,at.typecheck local az,aA=ay(af,{Title='',Body=''})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aG=ah.
find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body local b=am(au(aB.string)==au(aD.tab).uid)ao(
aB.string):onChange(function()b:set(au(aB.string)==au(aD.tab).uid)end)local c,d=av(function()return au(b)and 0 or 1 end,
40,1),am(0)task.spawn(function()d:set(aw(au(aG),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(
au(aE).AbsoluteSize.X)}).Y)end)au(aE).Changed:Connect(function(e)if e:lower()=='absolutesize'then d:set(aw(au(aG),{Font=
ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end end)ao(aG):onChange(
function()d:set(aw(au(aG),{Font=ax('Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).
Y)end)ak'Frame'{Visible=an(function()if au(aC.string)~=''and not string.find(au(aF):lower(),au(aC.string):lower())and
not string.find(au(aG):lower(),au(aC.string):lower())then return false end return true end),BackgroundColor3=ai.
background2,Parent=aE,BackgroundTransparency=c,Size=an(function()return UDim2.new(1,0,0,36+au(d))end),AutomaticSize=Enum
.AutomaticSize.Y,[al]={aq(6),ar(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,TextTransparency=c,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Top,TextScaled=true,TextSize=18,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aF,[al]={as(1,18)
}},ak'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,
TextTransparency=c,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=
ax('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,Text=aG,Size=an(function()return UDim2.new(1,-4,0,au(d))end)
}}}local e={}function e.SetBody(f,g)local h,i=ay({SetBody=g},{SetBody=''})assert(h,table.concat(i,'\n'))aG:set(g)end
function e.SetTitle(f,g)local h,i=ay({SetTitle=g},{SetTitle=''})assert(h,table.concat(i,'\n'))aF:set(g)end return e end
end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent return function(af)
local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am,an=ak.UserInputService,
ak.RunService,ag.Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,an.
Ref,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.typecheck,av.customFont,ac(ae.simpleElements)local aB,aC,
aD,aE,aF,aG,b,c,d=aA.UIListLayout,aA.UIPadding,aA.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,ay(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max
=0,DisplayAsPercent=false,DecimalPlace=0},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and
''or'IsEnabled',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or
'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace'})assert(c,table.concat(d,'\n'))local e,f,g,h,i,j,k,l,m,n,o,p,t,
u,v=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.
Parent,af.Name,af.Callback,af.Max,af.Min,af.DisplayAsPercent or aq(false),af.DecimalPlace or aq(0),af.IsEnabled or aq(
true),af.DisabledText or aq'Component Disabled'local E,F,G=af.Default and aq(math.clamp(aw(af.Default),aw(o),aw(n)))or
aq(aw(o)),af.FLAG or aq'',false if aw(F)~=''then local H=aw(g.names)assert(not table.find(H,aw(F)),(
'FLAG "%s" already exists'):format(aw(F)))table.insert(H,aw(F))g:update('names',H)G=true end local H=aq(aw(e.string)==
aw(j.tab).uid)ar(e.string):onChange(function()H:set(aw(e.string)==aw(j.tab).uid)end)local I=ax(function()return aw(H)and
0 or 1 end,40,1)local function J(K,L,M,N,O)return(1-((K-L)/(M-L)))*N+((K-L)/(M-L))*O end local function K(L)if aw(t)==0
then return math.floor(L)end return tonumber(string.format('%.'..aw(t)..'f',L))end local L,M=aq(0),aq(aw(o))ar(M):
onChange(function()L:set(J(aw(M),aw(o),aw(n),0,1))if not aw(u)then return end task.spawn(aw(m),aw(M))end)local N,O,P,Q=
aq(),aq(10),aq(),aq(false)al.InputEnded:Connect(function(R)if(R.UserInputType==Enum.UserInputType.MouseButton1 or R.
UserInputType==Enum.UserInputType.Touch)and aw(Q)then Q:set(false)end end)local function R()if G then if aw(h.boolean)
then local S=aw(g.list)[aw(F)]local T=ay({[aw(F)]=S},{[aw(F)]=0})if S and T then M:set(math.clamp(S,aw(o),aw(n)))end ar(
M):onChange(function()local U=aw(g.list)U[aw(F)]=aw(M)g:update('list',U)end)if not S then task.wait()M:set(aw(E))end end
else if aw(h.boolean)then task.wait()M:set(aw(E))end end end ao'Frame'{Parent=k,Visible=at(function()if aw(i.string)~=''
and not string.find(aw(l):lower(),aw(i.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundColor3=ai.background2,BackgroundTransparency=ax(function()if aw(H)then return 0 end return 1 end,40,1),[ap]={
aD(6),ao'Frame'{ZIndex=2,Visible=at(function()if not aw(u)then return true end return false end),BackgroundTransparency=
ax(function()return aw(H)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={
aD(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=I},ao'TextLabel'{FontFace=az(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=I,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()
return aw(v)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aC(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aB(aE.LayoutOrder,aF.Horizontal,aG.Left,b.Center,UDim.new(0,6))
,aC(0,8),ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),BackgroundTransparency
=1,TextColor3=ai.text,TextTransparency=I,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),
Text=l,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ao'Frame'{Size=UDim2.new(0.5,0,1,0),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[ap]={aB(aE.LayoutOrder,aF.Horizontal,aG.Left,b.Center
,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[ap]={aD(4),aB(aE.LayoutOrder,aF.Vertical
,aG.Right,b.Center,UDim.new(0,1)),ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0,0,0,14),
BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=I,TextScaled=true,AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,0,0.5,0),Text=at(function()if aw(p)then return tostring(K(aw(L)*100))..'%'end return aw(M)end),
TextXAlignment=Enum.TextXAlignment.Right,RichText=true,AutomaticSize=Enum.AutomaticSize.X,[as'Changed']=function(S)local
T=aw(P)if S=='AbsoluteSize'and T and T.AbsoluteSize then O:set(T.AbsoluteSize.X)end end,[au]=P,[ap]={aC(0,5,0,5)}},ao
'Frame'{BackgroundColor3=ai.text2,BackgroundTransparency=ax(function()if aw(H)then return 0.5 end return 1 end,40,1),
Size=ax(function()return UDim2.fromOffset(aw(O),2)end,40,1),[ap]={aD(0,1)}}}},ao'TextButton'{Interactable=at(function()
if not aw(u)then return false end return aw(H)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[as
'MouseButton1Down']=function()Q:set(true)end,[as'TouchLongPress']=function()Q:set(true)end,[as'InputBegan']=function(S)
if S.UserInputType==Enum.UserInputType.MouseButton1 or S.UserInputType==Enum.UserInputType.Touch and aw(N)then local T,U
=al:GetMouseLocation().X,aw(N).Size.X.Offset local V=T-(aw(N).AbsolutePosition.X+U)while aw(Q)and task.wait()do local W=
al:GetMouseLocation().X local X=math.clamp(U+(W-T)+V,0,aw(N).AbsoluteSize.X)M:set(K(J(X,0,aw(N).AbsoluteSize.X,aw(o),aw(
n))))am.RenderStepped:Wait()end end end,[au]=N,[ap]={aC(0,6),ao'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
fromScale(0,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=I,[ap]={aD(0,1)}},ao
'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=I
,Size=ax(function()return UDim2.new(aw(L),0,0,4)end,40,1),[ap]={aD(0,1),ao'ImageLabel'{Image=aj.circle,
BackgroundTransparency=1,ImageColor3=ai.selectedTab,ImageTransparency=I,Size=UDim2.fromOffset(18,18),Position=UDim2.new(
1,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),[ap]={ao'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,
0.5),Size=UDim2.fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ax(function()if aw(H)then return 0.8 end
return 1 end,40,1)}}}}}}}}}}}}}if aw(f.boolean)then if aw(h.boolean)then R()else ar(h.boolean):onChange(R)end else M:
set(aw(E))end local S={}function S.SetName(T,U)local V,W=ay({SetName=U},{SetName=''})assert(V,table.concat(W,'\n'))l:
set(U)end function S.SetValue(T,U)local V,W=ay({SetValue=U},{SetValue=0})assert(V,table.concat(W,'\n'))M:set(math.clamp(
U,aw(o),aw(n)))end function S.Enable(T)u:set(true)end function S.Disable(T)u:set(false)end return S end end)()end,[72]=
function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer,
aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local
av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UIPadding,au.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},{af.Image and''or'Image'})assert(aC,table.concat(aD,
'\n'))local aE,aF,aG,b,c,d,e=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image
then e=af.Image d:set(true)end local f=am(false)an(aE.string):onChange(function()local g=aq(aE.string)f:set(g==aG.uid)
end)ak'TextButton'{Name=aG.uid,Parent=b,Size=UDim2.new(1,0,0,36),BackgroundColor3=ar(function()return aq(f)and ai.get
'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aE:update('string',aG.uid)end,[al]={ax(4),aw(6),
av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=d,BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=e,ImageTransparency=ar(function()return aq(f)and 0 or 0.6 end,40,1)},
ak'TextLabel'{Size=aq(d)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=at('Montserrat',Enum.FontWeight.Bold),
TextColor3=ai.text2,TextScaled=true,Text=c,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=ar(function()return aq(f)and 0 or 0.6 end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}}}}if not aq(aF.boolean)then aF:update('boolean',true)aE:update('string',aG.uid)end return aG end end)()
end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)
local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj'ScrollingFrame'{ZIndex=al(function()return(as(at.
string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=
UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center,ar.Top,UDim.new(0,4))}}end end)()end,[74]=function()
local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar,as=ak.New,ak.Children,ak.Value,ak
.Computed,ak.Observer,ak.Ref,ak.OnEvent,ac(ae.utilities)local at,au,av,aw,ax=as.get,as.animate,as.customFont,as.
typecheck,ac(ae.simpleElements)local ay,az,aA,aB,aC,aD,aE,aF,aG,b=ax.UIPadding,ax.UICorner,ax.UITextSizeConstraint,ax.
UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.FillDirection,aw(af,{Name='',
Placeholder='',DisabledText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',FLAG='',IsEnabled=false,
Callback=function()end},{af.Placeholder and''or'Placeholder',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.DisabledText and''or'DisabledText'})assert(aG,table.concat(b,'\n'))local c,d,e,f,g,h,i,j,k,l,m,n,o,p,t,
u,v,E=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.
Parent,af.Name,af.Callback,af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.OnlyNumbers or an(false
),af.Default or an'',af.OnLeave or an(false),af.ClearTextOnFocus or an(false),af.Placeholder or an'',af.FLAG or an'',
false if at(v)~=''then local F=at(e.names)assert(not table.find(F,at(v)),('FLAG "%s" already exists'):format(at(v)))
table.insert(F,at(v))e:update('names',F)E=true end local F=an(at(c.string)==at(h.tab).uid)ap(c.string):onChange(function
()F:set(at(c.string)==at(h.tab).uid)end)local G,H,I,J=au(function()return at(F)and 0 or 1 end,40,1),an(),an'',an(false)
local K,L=an(at(I)),an''ap(I):onChange(function()if at(n)then if tonumber(at(I))or at(I)==''then K:set(at(I))end else K:
set(at(I))end local M=at(H)M.Text=at(K)if at(p)then return end if at(n)then if(tonumber(at(I))or at(I)=='')and at(L)~=
at(I)then task.spawn(at(k),at(I))L:set(at(I))end else if at(L)==at(I)then return end task.spawn(at(k),at(I))L:set(at(I))
end end)ap(J):onChange(function()if at(p)and not at(J)then if at(n)then if(tonumber(at(I))or at(I)=='')and at(L)~=at(I)
then task.spawn(at(k),at(I))L:set(at(I))end else if at(L)==at(I)then return end task.spawn(at(k),at(I))L:set(at(I))end
end end)local function M()if E then if at(f.boolean)then local N=at(e.list)[at(v)]local O=aw({[at(v)]=N},{[at(v)]=''})if
N and O then if at(p)then J:set(true)end I:set(N)if at(p)then J:set(false)end end ap(K):onChange(function()local P=at(e.
list)P[at(v)]=at(K)e:update('list',P)end)if not N then task.wait()if at(o)~=''then if at(p)then J:set(true)end I:set(at(
o))if at(p)then J:set(false)end end end end else if at(f.boolean)then task.wait()if at(o)~=''then if at(p)then J:set(
true)end I:set(at(o))if at(p)then J:set(false)end end end end end al'Frame'{Parent=i,Visible=ao(function()if at(g.string
)~=''and not string.find(at(j):lower(),at(g.string):lower())then return false end return true end),
BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[am]={al'Frame'{ZIndex=2,Visible=ao(function()if not at(l)then return
true end return false end),BackgroundTransparency=au(function()return at(F)and 0.2 or 1 end,40,1),BackgroundColor3=ai.
disabledBackground,Size=UDim2.fromScale(1,1),[am]={az(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,
ImageTransparency=G},al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=G,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=ao(function()return at(m)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={ay(
0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={aB(aC.LayoutOrder,aF.Horizontal,aE.Left,aD.
Center,UDim.new(0,3)),al'Frame'{Size=UDim2.new(0.65,-3,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=G,[am
]={az(6),ay(0,6),al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=j,TextTransparency=G,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},al'TextButton'{Interactable=ao(
function()if not at(l)then return false end return at(F)end),Size=UDim2.fromScale(0.35,1),BackgroundColor3=ai.
background2,BackgroundTransparency=G,[ar'Activated']=function()local N=at(H)if N then N:CaptureFocus()end end,[am]={az(6
),ay(0,6),aB(aC.LayoutOrder,aF.Horizontal,aE.Left,aD.Center,UDim.new(0,5)),al'ImageLabel'{ZIndex=0,Size=UDim2.
fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=G},al'TextBox'{
Interactable=ao(function()if not at(l)then return false end return at(F)end),Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=u,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextXAlignment=Enum.
TextXAlignment.Left,TextScaled=true,FontFace=av('Montserrat',Enum.FontWeight.Bold),Text=K,TextTransparency=G,
ClearTextOnFocus=t,[aq]=H,[ar'Changed']=function(N)local O=at(H)if O and O.Text and N=='Text'then I:set(O.Text)end end,[
ar'Focused']=function()J:set(true)end,[ar'FocusLost']=function()J:set(false)end,[am]={aA(1,16)}}}}}}}}if at(d.boolean)
then if at(f.boolean)then M()else ap(f.boolean):onChange(M)end else if at(o)~=''then if at(p)then J:set(true)end I:set(
at(o))if at(p)then J:set(false)end end end local N={}function N.SetName(O,P)local Q,R=aw({SetName=P},{SetName=''})
assert(Q,table.concat(R,'\n'))j:set(P)end function N.SetInput(O,P)local Q,R=aw({SetInput=P},{SetInput=at(n)and 1 or''})
assert(Q,table.concat(R,'\n'))I:set(P)end function N.Enable(O)l:set(true)end function N.Disable(O)l:set(false)end return
N end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am=ak.
UserInputService,ag.Fusion local an,ao,ap,aq,ar,as,at=am.New,am.Children,am.Value,am.Observer,am.OnEvent,am.Computed,ac(
ae.utilities)local au,av,aw,ax,ay,az,aA,aB=at.get,at.animate,at.typecheck,at.connections,at.customFont,at.references,at.
drag,ac(ae.simpleElements)local aC,aD,aE,aF,aG,b,c,d,e,f,g=aB.UIPadding,aB.UICorner,aB.UITextSizeConstraint,aB.
UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),aw(af,
{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=false,Callback=function()end,LinkKeybind=true},{af.DisabledText
and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.LinkKeybind
and''or'LinkKeybind'})assert(f,table.concat(g,'\n'))f,g=aw(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or
'Bind'})assert(f,table.concat(g,'\n'))local h,i,j,k,l,m,n,o,p,t,u,v,E,F,G,H,I,J,K=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.find'instanceName',ah.find
'isMobile',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.Default or ap(false),af.IsEnabled or ap(true
),af.DisabledText or ap'Component Disabled',af.LinkKeybind or ap(false),ap(),false local function L(M:EnumItem,N:string)
local O=au(i.binds)if table.find(O,M)then e(('Key %s is already in use. %s'):format(M.Name,N))else table.insert(O,M)if
au(J)then table.remove(O,table.find(O,au(J)))end i:update('binds',O)J:set(M)K=true end end if au(I)and au(af.Bind)then
if not au(j.boolean)then L(au(af.Bind),'At property set')end end local M,N=af.FLAG or ap'',false if au(M)~=''then local
O=au(k.names)assert(not table.find(O,au(M)),('FLAG "%s" already exists'):format(au(M)))table.insert(O,au(M))k:update(
'names',O)N=true local P=au(k.specialCase)P[au(M)]={isToggle=true}k:update('specialCase',P)end local O=ap(au(h.string)==
au(t.tab).uid)aq(h.string):onChange(function()O:set(au(h.string)==au(t.tab).uid)end)local P,Q=av(function()return au(O)
and 0 or 1 end,40,1),ap(false)aq(Q):onChange(function()if au(G)then task.spawn(au(E),au(Q))end end)local R=ap(false)
local S=al.InputBegan:Connect(function(S,T)if au(o.boolean)then return end if au(R)then if S.KeyCode and S.KeyCode~=Enum
.KeyCode.Unknown then L(S.KeyCode,'From input box')end R:set(false)task.wait()p:update('boolean',false)else if S.KeyCode
and S.KeyCode==au(J)and not T and not au(p.boolean)and au(G)then Q:set(not au(Q))end end end)ax.add(S)local T=ap(false)
local function U()if N then if au(l.boolean)then local V=au(k.list)[au(M)]local W=aw({[au(M)]=V},{[au(M)]={}})if V and W
and V.boolean then if V.keycode and au(I)then L(Enum.KeyCode[V.keycode],'From configLoad FLAG')end Q:set(V.boolean)end
aq(Q):onChange(function()local X=au(k.list)X[au(M)]=X[au(M)]or{}X[au(M)].boolean=au(Q)k:update('list',X)end)aq(J):
onChange(function()local X=au(k.list)X[au(M)]=X[au(M)]or{}X[au(M)].keycode=au(J).Name k:update('list',X)end)if not V
then task.wait()if au(I)then L(au(af.Bind),'From configLoad no FLAG')end Q:set(au(F))end end else if au(l.boolean)and
not K then task.wait()if au(I)then L(au(af.Bind),'From configLoad no FLAG')end Q:set(au(F))end end end local V local W=
an'TextButton'{Visible=as(function()if not au(G)then return au(G)end return au(T)end),Parent=az.get(au(n.name)),Size=
UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=au(v),
FontFace=ay('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground
,BackgroundTransparency=0.6,TextTransparency=0.1,[ar'Activated']=function()if V then V:Disconnect()V=nil else Q:set(not
au(Q))end end,[ao]={aC(4),aD(16),aE(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=au(o.boolean)and aj.finger or aj.command,
ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=u,Visible=as(function()if au(m.string)~=''and
not string.find(au(v):lower(),au(m.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=as(function()if not au(G)then return true end return false end
),BackgroundTransparency=av(function()return au(O)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ao]={aD(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=P},an
'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=P,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=as(function()return au(H)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ao]={aC(0,5)}}}},an'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={aF(aG.LayoutOrder,b.Horizontal,c.Left,d.Center,UDim.new(0,3)),
an'TextButton'{Interactable=as(function()if not au(G)then return false end return au(O)end),Size=as(function()return au(
I)and UDim2.new(0.775,au(T)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=P,[ar'Activated']=function()if not au(G)then return end Q:set(not au(Q))end,[ao]={aD(6),an'Frame'
{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={aC(8),aF(aG.LayoutOrder,b.Horizontal,c.Left,d.Center,UDim.new(
0,10)),an'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=P,BackgroundColor3=av(function()return au(Q)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[
ao]={aD(6),an'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,
0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=av(function()if not au(O)then return 1 end if au(Q)then
return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},an'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=v,TextTransparency=P,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},
an'TextButton'{Visible=T,Interactable=as(function()if not au(G)then return false end return au(O)end),Size=UDim2.
fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=P,[ar'Activated']=function()T:set(false)W.
Position=UDim2.fromScale(0.5,0.5)end,[ao]={aD(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=P}}},an'TextButton'{Visible=I,Interactable=as(function()if not au(G)then return false end return au(O)
end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=P,[ar'Activated']=function()if
au(o.boolean)then T:set(true)V=aA(W,15)return end R:set(true)p:update('boolean',true)end,[ao]={aD(6),aC(6),aF(aG.
LayoutOrder,b.Horizontal,c.Left,d.Center,UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=au(o.boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=P},an
'TextLabel'{Visible=not au(o.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=ay('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=P,Text=
as(function()return au(R)and'Listening'or au(J)and au(J).Name or'Waiting'end)},an'TextLabel'{Visible=au(o.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=ay('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,Text=as(function()return au(T)and'Move Bind'or'Place Bind'
end),TextTransparency=P}}}}}}}if au(j.boolean)then if au(l.boolean)then U()else aq(l.boolean):onChange(U)end else Q:set(
au(F))end local X={}function X.SetName(Y,Z)local _,aH=aw({SetName=Z},{SetName=''})assert(_,table.concat(aH,'\n'))v:set(Z
)end function X.SetValue(aH,Y:boolean)local Z,_=aw({SetValue=Y},{SetValue=false})assert(Z,table.concat(_,'\n'))Q:set(Y)
end function X.SetBind(aH,Y:EnumItem)assert(au(I),'Requires LinkKeybind')local Z,_=aw({SetBind=Y},{SetBind=Enum.keyCode.
C})assert(Z,table.concat(_,'\n'))L(Y,'At :SetBind')end function X.Enable(aH)G:set(true)end function X.Disable(aH)G:set(
false)end return X end end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag,ah,ai=ac(ae.Bundles),ac(ab.Parent.notification),ac(ae.utilities).references local aj,
ak=ag.icons,ag.themeSystem ah{Parent=ai.get'notificationList',Title='Darius Interface',Body=af,Duration=3,Image=aj.alert
,ImageColor=ak.get'red'}end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(...)end)()end,[79]=
function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(
ae.Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local
ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local
aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aF,aG,aH,b,c,d,e,f,g,h,i,j,k=aE.get,
aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,ac(ab.Parent.Parent.components.warn),aq(),aq(),aq(),aq(),
aq(),aq()aG.add(j,i,h,g,f,k)local l,m,n,o,p,t,u,v,E,F,G,H,I,J=am.find'absoluteOffset',am.find'instanceName',am.find
'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible',am.find'isMobile',am.find'isListening',aq(750
),aq(500),aq(false),aq(false),aq(false),aq(false)at(G):onChange(function()if aF(G)then H:set(not aF(H))task.wait(0.3)I:
set(not aF(I))task.wait(0.3)J:set(not aF(J))else J:set(not aF(J))task.wait(0.3)I:set(not aF(I))task.wait(0.3)H:set(not
aF(H))end end)at(I):onChange(function()E:set(aF(I)and 212 or 750)end)at(J):onChange(function()F:set(aF(J)and 74 or 500)
end)local K,L,M=aq(false),aq(),aq(false)local function N(O:EnumItem,P:string)local Q=aF(p.binds)if table.find(Q,O)then
e(('Key %s is already in use. %s'):format(O.Name,P))else table.insert(Q,O)if aF(L)then table.remove(Q,table.find(Q,aF(L)
))end p:update('binds',Q)L:set(O)M:set(true)end end if not aF(u.boolean)then N(af.HideBind,'init')end local O=aq''at(n.
string):onChange(function()local P=aF(n.string)local Q=am.find(P)O:set(aF(Q.Name):upper())end)local P,Q ao'ScreenGui'{
Name=aF(m.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[ar]=j,[ap]={ao'Frame'{Name=
'container',Visible=t.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=as(function()return UDim2.new(0.5,0,0.5,aF(l.
number))end),Size=c(function()return UDim2.fromOffset(aF(E),aF(F))end,30,1),BackgroundColor3=ak.background,[ar]=f,[ap]={
ax(6),az(16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right,aD.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(
0,0.5),Size=c(function()return UDim2.new(0,math.clamp(aF(E)-32-180-16,212,9e9),aF(H)and 0 or 1,0)end,30,1),
BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0
,10),BackgroundTransparency=1,Text=O,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,
FontFace=b('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]
={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency
=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),
BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(
1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=b('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.
Description,TextColor3=ak.text2,FontFace=b('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left}}},ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[
au'Activated']=function()local R=aF(k)if R then R:CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.
Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image
=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=b(
'Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(R)local S=aF(k)if R
~='Text'and S and S.Text then return end o:update('string',S.Text)end,[ar]=k}}}}},ao'Frame'{Name='tabFrameList',Size=
UDim2.new(1,0,1,-60),BackgroundTransparency=1,[ar]=h}}}}},ao'Frame'{Size=c(function()return aF(J)and UDim2.new(0,180,0,
44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder,
aB.Vertical,aC.Center,aD.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.
LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=
ak.selectedTab,[au'Activated']=function()if aF(u.boolean)then M:set(true)Q=aH(P,15)return end K:set(true)v:update(
'boolean',true)end,[ap]={ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aF(u.boolean)and al.finger or al.command,
ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not aF(u.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=b('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(K)and'Listening'or aF(L)and aF(L).Name or'Waiting'
end)},ao'TextLabel'{Visible=aF(u.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=b('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()
return aF(M)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.
selectedTab,[au'Activated']=function()G:set(not aF(G))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(G)
and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()if not aF(M)then ac(ae.components.notification){Parent=i,
Title='Darius Interface',Body=`You must {aF(u.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end t:update('boolean',not aF(t.boolean))end,[ap]={ax(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=c(function()return aF(J)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[ar]=g,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,6)),az(0,10)}},ao'TextButton'
{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=function()ag:Fire()ag:Destroy()d:
deleteConnections()aG:clear()end,[ap]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao
'ImageLabel'{BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=
0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=b('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=
true,Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]
={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',
BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),
ClipsDescendants=false,[ar]=i,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}P=ao'TextButton'{Visible=as(
function()return(aF(M)and aF(u.boolean))end),Interactable=as(function()return(aF(M)and aF(u.boolean))end),Parent=aG.get(
aF(m.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=
true,Text='Hide UI',FontFace=b('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au'Activated']=function()if Q then Q:Disconnect(
)Q=nil else t:update('boolean',not aF(t.boolean))end end,[ap]={az(4),ax(16),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aF(u
.boolean)and al.finger or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local R=aj.InputBegan:
Connect(function(R,S)if aF(u.boolean)then return end if aF(K)then if R.KeyCode and R.KeyCode~=Enum.KeyCode.Unknown then
N(R.KeyCode,'From input box')end K:set(false)task.wait()v:update('boolean',false)else if R.KeyCode and R.KeyCode==aF(L)
and not S and not aF(v.boolean)then t:update('boolean',not aF(t.boolean))end end end)d.add(R)aH(aG.get'container',15)end
end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)return setmetatable({},{__index=function(ae,af
)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[81]=function()local aa,
ab,ac=a(81)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.
AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.
New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[82]=function()local aa,ab,ac=a(
82)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag or 0 return ae.
New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...
)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or
Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,HorizontalAlignment=ah or Enum.
HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()
end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return
function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingLeft=UDim.new(0,...),PaddingRight=UDim.new(0,
...),PaddingTop=UDim.new(0,...),PaddingBottom=UDim.new(0,...)}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=UDim
.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[1]),PaddingLeft=UDim.new(0,af[2])}elseif#af==3
then return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[3]
),PaddingLeft=UDim.new(0,af[2])}else return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]
),PaddingBottom=UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[4])}end end end)()end,[85]=function()local aa,ab,ac=a(85)
local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number?,ag:number?)return ae
.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[86]=function()local aa,ab,ac=a(86)local ad
return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else
error('no utility: '..af)end end})end)()end,[87]=function()local aa,ab,ac=a(87)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end
end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.
Bundles.services)function af.add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do if typeof(
ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil end end return af end)()end,[89]=function()local aa,ab,ac=a(
89)local ad return(function(...)local ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return
function(af:string,ag:Enum.FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=
ah or Enum.FontStyle.Normal if ae[af]then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[90]=
function()local aa,ab,ac=a(90)local ad return(function(...)local ae,af={},{}function ae.cloneref(ag)if cloneref then
return cloneref(ag)else return ag end end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil
function ae.isfile(ag:string)if isfile then return isfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag
:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then
return false end return true end end function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else local ah,ai
=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if
ah==nil then ai=true end end if ai then return false end return true end end function ae.writefile(ag:string,ah:string)
if writefile then return writefile(ag,ah)else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=
ai[ak]elseif not ai[ak]then ai[ak]=ah end end end end function ae.delfile(ag:string)if delfile then return delfile(ag)
else local ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[al]=nil else ai=ah
end end end end function ae.readfile(ag:string)if readfile then return readfile(ag)else local ah,ai=af,false if ag:find
'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai then warn
'readfile: no file'return nil end return ah end end function ae.makefolder(ag:string)if makefolder then return
makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else ah=ah[
aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if listfiles then return listfiles(ag)else local ah
,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]
end if ai or typeof(ah)=='string'then warn'no folder exists'return nil end local aj={}for ak,al in ah do if typeof(al)==
'string'then table.insert(aj,ak)end end return aj end end return ae end)()end,[91]=function()local aa,ab,ac=a(91)local
ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,
al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(aq,ar,as)return aq+(ar-aq)*as end local function aq(
ar)if not(ao)then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,
ar*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,an.Y.Offset,ar*ah))return end local as=(am-ai:GetMouseLocation())local at,au=(
ao.X.Offset-as.X),(ao.Y.Offset-as.Y)an=UDim2.new(ao.X.Scale,at,ao.Y.Scale,au)ak.Position=UDim2.new(ao.X.Scale,ap(ak.
Position.X.Offset,at,ar*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,au,ar*ah))end ak.InputBegan:Connect(function(ar)if ar.
UserInputType==Enum.UserInputType.MouseButton1 or ar.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position
am=ai:GetMouseLocation()ar.Changed:Connect(function()if ar.UserInputState==Enum.UserInputState.End then al=false end end
)end end)local ar=aj.Heartbeat:Connect(aq)return ar end end)()end,[92]=function()local aa,ab,ac=a(92)local ad return(
function(...)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end
)()end,[93]=function()local aa,ab,ac=a(93)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=
Instance.new'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.
Parent.Bundles.services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[94]=function()local aa,ab,ac=a(94)
local ad return(function(...)local ae=string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],''
)local function af(ag)if ag>0 then return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[95]=
function()local aa,ab,ac=a(95)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).
Observer,ac(ab.Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(
function()if typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if
ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=
nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[96]=function()local aa,ab,ac=a(96)local
ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.
Tween(af(ag),ah)end end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:table,
af:table,ag:table?):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(not ae[aj]or typeof(ae[aj])~=typeof(ak))and
not table.find(ag,aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah
,ai end end)()end},{{1,2,{'Darius'},{{63,1,{'components'},{{70,2,{'paragraph'}},{65,2,{'divider'}},{76,2,{'warn'}},{67,2
,{'keybind'}},{68,2,{'label'}},{73,2,{'tabFrame'}},{64,2,{'button'}},{69,2,{'notification'}},{75,2,{'toggle'}},{72,2,{
'tabButton'}},{74,2,{'textbox'}},{66,2,{'dropdown'}},{71,2,{'slider'}}}},{86,2,{'utilities'},{{92,2,{'get'}},{97,2,{
'typecheck'}},{87,2,{'animate'}},{96,2,{'tween'}},{88,2,{'connections'}},{89,2,{'customFont'}},{90,2,{'customFunctions'}
},{94,2,{'randomString'}},{91,2,{'drag'}},{93,2,{'getStringBounds'}},{95,2,{'references'}}}},{2,2,{'Bundles'},{{3,2,{
'Fusion'},{{48,2,{'Types'}},{39,2,{'PubTypes'}},{49,1,{'Utility'},{{52,2,{'doNothing'}},{53,2,{'isSimilar'}},{50,2,{
'None'}},{51,2,{'cleanup'}},{56,2,{'xtypeof'}},{54,2,{'needsDestruction'}},{55,2,{'restrictRead'}}}},{22,1,{'Instances'}
,{{28,2,{'OnEvent'}},{29,2,{'Out'}},{23,2,{'Children'}},{26,2,{'New'}},{25,2,{'Hydrate'}},{27,2,{'OnChange'}},{32,2,{
'defaultProps'}},{31,2,{'applyInstanceProps'}},{24,2,{'Cleanup'}},{30,2,{'Ref'}}}},{40,1,{'State'},{{42,2,{'ForKeys'}},{
44,2,{'ForValues'}},{41,2,{'Computed'}},{45,2,{'Observer'}},{43,2,{'ForPairs'}},{47,2,{'unwrap'}},{46,2,{'Value'}}}},{4,
1,{'Animation'},{{7,2,{'Tween'}},{8,2,{'TweenScheduler'}},{5,2,{'Spring'}},{10,2,{'lerpType'}},{13,2,{'unpackType'}},{12
,2,{'springCoefficients'}},{6,2,{'SpringScheduler'}},{11,2,{'packType'}},{9,2,{'getTweenRatio'}}}},{33,1,{'Logging'},{{
36,2,{'logWarn'}},{34,2,{'logError'}},{38,2,{'parseError'}},{37,2,{'messages'}},{35,2,{'logErrorNonFatal'}}}},{16,1,{
'Dependencies'},{{21,2,{'useDependency'}},{18,2,{'initDependency'}},{17,2,{'captureDependencies'}},{19,2,{'sharedState'}
},{20,2,{'updateAll'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}}}},{60,2,{'services'}},{58,2,{'icons'}},{57,2,{'data'}},{59
,2,{'lucide'}},{61,2,{'themeSystem'},{{62,2,{'default'}}}}}},{80,2,{'simpleElements'},{{84,2,{'UIPadding'}},{81,2,{
'UIAspectRatioConstraint'}},{83,2,{'UIListLayout'}},{82,2,{'UICorner'}},{85,2,{'UITextSizeConstraint'}}}},{77,2,{
'darius.story'}},{78,1,{'layouts'},{{79,2,{'main'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,
unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay,az,aA=aj.insert,aj.remove,aj.
freeze or function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao
,'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,aG,aH,b,c,d=aB or function(aC,
...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},
{}local e,f={GetFullName={{},function(e)local f,g=e.Name,e.Parent while g do f=g.Name..'.'..f g=g.Parent end return f
end},GetChildren={{},function(e)local f={}for g in ai,d[e]do au(f,g)end return f end},GetDescendants={{},function(e)
local f={}for g in ai,d[e]do au(f,g)for h,i in ai,g:GetDescendants()do au(f,i)end end return f end},FindFirstChild={{
'string','boolean?'},function(e,f,g)local h=d[e]for i in ai,h do if i.Name==f then return i end end if g then for j in
ai,h do return j:FindFirstChild(f,true)end end end},FindFirstAncestor={{'string'},function(e,f)local g=e.Parent while g
do if g.Name==f then return g end g=g.Parent end end},WaitForChild={{'string','number?'},function(e,f)return e:
FindFirstChild(f)end}},{}for g,h in ai,e do local i,j,k=h[1],h[2],{}for l,m in ai,i do local n,o=az(m,'^([^%?]+)(%??)')k
[l]={n,o}end f[g]=function(n,...)if not d[n]then ah("Expected ':' not '.' calling member function "..g,2)end local o={
...}for p,t in ai,k do local u=o[p]local v,E,F=an(u),t[1],t[2]if u==nil and not F then ah('Argument '..u..
' missing or nil',3)end if E~='any'and v~=E and not(v=='nil'and F)then ah('Argument '..p..' expects type "'..E..
'", got "'..v..'"',2)end end return j(n,...)end end local function i(j,k,l)local m,n=(ag({},{__mode='k'}))local function
o(p)ah(p..' is not a valid (virtual) member of '..j..' "'..k..'"',3)end local function p(t)ah(
'Unable to assign (virtual) property '..t..'. Property is read only',3)end local t,u={},{}u.__metatable=false u.__index=
function(v,E)if E=='ClassName'then return j elseif E=='Name'then return k elseif E=='Parent'then return l elseif j==
'StringValue'and E=='Value'then return n else local F=f[E]if F then return F end end for F in ai,m do if F.Name==E then
return F end end o(E)end u.__newindex=function(v,E,F)if E=='ClassName'then p(E)elseif E=='Name'then k=F elseif E==
'Parent'then if F==t then return end if l~=nil then d[l][t]=nil end l=F if F~=nil then d[F][t]=true end elseif j==
'StringValue'and E=='Value'then n=F else o(E)end end u.__tostring=function()return k end ag(t,u)d[t]=m if l~=nil then d[
l][t]=true end return t end local function j(k,l)local m,n,o,p=k[1],k[2],k[3],k[4]local t=aD[n]local u=o and av(o,1)or t
local v=i(t,u,l)aE[m]=v if o then for E,F in ai,o do v[E]=F end end if p then for E,F in ai,p do j(F,v)end end return v
end local k=i('Folder','['..ad..']')for l,m in ai,ab do j(m,k)end for n,o in ai,aa do local p=aE[n]aF[p]=o aG[p]=n local
t=p.ClassName if t=='LocalScript'or t=='Script'then au(b,p)end end local function p(t)local u,v=t.ClassName,aH[t]if v
and u=='ModuleScript'then return ak(v)end local E=aF[t]local function F(G)G=aq(G)local H,I,J=t:GetFullName(),az(G,
'[^:]+:(%d+): (.+)')if not I or not at then return H..':*: '..(J or G)end I=ar(I)local K=aG[t]local L=at[K]local M=I-L+1
if M<0 then M='?'end return H..':'..M..': '..J end if u=='LocalScript'or u=='Script'then local G,H=ap(E)if not G then
ah(F(H),0)end else local G={ap(E)}local H=av(G,1)if not H then local I=av(G,1)ah(F(I),0)end aH[t]=G return ak(G)end end
function a(t)local u=aE[t]local function v(E,...)local F={ap(E,...)}local G=av(F,1)if not G then ah(F[1],3)end return
ak(F)end local E=aw(ag({},{__index=c,__newindex=function(E,F,G)c[F]=G end,__len=function()return#c end,__iter=function()
return ai,c end}))local F,G=aw{version=ac,envname=ad,shared=E,script=am,require=ao},u local function H(I,...)local J,K,L
=an(I),'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if J=='table'and d[I]
then if I.ClassName~='ModuleScript'then ah(K,2)elseif I==u then ah(L,2)end return p(I)elseif J=='string'and ay(I,1,1)~=
'@'then if#I==0 then ah('Attempted to call require with empty string',2)end local M=u if ay(I,1,1)=='/'then M=k elseif
ay(I,1,2)=='./'then I=ay(I,3)end local N for O in aA(I,'([^/]*)/?')do local P=O if O=='..'then P='Parent'end if P~=''
then local Q=M:FindFirstChild(P)if not Q then local R=M.Parent if R then Q=R:FindFirstChild(P)end end if Q then M=Q
elseif O~=N and O~='init'and O~='init.server'and O~='init.client'then ah('Virtual script path "'..I..'" not found',2)end
end N=O end if M.ClassName~='ModuleScript'then ah(K,2)elseif M==u then ah(L,2)end return p(M)end return v(ao,I,...)end
return F,G,H end for t,u in ai,b do aC(p,u)end return p(k:GetChildren()[1])