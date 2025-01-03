local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i=f.data,f.themeSystem,f.services local j,k=i.HttpService,f.Fusion local l,m=
k.Observer,d(c.utilities)local n,o,p,q,r,s,t,u=m.references,m.connections,m.customFunctions,m.randomString,m.get,m.
typecheck,d(c.layouts.main),d(c.Bundles.flags)local function v(w,x,y)y.Parent=x return d(c.components[w])(y)end local w=
{}function w.Window(x,y)if p.getgenv then if p.getgenv().dariusInstance then o:deleteConnections()n:clear()p.getgenv().
dariusInstance=nil end else if _G.dariusInstance then o:deleteConnections()n:clear()_G.dariusInstance=nil end end local
z,A=s(y,{Title='',Description='',HideBind=Enum.KeyCode.T,UseConfig=false,IsMobile=false,Theme={},noOffset=false,Parent=
Instance.new'Part'},{y.noOffset and''or'noOffset',y.IsMobile and''or'IsMobile',y.UseConfig and''or'UseConfig',y.Theme
and''or'Theme',y.Parent and''or'Parent'})assert(z,table.concat(A,'\n'))z,A=s(y,{Config=''},{y.UseConfig and''or'Config'}
)assert(z,table.concat(A,'\n'))h.create(y.Theme or{})g.add({string=''},'selectedTab')g.add({boolean=false},'isFirst')g.
add({number=y.noOffset and 0 or 58},'absoluteOffset')g.add({name=q(32)},'instanceName')g.add({binds={}},'currentBinds')g
.add({string=''},'searchText')g.add({boolean=true},'isVisible')local B=g.add({boolean=y.IsMobile},'isMobile')g.add({
boolean=false},'isListening')local C,D,E,F,G=g.find'flags',g.add({boolean=false},'configLoaded'),g.add({boolean=false},
'useConfig'),(g.add{data=y})if y.UseConfig then E:update('boolean',y.UseConfig)G=y.Config local H,I={'darius',`/{G}`},''
for J=1,#H do I=I..H[J]if not p.isfolder(I)then p.makefolder(I)end end w.Folder=I G=I..'/config.json'w.File=G if not p.
isfile(G)then p.writefile(G,'{}')end end w.flags={}setmetatable(w.flags,{__index=function(H,I)local J=r(C.list)if J[I]
then return J[I].user else return u.preregister(I).user end return nil end})local H=k.New'BindableEvent'{}w.
OnDestruction=H.Event t(y,H)local I,J=n.get'tabButtonList',n.get'tabFrameList'w[F.uid]={}local K=w[F.uid]function K.Tab(
L,M)local N=v('tabButton',I,M)local O=v('tabFrame',J,{uid=N.uid})K[N.uid]={}local P=K[N.uid]function P.Button(Q,R)R.tab=
N return v('button',O,R)end function P.Toggle(Q,R)R.tab=N return v('toggle',O,R)end function P.Dropdown(Q,R)R.tab=N
return v('dropdown',O,R)end function P.Label(Q,R)return v('label',O,{tab=N,Text=R})end function P.Paragraph(Q,R)R.tab=N
return v('paragraph',O,R)end function P.TextBox(Q,R)R.tab=N return v('textbox',O,R)end function P.Slider(Q,R)R.tab=N
return v('slider',O,R)end function P.Keybind(Q,R)R.tab=N return v('keybind',O,R)end function P.Divider(Q)return v(
'divider',O,{tab=N})end return K[N.uid]end w.Destroyed=false function w.Notify(L,M)return v('notification',n.get
'notificationList',M)end function w.Destroy(L)w.Destroyed=true H:Fire()o:deleteConnections()n:clear()H:Destroy()end
function w.LoadConfig(L)if not y.UseConfig then return end u.load(j:JSONDecode(p.readfile(G)))u.config:set(G)D:update(
'boolean',true)end function w.SetTheme(L,M)local N,O=s({['New Theme']=M},{['New Theme']={}})assert(N,table.concat(O,'\n'
))h.create(M)end if p.getgenv then p.getgenv().dariusInstance=w else _G.dariusInstance=w end return w[F.uid]end return w
end)()end,function()local b,c,d=a(2)local e return(function(...)return setmetatable({},{__index=function(f,g)if c:
FindFirstChild(g)then return d(c[g])else error('no bundle: '..g)end end})end)()end,function()local b,c,d=a(3)local e
return(function(...)local f,g=d(c.PubTypes),d(c.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>
export type CanBeState<T> =PubTypes.CanBeState<T>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value
<T>export type Computed<T> =PubTypes.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys
<KI,KO> =PubTypes.ForKeys<KI,KO>export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.
Observer export type Tween<T> =PubTypes.Tween<T>export type Spring<T> =PubTypes.Spring<T>type Fusion={version:PubTypes.
Version,New:(className:string)->((propertyTable:PubTypes.PropertyTable)->Instance),Hydrate:(target:Instance)->((
propertyTable:PubTypes.PropertyTable)->Instance),Ref:PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey,Children:PubTypes.
SpecialKey,Out:PubTypes.SpecialKey,OnEvent:(eventName:string)->PubTypes.SpecialKey,OnChange:(propertyName:string)->
PubTypes.SpecialKey,Value:<T>(initialValue:T)->Value<T>,Computed:<T>(callback:()->T,destructor:((T)->())?)->Computed<T>,
ForPairs:<KI,VI,KO,VO,M>(inputTable:CanBeState<{[KI]:VI}>,processor:(KI,VI)->(KO,VO,M?),destructor:((KO,VO,M?)->())?)->
ForPairs<KO,VO>,ForKeys:<KI,KO,M>(inputTable:CanBeState<{[KI]:any}>,processor:(KI)->(KO,M?),destructor:((KO,M?)->())?)->
ForKeys<KO,any>,ForValues:<VI,VO,M>(inputTable:CanBeState<{[any]:VI}>,processor:(VI)->(VO,M?),destructor:((VO,M?)->())?
)->ForValues<any,VO>,Observer:(watchedState:StateObject<any>)->Observer,Tween:<T>(goalState:StateObject<T>,tweenInfo:
TweenInfo?)->Tween<T>,Spring:<T>(goalState:StateObject<T>,speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->()
,doNothing:(...any)->()}return g('Fusion',{version={major=0,minor=2,isRelease=true},New=d(c.Instances.New),Hydrate=d(c.
Instances.Hydrate),Ref=d(c.Instances.Ref),Out=d(c.Instances.Out),Cleanup=d(c.Instances.Cleanup),Children=d(c.Instances.
Children),OnEvent=d(c.Instances.OnEvent),OnChange=d(c.Instances.OnChange),Value=d(c.State.Value),Computed=d(c.State.
Computed),ForPairs=d(c.State.ForPairs),ForKeys=d(c.State.ForKeys),ForValues=d(c.State.ForValues),Observer=d(c.State.
Observer),Tween=d(c.Animation.Tween),Spring=d(c.Animation.Spring),cleanup=d(c.Utility.cleanup),doNothing=d(c.Utility.
doNothing)})::Fusion end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)local f=c.Parent.Parent local g
,h,i,j,k,l,m,n,o,p,q,r=d(f.PubTypes),d(f.Types),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Animation.
unpackType),d(f.Animation.SpringScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.
Dependencies.updateAll),d(f.Utility.xtypeof),d(f.State.unwrap),{}local s,t={__index=r},{__mode='k'}function r.get(u,v:
boolean?):any if v~=false then m(u)end return u._currentValue end function r.setPosition(u,v:PubTypes.Animatable)local w
=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end u._springPositions=k(v,w)u.
_currentValue=v l.add(u)o(u)end function r.setVelocity(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType
then i('springTypeMismatch',nil,w,u._currentType)end u._springVelocities=k(v,w)l.add(u)end function r.addVelocity(u,v:
PubTypes.Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end local x=
k(v,w)for y,z in ipairs(x)do u._springVelocities[y]+=z end l.add(u)end function r.update(u):boolean local v=u._goalState
:get(false)if v==u._goalValue then local w=q(u._damping)if typeof(w)~='number'then j('mistypedSpringDamping',nil,typeof(
w))elseif w<0 then j('invalidSpringDamping',nil,w)else u._currentDamping=w end local x=q(u._speed)if typeof(x)~='number'
then j('mistypedSpringSpeed',nil,typeof(x))elseif x<0 then j('invalidSpringSpeed',nil,x)else u._currentSpeed=x end
return false else u._goalValue=v local w,x=u._currentType,typeof(v)u._currentType=x local y=k(v,x)local z=#y u.
_springGoals=y if x~=w then u._currentValue=u._goalValue local A,B=table.create(z,0),table.create(z,0)for C,D in ipairs(
y)do A[C]=D end u._springPositions=A u._springVelocities=B l.remove(u)return true elseif z==0 then u._currentValue=u.
_goalValue return true else l.add(u)return false end end end local function u<T>(v:PubTypes.Value<T>,w:PubTypes.
CanBeState<number>?,x:PubTypes.CanBeState<number>?):Types.Spring<T>if w==nil then w=10 end if x==nil then x=1 end local
y={[v]=true}if p(w)=='State'then y[w]=true end if p(x)=='State'then y[x]=true end local z=setmetatable({type='State',
kind='Spring',dependencySet=y,dependentSet=setmetatable({},t),_speed=w,_damping=x,_goalState=v,_goalValue=nil,
_currentType=nil,_currentValue=nil,_currentSpeed=q(w),_currentDamping=q(x),_springPositions=nil,_springGoals=nil,
_springVelocities=nil},s)n(z)v.dependentSet[z]=true z:update()return z end return u end)()end,[6]=function()local b,c,d=
a(6)local e return(function(...)local f,g=cloneref and cloneref(game:GetService'RunService')or game:GetService
'RunService',c.Parent.Parent local h,i,j,k=d(g.Types),d(g.Animation.packType),d(g.Animation.springCoefficients),d(g.
Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local l,m,n:Set<Spring>,o={},0.0001,{},os.
clock()function l.add(p:Spring)p._lastSchedule=o p._startDisplacements={}p._startVelocities={}for q,r in ipairs(p.
_springGoals)do p._startDisplacements[q]=p._springPositions[q]-r p._startVelocities[q]=p._springVelocities[q]end n[p]=
true end function l.remove(p:Spring)n[p]=nil end local function p()local q:Set<Spring> ={}o=os.clock()for r in pairs(n)
do local s,t,u,v=j(o-r._lastSchedule,r._currentDamping,r._currentSpeed)local w,x,y,z,A=r._springPositions,r.
_springVelocities,r._startDisplacements,r._startVelocities,false for B,C in ipairs(r._springGoals)do local D,E=y[B],z[B]
local F,G=D*s+E*t,D*u+E*v if math.abs(F)>m or math.abs(G)>m then A=true end w[B]=F+C x[B]=G end if not A then q[r]=true
end end for s in pairs(n)do s._currentValue=i(s._springPositions,s._currentType)k(s)end for t in pairs(q)do n[t]=nil end
end f:BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.Value,p)return l end)()end,[7]=function()
local b,c,d=a(7)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o=d(f.PubTypes),d(f.Types),d(f
.Animation.TweenScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Logging.logError),d(f.
Logging.logErrorNonFatal),d(f.Utility.xtypeof),{}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u
~=false then j(t)end return t._currentValue end function o.update(t):boolean local u=t._goalState:get(false)if u==t.
_nextValue and not t._currentlyAnimating then return false end local v=t._tweenInfo if t._tweenInfoIsState then v=v:get(
)end if typeof(v)~='TweenInfo'then m('mistypedTweenInfo',nil,typeof(v))return false end t._prevValue=t._currentValue t.
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
insert(n,i[o])end end i=n n=nil end function j.add(k:table,l:string,m:boolean):table m=m or false if not m then for n,o
in k do k[n]=h(o)end end k.__tag=l or nil k.uid=f(16)setmetatable(k,{__index={update=function(n,o,p)j.update(n.uid,o,p)
end,delete=function()j.delete(k.uid)end}})table.insert(i,k)return j.find(k.uid)end return j end)()end,[58]=function()
local b,c,d=a(58)local e return(function(...)local f,g,h=d(c.Parent).data,d(c.Parent.Parent.utilities).get,d(c.Parent).
services local i,j=h.HttpService,d(c.Parent).Fusion local k,l,m,n,o,p,q,t=j.Observer,j.Value,d(c.Parent.Parent.utilities
).connections,d(c.Parent.Parent.utilities).customFunctions,{},f.add({list={}},'flags'),{},{}local u,v={toggle=function(u
,v,E)local F=u.boolean m.add(k(F):onChange(function()if not E then task.spawn(o.export)end local G=g(F)v:Fire(G)end))end
,dropdown=function(u,v,E)local F=u.multiselect and u.items or u.item m.add(k(F):onChange(function()if not E then task.
spawn(o.export)end local G=g(F)v:Fire(G)end))end,keybind=function(u,v,E)local F=u.mobile and u.coordinate or u.keycode m
.add(k(F):onChange(function()if not E then task.spawn(o.export)end local G=g(F)v:Fire(G)end))end,slider=function(u,v,E)
local F=u.percentageOf m.add(k(F):onChange(function()if not E then task.spawn(o.export)end local G=g(F)v:Fire(G)end))end
,textbox=function(u,v,E)local F=u.correctText m.add(k(F):onChange(function()if not E then task.spawn(o.export)end local
G=g(F)v:Fire(G)end))end},{toggle=function(u)local v={}if u.boolean then v.boolean=g(u.boolean)end if u.keycode then v.
keycode=g(u.keycode)end return v end,dropdown=function(u)return u.multiselect and g(u.items)or g(u.item)end,keybind=
function(u)local v={}if u.keycode then v.keycode=g(u.keycode)end if u.coordinate then v.coordinate=g(u.coordinate)end
return v end,slider=function(u)return g(u.percentageOf)end,textbox=function(u)return g(u.correctText)end}function o.
preregister(E)local F,G=j.New'BindableEvent'{},{}function G.Connect(H,I)assert(typeof(I)=='function',
'Connect only takes functions')m.add(F.Event:Connect(I))end local H H={name=E,status={},old=l(nil),type='unknown',
preregistered=true,bindableEvent=F,file=l{},user={Value=nil,OnChange=setmetatable(G,{__newindex=function(I,J,K)return
nil end})}}t[E]=H local I=g(p.list)I[H.name]=H p:update('list',I)return H end function o.register(E,F,G,H)assert(not
table.find(q,E),'Flags must all be unique!')table.insert(q,E)local I,J=j.New'BindableEvent'{},{}function J.Connect(K,L)
assert(typeof(L)=='function','Connect')m.add(I.Event:Connect(L))end local K if not t[E]then K={name=E,status=F,old=l(nil
),type=G,private=H,preregistered=false,bindableEvent=I,file=l{},user={Value=nil,OnChange=setmetatable(J,{__newindex=
function()return nil end})}}u[K.type](K.status,K.bindableEvent,K.private)local L=g(p.list)L[K.name]=K p:update('list',L)
else K=t[E]K.type=G K.preregistered=false K.status=F K.private=H u[K.type](K.status,K.bindableEvent,K.private)t[K.name]=
nil end return K end o.config=l''function o.export()local E,F={},g(p.list)for G,H in F do if H.private then continue end
if H.type=='unknown'then continue end E[H.name]=v[H.type](H.status)end if g(o.config)~=''then n.writefile(g(o.config),i:
JSONEncode(E))end end function o.load(E)for F,G in E do local H=g(p.list)[F]if not H then continue end H.file:set(G)end
end return o end)()end,[59]=function()local b,c,d=a(59)local e return(function(...)return{lock=
'rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize='rbxassetid://15556637715',close=
'rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown=
'rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command=
'rbxassetid://10723416765',input='rbxassetid://10734982297',search='rbxassetid://10734943674',finger=
'rbxassetid://10734929723',alert='rbxassetid://10709752996'}end)()end,[60]=function()local b,c,d=a(60)local e return(
function(...)local f={accessibility='rbxassetid://10709751939',activity='rbxassetid://10709752035',['air-vent']=
'rbxassetid://10709752131',airplay='rbxassetid://10709752254',['alarm-check']='rbxassetid://10709752405',['alarm-clock']
='rbxassetid://10709752630',['alarm-clock-off']='rbxassetid://10709752508',['alarm-minus']='rbxassetid://10709752732',[
'alarm-plus']='rbxassetid://10709752825',album='rbxassetid://10709752906',['alert-circle']='rbxassetid://10709752996',[
'alert-octagon']='rbxassetid://10709753064',['alert-triangle']='rbxassetid://10709753149',['align-center']=
'rbxassetid://10709753570',['align-center-horizontal']='rbxassetid://10709753272',['align-center-vertical']=
'rbxassetid://10709753421',['align-end-horizontal']='rbxassetid://10709753692',['align-end-vertical']=
'rbxassetid://10709753808',['align-horizontal-distribute-center']='rbxassetid://10747779791',[
'align-horizontal-distribute-end']='rbxassetid://10747784534',['align-horizontal-distribute-start']=
'rbxassetid://10709754118',['align-horizontal-justify-center']='rbxassetid://10709754204',[
'align-horizontal-justify-end']='rbxassetid://10709754317',['align-horizontal-justify-start']='rbxassetid://10709754436'
,['align-horizontal-space-around']='rbxassetid://10709754590',['align-horizontal-space-between']=
'rbxassetid://10709754749',['align-justify']='rbxassetid://10709759610',['align-left']='rbxassetid://10709759764',[
'align-right']='rbxassetid://10709759895',['align-start-horizontal']='rbxassetid://10709760051',['align-start-vertical']
='rbxassetid://10709760244',['align-vertical-distribute-center']='rbxassetid://10709760351',[
'align-vertical-distribute-end']='rbxassetid://10709760434',['align-vertical-distribute-start']=
'rbxassetid://10709760612',['align-vertical-justify-center']='rbxassetid://10709760814',['align-vertical-justify-end']=
'rbxassetid://10709761003',['align-vertical-justify-start']='rbxassetid://10709761176',['align-vertical-space-around']=
'rbxassetid://10709761324',['align-vertical-space-between']='rbxassetid://10709761434',anchor='rbxassetid://10709761530'
,angry='rbxassetid://10709761629',annoyed='rbxassetid://10709761722',aperture='rbxassetid://10709761813',apple=
'rbxassetid://10709761889',archive='rbxassetid://10709762233',['archive-restore']='rbxassetid://10709762058',armchair=
'rbxassetid://10709762327',['arrow-big-down']='rbxassetid://10747796644',['arrow-big-left']='rbxassetid://10709762574',[
'arrow-big-right']='rbxassetid://10709762727',['arrow-big-up']='rbxassetid://10709762879',['arrow-down']=
'rbxassetid://10709767827',['arrow-down-circle']='rbxassetid://10709763034',['arrow-down-left']=
'rbxassetid://10709767656',['arrow-down-right']='rbxassetid://10709767750',['arrow-left']='rbxassetid://10709768114',[
'arrow-left-circle']='rbxassetid://10709767936',['arrow-left-right']='rbxassetid://10709768019',['arrow-right']=
'rbxassetid://10709768347',['arrow-right-circle']='rbxassetid://10709768226',['arrow-up']='rbxassetid://10709768939',[
'arrow-up-circle']='rbxassetid://10709768432',['arrow-up-down']='rbxassetid://10709768538',['arrow-up-left']=
'rbxassetid://10709768661',['arrow-up-right']='rbxassetid://10709768787',asterisk='rbxassetid://10709769095',['at-sign']
='rbxassetid://10709769286',award='rbxassetid://10709769406',axe='rbxassetid://10709769508',['axis-3d']=
'rbxassetid://10709769598',baby='rbxassetid://10709769732',backpack='rbxassetid://10709769841',['baggage-claim']=
'rbxassetid://10709769935',banana='rbxassetid://10709770005',banknote='rbxassetid://10709770178',['bar-chart']=
'rbxassetid://10709773755',['bar-chart-2']='rbxassetid://10709770317',['bar-chart-3']='rbxassetid://10709770431',[
'bar-chart-4']='rbxassetid://10709770560',['bar-chart-horizontal']='rbxassetid://10709773669',barcode=
'rbxassetid://10747360675',baseline='rbxassetid://10709773863',bath='rbxassetid://10709773963',battery=
'rbxassetid://10709774640',['battery-charging']='rbxassetid://10709774068',['battery-full']='rbxassetid://10709774206',[
'battery-low']='rbxassetid://10709774370',['battery-medium']='rbxassetid://10709774513',beaker=
'rbxassetid://10709774756',bed='rbxassetid://10709775036',['bed-double']='rbxassetid://10709774864',['bed-single']=
'rbxassetid://10709774968',beer='rbxassetid://10709775167',bell='rbxassetid://10709775704',['bell-minus']=
'rbxassetid://10709775241',['bell-off']='rbxassetid://10709775320',['bell-plus']='rbxassetid://10709775448',['bell-ring'
]='rbxassetid://10709775560',bike='rbxassetid://10709775894',binary='rbxassetid://10709776050',bitcoin=
'rbxassetid://10709776126',bluetooth='rbxassetid://10709776655',['bluetooth-connected']='rbxassetid://10709776240',[
'bluetooth-off']='rbxassetid://10709776344',['bluetooth-searching']='rbxassetid://10709776501',bold=
'rbxassetid://10747813908',bomb='rbxassetid://10709781460',bone='rbxassetid://10709781605',book=
'rbxassetid://10709781824',['book-open']='rbxassetid://10709781717',bookmark='rbxassetid://10709782154',[
'bookmark-minus']='rbxassetid://10709781919',['bookmark-plus']='rbxassetid://10709782044',bot='rbxassetid://10709782230'
,box='rbxassetid://10709782497',['box-select']='rbxassetid://10709782342',boxes='rbxassetid://10709782582',briefcase=
'rbxassetid://10709782662',brush='rbxassetid://10709782758',bug='rbxassetid://10709782845',building=
'rbxassetid://10709783051',['building-2']='rbxassetid://10709782939',bus='rbxassetid://10709783137',cake=
'rbxassetid://10709783217',calculator='rbxassetid://10709783311',calendar='rbxassetid://10709789505',['calendar-check']=
'rbxassetid://10709783474',['calendar-check-2']='rbxassetid://10709783392',['calendar-clock']='rbxassetid://10709783577'
,['calendar-days']='rbxassetid://10709783673',['calendar-heart']='rbxassetid://10709783835',['calendar-minus']=
'rbxassetid://10709783959',['calendar-off']='rbxassetid://10709788784',['calendar-plus']='rbxassetid://10709788937',[
'calendar-range']='rbxassetid://10709789053',['calendar-search']='rbxassetid://10709789200',['calendar-x']=
'rbxassetid://10709789407',['calendar-x-2']='rbxassetid://10709789329',camera='rbxassetid://10709789686',['camera-off']=
'rbxassetid://10747822677',car='rbxassetid://10709789810',carrot='rbxassetid://10709789960',cast=
'rbxassetid://10709790097',charge='rbxassetid://10709790202',check='rbxassetid://10709790644',['check-circle']=
'rbxassetid://10709790387',['check-circle-2']='rbxassetid://10709790298',['check-square']='rbxassetid://10709790537',[
'chef-hat']='rbxassetid://10709790757',cherry='rbxassetid://10709790875',['chevron-down']='rbxassetid://10709790948',[
'chevron-first']='rbxassetid://10709791015',['chevron-last']='rbxassetid://10709791130',['chevron-left']=
'rbxassetid://10709791281',['chevron-right']='rbxassetid://10709791437',['chevron-up']='rbxassetid://10709791523',[
'chevrons-down']='rbxassetid://10709796864',['chevrons-down-up']='rbxassetid://10709791632',['chevrons-left']=
'rbxassetid://10709797151',['chevrons-left-right']='rbxassetid://10709797006',['chevrons-right']=
'rbxassetid://10709797382',['chevrons-right-left']='rbxassetid://10709797274',['chevrons-up']='rbxassetid://10709797622'
,['chevrons-up-down']='rbxassetid://10709797508',chrome='rbxassetid://10709797725',circle='rbxassetid://10709798174',[
'circle-dot']='rbxassetid://10709797837',['circle-ellipsis']='rbxassetid://10709797985',['circle-slashed']=
'rbxassetid://10709798100',citrus='rbxassetid://10709798276',clapperboard='rbxassetid://10709798350',clipboard=
'rbxassetid://10709799288',['clipboard-check']='rbxassetid://10709798443',['clipboard-copy']='rbxassetid://10709798574',
['clipboard-edit']='rbxassetid://10709798682',['clipboard-list']='rbxassetid://10709798792',['clipboard-signature']=
'rbxassetid://10709798890',['clipboard-type']='rbxassetid://10709798999',['clipboard-x']='rbxassetid://10709799124',
clock='rbxassetid://10709805144',['clock-1']='rbxassetid://10709799535',['clock-10']='rbxassetid://10709799718',[
'clock-11']='rbxassetid://10709799818',['clock-12']='rbxassetid://10709799962',['clock-2']='rbxassetid://10709803876',[
'clock-3']='rbxassetid://10709803989',['clock-4']='rbxassetid://10709804164',['clock-5']='rbxassetid://10709804291',[
'clock-6']='rbxassetid://10709804435',['clock-7']='rbxassetid://10709804599',['clock-8']='rbxassetid://10709804784',[
'clock-9']='rbxassetid://10709804996',cloud='rbxassetid://10709806740',['cloud-cog']='rbxassetid://10709805262',[
'cloud-drizzle']='rbxassetid://10709805371',['cloud-fog']='rbxassetid://10709805477',['cloud-hail']=
'rbxassetid://10709805596',['cloud-lightning']='rbxassetid://10709805727',['cloud-moon']='rbxassetid://10709805942',[
'cloud-moon-rain']='rbxassetid://10709805838',['cloud-off']='rbxassetid://10709806060',['cloud-rain']=
'rbxassetid://10709806277',['cloud-rain-wind']='rbxassetid://10709806166',['cloud-snow']='rbxassetid://10709806374',[
'cloud-sun']='rbxassetid://10709806631',['cloud-sun-rain']='rbxassetid://10709806475',cloudy='rbxassetid://10709806859',
clover='rbxassetid://10709806995',code='rbxassetid://10709810463',['code-2']='rbxassetid://10709807111',codepen=
'rbxassetid://10709810534',codesandbox='rbxassetid://10709810676',coffee='rbxassetid://10709810814',cog=
'rbxassetid://10709810948',coins='rbxassetid://10709811110',columns='rbxassetid://10709811261',command=
'rbxassetid://10709811365',compass='rbxassetid://10709811445',component='rbxassetid://10709811595',['concierge-bell']=
'rbxassetid://10709811706',connection='rbxassetid://10747361219',contact='rbxassetid://10709811834',contrast=
'rbxassetid://10709811939',cookie='rbxassetid://10709812067',copy='rbxassetid://10709812159',copyleft=
'rbxassetid://10709812251',copyright='rbxassetid://10709812311',['corner-down-left']='rbxassetid://10709812396',[
'corner-down-right']='rbxassetid://10709812485',['corner-left-down']='rbxassetid://10709812632',['corner-left-up']=
'rbxassetid://10709812784',['corner-right-down']='rbxassetid://10709812939',['corner-right-up']=
'rbxassetid://10709813094',['corner-up-left']='rbxassetid://10709813185',['corner-up-right']='rbxassetid://10709813281',
cpu='rbxassetid://10709813383',croissant='rbxassetid://10709818125',crop='rbxassetid://10709818245',cross=
'rbxassetid://10709818399',crosshair='rbxassetid://10709818534',crown='rbxassetid://10709818626',['cup-soda']=
'rbxassetid://10709818763',['curly-braces']='rbxassetid://10709818847',currency='rbxassetid://10709818931',database=
'rbxassetid://10709818996',delete='rbxassetid://10709819059',diamond='rbxassetid://10709819149',['dice-1']=
'rbxassetid://10709819266',['dice-2']='rbxassetid://10709819361',['dice-3']='rbxassetid://10709819508',['dice-4']=
'rbxassetid://10709819670',['dice-5']='rbxassetid://10709819801',['dice-6']='rbxassetid://10709819896',dices=
'rbxassetid://10723343321',diff='rbxassetid://10723343416',disc='rbxassetid://10723343537',divide=
'rbxassetid://10723343805',['divide-circle']='rbxassetid://10723343636',['divide-square']='rbxassetid://10723343737',[
'dollar-sign']='rbxassetid://10723343958',download='rbxassetid://10723344270',['download-cloud']=
'rbxassetid://10723344088',droplet='rbxassetid://10723344432',droplets='rbxassetid://10734883356',drumstick=
'rbxassetid://10723344737',edit='rbxassetid://10734883598',['edit-2']='rbxassetid://10723344885',['edit-3']=
'rbxassetid://10723345088',egg='rbxassetid://10723345518',['egg-fried']='rbxassetid://10723345347',electricity=
'rbxassetid://10723345749',['electricity-off']='rbxassetid://10723345643',equal='rbxassetid://10723345990',['equal-not']
='rbxassetid://10723345866',eraser='rbxassetid://10723346158',euro='rbxassetid://10723346372',expand=
'rbxassetid://10723346553',['external-link']='rbxassetid://10723346684',eye='rbxassetid://10723346959',['eye-off']=
'rbxassetid://10723346871',factory='rbxassetid://10723347051',fan='rbxassetid://10723354359',['fast-forward']=
'rbxassetid://10723354521',feather='rbxassetid://10723354671',figma='rbxassetid://10723354801',file=
'rbxassetid://10723374641',['file-archive']='rbxassetid://10723354921',['file-audio']='rbxassetid://10723355148',[
'file-audio-2']='rbxassetid://10723355026',['file-axis-3d']='rbxassetid://10723355272',['file-badge']=
'rbxassetid://10723355622',['file-badge-2']='rbxassetid://10723355451',['file-bar-chart']='rbxassetid://10723355887',[
'file-bar-chart-2']='rbxassetid://10723355746',['file-box']='rbxassetid://10723355989',['file-check']=
'rbxassetid://10723356210',['file-check-2']='rbxassetid://10723356100',['file-clock']='rbxassetid://10723356329',[
'file-code']='rbxassetid://10723356507',['file-cog']='rbxassetid://10723356830',['file-cog-2']=
'rbxassetid://10723356676',['file-diff']='rbxassetid://10723357039',['file-digit']='rbxassetid://10723357151',[
'file-down']='rbxassetid://10723357322',['file-edit']='rbxassetid://10723357495',['file-heart']=
'rbxassetid://10723357637',['file-image']='rbxassetid://10723357790',['file-input']='rbxassetid://10723357933',[
'file-json']='rbxassetid://10723364435',['file-json-2']='rbxassetid://10723364361',['file-key']=
'rbxassetid://10723364605',['file-key-2']='rbxassetid://10723364515',['file-line-chart']='rbxassetid://10723364725',[
'file-lock']='rbxassetid://10723364957',['file-lock-2']='rbxassetid://10723364861',['file-minus']=
'rbxassetid://10723365254',['file-minus-2']='rbxassetid://10723365086',['file-output']='rbxassetid://10723365457',[
'file-pie-chart']='rbxassetid://10723365598',['file-plus']='rbxassetid://10723365877',['file-plus-2']=
'rbxassetid://10723365766',['file-question']='rbxassetid://10723365987',['file-scan']='rbxassetid://10723366167',[
'file-search']='rbxassetid://10723366550',['file-search-2']='rbxassetid://10723366340',['file-signature']=
'rbxassetid://10723366741',['file-spreadsheet']='rbxassetid://10723366962',['file-symlink']='rbxassetid://10723367098',[
'file-terminal']='rbxassetid://10723367244',['file-text']='rbxassetid://10723367380',['file-type']=
'rbxassetid://10723367606',['file-type-2']='rbxassetid://10723367509',['file-up']='rbxassetid://10723367734',[
'file-video']='rbxassetid://10723373884',['file-video-2']='rbxassetid://10723367834',['file-volume']=
'rbxassetid://10723374172',['file-volume-2']='rbxassetid://10723374030',['file-warning']='rbxassetid://10723374276',[
'file-x']='rbxassetid://10723374544',['file-x-2']='rbxassetid://10723374378',files='rbxassetid://10723374759',film=
'rbxassetid://10723374981',filter='rbxassetid://10723375128',fingerprint='rbxassetid://10723375250',flag=
'rbxassetid://10723375890',['flag-off']='rbxassetid://10723375443',['flag-triangle-left']='rbxassetid://10723375608',[
'flag-triangle-right']='rbxassetid://10723375727',flame='rbxassetid://10723376114',flashlight='rbxassetid://10723376471'
,['flashlight-off']='rbxassetid://10723376365',['flask-conical']='rbxassetid://10734883986',['flask-round']=
'rbxassetid://10723376614',['flip-horizontal']='rbxassetid://10723376884',['flip-horizontal-2']=
'rbxassetid://10723376745',['flip-vertical']='rbxassetid://10723377138',['flip-vertical-2']='rbxassetid://10723377026',
flower='rbxassetid://10747830374',['flower-2']='rbxassetid://10723377305',focus='rbxassetid://10723377537',folder=
'rbxassetid://10723387563',['folder-archive']='rbxassetid://10723384478',['folder-check']='rbxassetid://10723384605',[
'folder-clock']='rbxassetid://10723384731',['folder-closed']='rbxassetid://10723384893',['folder-cog']=
'rbxassetid://10723385213',['folder-cog-2']='rbxassetid://10723385036',['folder-down']='rbxassetid://10723385338',[
'folder-edit']='rbxassetid://10723385445',['folder-heart']='rbxassetid://10723385545',['folder-input']=
'rbxassetid://10723385721',['folder-key']='rbxassetid://10723385848',['folder-lock']='rbxassetid://10723386005',[
'folder-minus']='rbxassetid://10723386127',['folder-open']='rbxassetid://10723386277',['folder-output']=
'rbxassetid://10723386386',['folder-plus']='rbxassetid://10723386531',['folder-search']='rbxassetid://10723386787',[
'folder-search-2']='rbxassetid://10723386674',['folder-symlink']='rbxassetid://10723386930',['folder-tree']=
'rbxassetid://10723387085',['folder-up']='rbxassetid://10723387265',['folder-x']='rbxassetid://10723387448',folders=
'rbxassetid://10723387721',['form-input']='rbxassetid://10723387841',forward='rbxassetid://10723388016',frame=
'rbxassetid://10723394389',framer='rbxassetid://10723394565',frown='rbxassetid://10723394681',fuel=
'rbxassetid://10723394846',['function-square']='rbxassetid://10723395041',gamepad='rbxassetid://10723395457',[
'gamepad-2']='rbxassetid://10723395215',gauge='rbxassetid://10723395708',gavel='rbxassetid://10723395896',gem=
'rbxassetid://10723396000',ghost='rbxassetid://10723396107',gift='rbxassetid://10723396402',['gift-card']=
'rbxassetid://10723396225',['git-branch']='rbxassetid://10723396676',['git-branch-plus']='rbxassetid://10723396542',[
'git-commit']='rbxassetid://10723396812',['git-compare']='rbxassetid://10723396954',['git-fork']=
'rbxassetid://10723397049',['git-merge']='rbxassetid://10723397165',['git-pull-request']='rbxassetid://10723397431',[
'git-pull-request-closed']='rbxassetid://10723397268',['git-pull-request-draft']='rbxassetid://10734884302',glass=
'rbxassetid://10723397788',['glass-2']='rbxassetid://10723397529',['glass-water']='rbxassetid://10723397678',glasses=
'rbxassetid://10723397895',globe='rbxassetid://10723404337',['globe-2']='rbxassetid://10723398002',grab=
'rbxassetid://10723404472',['graduation-cap']='rbxassetid://10723404691',grape='rbxassetid://10723404822',grid=
'rbxassetid://10723404936',['grip-horizontal']='rbxassetid://10723405089',['grip-vertical']='rbxassetid://10723405236',
hammer='rbxassetid://10723405360',hand='rbxassetid://10723405649',['hand-metal']='rbxassetid://10723405508',[
'hard-drive']='rbxassetid://10723405749',['hard-hat']='rbxassetid://10723405859',hash='rbxassetid://10723405975',haze=
'rbxassetid://10723406078',headphones='rbxassetid://10723406165',heart='rbxassetid://10723406885',['heart-crack']=
'rbxassetid://10723406299',['heart-handshake']='rbxassetid://10723406480',['heart-off']='rbxassetid://10723406662',[
'heart-pulse']='rbxassetid://10723406795',['help-circle']='rbxassetid://10723406988',hexagon='rbxassetid://10723407092',
highlighter='rbxassetid://10723407192',history='rbxassetid://10723407335',home='rbxassetid://10723407389',hourglass=
'rbxassetid://10723407498',['ice-cream']='rbxassetid://10723414308',image='rbxassetid://10723415040',['image-minus']=
'rbxassetid://10723414487',['image-off']='rbxassetid://10723414677',['image-plus']='rbxassetid://10723414827',import=
'rbxassetid://10723415205',inbox='rbxassetid://10723415335',indent='rbxassetid://10723415494',['indian-rupee']=
'rbxassetid://10723415642',infinity='rbxassetid://10723415766',info='rbxassetid://10723415903',inspect=
'rbxassetid://10723416057',italic='rbxassetid://10723416195',['japanese-yen']='rbxassetid://10723416363',joystick=
'rbxassetid://10723416527',key='rbxassetid://10723416652',keyboard='rbxassetid://10723416765',lamp=
'rbxassetid://10723417513',['lamp-ceiling']='rbxassetid://10723416922',['lamp-desk']='rbxassetid://10723417016',[
'lamp-floor']='rbxassetid://10723417131',['lamp-wall-down']='rbxassetid://10723417240',['lamp-wall-up']=
'rbxassetid://10723417356',landmark='rbxassetid://10723417608',languages='rbxassetid://10723417703',laptop=
'rbxassetid://10723423881',['laptop-2']='rbxassetid://10723417797',lasso='rbxassetid://10723424235',['lasso-select']=
'rbxassetid://10723424058',laugh='rbxassetid://10723424372',layers='rbxassetid://10723424505',layout=
'rbxassetid://10723425376',['layout-dashboard']='rbxassetid://10723424646',['layout-grid']='rbxassetid://10723424838',[
'layout-list']='rbxassetid://10723424963',['layout-template']='rbxassetid://10723425187',leaf='rbxassetid://10723425539'
,library='rbxassetid://10723425615',['life-buoy']='rbxassetid://10723425685',lightbulb='rbxassetid://10723425852',[
'lightbulb-off']='rbxassetid://10723425762',['line-chart']='rbxassetid://10723426393',link='rbxassetid://10723426722',[
'link-2']='rbxassetid://10723426595',['link-2-off']='rbxassetid://10723426513',list='rbxassetid://10723433811',[
'list-checks']='rbxassetid://10734884548',['list-end']='rbxassetid://10723426886',['list-minus']=
'rbxassetid://10723426986',['list-music']='rbxassetid://10723427081',['list-ordered']='rbxassetid://10723427199',[
'list-plus']='rbxassetid://10723427334',['list-start']='rbxassetid://10723427494',['list-video']=
'rbxassetid://10723427619',['list-x']='rbxassetid://10723433655',loader='rbxassetid://10723434070',['loader-2']=
'rbxassetid://10723433935',locate='rbxassetid://10723434557',['locate-fixed']='rbxassetid://10723434236',['locate-off']=
'rbxassetid://10723434379',lock='rbxassetid://10723434711',['log-in']='rbxassetid://10723434830',['log-out']=
'rbxassetid://10723434906',luggage='rbxassetid://10723434993',magnet='rbxassetid://10723435069',mail=
'rbxassetid://10734885430',['mail-check']='rbxassetid://10723435182',['mail-minus']='rbxassetid://10723435261',[
'mail-open']='rbxassetid://10723435342',['mail-plus']='rbxassetid://10723435443',['mail-question']=
'rbxassetid://10723435515',['mail-search']='rbxassetid://10734884739',['mail-warning']='rbxassetid://10734885015',[
'mail-x']='rbxassetid://10734885247',mails='rbxassetid://10734885614',map='rbxassetid://10734886202',['map-pin']=
'rbxassetid://10734886004',['map-pin-off']='rbxassetid://10734885803',maximize='rbxassetid://10734886735',['maximize-2']
='rbxassetid://10734886496',medal='rbxassetid://10734887072',megaphone='rbxassetid://10734887454',['megaphone-off']=
'rbxassetid://10734887311',meh='rbxassetid://10734887603',menu='rbxassetid://10734887784',['message-circle']=
'rbxassetid://10734888000',['message-square']='rbxassetid://10734888228',mic='rbxassetid://10734888864',['mic-2']=
'rbxassetid://10734888430',['mic-off']='rbxassetid://10734888646',microscope='rbxassetid://10734889106',microwave=
'rbxassetid://10734895076',milestone='rbxassetid://10734895310',minimize='rbxassetid://10734895698',['minimize-2']=
'rbxassetid://10734895530',minus='rbxassetid://10734896206',['minus-circle']='rbxassetid://10734895856',['minus-square']
='rbxassetid://10734896029',monitor='rbxassetid://10734896881',['monitor-off']='rbxassetid://10734896360',[
'monitor-speaker']='rbxassetid://10734896512',moon='rbxassetid://10734897102',['more-horizontal']=
'rbxassetid://10734897250',['more-vertical']='rbxassetid://10734897387',mountain='rbxassetid://10734897956',[
'mountain-snow']='rbxassetid://10734897665',mouse='rbxassetid://10734898592',['mouse-pointer']=
'rbxassetid://10734898476',['mouse-pointer-2']='rbxassetid://10734898194',['mouse-pointer-click']=
'rbxassetid://10734898355',move='rbxassetid://10734900011',['move-3d']='rbxassetid://10734898756',['move-diagonal']=
'rbxassetid://10734899164',['move-diagonal-2']='rbxassetid://10734898934',['move-horizontal']='rbxassetid://10734899414'
,['move-vertical']='rbxassetid://10734899821',music='rbxassetid://10734905958',['music-2']='rbxassetid://10734900215',[
'music-3']='rbxassetid://10734905665',['music-4']='rbxassetid://10734905823',navigation='rbxassetid://10734906744',[
'navigation-2']='rbxassetid://10734906332',['navigation-2-off']='rbxassetid://10734906144',['navigation-off']=
'rbxassetid://10734906580',network='rbxassetid://10734906975',newspaper='rbxassetid://10734907168',octagon=
'rbxassetid://10734907361',option='rbxassetid://10734907649',outdent='rbxassetid://10734907933',package=
'rbxassetid://10734909540',['package-2']='rbxassetid://10734908151',['package-check']='rbxassetid://10734908384',[
'package-minus']='rbxassetid://10734908626',['package-open']='rbxassetid://10734908793',['package-plus']=
'rbxassetid://10734909016',['package-search']='rbxassetid://10734909196',['package-x']='rbxassetid://10734909375',[
'paint-bucket']='rbxassetid://10734909847',paintbrush='rbxassetid://10734910187',['paintbrush-2']=
'rbxassetid://10734910030',palette='rbxassetid://10734910430',palmtree='rbxassetid://10734910680',paperclip=
'rbxassetid://10734910927',['party-popper']='rbxassetid://10734918735',pause='rbxassetid://10734919336',['pause-circle']
='rbxassetid://10735024209',['pause-octagon']='rbxassetid://10734919143',['pen-tool']='rbxassetid://10734919503',pencil=
'rbxassetid://10734919691',percent='rbxassetid://10734919919',['person-standing']='rbxassetid://10734920149',phone=
'rbxassetid://10734921524',['phone-call']='rbxassetid://10734920305',['phone-forwarded']='rbxassetid://10734920508',[
'phone-incoming']='rbxassetid://10734920694',['phone-missed']='rbxassetid://10734920845',['phone-off']=
'rbxassetid://10734921077',['phone-outgoing']='rbxassetid://10734921288',['pie-chart']='rbxassetid://10734921727',[
'piggy-bank']='rbxassetid://10734921935',pin='rbxassetid://10734922324',['pin-off']='rbxassetid://10734922180',pipette=
'rbxassetid://10734922497',pizza='rbxassetid://10734922774',plane='rbxassetid://10734922971',play=
'rbxassetid://10734923549',['play-circle']='rbxassetid://10734923214',plus='rbxassetid://10734924532',['plus-circle']=
'rbxassetid://10734923868',['plus-square']='rbxassetid://10734924219',podcast='rbxassetid://10734929553',pointer=
'rbxassetid://10734929723',['pound-sterling']='rbxassetid://10734929981',power='rbxassetid://10734930466',['power-off']=
'rbxassetid://10734930257',printer='rbxassetid://10734930632',puzzle='rbxassetid://10734930886',quote=
'rbxassetid://10734931234',radio='rbxassetid://10734931596',['radio-receiver']='rbxassetid://10734931402',[
'rectangle-horizontal']='rbxassetid://10734931777',['rectangle-vertical']='rbxassetid://10734932081',recycle=
'rbxassetid://10734932295',redo='rbxassetid://10734932822',['redo-2']='rbxassetid://10734932586',['refresh-ccw']=
'rbxassetid://10734933056',['refresh-cw']='rbxassetid://10734933222',refrigerator='rbxassetid://10734933465',regex=
'rbxassetid://10734933655',['repeat']='rbxassetid://10734933966',['repeat-1']='rbxassetid://10734933826',reply=
'rbxassetid://10734934252',['reply-all']='rbxassetid://10734934132',rewind='rbxassetid://10734934347',rocket=
'rbxassetid://10734934585',['rocking-chair']='rbxassetid://10734939942',['rotate-3d']='rbxassetid://10734940107',[
'rotate-ccw']='rbxassetid://10734940376',['rotate-cw']='rbxassetid://10734940654',rss='rbxassetid://10734940825',ruler=
'rbxassetid://10734941018',['russian-ruble']='rbxassetid://10734941199',sailboat='rbxassetid://10734941354',save=
'rbxassetid://10734941499',scale='rbxassetid://10734941912',['scale-3d']='rbxassetid://10734941739',scaling=
'rbxassetid://10734942072',scan='rbxassetid://10734942565',['scan-face']='rbxassetid://10734942198',['scan-line']=
'rbxassetid://10734942351',scissors='rbxassetid://10734942778',['screen-share']='rbxassetid://10734943193',[
'screen-share-off']='rbxassetid://10734942967',scroll='rbxassetid://10734943448',search='rbxassetid://10734943674',send=
'rbxassetid://10734943902',['separator-horizontal']='rbxassetid://10734944115',['separator-vertical']=
'rbxassetid://10734944326',server='rbxassetid://10734949856',['server-cog']='rbxassetid://10734944444',['server-crash']=
'rbxassetid://10734944554',['server-off']='rbxassetid://10734944668',settings='rbxassetid://10734950309',['settings-2']=
'rbxassetid://10734950020',share='rbxassetid://10734950813',['share-2']='rbxassetid://10734950553',sheet=
'rbxassetid://10734951038',shield='rbxassetid://10734951847',['shield-alert']='rbxassetid://10734951173',['shield-check'
]='rbxassetid://10734951367',['shield-close']='rbxassetid://10734951535',['shield-off']='rbxassetid://10734951684',shirt
='rbxassetid://10734952036',['shopping-bag']='rbxassetid://10734952273',['shopping-cart']='rbxassetid://10734952479',
shovel='rbxassetid://10734952773',['shower-head']='rbxassetid://10734952942',shrink='rbxassetid://10734953073',shrub=
'rbxassetid://10734953241',shuffle='rbxassetid://10734953451',sidebar='rbxassetid://10734954301',['sidebar-close']=
'rbxassetid://10734953715',['sidebar-open']='rbxassetid://10734954000',sigma='rbxassetid://10734954538',signal=
'rbxassetid://10734961133',['signal-high']='rbxassetid://10734954807',['signal-low']='rbxassetid://10734955080',[
'signal-medium']='rbxassetid://10734955336',['signal-zero']='rbxassetid://10734960878',siren='rbxassetid://10734961284',
['skip-back']='rbxassetid://10734961526',['skip-forward']='rbxassetid://10734961809',skull='rbxassetid://10734962068',
slack='rbxassetid://10734962339',slash='rbxassetid://10734962600',slice='rbxassetid://10734963024',sliders=
'rbxassetid://10734963400',['sliders-horizontal']='rbxassetid://10734963191',smartphone='rbxassetid://10734963940',[
'smartphone-charging']='rbxassetid://10734963671',smile='rbxassetid://10734964441',['smile-plus']=
'rbxassetid://10734964188',snowflake='rbxassetid://10734964600',sofa='rbxassetid://10734964852',['sort-asc']=
'rbxassetid://10734965115',['sort-desc']='rbxassetid://10734965287',speaker='rbxassetid://10734965419',sprout=
'rbxassetid://10734965572',square='rbxassetid://10734965702',star='rbxassetid://10734966248',['star-half']=
'rbxassetid://10734965897',['star-off']='rbxassetid://10734966097',stethoscope='rbxassetid://10734966384',sticker=
'rbxassetid://10734972234',['sticky-note']='rbxassetid://10734972463',['stop-circle']='rbxassetid://10734972621',[
'stretch-horizontal']='rbxassetid://10734972862',['stretch-vertical']='rbxassetid://10734973130',strikethrough=
'rbxassetid://10734973290',subscript='rbxassetid://10734973457',sun='rbxassetid://10734974297',['sun-dim']=
'rbxassetid://10734973645',['sun-medium']='rbxassetid://10734973778',['sun-moon']='rbxassetid://10734973999',['sun-snow'
]='rbxassetid://10734974130',sunrise='rbxassetid://10734974522',sunset='rbxassetid://10734974689',superscript=
'rbxassetid://10734974850',['swiss-franc']='rbxassetid://10734975024',['switch-camera']='rbxassetid://10734975214',sword
='rbxassetid://10734975486',swords='rbxassetid://10734975692',syringe='rbxassetid://10734975932',table=
'rbxassetid://10734976230',['table-2']='rbxassetid://10734976097',tablet='rbxassetid://10734976394',tag=
'rbxassetid://10734976528',tags='rbxassetid://10734976739',target='rbxassetid://10734977012',tent=
'rbxassetid://10734981750',terminal='rbxassetid://10734982144',['terminal-square']='rbxassetid://10734981995',[
'text-cursor']='rbxassetid://10734982395',['text-cursor-input']='rbxassetid://10734982297',thermometer=
'rbxassetid://10734983134',['thermometer-snowflake']='rbxassetid://10734982571',['thermometer-sun']=
'rbxassetid://10734982771',['thumbs-down']='rbxassetid://10734983359',['thumbs-up']='rbxassetid://10734983629',ticket=
'rbxassetid://10734983868',timer='rbxassetid://10734984606',['timer-off']='rbxassetid://10734984138',['timer-reset']=
'rbxassetid://10734984355',['toggle-left']='rbxassetid://10734984834',['toggle-right']='rbxassetid://10734985040',
tornado='rbxassetid://10734985247',['toy-brick']='rbxassetid://10747361919',train='rbxassetid://10747362105',trash=
'rbxassetid://10747362393',['trash-2']='rbxassetid://10747362241',['tree-deciduous']='rbxassetid://10747362534',[
'tree-pine']='rbxassetid://10747362748',trees='rbxassetid://10747363016',['trending-down']='rbxassetid://10747363205',[
'trending-up']='rbxassetid://10747363465',triangle='rbxassetid://10747363621',trophy='rbxassetid://10747363809',truck=
'rbxassetid://10747364031',tv='rbxassetid://10747364593',['tv-2']='rbxassetid://10747364302',type=
'rbxassetid://10747364761',umbrella='rbxassetid://10747364971',underline='rbxassetid://10747365191',undo=
'rbxassetid://10747365484',['undo-2']='rbxassetid://10747365359',unlink='rbxassetid://10747365771',['unlink-2']=
'rbxassetid://10747397871',unlock='rbxassetid://10747366027',upload='rbxassetid://10747366434',['upload-cloud']=
'rbxassetid://10747366266',usb='rbxassetid://10747366606',user='rbxassetid://10747373176',['user-check']=
'rbxassetid://10747371901',['user-cog']='rbxassetid://10747372167',['user-minus']='rbxassetid://10747372346',[
'user-plus']='rbxassetid://10747372702',['user-x']='rbxassetid://10747372992',users='rbxassetid://10747373426',utensils=
'rbxassetid://10747373821',['utensils-crossed']='rbxassetid://10747373629',['venetian-mask']='rbxassetid://10747374003',
verified='rbxassetid://10747374131',vibrate='rbxassetid://10747374489',['vibrate-off']='rbxassetid://10747374269',video=
'rbxassetid://10747374938',['video-off']='rbxassetid://10747374721',view='rbxassetid://10747375132',voicemail=
'rbxassetid://10747375281',volume='rbxassetid://10747376008',['volume-1']='rbxassetid://10747375450',['volume-2']=
'rbxassetid://10747375679',['volume-x']='rbxassetid://10747375880',wallet='rbxassetid://10747376205',wand=
'rbxassetid://10747376565',['wand-2']='rbxassetid://10747376349',watch='rbxassetid://10747376722',waves=
'rbxassetid://10747376931',webcam='rbxassetid://10747381992',wifi='rbxassetid://10747382504',['wifi-off']=
'rbxassetid://10747382268',wind='rbxassetid://10747382750',['wrap-text']='rbxassetid://10747383065',wrench=
'rbxassetid://10747383470',x='rbxassetid://10747384394',['x-circle']='rbxassetid://10747383819',['x-octagon']=
'rbxassetid://10747384037',['x-square']='rbxassetid://10747384217',['zoom-in']='rbxassetid://10747384552',['zoom-out']=
'rbxassetid://10747384679'}return f end)()end,[61]=function()local b,c,d=a(61)local e return(function(...)local f=d(c.
Parent.Parent.utilities.customFunctions)local g,h=f.cloneref,{}h=setmetatable(h,{__index=function(i,j)return g(game:
GetService(j))end})return h end)()end,[62]=function()local b,c,d=a(62)local e return(function(...)local f,g,h={},d(c.
Parent.Fusion),d(c.default)local i,j,k,l,m=g.Value,g.Observer,d(c.Parent.Parent.utilities.get),d(c.Parent.Parent.
utilities.animate),{}local n=i{}j(n):onChange(function()for o,p in ipairs(m)do task.spawn(p)end end)local o={}table.
foreach(h,function(p,q)table.insert(o,p)end)function f.create(p)for q,t in o do if p[t]==nil then p[t]=h[t]end if
typeof(p[t])~='Color3'then error(t.." isn't type Color3")end end for u,v in p do if not table.find(o,u)then warn(
'Incorrect value removed "'..tostring(u)..'"')p[u]=nil end end n:set(p)end function f.get(p:string)local t=k(n)if t[p]
then return t[p]else error(p.." isn't a theme element")end end for p,t in o do f[t]=l(function()return k(n)[t]end,40,1)
end n:set(h)function f.onChange(u)table.insert(m,u)end return f end)()end,[63]=function()local b,c,d=a(63)local e return
(function(...)return{background=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5'
,text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',notificationButton=Color3.fromHex'#222427',
mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex
'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex
'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[65]=function()local b,c,d=a(65)local
e return(function(...)local f=c.Parent.Parent return function(g)local h=d(f.Bundles)local i,j,k,l=h.data,h.themeSystem,h
.icons,h.Fusion local m,n,o,p,t,u,v=l.New,l.Children,l.Value,l.Observer,l.OnEvent,l.Computed,d(f.utilities)local E,F,G,H
,I=v.get,v.animate,v.typecheck,v.customFont,d(f.simpleElements)local J,K,L,M=I.UIPadding,I.UICorner,G(g,{Name='',
DisabledText='',IsEnabled=false,Callback=function()end},{g.IsEnabled and''or'IsEnabled',g.DisabledText and''or
'DisabledText'})assert(L,table.concat(M,'\n'))local N,O,P,Q,R,S,T,U=i.find'selectedTab',i.find'searchText',i.add(g),g.
Parent,g.Name,g.Callback,g.IsEnabled or o(true),g.DisabledText or o'Component Disabled'local V=o(E(N.string)==E(P.tab).
uid)p(N.string):onChange(function()V:set(E(N.string)==E(P.tab).uid)end)local W=F(function()return E(V)and 0 or 1 end,40,
1)m'TextButton'{Interactable=u(function()if not E(T)then return false end return E(V)end),Visible=u(function()if E(O.
string)~=''and not string.find(E(R):lower(),E(O.string):lower())then return false end return true end),Parent=Q,Size=
UDim2.new(1,0,0,36),BackgroundColor3=j.background2,BackgroundTransparency=W,[t'Activated']=function()if not E(T)then
return end task.spawn(E(S))end,[n]={K(6),m'Frame'{ZIndex=2,Visible=u(function()if not E(T)then return true end return
false end),BackgroundTransparency=F(function()return E(V)and 0.2 or 1 end,40,1),BackgroundColor3=j.disabledBackground,
Size=UDim2.fromScale(1,1),[n]={K(6),m'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=k.lock,ImageColor3=j.disabledText,ImageTransparency=W},m'TextLabel'{
FontFace=H('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=j.
disabledText,TextTransparency=W,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=U,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[n]={J(0,5)}}}},m'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[n]={J(0,8),m'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,
18),BackgroundTransparency=1,TextColor3=j.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5
,0),Text=R,TextTransparency=W,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},m'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=k.
fingerprint,ImageColor3=j.text2,ImageTransparency=W}}}}}local X={}function X.SetName(Y,Z)local _,aa=G({SetName=Z},{
SetName=''})assert(_,table.concat(aa,'\n'))R:set(Z)end function X.SetCallback(aa,Y)local Z,_=G({SetCallback=Y},{
SetCallback=function()end})assert(Z,table.concat(_,'\n'))S:set(Y)end function X.Fire(aa)task.spawn(E(S))end function X.
Enable(aa)T:set(true)end function X.Disable(aa)T:set(false)end return X end end)()end,[66]=function()local aa,b,c=a(66)
local d return(function(...)local e=b.Parent.Parent return function(f)local g=c(e.Bundles)local h,i,j=g.data,g.
themeSystem,g.Fusion local k,l,m,n,o=j.New,j.Children,j.Value,j.Observer,c(e.utilities)local p,t,u,v,E=o.get,o.animate,h
.find'selectedTab',h.add(f),f.Parent local F=m(p(u.string)==p(v.tab).uid)n(u.string):onChange(function()F:set(p(u.string
)==p(v.tab).uid)end)local G=t(function()return p(F)and 0 or 1 end,40,1)k'Frame'{Parent=E,Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,[l]={k'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),BackgroundColor3=i.text2,BackgroundTransparency=G}}}end end)()end,[67]=function()local aa,b,c=a(67)
local d return(function(...)local e=b.Parent.Parent return function(f)local g=c(e.Bundles)local h,i,j,k,l=g.data,g.
themeSystem,g.icons,g.flags,g.Fusion local m,n,o,p,t,u,v,E=l.New,l.Children,l.Value,l.Observer,l.OnEvent,l.Computed,l.
Ref,c(e.utilities)local F,G,H,I,J=E.get,E.animate,E.typecheck,E.customFont,c(e.simpleElements)local K,L,M,N,O,P,Q,R,S=J.
UIListLayout,J.UIPadding,J.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,H(
f,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Items={},Multiselect=true,Regex=function()end}
,{f.DisabledText and''or'DisabledText',f.FLAG and''or'FLAG',f.IsEnabled and''or'IsEnabled',f.Multiselect and''or
'Multiselect',f.Regex and''or'Regex'})assert(R,table.concat(S,'\n'))R,S=H(f,{Default=f.Multiselect and{}or''},{f.Default
and''or'Default'})assert(R,table.concat(S,'\n'))if f.Regex then assert(typeof(f.Regex'')=='string',
'The Regex function must always return a string')end local T,U,V,W,X,Y,Z,_,ab,ac,ad,ae,af=h.find'selectedTab',h.find
'useConfig',h.find'searchText',h.add(f),f.Parent,f.Name,f.Callback,o{},f.Multiselect or o(false),f.Default,f.IsEnabled
or o(true),f.DisabledText or o'Component Disabled',f.Regex or o(function(T)return T end)local ag,ah=(f.FLAG or o(W.uid))
if F(ag)~=''then ah=k.register(F(ag),{items=o{},item=o'',multiselect=F(ab)},'dropdown',F(ag)==W.uid)end local ai,aj,ak,
al,am,an=o(),o(),o(false),o(F(ab)and{}or''),o{},o(false)p(ah.status.items):onChange(function()if#F(ah.status.items)==#F(
_)then an:set(true)else an:set(false)end local ao={}for ap,aq in F(ah.status.items)do table.insert(ao,F(af)(aq))end task
.spawn(F(Z),ao)al:set(F(ah.status.items))end)p(ah.status.item):onChange(function()task.spawn(F(Z),F(af)(F(ah.status.item
)))al:set(F(af)(F(ah.status.item)))end)local ao=o(F(T.string)==F(W.tab).uid)p(T.string):onChange(function()ao:set(F(T.
string)==F(W.tab).uid)end)local ap=G(function()return F(ao)and 0 or 1 end,40,1)m'Frame'{Parent=X,Visible=u(function()if
F(V.string)~=''and not string.find(F(Y):lower(),F(V.string):lower())then return false end return true end),Size=G(
function()if F(ak)and F(ai)then local aq,ar=F(ai),3 for as,at in aq:GetChildren()do if at:IsA'UIListLayout'or at:IsA
'UICorner'or not at.Visible then continue end ar+=(4+at.Size.Y.Offset)end return UDim2.new(1,0,0,ar)end return UDim2.
new(1,0,0,36)end,40,1),BackgroundColor3=i.background2,BackgroundTransparency=ap,ClipsDescendants=true,[v]=ai,[n]={M(6),
K(N.LayoutOrder,O.Vertical,P.Center,Q.Top,UDim.new(0,4)),m'TextButton'{Interactable=u(function()if not F(ad)then return
false end return F(ao)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[t'Activated']=function()ak:set(not F(ak))
end,[n]={m'Frame'{ZIndex=2,Visible=u(function()if not F(ad)then return true end return false end),BackgroundTransparency
=G(function()return F(ao)and 0.2 or 1 end,40,1),BackgroundColor3=i.disabledBackground,Size=UDim2.fromScale(1,1),[n]={M(6
),m'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=j.lock,ImageColor3=i.disabledText,ImageTransparency=ap},m'TextLabel'{FontFace=I(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=i.disabledText,
TextTransparency=ap,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=u(function()
return F(ae)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[n]={L(0,5)}}}},m'Frame'{Size=UDim2.fromScale(1,1
),BackgroundTransparency=1,[n]={L(8),m'TextLabel'{FontFace=I('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,
18),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5
,0),Text=u(function()if F(ab)then return F(Y)..' '..tostring(#F(ah.status.items))..'/'..tostring(#F(_))end return F(Y)..
': '..F(al)end),TextTransparency=ap,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},m'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=u(function
()return F(ab)and j.multiDropdown or j.normalDropdown end),ImageColor3=i.text2,ImageTransparency=ap}}}}},m'Frame'{Size=
UDim2.new(1,0,0,32),BackgroundTransparency=1,[n]={L(0,6),m'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=i.
background,BackgroundTransparency=ap,FontFace=I('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=i.text,TextTransparency=ap,[v]=aj,[t
'Changed']=function(aq)local ar=F(aj)if aq=='Text'and ar and ar.Text then local as=ar.Text for at,au in F(am)do if
string.find(F(af)(au.Name):lower(),as:lower())or as==''then au.Visible=true else au.Visible=false end end end end,[n]={m
'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},M(4),L(6,6,6,6)}}}},m'Frame'{Size=UDim2.new(1,0,0,32),
BackgroundTransparency=1,Visible=ab,[n]={L(6,6,0,6),m'TextButton'{Interactable=ab,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=ap,BackgroundColor3=i.background,[t'Activated']=function()local aq={}if not F(an)then for ar,as
in F(_)do as=typeof(as)=='table'and as.Value or as table.insert(aq,F(af)(as))end end ah.status.items:set(aq)end,[n]={M(4
),L(8),m'TextLabel'{FontFace=I('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=i.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=u(function()if F(an
)then return'Deselect All'end return'Select All'end),TextTransparency=ap,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},m'ScrollingFrame'{ZIndex=3,Size=UDim2.new(1,0,0,136),BackgroundTransparency=1,ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[n]={L(6,6,0,6),K(N.LayoutOrder,O.Vertical,P.
Center,Q.Top,UDim.new(0,6)),am}}}}p(_):onChange(function()local aq={}for ar,as in F(_)do local at,au,av=(o(false))if
typeof(as)=='table'then local aw,ax=H(as,{Value='',Image=''},{as.Image and''or'Image'})assert(aw,table.concat(ax,'\n'))
au=as.Value av=as.Image or nil else local aw,ax=H({Item=as},{Item=''})assert(aw,table.concat(ax,'\n'))au=as end local aw
=F(af)(au)p(ah.status.items):onChange(function()if table.find(F(ah.status.items),aw)then at:set(true)else at:set(false)
end end)p(ah.status.item):onChange(function()if F(ah.status.item)==aw then at:set(true)else at:set(false)end end)local
ax=m'TextButton'{Name=au,Size=UDim2.new(1,0,0,28),BackgroundTransparency=ap,BackgroundColor3=i.background,[t'Activated']
=function()if F(ab)then local ax=F(ah.status.items)at:set(not F(at))if F(at)then table.insert(ax,aw)else table.remove(ax
,table.find(ax,aw))end ah.status.items:set(ax)else ah.status.item:set(aw)ak:set(false)end end,[n]={M(4),L(8),K(N.
LayoutOrder,O.Horizontal,P.Left,Q.Center,UDim.new(0,6)),m'Frame'{Visible=u(function()return F(ab)and true or false end),
Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=ap,
BackgroundColor3=G(function()return F(at)and i.get'toggled'or i.get'selectedTab'end,40,1),[n]={M(6),m'ImageLabel'{Size=
UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=
j.check,ImageTransparency=G(function()if not F(ao)then return 1 end if F(at)then return 0 end return 1 end,40,1),
ImageColor3=i.selectedTab}}},m'ImageLabel'{Visible=u(function()return av and true or false end),Size=UDim2.fromOffset(18
,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=av,ImageTransparency=ap
,ImageColor3=i.text2},m'TextLabel'{FontFace=I('Montserrat',Enum.FontWeight.Bold),Size=u(function()return F(ab)and UDim2.
new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=au,TextTransparency=ap,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}table.insert(aq,ax)end am:set(aq)end)_:set(F(f.Items))if F(U.boolean)then p(ah.file):onChange(function()
local aq,ar=F(ah.file),true if F(ab)then ah.status.items:set(aq)ar=false else ah.status.item:set(aq)ar=false end if ar
then if F(ab)then if ac and#F(ac)>0 then ah.status.items:set(F(ac))end else if ac then ah.status.item:set(F(ac))end end
end end)else if F(ab)then if ac and#F(ac)>0 then ah.status.items:set(F(ac))end else if ac then ah.status.item:set(F(ac))
end end end local aq={}function aq.SetName(ar,as)local at,au=H({SetName=as},{SetName=''})assert(at,table.concat(au,'\n')
)Y:set(as)end function aq.Enable(ar)ad:set(true)end function aq.Disable(ar)ad:set(false)end return aq end end)()end,[68]
=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.
Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local
av,aw,ax,b,c,d,e,f=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.
simpleElements)local g,h,i,j,k,l,m,n,o,p,t=f.UIPadding,f.UICorner,f.UITextSizeConstraint,f.UIListLayout,Enum.SortOrder,
Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),ax(af,{Name='',DisabledText='',
FLAG='',IsEnabled=false,Callback=function()end,Bind=Enum.KeyCode.Q},{af.DisabledText and''or'DisabledText',af.FLAG and''
or'FLAG',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind'})assert(p,table.concat(t,'\n'))local u,v,E,F,G,H,I,J,K,L,
M,N,O,P,Q=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'isMobile',ah.find
'instanceName',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.Bind,af.IsEnabled or aq(true),af.
DisabledText or aq'Component Disabled',aq()local function R(S:EnumItem,T:string)local U=av(v.binds)if table.find(U,S)
then o(('Key %s is already in use. %s'):format(S.Name,T))else table.insert(U,S)if av(Q)then table.remove(U,table.find(U,
av(Q)))end v:update('binds',U)Q:set(S)end end local S,T=(af.FLAG or aq(J.uid))if av(S)~=''then T=ak.register(av(S),{
coordinate=aq(Vector2.new(0,0)),keycode=aq(nil),mobile=av(G.boolean)},'keybind',av(S)==J.uid)end ar(T.status.keycode):
onChange(function()if av(Q)and av(Q).Name==av(T.status.keycode)then return end local U,V=pcall(function()return Enum.
KeyCode[av(T.status.keycode)]end)if U then R(V,'RAHHH')end end)ar(Q):onChange(function()T.status.keycode:set(av(Q).Name)
end)local U=aq(av(u.string)==av(J.tab).uid)ar(u.string):onChange(function()U:set(av(u.string)==av(J.tab).uid)end)local V
,W=aw(function()return av(U)and 0 or 1 end,40,1),aq(false)local X=am.InputBegan:Connect(function(X,Y)if av(G.boolean)
then return end if av(W)then if X.KeyCode and X.KeyCode~=Enum.KeyCode.Unknown then R(X.KeyCode,'From input box')end W:
set(false)task.wait()I:update('boolean',false)else if X.KeyCode and X.KeyCode==av(Q)and not Y and not av(I.boolean)and
av(O)then task.spawn(av(M))end end end)b.add(X)local Y,Z,_=(aq(false))_=ao'TextButton'{Visible=at(function()if not av(O)
then return av(O)end return av(Y)end),Parent=d.get(av(H.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=av(L),FontFace=c('Montserrat',Enum.FontWeight.Bold),
TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=
0.1,[as'Activated']=function()if Z then Z:Disconnect()Z=nil T.status.coordinate:set(_.AbsolutePosition)else task.spawn(
av(M))end end,[ap]={g(4),h(16),i(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=av(G.boolean)and aj.finger or aj.command,
ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=K,Visible=at(function()if av(F.string)~=''and
not string.find(av(L):lower(),av(F.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(O)then return true end return false end
),BackgroundTransparency=aw(function()return av(U)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={h(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=V},ao
'TextLabel'{FontFace=c('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3
=ai.disabledText,TextTransparency=V,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=
at(function()return av(P)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={g(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={j(k.LayoutOrder,l.Horizontal,m.Left,n.Center,UDim.new(0,3)),ao
'TextButton'{Interactable=at(function()if not av(O)then return false end return av(U)end),Size=UDim2.new(0.225,0,1,0),
BackgroundColor3=ai.background2,BackgroundTransparency=V,[as'Activated']=function()if av(G.boolean)then Y:set(true)Z=e(_
,15)return end W:set(true)I:update('boolean',true)end,[ap]={h(6),g(6),j(k.LayoutOrder,l.Horizontal,m.Left,n.Center,UDim.
new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(G.boolean)and aj.finger
or aj.command,ImageColor3=ai.text2,ImageTransparency=V},ao'TextLabel'{Visible=not av(G.boolean),Size=UDim2.new(1,-25,0,
16),BackgroundTransparency=1,FontFace=c('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=V,Text=at(function()return av(W)and'Listening'or av(Q)and av(
Q).Name or'Waiting'end)},ao'TextLabel'{Visible=av(G.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=c('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return av(Y)and'Move Bind'or'Place Bind'end),TextTransparency=V}}},ao'TextButton'{Visible=Y,
Interactable=at(function()if not av(O)then return false end return av(U)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=V,[as'Activated']=function()Y:set(false)_.Position=UDim2.
fromScale(0.5,0.5)T.status.coordinate:set(_.AbsolutePosition)end,[ap]={h(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=
ai.red,ImageTransparency=V}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(Y)and-42 or-3,0,36)end),
BackgroundColor3=ai.background2,BackgroundTransparency=V,[ap]={h(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={g(8),j(k.LayoutOrder,l.Horizontal,m.Left,n.Center,UDim.new(0,10)),ao'TextLabel'{FontFace=
c('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=L,TextTransparency=V,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}}}}}}}}if av(E.boolean)then ar(T.file):onChange(function()local ay,az=av(T.file),true
if ay.keycode~=nil then T.status.keycode:set(ay.keycode)az=false end if az then if N then T.status.keycode:set(av(N).
Name)end end end)else if N then T.status.keycode:set(av(N).Name)end end local ay={}function ay.SetName(az,aA)local aB,aC
=ax({SetName=aA},{SetName=''})assert(aB,table.concat(aC,'\n'))L:set(aA)end function ay.SetBind(az,aA:EnumItem)local aB,
aC=ax({SetBind=aA},{SetBind=Enum.keyCode.C})assert(aB,table.concat(aC,'\n'))R(aA,'At :SetBind')end function ay.Enable(az
)O:set(true)end function ay.Disable(az)O:set(false)end return ay end end)()end,[69]=function()local aa,ab,ac=a(69)local
ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.
themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)
local aq,ar,as=ap.UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate,as.customFont
local ax,ay=au(af,{Text=''})assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,b=ah.find'selectedTab',ah.find'searchText'
,ah.add(af),af.Parent,af.Text local c=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function()c:set(at(az.
string)==at(aB.tab).uid)end)local d=av(function()return at(c)and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if at(aA
.string)~=''and not string.find(at(b):lower(),at(aA.string):lower())then return false end return true end),Size=UDim2.
new(1,0,0,36),Parent=aC,BackgroundTransparency=d,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak'TextLabel'{
FontFace=aw('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=d
,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.
TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return at(b)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=18}}}}}local e={}function e.SetText(f,g)local h,i=au({SetText=g},{SetText=''})assert(h,table.concat(i,'\n'))
b:set(g)end return e end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.
OnEvent,ai.Children,ai.Value,ai.Computed,ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao.getStringBounds,ao
.customFont,ao.typecheck,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,b=au.UICorner,au.UIPadding,au.UIListLayout,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title='',Body='',Duration=1,
Image='',ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.
Buttons and''or'Buttons'})assert(aC,table.concat(b,'\n'))local c,d,e,f,g,h,i,j,k,l,m=am(af.Title),am(af.Body),am(af.
Duration),am(af.Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(
false),am'',am(250)local n=am(ar(ap(d),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=ap(m)-8-(f and 32 or
0)}))local o=am(20+math.clamp(ap(n).Y+4+10+(#ap(h)>0 and 26 or 0),#ap(h)>0 and 56 or 30,9e9))local function p(t,u)local
v=1 for E=1,t do v=v*10 end local E=tostring(math.round(u*v)/v)local F=string.split(E,'.')if#F==1 then local G=''for H=1
,t do G=G..'0'end E=E..'.'..G end return E end local t,u={}for v,E in ap(h)do local F,G=at({Button=E},{Button={}})
assert(F,table.concat(G,'\n'))F,G=at(E,{Name='',Callback=function()end})assert(F,table.concat(G,'\n'))local H,I=E.Name,E
.Callback local J=aj'TextButton'{Size=UDim2.new(1/#ap(h),-2,1,-4),TextSize=14,Text=H,FontFace=as('Montserrat',Enum.
FontWeight.Bold),BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(I)j:set(
false)task.wait(0.4)i:set(false)task.delay(0.3,function()k:set(true)end)task.wait(2)u:Destroy()end,[al]={av(4)}}table.
insert(t,J)end u=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(m),ap(
i)and ap(o)+5 or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(k)end),
Interactable=j,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.
fromOffset(ap(m),ap(o)),[ak'Activated']=function()j:set(false)task.wait(0.4)i:set(false)task.delay(0.3,function()k:set(
true)end)task.wait(2)u:Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=UDim2.
fromOffset(ap(m),ap(o)),Position=aq(function()return UDim2.fromScale(ap(j)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),ax(ay.
LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=ap(f)~=''and true or false,Size=UDim2
.new(0,24,1,0),BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=f,ImageColor3=g}}},aj'Frame'{Size=UDim2.new(1,ap(f
)~=''and-28 or 0,1,0),BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj'TextLabel'
{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.
TextXAlignment.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=c},aj'TextLabel'{Size=UDim2.new(1,0,0,1),
AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as('Montserrat',
Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,RichText=true,TextColor3=ah.text2,Text=d},aj'Frame'{Visible=an(function()return#ap(h)>0 and true or
false end),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,
UDim.new(0,2)),t}},aj'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=l,
TextColor3=ah.text,TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,
function()j:set(true)end)task.spawn(function()repeat task.wait()until ap(j)local F,G=(tick())repeat G=tick()-F l:set(p(1
,math.clamp(G,0,ap(e))))task.wait()until G>ap(e)end)task.spawn(function()i:set(true)repeat task.wait()until ap(j)task.
wait(ap(e))task.wait(0.2)j:set(false)task.wait(0.4)i:set(false)task.delay(0.3,function()k:set(true)end)task.wait(2)u:
Destroy()end)end end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent
return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New
,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap.UIPadding,ap.
UITextSizeConstraint,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.customFont,at.
typecheck local az,aA=ay(af,{Title='',Body=''})assert(az,table.concat(aA,'\n'))local aB,aC,b,c,d,e=ah.find'selectedTab',
ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body local f=am(au(aB.string)==au(b.tab).uid)ao(aB.string):
onChange(function()f:set(au(aB.string)==au(b.tab).uid)end)local g,h=av(function()return au(f)and 0 or 1 end,40,1),am(0)
task.spawn(function()h:set(aw(au(e),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(c).
AbsoluteSize.X)}).Y)end)au(c).Changed:Connect(function(i)if i:lower()=='absolutesize'then h:set(aw(au(e),{Font=ax(
'Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(c).AbsoluteSize.X)}).Y)end end)ao(e):onChange(function(
)h:set(aw(au(e),{Font=ax('Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(au(c).AbsoluteSize.X)}).Y)end)ak
'Frame'{Visible=an(function()if au(aC.string)~=''and not string.find(au(d):lower(),au(aC.string):lower())and not string.
find(au(e):lower(),au(aC.string):lower())then return false end return true end),BackgroundColor3=ai.background2,Parent=c
,BackgroundTransparency=g,Size=an(function()return UDim2.new(1,0,0,36+au(h))end),AutomaticSize=Enum.AutomaticSize.Y,[al]
={aq(6),ar(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,
TextTransparency=g,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=18,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=d,[al]={as(1,18)}},ak'TextLabel'{Name
='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=g,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=ax('Montserrat',Enum
.FontWeight.Medium),TextColor3=ai.text2,Text=e,Size=an(function()return UDim2.new(1,-4,0,au(h))end)}}}local i={}function
i.SetBody(j,k)local l,m=ay({SetBody=k},{SetBody=''})assert(l,table.concat(m,'\n'))e:set(k)end function i.SetTitle(j,k)
local l,m=ay({SetTitle=k},{SetTitle=''})assert(l,table.concat(m,'\n'))d:set(k)end return i end end)()end,[72]=function()
local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.UserInputService,al.
RunService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref
,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.typecheck,aw.customFont,ac(ae.simpleElements)local aC,b,c,d,e
,f,g,h,i=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,az(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max=0,
DisplayAsPercent=false,DecimalPlace=0},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or
'IsEnabled',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or
'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace'})assert(h,table.concat(i,'\n'))local j,k,l,m,n,o,p,t,u,v,E,F,G,
H,I=ah.find'selectedTab',ah.find'useConfig',ah.find'flags',ah.find'configLoaded',ah.find'searchText',ah.add(af),af.
Parent,af.Name,af.Callback,af.Max,af.Min,af.DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IsEnabled or ar(
true),af.DisabledText or ar'Component Disabled'local J,K,L=af.Default and ar(math.clamp(ax(af.Default),ax(E),ax(v)))or
ar(ax(E)),(af.FLAG or ar(o.uid))if ax(K)~=''then L=ak.register(ax(K),{percentageOf=ar(ax(E))},'slider',ax(K)==o.uid)end
local M=ar(ax(j.string)==ax(o.tab).uid)as(j.string):onChange(function()M:set(ax(j.string)==ax(o.tab).uid)end)local N=ay(
function()return ax(M)and 0 or 1 end,40,1)local function O(P,Q,R,S,T)return(1-((P-Q)/(R-Q)))*S+((P-Q)/(R-Q))*T end
local function P(Q)if ax(G)==0 then return math.floor(Q)end return tonumber(string.format('%.'..ax(G)..'f',Q))end local
Q=ar(0)as(L.status.percentageOf):onChange(function()Q:set(O(ax(L.status.percentageOf),ax(E),ax(v),0,1))if not ax(H)then
return end task.spawn(ax(u),ax(L.status.percentageOf))end)local R,S,T,U=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(
function(V)if(V.UserInputType==Enum.UserInputType.MouseButton1 or V.UserInputType==Enum.UserInputType.Touch)and ax(U)
then U:set(false)end end)ap'Frame'{Parent=p,Visible=au(function()if ax(n.string)~=''and not string.find(ax(t):lower(),
ax(n.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,
BackgroundTransparency=ay(function()if ax(M)then return 0 end return 1 end,40,1),[aq]={c(6),ap'Frame'{ZIndex=2,Visible=
au(function()if not ax(H)then return true end return false end),BackgroundTransparency=ay(function()return ax(M)and 0.2
or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={c(6),ap'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=N},ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=N,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()return ax(I)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[aq]={b(0,5)}}}},ap'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={
aC(d.LayoutOrder,e.Horizontal,f.Left,g.Center,UDim.new(0,6)),b(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=N,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=t,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,[aq]={aC(d.LayoutOrder,e.Horizontal,f.Left,g.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(
0.2,-5,1,0),BackgroundTransparency=1,[aq]={c(4),aC(d.LayoutOrder,e.Vertical,f.Right,g.Center,UDim.new(0,1)),ap
'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=
ai.text2,TextTransparency=N,TextScaled=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(
function()if ax(F)then return tostring(P(ax(Q)*100))..'%'end return ax(L.status.percentageOf)end),TextXAlignment=Enum.
TextXAlignment.Right,RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(V)local W=ax(T)if V==
'AbsoluteSize'and W and W.AbsoluteSize then S:set(W.AbsoluteSize.X)end end,[av]=T,[aq]={b(0,5,0,5)}},ap'Frame'{
BackgroundColor3=ai.text2,BackgroundTransparency=ay(function()if ax(M)then return 0.5 end return 1 end,40,1),Size=ay(
function()return UDim2.fromOffset(ax(S),2)end,40,1),[aq]={c(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(
H)then return false end return ax(M)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=
function()U:set(true)end,[at'TouchLongPress']=function()U:set(true)end,[at'InputBegan']=function(V)if V.UserInputType==
Enum.UserInputType.MouseButton1 or V.UserInputType==Enum.UserInputType.Touch and ax(R)then local W,X=am:
GetMouseLocation().X,ax(R).Size.X.Offset local Y=W-(ax(R).AbsolutePosition.X+X)while ax(U)and task.wait()do local Z=am:
GetMouseLocation().X local _=math.clamp(X+(Z-W)+Y,0,ax(R).AbsoluteSize.X)L.status.percentageOf:set(P(O(_,0,ax(R).
AbsoluteSize.X,ax(E),ax(v))))an.RenderStepped:Wait()end end end,[av]=R,[aq]={b(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=N,[aq
]={c(0,1)}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,
BackgroundTransparency=N,Size=ay(function()return UDim2.new(ax(Q),0,0,4)end,40,1),[aq]={c(0,1),ap'ImageLabel'{Image=aj.
circle,BackgroundTransparency=1,ImageColor3=ai.selectedTab,ImageTransparency=N,Size=UDim2.fromOffset(18,18),Position=
UDim2.new(1,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),[aq]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),Size=UDim2.fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ay(function()if ax(M)
then return 0.8 end return 1 end,40,1)}}}}}}}}}}}}}if ax(k.boolean)then as(L.file):onChange(function()local V,W=ax(L.
file),true if V~=nil then L.status.percentageOf:set(V)W=false end if W then L.status.percentageOf:set(ax(J))end end)else
L.status.percentageOf:set(ax(J))end local V={}function V.SetName(W,X)local Y,Z=az({SetName=X},{SetName=''})assert(Y,
table.concat(Z,'\n'))t:set(X)end function V.SetValue(W,X)local Y,Z=az({SetValue=X},{SetValue=0})assert(Y,table.concat(Z,
'\n'))L.status.percentageOf:set(math.clamp(X,ax(E),ax(v)))end function V.Enable(W)H:set(true)end function V.Disable(W)H:
set(false)end return V end end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap
=aj.New,aj.Children,aj.Value,aj.Observer,aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,ap.animate,ap.typecheck,
ap.customFont,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,b=au.UIListLayout,au.UIPadding,au.UICorner,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},{af.Image and''or
'Image'})assert(aC,table.concat(b,'\n'))local c,d,e,f,g,h,i=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,
af.Name,(am(false))if af.Image then i=af.Image h:set(true)end local j=am(false)an(c.string):onChange(function()local k=
aq(c.string)j:set(k==e.uid)end)ak'TextButton'{Name=e.uid,Parent=f,Size=UDim2.new(1,0,0,36),BackgroundColor3=ar(function(
)return aq(j)and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()c:update('string',e.uid)
end,[al]={ax(4),aw(6),av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=h,
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=i,ImageTransparency=ar(function()return
aq(j)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=aq(h)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=at(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=g,BackgroundTransparency=1,TextXAlignment=
Enum.TextXAlignment.Left,TextTransparency=ar(function()return aq(j)and 0 or 0.6 end,40,1),[al]={ak'UITextSizeConstraint'
{MinTextSize=1,MaxTextSize=16}}}}}if not aq(d.boolean)then d:update('boolean',true)c:update('string',e.uid)end return e
end end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=ai.New,ai.Children,ai.Computed,ac(ae.
simpleElements)local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj'ScrollingFrame'{ZIndex=al(function()return(as(
at.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=
UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center,ar.Top,UDim.new(0,4))}}end end)()end,[75]=function()
local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children
,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.customFont
,at.typecheck,ac(ae.simpleElements)local az,aA,aB,aC,b,c,d,e,f,g=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.
UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',
Placeholder='',DisabledText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',FLAG='',IsEnabled=false,
Callback=function()end},{af.Placeholder and''or'Placeholder',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.DisabledText and''or'DisabledText'})assert(f,table.concat(g,'\n'))local h,i,j,k,l,m,n,o,p,t,u,v,E,F=ah.
find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ao(
true),af.DisabledText or ao'Component Disabled',af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),
af.ClearTextOnFocus or ao(false),af.Placeholder or ao''local G,H=(af.FLAG or ao(k.uid))if au(G)~=''then H=ak.register(
au(G),{correctText=ao''},'textbox',au(G)==k.uid)end local I=ao(au(h.string)==au(k.tab).uid)aq(h.string):onChange(
function()I:set(au(h.string)==au(k.tab).uid)end)local J,K,L,M,N,O=av(function()return au(I)and 0 or 1 end,40,1),ao(),ao(
false),ao'',ao(au(H.status.correctText)),ao''aq(M):onChange(function()if au(t)then if tonumber(au(M))or au(M)==''then N:
set(au(M))end else N:set(au(M))end local P=au(K)P.Text=au(N)if au(v)then return end if au(t)then if(tonumber(au(M))or
au(M)=='')and au(O)~=au(M)then task.spawn(au(n),au(M))H.status.correctText:set(au(M))O:set(au(M))end else if au(O)==au(M
)then return end task.spawn(au(n),au(M))H.status.correctText:set(au(M))O:set(au(M))end end)aq(L):onChange(function()if
au(v)and not au(L)then if au(t)then if(tonumber(au(M))or au(M)=='')and au(O)~=au(M)then task.spawn(au(n),au(M))H.status.
correctText:set(au(M))O:set(au(M))end else if au(O)==au(M)then return end task.spawn(au(n),au(M))H.status.correctText:
set(au(M))O:set(au(M))end end end)am'Frame'{Parent=l,Visible=ap(function()if au(j.string)~=''and not string.find(au(m):
lower(),au(j.string):lower())then return false end return true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[
an]={am'Frame'{ZIndex=2,Visible=ap(function()if not au(o)then return true end return false end),BackgroundTransparency=
av(function()return au(I)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={
aA(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=J},am'TextLabel'{FontFace=aw(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=J,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ap(function()
return au(p)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(
1,1),BackgroundTransparency=1,[an]={aC(b.LayoutOrder,e.Horizontal,d.Left,c.Center,UDim.new(0,3)),am'Frame'{Size=UDim2.
new(0.65,-3,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=J,[an]={aA(6),az(0,6),am'TextLabel'{FontFace=aw(
'Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=m,TextTransparency=J,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}},am'TextButton'{Interactable=ap(function()if not au(o)then return false end return
au(I)end),Size=UDim2.fromScale(0.35,1),BackgroundColor3=ai.background2,BackgroundTransparency=J,[as'Activated']=function
()local P=au(K)if P then P:CaptureFocus()end end,[an]={aA(6),az(0,6),aC(b.LayoutOrder,e.Horizontal,d.Left,c.Center,UDim.
new(0,5)),am'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.
text2,ImageTransparency=J},am'TextBox'{Interactable=ap(function()if not au(o)then return false end return au(I)end),Size
=UDim2.new(1,-25,1,0),BackgroundTransparency=1,PlaceholderText=F,PlaceholderColor3=ai.text2,TextColor3=ai.text,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,FontFace=aw('Montserrat',Enum.FontWeight.Bold),Text=N,
TextTransparency=J,ClearTextOnFocus=E,[ar]=K,[as'Changed']=function(P)local Q=au(K)if Q and Q.Text and P=='Text'then M:
set(Q.Text)end end,[as'Focused']=function()L:set(true)end,[as'FocusLost']=function()L:set(false)end,[an]={aB(1,16)}}}}}}
}}if au(i.boolean)then aq(H.file):onChange(function()local P,Q=au(H.file),true if P~=nil then if au(v)then L:set(true)
end M:set(P)if au(v)then L:set(false)end Q=false end if Q then if au(v)then L:set(true)end M:set(au(u))if au(v)then L:
set(false)end end end)else if au(v)then L:set(true)end M:set(au(u))if au(v)then L:set(false)end end local P={}function P
.SetName(Q,R)local S,T=ax({SetName=R},{SetName=''})assert(S,table.concat(T,'\n'))m:set(R)end function P.SetInput(Q,R)
local S,T=ax({SetInput=R},{SetInput=au(t)and 1 or''})assert(S,table.concat(T,'\n'))M:set(R)end function P.Enable(Q)o:
set(true)end function P.Disable(Q)o:set(false)end return P end end)()end,[76]=function()local aa,ab,ac=a(76)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.
themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an
.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC,b=au.get,au.animate,
au.typecheck,au.connections,au.customFont,au.references,au.randomString,au.drag,ac(ae.simpleElements)local c,d,e,f,g,h,i
,j,k,l,m=b.UIPadding,b.UICorner,b.UITextSizeConstraint,b.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn),ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,
Default=false,Callback=function()end,LinkKeybind=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.
IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.LinkKeybind and''or'LinkKeybind'})assert(l,table.concat(m,
'\n'))l,m=ax(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or'Bind'})assert(l,table.concat(m,'\n'))local n,o
,p,t,u,v,E,F,G,H,I,J,K,L,M,N,O=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find
'instanceName',ah.find'isMobile',ah.find'isListening',ah.add(af),af.Parent,af.Name,af.Callback,af.Default or aq(false),
af.IsEnabled or aq(true),af.Bind,af.DisabledText or aq'Component Disabled',af.LinkKeybind or aq(false),aq()
local function P(Q:EnumItem,R:string)local S=av(o.binds)if table.find(S,Q)then k(('Key %s is already in use. %s'):
format(Q.Name,R))else table.insert(S,Q)if av(O)then table.remove(S,table.find(S,av(O)))end o:update('binds',S)O:set(Q)
end end local Q,R=(af.FLAG or aq(F.uid))if av(Q)~=''then R=ak.register(av(Q),{boolean=aq(false),keycode=aq(nil)},
'toggle',av(Q)==F.uid)end ar(R.status.boolean):onChange(function()if av(K)then task.spawn(av(I),av(R.status.boolean))end
end)ar(R.status.keycode):onChange(function()local S,T=pcall(function()return Enum.KeyCode[av(R.status.keycode)]end)if S
then P(T,'RAHHH')end end)local S=aq(av(n.string)==av(F.tab).uid)ar(n.string):onChange(function()S:set(av(n.string)==av(F
.tab).uid)end)local T,U=aw(function()return av(S)and 0 or 1 end,40,1),aq(false)local V=am.InputBegan:Connect(function(V,
W)if av(v.boolean)then return end if av(U)then if V.KeyCode and V.KeyCode~=Enum.KeyCode.Unknown then P(V.KeyCode,
'From input box')end U:set(false)task.wait()E:update('boolean',false)else if V.KeyCode and V.KeyCode==av(O)and not W and
not av(E.boolean)and av(K)then R.status.boolean:set(not av(R.status.boolean))end end end)ay.add(V)local W,X=(aq(false))
local Y=ao'TextButton'{Visible=at(function()if not av(K)then return av(K)end return av(W)end),Parent=aA.get(av(u.name)),
Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=av(
H),FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[as'Activated']=function()if X then X:Disconnect(
)X=nil else R.status.boolean:set(not av(R.status.boolean))end end,[ap]={c(4),d(16),e(0,16),ao'ImageLabel'{ZIndex=0,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1
,Image=av(v.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{
Parent=G,Visible=at(function()if av(t.string)~=''and not string.find(av(H):lower(),av(t.string):lower())then return
false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(
function()if not av(K)then return true end return false end),BackgroundTransparency=aw(function()return av(S)and 0.2 or
1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={d(6),ao'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=T},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=T,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()return av(M)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[ap]={c(0,5)}}}},ao'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={f(
g.LayoutOrder,h.Horizontal,i.Left,j.Center,UDim.new(0,3)),ao'TextButton'{Interactable=at(function()if not av(K)then
return false end return av(S)end),Size=at(function()return av(N)and UDim2.new(0.775,av(W)and-42 or-3,0,36)or UDim2.new(1
,0,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=T,[as'Activated']=function()if not av(K)then return
end R.status.boolean:set(not av(R.status.boolean))end,[ap]={d(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={c(8),f(g.LayoutOrder,h.Horizontal,i.Left,j.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=T,BackgroundColor3
=aw(function()return av(R.status.boolean)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[ap]={d(6),ao'ImageLabel'{
Size=UDim2.fromScale(0.65,0.65),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=
1,Image=aj.check,ImageTransparency=aw(function()if not av(S)then return 1 end if av(R.status.boolean)then return 0 end
return 1 end,40,1),ImageColor3=ai.selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2
.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=H,TextTransparency=T,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'
{Visible=W,Interactable=at(function()if not av(K)then return false end return av(S)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=T,[as'Activated']=function()W:set(false)Y.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={d(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=
UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=T}}},ao'TextButton'
{Visible=N,Interactable=at(function()if not av(K)then return false end return av(S)end),Size=UDim2.new(0.225,0,1,0),
BackgroundColor3=ai.background2,BackgroundTransparency=T,[as'Activated']=function()if av(v.boolean)then W:set(true)X=aC(
Y,15)return end U:set(true)E:update('boolean',true)end,[ap]={d(6),c(6),f(g.LayoutOrder,h.Horizontal,i.Left,j.Center,UDim
.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(v.boolean)and aj.
finger or aj.command,ImageColor3=ai.text2,ImageTransparency=T},ao'TextLabel'{Visible=not av(v.boolean),Size=UDim2.new(1,
-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=T,Text=at(function()return av(U)and'Listening'or av(O)and av(
O).Name or'Waiting'end)},ao'TextLabel'{Visible=av(v.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return av(W)and'Move Bind'or'Place Bind'end),TextTransparency=T}}}}}}}if av(p.boolean)then ar(R.
file):onChange(function()local Z,_,aD=av(R.file),true,true if Z.boolean~=nil then R.status.boolean:set(Z.boolean)_=false
end if Z.keycode~=nil then R.status.keycode:set(Z.keycode)aD=false end if _ then R.status.boolean:set(av(J))end if aD
then if L then R.status.keycode:set(av(L).Name)end end end)else R.status.boolean:set(av(J))if L then R.status.keycode:
set(av(L).Name)end end local aD={}function aD.SetName(Z,_)local aE,aF=ax({SetName=_},{SetName=''})assert(aE,table.
concat(aF,'\n'))H:set(_)end function aD.SetValue(aE,aF:boolean)local Z,_=ax({SetValue=aF},{SetValue=false})assert(Z,
table.concat(_,'\n'))R.status.boolean:set(aF)end function aD.SetBind(aE,aF:EnumItem)assert(av(N),'Requires LinkKeybind')
local Z,_=ax({SetBind=aF},{SetBind=Enum.keyCode.C})assert(Z,table.concat(_,'\n'))P(aF,'At :SetBind')end function aD.
Enable(aE)K:set(true)end function aD.Disable(aE)K:set(false)end return aD end end)()end,[77]=function()local aa,ab,ac=a(
77)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag,ah,ai=ac(ae.Bundles),ac(ab.Parent.
notification),ac(ae.utilities).references local aj,ak=ag.icons,ag.themeSystem ah{Parent=ai.get'notificationList',Title=
'Darius Interface',Body=af,Duration=3,Image=aj.alert,ImageColor=ak.get'red'}end end)()end,[78]=function()local aa,ab,ac=
a(78)local ad return(function(...)end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)local ae=ab.
Parent.Parent return function(af,ag)local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService
,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Ref,an.Computed,
an.Observer,an.OnEvent,ac(ae.simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner,av.
UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(
ae.utilities)local aF,b,c,d,e,f,g,h,i,j,k,l,m=aE.get,aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,ac(ab
.Parent.Parent.components.warn),aq(),aq(),aq(),aq(),aq(),aq()b.add(l,k,j,i,h,m)local n,o,p,t,u,v,E,F,G,H,I,J,K,L=am.find
'absoluteOffset',am.find'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible'
,am.find'isMobile',am.find'isListening',aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(I):onChange(function()
if aF(I)then J:set(not aF(J))task.wait(0.3)K:set(not aF(K))task.wait(0.3)L:set(not aF(L))else L:set(not aF(L))task.wait(
0.3)K:set(not aF(K))task.wait(0.3)J:set(not aF(J))end end)at(K):onChange(function()G:set(aF(K)and 212 or 750)end)at(L):
onChange(function()H:set(aF(L)and 74 or 500)end)local M,N,O=aq(false),aq(),aq(false)local function P(Q:EnumItem,R:string
)local S=aF(u.binds)if table.find(S,Q)then g(('Key %s is already in use. %s'):format(Q.Name,R))else table.insert(S,Q)if
aF(N)then table.remove(S,table.find(S,aF(N)))end u:update('binds',S)N:set(Q)O:set(true)end end if not aF(E.boolean)then
P(af.HideBind,'init')end local Q=aq''at(p.string):onChange(function()local R=aF(p.string)local S=am.find(R)Q:set(aF(S.
Name):upper())end)local R,S ao'ScreenGui'{Name=aF(o.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,
IgnoreGuiInset=true,[ar]=l,[ap]={ao'Frame'{Name='container',Visible=v.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=
as(function()return UDim2.new(0.5,0,0.5,aF(n.number))end),Size=e(function()return UDim2.fromOffset(aF(G),aF(H))end,30,1)
,BackgroundColor3=ak.background,[ar]=h,[ap]={ax(6),az(16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right,aD.Top,UDim.new(0,16)
),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=e(function()return UDim2.new(0,math.clamp(aF(G)-32-180-16,212,
9e9),aF(J)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao'TextLabel'{Size=UDim2.new(1,-1,
0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=Q,TextXAlignment=Enum.TextXAlignment.Right,
TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=d('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=ak.text,
TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=
UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,16)),ao
'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(
0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,
UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=d('Montserrat',Enum.
FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},ao'TextLabel'{
Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=ak.text2,FontFace=d('Montserrat',Enum.FontWeight.Bold),
TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left}}},ao'TextButton'{Size=UDim2.new(0.35,-
10,1,0),BackgroundColor3=ak.background2,[au'Activated']=function()local T=aF(m)if T then T:CaptureFocus()end end,[ap]={
az(0,4),ax(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'ImageLabel'{Size=UDim2.fromOffset(20
,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=ak
.text2,TextSize=16,FontFace=d('Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=ak.text2,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[au'Changed']=
function(T)local U=aF(m)if T~='Text'and U and U.Text then return end t:update('string',U.Text)end,[ar]=m}}}}},ao'Frame'{
Name='tabFrameList',Size=UDim2.new(1,0,1,-60),BackgroundTransparency=1,[ar]=j}}}}},ao'Frame'{Size=e(function()return aF(
L)and UDim2.new(0,180,0,44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={
ax(6),aw(aA.LayoutOrder,aB.Vertical,aC.Center,aD.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),
BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'TextButton'{Size=
UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()if aF(E.boolean)then O:set(true)S=c(R,15
)return end M:set(true)F:update('boolean',true)end,[ap]={ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,
UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aF(E.boolean)and al.
finger or al.command,ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not aF(E.boolean),Size=UDim2.new(1,
-25,0,16),BackgroundTransparency=1,FontFace=d('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(M)and'Listening'or aF(N)and aF(N).Name or'Waiting'
end)},ao'TextLabel'{Visible=aF(E.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=d('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()
return aF(O)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.
selectedTab,[au'Activated']=function()I:set(not aF(I))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(I)
and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()if not aF(O)then ac(ae.components.notification){Parent=k,
Title='Darius Interface',Body=`You must {aF(E.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end v:update('boolean',not aF(v.boolean))end,[ap]={ax(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=e(function()return aF(L)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[ar]=i,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,6)),az(0,10)}},ao'TextButton'
{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=function()ag:Fire()ag:Destroy()f:
deleteConnections()b:clear()end,[ap]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao
'ImageLabel'{BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=
0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=d('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=
true,Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]
={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',
BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),
ClipsDescendants=false,[ar]=k,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}R=ao'TextButton'{Visible=as(
function()return(aF(O)and aF(E.boolean))end),Interactable=as(function()return(aF(O)and aF(E.boolean))end),Parent=b.get(
aF(o.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=
true,Text='Hide UI',FontFace=d('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au'Activated']=function()if S then S:Disconnect(
)S=nil else v:update('boolean',not aF(v.boolean))end end,[ap]={az(4),ax(16),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aF(E
.boolean)and al.finger or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local T=aj.InputBegan:
Connect(function(T,U)if aF(E.boolean)then return end if aF(M)then if T.KeyCode and T.KeyCode~=Enum.KeyCode.Unknown then
P(T.KeyCode,'From input box')end M:set(false)task.wait()F:update('boolean',false)else if T.KeyCode and T.KeyCode==aF(N)
and not U and not aF(F.boolean)then v:update('boolean',not aF(v.boolean))end end end)f.add(T)c(b.get'container',15)end
end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(function(...)return setmetatable({},{__index=function(ae,af
)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[82]=function()local aa,
ab,ac=a(82)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.
AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.
New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[83]=function()local aa,ab,ac=a(
83)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag or 0 return ae.
New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...
)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or
Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,HorizontalAlignment=ah or Enum.
HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()
end,[85]=function()local aa,ab,ac=a(85)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return
function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingLeft=UDim.new(0,...),PaddingRight=UDim.new(0,
...),PaddingTop=UDim.new(0,...),PaddingBottom=UDim.new(0,...)}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=UDim
.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[1]),PaddingLeft=UDim.new(0,af[2])}elseif#af==3
then return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[3]
),PaddingLeft=UDim.new(0,af[2])}else return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]
),PaddingBottom=UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[4])}end end end)()end,[86]=function()local aa,ab,ac=a(86)
local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number?,ag:number?)return ae
.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[87]=function()local aa,ab,ac=a(87)local ad
return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else
error('no utility: '..af)end end})end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end
end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.
Bundles.services)function af.add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do if typeof(
ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil end end return af end)()end,[90]=function()local aa,ab,ac=a(
90)local ad return(function(...)local ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return
function(af:string,ag:Enum.FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=
ah or Enum.FontStyle.Normal if ae[af]then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[91]=
function()local aa,ab,ac=a(91)local ad return(function(...)local ae,af={},{}function ae.cloneref(ag)if cloneref then
return cloneref(ag)else return ag end end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil
function ae.isfile(ag:string)if isfile then return isfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag
:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then
return false end return true end end function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else local ah,ai
=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if
ah==nil then ai=true end end if ai then return false end return true end end function ae.writefile(ag:string,ah:string)
if writefile then return writefile(ag,ah)else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=
ai[ak]elseif(typeof(ai[ak])=='string'or typeof(ai[ak])=='nil')then ai[ak]=ah end end end end function ae.delfile(ag:
string)if delfile then return delfile(ag)else local ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if
typeof(ah)=='string'then ai[al]=nil else ai=ah end end end end function ae.readfile(ag:string)if readfile then return
readfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true
break end end else ah=ah[ag]end if ai then warn'readfile: no file'return nil end return ah end end function ae.
makefolder(ag:string)if makefolder then return makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'
do if not ah[aj]then ah[aj]={}break else ah=ah[aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if
listfiles then return listfiles(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah
==nil then ai=true break end end else ah=ah[ag]end if ai or typeof(ah)=='string'then warn'no folder exists'return nil
end local aj={}for ak,al in ah do if typeof(al)=='string'then table.insert(aj,ak)end end return aj end end return ae end
)()end,[92]=function()local aa,ab,ac=a(92)local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.
Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(aq,
ar,as)return aq+(ar-aq)*as end local function aq(ar)if not(ao)then return end if not(al)and(an)then ak.Position=UDim2.
new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,ar*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,an.Y.Offset,ar*ah))return
end local as=(am-ai:GetMouseLocation())local at,au=(ao.X.Offset-as.X),(ao.Y.Offset-as.Y)an=UDim2.new(ao.X.Scale,at,ao.Y.
Scale,au)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,at,ar*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,au,ar*ah)
)end ak.InputBegan:Connect(function(ar)if ar.UserInputType==Enum.UserInputType.MouseButton1 or ar.UserInputType==Enum.
UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()ar.Changed:Connect(function()if ar.
UserInputState==Enum.UserInputState.End then al=false end end)end end)local ar=aj.Heartbeat:Connect(aq)return ar end end
)()end,[93]=function()local aa,ab,ac=a(93)local ad return(function(...)return function(ae,af)if typeof(ae)=='table'and
ae.type=='State'then return ae:get(af)end return ae end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(
function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font
ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.services).TextService return ah:
GetTextBoundsAsync(ag)end end)()end,[95]=function()local aa,ab,ac=a(95)local ad return(function(...)local ae=string.
split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then return af(
ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[96]=function()local aa,ab,ac=a(96)local ad return
(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af.add(...)
for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if typeof(ah(aj))=='Instance'then if not
ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end)else if not ae[ah(
aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end end function af.get(ai)if
ae[ai]then return ae[ai]end end function af.remove(ai)if ae[ai]then ae[ai]=nil else warn(ai,
"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=nil if typeof(aj)=='Instance'then aj
:Destroy()end end end return af end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)local ae=ac(ab
.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end,[98]=
function()local aa,ab,ac=a(98)local ad return(function(...)return function(ae:table,af:table,ag:table?):any ag=ag or{}
local ah,ai=true,{}for aj,ak in af do if(not ae[aj]or typeof(ae[aj])~=typeof(ak))and not table.find(ag,aj)then ah=false
table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah,ai end end)()end},{{1,2,{'Darius'}
,{{78,2,{'darius.story'}},{2,2,{'Bundles'},{{3,2,{'Fusion'},{{16,1,{'Dependencies'},{{19,2,{'sharedState'}},{17,2,{
'captureDependencies'}},{21,2,{'useDependency'}},{20,2,{'updateAll'}},{18,2,{'initDependency'}}}},{49,1,{'Utility'},{{51
,2,{'cleanup'}},{52,2,{'doNothing'}},{55,2,{'restrictRead'}},{56,2,{'xtypeof'}},{54,2,{'needsDestruction'}},{53,2,{
'isSimilar'}},{50,2,{'None'}}}},{4,1,{'Animation'},{{8,2,{'TweenScheduler'}},{9,2,{'getTweenRatio'}},{12,2,{
'springCoefficients'}},{5,2,{'Spring'}},{11,2,{'packType'}},{10,2,{'lerpType'}},{13,2,{'unpackType'}},{7,2,{'Tween'}},{6
,2,{'SpringScheduler'}}}},{48,2,{'Types'}},{39,2,{'PubTypes'}},{22,1,{'Instances'},{{27,2,{'OnChange'}},{23,2,{
'Children'}},{24,2,{'Cleanup'}},{32,2,{'defaultProps'}},{29,2,{'Out'}},{31,2,{'applyInstanceProps'}},{30,2,{'Ref'}},{25,
2,{'Hydrate'}},{26,2,{'New'}},{28,2,{'OnEvent'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{40,1,{'State'},{{45,2,{
'Observer'}},{41,2,{'Computed'}},{46,2,{'Value'}},{47,2,{'unwrap'}},{43,2,{'ForPairs'}},{42,2,{'ForKeys'}},{44,2,{
'ForValues'}}}},{33,1,{'Logging'},{{37,2,{'messages'}},{34,2,{'logError'}},{36,2,{'logWarn'}},{38,2,{'parseError'}},{35,
2,{'logErrorNonFatal'}}}}}},{60,2,{'lucide'}},{61,2,{'services'}},{62,2,{'themeSystem'},{{63,2,{'default'}}}},{57,2,{
'data'}},{59,2,{'icons'}},{58,2,{'flags'}}}},{87,2,{'utilities'},{{89,2,{'connections'}},{98,2,{'typecheck'}},{96,2,{
'references'}},{93,2,{'get'}},{95,2,{'randomString'}},{88,2,{'animate'}},{97,2,{'tween'}},{90,2,{'customFont'}},{94,2,{
'getStringBounds'}},{91,2,{'customFunctions'}},{92,2,{'drag'}}}},{64,1,{'components'},{{66,2,{'divider'}},{68,2,{
'keybind'}},{75,2,{'textbox'}},{71,2,{'paragraph'}},{76,2,{'toggle'}},{77,2,{'warn'}},{69,2,{'label'}},{67,2,{'dropdown'
}},{73,2,{'tabButton'}},{72,2,{'slider'}},{74,2,{'tabFrame'}},{65,2,{'button'}},{70,2,{'notification'}}}},{81,2,{
'simpleElements'},{{86,2,{'UITextSizeConstraint'}},{82,2,{'UIAspectRatioConstraint'}},{85,2,{'UIPadding'}},{83,2,{
'UICorner'}},{84,2,{'UIListLayout'}}}},{79,1,{'layouts'},{{80,2,{'main'}}}}}}},'0.4.1','WaxRuntime',string,task,
setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay
,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)
=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,b
,c,d,e,f=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]=
'StringValue'},{},{},{},{},{},{},{}local g,h={GetFullName={{},function(g)local h,i=g.Name,g.Parent while i do h=i.Name..
'.'..h i=i.Parent end return h end},GetChildren={{},function(g)local h={}for i in ai,f[g]do au(h,i)end return h end},
GetDescendants={{},function(g)local h={}for i in ai,f[g]do au(h,i)for j,k in ai,i:GetDescendants()do au(h,k)end end
return h end},FindFirstChild={{'string','boolean?'},function(g,h,i)local j=f[g]for k in ai,j do if k.Name==h then return
k end end if i then for l in ai,j do return l:FindFirstChild(h,true)end end end},FindFirstAncestor={{'string'},function(
g,h)local i=g.Parent while i do if i.Name==h then return i end i=i.Parent end end},WaitForChild={{'string','number?'},
function(g,h)return g:FindFirstChild(h)end}},{}for i,j in ai,g do local k,l,m=j[1],j[2],{}for n,o in ai,k do local p,t=
az(o,'^([^%?]+)(%??)')m[n]={p,t}end h[i]=function(p,...)if not f[p]then ah(
"Expected ':' not '.' calling member function "..i,2)end local t={...}for u,v in ai,m do local E=t[u]local F,G,H=an(E),v
[1],v[2]if E==nil and not H then ah('Argument '..E..' missing or nil',3)end if G~='any'and F~=G and not(F=='nil'and H)
then ah('Argument '..u..' expects type "'..G..'", got "'..F..'"',2)end end return l(p,...)end end local function k(l,m,n
)local o,p=(ag({},{__mode='k'}))local function t(u)ah(u..' is not a valid (virtual) member of '..l..' "'..m..'"',3)end
local function u(v)ah('Unable to assign (virtual) property '..v..'. Property is read only',3)end local v,E={},{}E.
__metatable=false E.__index=function(F,G)if G=='ClassName'then return l elseif G=='Name'then return m elseif G=='Parent'
then return n elseif l=='StringValue'and G=='Value'then return p else local H=h[G]if H then return H end end for H in ai
,o do if H.Name==G then return H end end t(G)end E.__newindex=function(F,G,H)if G=='ClassName'then u(G)elseif G=='Name'
then m=H elseif G=='Parent'then if H==v then return end if n~=nil then f[n][v]=nil end n=H if H~=nil then f[H][v]=true
end elseif l=='StringValue'and G=='Value'then p=H else t(G)end end E.__tostring=function()return m end ag(v,E)f[v]=o if
n~=nil then f[n][v]=true end return v end local function l(m,n)local o,p,t,u=m[1],m[2],m[3],m[4]local v=aD[p]local E=t
and av(t,1)or v local F=k(v,E,n)aE[o]=F if t then for G,H in ai,t do F[G]=H end end if u then for G,H in ai,u do l(H,F)
end end return F end local m=k('Folder','['..ad..']')for n,o in ai,ab do l(o,m)end for p,t in ai,aa do local u=aE[p]aF[u
]=t b[u]=p local v=u.ClassName if v=='LocalScript'or v=='Script'then au(d,u)end end local function u(v)local E,F=v.
ClassName,c[v]if F and E=='ModuleScript'then return ak(F)end local G=aF[v]local function H(I)I=aq(I)local J,K,L=v:
GetFullName(),az(I,'[^:]+:(%d+): (.+)')if not K or not at then return J..':*: '..(L or I)end K=ar(K)local M=b[v]local N=
at[M]local O=K-N+1 if O<0 then O='?'end return J..':'..O..': '..L end if E=='LocalScript'or E=='Script'then local I,J=
ap(G)if not I then ah(H(J),0)end else local I={ap(G)}local J=av(I,1)if not J then local K=av(I,1)ah(H(K),0)end c[v]=I
return ak(I)end end function a(v)local E=aE[v]local function F(G,...)local H={ap(G,...)}local I=av(H,1)if not I then ah(
H[1],3)end return ak(H)end local G=aw(ag({},{__index=e,__newindex=function(G,H,I)e[H]=I end,__len=function()return#e end
,__iter=function()return ai,e end}))local H,I=aw{version=ac,envname=ad,shared=G,script=am,require=ao},E local function J
(K,...)local L,M,N=an(K),'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if L==
'table'and f[K]then if K.ClassName~='ModuleScript'then ah(M,2)elseif K==E then ah(N,2)end return u(K)elseif L=='string'
and ay(K,1,1)~='@'then if#K==0 then ah('Attempted to call require with empty string',2)end local O=E if ay(K,1,1)=='/'
then O=m elseif ay(K,1,2)=='./'then K=ay(K,3)end local P for Q in aA(K,'([^/]*)/?')do local R=Q if Q=='..'then R=
'Parent'end if R~=''then local S=O:FindFirstChild(R)if not S then local T=O.Parent if T then S=T:FindFirstChild(R)end
end if S then O=S elseif Q~=P and Q~='init'and Q~='init.server'and Q~='init.client'then ah('Virtual script path "'..K..
'" not found',2)end end P=Q end if O.ClassName~='ModuleScript'then ah(M,2)elseif O==E then ah(N,2)end return u(O)end
return F(ao,K,...)end return H,I,J end for v,E in ai,d do aC(u,E)end return u(m:GetChildren()[1])