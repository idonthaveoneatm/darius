local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,aq,ar,as,at,au={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i=f.data,f.themeSystem,f.services local j,k=i.HttpService,f.Fusion local l,m=
k.Observer,d(c.utilities)local n,o,p,q,r,s,t=m.references,m.connections,m.customFunctions,m.randomString,m.get,m.
typecheck,d(c.layouts.main)local function u(v,w,x)x.Parent=w return d(c.components[v])(x)end local v={}function v.Window
(w,x)if p.getgenv then if p.getgenv().dariusInstance then o:deleteConnections()n:clear()p.getgenv().dariusInstance=nil
end else if _G.dariusInstance then o:deleteConnections()n:clear()_G.dariusInstance=nil end end local y,z=s(x,{Title='',
Description='',HideBind=Enum.KeyCode.T,UseConfig=false,IsMobile=false,Theme={},noOffset=false,Parent=Instance.new'Part'}
,{x.noOffset and''or'noOffset',x.IsMobile and''or'IsMobile',x.UseConfig and''or'UseConfig',x.Theme and''or'Theme',x.
Parent and''or'Parent'})assert(y,table.concat(z,'\n'))y,z=s(x,{Config=''},{x.UseConfig and''or'Config'})assert(y,table.
concat(z,'\n'))h.create(x.Theme)g.add({string=''},'selectedTab')g.add({boolean=false},'isFirst')g.add({number=x.noOffset
and 0 or 58},'absoluteOffset')g.add({name=q(32)},'instanceName')g.add({binds={}},'currentBinds')g.add({string=''},
'searchText')g.add({boolean=true},'isVisible')g.add({boolean=x.IsMobile},'isMobile')g.add({boolean=false},'isListening')
local A,B,C,D,E=g.add({list={},names={}},'flags'),g.add({boolean=false},'configLoaded'),g.add({boolean=false},
'useConfig'),(g.add{data=x})if x.UseConfig then C:update('boolean',x.UseConfig)E=x.Config local F,G={'darius-configs',`/{
E}`},''for H=1,#F do G=G..F[H]if not p.isfolder(G)then p.makefolder(G)end end E=G..'/config.json'if not p.isfile(E)then
p.writefile(E,'{}')end end t(x)local F,G,H=n.get'tabButtonList',n.get'tabFrameList',k.New'BindableEvent'{}v.
OnDestruction=H.Event v[D.uid]={}local I=v[D.uid]function I.Tab(J,K)local L=u('tabButton',F,K)local M=u('tabFrame',G,{
uid=L.uid})I[L.uid]={}local N=I[L.uid]function N.Button(O,P)P.tab=L return u('button',M,P)end function N.Toggle(O,P)P.
tab=L return u('toggle',M,P)end function N.Dropdown(O,P)P.tab=L return u('dropdown',M,P)end function N.Label(O,P)return
u('label',M,{tab=L,Text=P})end function N.Paragraph(O,P)P.tab=L return u('paragraph',M,P)end function N.TextBox(O,P)P.
tab=L return u('textbox',M,P)end function N.Slider(O,P)P.tab=L return u('slider',M,P)end function N.Keybind(O,P)P.tab=L
return u('keybind',M,P)end function N.Divider(O)return u('divider',M,{tab=L})end return I[L.uid]end function v.Notify(J,
K)return u('notification',n.get'notificationList',K)end function v.Destroy(J)o:deleteConnections()n:clear()H:Fire()end
function v.LoadConfig(J)if not x.UseConfig then return end A:update('list',j:JSONDecode(p.readfile(E)))l(A.list):
onChange(function()p.writefile(E,j:JSONEncode(r(A.list)))end)B:update('boolean',true)end function v.SetTheme(J,K)local L
,M=s({['New Theme']=K},{['New Theme']={}})assert(L,table.concat(M,'\n'))h.create(K)end if p.getgenv then p.getgenv().
dariusInstance=v else _G.dariusInstance=v end return v[D.uid]end return v end)()end,function()local b,c,d=a(2)local e
return(function(...)return setmetatable({},{__index=function(f,g)if c:FindFirstChild(g)then return d(c[g])else error(
'no bundle: '..g)end end})end)()end,function()local b,c,d=a(3)local e return(function(...)local f,g=d(c.PubTypes),d(c.
Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>export type CanBeState<T> =PubTypes.CanBeState<T
>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value<T>export type Computed<T> =PubTypes.Computed<T>
export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys<KI,KO> =PubTypes.ForKeys<KI,KO>export type
ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.Observer export type Tween<T> =PubTypes.Tween<T>
export type Spring<T> =PubTypes.Spring<T>type Fusion={version:PubTypes.Version,New:(className:string)->((propertyTable:
PubTypes.PropertyTable)->Instance),Hydrate:(target:Instance)->((propertyTable:PubTypes.PropertyTable)->Instance),Ref:
PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey,Children:PubTypes.SpecialKey,Out:PubTypes.SpecialKey,OnEvent:(eventName:
string)->PubTypes.SpecialKey,OnChange:(propertyName:string)->PubTypes.SpecialKey,Value:<T>(initialValue:T)->Value<T>,
Computed:<T>(callback:()->T,destructor:((T)->())?)->Computed<T>,ForPairs:<KI,VI,KO,VO,M>(inputTable:CanBeState<{[KI]:VI}
>,processor:(KI,VI)->(KO,VO,M?),destructor:((KO,VO,M?)->())?)->ForPairs<KO,VO>,ForKeys:<KI,KO,M>(inputTable:CanBeState<{
[KI]:any}>,processor:(KI)->(KO,M?),destructor:((KO,M?)->())?)->ForKeys<KO,any>,ForValues:<VI,VO,M>(inputTable:CanBeState
<{[any]:VI}>,processor:(VI)->(VO,M?),destructor:((VO,M?)->())?)->ForValues<any,VO>,Observer:(watchedState:StateObject<
any>)->Observer,Tween:<T>(goalState:StateObject<T>,tweenInfo:TweenInfo?)->Tween<T>,Spring:<T>(goalState:StateObject<T>,
speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->(),doNothing:(...any)->()}return g('Fusion',{version={major=
0,minor=2,isRelease=true},New=d(c.Instances.New),Hydrate=d(c.Instances.Hydrate),Ref=d(c.Instances.Ref),Out=d(c.Instances
.Out),Cleanup=d(c.Instances.Cleanup),Children=d(c.Instances.Children),OnEvent=d(c.Instances.OnEvent),OnChange=d(c.
Instances.OnChange),Value=d(c.State.Value),Computed=d(c.State.Computed),ForPairs=d(c.State.ForPairs),ForKeys=d(c.State.
ForKeys),ForValues=d(c.State.ForValues),Observer=d(c.State.Observer),Tween=d(c.Animation.Tween),Spring=d(c.Animation.
Spring),cleanup=d(c.Utility.cleanup),doNothing=d(c.Utility.doNothing)})::Fusion end)()end,[5]=function()local b,c,d=a(5)
local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,q,r=d(f.PubTypes),d(f.Types),d(f.Logging.
logError),d(f.Logging.logErrorNonFatal),d(f.Animation.unpackType),d(f.Animation.SpringScheduler),d(f.Dependencies.
useDependency),d(f.Dependencies.initDependency),d(f.Dependencies.updateAll),d(f.Utility.xtypeof),d(f.State.unwrap),{}
local s,t={__index=r},{__mode='k'}function r.get(u,v:boolean?):any if v~=false then m(u)end return u._currentValue end
function r.setPosition(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u
._currentType)end u._springPositions=k(v,w)u._currentValue=v l.add(u)o(u)end function r.setVelocity(u,v:PubTypes.
Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end u.
_springVelocities=k(v,w)l.add(u)end function r.addVelocity(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType
then i('springTypeMismatch',nil,w,u._currentType)end local x=k(v,w)for y,z in ipairs(x)do u._springVelocities[y]+=z end
l.add(u)end function r.update(u):boolean local v=u._goalState:get(false)if v==u._goalValue then local w=q(u._damping)if
typeof(w)~='number'then j('mistypedSpringDamping',nil,typeof(w))elseif w<0 then j('invalidSpringDamping',nil,w)else u.
_currentDamping=w end local x=q(u._speed)if typeof(x)~='number'then j('mistypedSpringSpeed',nil,typeof(x))elseif x<0
then j('invalidSpringSpeed',nil,x)else u._currentSpeed=x end return false else u._goalValue=v local w,x=u._currentType,
typeof(v)u._currentType=x local y=k(v,x)local z=#y u._springGoals=y if x~=w then u._currentValue=u._goalValue local A,B=
table.create(z,0),table.create(z,0)for C,D in ipairs(y)do A[C]=D end u._springPositions=A u._springVelocities=B l.
remove(u)return true elseif z==0 then u._currentValue=u._goalValue return true else l.add(u)return false end end end
local function u<T>(v:PubTypes.Value<T>,w:PubTypes.CanBeState<number>?,x:PubTypes.CanBeState<number>?):Types.Spring<T>if
w==nil then w=10 end if x==nil then x=1 end local y={[v]=true}if p(w)=='State'then y[w]=true end if p(x)=='State'then y[
x]=true end local z=setmetatable({type='State',kind='Spring',dependencySet=y,dependentSet=setmetatable({},t),_speed=w,
_damping=x,_goalState=v,_goalValue=nil,_currentType=nil,_currentValue=nil,_currentSpeed=q(w),_currentDamping=q(x),
_springPositions=nil,_springGoals=nil,_springVelocities=nil},s)n(z)v.dependentSet[z]=true z:update()return z end return
u end)()end,[6]=function()local b,c,d=a(6)local e return(function(...)local f,g=cloneref and cloneref(game:GetService
'RunService')or game:GetService'RunService',c.Parent.Parent local h,i,j,k=d(g.Types),d(g.Animation.packType),d(g.
Animation.springCoefficients),d(g.Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local l,m,n:
Set<Spring>,o={},0.0001,{},os.clock()function l.add(p:Spring)p._lastSchedule=o p._startDisplacements={}p.
_startVelocities={}for q,r in ipairs(p._springGoals)do p._startDisplacements[q]=p._springPositions[q]-r p.
_startVelocities[q]=p._springVelocities[q]end n[p]=true end function l.remove(p:Spring)n[p]=nil end local function p()
local q:Set<Spring> ={}o=os.clock()for r in pairs(n)do local s,t,u,v=j(o-r._lastSchedule,r._currentDamping,r.
_currentSpeed)local w,x,y,z,A=r._springPositions,r._springVelocities,r._startDisplacements,r._startVelocities,false for
B,C in ipairs(r._springGoals)do local D,E=y[B],z[B]local F,G=D*s+E*t,D*u+E*v if math.abs(F)>m or math.abs(G)>m then A=
true end w[B]=F+C x[B]=G end if not A then q[r]=true end end for s in pairs(n)do s._currentValue=i(s._springPositions,s.
_currentType)k(s)end for t in pairs(q)do n[t]=nil end end f:BindToRenderStep('__FusionSpringScheduler',Enum.
RenderPriority.First.Value,p)return l end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)local f=c.
Parent.Parent local g,h,i,j,k,l,m,n,o=d(f.PubTypes),d(f.Types),d(f.Animation.TweenScheduler),d(f.Dependencies.
useDependency),d(f.Dependencies.initDependency),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Utility.xtypeof)
,{}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false then j(t)end return t._currentValue
end function o.update(t):boolean local u=t._goalState:get(false)if u==t._nextValue and not t._currentlyAnimating then
return false end local v=t._tweenInfo if t._tweenInfoIsState then v=v:get()end if typeof(v)~='TweenInfo'then m(
'mistypedTweenInfo',nil,typeof(v))return false end t._prevValue=t._currentValue t._nextValue=u t._currentTweenStartTime=
os.clock()t._currentTweenInfo=v local w=v.DelayTime+v.Time if v.Reverses then w+=v.Time end w*=v.RepeatCount+1 t.
_currentTweenDuration=w i.add(t)return false end local function t<T>(u:PubTypes.StateObject<PubTypes.Animatable>,v:
PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local w=u:get(false)if v==nil then v=TweenInfo.new()end local x,y={[u]=
true},n(v)=='State'if y then x[v]=true end local z=v if y then z=z:get()end if typeof(z)~='TweenInfo'then l(
'mistypedTweenInfo',nil,typeof(z))end local A=setmetatable({type='State',kind='Tween',dependencySet=x,dependentSet=
setmetatable({},q),_goalState=u,_tweenInfo=v,_tweenInfoIsState=y,_prevValue=w,_nextValue=w,_currentValue=w,
_currentTweenInfo=v,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},p)k(A)u.dependentSet[A]=
true return A end return t end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f,g=cloneref and
cloneref(game:GetService'RunService')or game:GetService'RunService',c.Parent.Parent local h,i,j,k,l=d(g.Types),d(g.
Animation.lerpType),d(g.Animation.getTweenRatio),d(g.Dependencies.updateAll),{}type Set<T> ={[T]:any}type Tween=Types.
Tween<any>local m,n:Set<Tween> ={__mode='k'},{}setmetatable(n,m)function l.add(o:Tween)n[o]=true end function l.remove(o
:Tween)n[o]=nil end local function o()local p=os.clock()for q:Tween in pairs(n::any)do local t=p-q.
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
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[59]=function()local b,c,d=a(59)local e
return(function(...)end)()end,[73]=function()local b,c,d=a(73)local e return(function(...)local f=c.Parent.Parent return
function(g)local h=d(f.Bundles)local i,j=h.data,h.Fusion local k,l,m,n=j.New,j.Children,j.Computed,d(f.simpleElements)
local o,p,q,t,u,v,E=n.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,d(f
.utilities).get,i.find'selectedTab'return k'ScrollingFrame'{ZIndex=m(function()return(v(E.string)==g.uid)and 1 or 0 end)
,Name=g.uid,Parent=g.Parent,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[l]={o(p.LayoutOrder,q.
Vertical,t.Center,u.Top,UDim.new(0,4))}}end end)()end,[86]=function()local b,c,d=a(86)local e return(function(...)return
setmetatable({},{__index=function(f,g)if c:FindFirstChild(g)then return d(c[g])else error('no utility: '..g)end end})end
)()end,[93]=function()local b,c,d=a(93)local e return(function(...)return function(f:string,g)f=f or''local h=Instance.
new'GetTextBoundsParams'h.Text=f h.Font=g.Font h.Size=g.Size h.Width=g.Width local i=d(c.Parent.Parent.Bundles.services)
.TextService return i:GetTextBoundsAsync(h)end end)()end,[43]=function()local b,c,d=a(43)local e return(function(...)
local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,q,t=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f
.Dependencies.initDependency),d(f.Dependencies.useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.
Logging.logError),d(f.Logging.logWarn),d(f.Utility.cleanup),d(f.Utility.needsDestruction),{}local u,v={__index=t},{
__mode='k'}function t.get(E,F:boolean?):any if F~=false then k(E)end return E._outputTable end function t.update(E):
boolean local F=E._inputIsState local G,H,I,J,K=if F then E._inputTable:get(false)else E._inputTable,E._oldInputTable,E.
_keyIOMap,E._meta,false for L in pairs(E.dependencySet)do L.dependentSet[E]=nil end E._oldDependencySet,E.dependencySet=
E.dependencySet,E._oldDependencySet table.clear(E.dependencySet)if F then E._inputTable.dependentSet[E]=true E.
dependencySet[E._inputTable]=true end E._oldOutputTable,E._outputTable=E._outputTable,E._oldOutputTable local M,N=E.
_oldOutputTable,E._outputTable table.clear(N)for O,P in pairs(G)do local Q=E._keyData[O]if Q==nil then Q={dependencySet=
setmetatable({},v),oldDependencySet=setmetatable({},v),dependencyValues=setmetatable({},v)}E._keyData[O]=Q end local R=H
[O]~=P if R==false then for S,T in pairs(Q.dependencyValues)do if T~=S:get(false)then R=true break end end end if R then
Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet table.clear(Q.dependencySet)local S,T,U,V=i(Q.
dependencySet,E._processor,O,P)if S then if E._destructor==nil and(q(T)or q(U)or q(V))then o'destructorNeededForPairs'
end if N[T]~=nil then local W,X for Y,Z in pairs(I)do if Z==T then X=G[Y]if X~=nil then W=Y break end end end if W~=nil
then n('forPairsKeyCollision',nil,tostring(T),tostring(W),tostring(X),tostring(O),tostring(P))end end local W=M[T]if W~=
U then local X=J[T]if W~=nil then local Y,Z=xpcall(E._destructor or p,l,T,W,X)if not Y then m('forPairsDestructorError',
Z)end end M[T]=nil end H[O]=P I[O]=T J[T]=V N[T]=U K=true else Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.
oldDependencySet m('forPairsProcessorError',T)end else local S=I[O]if N[S]~=nil then local T,U for V,W in pairs(I)do if
S==W then U=G[V]if U~=nil then T=V break end end end if T~=nil then n('forPairsKeyCollision',nil,tostring(S),tostring(T)
,tostring(U),tostring(O),tostring(P))end end N[S]=M[S]end for S in pairs(Q.dependencySet)do Q.dependencyValues[S]=S:get(
false)E.dependencySet[S]=true S.dependentSet[E]=true end end for Q,R in pairs(M)do if N[Q]~=R then local S=J[Q]if R~=nil
then local T,U=xpcall(E._destructor or p,l,Q,R,S)if not T then m('forPairsDestructorError',U)end end if N[Q]==nil then J
[Q]=nil E._keyData[Q]=nil end K=true end end for S in pairs(H)do if G[S]==nil then H[S]=nil I[S]=nil end end return K
end local function E<KI,VI,KO,VO,M>(F:PubTypes.CanBeState<{[KI]:VI}>,G:(KI,VI)->(KO,VO,M?),H:((KO,VO,M?)->())?):Types.
ForPairs<KI,VI,KO,VO,M>local I=F.type=='State'and typeof(F.get)=='function'local J=setmetatable({type='State',kind=
'ForPairs',dependencySet={},dependentSet=setmetatable({},v),_oldDependencySet={},_processor=G,_destructor=H,
_inputIsState=I,_inputTable=F,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},u)
j(J)J:update()return J end return E end)()end,[64]=function()local b,c,d=a(64)local e return(function(...)local f=c.
Parent.Parent return function(g)local h=d(f.Bundles)local i,j,k,l=h.data,h.themeSystem,h.icons,h.Fusion local m,n,o,p,q,
t,u=l.New,l.Children,l.Value,l.Observer,l.OnEvent,l.Computed,d(f.utilities)local v,E,F,G,H=u.get,u.animate,u.typecheck,u
.customFont,d(f.simpleElements)local I,J,K,L=H.UIPadding,H.UICorner,F(g,{Name='',DisabledText='',IsEnabled=false,
Callback=function()end},{g.IsEnabled and''or'IsEnabled',g.DisabledText and''or'DisabledText'})assert(K,table.concat(L,
'\n'))local M,N,O,P,Q,R,S,T=i.find'selectedTab',i.find'searchText',i.add(g),g.Parent,g.Name,g.Callback,g.IsEnabled or o(
true),g.DisabledText or o'Component Disabled'local U=o(v(M.string)==v(O.tab).uid)p(M.string):onChange(function()U:set(v(
M.string)==v(O.tab).uid)end)local V=E(function()return v(U)and 0 or 1 end,40,1)m'TextButton'{Interactable=t(function()if
not v(S)then return false end return v(U)end),Visible=t(function()if v(N.string)~=''and not string.find(v(Q):lower(),v(N
.string):lower())then return false end return true end),Parent=P,Size=UDim2.new(1,0,0,36),BackgroundColor3=j.background2
,BackgroundTransparency=V,[q'Activated']=function()if not v(S)then return end task.spawn(v(R))end,[n]={J(6),m'Frame'{
ZIndex=2,Visible=t(function()if not v(S)then return true end return false end),BackgroundTransparency=E(function()return
v(U)and 0.2 or 1 end,40,1),BackgroundColor3=j.disabledBackground,Size=UDim2.fromScale(1,1),[n]={J(6),m'ImageLabel'{Size=
UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=k.
lock,ImageColor3=j.disabledText,ImageTransparency=V},m'TextLabel'{FontFace=G('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=j.disabledText,TextTransparency=V,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=T,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[n]={I(0,5)}}}},m'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[n]={I(0,8),m'TextLabel'{FontFace=G(
'Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=j.text,TextScaled=true
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=Q,TextTransparency=V,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true},m'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=k.fingerprint,ImageColor3=j.text2,ImageTransparency=V}}}}}local W={}
function W.SetName(X,Y)local Z,_=F({SetName=Y},{SetName=''})assert(Z,table.concat(_,'\n'))Q:set(Y)end function W.
SetCallback(X,Y)local Z,_=F({SetCallback=Y},{SetCallback=function()end})assert(Z,table.concat(_,'\n'))R:set(Y)end
function W.Fire(X)task.spawn(v(R))end function W.Enable(X)S:set(true)end function W.Disable(X)S:set(false)end return W
end end)()end,[69]=function()local b,c,d=a(69)local e return(function(...)local f=c.Parent.Parent return function(g)
local h=d(f.Bundles)local i,j=h.themeSystem,h.Fusion local k,l,m,n,o,p=j.New,j.OnEvent,j.Children,j.Value,j.Computed,d(f
.utilities)local q,t,u,v,E,F=p.get,p.animate,p.getStringBounds,p.customFont,p.typecheck,d(f.simpleElements)local G,H,I,J
,K,L,M,N,O=F.UICorner,F.UIPadding,F.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,E(g,{Title='',Body='',Duration=1,Image='',ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{g.Image and''
or'Image',g.ImageColor and''or'ImageColor',g.Buttons and''or'Buttons'})assert(N,table.concat(O,'\n'))local P,Q,R,S,T,U,V
,W,X,Y,Z=n(g.Title),n(g.Body),n(g.Duration),n(g.Image),g.ImageColor and n(g.ImageColor)or i.text,n(g.Buttons or{}),n(
false),n(false),n(false),n'',n(250)local _=n(u(q(Q),{Size=14,Font=v('Montserrat',Enum.FontWeight.Medium),Width=q(Z)-8-(S
and 32 or 0)}))local aa=n(20+math.clamp(q(_).Y+4+10+(#q(U)>0 and 26 or 0),#q(U)>0 and 56 or 30,9e9))local function ab(ac
,ad)local ae=1 for af=1,ac do ae=ae*10 end local af=tostring(math.round(ad*ae)/ae)local ag=string.split(af,'.')if#ag==1
then local ah=''for ai=1,ac do ah=ah..'0'end af=af..'.'..ah end return af end local ac,ad={}for ae,af in q(U)do local ag
,ah=E({Button=af},{Button={}})assert(ag,table.concat(ah,'\n'))ag,ah=E(af,{Name='',Callback=function()end})assert(ag,
table.concat(ah,'\n'))local ai,aj=af.Name,af.Callback local ak=k'TextButton'{Size=UDim2.new(1/#q(U),-2,1,-4),TextSize=14
,Text=ai,FontFace=v('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=i.notificationButton,TextColor3=i.text,[l
'Activated']=function()task.spawn(aj)W:set(false)task.wait(0.4)V:set(false)task.delay(0.3,function()X:set(true)end)task.
wait(2)ad:Destroy()end,[m]={G(4)}}table.insert(ac,ak)end ad=k'Frame'{Parent=g.Parent,BackgroundTransparency=1,Size=t(
function()return UDim2.fromOffset(q(Z),q(V)and q(aa)+5 or 0)end,30,1),ClipsDescendants=true,[m]={k'TextButton'{Visible=
o(function()return not q(X)end),Interactable=W,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),
BackgroundTransparency=1,Size=UDim2.fromOffset(q(Z),q(aa)),[l'Activated']=function()W:set(false)task.wait(0.4)V:set(
false)task.delay(0.3,function()X:set(true)end)task.wait(2)ad:Destroy()end},k'Frame'{AnchorPoint=Vector2.new(0,1),
BackgroundColor3=i.background,Size=UDim2.fromOffset(q(Z),q(aa)),Position=t(function()return UDim2.fromScale(q(W)and 0 or
1.2,1)end,30,1),[m]={H(0,4),I(J.LayoutOrder,K.Horizontal,L.Left,M.Center,UDim.new(0,4)),G(4),k'Frame'{Visible=S and true
or false,Size=UDim2.new(0,24,1,0),BackgroundTransparency=1,[m]={k'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=S,ImageColor3=T}}},k'Frame'{Size=
UDim2.new(1,S and-28 or 0,1,0),BackgroundTransparency=1,[m]={H(2,0),I(J.LayoutOrder,K.Vertical,L.Left,M.Top),k
'TextLabel'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=v('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Left,TextSize=16,RichText=true,TextColor3=i.text,Text=P},k'TextLabel'{Size=UDim2.new(
1,0,0,1),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=v(
'Montserrat',Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,RichText=true,TextColor3=i.text2,Text=Q},k'Frame'{Visible=o(function()return#q(U)>0
and true or false end),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,[m]={I(J.LayoutOrder,K.Horizontal,L.Center,M.
Center,UDim.new(0,2)),ac}},k'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=v('Montserrat',Enum.FontWeight.Medium),Text=Y,
TextColor3=i.text,TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,
function()W:set(true)end)task.spawn(function()repeat task.wait()until q(W)local ag,ah=(tick())repeat ah=tick()-ag Y:set(
ab(1,math.clamp(ah,0,q(R))))task.wait()until ah>q(R)end)task.spawn(function()V:set(true)repeat task.wait()until q(W)task
.wait(q(R))task.wait(0.2)W:set(false)task.wait(0.4)V:set(false)task.delay(0.3,function()X:set(true)end)task.wait(2)ad:
Destroy()end)end end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local function ae(af:any):
boolean return typeof(af)=='Instance'end return ae end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function
(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.
icons,ag.Fusion local b,c,d,e,f,g,h,i=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ak.Ref,ac(ae.
utilities)local j,k,l,m,n=i.get,i.animate,i.typecheck,i.customFont,ac(ae.simpleElements)local o,p,q,t,u,v,E,F,G=n.
UIListLayout,n.UIPadding,n.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,l(
af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Items={},Multiselect=true,Regex=function()end
},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Multiselect and''or
'Multiselect',af.Regex and''or'Regex'})assert(F,table.concat(G,'\n'))F,G=l(af,{Default=af.Multiselect and{}or''},{af.
Default and''or'Default'})assert(F,table.concat(G,'\n'))assert(af.Regex and af.Regex''~=nil,'no work regex')local H,I,J,
K,L,M,N,O,P,Q,R,S,T,U,V,W=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find
'searchText',ah.add(af),af.Parent,af.Name,af.Callback,d{},af.IsEnabled or d(true),af.DisabledText or d
'Component Disabled',af.Regex or d(function(H)return H end),af.Multiselect or d(false),af.FLAG or d'',false if j(V)~=''
then local X=j(J.names)assert(not table.find(X,j(V)),('FLAG "%s" already exists'):format(j(V)))table.insert(X,j(V))J:
update('names',X)W=true end local X,Y,Z,_,al,am,an=d(),d(),d(false),d(j(U)and{}or''),d{},d{},d(false)e(al):onChange(
function()if#j(al)==#j(Q)then an:set(true)else an:set(false)end if j(U)then local ao={}for ap,aq in j(al)do table.
insert(ao,j(T)(aq))end task.spawn(j(P),ao)_:set(j(al))else task.spawn(j(P),j(T)(j(al)[1]))_:set(j(T)(j(al)[1]))end end)
e(Q):onChange(function()if#j(al)==#j(Q)then an:set(true)else an:set(false)end end)local ao=d(j(H.string)==j(M.tab).uid)
e(H.string):onChange(function()ao:set(j(H.string)==j(M.tab).uid)end)local ap=k(function()return j(ao)and 0 or 1 end,40,1
)local function aq()if j(K.boolean)then local ar=j(J.list)[j(V)]local as=l({[j(V)]=ar},{[j(V)]={}})if ar and as then al:
set(ar)end e(al):onChange(function()local at=j(J.list)at[j(V)]=j(al)J:update('list',at)end)end end b'Frame'{Parent=N,
Visible=g(function()if j(L.string)~=''and not string.find(j(O):lower(),j(L.string):lower())then return false end return
true end),Size=k(function()if j(Z)and j(X)then local ar,as=j(X),3 for at,au in ar:GetChildren()do if au:IsA
'UIListLayout'or au:IsA'UICorner'or not au.Visible then continue end as+=(4+au.Size.Y.Offset)end return UDim2.new(1,0,0,
as)end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,BackgroundTransparency=ap,ClipsDescendants=
true,[h]=X,[c]={q(6),o(t.LayoutOrder,u.Vertical,v.Center,E.Top,UDim.new(0,4)),b'TextButton'{Interactable=g(function()if
not j(R)then return false end return j(ao)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[f'Activated']=function
()Z:set(not j(Z))end,[c]={b'Frame'{ZIndex=2,Visible=g(function()if not j(R)then return true end return false end),
BackgroundTransparency=k(function()return j(ao)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.
fromScale(1,1),[c]={q(6),b'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,
5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=ap},b'TextLabel'{FontFace=
m('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=ap,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=g(function()
return j(S)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[c]={p(0,5)}}}},b'Frame'{Size=UDim2.fromScale(1,1)
,BackgroundTransparency=1,[c]={p(8),b'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18
),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,
0),Text=g(function()if j(U)then return j(O)..' '..tostring(#j(al))..'/'..tostring(#j(Q))end return j(O)..': '..j(_)end),
TextTransparency=ap,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},b'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=g(function()return j(U)and
aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=ap}}}}},b'Frame'{Size=UDim2.new(1,0,0,
32),BackgroundTransparency=1,[c]={p(0,6),b'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,
BackgroundTransparency=ap,FontFace=m('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,PlaceholderText='Search',TextColor3=ai.text,TextTransparency=ap,[h]=Y,[f'Changed']=function(ar)local as=
j(Y)if ar=='Text'and as and as.Text then local at=as.Text for au,av in j(am)do if string.find(j(T)(av.Name),at)or at==''
then av.Visible=true else av.Visible=false end end end end,[c]={b'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},q(
4),p(6,6,6,6)}}}},b'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=U,[c]={p(6,6,0,6),b'TextButton'{
Interactable=U,Size=UDim2.new(1,0,0,24),BackgroundTransparency=ap,BackgroundColor3=ai.background,[f'Activated']=function
()local ar={}if not j(an)then for as,at in j(Q)do at=typeof(at)=='table'and at.Value or at table.insert(ar,j(T)(at))end
end al:set(ar)end,[c]={q(4),p(8),b'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),
BackgroundTransparency=1,TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0
),Text=g(function()if j(an)then return'Deselect All'end return'Select All'end),TextTransparency=ap,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}}}},b'ScrollingFrame'{ZIndex=3,Size=UDim2.new(1,0,0,136),BackgroundTransparency=1,
ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[c]={p(6,6,0,6),o(t.
LayoutOrder,u.Vertical,v.Center,E.Top,UDim.new(0,6)),am}}}}e(Q):onChange(function()local ar={}for as,at in j(Q)do local
au,av,aw=(d(false))if typeof(at)=='table'then local ax,ay=l(at,{Value='',Image=''},{at.Image and''or'Image'})assert(ax,
table.concat(ay,'\n'))av=at.Value aw=at.Image or nil else local ax,ay=l({Item=at},{Item=''})assert(ax,table.concat(ay,
'\n'))av=at end e(al):onChange(function()if table.find(j(al),j(T)(av))then au:set(true)else au:set(false)end end)local
ax=b'TextButton'{Name=av,Size=UDim2.new(1,0,0,28),BackgroundTransparency=ap,BackgroundColor3=ai.background,[f'Activated'
]=function()local ax=j(al)if j(U)then au:set(not j(au))if j(au)then table.insert(ax,j(T)(av))else table.remove(ax,table.
find(ax,j(T)(av)))end al:set(ax)else al:set{av}Z:set(false)end end,[c]={q(4),p(8),o(t.LayoutOrder,u.Horizontal,v.Left,E.
Center,UDim.new(0,6)),b'Frame'{Visible=g(function()return j(U)and true or false end),Size=UDim2.fromOffset(20,20),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=ap,BackgroundColor3=k(function()
return j(au)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[c]={q(6),b'ImageLabel'{Size=UDim2.fromOffset(14,14),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,
ImageTransparency=k(function()if not j(ao)then return 1 end if j(au)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},b'ImageLabel'{Visible=g(function()return aw and true or false end),Size=UDim2.fromOffset(18,18),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aw,ImageTransparency=ap,
ImageColor3=ai.text2},b'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),Size=g(function()return j(U)and UDim2.
new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=av,TextTransparency=ap,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}table.insert(ar,ax)end am:set(ar)end)Q:set(j(af.Items))if j(I.boolean)and W then if not j(K.boolean)then
e(K.boolean):onChange(aq)else aq()end end local ar={}function ar.SetName(as,at)local au,av=l({SetName=at},{SetName=''})
assert(au,table.concat(av,'\n'))O:set(at)end function ar.SetItems(as,at)local au,av=l({SetItems=at},{SetItems={}})
assert(au,table.concat(av,'\n'))al:set{}Q:set(at)local aw,ax={},false for ay,az in j(Q)do local aA if typeof(az)==
'table'then aA=az.Value else aA=az end if j(U)then if typeof(j(_))=='table'and table.find(j(_),j(T)(aA))then table.
insert(aw,j(T)(aA))ax=true end else if j(_)==j(T)(aA)then ax=true task.spawn(j(P),j(T)(aA))break end end end if ax then
if j(U)then al:set(aw)end end end function ar.SelectItem(as,at)assert(not j(U),
':SelectItem requires Multiselect to be false')local au,av=l({SelectItem=at},{SelectItem=''})assert(au,table.concat(av,
'\n'))local aw=false for ax,ay in j(Q)do local az=ay if typeof(ay)=='table'then az=ay.Value end if j(T)(az)==j(T)(at)
then aw=true break end end assert(aw,":SelectItem couldn't find "..at)al:set{at}end function ar.SelectItems(as,at)
assert(j(U),':SelectItems requires Multiselect to be true')local au,av=l({SelectItems=at},{SelectItems={}})assert(au,
table.concat(av,'\n'))for aw,ax in at do local ay=false for az,aA in j(Q)do local aB=typeof(aA)=='table'and j(T)(aA.
Value)or j(T)(aA)if ax==aB then ay=true break end end if ay then at[aw]=j(T)(ax)else warn(":SelectItems couldn't find",
ax,'in Items. Removing it.')at[aw]=nil end end al:set(at)end function ar.Enable(as)R:set(true)end function ar.Disable(as
)R:set(false)end return ar end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(function(...)local ae=string
.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then return
af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[41]=function()local aa,ab,ac=a(41)local ad
return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an=ac(ae.Types),ac(ae.Dependencies.
captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.logErrorNonFatal
),ac(ae.Logging.logWarn),ac(ae.Utility.isSimilar),ac(ae.Utility.needsDestruction),{}local ao,ap={__index=an},{__mode='k'
}function an.get(aq,ar:boolean?):any if ar~=false then ai(aq)end return aq._value end function an.update(aq):boolean for
ar in pairs(aq.dependencySet)do ar.dependentSet[aq]=nil end aq._oldDependencySet,aq.dependencySet=aq.dependencySet,aq.
_oldDependencySet table.clear(aq.dependencySet)local as,at,au=ag(aq.dependencySet,aq._processor)if as then if aq.
_destructor==nil and am(at)then ak'destructorNeededComputed'end if au~=nil then ak'multiReturnComputed'end local av=aq.
_value local aw=al(av,at)if aq._destructor~=nil then aq._destructor(av)end aq._value=at for ax in pairs(aq.dependencySet
)do ax.dependentSet[aq]=true end return not aw else aj('computedCallbackError',at)aq._oldDependencySet,aq.dependencySet=
aq.dependencySet,aq._oldDependencySet for av in pairs(aq.dependencySet)do av.dependentSet[aq]=true end return false end
end local function aq<T>(ar:()->T,as:((T)->())?):Types.Computed<T>local at=setmetatable({type='State',kind='Computed',
dependencySet={},dependentSet=setmetatable({},ap),_oldDependencySet={},_processor=ar,_destructor=as,_value=nil},ao)ah(at
)at:update()return at end return aq end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)local ae=
ab.Parent.Parent local af=ac(ae.Types)local function ag(ah:string):Types.Error return{type='Error',raw=ah,message=ah:
gsub('^.+:%d+:%s*',''),trace=debug.traceback(nil,2)}end return ag end)()end,[62]=function()local aa,ab,ac=a(62)local ad
return(function(...)return{background=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex
'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',notificationButton=Color3.fromHex'#222427',
mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex
'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex
'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[61]=function()local aa,ab,ac=a(61)
local ad return(function(...)local ae,af,ag={},ac(ab.Parent.Fusion),ac(ab.default)local ah,ai,aj,ak,al=af.Value,af.
Observer,ac(ab.Parent.Parent.utilities.get),ac(ab.Parent.Parent.utilities.animate),{}local am=ah{}ai(am):onChange(
function()for an,ao in ipairs(al)do task.spawn(ao)end end)local an={}table.foreach(ag,function(ao,ap)table.insert(an,ao)
end)function ae.create(ao)for ap,aq in an do if ao[aq]==nil then ao[aq]=ag[aq]end if typeof(ao[aq])~='Color3'then error(
aq.." isn't type Color3")end end for ar,as in ao do if not table.find(an,ar)then warn('Incorrect value removed "'..
tostring(ar)..'"')ao[ar]=nil end end am:set(ao)end function ae.get(ao:string)local aq=aj(am)if aq[ao]then return aq[ao]
else error(ao.." isn't a theme element")end end for ao,aq in an do ae[aq]=ak(function()return aj(am)[aq]end,40,1)end am:
set(ag)function ae.onChange(ar)table.insert(al,ar)end return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad
return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Fusion)local ag,ah,ai=af.Value,
{},{}type uid=string type tag=string function ai.update(aj:string,ak:string,al:string)if ak~='uid'and ai.find(aj)and ai.
find(aj)[ak]then local am=ai.find(aj)am[ak]:set(al)elseif not ai.find(aj)then error("couldn't find uid: "..aj)elseif ak
=='uid'or ak=='__tag'then error('cannot edit property '..ak)elseif not ai.find(aj)[ak]then else error'how?'end end
function ai.find(aj:uid|tag):table local ak for al=1,#ah do if ah[al].uid==aj or ah[al].__tag==aj then ak=ah[al]end end
if not ak then warn('no data found by identifier: '..tostring(aj))return ak end return ak end function ai.delete(aj:
string)local ak=ai.find(aj)local al,am=table.find(ah,ak),{}for an=1,#ah do if an~=al then table.insert(am,ah[an])end end
ah=am am=nil end function ai.add(aj:table,ak:string):table for al,am in aj do aj[al]=ag(am)end aj.__tag=ak or nil aj.uid
=ae(16)setmetatable(aj,{__index={update=function(an,ao,aq)ai.update(an.uid,ao,aq)end,delete=function()ai.delete(aj.uid)
end}})table.insert(ah,aj)return ai.find(aj.uid)end return ai end)()end,[60]=function()local aa,ab,ac=a(60)local ad
return(function(...)local ae=ac(ab.Parent.Parent.utilities.customFunctions)local af,ag=ae.cloneref,{}ag=setmetatable(ag,
{__index=function(ah,ai)return af(game:GetService(ai))end})return ag end)()end,[50]=function()local aa,ab,ac=a(50)local
ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Types)return{type='Symbol',name='None'}::Types.None end
)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)local function ae(...:any)end return ae end)()end
,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Logging.
logError)type table={[any]:any}local function ag(ah:string,ai:table):table local aj=getmetatable(ai::any)if aj==nil then
aj={}setmetatable(ai,aj)end function aj.__index(ak,al)af('strictReadError',nil,tostring(al),ah)end return ai end return
ag end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)local function ae(af:any,ag:any):boolean if
typeof(af)=='table'then return false else return af==ag end end return ae end)()end,[48]=function()local aa,ab,ac=a(48)
local ad return(function(...)local ae=ab.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}export type None=PubTypes.
Symbol&{}export type Error={type:string,raw:string,message:string,trace:string}export type State<T> =PubTypes.Value<T>&{
_value:T}export type Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,
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
.Observer&{_changeListeners:Set<()->()>,_numChangeListeners:number}return nil end)()end,[56]=function()local aa,ab,ac=a(
56)local ad return(function(...)local function ae(af:any)local ag=typeof(af)if ag=='table'and typeof(af.type)=='string'
then return af.type else return ag end end return ae end)()end,[51]=function()local aa,ab,ac=a(51)local ad return(
function(...)local function ae(af:any)local ag=typeof(af)if ag=='Instance'then af:Destroy()elseif ag==
'RBXScriptConnection'then af:Disconnect()elseif ag=='function'then af()elseif ag=='table'then if typeof(af.destroy)==
'function'then af:destroy()elseif typeof(af.Destroy)=='function'then af:Destroy()elseif af[1]~=nil then for ah,ai in
ipairs(af)do ae(ai)end end end end local function af(...:any)for ag=1,select('#',...)do ae(select(ag,...))end end return
af end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.
Logging.messages)local function ag(ah,...)local ai:string if af[ah]~=nil then ai=af[ah]else ah='unknownMessage'ai=af[ah]
end warn(string.format('[Fusion] '..ai..'\n(ID: '..ah..')',...))end return ag end)()end,[47]=function()local aa,ab,ac=a(
47)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Utility.xtypeof)
local function ah<T>(ai:PubTypes.CanBeState<T>,aj:boolean?):T return if ag(ai)=='State'then(ai::PubTypes.StateObject<T>)
:get(aj)else(ai::T)end return ah end)()end,[92]=function()local aa,ab,ac=a(92)local ad return(function(...)return
function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[96]=function
()local aa,ab,ac=a(96)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed
return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end,[82]=function()local aa,ab,ac=a(82)local ad return(
function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag or 0 return ae.New'UICorner'{
CornerRadius=UDim.new(ag,af)}end end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.
AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,
AspectType=ag,DominantAxis=ah}end end)()end,[34]=function()local aa,ab,ac=a(34)local ad return(function(...)local ae=ab.
Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)local function ah(ai:string,aj:Types.Error?,...)local ak:
string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=ag[ai]end local al if aj==nil then al=string.format(
'[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub('ERROR_MESSAGE',aj.message)al=string.format('[Fusion] '..ak..
'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)end error(al:gsub('\n','\n    '),0)end return ah end)()end,[75
]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae
.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am=ak.UserInputService,ag.Fusion local
an,ao,aq,ar,as,at,au=am.New,am.Children,am.Value,am.Observer,am.OnEvent,am.Computed,ac(ae.utilities)local av,aw,ax,ay,az
,aA,aB,b=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local c,
d,e,f,g,h,i,j,k,l,m=b.UIPadding,b.UICorner,b.UITextSizeConstraint,b.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,
Default=false,Callback=function()end,LinkKeybind=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.
IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.LinkKeybind and''or'LinkKeybind'})assert(l,table.concat(m,
'\n'))l,m=ax(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or'Bind'})assert(l,table.concat(m,'\n'))local n,o
,p,q,t,u,v,E,F,G,H,I,J,K,L,M,N,O,P=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'flags',ah.find
'configLoaded',ah.find'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',ah.add(af),af.Parent,af.
Name,af.Callback,af.Default or aq(false),af.IsEnabled or aq(true),af.DisabledText or aq'Component Disabled',af.
LinkKeybind or aq(false),aq(),false local function Q(R:EnumItem,S:string)local T=av(o.binds)if table.find(T,R)then k((
'Key %s is already in use. %s'):format(R.Name,S))else table.insert(T,R)if av(O)then table.remove(T,table.find(T,av(O)))
end o:update('binds',T)O:set(R)P=true end end if av(N)and av(af.Bind)then if not av(p.boolean)then Q(av(af.Bind),
'At property set')end end local R,S=af.FLAG or aq'',false if av(R)~=''then local T=av(q.names)assert(not table.find(T,
av(R)),('FLAG "%s" already exists'):format(av(R)))table.insert(T,av(R))q:update('names',T)S=true end local T=aq(av(n.
string)==av(G.tab).uid)ar(n.string):onChange(function()T:set(av(n.string)==av(G.tab).uid)end)local U,V=aw(function()
return av(T)and 0 or 1 end,40,1),aq(false)ar(V):onChange(function()if av(L)then task.spawn(av(J),av(V))end end)local W=
aq(false)local X=al.InputBegan:Connect(function(X,Y)if av(E.boolean)then return end if av(W)then if X.KeyCode and X.
KeyCode~=Enum.KeyCode.Unknown then Q(X.KeyCode,'From input box')end W:set(false)task.wait()F:update('boolean',false)else
if X.KeyCode and X.KeyCode==av(O)and not Y and not av(F.boolean)and av(L)then V:set(not av(V))end end end)ay.add(X)local
Y=aq(false)local function Z()if S then if av(t.boolean)then local _=av(q.list)[av(R)]local aC=ax({[av(R)]=_},{[av(R)]={}
})if _ and aC and _.boolean then if _.keycode and av(N)then Q(Enum.KeyCode[_.keycode],'From configLoad FLAG')end V:set(_
.boolean)end ar(V):onChange(function()local aD=av(q.list)aD[av(R)]=aD[av(R)]or{}aD[av(R)].boolean=av(V)q:update('list',
aD)end)ar(O):onChange(function()local aD=av(q.list)aD[av(R)]=aD[av(R)]or{}aD[av(R)].keycode=av(O).Name q:update('list',
aD)end)if not _ then task.wait()if av(N)then Q(av(af.Bind),'From configLoad no FLAG')end V:set(av(K))end end else if av(
t.boolean)and not P then task.wait()if av(N)then Q(av(af.Bind),'From configLoad no FLAG')end V:set(av(K))end end end
local aC local aD=an'TextButton'{Visible=at(function()if not av(L)then return av(L)end return av(Y)end),Parent=aA.get(
av(v.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=
true,Text=av(I),FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[as'Activated']=function()if aC then aC:
Disconnect()aC=nil else V:set(not av(V))end end,[ao]={c(4),d(16),e(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=av(E.boolean)
and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=H,Visible=at(
function()if av(u.string)~=''and not string.find(av(I):lower(),av(u.string):lower())then return false end return true
end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=at(function()if not av(L)then
return true end return false end),BackgroundTransparency=aw(function()return av(T)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ao]={d(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=U},an'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=U,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=at(function()return av(M)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,
[ao]={c(0,5)}}}},an'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={f(g.LayoutOrder,h.Horizontal,i.Left,
j.Center,UDim.new(0,3)),an'TextButton'{Interactable=at(function()if not av(L)then return false end return av(T)end),Size
=at(function()return av(N)and UDim2.new(0.775,av(Y)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.
background2,BackgroundTransparency=U,[as'Activated']=function()if not av(L)then return end V:set(not av(V))end,[ao]={d(6
),an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={c(8),f(g.LayoutOrder,h.Horizontal,i.Left,j.Center,
UDim.new(0,10)),an'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=U,BackgroundColor3=aw(function()return av(V)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[
ao]={d(6),an'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0
),BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(function()if not av(T)then return 1 end if av(V)then
return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},an'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=I,TextTransparency=U,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},
an'TextButton'{Visible=Y,Interactable=at(function()if not av(L)then return false end return av(T)end),Size=UDim2.
fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=U,[as'Activated']=function()Y:set(false)aD.
Position=UDim2.fromScale(0.5,0.5)end,[ao]={d(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=U}}},an'TextButton'{Visible=N,Interactable=at(function()if not av(L)then return false end return av(T)
end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=U,[as'Activated']=function()if
av(E.boolean)then Y:set(true)aC=aB(aD,15)return end W:set(true)F:update('boolean',true)end,[ao]={d(6),c(6),f(g.
LayoutOrder,h.Horizontal,i.Left,j.Center,UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=av(E.boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=U},an
'TextLabel'{Visible=not av(E.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=U,Text=
at(function()return av(W)and'Listening'or av(O)and av(O).Name or'Waiting'end)},an'TextLabel'{Visible=av(E.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(Y)and'Move Bind'or'Place Bind'
end),TextTransparency=U}}}}}}}if av(p.boolean)then if av(t.boolean)then Z()else ar(t.boolean):onChange(Z)end else V:set(
av(K))end local _={}function _.SetName(aE,aF)local aG,aH=ax({SetName=aF},{SetName=''})assert(aG,table.concat(aH,'\n'))I:
set(aF)end function _.SetValue(aE,aF:boolean)local aG,aH=ax({SetValue=aF},{SetValue=false})assert(aG,table.concat(aH,
'\n'))V:set(aF)end function _.SetBind(aE,aF:EnumItem)assert(av(N),'Requires LinkKeybind')local aG,aH=ax({SetBind=aF},{
SetBind=Enum.keyCode.C})assert(aG,table.concat(aH,'\n'))Q(aF,'At :SetBind')end function _.Enable(aE)L:set(true)end
function _.Disable(aE)L:set(false)end return _ end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function
(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah=ag.services local ai,aj,ak,al,am=ah.
UserInputService,ag.themeSystem,ag.icons,ag.data,ag.Fusion local an,ao,aq,ar,as,at,au,av=am.New,am.Children,am.Value,am.
Ref,am.Computed,am.Observer,am.OnEvent,ac(ae.simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner
,av.UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ae.utilities)local aF,aG,aH,b,c,d,e,f,g,h,i,j,k=aE.get,aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,
ac(ab.Parent.Parent.components.warn),aq(),aq(),aq(),aq(),aq(),aq()aG.add(j,i,h,g,f,k)local l,m,n,o,p,q,t,u,v,E,F,G,H,I=
al.find'absoluteOffset',al.find'instanceName',al.find'selectedTab',al.find'searchText',al.find'currentBinds',al.find
'isVisible',al.find'isMobile',al.find'isListening',aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(F):
onChange(function()if aF(F)then G:set(not aF(G))task.wait(0.3)H:set(not aF(H))task.wait(0.3)I:set(not aF(I))else I:set(
not aF(I))task.wait(0.3)H:set(not aF(H))task.wait(0.3)G:set(not aF(G))end end)at(H):onChange(function()v:set(aF(H)and
212 or 750)end)at(I):onChange(function()E:set(aF(I)and 74 or 500)end)local J,K,L=aq(false),aq(),aq(false)local function
M(N:EnumItem,O:string)local P=aF(p.binds)if table.find(P,N)then e(('Key %s is already in use. %s'):format(N.Name,O))else
table.insert(P,N)if aF(K)then table.remove(P,table.find(P,aF(K)))end p:update('binds',P)K:set(N)L:set(true)end end if
not aF(t.boolean)then M(af.HideBind,'init')end local N=aq''at(n.string):onChange(function()local O=aF(n.string)local P=
al.find(O)N:set(aF(P.Name):upper())end)local O,P an'ScreenGui'{Name=aF(m.name),Parent=af.Parent or ah.CoreGui,
ResetOnSpawn=false,IgnoreGuiInset=true,[ar]=j,[ao]={an'Frame'{Name='container',Visible=q.boolean,AnchorPoint=Vector2.
new(0.5,0.5),Position=as(function()return UDim2.new(0.5,0,0.5,aF(l.number))end),Size=c(function()return UDim2.
fromOffset(aF(v),aF(E))end,30,1),BackgroundColor3=aj.background,[ar]=f,[ao]={ax(6),az(16),aw(aA.LayoutOrder,aB.
Horizontal,aC.Right,aD.Top,UDim.new(0,16)),an'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=c(function()return
UDim2.new(0,math.clamp(aF(v)-32-180-16,212,9e9),aF(G)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=
true,[ao]={an'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=N,
TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=b('Montserrat',Enum.
FontWeight.ExtraBold),TextColor3=aj.text,TextTransparency=0.95,TextScaled=true,[ao]={an'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=70}}},an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={aw(aA.LayoutOrder,aB.
Vertical,aC.Left,aD.Top,UDim.new(0,16)),an'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ao]={aw(aA.
LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,10)),an'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[
ao]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,4)),an'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,
TextColor3=aj.text,FontFace=b('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left},an'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=aj.
text2,FontFace=b('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.
TextXAlignment.Left}}},an'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=aj.background2,[au'Activated']=
function()local Q=aF(k)if Q then Q:CaptureFocus()end end,[ao]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Center,
aD.Center,UDim.new(0,4)),an'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ak.search,
ImageColor3=aj.text2},an'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=aj.text2,TextSize=16,FontFace=b('Montserrat',
Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=aj.text2,BackgroundTransparency=1,TextXAlignment=Enum.
TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(Q)local R=aF(k)if Q~='Text'and R and R.
Text then return end o:update('string',R.Text)end,[ar]=k}}}}},an'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),
BackgroundTransparency=1,[ar]=h}}}}},an'Frame'{Size=c(function()return aF(I)and UDim2.new(0,180,0,44)or UDim2.new(0,180,
1,0)end,30,1),BackgroundColor3=aj.background2,ClipsDescendants=true,[ao]={ax(6),aw(aA.LayoutOrder,aB.Vertical,aC.Center,
aD.Top,UDim.new(0,8)),an'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ao]={aw(aA.LayoutOrder,aB.Horizontal,
aC.Center,aD.Center,UDim.new(0,4)),an'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=aj.selectedTab,[au
'Activated']=function()if aF(t.boolean)then L:set(true)P=aH(O,15)return end J:set(true)u:update('boolean',true)end,[ao]=
{ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.
fromOffset(20,20),BackgroundTransparency=1,Image=aF(t.boolean)and ak.finger or ak.command,ImageColor3=aj.text2,
ImageTransparency=0},an'TextLabel'{Visible=not aF(t.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=b('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=aj.
text2,Text=as(function()return aF(J)and'Listening'or aF(K)and aF(K).Name or'Waiting'end)},an'TextLabel'{Visible=aF(t.
boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=b('Montserrat',Enum.FontWeight.Bold),TextScaled=
true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=aj.text2,Text=as(function()return aF(L)and'Move Bind'or
'Place Bind'end)}}},an'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=aj.selectedTab,[au'Activated']=function
()F:set(not aF(F))end,[ao]={ax(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(F)and ak.minimize or ak.maximize end),
ImageColor3=aj.text2,ImageTransparency=0}}},an'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=aj.selectedTab,
[au'Activated']=function()if not aF(L)then ac(ae.components.notification){Parent=i,Title='Darius Interface',Body=`You must {
aF(t.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,Duration=5,Image=ak.alert,ImageColor=aj.get
'red'}return end q:update('boolean',not aF(q.boolean))end,[ao]={ax(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=ak.close,ImageColor3=aj.
orange,ImageTransparency=0}}}}},an'ScrollingFrame'{Name='tabButtonList',Size=c(function()return aF(I)and UDim2.new(1,0,0
,0)or UDim2.new(1,0,1,-90)end,30,1),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=true,[ar]=g,[ao]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top
,UDim.new(0,6)),az(0,10)}},an'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=aj.selectedTab,[au'Activated']=
function()d:deleteConnections()aG:clear()end,[ao]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.
new(0,4)),an'ImageLabel'{BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=aj.red,Image=ak.close,
ImageTransparency=0.3},an'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=b('Montserrat',Enum.FontWeight.Bold),TextColor3=aj
.red,TextScaled=true,Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=0.3,[ao]={an'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},an'ScrollingFrame'{Name=
'notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2
.new(1,0.5),ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,1,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants
=false,[ar]=i,[ao]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}O=an'TextButton'{Visible=as(function()return(
aF(L)and aF(t.boolean))end),Interactable=as(function()return(aF(L)and aF(t.boolean))end),Parent=aG.get(aF(m.name)),Size=
UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=
'Hide UI',FontFace=b('Montserrat',Enum.FontWeight.Bold),TextColor3=aj.mobileButtonText,BackgroundColor3=aj.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au'Activated']=function()if P then P:Disconnect(
)P=nil else q:update('boolean',not aF(q.boolean))end end,[ao]={az(4),ax(16),ay(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aF(t
.boolean)and ak.finger or ak.command,ImageColor3=aj.mobileButtonImage,ImageTransparency=0.8}}}local Q=ai.InputBegan:
Connect(function(Q,R)if aF(t.boolean)then return end if aF(J)then if Q.KeyCode and Q.KeyCode~=Enum.KeyCode.Unknown then
M(Q.KeyCode,'From input box')end J:set(false)task.wait()u:update('boolean',false)else if Q.KeyCode and Q.KeyCode==aF(K)
and not R and not aF(u.boolean)then q:update('boolean',not aF(q.boolean))end end end)d.add(Q)aH(aG.get'container',15)end
end)()end,[90]=function()local aa,ab,ac=a(90)local ad return(function(...)local ae,af={},{}function ae.cloneref(ag)if
cloneref then return cloneref(ag)else return ag end end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=
getgenv or nil function ae.isfile(ag:string)if isfile then return isfile(ag)else local ah,ai=af,false if ag:find'/'then
for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end
if ai then return false end return true end end function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else
local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah
=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end function ae.writefile(ag:string,
ah:string)if writefile then return writefile(ag,ah)else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])==
'table'then ai=ai[ak]elseif not ai[ak]then ai[ak]=ah end end end end function ae.delfile(ag:string)if delfile then
return delfile(ag)else local ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[
al]=nil else ai=ah end end end end function ae.readfile(ag:string)if readfile then return readfile(ag)else local ah,ai=
af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end
if ai then warn'readfile: no file'return nil end return ah end end function ae.makefolder(ag:string)if makefolder then
return makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else
ah=ah[aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if listfiles then return listfiles(ag)else
local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah
=ah[ag]end if ai or typeof(ah)=='string'then warn'no folder exists'return nil end local aj={}for ak,al in ah do if
typeof(al)=='string'then table.insert(aj,ak)end end return aj end end return ae end)()end,[65]=function()local aa,ab,ac=
a(65)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.
data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local aq,ar,
as,at,au=ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af.Parent local av=am(aq(as.string)==aq(at.tab).uid)an(as.
string):onChange(function()av:set(aq(as.string)==aq(at.tab).uid)end)local aw=ar(function()return aq(av)and 0 or 1 end,40
,1)ak'Frame'{Parent=au,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=aw}}
}end end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)return function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingLeft=UDim.new(0,...),PaddingRight
=UDim.new(0,...),PaddingTop=UDim.new(0,...),PaddingBottom=UDim.new(0,...)}elseif#af==2 then return ae.New'UIPadding'{
PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[1]),PaddingLeft=UDim.new(0,af[2]
)}elseif#af==3 then return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=
UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[2])}else return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=
UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[4])}end end end)()end,[67]=function()local
aa,ab,ac=a(67)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am=ak.UserInputService,ag.Fusion local an,ao,aq,ar,as,at,
au,av=am.New,am.Children,am.Value,am.Observer,am.OnEvent,am.Computed,am.Ref,ac(ae.utilities)local aw,ax,ay,az,aA,aB,aC,
aD=av.get,av.animate,av.typecheck,av.connections,av.customFont,av.references,av.drag,ac(ae.simpleElements)local aE,aF,aG
,aH,b,c,d,e,f,g,h=aD.UIPadding,aD.UICorner,aD.UITextSizeConstraint,aD.UIListLayout,Enum.SortOrder,Enum.FillDirection,
Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),ay(af,{Name='',DisabledText='',FLAG='',IsEnabled=
false,Callback=function()end,Bind=Enum.KeyCode.Q},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.
IsEnabled and''or'IsEnabled',af.Bind and''or'Bind'})assert(g,table.concat(h,'\n'))local i,j,k,l,m,n,o,p,q,t,u,v,E,F,G,H,
I=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText'
,ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or
aq(true),af.DisabledText or aq'Component Disabled',aq(),false local function J(K:EnumItem,L:string)local M=aw(j.binds)if
table.find(M,K)then f(('Key %s is already in use. %s'):format(K.Name,L))else table.insert(M,K)if aw(H)then table.remove(
M,table.find(M,aw(H)))end j:update('binds',M)H:set(K)I=true end end if af.Bind then if not aw(k.boolean)then J(aw(af.
Bind),'At property set')end end local K,L=af.FLAG or aq'',false if aw(K)~=''then local M=aw(l.names)assert(not table.
find(M,aw(K)),('FLAG "%s" already exists'):format(aw(K)))table.insert(M,aw(K))l:update('names',M)L=true end local M=aq(
aw(i.string)==aw(t.tab).uid)ar(i.string):onChange(function()M:set(aw(i.string)==aw(t.tab).uid)end)local N,O=ax(function(
)return aw(M)and 0 or 1 end,40,1),aq(false)local P=al.InputBegan:Connect(function(P,Q)if aw(o.boolean)then return end if
aw(O)then if P.KeyCode and P.KeyCode~=Enum.KeyCode.Unknown then J(P.KeyCode,'From input box')end O:set(false)task.wait()
q:update('boolean',false)else if P.KeyCode and P.KeyCode==aw(H)and not Q and not aw(q.boolean)and aw(F)then task.spawn(
aw(E))end end end)az.add(P)local Q=aq(false)local function R()if L then if aw(m.boolean)then local S=aw(l.list)[aw(K)]
local T=ay({[aw(K)]=S},{[aw(K)]=''})if S and T and Enum.KeyCode[S]~=nil then J(Enum.KeyCode[S],
'From configLoad has FLAG')end ar(H):onChange(function()local U=aw(l.list)U[aw(K)]=aw(H).Name l:update('list',U)end)end
else if aw(m.boolean)and not I then task.wait()J(aw(af.Bind),'From configLoad no FLAG')end end end local S local T=an
'TextButton'{Visible=at(function()if not aw(F)then return aw(F)end return aw(Q)end),Parent=aB.get(aw(p.name)),Size=UDim2
.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=aw(v),
FontFace=aA('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground
,BackgroundTransparency=0.6,TextTransparency=0.1,[as'Activated']=function()if S then S:Disconnect()S=nil else task.
spawn(aw(E))end end,[ao]={aE(4),aF(16),aG(0,16),an'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aw(o.boolean)and aj.finger or aj.command,
ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}an'Frame'{Parent=u,Visible=at(function()if aw(n.string)~=''and
not string.find(aw(v):lower(),aw(n.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ao]={an'Frame'{ZIndex=2,Visible=at(function()if not aw(F)then return true end return false end
),BackgroundTransparency=ax(function()return aw(M)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ao]={aF(6),an'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=N},an
'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=N,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=at(function()return aw(G)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ao]={aE(0,5)}}}},an'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ao]={aH(b.LayoutOrder,c.Horizontal,d.Left,e.Center,UDim.new(0,3)),
an'TextButton'{Interactable=at(function()if not aw(F)then return false end return aw(M)end),Size=UDim2.new(0.225,0,1,0),
BackgroundColor3=ai.background2,BackgroundTransparency=N,[as'Activated']=function()if aw(o.boolean)then Q:set(true)S=aC(
T,15)return end O:set(true)q:update('boolean',true)end,[ao]={aF(6),aE(6),aH(b.LayoutOrder,c.Horizontal,d.Left,e.Center,
UDim.new(0,5)),an'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aw(o.boolean)and aj.
finger or aj.command,ImageColor3=ai.text2,ImageTransparency=N},an'TextLabel'{Visible=not aw(o.boolean),Size=UDim2.new(1,
-25,0,16),BackgroundTransparency=1,FontFace=aA('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=N,Text=at(function()return aw(O)and'Listening'or aw(H)and aw(
H).Name or'Waiting'end)},an'TextLabel'{Visible=aw(o.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=aA('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return aw(Q)and'Move Bind'or'Place Bind'end),TextTransparency=N}}},an'TextButton'{Visible=Q,
Interactable=at(function()if not aw(F)then return false end return aw(M)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=N,[as'Activated']=function()Q:set(false)T.Position=UDim2.
fromScale(0.5,0.5)end,[ao]={aF(6),an'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=N}}},an'Frame'{
Size=at(function()return UDim2.new(0.775,aw(Q)and-42 or-3,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=N,[ao]={aF(6),an'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ao]={aE(8),aH(b.
LayoutOrder,c.Horizontal,d.Left,e.Center,UDim.new(0,10)),an'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),
Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=v,TextTransparency=N,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if
aw(k.boolean)then if aw(m.boolean)then R()else ar(m.boolean):onChange(R)end end local U={}function U.SetName(V,W)local X
,Y=ay({SetName=W},{SetName=''})assert(X,table.concat(Y,'\n'))v:set(W)end function U.SetBind(V,W:EnumItem)local X,Y=ay({
SetBind=W},{SetBind=Enum.keyCode.C})assert(X,table.concat(Y,'\n'))J(W,'At :SetBind')end function U.Enable(V)F:set(true)
end function U.Disable(V)F:set(false)end return U end end)()end,[87]=function()local aa,ab,ac=a(87)local ad return(
function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)
return ag(af(ah),ai,aj)end end)()end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...)local ae=ac(ab.
Parent.Parent.Bundles.Fusion)return function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or Enum.SortOrder.
LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,
VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()end,[39]=function()local aa,
ab,ac=a(39)local ad return(function(...)type Set<T> ={[T]:any}export type Symbol={type:string,name:string}export type
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
return nil end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,aq=aj.New,aj.
Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local ar,as,at=aq.UICorner,aq.UIPadding,ac(ae.utilities)
local au,av,aw,ax=at.get,at.typecheck,at.animate,at.customFont local ay,az=av(af,{Text=''})assert(ay,table.concat(az,
'\n'))local aA,aB,aC,aD,aE=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Text local aF=am(au(aA.
string)==au(aC.tab).uid)ao(aA.string):onChange(function()aF:set(au(aA.string)==au(aC.tab).uid)end)local aG=aw(function()
return au(aF)and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if au(aB.string)~=''and not string.find(au(aE):lower(),
au(aB.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),Parent=aD,BackgroundTransparency=
aG,BackgroundColor3=ai.background2,[al]={ar(6),as(0,8),ak'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),
RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=aG,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0
,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()
return au(aE)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}local aH={}function aH.SetText(b,c)
local d,e=av({SetText=c},{SetText=''})assert(d,table.concat(e,'\n'))aE:set(c)end return aH end end)()end,[70]=function()
local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,aq=aj.New,aj.Children,aj.Value,aj.Computed,aj.
Observer,ac(ae.simpleElements)local ar,as,at,au=aq.UICorner,aq.UIPadding,aq.UITextSizeConstraint,ac(ae.utilities)local
av,aw,ax,ay,az=au.get,au.animate,au.getStringBounds,au.customFont,au.typecheck local aA,aB=az(af,{Title='',Body=''})
assert(aA,table.concat(aB,'\n'))local aC,aD,aE,aF,aG,aH=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af
.Title,af.Body local b=am(av(aC.string)==av(aE.tab).uid)ao(aC.string):onChange(function()b:set(av(aC.string)==av(aE.tab)
.uid)end)local c,d=aw(function()return av(b)and 0 or 1 end,40,1),am(0)task.spawn(function()d:set(ax(av(aH),{Font=ay(
'Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(av(aF).AbsoluteSize.X)}).Y)end)av(aF).Changed:Connect(
function(e)if e:lower()=='absolutesize'then d:set(ax(av(aH),{Font=ay('Montserrat',Enum.FontWeight.Medium),Size=12,Width=
math.round(av(aF).AbsoluteSize.X)}).Y)end end)ao(aH):onChange(function()d:set(ax(av(aH),{Font=ay('Montserrat',Enum.
FontWeight.Bold),Size=12,Width=math.round(av(aF).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function()if av(aD.string)
~=''and not string.find(av(aG):lower(),av(aD.string):lower())and not string.find(av(aH):lower(),av(aD.string):lower())
then return false end return true end),BackgroundColor3=ai.background2,Parent=aF,BackgroundTransparency=c,Size=an(
function()return UDim2.new(1,0,0,36+av(d))end),AutomaticSize=Enum.AutomaticSize.Y,[al]={ar(6),as(6),ak'TextLabel'{Name=
'Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextTransparency=c,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=ay('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,Text=aG,[al]={at(1,18)}},ak'TextLabel'{Name='Body',TextWrapped=true,RichText=true,
Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=c,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=ay('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,
Text=aH,Size=an(function()return UDim2.new(1,-4,0,av(d))end)}}}local e={}function e.SetBody(f,g)local h,i=az({SetBody=g}
,{SetBody=''})assert(h,table.concat(i,'\n'))aH:set(g)end function e.SetTitle(f,g)local h,i=az({SetTitle=g},{SetTitle=''}
)assert(h,table.concat(i,'\n'))aG:set(g)end return e end end)()end,[85]=function()local aa,ab,ac=a(85)local ad return(
function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number?,ag:number?)return ae.New
'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(
function(...)end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae=ab.Parent.Parent local
af,ag,ah,ai,aj,ak=ac(ae.Types),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.
updateAll),ac(ae.Utility.isSimilar),{}local al,am={__index=ak},{__mode='k'}function ak.get(an,ao:boolean?):any if ao~=
false then ag(an)end return an._value end function ak.set(an,ao:any,aq:boolean?)local ar=an._value if aq or not aj(ar,ao
)then an._value=ao ai(an)end end local function an<T>(ao:T):Types.State<T>local aq=setmetatable({type='State',kind=
'Value',dependentSet=setmetatable({},am),_value=ao},al)ah(aq)return aq end return an end)()end,[58]=function()local aa,
ab,ac=a(58)local ad return(function(...)return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',
minimize='rbxassetid://15556637715',close='rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown=
'rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check=
'rbxassetid://10709790644',command='rbxassetid://10723416765',input='rbxassetid://10734982297',search=
'rbxassetid://10734943674',finger='rbxassetid://10734929723',alert='rbxassetid://10709752996'}end)()end,[91]=function()
local aa,ab,ac=a(91)local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services)
,af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae local function aq(ar,as,at)return ar+(as-ar)*
at end local function ar(as)if not(ao)then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,aq(ak.
Position.X.Offset,an.X.Offset,as*ah),ao.Y.Scale,aq(ak.Position.Y.Offset,an.Y.Offset,as*ah))return end local at=(am-ai:
GetMouseLocation())local au,av=(ao.X.Offset-at.X),(ao.Y.Offset-at.Y)an=UDim2.new(ao.X.Scale,au,ao.Y.Scale,av)ak.Position
=UDim2.new(ao.X.Scale,aq(ak.Position.X.Offset,au,as*ah),ao.Y.Scale,aq(ak.Position.Y.Offset,av,as*ah))end ak.InputBegan:
Connect(function(as)if as.UserInputType==Enum.UserInputType.MouseButton1 or as.UserInputType==Enum.UserInputType.Touch
then al=true ao=ak.Position am=ai:GetMouseLocation()as.Changed:Connect(function()if as.UserInputState==Enum.
UserInputState.End then al=false end end)end end)local as=aj.Heartbeat:Connect(ar)return as end end)()end,[72]=function(
)local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,aq=aj.New,aj.Children,aj.Value,aj.Observer,aj.
OnEvent,ac(ae.utilities)local ar,as,at,au,av=aq.get,aq.animate,aq.typecheck,aq.customFont,ac(ae.simpleElements)local aw,
ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UIPadding,av.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,at(af,{Name='',Image=''},{af.Image and''or'Image'})assert(aD,table.concat(aE,
'\n'))local aF,aG,aH,b,c,d,e=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image
then e=af.Image d:set(true)end local f=am(false)an(aF.string):onChange(function()local g=ar(aF.string)f:set(g==aH.uid)
end)ak'TextButton'{Name=aH.uid,Parent=b,Size=UDim2.new(1,0,0,36),BackgroundColor3=as(function()return ar(f)and ai.get
'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aF:update('string',aH.uid)end,[al]={ay(4),ax(6),
aw(az.LayoutOrder,aA.Horizontal,aB.Left,aC.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=d,BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=e,ImageTransparency=as(function()return ar(f)and 0 or 0.6 end,40,1)},
ak'TextLabel'{Size=ar(d)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=au('Montserrat',Enum.FontWeight.Bold),
TextColor3=ai.text2,TextScaled=true,Text=c,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=as(function()return ar(f)and 0 or 0.6 end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}}}}if not ar(aG.boolean)then aG:update('boolean',true)aF:update('string',aH.uid)end return aH end end)()
end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab
:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[44]=function()local aa,ab,ac=
a(44)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,aq=ac(ae.PubTypes),ac(ae
.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(
ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.
needsDestruction),{}local ar,as={__index=aq},{__mode='k'}function aq.get(at,au:boolean?):any if au~=false then aj(at)end
return at._outputTable end function aq.update(at):boolean local au=at._inputIsState local av,aw,ax=if au then at.
_inputTable:get(false)else at._inputTable,{},false at._oldValueCache,at._valueCache=at._valueCache,at._oldValueCache
local ay,az=at._valueCache,at._oldValueCache table.clear(ay)for aA in pairs(at.dependencySet)do aA.dependentSet[at]=nil
end at._oldDependencySet,at.dependencySet=at.dependencySet,at._oldDependencySet table.clear(at.dependencySet)if au then
at._inputTable.dependentSet[at]=true at.dependencySet[at._inputTable]=true end for aB,aC in pairs(av)do local aD=az[aC]
local aE,aF,aG,aH=(aD==nil)if type(aD)=='table'and#aD>0 then local b=table.remove(aD,#aD)aF=b.value aG=b.valueData aH=b.
meta if#aD<=0 then az[aC]=nil end elseif aD~=nil then az[aC]=nil aE=true end if aG==nil then aG={dependencySet=
setmetatable({},as),oldDependencySet=setmetatable({},as),dependencyValues=setmetatable({},as)}end if aE==false then for
b,c in pairs(aG.dependencyValues)do if c~=b:get(false)then aE=true break end end end if aE then aG.oldDependencySet,aG.
dependencySet=aG.dependencySet,aG.oldDependencySet table.clear(aG.dependencySet)local b,c,d=ah(aG.dependencySet,at.
_processor,aC)if b then if at._destructor==nil and(ao(c)or ao(d))then am'destructorNeededForValues'end if aF~=nil then
local e,f=xpcall(at._destructor or an,ak,aF,aH)if not e then al('forValuesDestructorError',f)end end aF=c aH=d ax=true
else aG.oldDependencySet,aG.dependencySet=aG.dependencySet,aG.oldDependencySet al('forValuesProcessorError',c)end end
local b=ay[aC]if b==nil then b={}ay[aC]=b end table.insert(b,{value=aF,valueData=aG,meta=aH})aw[aB]=aF for c in pairs(aG
.dependencySet)do aG.dependencyValues[c]=c:get(false)at.dependencySet[c]=true c.dependentSet[at]=true end end for aD,aE
in pairs(az)do for aF,aG in ipairs(aE)do local aH,b=aG.value,aG.meta local c,d=xpcall(at._destructor or an,ak,aH,b)if
not c then al('forValuesDestructorError',d)end ax=true end table.clear(aE)end at._outputTable=aw return ax end
local function at<VI,VO,M>(au:PubTypes.CanBeState<{[any]:VI}>,av:(VI)->(VO,M?),aw:((VO,M?)->())?):Types.ForValues<VI,VO,
M>local ax=au.type=='State'and typeof(au.get)=='function'local ay=setmetatable({type='State',kind='ForValues',
dependencySet={},dependentSet=setmetatable({},as),_oldDependencySet={},_processor=av,_destructor=aw,_inputIsState=ax,
_inputTable=au,_outputTable={},_valueCache={},_oldValueCache={}},ar)ai(ay)ay:update()return ay end return at end)()end,[
71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(
ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.services local al,am,an=ak.UserInputService,ak.
RunService,ag.Fusion local ao,aq,ar,as,at,au,av,aw=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,an.Ref
,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.typecheck,aw.customFont,ac(ae.simpleElements)local aC,aD,aE,
aF,aG,aH,b,c,d=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,az(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max=0,
DisplayAsPercent=false,DecimalPlace=0},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or
'IsEnabled',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or
'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace'})assert(c,table.concat(d,'\n'))local e,f,g,h,i,j,k,l,m,n,o,p,q,
t,u=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.
Parent,af.Name,af.Callback,af.Max,af.Min,af.DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IsEnabled or ar(
true),af.DisabledText or ar'Component Disabled'local v,E,F=af.Default and ar(math.clamp(ax(af.Default),ax(o),ax(n)))or
ar(ax(o)),af.FLAG or ar'',false if ax(E)~=''then local G=ax(g.names)assert(not table.find(G,ax(E)),(
'FLAG "%s" already exists'):format(ax(E)))table.insert(G,ax(E))g:update('names',G)F=true end local G=ar(ax(e.string)==
ax(j.tab).uid)as(e.string):onChange(function()G:set(ax(e.string)==ax(j.tab).uid)end)local H=ay(function()return ax(G)and
0 or 1 end,40,1)local function I(J,K,L,M,N)return(1-((J-K)/(L-K)))*M+((J-K)/(L-K))*N end local function J(K)if ax(q)==0
then return math.floor(K)end return tonumber(string.format('%.'..ax(q)..'f',K))end local K,L=ar(0),ar(ax(o))as(L):
onChange(function()K:set(I(ax(L),ax(o),ax(n),0,1))if not ax(t)then return end task.spawn(ax(m),ax(L))end)local M,N,O,P=
ar(),ar(10),ar(),ar(false)al.InputEnded:Connect(function(Q)if(Q.UserInputType==Enum.UserInputType.MouseButton1 or Q.
UserInputType==Enum.UserInputType.Touch)and ax(P)then P:set(false)end end)local function Q()if F then if ax(h.boolean)
then local R=ax(g.list)[ax(E)]local S=az({[ax(E)]=R},{[ax(E)]=0})if R and S then L:set(math.clamp(R,ax(o),ax(n)))end as(
L):onChange(function()local T=ax(g.list)T[ax(E)]=ax(L)g:update('list',T)end)end else if ax(h.boolean)then task.wait()L:
set(ax(v))end end end ao'Frame'{Parent=k,Visible=au(function()if ax(i.string)~=''and not string.find(ax(l):lower(),ax(i.
string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,
BackgroundTransparency=ay(function()if ax(G)then return 0 end return 1 end,40,1),[aq]={aE(6),ao'Frame'{ZIndex=2,Visible=
au(function()if not ax(t)then return true end return false end),BackgroundTransparency=ay(function()return ax(G)and 0.2
or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={aE(6),ao'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=H},ao'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=H,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()return ax(u)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ao'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={
aC(aF.LayoutOrder,aG.Horizontal,aH.Left,b.Center,UDim.new(0,6)),aD(0,8),ao'TextLabel'{FontFace=aA('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=H,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=l,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},ao'Frame'{Size=UDim2.new(0.5,0,1,0),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aG.Horizontal,aH.Left,b.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.
new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),aC(aF.LayoutOrder,aG.Vertical,aH.Right,b.Center,UDim.new(0,1)),ao
'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=
ai.text2,TextTransparency=H,TextScaled=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(
function()if ax(p)then return tostring(J(ax(K)*100))..'%'end return ax(L)end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(R)local S=ax(O)if R=='AbsoluteSize'and S and S.
AbsoluteSize then N:set(S.AbsoluteSize.X)end end,[av]=O,[aq]={aD(0,5,0,5)}},ao'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(G)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(N),2)end,40,1),[aq]={aE(0,1)}}}},ao'TextButton'{Interactable=au(function()if not ax(t)then return false
end return ax(G)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=function()P:set(true)
end,[at'TouchLongPress']=function()P:set(true)end,[at'InputBegan']=function(R)if R.UserInputType==Enum.UserInputType.
MouseButton1 or R.UserInputType==Enum.UserInputType.Touch and ax(M)then local S,T=al:GetMouseLocation().X,ax(M).Size.X.
Offset local U=S-(ax(M).AbsolutePosition.X+T)while ax(P)and task.wait()do local V=al:GetMouseLocation().X local W=math.
clamp(T+(V-S)+U,0,ax(M).AbsoluteSize.X)L:set(J(I(W,0,ax(M).AbsoluteSize.X,ax(o),ax(n))))am.RenderStepped:Wait()end end
end,[av]=M,[aq]={aD(0,6),ao'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.new(1,0,0,4
),BackgroundColor3=ai.background,BackgroundTransparency=H,[aq]={aE(0,1)}},ao'Frame'{AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=H,Size=ay(function()return UDim2.new(ax(
K),0,0,4)end,40,1),[aq]={aE(0,1),ao'ImageLabel'{Image=aj.circle,BackgroundTransparency=1,ImageColor3=ai.selectedTab,
ImageTransparency=H,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),[aq]={ao
'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(2,8),BackgroundColor3=ai.
text,BackgroundTransparency=ay(function()if ax(G)then return 0.8 end return 1 end,40,1)}}}}}}}}}}}}}if ax(f.boolean)then
if ax(h.boolean)then Q()else as(h.boolean):onChange(Q)end else L:set(ax(v))end local R={}function R.SetName(S,T)local U,
V=az({SetName=T},{SetName=''})assert(U,table.concat(V,'\n'))l:set(T)end function R.SetValue(S,T)local U,V=az({SetValue=T
},{SetValue=0})assert(U,table.concat(V,'\n'))L:set(math.clamp(T,ax(o),ax(n)))end function R.Enable(S)t:set(true)end
function R.Disable(S)t:set(false)end return R end end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(
...)return{cannotAssignProperty="The class type '%s' has no assignable property '%s'.",cannotConnectChange=
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
[['%s' isn't a valid stage for a special key to be applied at.]]}end)()end,[74]=function()local aa,ab,ac=a(74)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,aq,ar,as,at=ak.New,ak.Children,ak.Value,ak.Computed,ak.Observer,ak.Ref,
ak.OnEvent,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.customFont,at.typecheck,ac(ae.simpleElements)local
az,aA,aB,aC,aD,aE,aF,aG,aH,b=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.
VerticalAlignment,Enum.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',Placeholder='',DisabledText='',
ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',FLAG='',IsEnabled=false,Callback=function()end},{af.
Placeholder and''or'Placeholder',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or'ClearTextOnFocus',af.
OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG and''or'FLAG',af.
DisabledText and''or'DisabledText'})assert(aH,table.concat(b,'\n'))local c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,t,u,v=ah.find
'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.Parent,af.Name,
af.Callback,af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.OnlyNumbers or an(false),af.Default or
an'',af.OnLeave or an(false),af.ClearTextOnFocus or an(false),af.Placeholder or an'',af.FLAG or an'',false if au(u)~=''
then local E=au(e.names)assert(not table.find(E,au(u)),('FLAG "%s" already exists'):format(au(u)))table.insert(E,au(u))e
:update('names',E)v=true end local E=an(au(c.string)==au(h.tab).uid)aq(c.string):onChange(function()E:set(au(c.string)==
au(h.tab).uid)end)local F,G,H,I=av(function()return au(E)and 0 or 1 end,40,1),an(),an'',an(false)local J,K=an(au(H)),an
''aq(H):onChange(function()if au(n)then if tonumber(au(H))or au(H)==''then J:set(au(H))end else J:set(au(H))end local L=
au(G)L.Text=au(J)if au(p)then return end if au(n)then if(tonumber(au(H))or au(H)=='')and au(K)~=au(H)then task.spawn(au(
k),au(H))K:set(au(H))end else if au(K)==au(H)then return end task.spawn(au(k),au(H))K:set(au(H))end end)aq(I):onChange(
function()if au(p)and not au(I)then if au(n)then if(tonumber(au(H))or au(H)=='')and au(K)~=au(H)then task.spawn(au(k),
au(H))K:set(au(H))end else if au(K)==au(H)then return end task.spawn(au(k),au(H))K:set(au(H))end end end)local function
L()if v then if au(f.boolean)then local M=au(e.list)[au(u)]local N=ax({[au(u)]=M},{[au(u)]=''})if M and N then if au(p)
then I:set(true)end H:set(M)if au(p)then I:set(false)end end aq(J):onChange(function()local O=au(e.list)O[au(u)]=au(J)e:
update('list',O)end)if not M then task.wait()if au(o)~=''then if au(p)then I:set(true)end H:set(au(o))if au(p)then I:
set(false)end end end end else if au(f.boolean)then task.wait()if au(o)~=''then if au(p)then I:set(true)end H:set(au(o))
if au(p)then I:set(false)end end end end end al'Frame'{Parent=i,Visible=ao(function()if au(g.string)~=''and not string.
find(au(j):lower(),au(g.string):lower())then return false end return true end),BackgroundTransparency=1,Size=UDim2.new(1
,0,0,36),[am]={al'Frame'{ZIndex=2,Visible=ao(function()if not au(l)then return true end return false end),
BackgroundTransparency=av(function()return au(E)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[am]={aA(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=F},al'TextLabel'{
FontFace=aw('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=F,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ao(
function()return au(m)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={az(0,5)}}}},al'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[am]={aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,3)),al'Frame'
{Size=UDim2.new(0.65,-3,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=F,[am]={aA(6),az(0,6),al'TextLabel'{
FontFace=aw('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=j,TextTransparency=F,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}},al'TextButton'{Interactable=ao(function()if not au(l)then return false end
return au(E)end),Size=UDim2.fromScale(0.35,1),BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=
function()local M=au(G)if M then M:CaptureFocus()end end,[am]={aA(6),az(0,6),aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.
Center,UDim.new(0,5)),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,
ImageColor3=ai.text2,ImageTransparency=F},al'TextBox'{Interactable=ao(function()if not au(l)then return false end return
au(E)end),Size=UDim2.new(1,-25,1,0),BackgroundTransparency=1,PlaceholderText=t,PlaceholderColor3=ai.text2,TextColor3=ai.
text,TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,FontFace=aw('Montserrat',Enum.FontWeight.Bold),Text=J,
TextTransparency=F,ClearTextOnFocus=q,[ar]=G,[as'Changed']=function(M)local N=au(G)if N and N.Text and M=='Text'then H:
set(N.Text)end end,[as'Focused']=function()I:set(true)end,[as'FocusLost']=function()I:set(false)end,[am]={aB(1,16)}}}}}}
}}if au(d.boolean)then if au(f.boolean)then L()else aq(f.boolean):onChange(L)end else if au(o)~=''then if au(p)then I:
set(true)end H:set(au(o))if au(p)then I:set(false)end end end local M={}function M.SetName(N,O)local P,Q=ax({SetName=O},
{SetName=''})assert(P,table.concat(Q,'\n'))j:set(O)end function M.SetInput(N,O)local P,Q=ax({SetInput=O},{SetInput=au(n)
and 1 or''})assert(P,table.concat(Q,'\n'))H:set(O)end function M.Enable(N)l:set(true)end function M.Disable(N)l:set(
false)end return M end end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae=ab.Parent.
Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.initDependency)type Set<T> ={[T]:any}local ai={}
local aj,ak:Set<Types.Observer> ={__index=ai},{}function ai.update(al):boolean for am,an in pairs(al._changeListeners)do
task.spawn(an)end return false end function ai.onChange(al,am:()->()):()->()local an={}al._numChangeListeners+=1 al.
_changeListeners[an]=am ak[al]=true local ao=false return function()if ao then return end ao=true al._changeListeners[an
]=nil al._numChangeListeners-=1 if al._numChangeListeners==0 then ak[al]=nil end end end local function al(am:PubTypes.
Value<any>):Types.Observer local an=setmetatable({type='State',kind='Observer',dependencySet={[am]=true},dependentSet={}
,_changeListeners={},_numChangeListeners=0},aj)ah(an)am.dependentSet[an]=true return an end return al end)()end,[42]=
function()local aa,ab,ac=a(42)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao
,aq,ar=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.
Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local as,at={__index=ar},{__mode='k'}function
ar.get(au,av:boolean?):any if av~=false then aj(au)end return au._outputTable end function ar.update(au):boolean local
av=au._inputIsState local aw,ax,ay,az,aA,aB,aC=if av then au._inputTable:get(false)else au._inputTable,au._oldInputTable
,au._outputTable,au._keyOIMap,au._keyIOMap,au._meta,false for aD in pairs(au.dependencySet)do aD.dependentSet[au]=nil
end au._oldDependencySet,au.dependencySet=au.dependencySet,au._oldDependencySet table.clear(au.dependencySet)if av then
au._inputTable.dependentSet[au]=true au.dependencySet[au._inputTable]=true end for aE,aF in pairs(aw)do local aG=au.
_keyData[aE]if aG==nil then aG={dependencySet=setmetatable({},at),oldDependencySet=setmetatable({},at),dependencyValues=
setmetatable({},at)}au._keyData[aE]=aG end local aH=ax[aE]==nil if aH==false then for b,c in pairs(aG.dependencyValues)
do if c~=b:get(false)then aH=true break end end end if aH then aG.oldDependencySet,aG.dependencySet=aG.dependencySet,aG.
oldDependencySet table.clear(aG.dependencySet)local b,c,d=ah(aG.dependencySet,au._processor,aE)if b then if au.
_destructor==nil and(aq(c)or aq(d))then an'destructorNeededForKeys'end local e,f=az[c],aA[aE]if e~=aE and aw[e]~=nil
then am('forKeysKeyCollision',nil,tostring(c),tostring(e),tostring(c))end if f~=c and az[f]==aE then local g=aB[f]local
h,i=xpcall(au._destructor or ao,ak,f,g)if not h then al('forKeysDestructorError',i)end az[f]=nil ay[f]=nil aB[f]=nil end
ax[aE]=aF aB[c]=d az[c]=aE aA[aE]=c ay[c]=aF aC=true else aG.oldDependencySet,aG.dependencySet=aG.dependencySet,aG.
oldDependencySet al('forKeysProcessorError',c)end end for b in pairs(aG.dependencySet)do aG.dependencyValues[b]=b:get(
false)au.dependencySet[b]=true b.dependentSet[au]=true end end for aG,aH in pairs(az)do if aw[aH]==nil then local b=aB[
aG]local c,d=xpcall(au._destructor or ao,ak,aG,b)if not c then al('forKeysDestructorError',d)end ax[aH]=nil aB[aG]=nil
az[aG]=nil aA[aH]=nil ay[aG]=nil au._keyData[aH]=nil aC=true end end return aC end local function au<KI,KO,M>(av:
PubTypes.CanBeState<{[KI]:any}>,aw:(KI)->(KO,M?),ax:((KO,M?)->())?):Types.ForKeys<KI,KO,M>local ay=av.type=='State'and
typeof(av.get)=='function'local az=setmetatable({type='State',kind='ForKeys',dependencySet={},dependentSet=setmetatable(
{},at),_oldDependencySet={},_processor=aw,_destructor=ax,_inputIsState=ay,_inputTable=av,_oldInputTable={},_outputTable=
{},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},as)ai(az)az:update()return az end return au end)()end,[88]=function()
local aa,ab,ac=a(88)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.
add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do ai:Disconnect()ae[ah]=nil end end return
af end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:table,af:table,ag:table?
):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(not ae[aj]or typeof(ae[aj])~=typeof(ak))and not table.find(ag,
aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah,ai end end)()end,
[89]=function()local aa,ab,ac=a(89)local ad return(function(...)local ae={Inter='rbxassetid://12187365364',Montserrat=
'rbxassetid://11702779517'}return function(af:string,ag:Enum.FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag
=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal if ae[af]then return Font.new(ae[af],ag,ah)else error(
'no font:',af)end end end)()end,[95]=function()local aa,ab,ac=a(95)local ad return(function(...)local ae,af,ag,ah={},{},
ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))
~='Instance'then ag(aj):onChange(function()if typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=
ah(aj)else warn(ah(aj).Name,' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)
else warn(ah(aj).Name,' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end
function af.remove(ai)if ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()
for ai,aj in ae do ae[ai]=nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[76]=function()
local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag,ah,ai=ac(ae.
Bundles),ac(ab.Parent.notification),ac(ae.utilities).references local aj,ak=ag.icons,ag.themeSystem ah{Parent=ai.get
'notificationList',Title='Darius Interface',Body=af,Duration=3,Image=aj.alert,ImageColor=ak.get'red'}end end)()end,[35]=
function()local aa,ab,ac=a(35)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.
Logging.messages)local function ah(ai:string,aj:Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai=
'unknownMessage'ak=ag[ai]end local al if aj==nil then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=
ak:gsub('ERROR_MESSAGE',aj.message)al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.
trace,...)end task.spawn(function(...)error(al:gsub('\n','\n    '),0)end,...)end return ah end)()end},{{1,2,{'Darius'},{
{80,2,{'simpleElements'},{{83,2,{'UIListLayout'}},{82,2,{'UICorner'}},{81,2,{'UIAspectRatioConstraint'}},{84,2,{
'UIPadding'}},{85,2,{'UITextSizeConstraint'}}}},{77,2,{'darius.story'}},{63,1,{'components'},{{64,2,{'button'}},{72,2,{
'tabButton'}},{65,2,{'divider'}},{67,2,{'keybind'}},{70,2,{'paragraph'}},{66,2,{'dropdown'}},{68,2,{'label'}},{71,2,{
'slider'}},{73,2,{'tabFrame'}},{69,2,{'notification'}},{74,2,{'textbox'}},{75,2,{'toggle'}},{76,2,{'warn'}}}},{86,2,{
'utilities'},{{87,2,{'animate'}},{91,2,{'drag'}},{92,2,{'get'}},{96,2,{'tween'}},{90,2,{'customFunctions'}},{95,2,{
'references'}},{93,2,{'getStringBounds'}},{94,2,{'randomString'}},{97,2,{'typecheck'}},{89,2,{'customFont'}},{88,2,{
'connections'}}}},{78,1,{'layouts'},{{79,2,{'main'}}}},{2,2,{'Bundles'},{{3,2,{'Fusion'},{{33,1,{'Logging'},{{37,2,{
'messages'}},{35,2,{'logErrorNonFatal'}},{38,2,{'parseError'}},{36,2,{'logWarn'}},{34,2,{'logError'}}}},{16,1,{
'Dependencies'},{{17,2,{'captureDependencies'}},{18,2,{'initDependency'}},{19,2,{'sharedState'}},{21,2,{'useDependency'}
},{20,2,{'updateAll'}}}},{40,1,{'State'},{{43,2,{'ForPairs'}},{47,2,{'unwrap'}},{42,2,{'ForKeys'}},{44,2,{'ForValues'}},
{45,2,{'Observer'}},{46,2,{'Value'}},{41,2,{'Computed'}}}},{39,2,{'PubTypes'}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{4,1
,{'Animation'},{{8,2,{'TweenScheduler'}},{11,2,{'packType'}},{10,2,{'lerpType'}},{5,2,{'Spring'}},{13,2,{'unpackType'}},
{7,2,{'Tween'}},{12,2,{'springCoefficients'}},{6,2,{'SpringScheduler'}},{9,2,{'getTweenRatio'}}}},{48,2,{'Types'}},{49,1
,{'Utility'},{{56,2,{'xtypeof'}},{51,2,{'cleanup'}},{53,2,{'isSimilar'}},{54,2,{'needsDestruction'}},{55,2,{
'restrictRead'}},{52,2,{'doNothing'}},{50,2,{'None'}}}},{22,1,{'Instances'},{{28,2,{'OnEvent'}},{27,2,{'OnChange'}},{30,
2,{'Ref'}},{29,2,{'Out'}},{26,2,{'New'}},{32,2,{'defaultProps'}},{23,2,{'Children'}},{25,2,{'Hydrate'}},{24,2,{'Cleanup'
}},{31,2,{'applyInstanceProps'}}}}}},{60,2,{'services'}},{57,2,{'data'}},{61,2,{'themeSystem'},{{62,2,{'default'}}}},{58
,2,{'icons'}},{59,2,{'lucide'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,
script,type,require,pcall,tostring,tonumber,_VERSION local av,aw,ax,ay,az,aA,aB=aj.insert,aj.remove,aj.freeze or
function(av)return av end,al.wrap,ae.sub,ae.match,ae.gmatch if at and az(at,1,4)=='Lune'then local aC,aD=aq(ao,
'@lune/task')if aC and aD then af=aD end end local aC=af and af.defer local aD,aE,aF,aG,aH,b,c,d,e=aC or function(aD,...
)ay(aD)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}
local f,g={GetFullName={{},function(f)local g,h=f.Name,f.Parent while h do g=h.Name..'.'..g h=h.Parent end return g end}
,GetChildren={{},function(f)local g={}for h in ai,e[f]do av(g,h)end return g end},GetDescendants={{},function(f)local g=
{}for h in ai,e[f]do av(g,h)for i,j in ai,h:GetDescendants()do av(g,j)end end return g end},FindFirstChild={{'string',
'boolean?'},function(f,g,h)local i=e[f]for j in ai,i do if j.Name==g then return j end end if h then for k in ai,i do
return k:FindFirstChild(g,true)end end end},FindFirstAncestor={{'string'},function(f,g)local h=f.Parent while h do if h.
Name==g then return h end h=h.Parent end end},WaitForChild={{'string','number?'},function(f,g)return f:FindFirstChild(g)
end}},{}for h,i in ai,f do local j,k,l=i[1],i[2],{}for m,n in ai,j do local o,p=aA(n,'^([^%?]+)(%??)')l[m]={o,p}end g[h]
=function(o,...)if not e[o]then ah("Expected ':' not '.' calling member function "..h,2)end local p={...}for q,t in ai,l
do local u=p[q]local v,E,F=an(u),t[1],t[2]if u==nil and not F then ah('Argument '..u..' missing or nil',3)end if E~=
'any'and v~=E and not(v=='nil'and F)then ah('Argument '..q..' expects type "'..E..'", got "'..v..'"',2)end end return k(
o,...)end end local function j(k,l,m)local n,o=(ag({},{__mode='k'}))local function p(q)ah(q..
' is not a valid (virtual) member of '..k..' "'..l..'"',3)end local function q(t)ah(
'Unable to assign (virtual) property '..t..'. Property is read only',3)end local t,u={},{}u.__metatable=false u.__index=
function(v,E)if E=='ClassName'then return k elseif E=='Name'then return l elseif E=='Parent'then return m elseif k==
'StringValue'and E=='Value'then return o else local F=g[E]if F then return F end end for F in ai,n do if F.Name==E then
return F end end p(E)end u.__newindex=function(v,E,F)if E=='ClassName'then q(E)elseif E=='Name'then l=F elseif E==
'Parent'then if F==t then return end if m~=nil then e[m][t]=nil end m=F if F~=nil then e[F][t]=true end elseif k==
'StringValue'and E=='Value'then o=F else p(E)end end u.__tostring=function()return l end ag(t,u)e[t]=n if m~=nil then e[
m][t]=true end return t end local function k(l,m)local n,o,p,q=l[1],l[2],l[3],l[4]local t=aE[o]local u=p and aw(p,1)or t
local v=j(t,u,m)aF[n]=v if p then for E,F in ai,p do v[E]=F end end if q then for E,F in ai,q do k(F,v)end end return v
end local l=j('Folder','['..ad..']')for m,n in ai,ab do k(n,l)end for o,p in ai,aa do local q=aF[o]aG[q]=p aH[q]=o local
t=q.ClassName if t=='LocalScript'or t=='Script'then av(c,q)end end local function q(t)local u,v=t.ClassName,b[t]if v and
u=='ModuleScript'then return ak(v)end local E=aG[t]local function F(G)G=ar(G)local H,I,J=t:GetFullName(),aA(G,
'[^:]+:(%d+): (.+)')if not I or not au then return H..':*: '..(J or G)end I=as(I)local K=aH[t]local L=au[K]local M=I-L+1
if M<0 then M='?'end return H..':'..M..': '..J end if u=='LocalScript'or u=='Script'then local G,H=aq(E)if not G then
ah(F(H),0)end else local G={aq(E)}local H=aw(G,1)if not H then local I=aw(G,1)ah(F(I),0)end b[t]=G return ak(G)end end
function a(t)local u=aF[t]local function v(E,...)local F={aq(E,...)}local G=aw(F,1)if not G then ah(F[1],3)end return
ak(F)end local E=ax(ag({},{__index=d,__newindex=function(E,F,G)d[F]=G end,__len=function()return#d end,__iter=function()
return ai,d end}))local F,G=ax{version=ac,envname=ad,shared=E,script=am,require=ao},u local function H(I,...)local J,K,L
=an(I),'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if J=='table'and e[I]
then if I.ClassName~='ModuleScript'then ah(K,2)elseif I==u then ah(L,2)end return q(I)elseif J=='string'and az(I,1,1)~=
'@'then if#I==0 then ah('Attempted to call require with empty string',2)end local M=u if az(I,1,1)=='/'then M=l elseif
az(I,1,2)=='./'then I=az(I,3)end local N for O in aB(I,'([^/]*)/?')do local P=O if O=='..'then P='Parent'end if P~=''
then local Q=M:FindFirstChild(P)if not Q then local R=M.Parent if R then Q=R:FindFirstChild(P)end end if Q then M=Q
elseif O~=N and O~='init'and O~='init.server'and O~='init.client'then ah('Virtual script path "'..I..'" not found',2)end
end N=O end if M.ClassName~='ModuleScript'then ah(K,2)elseif M==u then ah(L,2)end return q(M)end return v(ao,I,...)end
return F,G,H end for t,u in ai,c do aD(q,u)end return q(l:GetChildren()[1])