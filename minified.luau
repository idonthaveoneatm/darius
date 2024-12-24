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
''},'searchText')g.add({boolean=true},'isVisible')g.add({boolean=x.IsMobile},'isMobile')g.add({boolean=false},
'isListening')local A,B,C,D,E=g.add({list={},names={}},'flags'),g.add({boolean=false},'configLoaded'),g.add({boolean=
false},'useConfig'),(g.add{data=x})if x.UseConfig then C:update('boolean',x.UseConfig)E=x.Config local F,G={
'darius-configs',`/{E}`},''for H=1,#F do G=G..F[H]if not p.isfolder(G)then p.makefolder(G)end end E=G..'/config.json'if
not p.isfile(E)then p.writefile(E,'{}')end end t(x)local F,G,H=n.get'tabButtonList',n.get'tabFrameList',k.New
'BindableEvent'{}v.OnDestruction=H.Event v[D.uid]={}local I=v[D.uid]function I.Tab(J,K)local L=u('tabButton',F,K)local M
=u('tabFrame',G,{uid=L.uid})I[L.uid]={}local N=I[L.uid]function N.Button(O,P)P.tab=L return u('button',M,P)end function
N.Toggle(O,P)P.tab=L return u('toggle',M,P)end function N.Dropdown(O,P)P.tab=L return u('dropdown',M,P)end function N.
Label(O,P)return u('label',M,{tab=L,Text=P})end function N.Paragraph(O,P)P.tab=L return u('paragraph',M,P)end function N
.TextBox(O,P)P.tab=L return u('textbox',M,P)end function N.Slider(O,P)P.tab=L return u('slider',M,P)end function N.
Keybind(O,P)P.tab=L return u('keybind',M,P)end function N.Divider(O)return u('divider',M,{tab=L})end return I[L.uid]end
function v.Notify(J,K)return u('notification',n.get'notificationList',K)end function v.Destroy(J)o:deleteConnections()n:
clear()H:Fire()end function v.LoadConfig(J)if not x.UseConfig then return end A:update('list',j:JSONDecode(p.readfile(E)
))l(A.list):onChange(function()p.writefile(E,j:JSONEncode(r(A.list)))end)B:update('boolean',true)end function v.SetTheme
(J,K)local L,M=s({['New Theme']=K},{['New Theme']={}})assert(L,table.concat(M,'\n'))h.create(K)end if p.getgenv then p.
getgenv().dariusInstance=v else _G.dariusInstance=v end return v[D.uid]end return v end)()end,function()local b,c,d=a(2)
local e return(function(...)return setmetatable({},{__index=function(f,g)if c:FindFirstChild(g)then return d(c[g])else
error('no bundle: '..g)end end})end)()end,function()local b,c,d=a(3)local e return(function(...)local f,g=d(c.PubTypes),
d(c.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>export type CanBeState<T> =PubTypes.
CanBeState<T>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value<T>export type Computed<T> =PubTypes
.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys<KI,KO> =PubTypes.ForKeys<KI,KO>
export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.Observer export type Tween<T> =
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
and{}or''},{f.Default and''or'Default'})assert(Q,table.concat(R,'\n'))assert(f.Regex and f.Regex''~=nil,'no work regex')
local S,T,U,V,W,X,Y,Z,_,ab,ac,ad,ae,af,ag,ah=h.find'selectedTab',h.find'useConfig',h.find'flags',h.find'configLoaded',h.
find'searchText',h.add(f),f.Parent,f.Name,f.Callback,n{},f.IsEnabled or n(true),f.DisabledText or n'Component Disabled',
f.Regex or n(function(S)return S end),f.Multiselect or n(false),f.FLAG or n'',false if E(ag)~=''then local ai=E(U.names)
assert(not table.find(ai,E(ag)),('FLAG "%s" already exists'):format(E(ag)))table.insert(ai,E(ag))U:update('names',ai)ah=
true end local ai,aj,ak,al,am,an,ao=n(),n(),n(false),n(E(af)and{}or''),n{},n{},n(false)o(am):onChange(function()if#E(am)
==#E(ab)then ao:set(true)else ao:set(false)end if E(af)then local ap={}for aq,ar in E(am)do table.insert(ap,E(ae)(ar))
end task.spawn(E(_),ap)al:set(E(am))else task.spawn(E(_),E(ae)(E(am)[1]))al:set(E(ae)(E(am)[1]))end end)o(ab):onChange(
function()if#E(am)==#E(ab)then ao:set(true)else ao:set(false)end end)local ap=n(E(S.string)==E(X.tab).uid)o(S.string):
onChange(function()ap:set(E(S.string)==E(X.tab).uid)end)local aq=F(function()return E(ap)and 0 or 1 end,40,1)
local function ar()if E(V.boolean)then local as=E(U.list)[E(ag)]local at=G({[E(ag)]=as},{[E(ag)]={}})if as and at then
am:set(as)end o(am):onChange(function()local au=E(U.list)au[E(ag)]=E(am)U:update('list',au)end)end end l'Frame'{Parent=Y
,Visible=t(function()if E(W.string)~=''and not string.find(E(Z):lower(),E(W.string):lower())then return false end return
true end),Size=F(function()if E(ak)and E(ai)then local as,at=E(ai),3 for au,av in as:GetChildren()do if av:IsA
'UIListLayout'or av:IsA'UICorner'or not av.Visible then continue end at+=(4+av.Size.Y.Offset)end return UDim2.new(1,0,0,
at)end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=i.background2,BackgroundTransparency=aq,ClipsDescendants=
true,[u]=ai,[m]={L(6),J(M.LayoutOrder,N.Vertical,O.Center,P.Top,UDim.new(0,4)),l'TextButton'{Interactable=t(function()if
not E(ac)then return false end return E(ap)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[p'Activated']=
function()ak:set(not E(ak))end,[m]={l'Frame'{ZIndex=2,Visible=t(function()if not E(ac)then return true end return false
end),BackgroundTransparency=F(function()return E(ap)and 0.2 or 1 end,40,1),BackgroundColor3=i.disabledBackground,Size=
UDim2.fromScale(1,1),[m]={L(6),l'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=j.lock,ImageColor3=i.disabledText,ImageTransparency=aq},l'TextLabel'{
FontFace=H('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=i.
disabledText,TextTransparency=aq,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=t(
function()return E(ad)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[m]={K(0,5)}}}},l'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[m]={K(8),l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=UDim2.
new(1,-39,0,18),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2
.new(0,0,0.5,0),Text=t(function()if E(af)then return E(Z)..' '..tostring(#E(am))..'/'..tostring(#E(ab))end return E(Z)..
': '..E(al)end),TextTransparency=aq,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},l'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=t(function
()return E(af)and j.multiDropdown or j.normalDropdown end),ImageColor3=i.text2,ImageTransparency=aq}}}}},l'Frame'{Size=
UDim2.new(1,0,0,32),BackgroundTransparency=1,[m]={K(0,6),l'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=i.
background,BackgroundTransparency=aq,FontFace=H('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Left,TextScaled=true,PlaceholderText='Search',TextColor3=i.text,TextTransparency=aq,[u]=aj,[p'Changed']=function(as)
local at=E(aj)if as=='Text'and at and at.Text then local au=at.Text for av,aw in E(an)do if string.find(E(ae)(aw.Name),
au)or au==''then aw.Visible=true else aw.Visible=false end end end end,[m]={l'UITextSizeConstraint'{MinTextSize=0,
MaxTextSize=16},L(4),K(6,6,6,6)}}}},l'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=af,[m]={K(6,6,0,6
),l'TextButton'{Interactable=af,Size=UDim2.new(1,0,0,24),BackgroundTransparency=aq,BackgroundColor3=i.background,[p
'Activated']=function()local as={}if not E(ao)then for at,au in E(ab)do au=typeof(au)=='table'and au.Value or au table.
insert(as,E(ae)(au))end end am:set(as)end,[m]={L(4),K(8),l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size
=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=i.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position
=UDim2.new(0,0,0.5,0),Text=t(function()if E(ao)then return'Deselect All'end return'Select All'end),TextTransparency=aq,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},l'ScrollingFrame'{ZIndex=3,Size=UDim2.new(1,0,0,136),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[m]
={K(6,6,0,6),J(M.LayoutOrder,N.Vertical,O.Center,P.Top,UDim.new(0,6)),an}}}}o(ab):onChange(function()local as={}for at,
au in E(ab)do local av,aw,ax=(n(false))if typeof(au)=='table'then local ay,az=G(au,{Value='',Image=''},{au.Image and''or
'Image'})assert(ay,table.concat(az,'\n'))aw=au.Value ax=au.Image or nil else local ay,az=G({Item=au},{Item=''})assert(ay
,table.concat(az,'\n'))aw=au end o(am):onChange(function()if table.find(E(am),E(ae)(aw))then av:set(true)else av:set(
false)end end)local ay=l'TextButton'{Name=aw,Size=UDim2.new(1,0,0,28),BackgroundTransparency=aq,BackgroundColor3=i.
background,[p'Activated']=function()local ay=E(am)if E(af)then av:set(not E(av))if E(av)then table.insert(ay,E(ae)(aw))
else table.remove(ay,table.find(ay,E(ae)(aw)))end am:set(ay)else am:set{aw}ak:set(false)end end,[m]={L(4),K(8),J(M.
LayoutOrder,N.Horizontal,O.Left,P.Center,UDim.new(0,6)),l'Frame'{Visible=t(function()return E(af)and true or false end),
Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=aq,
BackgroundColor3=F(function()return E(av)and i.get'toggled'or i.get'selectedTab'end,40,1),[m]={L(6),l'ImageLabel'{Size=
UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=
j.check,ImageTransparency=F(function()if not E(ap)then return 1 end if E(av)then return 0 end return 1 end,40,1),
ImageColor3=i.selectedTab}}},l'ImageLabel'{Visible=t(function()return ax and true or false end),Size=UDim2.fromOffset(18
,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=ax,ImageTransparency=aq
,ImageColor3=i.text2},l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=t(function()return E(af)and UDim2.
new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=aw,TextTransparency=aq,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}table.insert(as,ay)end an:set(as)end)ab:set(E(f.Items))if E(T.boolean)and ah then if not E(V.boolean)
then o(V.boolean):onChange(ar)else ar()end end local as={}function as.SetName(at,au)local av,aw=G({SetName=au},{SetName=
''})assert(av,table.concat(aw,'\n'))Z:set(au)end function as.SetItems(at,au)local av,aw=G({SetItems=au},{SetItems={}})
assert(av,table.concat(aw,'\n'))am:set{}ab:set(au)local ax,ay={},false for az,aA in E(ab)do local aB if typeof(aA)==
'table'then aB=aA.Value else aB=aA end if E(af)then if typeof(E(al))=='table'and table.find(E(al),E(ae)(aB))then table.
insert(ax,E(ae)(aB))ay=true end else if E(al)==E(ae)(aB)then ay=true task.spawn(E(_),E(ae)(aB))break end end end if ay
then if E(af)then am:set(ax)end end end function as.SelectItem(at,au)assert(not E(af),
':SelectItem requires Multiselect to be false')local av,aw=G({SelectItem=au},{SelectItem=''})assert(av,table.concat(aw,
'\n'))local ax=false for ay,az in E(ab)do local aA=az if typeof(az)=='table'then aA=az.Value end if E(ae)(aA)==E(ae)(au)
then ax=true break end end assert(ax,":SelectItem couldn't find "..au)am:set{au}end function as.SelectItems(at,au)
assert(E(af),':SelectItems requires Multiselect to be true')local av,aw=G({SelectItems=au},{SelectItems={}})assert(av,
table.concat(aw,'\n'))for ax,ay in au do local az=false for aA,aB in E(ab)do local aC=typeof(aB)=='table'and E(ae)(aB.
Value)or E(ae)(aB)if ay==aC then az=true break end end if az then au[ax]=E(ae)(ay)else warn(":SelectItems couldn't find"
,ay,'in Items. Removing it.')au[ax]=nil end end am:set(au)end function as.Enable(at)ac:set(true)end function as.Disable(
at)ac:set(false)end return as end end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services
local al,am=ak.UserInputService,ag.Fusion local an,ao,ap,aq,ar,as,at,au=am.New,am.Children,am.Value,am.Observer,am.
OnEvent,am.Computed,am.Ref,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,
au.customFont,au.references,au.drag,ac(ae.simpleElements)local b,c,d,e,f,g,h,i,j,k,l=aC.UIPadding,aC.UICorner,aC.
UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ab.Parent.warn),ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Bind=Enum.KeyCode.Q},{
af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind'})
assert(k,table.concat(l,'\n'))local m,n,o,p,t,u,v,E,F,G,H,I,J,K,L,M,N=ah.find'selectedTab',ah.find'currentBinds',ah.find
'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find
'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ap(true),af.DisabledText or ap
'Component Disabled',ap(),false local function O(P:EnumItem,Q:string)local R=av(n.binds)if table.find(R,P)then j((
'Key %s is already in use. %s'):format(P.Name,Q))else table.insert(R,P)if av(M)then table.remove(R,table.find(R,av(M)))
end n:update('binds',R)M:set(P)N=true end end if af.Bind then if not av(o.boolean)then O(av(af.Bind),'At property set')
end end local P,Q=af.FLAG or ap'',false if av(P)~=''then local R=av(p.names)assert(not table.find(R,av(P)),(
'FLAG "%s" already exists'):format(av(P)))table.insert(R,av(P))p:update('names',R)Q=true end local R=ap(av(m.string)==
av(G.tab).uid)aq(m.string):onChange(function()R:set(av(m.string)==av(G.tab).uid)end)local S,T=aw(function()return av(R)
and 0 or 1 end,40,1),ap(false)local U=al.InputBegan:Connect(function(U,V)if av(v.boolean)then return end if av(T)then if
U.KeyCode and U.KeyCode~=Enum.KeyCode.Unknown then O(U.KeyCode,'From input box')end T:set(false)task.wait()F:update(
'boolean',false)else if U.KeyCode and U.KeyCode==av(M)and not V and not av(F.boolean)and av(K)then task.spawn(av(J))end
end end)ay.add(U)local V=ap(false)local function W()if Q then if av(t.boolean)then local X=av(p.list)[av(P)]local Y=ax({
[av(P)]=X},{[av(P)]=''})if X and Y and Enum.KeyCode[X]~=nil then O(Enum.KeyCode[X],'From configLoad has FLAG')end aq(M):
onChange(function()local Z=av(p.list)Z[av(P)]=av(M).Name p:update('list',Z)end)end else if av(t.boolean)and not N then
task.wait()O(av(af.Bind),'From configLoad no FLAG')end end end local X local Y=an'TextButton'{Visible=as(function()if
not av(K)then return av(K)end return av(V)end),Parent=aA.get(av(E.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=av(I),FontFace=az('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.6,
TextTransparency=0.1,[ar'Activated']=function()if X then X:Disconnect()X=nil else task.spawn(av(J))end end,[ao]={b(4),c(
16),d(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=av(v.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=H,Visible=as(function()if av(u.string)~=''and not string.
find(av(I):lower(),av(u.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=as(function()if not av(K)then return true end return false end
),BackgroundTransparency=aw(function()return av(R)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ao]={c(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=S},an
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=S,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=as(function()return av(L)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ao]={b(0,5)}}}},an'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={e(f.LayoutOrder,g.Horizontal,h.Left,i.Center,UDim.new(0,3)),an
'TextButton'{Interactable=as(function()if not av(K)then return false end return av(R)end),Size=UDim2.new(0.225,0,1,0),
BackgroundColor3=ai.background2,BackgroundTransparency=S,[ar'Activated']=function()if av(v.boolean)then V:set(true)X=aB(
Y,15)return end T:set(true)F:update('boolean',true)end,[ao]={c(6),b(6),e(f.LayoutOrder,g.Horizontal,h.Left,i.Center,UDim
.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(v.boolean)and aj.
finger or aj.command,ImageColor3=ai.text2,ImageTransparency=S},an'TextLabel'{Visible=not av(v.boolean),Size=UDim2.new(1,
-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=S,Text=as(function()return av(T)and'Listening'or av(M)and av(
M).Name or'Waiting'end)},an'TextLabel'{Visible=av(v.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=as(function()return av(V)and'Move Bind'or'Place Bind'end),TextTransparency=S}}},an'TextButton'{Visible=V,
Interactable=as(function()if not av(K)then return false end return av(R)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=S,[ar'Activated']=function()V:set(false)Y.Position=UDim2.
fromScale(0.5,0.5)end,[ao]={c(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=
UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=S}}},an'Frame'{Size
=as(function()return UDim2.new(0.775,av(V)and-42 or-3,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=S
,[ao]={c(6),an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={b(8),e(f.LayoutOrder,g.Horizontal,h.Left,
i.Center,UDim.new(0,10)),an'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=I,TextTransparency=S,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(o.boolean)then if av(t.
boolean)then W()else aq(t.boolean):onChange(W)end end local Z={}function Z.SetName(_,aD)local aE,aF=ax({SetName=aD},{
SetName=''})assert(aE,table.concat(aF,'\n'))I:set(aD)end function Z.SetBind(aD,aE:EnumItem)local aF,_=ax({SetBind=aE},{
SetBind=Enum.keyCode.C})assert(aF,table.concat(_,'\n'))O(aE,'At :SetBind')end function Z.Enable(aD)K:set(true)end
function Z.Disable(aD)K:set(false)end return Z end end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function
(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as=ap.
UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate,as.customFont local ax,ay=au(af,{
Text=''})assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,aD=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.
Parent,af.Text local aE=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function()aE:set(at(az.string)==at(aB.
tab).uid)end)local aF=av(function()return at(aE)and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if at(aA.string)~=''
and not string.find(at(aD):lower(),at(aA.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36)
,Parent=aC,BackgroundTransparency=aF,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak'TextLabel'{FontFace=aw(
'Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=aF,Size=UDim2
.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,
TextColor3=ai.text,Text=an(function()return at(aD)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}
local b={}function b.SetText(c,d)local e,f=au({SetText=d},{SetText=''})assert(e,table.concat(f,'\n'))aD:set(d)end return
b end end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.
Children,ai.Value,ai.Computed,ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao.getStringBounds,ao.customFont
,ao.typecheck,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UICorner,au.UIPadding,au.UIListLayout,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title='',Body='',Duration=1,Image=''
,ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and
''or'Buttons'})assert(aC,table.concat(aD,'\n'))local aE,aF,b,c,d,e,f,g,h,i,j=am(af.Title),am(af.Body),am(af.Duration),
am(af.Image),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250
)local k=am(ar(ap(aF),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=ap(j)-8-(c and 32 or 0)}))local l=am(
20+math.clamp(ap(k).Y+4+10+(#ap(e)>0 and 26 or 0),#ap(e)>0 and 56 or 30,9e9))local function m(n,o)local p=1 for t=1,n do
p=p*10 end local t=tostring(math.round(o*p)/p)local u=string.split(t,'.')if#u==1 then local v=''for E=1,n do v=v..'0'end
t=t..'.'..v end return t end local n,o={}for p,t in ap(e)do local u,v=at({Button=t},{Button={}})assert(u,table.concat(v,
'\n'))u,v=at(t,{Name='',Callback=function()end})assert(u,table.concat(v,'\n'))local E,F=t.Name,t.Callback local G=aj
'TextButton'{Size=UDim2.new(1/#ap(e),-2,1,-4),TextSize=14,Text=E,FontFace=as('Montserrat',Enum.FontWeight.Bold),
BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(F)g:set(false)task.wait(
0.4)f:set(false)task.delay(0.3,function()h:set(true)end)task.wait(2)o:Destroy()end,[al]={av(4)}}table.insert(n,G)end o=
aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(j),ap(f)and ap(l)+5 or
0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(h)end),Interactable=g,
AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.fromOffset(ap(j),ap(l)),[
ak'Activated']=function()g:set(false)task.wait(0.4)f:set(false)task.delay(0.3,function()h:set(true)end)task.wait(2)o:
Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=UDim2.fromOffset(ap(j),ap(l)),
Position=aq(function()return UDim2.fromScale(ap(g)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),ax(ay.LayoutOrder,az.Horizontal
,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=c and true or false,Size=UDim2.new(0,24,1,0),
BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=c,ImageColor3=d}}},aj'Frame'{Size=UDim2.new(1,c and-28 or 0,1,0)
,BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj'TextLabel'{Size=UDim2.new(1,0,0
,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextSize=16,RichText=true,TextColor3=ah.text,Text=aE},aj'TextLabel'{Size=UDim2.new(1,0,0,1),AutomaticSize=Enum.
AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Medium
),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,RichText=
true,TextColor3=ah.text2,Text=aF},aj'Frame'{Visible=an(function()return#ap(e)>0 and true or false end),Size=UDim2.new(1,
0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,UDim.new(0,2)),n}},aj
'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=i,TextColor3=ah.text,TextSize
=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()g:set(true)end)task
.spawn(function()repeat task.wait()until ap(g)local u,v=(tick())repeat v=tick()-u i:set(m(1,math.clamp(v,0,ap(b))))task.
wait()until v>ap(b)end)task.spawn(function()f:set(true)repeat task.wait()until ap(g)task.wait(ap(b))task.wait(0.2)g:set(
false)task.wait(0.4)f:set(false)task.delay(0.3,function()h:set(true)end)task.wait(2)o:Destroy()end)end end)()end,[70]=
function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,
aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap.UIPadding,ap.UITextSizeConstraint,ac(ae.utilities)
local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.customFont,at.typecheck local az,aA=ay(af,{Title='',Body=''
})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,b=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,
af.Title,af.Body local c=am(au(aB.string)==au(aD.tab).uid)ao(aB.string):onChange(function()c:set(au(aB.string)==au(aD.
tab).uid)end)local d,e=av(function()return au(c)and 0 or 1 end,40,1),am(0)task.spawn(function()e:set(aw(au(b),{Font=ax(
'Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)au(aE).Changed:Connect(
function(f)if f:lower()=='absolutesize'then e:set(aw(au(b),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=
math.round(au(aE).AbsoluteSize.X)}).Y)end end)ao(b):onChange(function()e:set(aw(au(b),{Font=ax('Montserrat',Enum.
FontWeight.Bold),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function()if au(aC.string)
~=''and not string.find(au(aF):lower(),au(aC.string):lower())and not string.find(au(b):lower(),au(aC.string):lower())
then return false end return true end),BackgroundColor3=ai.background2,Parent=aE,BackgroundTransparency=d,Size=an(
function()return UDim2.new(1,0,0,36+au(e))end),AutomaticSize=Enum.AutomaticSize.Y,[al]={aq(6),ar(6),ak'TextLabel'{Name=
'Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextTransparency=d,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=ax('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,Text=aF,[al]={as(1,18)}},ak'TextLabel'{Name='Body',TextWrapped=true,RichText=true,
Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=d,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=ax('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,
Text=b,Size=an(function()return UDim2.new(1,-4,0,au(e))end)}}}local f={}function f.SetBody(g,h)local i,j=ay({SetBody=h},
{SetBody=''})assert(i,table.concat(j,'\n'))b:set(h)end function f.SetTitle(g,h)local i,j=ay({SetTitle=h},{SetTitle=''})
assert(i,table.concat(j,'\n'))aF:set(h)end return f end end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.services local al,am,an=ak.UserInputService,ak.RunService,ag.Fusion local ao,ap,aq,ar,as,at,au,
av=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,an.Ref,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.
animate,av.typecheck,av.customFont,ac(ae.simpleElements)local aB,aC,aD,aE,aF,b,c,d,e=aA.UIListLayout,aA.UIPadding,aA.
UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ay(af,{Name='',DisabledText=
'',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0},{af.
DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.
Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace'
})assert(d,table.concat(e,'\n'))local f,g,h,i,j,k,l,m,n,o,p,t,u,v,E=ah.find'selectedTab',ah.find'useConfig',ah.find
'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.Max,af.Min,af.
DisplayAsPercent or aq(false),af.DecimalPlace or aq(0),af.IsEnabled or aq(true),af.DisabledText or aq
'Component Disabled'local F,G,H=af.Default and aq(math.clamp(aw(af.Default),aw(p),aw(o)))or aq(aw(p)),af.FLAG or aq'',
false if aw(G)~=''then local I=aw(h.names)assert(not table.find(I,aw(G)),('FLAG "%s" already exists'):format(aw(G)))
table.insert(I,aw(G))h:update('names',I)H=true end local I=aq(aw(f.string)==aw(k.tab).uid)ar(f.string):onChange(function
()I:set(aw(f.string)==aw(k.tab).uid)end)local J=ax(function()return aw(I)and 0 or 1 end,40,1)local function K(L,M,N,O,P)
return(1-((L-M)/(N-M)))*O+((L-M)/(N-M))*P end local function L(M)if aw(u)==0 then return math.floor(M)end return
tonumber(string.format('%.'..aw(u)..'f',M))end local M,N=aq(0),aq(aw(p))ar(N):onChange(function()M:set(K(aw(N),aw(p),aw(
o),0,1))if not aw(v)then return end task.spawn(aw(n),aw(N))end)local O,P,Q,R=aq(),aq(10),aq(),aq(false)al.InputEnded:
Connect(function(S)if(S.UserInputType==Enum.UserInputType.MouseButton1 or S.UserInputType==Enum.UserInputType.Touch)and
aw(R)then R:set(false)end end)local function S()if H then if aw(i.boolean)then local T=aw(h.list)[aw(G)]local U=ay({[aw(
G)]=T},{[aw(G)]=0})if T and U then N:set(math.clamp(T,aw(p),aw(o)))end ar(N):onChange(function()local V=aw(h.list)V[aw(G
)]=aw(N)h:update('list',V)end)end else if aw(i.boolean)then task.wait()N:set(aw(F))end end end ao'Frame'{Parent=l,
Visible=at(function()if aw(j.string)~=''and not string.find(aw(m):lower(),aw(j.string):lower())then return false end
return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=ax(function()if aw(I)
then return 0 end return 1 end,40,1),[ap]={aD(6),ao'Frame'{ZIndex=2,Visible=at(function()if not aw(v)then return true
end return false end),BackgroundTransparency=ax(function()return aw(I)and 0.2 or 1 end,40,1),BackgroundColor3=ai.
disabledBackground,Size=UDim2.fromScale(1,1),[ap]={aD(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,
ImageTransparency=J},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=J,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=at(function()return aw(E)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aC(
0,5)}}}},ao'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aB(aE.LayoutOrder,aF.Horizontal,b.Left,c.
Center,UDim.new(0,6)),aC(0,8),ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=J,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=m,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ao'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[ap]={aB(aE.LayoutOrder,aF.
Horizontal,b.Left,c.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[ap]={aD(4),aB(
aE.LayoutOrder,aF.Vertical,b.Right,c.Center,UDim.new(0,1)),ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),
Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=J,TextScaled=true,AnchorPoint=
Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=at(function()if aw(t)then return tostring(L(aw(M)*100))..'%'end
return aw(N)end),TextXAlignment=Enum.TextXAlignment.Right,RichText=true,AutomaticSize=Enum.AutomaticSize.X,[as'Changed']
=function(T)local U=aw(Q)if T=='AbsoluteSize'and U and U.AbsoluteSize then P:set(U.AbsoluteSize.X)end end,[au]=Q,[ap]={
aC(0,5,0,5)}},ao'Frame'{BackgroundColor3=ai.text2,BackgroundTransparency=ax(function()if aw(I)then return 0.5 end return
1 end,40,1),Size=ax(function()return UDim2.fromOffset(aw(P),2)end,40,1),[ap]={aD(0,1)}}}},ao'TextButton'{Interactable=
at(function()if not aw(v)then return false end return aw(I)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[
as'MouseButton1Down']=function()R:set(true)end,[as'TouchLongPress']=function()R:set(true)end,[as'InputBegan']=function(T
)if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch and aw(O)then local U,
V=al:GetMouseLocation().X,aw(O).Size.X.Offset local W=U-(aw(O).AbsolutePosition.X+V)while aw(R)and task.wait()do local X
=al:GetMouseLocation().X local Y=math.clamp(V+(X-U)+W,0,aw(O).AbsoluteSize.X)N:set(L(K(Y,0,aw(O).AbsoluteSize.X,aw(p),
aw(o))))am.RenderStepped:Wait()end end end,[au]=O,[ap]={aC(0,6),ao'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
fromScale(0,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=J,[ap]={aD(0,1)}},ao
'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=J
,Size=ax(function()return UDim2.new(aw(M),0,0,4)end,40,1),[ap]={aD(0,1),ao'ImageLabel'{Image=aj.circle,
BackgroundTransparency=1,ImageColor3=ai.selectedTab,ImageTransparency=J,Size=UDim2.fromOffset(18,18),Position=UDim2.new(
1,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),[ap]={ao'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,
0.5),Size=UDim2.fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ax(function()if aw(I)then return 0.8 end
return 1 end,40,1)}}}}}}}}}}}}}if aw(g.boolean)then if aw(i.boolean)then S()else ar(i.boolean):onChange(S)end else N:
set(aw(F))end local T={}function T.SetName(U,V)local W,X=ay({SetName=V},{SetName=''})assert(W,table.concat(X,'\n'))m:
set(V)end function T.SetValue(U,V)local W,X=ay({SetValue=V},{SetValue=0})assert(W,table.concat(X,'\n'))N:set(math.clamp(
V,aw(p),aw(o)))end function T.Enable(U)v:set(true)end function T.Disable(U)v:set(false)end return T end end)()end,[72]=
function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer,
aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local
av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UIPadding,au.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},{af.Image and''or'Image'})assert(aC,table.concat(aD,
'\n'))local aE,aF,b,c,d,e,f=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image
then f=af.Image e:set(true)end local g=am(false)an(aE.string):onChange(function()local h=aq(aE.string)g:set(h==b.uid)end
)ak'TextButton'{Name=b.uid,Parent=c,Size=UDim2.new(1,0,0,36),BackgroundColor3=ar(function()return aq(g)and ai.get
'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aE:update('string',b.uid)end,[al]={ax(4),aw(6),
av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=e,BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=f,ImageTransparency=ar(function()return aq(g)and 0 or 0.6 end,40,1)},
ak'TextLabel'{Size=aq(e)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=at('Montserrat',Enum.FontWeight.Bold),
TextColor3=ai.text2,TextScaled=true,Text=d,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=ar(function()return aq(g)and 0 or 0.6 end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}}}}if not aq(aF.boolean)then aF:update('boolean',true)aE:update('string',b.uid)end return b end end)()
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
typecheck,ac(ae.simpleElements)local ay,az,aA,aB,aC,aD,aE,aF,b,c=ax.UIPadding,ax.UICorner,ax.UITextSizeConstraint,ax.
UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.FillDirection,aw(af,{Name='',
Placeholder='',DisabledText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',FLAG='',IsEnabled=false,
Callback=function()end},{af.Placeholder and''or'Placeholder',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.DisabledText and''or'DisabledText'})assert(b,table.concat(c,'\n'))local d,e,f,g,h,i,j,k,l,m,n,o,p,t,u,v
,E,F=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.
Parent,af.Name,af.Callback,af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.OnlyNumbers or an(false
),af.Default or an'',af.OnLeave or an(false),af.ClearTextOnFocus or an(false),af.Placeholder or an'',af.FLAG or an'',
false if at(E)~=''then local G=at(f.names)assert(not table.find(G,at(E)),('FLAG "%s" already exists'):format(at(E)))
table.insert(G,at(E))f:update('names',G)F=true end local G=an(at(d.string)==at(i.tab).uid)ap(d.string):onChange(function
()G:set(at(d.string)==at(i.tab).uid)end)local H,I,J,K=au(function()return at(G)and 0 or 1 end,40,1),an(),an'',an(false)
local L,M=an(at(J)),an''ap(J):onChange(function()if at(o)then if tonumber(at(J))or at(J)==''then L:set(at(J))end else L:
set(at(J))end local N=at(I)N.Text=at(L)if at(t)then return end if at(o)then if(tonumber(at(J))or at(J)=='')and at(M)~=
at(J)then task.spawn(at(l),at(J))M:set(at(J))end else if at(M)==at(J)then return end task.spawn(at(l),at(J))M:set(at(J))
end end)ap(K):onChange(function()if at(t)and not at(K)then if at(o)then if(tonumber(at(J))or at(J)=='')and at(M)~=at(J)
then task.spawn(at(l),at(J))M:set(at(J))end else if at(M)==at(J)then return end task.spawn(at(l),at(J))M:set(at(J))end
end end)local function N()if F then if at(g.boolean)then local O=at(f.list)[at(E)]local P=aw({[at(E)]=O},{[at(E)]=''})if
O and P then if at(t)then K:set(true)end J:set(O)if at(t)then K:set(false)end end ap(L):onChange(function()local Q=at(f.
list)Q[at(E)]=at(L)f:update('list',Q)end)if not O then task.wait()if at(p)~=''then if at(t)then K:set(true)end J:set(at(
p))if at(t)then K:set(false)end end end end else if at(g.boolean)then task.wait()if at(p)~=''then if at(t)then K:set(
true)end J:set(at(p))if at(t)then K:set(false)end end end end end al'Frame'{Parent=j,Visible=ao(function()if at(h.string
)~=''and not string.find(at(k):lower(),at(h.string):lower())then return false end return true end),
BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[am]={al'Frame'{ZIndex=2,Visible=ao(function()if not at(m)then return
true end return false end),BackgroundTransparency=au(function()return at(G)and 0.2 or 1 end,40,1),BackgroundColor3=ai.
disabledBackground,Size=UDim2.fromScale(1,1),[am]={az(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,
ImageTransparency=H},al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=H,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=ao(function()return at(n)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={ay(
0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={aB(aC.LayoutOrder,aF.Horizontal,aE.Left,aD.
Center,UDim.new(0,3)),al'Frame'{Size=UDim2.new(0.65,-3,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=H,[am
]={az(6),ay(0,6),al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=k,TextTransparency=H,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},al'TextButton'{Interactable=ao(
function()if not at(m)then return false end return at(G)end),Size=UDim2.fromScale(0.35,1),BackgroundColor3=ai.
background2,BackgroundTransparency=H,[ar'Activated']=function()local O=at(I)if O then O:CaptureFocus()end end,[am]={az(6
),ay(0,6),aB(aC.LayoutOrder,aF.Horizontal,aE.Left,aD.Center,UDim.new(0,5)),al'ImageLabel'{ZIndex=0,Size=UDim2.
fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=H},al'TextBox'{
Interactable=ao(function()if not at(m)then return false end return at(G)end),Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=v,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextXAlignment=Enum.
TextXAlignment.Left,TextScaled=true,FontFace=av('Montserrat',Enum.FontWeight.Bold),Text=L,TextTransparency=H,
ClearTextOnFocus=u,[aq]=I,[ar'Changed']=function(O)local P=at(I)if P and P.Text and O=='Text'then J:set(P.Text)end end,[
ar'Focused']=function()K:set(true)end,[ar'FocusLost']=function()K:set(false)end,[am]={aA(1,16)}}}}}}}}if at(e.boolean)
then if at(g.boolean)then N()else ap(g.boolean):onChange(N)end else if at(p)~=''then if at(t)then K:set(true)end J:set(
at(p))if at(t)then K:set(false)end end end local O={}function O.SetName(P,Q)local R,S=aw({SetName=Q},{SetName=''})
assert(R,table.concat(S,'\n'))k:set(Q)end function O.SetInput(P,Q)local R,S=aw({SetInput=Q},{SetInput=at(o)and 1 or''})
assert(R,table.concat(S,'\n'))J:set(Q)end function O.Enable(P)m:set(true)end function O.Disable(P)m:set(false)end return
O end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am=ak.
UserInputService,ag.Fusion local an,ao,ap,aq,ar,as,at=am.New,am.Children,am.Value,am.Observer,am.OnEvent,am.Computed,ac(
ae.utilities)local au,av,aw,ax,ay,az,aA,aB=at.get,at.animate,at.typecheck,at.connections,at.customFont,at.references,at.
drag,ac(ae.simpleElements)local aC,aD,aE,aF,b,c,d,e,f,g,h=aB.UIPadding,aB.UICorner,aB.UITextSizeConstraint,aB.
UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),aw(af,
{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=false,Callback=function()end,LinkKeybind=true},{af.DisabledText
and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.LinkKeybind
and''or'LinkKeybind'})assert(g,table.concat(h,'\n'))g,h=aw(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or
'Bind'})assert(g,table.concat(h,'\n'))local i,j,k,l,m,n,o,p,t,u,v,E,F,G,H,I,J,K,L=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.find'instanceName',ah.find
'isMobile',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.Default or ap(false),af.IsEnabled or ap(true
),af.DisabledText or ap'Component Disabled',af.LinkKeybind or ap(false),ap(),false local function M(N:EnumItem,O:string)
local P=au(j.binds)if table.find(P,N)then f(('Key %s is already in use. %s'):format(N.Name,O))else table.insert(P,N)if
au(K)then table.remove(P,table.find(P,au(K)))end j:update('binds',P)K:set(N)L=true end end if au(J)and au(af.Bind)then
if not au(k.boolean)then M(au(af.Bind),'At property set')end end local N,O=af.FLAG or ap'',false if au(N)~=''then local
P=au(l.names)assert(not table.find(P,au(N)),('FLAG "%s" already exists'):format(au(N)))table.insert(P,au(N))l:update(
'names',P)O=true end local P=ap(au(i.string)==au(u.tab).uid)aq(i.string):onChange(function()P:set(au(i.string)==au(u.tab
).uid)end)local Q,R=av(function()return au(P)and 0 or 1 end,40,1),ap(false)aq(R):onChange(function()if au(H)then task.
spawn(au(F),au(R))end end)local S=ap(false)local T=al.InputBegan:Connect(function(T,U)if au(p.boolean)then return end if
au(S)then if T.KeyCode and T.KeyCode~=Enum.KeyCode.Unknown then M(T.KeyCode,'From input box')end S:set(false)task.wait()
t:update('boolean',false)else if T.KeyCode and T.KeyCode==au(K)and not U and not au(t.boolean)and au(H)then R:set(not
au(R))end end end)ax.add(T)local U=ap(false)local function V()if O then if au(m.boolean)then local W=au(l.list)[au(N)]
local X=aw({[au(N)]=W},{[au(N)]={}})if W and X and W.boolean then if W.keycode and au(J)then M(Enum.KeyCode[W.keycode],
'From configLoad FLAG')end R:set(W.boolean)end aq(R):onChange(function()local Y=au(l.list)Y[au(N)]=Y[au(N)]or{}Y[au(N)].
boolean=au(R)l:update('list',Y)end)aq(K):onChange(function()local Y=au(l.list)Y[au(N)]=Y[au(N)]or{}Y[au(N)].keycode=au(K
).Name l:update('list',Y)end)if not W then task.wait()if au(J)then M(au(af.Bind),'From configLoad no FLAG')end R:set(au(
G))end end else if au(m.boolean)and not L then task.wait()if au(J)then M(au(af.Bind),'From configLoad no FLAG')end R:
set(au(G))end end end local W local X=an'TextButton'{Visible=as(function()if not au(H)then return au(H)end return au(U)
end),Parent=az.get(au(o.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(
0.5,0.5),TextScaled=true,Text=au(E),FontFace=ay('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[ar'Activated']=function()if
W then W:Disconnect()W=nil else R:set(not au(R))end end,[ao]={aC(4),aD(16),aE(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=au(p.
boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=v,Visible=
as(function()if au(n.string)~=''and not string.find(au(E):lower(),au(n.string):lower())then return false end return true
end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=as(function()if not au(H)then
return true end return false end),BackgroundTransparency=av(function()return au(P)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ao]={aD(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=Q},an'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=Q,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=as(function()return au(I)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,
[ao]={aC(0,5)}}}},an'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={aF(b.LayoutOrder,c.Horizontal,d.
Left,e.Center,UDim.new(0,3)),an'TextButton'{Interactable=as(function()if not au(H)then return false end return au(P)end)
,Size=as(function()return au(J)and UDim2.new(0.775,au(U)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.
background2,BackgroundTransparency=Q,[ar'Activated']=function()if not au(H)then return end R:set(not au(R))end,[ao]={aD(
6),an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={aC(8),aF(b.LayoutOrder,c.Horizontal,d.Left,e.
Center,UDim.new(0,10)),an'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,
0),BackgroundTransparency=Q,BackgroundColor3=av(function()return au(R)and ai.get'toggled'or ai.get'selectedTab'end,40,1)
,[ao]={aD(6),an'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,
0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=av(function()if not au(P)then return 1 end if au(R)then
return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},an'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=E,TextTransparency=Q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},
an'TextButton'{Visible=U,Interactable=as(function()if not au(H)then return false end return au(P)end),Size=UDim2.
fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=Q,[ar'Activated']=function()U:set(false)X.
Position=UDim2.fromScale(0.5,0.5)end,[ao]={aD(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=Q}}},an'TextButton'{Visible=J,Interactable=as(function()if not au(H)then return false end return au(P)
end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=Q,[ar'Activated']=function()if
au(p.boolean)then U:set(true)W=aA(X,15)return end S:set(true)t:update('boolean',true)end,[ao]={aD(6),aC(6),aF(b.
LayoutOrder,c.Horizontal,d.Left,e.Center,UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=au(p.boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=Q},an
'TextLabel'{Visible=not au(p.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=ay('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=Q,Text=
as(function()return au(S)and'Listening'or au(K)and au(K).Name or'Waiting'end)},an'TextLabel'{Visible=au(p.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=ay('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,Text=as(function()return au(U)and'Move Bind'or'Place Bind'
end),TextTransparency=Q}}}}}}}if au(k.boolean)then if au(m.boolean)then V()else aq(m.boolean):onChange(V)end else R:set(
au(G))end local Y={}function Y.SetName(Z,_)local aG,aH=aw({SetName=_},{SetName=''})assert(aG,table.concat(aH,'\n'))E:
set(_)end function Y.SetValue(aG,aH:boolean)local Z,_=aw({SetValue=aH},{SetValue=false})assert(Z,table.concat(_,'\n'))R:
set(aH)end function Y.SetBind(aG,aH:EnumItem)assert(au(J),'Requires LinkKeybind')local Z,_=aw({SetBind=aH},{SetBind=Enum
.keyCode.C})assert(Z,table.concat(_,'\n'))M(aH,'At :SetBind')end function Y.Enable(aG)H:set(true)end function Y.Disable(
aG)H:set(false)end return Y end end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag,ah,ai=ac(ae.Bundles),ac(ab.Parent.notification),ac(ae.utilities).references
local aj,ak=ag.icons,ag.themeSystem ah{Parent=ai.get'notificationList',Title='Darius Interface',Body=af,Duration=3,Image
=aj.alert,ImageColor=ak.get'red'}end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(...)end)()end
,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=
ac(ae.Bundles)local ah=ag.services local ai,aj,ak,al,am=ah.UserInputService,ag.themeSystem,ag.icons,ag.data,ag.Fusion
local an,ao,ap,aq,ar,as,at,au=am.New,am.Children,am.Value,am.Ref,am.Computed,am.Observer,am.OnEvent,ac(ae.simpleElements
)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UICorner,au.UITextSizeConstraint,au.UIPadding,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aE,aF,aG,aH,b,c,d,e,f,g,h,i,j=aD.get
,aD.references,aD.drag,aD.customFont,aD.animate,aD.connections,ac(ab.Parent.Parent.components.warn),ap(),ap(),ap(),ap(),
ap(),ap()aF.add(i,h,g,f,e,j)local k,l,m,n,o,p,t,u,v,E,F,G,H,I=al.find'absoluteOffset',al.find'instanceName',al.find
'selectedTab',al.find'searchText',al.find'currentBinds',al.find'isVisible',al.find'isMobile',al.find'isListening',ap(750
),ap(500),ap(false),ap(false),ap(false),ap(false)as(F):onChange(function()if aE(F)then G:set(not aE(G))task.wait(0.3)H:
set(not aE(H))task.wait(0.3)I:set(not aE(I))else I:set(not aE(I))task.wait(0.3)H:set(not aE(H))task.wait(0.3)G:set(not
aE(G))end end)as(H):onChange(function()v:set(aE(H)and 212 or 750)end)as(I):onChange(function()E:set(aE(I)and 74 or 500)
end)local J,K,L=ap(false),ap(),ap(false)local function M(N:EnumItem,O:string)local P=aE(o.binds)if table.find(P,N)then
d(('Key %s is already in use. %s'):format(N.Name,O))else table.insert(P,N)if aE(K)then table.remove(P,table.find(P,aE(K)
))end o:update('binds',P)K:set(N)L:set(true)end end if not aE(t.boolean)then M(af.HideBind,'init')end local N=ap''as(m.
string):onChange(function()local O=aE(m.string)local P=al.find(O)N:set(aE(P.Name):upper())end)local O,P an'ScreenGui'{
Name=aE(l.name),Parent=af.Parent or ah.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[aq]=i,[ao]={an'Frame'{Name=
'container',Visible=p.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=ar(function()return UDim2.new(0.5,0,0.5,aE(k.
number))end),Size=b(function()return UDim2.fromOffset(aE(v),aE(E))end,30,1),BackgroundColor3=aj.background,[aq]=e,[ao]={
aw(6),ay(16),av(az.LayoutOrder,aA.Horizontal,aB.Right,aC.Top,UDim.new(0,16)),an'Frame'{ZIndex=2,AnchorPoint=Vector2.new(
0,0.5),Size=b(function()return UDim2.new(0,math.clamp(aE(v)-32-180-16,212,9e9),aE(G)and 0 or 1,0)end,30,1),
BackgroundTransparency=1,ClipsDescendants=true,[ao]={an'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0
,10),BackgroundTransparency=1,Text=N,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,
FontFace=aH('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=aj.text,TextTransparency=0.95,TextScaled=true,[ao]={an
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]
={av(az.LayoutOrder,aA.Vertical,aB.Left,aC.Top,UDim.new(0,16)),an'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency
=1,[ao]={av(az.LayoutOrder,aA.Horizontal,aB.Left,aC.Top,UDim.new(0,10)),an'Frame'{Size=UDim2.new(0.65,0,1,0),
BackgroundTransparency=1,[ao]={av(az.LayoutOrder,aA.Vertical,aB.Left,aC.Top,UDim.new(0,4)),an'TextLabel'{Size=UDim2.new(
1,0,0.6,0),Text=af.Title,TextColor3=aj.text,FontFace=aH('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},an'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.
Description,TextColor3=aj.text2,FontFace=aH('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left}}},an'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=aj.background2,[
at'Activated']=function()local Q=aE(j)if Q then Q:CaptureFocus()end end,[ao]={ay(0,4),aw(6),av(az.LayoutOrder,aA.
Horizontal,aB.Center,aC.Center,UDim.new(0,4)),an'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image
=ak.search,ImageColor3=aj.text2},an'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=aj.text2,TextSize=16,FontFace=aH(
'Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=aj.text2,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[at'Changed']=function(Q)local R=aE(j)if Q
~='Text'and R and R.Text then return end n:update('string',R.Text)end,[aq]=j}}}}},an'Frame'{Name='tabFrameList',Size=
UDim2.new(1,0,1,-60),BackgroundTransparency=1,[aq]=g}}}}},an'Frame'{Size=b(function()return aE(I)and UDim2.new(0,180,0,
44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=aj.background2,ClipsDescendants=true,[ao]={aw(6),av(az.LayoutOrder,
aA.Vertical,aB.Center,aC.Top,UDim.new(0,8)),an'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ao]={av(az.
LayoutOrder,aA.Horizontal,aB.Center,aC.Center,UDim.new(0,4)),an'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=
aj.selectedTab,[at'Activated']=function()if aE(t.boolean)then L:set(true)P=aG(O,15)return end J:set(true)u:update(
'boolean',true)end,[ao]={aw(6),ay(6),av(az.LayoutOrder,aA.Horizontal,aB.Left,aC.Center,UDim.new(0,5)),an'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aE(t.boolean)and ak.finger or ak.command,
ImageColor3=aj.text2,ImageTransparency=0},an'TextLabel'{Visible=not aE(t.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aH('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=aj.text2,Text=ar(function()return aE(J)and'Listening'or aE(K)and aE(K).Name or'Waiting'
end)},an'TextLabel'{Visible=aE(t.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aH('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=aj.text2,Text=ar(function()
return aE(L)and'Move Bind'or'Place Bind'end)}}},an'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=aj.
selectedTab,[at'Activated']=function()F:set(not aE(F))end,[ao]={aw(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=ar(function()return aE(F)
and ak.minimize or ak.maximize end),ImageColor3=aj.text2,ImageTransparency=0}}},an'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=aj.selectedTab,[at'Activated']=function()if not aE(L)then ac(ae.components.notification){Parent=h,
Title='Darius Interface',Body=`You must {aE(t.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=ak.alert,ImageColor=aj.get'red'}return end p:update('boolean',not aE(p.boolean))end,[ao]={aw(6),an
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=ak.close,ImageColor3=aj.orange,ImageTransparency=0}}}}},an'ScrollingFrame'{Name=
'tabButtonList',Size=b(function()return aE(I)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[aq]=f,[ao]={av(az.LayoutOrder,aA.Vertical,aB.Left,aC.Top,UDim.new(0,6)),ay(0,10)}},an'TextButton'
{Size=UDim2.new(1,-10,0,24),BackgroundColor3=aj.selectedTab,[at'Activated']=function()c:deleteConnections()aF:clear()end
,[ao]={aw(4),ay(6),av(az.LayoutOrder,aA.Horizontal,aB.Left,aC.Center,UDim.new(0,4)),an'ImageLabel'{
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=aj.red,Image=ak.close,ImageTransparency=0.3},an
'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=aH('Montserrat',Enum.FontWeight.Bold),TextColor3=aj.red,TextScaled=true,
Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ao]={an
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},an'ScrollingFrame'{Name='notificationList',
BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),
ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,1,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=false,[aq]=
h,[ao]={av(az.LayoutOrder,aA.Vertical,aB.Right,aC.Bottom)}}}}O=an'TextButton'{Visible=ar(function()return(aE(L)and aE(t.
boolean))end),Interactable=ar(function()return(aE(L)and aE(t.boolean))end),Parent=aF.get(aE(l.name)),Size=UDim2.
fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text='Hide UI',
FontFace=aH('Montserrat',Enum.FontWeight.Bold),TextColor3=aj.mobileButtonText,BackgroundColor3=aj.mobileButtonBackground
,BackgroundTransparency=0.6,TextTransparency=0.1,[at'Activated']=function()if P then P:Disconnect()P=nil else p:update(
'boolean',not aE(p.boolean))end end,[ao]={ay(4),aw(16),ax(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5)
,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aE(t.boolean)and ak.
finger or ak.command,ImageColor3=aj.mobileButtonImage,ImageTransparency=0.8}}}local Q=ai.InputBegan:Connect(function(Q,R
)if aE(t.boolean)then return end if aE(J)then if Q.KeyCode and Q.KeyCode~=Enum.KeyCode.Unknown then M(Q.KeyCode,
'From input box')end J:set(false)task.wait()u:update('boolean',false)else if Q.KeyCode and Q.KeyCode==aE(K)and not R and
not aE(u.boolean)then p:update('boolean',not aE(p.boolean))end end end)c.add(Q)aG(aF.get'container',15)end end)()end,[80
]=function()local aa,ab,ac=a(80)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:
FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[81]=function()local aa,ab,ac=
a(81)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.
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
Bundles.services)function af.add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do ai:
Disconnect()ae[ah]=nil end end return af end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(...)local
ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.FontWeight?
,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal if ae[af]
then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[90]=function()local aa,ab,ac=a(90)local ad
return(function(...)local ae,af={},{}function ae.cloneref(ag)if cloneref then return cloneref(ag)else return ag end end
function ae.gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil function ae.isfile(ag:string)if isfile
then return isfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai
=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end
function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak
in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then
return false end return true end end function ae.writefile(ag:string,ah:string)if writefile then return writefile(ag,ah)
else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=ai[ak]elseif not ai[ak]then ai[ak]=ah end
end end end function ae.delfile(ag:string)if delfile then return delfile(ag)else local ah=af local ai,aj=ah,ag:split'/'
for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[al]=nil else ai=ah end end end end function ae.readfile(ag:
string)if readfile then return readfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[
ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai then warn'readfile: no file'return nil end return ah
end end function ae.makefolder(ag:string)if makefolder then return makefolder(ag)else local ah=af if ag:find'/'then for
ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else ah=ah[aj]end end else ah[ag]={}end end end function ae.
listfiles(ag:string)if listfiles then return listfiles(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:
split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai or typeof(ah)=='string'then warn
'no folder exists'return nil end local aj={}for ak,al in ah do if typeof(al)=='string'then table.insert(aj,ak)end end
return aj end end return ae end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)return function(ae
,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.
RunService,ae local function ap(aq,ar,as)return aq+(ar-aq)*as end local function aq(ar)if not(ao)then return end if not(
al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,ar*ah),ao.Y.Scale,ap(ak.Position.Y.
Offset,an.Y.Offset,ar*ah))return end local as=(am-ai:GetMouseLocation())local at,au=(ao.X.Offset-as.X),(ao.Y.Offset-as.Y
)an=UDim2.new(ao.X.Scale,at,ao.Y.Scale,au)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,at,ar*ah),ao.Y.Scale,
ap(ak.Position.Y.Offset,au,ar*ah))end ak.InputBegan:Connect(function(ar)if ar.UserInputType==Enum.UserInputType.
MouseButton1 or ar.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()ar.
Changed:Connect(function()if ar.UserInputState==Enum.UserInputState.End then al=false end end)end end)local ar=aj.
Heartbeat:Connect(aq)return ar end end)()end,[92]=function()local aa,ab,ac=a(92)local ad return(function(...)return
function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[93]=function
()local aa,ab,ac=a(93)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new
'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.
services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(
function(...)local ae=string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function
af(ag)if ag>0 then return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[95]=function()local
aa,ab,ac=a(95)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.
Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if
typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if
ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=
nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[96]=function()local aa,ab,ac=a(96)local
ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.
Tween(af(ag),ah)end end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:table,
af:table,ag:table?):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(not ae[aj]or typeof(ae[aj])~=typeof(ak))and
not table.find(ag,aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah
,ai end end)()end},{{1,2,{'Darius'},{{80,2,{'simpleElements'},{{82,2,{'UICorner'}},{84,2,{'UIPadding'}},{81,2,{
'UIAspectRatioConstraint'}},{83,2,{'UIListLayout'}},{85,2,{'UITextSizeConstraint'}}}},{77,2,{'darius.story'}},{63,1,{
'components'},{{71,2,{'slider'}},{75,2,{'toggle'}},{73,2,{'tabFrame'}},{76,2,{'warn'}},{69,2,{'notification'}},{74,2,{
'textbox'}},{66,2,{'dropdown'}},{70,2,{'paragraph'}},{65,2,{'divider'}},{67,2,{'keybind'}},{64,2,{'button'}},{72,2,{
'tabButton'}},{68,2,{'label'}}}},{86,2,{'utilities'},{{88,2,{'connections'}},{95,2,{'references'}},{92,2,{'get'}},{91,2,
{'drag'}},{93,2,{'getStringBounds'}},{96,2,{'tween'}},{90,2,{'customFunctions'}},{94,2,{'randomString'}},{87,2,{
'animate'}},{97,2,{'typecheck'}},{89,2,{'customFont'}}}},{78,1,{'layouts'},{{79,2,{'main'}}}},{2,2,{'Bundles'},{{59,2,{
'lucide'}},{3,2,{'Fusion'},{{49,1,{'Utility'},{{50,2,{'None'}},{52,2,{'doNothing'}},{51,2,{'cleanup'}},{54,2,{
'needsDestruction'}},{55,2,{'restrictRead'}},{53,2,{'isSimilar'}},{56,2,{'xtypeof'}}}},{48,2,{'Types'}},{14,1,{'Colour'}
,{{15,2,{'Oklab'}}}},{4,1,{'Animation'},{{8,2,{'TweenScheduler'}},{12,2,{'springCoefficients'}},{13,2,{'unpackType'}},{6
,2,{'SpringScheduler'}},{7,2,{'Tween'}},{11,2,{'packType'}},{10,2,{'lerpType'}},{5,2,{'Spring'}},{9,2,{'getTweenRatio'}}
}},{39,2,{'PubTypes'}},{40,1,{'State'},{{45,2,{'Observer'}},{41,2,{'Computed'}},{42,2,{'ForKeys'}},{44,2,{'ForValues'}},
{46,2,{'Value'}},{43,2,{'ForPairs'}},{47,2,{'unwrap'}}}},{33,1,{'Logging'},{{37,2,{'messages'}},{35,2,{
'logErrorNonFatal'}},{38,2,{'parseError'}},{36,2,{'logWarn'}},{34,2,{'logError'}}}},{22,1,{'Instances'},{{25,2,{
'Hydrate'}},{24,2,{'Cleanup'}},{30,2,{'Ref'}},{31,2,{'applyInstanceProps'}},{27,2,{'OnChange'}},{26,2,{'New'}},{28,2,{
'OnEvent'}},{32,2,{'defaultProps'}},{23,2,{'Children'}},{29,2,{'Out'}}}},{16,1,{'Dependencies'},{{20,2,{'updateAll'}},{
21,2,{'useDependency'}},{17,2,{'captureDependencies'}},{19,2,{'sharedState'}},{18,2,{'initDependency'}}}}}},{61,2,{
'themeSystem'},{{62,2,{'default'}}}},{58,2,{'icons'}},{57,2,{'data'}},{60,2,{'services'}}}}}}},'0.4.1','WaxRuntime',
string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au
,av,aw,ax,ay,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as
and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local
aC,aD,aE,aF,aG,aH,b,c,d=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]=
'LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local e,f={GetFullName={{},function(e)local f,g=e.Name,e.Parent
while g do f=g.Name..'.'..f g=g.Parent end return f end},GetChildren={{},function(e)local f={}for g in ai,d[e]do au(f,g)
end return f end},GetDescendants={{},function(e)local f={}for g in ai,d[e]do au(f,g)for h,i in ai,g:GetDescendants()do
au(f,i)end end return f end},FindFirstChild={{'string','boolean?'},function(e,f,g)local h=d[e]for i in ai,h do if i.Name
==f then return i end end if g then for j in ai,h do return j:FindFirstChild(f,true)end end end},FindFirstAncestor={{
'string'},function(e,f)local g=e.Parent while g do if g.Name==f then return g end g=g.Parent end end},WaitForChild={{
'string','number?'},function(e,f)return e:FindFirstChild(f)end}},{}for g,h in ai,e do local i,j,k=h[1],h[2],{}for l,m in
ai,i do local n,o=az(m,'^([^%?]+)(%??)')k[l]={n,o}end f[g]=function(n,...)if not d[n]then ah(
"Expected ':' not '.' calling member function "..g,2)end local o={...}for p,t in ai,k do local u=o[p]local v,E,F=an(u),t
[1],t[2]if u==nil and not F then ah('Argument '..u..' missing or nil',3)end if E~='any'and v~=E and not(v=='nil'and F)
then ah('Argument '..p..' expects type "'..E..'", got "'..v..'"',2)end end return j(n,...)end end local function i(j,k,l
)local m,n=(ag({},{__mode='k'}))local function o(p)ah(p..' is not a valid (virtual) member of '..j..' "'..k..'"',3)end
local function p(t)ah('Unable to assign (virtual) property '..t..'. Property is read only',3)end local t,u={},{}u.
__metatable=false u.__index=function(v,E)if E=='ClassName'then return j elseif E=='Name'then return k elseif E=='Parent'
then return l elseif j=='StringValue'and E=='Value'then return n else local F=f[E]if F then return F end end for F in ai
,m do if F.Name==E then return F end end o(E)end u.__newindex=function(v,E,F)if E=='ClassName'then p(E)elseif E=='Name'
then k=F elseif E=='Parent'then if F==t then return end if l~=nil then d[l][t]=nil end l=F if F~=nil then d[F][t]=true
end elseif j=='StringValue'and E=='Value'then n=F else o(E)end end u.__tostring=function()return k end ag(t,u)d[t]=m if
l~=nil then d[l][t]=true end return t end local function j(k,l)local m,n,o,p=k[1],k[2],k[3],k[4]local t=aD[n]local u=o
and av(o,1)or t local v=i(t,u,l)aE[m]=v if o then for E,F in ai,o do v[E]=F end end if p then for E,F in ai,p do j(F,v)
end end return v end local k=i('Folder','['..ad..']')for l,m in ai,ab do j(m,k)end for n,o in ai,aa do local p=aE[n]aF[p
]=o aG[p]=n local t=p.ClassName if t=='LocalScript'or t=='Script'then au(b,p)end end local function p(t)local u,v=t.
ClassName,aH[t]if v and u=='ModuleScript'then return ak(v)end local E=aF[t]local function F(G)G=aq(G)local H,I,J=t:
GetFullName(),az(G,'[^:]+:(%d+): (.+)')if not I or not at then return H..':*: '..(J or G)end I=ar(I)local K=aG[t]local L
=at[K]local M=I-L+1 if M<0 then M='?'end return H..':'..M..': '..J end if u=='LocalScript'or u=='Script'then local G,H=
ap(E)if not G then ah(F(H),0)end else local G={ap(E)}local H=av(G,1)if not H then local I=av(G,1)ah(F(I),0)end aH[t]=G
return ak(G)end end function a(t)local u=aE[t]local function v(E,...)local F={ap(E,...)}local G=av(F,1)if not G then ah(
F[1],3)end return ak(F)end local E=aw(ag({},{__index=c,__newindex=function(E,F,G)c[F]=G end,__len=function()return#c end
,__iter=function()return ai,c end}))local F,G=aw{version=ac,envname=ad,shared=E,script=am,require=ao},u local function H
(I,...)local J,K,L=an(I),'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if J==
'table'and d[I]then if I.ClassName~='ModuleScript'then ah(K,2)elseif I==u then ah(L,2)end return p(I)elseif J=='string'
and ay(I,1,1)~='@'then if#I==0 then ah('Attempted to call require with empty string',2)end local M=u if ay(I,1,1)=='/'
then M=k elseif ay(I,1,2)=='./'then I=ay(I,3)end local N for O in aA(I,'([^/]*)/?')do local P=O if O=='..'then P=
'Parent'end if P~=''then local Q=M:FindFirstChild(P)if not Q then local R=M.Parent if R then Q=R:FindFirstChild(P)end
end if Q then M=Q elseif O~=N and O~='init'and O~='init.server'and O~='init.client'then ah('Virtual script path "'..I..
'" not found',2)end end N=O end if M.ClassName~='ModuleScript'then ah(K,2)elseif M==u then ah(L,2)end return p(M)end
return v(ao,I,...)end return F,G,H end for t,u in ai,b do aC(p,u)end return p(k:GetChildren()[1])