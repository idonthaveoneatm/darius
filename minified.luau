local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i=f.data,f.themeSystem,f.services local j,k=i.HttpService,f.Fusion local l,m=
k.Observer,d(c.utilities)local n,o,p,q,r,s,t,u,v=m.references,m.connections,m.customFunctions,m.randomString,m.get,m.
typecheck,d(c.layouts.main),d(c.Bundles.flags),d(c.components.warn)[2]local function w(x,y,z)z.Parent=y return d(c.
components[x])(z)end local x={}function x.Window(y,z)if p.getgenv then if p.getgenv().dariusInstance then o:
deleteConnections()n:clear()p.getgenv().dariusInstance=nil end else if _G.dariusInstance then o:deleteConnections()n:
clear()_G.dariusInstance=nil end end local A,B=s(z,{Title='',Description='',Icon='',HideBind=Enum.KeyCode.T,UseConfig=
false,IsMobile=false,Offset=0,Theme={},noOffset=false,Parent=Instance.new'Part'},{z.Icon and''or'Icon',z.noOffset and''
or'noOffset',z.IsMobile and''or'IsMobile',z.UseConfig and''or'UseConfig',z.Theme and''or'Theme',z.Parent and''or'Parent'
,z.Offset and''or'Offset'})assert(A,table.concat(B,'\n'))A,B=s(z,{Config=''},{z.UseConfig and''or'Config'})assert(A,
table.concat(B,'\n'))v(z.Title)h.create(z.Theme or{})g.add({string=''},'selectedTab')g.add({boolean=false},'isFirst')g.
add({number=z.noOffset and 0 or 58},'absoluteOffset')g.add({name=q(32)},'instanceName')g.add({binds={}},'currentBinds')g
.add({bindData={}},'bindData')g.add({string=''},'searchText')g.add({boolean=true},'isVisible')g.add({boolean=z.IsMobile}
,'isMobile')g.add({boolean=false},'isListening')g.add({number=z.Offset or 58},'offset')local C,D,E,F,G=g.find'flags',g.
add({boolean=false},'configLoaded'),g.add({boolean=false},'useConfig'),(g.add{data=z})if z.UseConfig then E:update(
'boolean',z.UseConfig)G=z.Config local H,I={'darius',`/{G}`},''for J=1,#H do I=I..H[J]if not p.isfolder(I)then p.
makefolder(I)end end x.Folder=I G=I..'/config.json'x.File=G if not p.isfile(G)then p.writefile(G,'{}')end end x.flags={}
setmetatable(x.flags,{__index=function(H,I)local J=r(C.list)if J[I]then return J[I].user else return u.preregister(I).
user end return nil end})local H=k.New'BindableEvent'{}x.OnDestruction=H.Event t(z,H)local I,J=n.get'tabButtonList',n.
get'tabFrameList'x[F.uid]={}local K=x[F.uid]function K.Tab(L,M)local N=w('tabButton',I,M)local O=w('tabFrame',J,{uid=N.
uid})K[N.uid]={}local P=K[N.uid]function P.Button(Q,R)R.tab=N return w('button',O,R)end function P.Toggle(Q,R)R.tab=N
return w('toggle',O,R)end function P.Dropdown(Q,R)R.tab=N return w('dropdown',O,R)end function P.Label(Q,R)return w(
'label',O,{tab=N,Text=R})end function P.Paragraph(Q,R)R.tab=N return w('paragraph',O,R)end function P.TextBox(Q,R)R.tab=
N return w('textbox',O,R)end function P.Slider(Q,R)R.tab=N return w('slider',O,R)end function P.Keybind(Q,R)R.tab=N
return w('keybind',O,R)end function P.Divider(Q)return w('divider',O,{tab=N})end function P.ColorPicker(Q,R)R.tab=N
return w('colorpicker',O,R)end function P.KeybindList(Q)return w('keybindList',O,{tab=N})end return K[N.uid]end x.
Destroyed=false function x.Notify(L,M)return w('notification',n.get'notificationList',M)end function x.Destroy(L)x.
Destroyed=true H:Fire()o:deleteConnections()n:clear()H:Destroy()end function x.LoadConfig(L)if not z.UseConfig then
return end u.load(j:JSONDecode(p.readfile(G)))u.config:set(G)D:update('boolean',true)end function x.SetTheme(L,M)local N
,O=s({['New Theme']=M},{['New Theme']={}})assert(N,table.concat(O,'\n'))h.create(M)end if p.getgenv then p.getgenv().
dariusInstance=x else _G.dariusInstance=x end return x[F.uid]end return x end)()end,function()local b,c,d=a(2)local e
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
)local v=u.status.boolean m.add(k(v):onChange(function()if not u.private then task.spawn(o.export)end local E=g(v)u.user
.Value=E u.bindableEvent:Fire(E)end))end,dropdown=function(u)local v=u.status.multiselect and u.status.items or u.status
.item m.add(k(v):onChange(function()if not u.private then task.spawn(o.export)end local E=g(v)u.user.Value=E u.
bindableEvent:Fire(E)end))end,keybind=function(u)local v=u.status.mobile and u.status.coordinate or u.status.keycode m.
add(k(v):onChange(function()if not u.private then task.spawn(o.export)end local E=g(v)u.user.Value=E u.bindableEvent:
Fire(E)end))end,slider=function(u)local v=u.status.percentageOf m.add(k(v):onChange(function()if not u.private then task
.spawn(o.export)end local E=g(v)u.user.Value=E u.bindableEvent:Fire(E)end))end,textbox=function(u)local v=u.status.
correctText m.add(k(v):onChange(function()if not u.private then task.spawn(o.export)end local E=g(v)u.user.Value=E u.
bindableEvent:Fire(E)end))end,colorpicker=function(u)local v,E=u.status.color,u.status.transparency m.add(k(v):onChange(
function()if not u.private then task.spawn(o.export)end u.user.Value={g(v),g(E)}u.bindableEvent:Fire(unpack(u.user.Value
))end))m.add(k(E):onChange(function()if not u.private then task.spawn(o.export)end u.user.Value={g(v),g(E)}u.
bindableEvent:Fire(unpack(u.user.Value))end))end},{toggle=function(u)local v={}if u.boolean then v.boolean=g(u.boolean)
end if u.keycode then v.keycode=g(u.keycode)end return v end,dropdown=function(u)return u.multiselect and g(u.items)or
g(u.item)end,keybind=function(u)local v={}if u.keycode then v.keycode=g(u.keycode)end if u.coordinate then v.coordinate=
g(u.coordinate)end return v end,slider=function(u)return g(u.percentageOf)end,textbox=function(u)return g(u.correctText)
end,colorpicker=function(u)return{color=g(u.color),transparency=g(u.transparency)}end}function o.preregister(E)local F,G
=j.New'BindableEvent'{},{}function G.Connect(H,I)assert(typeof(I)=='function','Connect only takes functions')m.add(F.
Event:Connect(I))end local H H={name=E,status={},type='unknown',preregistered=true,bindableEvent=F,file=l{},user={Value=
nil,OnChange=setmetatable(G,{__newindex=function(I,J,K)return nil end})}}t[E]=H local I=g(p.list)I[H.name]=H p:update(
'list',I)return H end function o.register(E,F,G,H)assert(not table.find(q,E),'Flags must all be unique!')table.insert(q,
E)local I,J=j.New'BindableEvent'{},{}function J.Connect(K,L)assert(typeof(L)=='function','Connect')m.add(I.Event:
Connect(L))end local K if not t[E]then K={name=E,status=F,type=G,private=H,preregistered=false,bindableEvent=I,file=l{},
user={Value=nil,OnChange=setmetatable(J,{__newindex=function()return nil end})}}u[K.type](K)local L=g(p.list)L[K.name]=K
p:update('list',L)else K=t[E]K.type=G K.preregistered=false K.status=F K.private=H u[K.type](K)t[K.name]=nil end return
K end o.config=l''function o.export()local E,F={},g(p.list)for G,H in F do if H.private then continue end if H.type==
'unknown'then continue end E[H.name]=v[H.type](H.status)end if g(o.config)~=''then n.writefile(g(o.config),i:JSONEncode(
E))end end function o.load(E)for F,G in E do local H=g(p.list)[F]if not H then continue end H.file:set(G)end end return
o end)()end,[59]=function()local b,c,d=a(59)local e return(function(...)return{lock='rbxassetid://10723434711',maximize=
'rbxassetid://15556636376',minimize='rbxassetid://15556637715',close='rbxassetid://10747384394',circle=
'rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',
fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command='rbxassetid://10723416765',input=
'rbxassetid://10734982297',search='rbxassetid://10734943674',finger='rbxassetid://10734929723',alert=
'rbxassetid://10709752996',paint='rbxassetid://10734910187'}end)()end,[60]=function()local b,c,d=a(60)local e return(
function(...)end)()end,[61]=function()local b,c,d=a(61)local e return(function(...)local f=d(c.Parent.Parent.utilities.
customFunctions)local g,h=f.cloneref,{}h=setmetatable(h,{__index=function(i,j)return g(game:GetService(j))end})return h
end)()end,[62]=function()local b,c,d=a(62)local e return(function(...)local f,g,h={},d(c.Parent.Fusion),d(c.default)
local i,j,k,l,m=g.Value,g.Observer,d(c.Parent.Parent.utilities.get),d(c.Parent.Parent.utilities.animate),{}local n=i{}j(
n):onChange(function()for o,p in ipairs(m)do task.spawn(p)end end)local o={}table.foreach(h,function(p,q)table.insert(o,
p)end)function f.create(p)for q,t in o do if p[t]==nil then p[t]=h[t]end if typeof(p[t])~='Color3'then error(t..
" isn't type Color3")end end for u,v in p do if not table.find(o,u)then warn('Incorrect value removed "'..tostring(u)..
'"')p[u]=nil end end n:set(p)end function f.get(p:string)local t=k(n)if t[p]then return t[p]else error(p..
" isn't a theme element")end end for p,t in o do f[t]=l(function()return k(n)[t]end,40,1)end n:set(h)function f.onChange
(u)table.insert(m,u)end return f end)()end,[63]=function()local b,c,d=a(63)local e return(function(...)return{background
=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',
selectedTab=Color3.fromHex'#1A1A1B',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.fromHex'#222427',
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
local d return(function(...)local e=b.Parent.Parent return function(f)local g=c(e.Bundles)local h,i,j,k,l=g.data,g.
themeSystem,g.icons,g.flags,g.services local m,n,o=l.RunService,l.UserInputService,g.Fusion local p,t,u,v,E,F,G,H=o.New,
o.Children,o.Value,o.Observer,o.OnEvent,o.Computed,o.Ref,c(e.utilities)local I,J,K,L,M,N,O=H.get,H.animate,H.typecheck,H
.customFont,H.randomString,H.connections,c(e.simpleElements)local P,Q,R,S,T,U,V,W,X,Y=O.UIListLayout,O.UIPadding,O.
UITextSizeConstraint,O.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,K(f,{
Name='',DisabledText='',IsEnabled=false,Callback=function()end,FLAG='',Color=Color3.new(),Transparency=0},{f.IsEnabled
and''or'IsEnabled',f.DisabledText and''or'DisabledText',f.FLAG and''or'FLAG',f.Color and''or'Color',f.Transparency and''
or'Transparency'})assert(X,table.concat(Y,'\n'))local Z,_,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=h.find'selectedTab',h.find
'searchText',h.find'useConfig',h.find'offset',h.add(f),f.Parent,f.Name,f.Callback,f.IsEnabled or u(true),f.DisabledText
or u'Component Disabled',f.Color or u(Color3.new(1)),f.Transparency or u(0)local al,am=(f.FLAG or u(ad.uid))if I(al)~=''
then am=k.register(I(al),{color=u(Color3.new(1)),transparency=u(0)},'colorpicker',I(al)==ad.uid)end v(am.status.color):
onChange(function()if I(ah)then task.spawn(I(ag),I(am.status.color),I(am.status.transparency))end end)v(am.status.
transparency):onChange(function()if I(ah)then task.spawn(I(ag),I(am.status.color),I(am.status.transparency))end end)
local an,ao,ap=am.status.color,am.status.transparency,u(I(Z.string)==I(ad.tab).uid)v(Z.string):onChange(function()ap:
set(I(Z.string)==I(ad.tab).uid)end)local aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE=J(function()return I(ap)and 0 or 1
end,40,1),u(),u(0),u(),u(0),u(),u(0),u(),u(false),u(),u(false),u(),(u(false))local function aF()return{Name=af,Children=
{P(T.LayoutOrder,U.Vertical,V.Center,W.Top,UDim.new(0,5)),p'TextButton'{Size=UDim2.fromOffset(224,224),[G]=ax,[E
'InputBegan']=function(aG)if aG.UserInputType~=Enum.UserInputType.MouseButton1 then return end ay:set(true)local aH aH=
aG.Changed:Connect(function()if aG.UserInputState==Enum.UserInputState.End or aG.UserInputState.Cancel then ay:set(false
)aH:Disconnect()end end)end,[t]={p'UIGradient'{Color=F(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(({I(an):ToHSV()})[1],1,1))}end)},p'Frame'{Size=
UDim2.fromScale(1,1),[t]={p'UIGradient'{Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
0,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=F(function()return NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},p'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0.5,
0.5),BackgroundColor3=F(function()local aG,aH,aI=I(an):ToHSV()return Color3.fromHSV(0,0,1-aI)end),Size=UDim2.fromOffset(
4,4),Position=F(function()local aH,aI,aJ=I(an):ToHSV()return UDim2.fromScale(aI,1-aJ)end)}}},p'TextButton'{Size=UDim2.
new(1,0,0,24),[E'InputBegan']=function(aH)if aH.UserInputType~=Enum.UserInputType.MouseButton1 then return end aA:set(
true)local aI aI=aH.Changed:Connect(function()if aH.UserInputState==Enum.UserInputState.End or aH.UserInputState.Cancel
then aA:set(false)aI:Disconnect()end end)end,[G]=az,[t]={p'UIGradient'{Color=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3
.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),ColorSequenceKeypoint.new(0.4,Color3.fromHSV(
0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},p'Frame'{
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=i.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=F(function()local aH=
I(an):ToHSV()return UDim2.fromScale(1-aH,0.5)end)}}},p'ImageButton'{ZIndex=2,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=Enum.ScaleType.Crop,[E'InputBegan']=function(aH)if
aH.UserInputType~=Enum.UserInputType.MouseButton1 then return end aC:set(true)local aI aI=aH.Changed:Connect(function()
if aH.UserInputState==Enum.UserInputState.End or aH.UserInputState.Cancel then aC:set(false)aI:Disconnect()end end)end,[
G]=aB,[t]={p'Frame'{Size=UDim2.fromScale(1,1),[t]={p'UIGradient'{Color=F(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,I(an)),ColorSequenceKeypoint.new(1,I(an))}end),Transparency=F(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},p'Frame'{AnchorPoint=Vector2.
new(0,0.5),BackgroundColor3=i.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=F(function()return UDim2.fromScale(I(ao),
0.5)end)}}},p'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[t]={P(T.LayoutOrder,U.Horizontal,V.Left,W.Center
,UDim.new(0,4)),{p'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=i.text2
,BackgroundTransparency=1,TextSize=16,FontFace=L('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},p'TextBox'{Name=M(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',PlaceholderColor3=i
.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=i.text,Text=F(function()local aH={I(an).R,I(an).G,I(an).B}for aI,aJ
in aH do aH[aI]=math.floor(math.clamp(aJ*255,0,255))end return table.concat(aH,', ')end),TextScaled=true,FontFace=L(
'Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[G]=av,[E'Changed']=
function(aH)local aI=I(av)if aH=='TextBounds'and aI and aI.TextBounds then aw:set(aI.TextBounds.X)end end,[E'FocusLost']
=function()local aH=I(av)local aI,aJ=aH.Text:gsub(' ',''),{I(an).R,I(an).G,I(an).B}for aK,aL in aJ do aJ[aK]=math.floor(
math.clamp(aL*255,0,255))end local aM,aN,aO=table.concat(aJ,', '),pcall(function()local aM=string.split(aI,',')table.
foreach(aM,function(aN,aO)if not tonumber(aO)then return nil end aM[aN]=math.clamp(aO,0,255)end)return Color3.fromRGB(aM
[1],aM[2],aM[3])end)if aN and aO then an:set(aO)else aH.Text=aM end end,[t]={R(1,16),p'UISizeConstraint'{MaxSize=Vector2
.new(110,16),MinSize=Vector2.new(42,16)},p'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=i.text2,Position=UDim2
.fromScale(1,1),Size=J(function()return UDim2.fromOffset(math.clamp(I(aw),0,110),2)end,40,1),[t]={S(0,1)}}}}}}},p'Frame'
{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[t]={P(T.LayoutOrder,U.Horizontal,V.Left,W.Center,UDim.new(0,5)),{p
'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=i.text2,
BackgroundTransparency=1,TextSize=16,FontFace=L('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},p'TextBox'{Name=M(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.AutomaticSize.X,
PlaceholderText='HSV',PlaceholderColor3=i.text2,TextColor3=i.text,Text=F(function()local aH={I(an):ToHSV()}for aI,aJ in
aH do aH[aI]=math.floor(aJ*100)/100 end return table.concat(aH,', ')end),TextScaled=true,FontFace=L('Montserrat',Enum.
FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[G]=at,[E'Changed']=function(aH)local aI
=I(at)if aH=='TextBounds'and aI and aI.TextBounds then au:set(aI.TextBounds.X)end end,[E'FocusLost']=function()local aH=
I(at)local aI,aJ=aH.Text:gsub(' ',''),{I(an):ToHSV()}for aK,aL in aJ do aJ[aK]=math.floor(aL*100)/100 end local aM,aN,aO
=table.concat(aJ,', '),pcall(function()local aM=string.split(aI,',')table.foreach(aM,function(aN,aO)if not tonumber(aO)
then return nil end end)return Color3.fromHSV(unpack(aM))end)if aN and aO then an:set(aO)else aH.Text=aM end end,[t]={R(
1,16),p'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},p'Frame'{AnchorPoint=Vector2.new(1,0.5
),BackgroundColor3=i.text2,Position=UDim2.fromScale(1,1),Size=J(function()return UDim2.fromOffset(math.clamp(I(au),36,
110),2)end,40,1),[t]={S(0,1)}}}}}}}}}end v(ah):onChange(function()if not I(ah)and typeof(aD)=='Instance'then aD:Destroy(
)end end)p'Frame'{Interactable=F(function()if not I(ah)then return false end return I(ap)end),Visible=F(function()if I(_
.string)~=''and not string.find(I(af):lower(),I(_.string):lower())then return false end return true end),Parent=ae,Size=
UDim2.new(1,0,0,36),BackgroundTransparency=1,BackgroundColor3=i.background2,[t]={S(6),p'Frame'{ZIndex=3,Visible=F(
function()if not I(ah)then return true end return false end),BackgroundTransparency=J(function()return I(ap)and 0.2 or 1
end,40,1),BackgroundColor3=i.disabledBackground,Size=UDim2.fromScale(1,1),[t]={S(6),p'ImageLabel'{Size=UDim2.fromOffset(
24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=j.lock,ImageColor3=i.
disabledText,ImageTransparency=aq},p'TextLabel'{FontFace=L('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=i.disabledText,TextTransparency=aq,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ai,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[t]={Q(0,5)}}}},p'Frame'{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[t]={P(T.LayoutOrder,U.Horizontal,V.Left,W.Bottom,UDim.new(0,3)),p
'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=i.background2,BackgroundTransparency=aq,[t]={Q(9,8),S(6),P(T.
LayoutOrder,U.Horizontal,V.Left,W.Top),p'TextLabel'{FontFace=L('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,
18),BackgroundTransparency=1,TextColor3=i.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5
,0),Text=af,TextTransparency=aq,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},p'TextButton'{Interactable=F(
function()if not I(ah)then return false end return I(ap)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=i.background2,
BackgroundTransparency=aq,[E'Activated']=function()aD,aE=c(b.Parent.module)(aF())end,[t]={Q(0,8),S(6),P(T.LayoutOrder,U.
Horizontal,V.Right,W.Center,UDim.new(0,5)),p'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[t]={P(T.
LayoutOrder,U.Horizontal,V.Right,W.Center,UDim.new(0,4)),p'TextBox'{Interactable=F(function()if not I(ah)then return
false end return I(ap)end),Name=M(8),BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',
PlaceholderColor3=i.text2,TextColor3=i.text,TextTransparency=aq,Text=F(function()return'#'..I(an):ToHex()end),TextScaled
=true,FontFace=L('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[E
'Changed']=function(aH)local aI=I(ar)if aH=='TextBounds'and aI and aI.TextBounds then as:set(aI.TextBounds.X)end end,[E
'FocusLost']=function()local aH=I(ar)local aI=aH.Text:gsub('[^%w#]','')if not string.find(aI,'#')then aI='#'..aI end if
string.len(aI)~=7 then aH.Text='#'..I(an):ToHex()else local aJ,aK=pcall(function()return Color3.fromHex(aI)end)if aJ
then an:set(aK)else aH.Text='#'..I(an):ToHex()end end end,[G]=ar,[t]={R(1,16),p'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=i.text2,BackgroundTransparency=J(function()if I(ap)then return 0.5 end return 1 end,40,1),Position=
UDim2.fromScale(1,1),Size=J(function()return UDim2.fromOffset(math.clamp(I(as),0,98),2)end,40,1),[t]={S(0,1)}}}}}},p
'ImageLabel'{Size=UDim2.fromOffset(24,24),Image=j.paint,ImageColor3=an,BackgroundTransparency=1,ImageTransparency=J(
function()return not I(ap)and 1 or I(ao)end,40,1),[t]={S(6)}}}}}}}}N.add(m.Heartbeat:Connect(function()if I(ay)then
local aH=I(ax)local aI=n:GetMouseLocation()-aH.AbsolutePosition-Vector2.new(0,I(ac.number))aI=Vector2.new(math.clamp(aI.
X,0,aH.AbsoluteSize.X),math.clamp(aI.Y,0,aH.AbsoluteSize.Y))local aJ=I(an):ToHSV()an:set(Color3.fromHSV(aJ,aI.X/aH.
AbsoluteSize.X,(aH.AbsoluteSize.Y-aI.Y)/aH.AbsoluteSize.Y))end if I(aA)then local aH=I(az)local aI=n:GetMouseLocation()-
aH.AbsolutePosition-Vector2.new(0,I(ac.number))aI=Vector2.new(math.clamp(aI.X,0,aH.AbsoluteSize.X),0)local aJ,aK,aL=I(an
):ToHSV()an:set(Color3.fromHSV((aH.AbsoluteSize.X-aI.X)/aH.AbsoluteSize.X,aK,aL))end if I(aC)then local aH=I(aB)local aI
=n:GetMouseLocation()-aH.AbsolutePosition-Vector2.new(0,I(ac.number))aI=Vector2.new(math.clamp(aI.X,0,aH.AbsoluteSize.X)
,0)ao:set(aI.X/aH.AbsoluteSize.X)end end))if I(ab.boolean)then v(am.file):onChange(function()local aH,aI,aJ=I(am.file),
true,true if aH.color~=nil then local aK=string.split(aH.color:gsub(' ',''),',')table.foreach(aK,function(aL,aM)aK[aL]=
tonumber(aM)end)am.status.color:set(Color3.new(unpack(aK)))aI=false end if aH.transparency~=nil then am.status.
transparency:set(tonumber(aH.transparency))aJ=false end if aI then am.status.color:set(I(aj))end if aJ then am.status.
transparency:set(I(ak))end end)if am.private then am.status.color:set(I(aj))am.status.transparency:set(I(ak))end else am
.status.color:set(I(aj))am.status.transparency:set(I(ak))end local aH={}function aH.SetName(aI,aJ)local aK,aL=K({SetName
=aJ},{SetName=''})assert(aK,table.concat(aL,'\n'))af:set(aJ)end function aH.SetColor(aI,aJ)local aK,aL=K({SetColor=aJ},{
SetColor=Color3.new()})assert(aK,table.concat(aL,'\n'))am.status.color:set(aJ)end function aH.SetTransparency(aI,aJ)
local aK,aL=K({SetTransparency=aJ},{SetTransparency=0})assert(aK,table.concat(aL,'\n'))am.status.transparency:set(aJ)end
function aH.Enable(aI)ah:set(true)end function aH.Disable(aI)ah:set(false)end return aH end end)()end,[67]=function()
local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.
utilities)local ap,aq,ar,as,at=ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af.Parent local au=am(ap(ar.string)==
ap(as.tab).uid)an(ar.string):onChange(function()au:set(ap(ar.string)==ap(as.tab).uid)end)local av=aq(function()return
ap(au)and 0 or 1 end,40,1)ak'Frame'{Parent=at,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=
UDim2.new(1,0,0,2),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,
BackgroundTransparency=av}}}end end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag
.Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.
utilities)local au,av,aw,ax,ay=at.get,at.animate,at.typecheck,at.customFont,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE
,aF,aH,aI=ay.UIListLayout,ay.UIPadding,ay.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,aw(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Items={},Multiselect=
true,Regex=function()end},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',
af.Multiselect and''or'Multiselect',af.Regex and''or'Regex'})assert(aH,table.concat(aI,'\n'))aH,aI=aw(af,{Default=af.
Multiselect and{}or''},{af.Default and''or'Default'})assert(aH,table.concat(aI,'\n'))if af.Regex then assert(typeof(af.
Regex'')=='string','The Regex function must always return a string')end local aJ,aK,aL,aM,aN,aO,b,c,d,e,f,g,h=ah.find
'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,ao{},af.Multiselect or ao(
false),af.Default,af.IsEnabled or ao(true),af.DisabledText or ao'Component Disabled',af.Regex or ao(function(aJ)return
aJ end)local i,j=(af.FLAG or ao(aM.uid))if au(i)~=''then j=ak.register(au(i),{items=ao{},item=ao'',multiselect=au(d)},
'dropdown',au(i)==aM.uid)end local k,l,m,n,o,p=ao(),ao(),ao(false),ao(au(d)and{}or''),ao{},ao(false)ap(j.status.items):
onChange(function()if#au(j.status.items)==#au(c)then p:set(true)else p:set(false)end local t={}for u,v in au(j.status.
items)do table.insert(t,au(h)(v))end task.spawn(au(b),t)n:set(au(j.status.items))end)ap(j.status.item):onChange(function
()task.spawn(au(b),au(h)(au(j.status.item)))n:set(au(h)(au(j.status.item)))end)local t=ao(au(aJ.string)==au(aM.tab).uid)
ap(aJ.string):onChange(function()t:set(au(aJ.string)==au(aM.tab).uid)end)local u=av(function()return au(t)and 0 or 1 end
,40,1)am'Frame'{Parent=aN,Visible=ar(function()if au(aL.string)~=''and not string.find(au(aO):lower(),au(aL.string):
lower())then return false end return true end),Size=av(function()if au(m)and au(k)then local v,E=au(k),3 for F,G in v:
GetChildren()do if G:IsA'UIListLayout'or G:IsA'UICorner'or not G.Visible then continue end E+=(4+G.Size.Y.Offset)end
return UDim2.new(1,0,0,E)end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,BackgroundTransparency=
u,ClipsDescendants=true,[as]=k,[an]={aB(6),az(aC.LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(0,4)),am'TextButton'{
Interactable=ar(function()if not au(f)then return false end return au(t)end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[aq'Activated']=function()m:set(not au(m))end,[an]={am'Frame'{ZIndex=2,Visible=ar(function()if
not au(f)then return true end return false end),BackgroundTransparency=av(function()return au(t)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=u},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=u,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ar(function()return au(g)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,
[an]={aA(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aA(8),am'TextLabel'{FontFace=ax(
'Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(d)then return au(aO)..' '..
tostring(#au(j.status.items))..'/'..tostring(#au(c))end if typeof(au(n))=='table'then return au(aO)end return au(aO)..
': '..au(n)end),TextTransparency=u,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=ar(
function()return au(d)and aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=u}}}}},am
'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,[an]={aA(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),
BackgroundColor3=ai.background,BackgroundTransparency=u,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextXAlignment=
Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,
TextTransparency=u,[as]=l,[aq'Changed']=function(v)local E=au(l)if v=='Text'and E and E.Text then local F=E.Text for G,H
in au(o)do if string.find(au(h)(H.Name):lower(),F:lower())or F==''then H.Visible=true else H.Visible=false end end end
end,[an]={am'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},aB(4),aA(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32
),BackgroundTransparency=1,Visible=d,[an]={aA(6,6,0,6),am'TextButton'{Interactable=d,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=u,BackgroundColor3=ai.background,[aq'Activated']=function()local v={}if not au(p)then for E,F in
au(c)do F=typeof(F)=='table'and F.Value or F table.insert(v,au(h)(F))end end j.status.items:set(v)end,[an]={aB(4),aA(8),
am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if
au(p)then return'Deselect All'end return'Select All'end),TextTransparency=u,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=UDim2.new(1,0,0,136),BackgroundTransparency=1,ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aA(6,6,0,6),az(aC.LayoutOrder,aD.Vertical,
aE.Center,aF.Top,UDim.new(0,6)),o}}}}ap(c):onChange(function()local v={}for E,F in au(c)do local G,H,I=(ao(false))if
typeof(F)=='table'then local J,K=aw(F,{Value='',Image=''},{F.Image and''or'Image'})assert(J,table.concat(K,'\n'))H=F.
Value I=F.Image or nil else local J,K=aw({Item=F},{Item=''})assert(J,table.concat(K,'\n'))H=F end local J=au(h)(H)ap(j.
status.items):onChange(function()if table.find(au(j.status.items),J)then G:set(true)else G:set(false)end end)ap(j.status
.item):onChange(function()if au(j.status.item)==J then G:set(true)else G:set(false)end end)local K=am'TextButton'{Name=H
,Size=UDim2.new(1,0,0,28),BackgroundTransparency=u,BackgroundColor3=ai.background,[aq'Activated']=function()if au(d)then
local K=au(j.status.items)G:set(not au(G))if au(G)then table.insert(K,J)else table.remove(K,table.find(K,J))end j.status
.items:set(K)else j.status.item:set(J)m:set(false)end end,[an]={aB(4),aA(8),az(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.
Center,UDim.new(0,6)),am'Frame'{Visible=ar(function()return au(d)and true or false end),Size=UDim2.fromOffset(20,20),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=u,BackgroundColor3=av(function()
return au(G)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,
ImageTransparency=av(function()if not au(t)then return 1 end if au(G)then return 0 end return 1 end,40,1),ImageColor3=ai
.selectedTab}}},am'ImageLabel'{Visible=ar(function()return I and true or false end),Size=UDim2.fromOffset(18,18),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=I,ImageTransparency=u,
ImageColor3=ai.text2},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=ar(function()return au(d)and
UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=H,TextTransparency=u,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}}table.insert(v,K)end o:set(v)end)c:set(au(af.Items))if au(aK.boolean)then ap(j.file)
:onChange(function()local v,E=au(j.file),true if v~=nil then E=false end if au(d)then j.status.items:set(v)else j.status
.item:set(v)end if E then if au(d)then if e and#au(e)>0 then j.status.items:set(au(e))end else if e then j.status.item:
set(au(e))end end end end)if j.private then if au(d)then if e and#au(e)>0 then j.status.items:set(au(e))end else if e
then j.status.item:set(au(e))end end end else if au(d)then if e and#au(e)>0 then j.status.items:set(au(e))end else if e
then j.status.item:set(au(e))end end end local v={}function v.SetName(E,F)local G,H=aw({SetName=F},{SetName=''})assert(G
,table.concat(H,'\n'))aO:set(F)end function v.SetItems(E,F)local G,H=aw({SetItems=F},{SetItems={}})assert(G,table.
concat(H,'\n'))c:set(F)local I,J={},false for K,L in au(c)do local M if typeof(L)=='table'then M=L.Value else M=L end
local N=au(h)(M)if au(d)then if typeof(au(n))=='table'and table.find(au(n),N)then table.insert(I,N)J=true end else if
au(n)==N then J=true j.status.item:set(N)break end end end if J then if au(d)then j.status.items:set(I)end end end
function v.SelectItem(E,F)assert(not au(d),':SelectItem requires Multiselect to be false')local G,H=aw({SelectItem=F},{
SelectItem=''})assert(G,table.concat(H,'\n'))local I=false for J,K in au(c)do local L=K if typeof(K)=='table'then L=K.
Value end local M=au(h)(F)if au(h)(L)==M then I=true break end end assert(I,":SelectItem couldn't find "..F)j.status.
item:set(F)end function v.SelectItems(E,F)assert(au(d),':SelectItems requires Multiselect to be true')local G,H=aw({
SelectItems=F},{SelectItems={}})assert(G,table.concat(H,'\n'))for I,J in F do local K=false for L,M in au(c)do local N=
typeof(M)=='table'and au(h)(M.Value)or au(h)(M)if J==N then K=true break end end if K then F[I]=au(h)(J)else table.
remove(F,I)end end j.status.items:set(F)end function v.Enable(E)f:set(true)end function v.Disable(E)f:set(false)end
return v end end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an
=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed
,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references
,au.drag,ac(ae.simpleElements)local aD,aE,aF,aH,aI,aJ,aK,aL,aM,aN,aO=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC
.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],
ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Callback=function()end,Bind=Enum.KeyCode.Q},{af.DisabledText and
''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind'})assert(aN,table.concat(
aO,'\n'))local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,t=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find
'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.find'bindData',ah.add(af),af.Parent,af.Name
,af.Callback,af.Bind,af.IsEnabled or aq(true),af.DisabledText or aq'Component Disabled',aq()local function u(v:EnumItem,
E:string)local F,G=av(c.binds),av(i.bindData)if table.find(F,v)then aM(('Key %s is already in use. %s'):format(v.Name,E)
)else table.insert(F,v)if av(t)then table.remove(F,table.find(F,av(t)))G[av(t).Name]=nil end t:set(v)G[av(t).Name]={bind
=av(t),name=av(l)}i:update('bindData',G)c:update('binds',F)end end local v,E=(af.FLAG or aq(j.uid))if av(v)~=''then E=ak
.register(av(v),{coordinate=aq(Vector2.new(0,0)),keycode=aq(nil),mobile=av(f.boolean)},'keybind',av(v)==j.uid)end ar(E.
status.keycode):onChange(function()if av(t)and av(t).Name==av(E.status.keycode)then return end local F,G=pcall(function(
)return Enum.KeyCode[av(E.status.keycode)]end)if F then u(G,'RAHHH')end end)ar(t):onChange(function()E.status.keycode:
set(av(t).Name)end)local F=aq(av(b.string)==av(j.tab).uid)ar(b.string):onChange(function()F:set(av(b.string)==av(j.tab).
uid)end)local G,H=aw(function()return av(F)and 0 or 1 end,40,1),aq(false)local I=am.InputBegan:Connect(function(I,J)if
av(f.boolean)then return end if av(H)then if I.KeyCode and I.KeyCode~=Enum.KeyCode.Unknown then u(I.KeyCode,
'From input box')end H:set(false)task.wait()h:update('boolean',false)else if I.KeyCode and I.KeyCode==av(t)and not J and
not av(h.boolean)and av(o)then task.spawn(av(m))end end end)ay.add(I)local J=aq(false)local function K(L)for M,N in Enum
.KeyCode do if N.Name and N.Name==L then return N end end return nil end local L,M M=ao'TextButton'{Visible=at(function(
)if not av(o)then return av(o)end return av(J)end),Parent=aA.get(av(g.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=l,FontFace=az('Montserrat',Enum.FontWeight.
Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,
TextTransparency=0.1,[as'Activated']=function()if L then L:Disconnect()L=nil E.status.coordinate:set(M.AbsolutePosition)
else task.spawn(av(m))end end,[ap]={aD(4),aE(16),aF(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=av(f.boolean)and aj.finger
or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=k,Visible=at(function()if av(e.
string)~=''and not string.find(av(l):lower(),av(e.string):lower())then return false end return true end),Size=UDim2.new(
1,0,0,36),BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(o)then return true end return
false end),BackgroundTransparency=aw(function()return av(F)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground
,Size=UDim2.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=G},ao
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=G,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=at(function()return av(p)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aH(aI.LayoutOrder,aJ.Horizontal,aK.Left,aL.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=at(function()if not av(o)then return false end return av(F)end),Size=UDim2.new(0.225,0,1,
0),BackgroundColor3=ai.background2,BackgroundTransparency=G,[as'Activated']=function()if av(f.boolean)then J:set(true)L=
aB(M,15)return end H:set(true)h:update('boolean',true)end,[ap]={aE(6),aD(6),aH(aI.LayoutOrder,aJ.Horizontal,aK.Left,aL.
Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(f.boolean)
and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=G},ao'TextLabel'{Visible=not av(f.boolean),Size=UDim2
.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=G,Text=at(function()return av(H)and'Listening'or av(t)
and av(t).Name or'Waiting'end)},ao'TextLabel'{Visible=av(f.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return av(J)and'Move Bind'or'Place Bind'end),TextTransparency=G}}},ao'TextButton'{Visible=J,
Interactable=at(function()if not av(o)then return false end return av(F)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=G,[as'Activated']=function()J:set(false)M.Position=UDim2.
fromScale(0.5,0.5)E.status.coordinate:set(M.AbsolutePosition)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=
ai.red,ImageTransparency=G}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(J)and-42 or-3,0,36)end),
BackgroundColor3=ai.background2,BackgroundTransparency=G,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aH(aI.LayoutOrder,aJ.Horizontal,aK.Left,aL.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=l,TextTransparency=G,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(d.boolean)then ar(E.file):onChange(function()local N,O=av(E.file),
true if N.keycode~=nil then E.status.keycode:set(N.keycode)O=false end if O then if n then E.status.keycode:set(av(n).
Name)end end end)if E.private then if n then E.status.keycode:set(av(n).Name)end end else if n then E.status.keycode:
set(av(n).Name)end end local N={}function N.SetName(O,P)local Q,R=ax({SetName=P},{SetName=''})assert(Q,table.concat(R,
'\n'))l:set(P)end function N.SetBind(O,P:EnumItem)local Q,R=ax({SetBind=P},{SetBind=Enum.keyCode.C})assert(Q,table.
concat(R,'\n'))u(P,'At :SetBind')end function N.Enable(O)o:set(true)end function N.Disable(O)o:set(false)end return N
end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,
ak.Children,ak.Value,ak.Computed,ak.Observer,ak.OnEvent,ac(ae.simpleElements)local as,at,au,av,aw,ax,ay,az,aA=ar.
UICorner,ar.UIPadding,ar.UITextSizeConstraint,ar.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment
,Enum.VerticalAlignment,ac(ae.utilities)local aB,aC,aD,aE,aF,aH,aI,aJ,aK,aL,aM,aN=aA.get,aA.animate,aA.getStringBounds,
aA.customFont,ah.find'selectedTab',ah.find'searchText',ah.find'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an
'Active Keybinds',an''local aO=an(aB(aF.string)==aB(aK.tab).uid)ap(aF.string):onChange(function()aO:set(aB(aF.string)==
aB(aK.tab).uid)end)local b,c=aC(function()return aB(aO)and 0 or 1 end,40,1),an(0)task.spawn(function()c:set(aD(aB(aN),{
Font=aE('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aB(aL).AbsoluteSize.X)}).Y)end)aB(aL).Changed:
Connect(function(d)if d:lower()=='absolutesize'then c:set(aD(aB(aN),{Font=aE('Montserrat',Enum.FontWeight.Medium),Size=
16,Width=math.round(aB(aL).AbsoluteSize.X)}).Y)end end)ap(aN):onChange(function()c:set(aD(aB(aN),{Font=aE('Montserrat',
Enum.FontWeight.Bold),Size=16,Width=math.round(aB(aL).AbsoluteSize.X)}).Y)end)local function d(e)local f={}table.
foreach(e,function(g,h)f[g]=h.Name end)return table.concat(f,', ')end local e,f,g=(an'Active Keybinds')g,f=ac(ab.Parent.
module){Name=e,Children={}}local function h(i)local j,k={av(aw.LayoutOrder,ax.Vertical,ay.Center,az.Top,UDim.new(0,5))},
aB(aJ.bindData)for l,m in aB(aI.binds)do local n=k[m.Name]table.insert(j,al'TextLabel'{Size=UDim2.new(1,0,0,14),
BackgroundTransparency=1,TextColor3=ai.text,FontFace=aE('Montserrat',Enum.FontWeight.Regular),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,Text=ao(function()if n.boolean then return`[{n.bind.Name}] {n.name} (<i>{string.upper(
tostring(aB(n.boolean)))}</i>)`end return`[{n.bind.Name}] {n.name}`end)})end f(j)end al'TextButton'{Visible=ao(function(
)if aB(aH.string)~=''and not string.find(aB(aM):lower(),aB(aH.string):lower())and not string.find(aB(aN):lower(),aB(aH.
string):lower())then return false end return true end),BackgroundColor3=ai.background2,Parent=aL,BackgroundTransparency=
b,Size=ao(function()return UDim2.new(1,0,0,36+aB(c))end),AutomaticSize=Enum.AutomaticSize.Y,[aq'Activated']=function()if
typeof(g)=='Instance'then g:Destroy()g=nil end g,f=ac(ab.Parent.module){Name=e,Children={}}h(aB(aI.binds))end,[am]={as(6
),at(6),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.
text2,ImageTransparency=b},al'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.
fromOffset(25,0),BackgroundTransparency=1,TextTransparency=b,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum
.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=aE('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=
aM,[am]={au(1,18)}},al'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,25),
BackgroundTransparency=1,TextTransparency=b,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Top,TextSize=16,FontFace=aE('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,Text=aN,Size=ao(function()return
UDim2.new(1,-4,0,aB(c))end)}}}ap(aI.binds):onChange(function()h(aB(aI.binds))end)h(aB(aI.binds))aN:set(d(aB(aI.binds)))
ap(aI.binds):onChange(function()aN:set(d(aB(aI.binds)))end)end end)()end,[71]=function()local aa,ab,ac=a(71)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.
themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)
local aq,ar,as=ap.UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate,as.customFont
local ax,ay=au(af,{Text=''})assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,aD=ah.find'selectedTab',ah.find
'searchText',ah.add(af),af.Parent,af.Text local aE=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function()aE:
set(at(az.string)==at(aB.tab).uid)end)local aF=av(function()return at(aE)and 0 or 1 end,40,1)ak'Frame'{Visible=an(
function()if at(aA.string)~=''and not string.find(at(aD):lower(),at(aA.string):lower())then return false end return true
end),Size=UDim2.new(1,0,0,36),Parent=aC,BackgroundTransparency=aF,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak
'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,
TextTransparency=aF,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment
=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return at(aD)end),[al]={ak'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=18}}}}}local aH={}function aH.SetText(aI,aJ)local aK,aL=au({SetText=aJ},{SetText=''})assert(aK
,table.concat(aL,'\n'))aD:set(aJ)end return aH end end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function
(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.
icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.
utilities)local as,at,au,av,aw,ax,ay,az=ar.get,ar.animate,ar.typecheck,ar.customFont,ar.drag,ar.references,ar.
connections,ac(ae.simpleElements)local aA,aB,aC,aD,aE,aF,aH,aI,aJ=az.UIListLayout,az.UIPadding,az.UICorner,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,au(af,{Name={},Children={}},{})assert(aI,
table.concat(aJ,'\n'))local aK,aL,aM=ah.find'instanceName',af.Name,an(af.Children)local aN,aO,b=ax.get(as(aK.name)),(an(
false))b=al'TextButton'{Parent=aN,Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10),BackgroundTransparency=
1,[ap'MouseButton1Down']=function()aO:set(true)end,[am]={al'Frame'{Position=UDim2.new(0.5,-120,0,0),Size=UDim2.
fromOffset(240,0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={aC(4),aB(8),al'TextButton'{
AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),BackgroundColor3=ai.selectedTab,
[ap'Activated']=function()b:Destroy()end,[am]={aC(6),al'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,[am
]={aA(aD.LayoutOrder,aE.Vertical,aF.Center,aH.Top,UDim.new(0,8)),al'Frame'{Size=at(function()return as(aO)and UDim2.new(
0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=at(function()return as(aO)
and 0 or 0.5 end,40,1),[am]={aC(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=av('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=aL,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]=aM}}}}}}}}}local c,d=aw(b,15)local e=d:Connect(function()aO:set(false)end)ay.add(c)ay.add(e)b.
Destroying:Once(function()c:Disconnect()e:Disconnect()end)return b,function(...)aM:set(...)end end end)()end,[73]=
function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,
ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.
simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UICorner,au.UIPadding,au.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title='',Body='',Duration=1,Image='',ImageColor=
Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'
})assert(aC,table.concat(aD,'\n'))local aE,aF,aH,aI,aJ,aK,aL,aM,aN,aO,b=am(af.Title),am(af.Body),am(af.Duration),am(af.
Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250)
local c=am(ar(ap(aF),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=ap(b)-8-(aI and 32 or 0)}))local d=am(
20+math.clamp(ap(c).Y+4+10+(#ap(aK)>0 and 26 or 0),#ap(aK)>0 and 56 or 30,9e9))local function e(f,g)local h=1 for i=1,f
do h=h*10 end local i=tostring(math.round(g*h)/h)local j=string.split(i,'.')if#j==1 then local k=''for l=1,f do k=k..'0'
end i=i..'.'..k end return i end local f,g={}for h,i in ap(aK)do local j,k=at({Button=i},{Button={}})assert(j,table.
concat(k,'\n'))j,k=at(i,{Name='',Callback=function()end})assert(j,table.concat(k,'\n'))local l,m=i.Name,i.Callback local
n=aj'TextButton'{Size=UDim2.new(1/#ap(aK),-2,1,-4),TextSize=14,Text=l,FontFace=as('Montserrat',Enum.FontWeight.Bold),
BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(m)aM:set(false)task.wait(
0.4)aL:set(false)task.delay(0.3,function()aN:set(true)end)task.wait(2)g:Destroy()end,[al]={av(4)}}table.insert(f,n)end g
=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(b),ap(aL)and ap(d)+5
or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(aN)end),Interactable=aM,
AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.fromOffset(ap(b),ap(d)),[
ak'Activated']=function()aM:set(false)task.wait(0.4)aL:set(false)task.delay(0.3,function()aN:set(true)end)task.wait(2)g:
Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=UDim2.fromOffset(ap(b),ap(d)),
Position=aq(function()return UDim2.fromScale(ap(aM)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),ax(ay.LayoutOrder,az.
Horizontal,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=ap(aI)~=''and true or false,Size=UDim2.new(0,24,1,0)
,BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=aI,ImageColor3=aJ}}},aj'Frame'{Size=UDim2.new(1,ap(aI)~=''and-28
or 0,1,0),BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj'TextLabel'{Size=UDim2.
new(1,0,0,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment
.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aE},aj'TextLabel'{Size=UDim2.new(1,0,0,1),AutomaticSize=Enum.
AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Medium
),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,RichText=
true,TextColor3=ah.text2,Text=aF},aj'Frame'{Visible=an(function()return#ap(aK)>0 and true or false end),Size=UDim2.new(1
,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,UDim.new(0,2)),f}},aj
'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=aO,TextColor3=ah.text,
TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()aM:set(true
)end)task.spawn(function()repeat task.wait()until ap(aM)local j,k=(tick())repeat k=tick()-j aO:set(e(1,math.clamp(k,0,
ap(aH))))task.wait()until k>ap(aH)end)task.spawn(function()aL:set(true)repeat task.wait()until ap(aM)task.wait(ap(aH))
task.wait(0.2)aM:set(false)task.wait(0.4)aL:set(false)task.delay(0.3,function()aN:set(true)end)task.wait(2)g:Destroy()
end)end end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.
Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap.UIPadding,ap.
UITextSizeConstraint,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.customFont,at.
typecheck local az,aA=ay(af,{Title='',Body=''})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aH=ah.find
'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body local aI=am(au(aB.string)==au(aD.tab).uid)ao(aB.
string):onChange(function()aI:set(au(aB.string)==au(aD.tab).uid)end)local aJ,aK=av(function()return au(aI)and 0 or 1 end
,40,1),am(0)task.spawn(function()aK:set(aw(au(aH),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.
round(au(aE).AbsoluteSize.X)}).Y)end)au(aE).Changed:Connect(function(aL)if aL:lower()=='absolutesize'then aK:set(aw(au(
aH),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end end)ao(aH):
onChange(function()aK:set(aw(au(aH),{Font=ax('Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(au(aE).
AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function()if au(aC.string)~=''and not string.find(au(aF):lower(),au(aC.
string):lower())and not string.find(au(aH):lower(),au(aC.string):lower())then return false end return true end),
BackgroundColor3=ai.background2,Parent=aE,BackgroundTransparency=aJ,Size=an(function()return UDim2.new(1,0,0,36+au(aK))
end),AutomaticSize=Enum.AutomaticSize.Y,[al]={aq(6),ar(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,
18),BackgroundTransparency=1,TextTransparency=aJ,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aF
,[al]={as(1,18)}},ak'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),
BackgroundTransparency=1,TextTransparency=aJ,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Top,TextSize=12,FontFace=ax('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,Text=aH,Size=an(function()return
UDim2.new(1,-4,0,au(aK))end)}}}local aL={}function aL.SetBody(aM,aN)local aO,b=ay({SetBody=aN},{SetBody=''})assert(aO,
table.concat(b,'\n'))aH:set(aN)end function aL.SetTitle(aM,aN)local aO,b=ay({SetTitle=aN},{SetTitle=''})assert(aO,table.
concat(b,'\n'))aF:set(aN)end return aL end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons
,ag.flags,ag.services local am,an,ao=al.UserInputService,al.RunService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao
.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.
typecheck,aw.customFont,ac(ae.simpleElements)local aC,aD,aE,aF,aH,aI,aJ,aK,aL=aB.UIListLayout,aB.UIPadding,aB.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,az(af,{Name='',DisabledText='',FLAG=''
,IsEnabled=false,Default=0,Callback=function()end,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0},{af.DisabledText
and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.Min and''or
'Min',af.Max and''or'Max',af.DisplayAsPercent and''or'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace'})assert(aK
,table.concat(aL,'\n'))local aM,aN,aO,b,c,d,e,f,g,h,i,j,k=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah
.add(af),af.Parent,af.Name,af.Callback,af.Max,af.Min,af.DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.
IsEnabled or ar(true),af.DisabledText or ar'Component Disabled'local l=ax(af.Default)and ar(math.clamp(ax(af.Default),
ax(g),ax(f)))if not ax(l)then l=ar(ax(g))end local m,n=(af.FLAG or ar(b.uid))if ax(m)~=''then n=ak.register(ax(m),{
percentageOf=ar(nil)},'slider',ax(m)==b.uid)end local o=ar(ax(aM.string)==ax(b.tab).uid)as(aM.string):onChange(function(
)o:set(ax(aM.string)==ax(b.tab).uid)end)local p=ay(function()return ax(o)and 0 or 1 end,40,1)local function t(u,v,E,F,G)
return(1-((u-v)/(E-v)))*F+((u-v)/(E-v))*G end local function u(v)if ax(i)==0 then return math.floor(v)end return
tonumber(string.format('%.'..ax(i)..'f',v))end local v=ar(0)as(n.status.percentageOf):onChange(function()v:set(t(ax(n.
status.percentageOf),ax(g),ax(f),0,1))if not ax(j)then return end task.spawn(ax(e),ax(n.status.percentageOf))end)local E
,F,G,H=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(function(I)if(I.UserInputType==Enum.UserInputType.MouseButton1 or
I.UserInputType==Enum.UserInputType.Touch)and ax(H)then H:set(false)end end)ap'Frame'{Parent=c,Visible=au(function()if
ax(aO.string)~=''and not string.find(ax(d):lower(),ax(aO.string):lower())then return false end return true end),Size=
UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=ay(function()if ax(o)then return 0 end return
1 end,40,1),[aq]={aE(6),ap'Frame'{ZIndex=2,Visible=au(function()if not ax(j)then return true end return false end),
BackgroundTransparency=ay(function()return ax(o)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[aq]={aE(6),ap'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=p},ap'TextLabel'{
FontFace=aA('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=p,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(
function()return ax(k)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={aC(aF.LayoutOrder,aH.Horizontal,aI.Left,aJ.Center,UDim.new(0,6)
),aD(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=p,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=d,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aH.
Horizontal,aI.Left,aJ.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),
aC(aF.LayoutOrder,aH.Vertical,aI.Right,aJ.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aA('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=p,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(function()if ax(h)then return
tostring(u(ax(v)*100))..'%'end return ax(n.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(I)local J=ax(G)if I=='AbsoluteSize'and J and J.
AbsoluteSize then F:set(J.AbsoluteSize.X)end end,[at'FocusLost']=function()local I=ax(G)if tonumber(I.Text)then n.status
.percentageOf:set(math.clamp(tonumber(I.Text),ax(g),ax(f)))else if ax(h)then I.Text=tostring(u(ax(v)*100))..'%'end I.
Text=ax(n.status.percentageOf)end end,[av]=G,[aq]={aD(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(o)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(F),2)end,40,1),[aq]={aE(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(j)then return false
end return ax(o)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=function()H:set(true)
end,[at'TouchLongPress']=function()H:set(true)end,[at'InputBegan']=function(I)if I.UserInputType==Enum.UserInputType.
MouseButton1 or I.UserInputType==Enum.UserInputType.Touch and ax(E)then local J,K=am:GetMouseLocation().X,ax(E).Size.X.
Offset local L=J-(ax(E).AbsolutePosition.X+K)while ax(H)and task.wait()do local M=am:GetMouseLocation().X local N=math.
clamp(K+(M-J)+L,0,ax(E).AbsoluteSize.X)n.status.percentageOf:set(u(t(N,0,ax(E).AbsoluteSize.X,ax(g),ax(f))))an.
RenderStepped:Wait()end end end,[av]=E,[aq]={aD(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=p,[aq]={aE(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=p,Size=
ay(function()return UDim2.new(ax(v),0,0,4)end,40,1),[aq]={aE(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=p,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[aq]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ay(function()if ax(o)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if ax(aN.boolean)then as(n.file):onChange(function()local I,J=ax(n.file),true if I~=nil then n.status.
percentageOf:set(I)J=false end if J then n.status.percentageOf:set(ax(l))end end)if n.private then n.status.percentageOf
:set(ax(l))end else n.status.percentageOf:set(ax(l))end local I={}function I.SetName(J,K)local L,M=az({SetName=K},{
SetName=''})assert(L,table.concat(M,'\n'))d:set(K)end function I.SetValue(J,K)local L,M=az({SetValue=K},{SetValue=0})
assert(L,table.concat(M,'\n'))n.status.percentageOf:set(math.clamp(K,ax(g),ax(f)))end function I.Enable(J)j:set(true)end
function I.Disable(J)j:set(false)end return I end end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer,aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,
ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UIPadding
,au.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},
{af.Image and''or'Image'})assert(aC,table.concat(aD,'\n'))local aE,aF,aH,aI,aJ,aK,aL=ah.find'selectedTab',ah.find
'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image then aL=af.Image aK:set(true)end local aM=am(false)an(aE.
string):onChange(function()local aN=aq(aE.string)aM:set(aN==aH.uid)end)ak'TextButton'{Name=aH.uid,Parent=aI,Size=UDim2.
new(1,0,0,36),BackgroundColor3=ar(function()return aq(aM)and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao
'Activated']=function()aE:update('string',aH.uid)end,[al]={ax(4),aw(6),av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center
,UDim.new(0,4)),ak'ImageLabel'{Visible=aK,BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,
Image=aL,ImageTransparency=ar(function()return aq(aM)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=aq(aK)and UDim2.new(1,-
28,1)or UDim2.fromScale(1,1),FontFace=at('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=aJ,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=ar(function()return aq(aM)and 0 or 0.6
end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}if not aq(aF.boolean)then aF:update('boolean',
true)aE:update('string',aH.uid)end return aH end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=
ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj
'ScrollingFrame'{ZIndex=al(function()return(as(at.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=
UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center
,ar.Top,UDim.new(0,4))}}end end)()end,[78]=function()local aa,ab,ac=a(78)local ad return(function(...)local ae=ab.Parent
.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.
utilities)local au,av,aw,ax,ay=at.get,at.animate,at.customFont,at.typecheck,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE
,aF,aH,aI,aJ=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum
.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',Placeholder='',DisabledText='',ClearTextOnFocus=false,OnlyNumbers
=true,OnLeave=true,Default='',FLAG='',IsEnabled=false,Callback=function()end},{af.Placeholder and''or'Placeholder',af.
IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.
OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG and''or'FLAG',af.DisabledText and''or'DisabledText'})
assert(aI,table.concat(aJ,'\n'))local aK,aL,aM,aN,aO,b,c,d,e,f,g,h,i,j=ah.find'selectedTab',ah.find'useConfig',ah.find
'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ao(true),af.DisabledText or ao'Component Disabled'
,af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.ClearTextOnFocus or ao(false),af.Placeholder
or ao''local k,l=(af.FLAG or ao(aN.uid))if au(k)~=''then l=ak.register(au(k),{correctText=ao''},'textbox',au(k)==aN.uid)
end local m=ao(au(aK.string)==au(aN.tab).uid)aq(aK.string):onChange(function()m:set(au(aK.string)==au(aN.tab).uid)end)
local n,o,p,t,u,v,E=av(function()return au(m)and 0 or 1 end,40,1),ao(),ao(false),ao'',ao(au(l.status.correctText)),ao'',
ao(false)aq(t):onChange(function()if au(f)then if tonumber(au(t))or au(t)==''then u:set(au(t))end else u:set(au(t))end
local F=au(o)F.Text=au(u)if au(h)then return end if au(f)then if(tonumber(au(t))or au(t)=='')and au(v)~=au(t)then task.
spawn(au(c),au(t))l.status.correctText:set(au(t))v:set(au(t))end else if au(v)==au(t)then return end task.spawn(au(c),
au(t))l.status.correctText:set(au(t))v:set(au(t))end end)aq(p):onChange(function()if au(h)and not au(p)then if au(f)then
if(tonumber(au(t))or au(t)=='')and au(v)~=au(t)then task.spawn(au(c),au(t))l.status.correctText:set(au(t))v:set(au(t))
end else if au(v)==au(t)then return end task.spawn(au(c),au(t))l.status.correctText:set(au(t))v:set(au(t))end end end)am
'Frame'{Parent=aO,Visible=ap(function()if au(aM.string)~=''and not string.find(au(b):lower(),au(aM.string):lower())then
return false end return true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,Visible=ap(
function()if not au(d)then return true end return false end),BackgroundTransparency=av(function()return au(m)and 0.2 or
1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aA(6),am'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=n},am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=n,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ap(function()return au(e)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={
aC(aD.LayoutOrder,aH.Horizontal,aF.Left,aE.Center,UDim.new(0,3)),am'Frame'{Size=UDim2.new(0.65,-3,1,0),BackgroundColor3=
ai.background2,BackgroundTransparency=n,[an]={aA(6),az(0,6),am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold)
,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=b,TextTransparency=n,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},am
'TextButton'{Interactable=ap(function()if not au(d)then return false end return au(m)end),Size=UDim2.fromScale(0.35,1),
BackgroundColor3=ai.background2,BackgroundTransparency=n,[as'Activated']=function()local F=au(o)if F then F:
CaptureFocus()end end,[an]={aA(6),az(0,6),aC(aD.LayoutOrder,aH.Horizontal,aF.Left,aE.Center,UDim.new(0,5)),am
'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,
ImageTransparency=n},am'TextBox'{Interactable=ap(function()if not au(d)then return false end return au(m)end),
ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),BackgroundTransparency=1,PlaceholderText=j,PlaceholderColor3=ai.text2,
TextColor3=ai.text,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,FontFace=aw('Montserrat',Enum.FontWeight.Bold),
Text=u,TextTransparency=n,ClearTextOnFocus=i,[ar]=o,[as'Changed']=function(F)local G=au(o)if G.TextBounds.X>G.
AbsoluteSize.X then E:set(true)end if G and G.Text and F=='Text'then t:set(G.Text)end end,[as'Focused']=function()p:set(
true)end,[as'FocusLost']=function()p:set(false)end,[an]={am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[
an]={am'UIGradient'{Rotation=0,Color=av(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get
'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,40,1),Transparency=av(function()if au(E)then if au(p
)then return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.25,1),
NumberSequenceKeypoint.new(1,1)}else return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.
new(0.75,1),NumberSequenceKeypoint.new(1,0)}end end return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if au(aL.boolean)then aq(l.file):onChange(function()local F,G=au(l.
file),true if F~=nil then if au(h)then p:set(true)end t:set(F)if au(h)then p:set(false)end G=false end if G then if au(h
)then p:set(true)end t:set(au(g))if au(h)then p:set(false)end end end)if l.private then if au(h)then p:set(true)end t:
set(au(g))if au(h)then p:set(false)end end else if au(h)then p:set(true)end t:set(au(g))if au(h)then p:set(false)end end
local F={}function F.SetName(G,H)local I,J=ax({SetName=H},{SetName=''})assert(I,table.concat(J,'\n'))b:set(H)end
function F.SetInput(G,H)local I,J=ax({SetInput=H},{SetInput=au(f)and 1 or''})assert(I,table.concat(J,'\n'))t:set(H)end
function F.Enable(G)d:set(true)end function F.Disable(G)d:set(false)end return F end end)()end,[79]=function()local aa,
ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,
aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,
ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC
=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,aE,aF,
aH,aI,aJ,aK,aL,aM,aN,aO=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(af,{Name='',DisabledText='',FLAG=
'',IsEnabled=false,Default=false,Callback=function()end,LinkKeybind=true},{af.DisabledText and''or'DisabledText',af.FLAG
and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.LinkKeybind and''or'LinkKeybind'})assert(aN
,table.concat(aO,'\n'))aN,aO=ax(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or'Bind'})assert(aN,table.
concat(aO,'\n'))local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,t,u=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah
.find'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',ah.find'bindData',ah.add(af),af.Parent,af
.Name,af.Callback,af.Default or aq(false),af.IsEnabled or aq(true),af.Bind,af.DisabledText or aq'Component Disabled',af.
LinkKeybind or aq(false)local v,E=(af.FLAG or aq(j.uid))if av(v)~=''then E=ak.register(av(v),{boolean=aq(false),keycode=
aq(nil)},'toggle',av(v)==j.uid)end local F=aq()local function G(H:EnumItem,I:string)local J,K=av(c.binds),av(i.bindData)
if table.find(J,H)then aM(('Key %s is already in use. %s'):format(H.Name,I))else table.insert(J,H)if av(F)then table.
remove(J,table.find(J,av(F)))K[av(F).Name]=nil end F:set(H)K[av(F).Name]={bind=av(F),name=av(l),boolean=E.status.boolean
}i:update('bindData',K)c:update('binds',J)end end ar(E.status.boolean):onChange(function()if av(o)then task.spawn(av(m),
av(E.status.boolean))end end)ar(E.status.keycode):onChange(function()local H,I=pcall(function()return Enum.KeyCode[av(E.
status.keycode)]end)if H then G(I,'RAHHH')end end)local H=aq(av(b.string)==av(j.tab).uid)ar(b.string):onChange(function(
)H:set(av(b.string)==av(j.tab).uid)end)local I,J=aw(function()return av(H)and 0 or 1 end,40,1),aq(false)local K=am.
InputBegan:Connect(function(K,L)if av(g.boolean)then return end if av(J)then if K.KeyCode and K.KeyCode~=Enum.KeyCode.
Unknown then G(K.KeyCode,'From input box')end J:set(false)task.wait()h:update('boolean',false)else if K.KeyCode and K.
KeyCode==av(F)and not L and not av(h.boolean)and av(o)then E.status.boolean:set(not av(E.status.boolean))end end end)ay.
add(K)local L,M=(aq(false))local N=ao'TextButton'{Visible=at(function()if not av(o)then return av(o)end return av(L)end)
,Parent=aA.get(av(f.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,
0.5),TextScaled=true,Text=l,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if
M then M:Disconnect()M=nil else E.status.boolean:set(not av(E.status.boolean))end end,[ap]={aD(4),aE(16),aF(0,16),ao
'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),
BackgroundTransparency=1,Image=av(g.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=k,Visible=at(function()if av(e.string)~=''and not string.find(av(l):lower(),av(
e.string):lower())then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ap]={ao
'Frame'{ZIndex=2,Visible=at(function()if not av(o)then return true end return false end),BackgroundTransparency=aw(
function()return av(H)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={aE(6
),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=I},ao'TextLabel'{FontFace=az(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=I,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()
return av(t)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aH(aI.LayoutOrder,aJ.Horizontal,aK.Left,aL.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=at(function()if not av(o)then return false end return av(H)end),Size=at(function()return
av(u)and UDim2.new(0.775,av(L)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=I,[as'Activated']=function()if not av(o)then return end E.status.boolean:set(not av(E.status.
boolean))end,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aD(8),aH(aI.LayoutOrder,aJ.
Horizontal,aK.Left,aL.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=I,BackgroundColor3=aw(function()return av(E.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(
function()if not av(H)then return 1 end if av(E.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=l,TextTransparency=I,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=L,
Interactable=at(function()if not av(o)then return false end return av(H)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=I,[as'Activated']=function()L:set(false)N.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=I}}},ao
'TextButton'{Visible=u,Interactable=at(function()if not av(o)then return false end return av(H)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=I,[as'Activated']=function()if av(g.boolean)then L:set(
true)M=aB(N,15)return end J:set(true)h:update('boolean',true)end,[ap]={aE(6),aD(6),aH(aI.LayoutOrder,aJ.Horizontal,aK.
Left,aL.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(g.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=I},ao'TextLabel'{Visible=not av(g.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=I,Text=at(function()return av(J)and
'Listening'or av(F)and av(F).Name or'Waiting'end)},ao'TextLabel'{Visible=av(g.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(L)and'Move Bind'or'Place Bind'end),
TextTransparency=I}}}}}}}if av(d.boolean)then ar(E.file):onChange(function()local O,P,Q=av(E.file),true,true if O.
boolean~=nil then E.status.boolean:set(O.boolean)P=false end if O.keycode~=nil then E.status.keycode:set(O.keycode)Q=
false end if P then E.status.boolean:set(av(n))end if Q then if p then E.status.keycode:set(av(p).Name)end end end)if E.
private then E.status.boolean:set(av(n))if p then E.status.keycode:set(av(p).Name)end end else E.status.boolean:set(av(n
))if p then E.status.keycode:set(av(p).Name)end end local O={}function O.SetName(P,Q)local R,S=ax({SetName=Q},{SetName=
''})assert(R,table.concat(S,'\n'))l:set(Q)end function O.SetValue(P,Q:boolean)local R,S=ax({SetValue=Q},{SetValue=true})
assert(R,table.concat(S,'\n'))E.status.boolean:set(Q)end function O.SetBind(P,Q:EnumItem)assert(av(u),
'Requires LinkKeybind')local R,S=ax({SetBind=Q},{SetBind=Enum.keyCode.C})assert(R,table.concat(S,'\n'))G(Q,'At :SetBind'
)end function O.Enable(P)o:set(true)end function O.Disable(P)o:set(false)end return O end end)()end,[80]=function()local
aa,ab,ac=a(80)local ad return(function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,
ak=ac(ae.Bundles),ac(ab.Parent.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=
ak.get'notificationList',Title=af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(
ah)af=ah end)return ag end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(function(...)end)()end,[83]=function
()local aa,ab,ac=a(83)local ad return(function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(ae.
Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao
,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local
aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aF,aH,aI,aJ,aK,aL,aM,aN,aO,b,c,d,e=
aE.get,aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,ac(ab.Parent.Parent.components.warn)[1],aq(),aq(),
aq(),aq(),aq(),aq()aH.add(d,c,b,aO,aN,e)local f,g,h,i,j,k,l,m,n,o,p,t,u,v,E=am.find'absoluteOffset',am.find
'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible',am.find'isMobile',am.
find'isListening',am.find'bindData',aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(t):onChange(function()if
aF(t)then u:set(not aF(u))task.wait(0.3)v:set(not aF(v))task.wait(0.3)E:set(not aF(E))else E:set(not aF(E))task.wait(0.3
)v:set(not aF(v))task.wait(0.3)u:set(not aF(u))end end)at(v):onChange(function()o:set(aF(v)and 212 or 750)end)at(E):
onChange(function()p:set(aF(E)and 74 or 500)end)local F,G,H=aq(false),aq(),aq(false)local function I(J:EnumItem,K:string
)local L,M=aF(j.binds),aF(n.bindData)if table.find(L,J)then aM(('Key %s is already in use. %s'):format(J.Name,K))else
table.insert(L,J)if aF(G)then table.remove(L,table.find(L,aF(G)))M[aF(G).Name]=nil end G:set(J)H:set(true)M[aF(G).Name]=
{bind=aF(G),name='Toggle Interface'}n:update('bindData',M)j:update('binds',L)end end if not aF(l.boolean)then I(af.
HideBind,'init')end local J=aq''at(h.string):onChange(function()local K=aF(h.string)local L=am.find(K)J:set(aF(L.Name):
upper())end)local K,L,M=(aq(af.Icon or''))ao'ScreenGui'{Name=aF(g.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=
false,IgnoreGuiInset=true,[ar]=d,[ap]={ao'Frame'{Name='container',Visible=k.boolean,AnchorPoint=Vector2.new(0.5,0.5),
Position=as(function()return UDim2.new(0.5,0,0.5,aF(f.number))end),Size=aK(function()return UDim2.fromOffset(aF(o),aF(p)
)end,30,1),BackgroundColor3=ak.background,[ar]=aN,[ap]={ax(6),az(16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right,aD.Top,
UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=aK(function()return UDim2.new(0,math.clamp(aF(o)-
32-180-16,212,9e9),aF(u)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao'TextLabel'{Size=
UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=J,TextXAlignment=Enum.TextXAlignment.
Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=aJ('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=ak.text,
TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=
UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,16)),ao
'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(
0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.
Top,UDim.new(0,5)),ao'ImageLabel'{Visible=as(function()if aF(K)~=''then return true end return false end),Size=UDim2.
fromOffset(44,44),BackgroundTransparency=1,Image=K,ImageColor3=ak.text2},ao'Frame'{Size=as(function()if aF(K)~=''then
return UDim2.new(1,-49,1,0)end return UDim2.new(1,0,1,0)end),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.
Vertical,aC.Left,aD.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace
=aJ('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.
Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=ak.text2,FontFace=aJ('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left}}}}},ao'TextButton'{
Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[au'Activated']=function()local N=aF(e)if N then N:
CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao
'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{
Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aJ('Montserrat',Enum.FontWeight.Bold),
PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(N)local O=aF(e)if N~='Text'and O and O.Text then return end
i:update('string',O.Text)end,[ar]=e}}}}},ao'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),BackgroundTransparency=
1,[ar]=b}}}}},ao'Frame'{Size=aK(function()return aF(E)and UDim2.new(0,180,0,44)or UDim2.new(0,180,1,0)end,30,1),
BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder,aB.Vertical,aC.Center,aD.Top,UDim.
new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD
.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()if aF(l.boolean)then H:set(true)M=aI(L,15)return end F:set(true)m:update('boolean',true)end,[ap]={ax(6),az(6),
aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aF(l.boolean)and al.finger or al.command,ImageColor3=ak.text2,ImageTransparency=0},ao
'TextLabel'{Visible=not aF(l.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aJ('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return
aF(F)and'Listening'or aF(G)and aF(G).Name or'Waiting'end)},ao'TextLabel'{Visible=aF(l.boolean),Size=UDim2.new(1,-25,0,16
),BackgroundTransparency=1,FontFace=aJ('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(H)and'Move Bind'or'Place Bind'end)}}},ao
'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()t:set(not aF(t))end,
[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,
30),BackgroundTransparency=1,Image=as(function()return aF(t)and al.minimize or al.maximize end),ImageColor3=ak.text2,
ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()if not aF(H)then ac(ae.components.notification){Parent=c,Title='Darius Interface',Body=`You must {aF(l.boolean
)and'place your bind'or'bind to a key'} before hiding the UI!`,Duration=5,Image=al.alert,ImageColor=ak.get'red'}return
end k:update('boolean',not aF(k.boolean))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,
ImageTransparency=0}}}}},ao'ScrollingFrame'{Name='tabButtonList',Size=aK(function()return aF(E)and UDim2.new(1,0,0,0)or
UDim2.new(1,0,1,-90)end,30,1),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=true,[ar]=aO,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.
Top,UDim.new(0,6)),az(0,10)}},ao'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()ag:Fire()ag:Destroy()aL:deleteConnections()aH:clear()end,[ap]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.
Left,aD.Center,UDim.new(0,4)),ao'ImageLabel'{BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,
Image=al.close,ImageTransparency=0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=aJ('Montserrat',Enum.FontWeight.
Bold),TextColor3=ak.red,TextScaled=true,Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=0.3,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{
Name='notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=
Vector2.new(1,0.5),ClipsDescendants=false,[ar]=c,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}L=ao
'TextButton'{Visible=as(function()return(aF(H)and aF(l.boolean))end),Interactable=as(function()return(aF(H)and aF(l.
boolean))end),Parent=aH.get(aF(g.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text='Toggle UI',FontFace=aJ('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.
mobileButtonText,BackgroundColor3=ak.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au
'Activated']=function()if M then M:Disconnect()M=nil else k:update('boolean',not aF(k.boolean))end end,[ap]={az(4),ax(16
),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=aF(l.boolean)and al.finger or al.command,ImageColor3=ak.
mobileButtonImage,ImageTransparency=0.8}}}local N=aj.InputBegan:Connect(function(N,O)if aF(l.boolean)then return end if
aF(F)then if N.KeyCode and N.KeyCode~=Enum.KeyCode.Unknown then I(N.KeyCode,'From input box')end F:set(false)task.wait()
m:update('boolean',false)else if N.KeyCode and N.KeyCode==aF(G)and not O and not aF(m.boolean)then k:update('boolean',
not aF(k.boolean))end end end)aL.add(N)aI(aH.get'container',15)end end)()end,[84]=function()local aa,ab,ac=a(84)local ad
return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else
error('no utility: '..af)end end})end)()end,[85]=function()local aa,ab,ac=a(85)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.
AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,
AspectType=ag,DominantAxis=ah}end end)()end,[86]=function()local aa,ab,ac=a(86)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}
end end)()end,[87]=function()local aa,ab,ac=a(87)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)return function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,
FillDirection=ag or Enum.FillDirection.Vertical,HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,
VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()end,[88]=function()local aa,
ab,ac=a(88)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(...)local af={...}if
#af==1 then return ae.New'UIPadding'{PaddingLeft=UDim.new(0,...),PaddingRight=UDim.new(0,...),PaddingTop=UDim.new(0,...)
,PaddingBottom=UDim.new(0,...)}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim
.new(0,af[2]),PaddingBottom=UDim.new(0,af[1]),PaddingLeft=UDim.new(0,af[2])}elseif#af==3 then return ae.New'UIPadding'{
PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[2]
)}else return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[
3]),PaddingLeft=UDim.new(0,af[4])}end end end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(...)
local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number?,ag:number?)return ae.New'UITextSizeConstraint'{
MinTextSize=af,MaxTextSize=ag}end end)()end,[90]=function()local aa,ab,ac=a(90)local ad return(function(...)return
setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end
end})end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[92]=function()
local aa,ab,ac=a(92)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.
add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do if typeof(ai)=='function'then ai()else
ai:Disconnect()end ae[ah]=nil end end return af end)()end,[93]=function()local aa,ab,ac=a(93)local ad return(function(
...)local ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.
FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal
if ae[af]then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[94]=function()local aa,ab,ac=a(94
)local ad return(function(...)local ae,af={},{}function ae.cloneref(ag)if cloneref then return cloneref(ag)else return
ag end end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil function ae.isfile(ag:string)if
isfile then return isfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil
then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end
function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak
in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then
return false end return true end end function ae.writefile(ag:string,ah:string)if writefile then return writefile(ag,ah)
else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=ai[ak]elseif(typeof(ai[ak])=='string'or
typeof(ai[ak])=='nil')then ai[ak]=ah end end end end function ae.delfile(ag:string)if delfile then return delfile(ag)
else local ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[al]=nil else ai=ah
end end end end function ae.readfile(ag:string)if readfile then return readfile(ag)else local ah,ai=af,false if ag:find
'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai then warn
'readfile: no file'return nil end return ah end end function ae.makefolder(ag:string)if makefolder then return
makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else ah=ah[
aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if listfiles then return listfiles(ag)else local ah
,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]
end if ai or typeof(ah)=='string'then warn'no folder exists'return nil end local aj={}for ak,al in ah do if typeof(al)==
'string'then table.insert(aj,ak)end end return aj end end return ae end)()end,[95]=function()local aa,ab,ac=a(95)local
ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,
al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(aq,ar,as)return aq+(ar-aq)*as end local aq=Instance.
new'BindableEvent'local function ar(as)if not(ao)then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,
ap(ak.Position.X.Offset,an.X.Offset,as*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,an.Y.Offset,as*ah))return end local at=(am
-ai:GetMouseLocation())local au,av=(ao.X.Offset-at.X),(ao.Y.Offset-at.Y)an=UDim2.new(ao.X.Scale,au,ao.Y.Scale,av)ak.
Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,au,as*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,av,as*ah))end ak.
InputBegan:Connect(function(as)if as.UserInputType==Enum.UserInputType.MouseButton1 or as.UserInputType==Enum.
UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()as.Changed:Connect(function()if as.
UserInputState==Enum.UserInputState.End then aq:Fire()al=false end end)end end)local as=aj.Heartbeat:Connect(ar)return
as,aq.Event end end)()end,[96]=function()local aa,ab,ac=a(96)local ad return(function(...)return function(ae,af)if
typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[97]=function()local aa,ab,ac=
a(97)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new'GetTextBoundsParams'ag.
Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.services).TextService
return ah:GetTextBoundsAsync(ag)end end)()end,[98]=function()local aa,ab,ac=a(98)local ad return(function(...)local ae=
string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then
return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[99]=function()local aa,ab,ac=a(99)local
ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af
.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if typeof(ah(aj))=='Instance'
then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end)else if
not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end end function af
.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if ae[ai]then ae[ai]=nil else warn(ai,
"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=nil if typeof(aj)=='Instance'then aj
:Destroy()end end end return af end)()end,[100]=function()local aa,ab,ac=a(100)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end,[101]
=function()local aa,ab,ac=a(101)local ad return(function(...)return function(ae:table,af:table,ag:table?):any ag=ag or{}
local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))and not table.find(ag,aj)then ah=
false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah,ai end end)()end},{{1,2,{
'Darius'},{{84,2,{'simpleElements'},{{89,2,{'UITextSizeConstraint'}},{88,2,{'UIPadding'}},{86,2,{'UICorner'}},{87,2,{
'UIListLayout'}},{85,2,{'UIAspectRatioConstraint'}}}},{2,2,{'Bundles'},{{61,2,{'services'}},{3,2,{'Fusion'},{{40,1,{
'State'},{{45,2,{'Observer'}},{43,2,{'ForPairs'}},{41,2,{'Computed'}},{42,2,{'ForKeys'}},{46,2,{'Value'}},{47,2,{
'unwrap'}},{44,2,{'ForValues'}}}},{16,1,{'Dependencies'},{{20,2,{'updateAll'}},{17,2,{'captureDependencies'}},{21,2,{
'useDependency'}},{19,2,{'sharedState'}},{18,2,{'initDependency'}}}},{48,2,{'Types'}},{33,1,{'Logging'},{{34,2,{
'logError'}},{36,2,{'logWarn'}},{38,2,{'parseError'}},{37,2,{'messages'}},{35,2,{'logErrorNonFatal'}}}},{22,1,{
'Instances'},{{23,2,{'Children'}},{27,2,{'OnChange'}},{31,2,{'applyInstanceProps'}},{26,2,{'New'}},{30,2,{'Ref'}},{29,2,
{'Out'}},{32,2,{'defaultProps'}},{28,2,{'OnEvent'}},{25,2,{'Hydrate'}},{24,2,{'Cleanup'}}}},{4,1,{'Animation'},{{8,2,{
'TweenScheduler'}},{12,2,{'springCoefficients'}},{6,2,{'SpringScheduler'}},{7,2,{'Tween'}},{9,2,{'getTweenRatio'}},{10,2
,{'lerpType'}},{5,2,{'Spring'}},{13,2,{'unpackType'}},{11,2,{'packType'}}}},{49,1,{'Utility'},{{55,2,{'restrictRead'}},{
52,2,{'doNothing'}},{50,2,{'None'}},{56,2,{'xtypeof'}},{54,2,{'needsDestruction'}},{51,2,{'cleanup'}},{53,2,{'isSimilar'
}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{39,2,{'PubTypes'}}}},{58,2,{'flags'}},{60,2,{'lucide'}},{62,2,{'themeSystem'}
,{{63,2,{'default'}}}},{59,2,{'icons'}},{57,2,{'data'}}}},{90,2,{'utilities'},{{100,2,{'tween'}},{92,2,{'connections'}},
{95,2,{'drag'}},{91,2,{'animate'}},{96,2,{'get'}},{94,2,{'customFunctions'}},{93,2,{'customFont'}},{97,2,{
'getStringBounds'}},{101,2,{'typecheck'}},{99,2,{'references'}},{98,2,{'randomString'}}}},{81,2,{'darius.story'}},{82,1,
{'layouts'},{{83,2,{'main'}}}},{64,1,{'components'},{{77,2,{'tabFrame'}},{68,2,{'dropdown'}},{78,2,{'textbox'}},{70,2,{
'keybindList'}},{73,2,{'notification'}},{72,2,{'module'}},{69,2,{'keybind'}},{79,2,{'toggle'}},{76,2,{'tabButton'}},{75,
2,{'slider'}},{65,2,{'button'}},{71,2,{'label'}},{74,2,{'paragraph'}},{80,2,{'warn'}},{66,2,{'colorpicker'}},{67,2,{
'divider'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,
pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,
al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB and aC then af=
aC end end local aB=af and af.defer local aC,aD,aE,aF,aH,aI,aJ,aK,aL=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',
[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local aM,aN={GetFullName={{},
function(aM)local aN,aO=aM.Name,aM.Parent while aO do aN=aO.Name..'.'..aN aO=aO.Parent end return aN end},GetChildren={{
},function(aM)local aN={}for aO in ai,aL[aM]do au(aN,aO)end return aN end},GetDescendants={{},function(aM)local aN={}for
aO in ai,aL[aM]do au(aN,aO)for b,c in ai,aO:GetDescendants()do au(aN,c)end end return aN end},FindFirstChild={{'string',
'boolean?'},function(aM,aN,aO)local b=aL[aM]for c in ai,b do if c.Name==aN then return c end end if aO then for d in ai,
b do return d:FindFirstChild(aN,true)end end end},FindFirstAncestor={{'string'},function(aM,aN)local aO=aM.Parent while
aO do if aO.Name==aN then return aO end aO=aO.Parent end end},WaitForChild={{'string','number?'},function(aM,aN)return
aM:FindFirstChild(aN)end}},{}for aO,b in ai,aM do local c,d,e=b[1],b[2],{}for f,g in ai,c do local h,i=az(g,
'^([^%?]+)(%??)')e[f]={h,i}end aN[aO]=function(h,...)if not aL[h]then ah("Expected ':' not '.' calling member function "
..aO,2)end local i={...}for j,k in ai,e do local l=i[j]local m,n,o=an(l),k[1],k[2]if l==nil and not o then ah(
'Argument '..l..' missing or nil',3)end if n~='any'and m~=n and not(m=='nil'and o)then ah('Argument '..j..
' expects type "'..n..'", got "'..m..'"',2)end end return d(h,...)end end local function c(d,e,f)local g,h=(ag({},{
__mode='k'}))local function i(j)ah(j..' is not a valid (virtual) member of '..d..' "'..e..'"',3)end local function j(k)
ah('Unable to assign (virtual) property '..k..'. Property is read only',3)end local k,l={},{}l.__metatable=false l.
__index=function(m,n)if n=='ClassName'then return d elseif n=='Name'then return e elseif n=='Parent'then return f elseif
d=='StringValue'and n=='Value'then return h else local o=aN[n]if o then return o end end for o in ai,g do if o.Name==n
then return o end end i(n)end l.__newindex=function(m,n,o)if n=='ClassName'then j(n)elseif n=='Name'then e=o elseif n==
'Parent'then if o==k then return end if f~=nil then aL[f][k]=nil end f=o if o~=nil then aL[o][k]=true end elseif d==
'StringValue'and n=='Value'then h=o else i(n)end end l.__tostring=function()return e end ag(k,l)aL[k]=g if f~=nil then
aL[f][k]=true end return k end local function d(e,f)local g,h,i,j=e[1],e[2],e[3],e[4]local k=aD[h]local l=i and av(i,1)
or k local m=c(k,l,f)aE[g]=m if i then for n,o in ai,i do m[n]=o end end if j then for n,o in ai,j do d(o,m)end end
return m end local e=c('Folder','['..ad..']')for f,g in ai,ab do d(g,e)end for h,i in ai,aa do local j=aE[h]aF[j]=i aH[j
]=h local k=j.ClassName if k=='LocalScript'or k=='Script'then au(aJ,j)end end local function j(k)local l,m=k.ClassName,
aI[k]if m and l=='ModuleScript'then return ak(m)end local n=aF[k]local function o(p)p=aq(p)local t,u,v=k:GetFullName(),
az(p,'[^:]+:(%d+): (.+)')if not u or not at then return t..':*: '..(v or p)end u=ar(u)local E=aH[k]local F=at[E]local G=
u-F+1 if G<0 then G='?'end return t..':'..G..': '..v end if l=='LocalScript'or l=='Script'then local p,t=ap(n)if not p
then ah(o(t),0)end else local p={ap(n)}local t=av(p,1)if not t then local u=av(p,1)ah(o(u),0)end aI[k]=p return ak(p)end
end function a(k)local l=aE[k]local function m(n,...)local o={ap(n,...)}local p=av(o,1)if not p then ah(o[1],3)end
return ak(o)end local n=aw(ag({},{__index=aK,__newindex=function(n,o,p)aK[o]=p end,__len=function()return#aK end,__iter=
function()return ai,aK end}))local o,p=aw{version=ac,envname=ad,shared=n,script=am,require=ao},l local function t(u,...)
local v,E,F=an(u),'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if v=='table'
and aL[u]then if u.ClassName~='ModuleScript'then ah(E,2)elseif u==l then ah(F,2)end return j(u)elseif v=='string'and ay(
u,1,1)~='@'then if#u==0 then ah('Attempted to call require with empty string',2)end local G=l if ay(u,1,1)=='/'then G=e
elseif ay(u,1,2)=='./'then u=ay(u,3)end local H for I in aA(u,'([^/]*)/?')do local J=I if I=='..'then J='Parent'end if J
~=''then local K=G:FindFirstChild(J)if not K then local L=G.Parent if L then K=L:FindFirstChild(J)end end if K then G=K
elseif I~=H and I~='init'and I~='init.server'and I~='init.client'then ah('Virtual script path "'..u..'" not found',2)end
end H=I end if G.ClassName~='ModuleScript'then ah(E,2)elseif G==l then ah(F,2)end return j(G)end return m(ao,u,...)end
return o,p,t end for k,l in ai,aJ do aC(j,l)end return j(e:GetChildren()[1])