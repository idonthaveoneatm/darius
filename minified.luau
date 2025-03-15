local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i,j=f.data,f.icons,f.themeSystem,f.services local k,l=j.HttpService,f.Fusion
local m,n=l.Observer,d(c.utilities)local o,p,q,r,s,t,u,v,w=n.references,n.connections,n.customFunctions,n.randomString,n
.get,n.typecheck,d(c.layouts.main),d(c.Bundles.flags),d(c.components.warn)[2]local function x(y,z,A)A.Parent=z return d(
c.components[y])(A)end local y={}function y.Window(z,A)if q.getgenv then if q.getgenv().dariusInstance then p:
deleteConnections()o:clear()q.getgenv().dariusInstance=nil end else if _G.dariusInstance then p:deleteConnections()o:
clear()_G.dariusInstance=nil end end local B,C=t(A,{Title='',Description='',Icon='',HideBind=Enum.KeyCode.T,UseConfig=
false,IsMobile=false,Offset=0,Theme={},noOffset=false,Parent=Instance.new'Part'},{A.Icon and''or'Icon',A.noOffset and''
or'noOffset',A.IsMobile and''or'IsMobile',A.UseConfig and''or'UseConfig',A.Theme and''or'Theme',A.Parent and''or'Parent'
,A.Offset and''or'Offset'})assert(B,table.concat(C,'\n'))B,C=t(A,{Config=''},{A.UseConfig and''or'Config'})assert(B,
table.concat(C,'\n'))w(A.Title)i.init()local D=i.getTheme().uid if A.Theme then B,C=t(A.Theme,{Name='',Colors={}})
assert(B,table.concat(C,'\n'))i.set(i.create(A.Theme.Name,A.Theme.Colors))end g.add({string=''},'selectedTab')g.add({
boolean=false},'isFirst')g.add({number=A.noOffset and 0 or 58},'absoluteOffset')g.add({name=r(32)},'instanceName')g.add(
{binds={}},'currentBinds')g.add({bindData={}},'bindData')g.add({string=''},'searchText')local E=g.add({list={}},
'toggles',true)g.add({module=function()end},'currentPicker')g.add({module=function()end},'currentPicker')g.add({boolean=
true},'isVisible')g.add({boolean=A.IsMobile},'isMobile')g.add({boolean=false},'isListening')local F,G,H,I,J,K=g.add({
func=function()end},'destroyFunc'),g.find'flags',g.add({boolean=false},'configLoaded'),g.add({boolean=false},'useConfig'
),(g.add{data=A})if A.UseConfig then I:update('boolean',A.UseConfig)K=A.Config local L,M={'darius',`/{K}`},''for N=1,#L
do M=M..L[N]if not q.isfolder(M)then q.makefolder(M)end end y.Folder=M K=M..'/config.json'y.File=K if not q.isfile(K)
then q.writefile(K,'{}')end end y.flags={}setmetatable(y.flags,{__index=function(L,M)local N=s(G.list)if N[M]then return
N[M].user else return v.preregister(M).user end return nil end})local L=l.New'BindableEvent'{}y.OnDestruction=L.Event u(
A,L)local M,N=o.get'tabButtonList',o.get'tabFrameList'F:update('func',function()y.Destroyed=true L:Fire()for O,P in E.
list do P:set(false)end task.wait(0.1)p:deleteConnections()o:clear()L:Destroy()end)y[J.uid]={}local O=y[J.uid]function O
.Tab(P,Q)local R=x('tabButton',M,Q)local S=x('tabFrame',N,{uid=R.uid})O[R.uid]={}local T=O[R.uid]function T.Button(U,V)V
.tab=R return x('button',S,V)end function T.Toggle(U,V)V.tab=R return x('toggle',S,V)end function T.Dropdown(U,V)V.tab=R
return x('dropdown',S,V)end function T.Label(U,V)return x('label',S,{tab=R,Text=V})end function T.Paragraph(U,V)V.tab=R
return x('paragraph',S,V)end function T.TextBox(U,V)V.tab=R return x('textbox',S,V)end function T.Slider(U,V)V.tab=R
return x('slider',S,V)end function T.Keybind(U,V)V.tab=R return x('keybind',S,V)end function T.Divider(U)return x(
'divider',S,{tab=R})end function T.ColorPicker(U,V)V.tab=R return x('colorpicker',S,V)end return O[R.uid]end y.Destroyed
=false function y.Notify(P,Q)return x('notification',o.get'notificationList',Q)end function y.Destroy(P)y.Destroyed=true
L:Fire()for Q,R in E.list do R:set(false)end task.wait(0.1)p:deleteConnections()o:clear()L:Destroy()end function y.
LoadConfig(P)if not A.UseConfig then return end v.load(k:JSONDecode(q.readfile(K)))v.config:set(K)H:update('boolean',
true)end function y.SetTheme(P,Q)local R,S=t({['New Theme']=Q},{['New Theme']={}})assert(R,table.concat(S,'\n'))end
function y.ExportTheme(P)local Q,R=i.getTheme(),{}R.name=Q.name R.uid=Q.uid R.palette={}for S,T in Q.palette do R.
palette[S]=T:ToHex()end return k:JSONEncode(R)end function y.CreateSettings(P)local Q,R,S,T,U=O:Tab{Name=
'\u{2699}\u{fe0f} Settings'},i.getTheme().palette,{},{},{}table.foreach(R,function(V)table.insert(T,V)end)table.foreach(
i.getThemes(),function(V,W)table.insert(U,{DisplayValue=W.name,Value=W.uid})end)local V,W,X,Y,Z,_='',''local aa=Q:
Dropdown{Name='Current Theme',Items=U,Default=i.getTheme().uid,Callback=function(aa)if D==aa and Z then Z:Invisible()
elseif D~=aa and Z then Z:Visible()end i.set(aa)R=i.getTheme().palette table.clear(S)table.foreach(R,function(ab,ac)S[ab
]=ac end)if X and V~=''then X:SetColor(i.get(V))end end}Z=Q:Toggle{Name='Do you want to delete this theme?',Visible=
false,Callback=function(ab)if ab then _:Visible()else _:Invisible()end end}_=Q:Button{Name='Delete Theme',Visible=false,
DisabledText='Check the box above first!',Callback=function()i.delete(i.getTheme().uid)Z:SetValue(false)table.clear(U)
table.foreach(i.getThemes(),function(ab,ac)table.insert(U,{DisplayValue=ac.name,Value=ac.uid})end)aa:SetItems(U)aa:
SelectItem(D)end}Q:Label'Edit Theme:'Q:Dropdown{Name='Theme Colors',Items=T,Alphabetical=true,Callback=function(ab)V=ab
X:Enable()X:SetName(`Editing Color: {V}`)X:SetColor(i.get(V))end}X=Q:ColorPicker{Name='Editing Color: ',IsEnabled=false,
DisabledText='Select Color First!',HideTransparency=true,Callback=function(ab)local ac=i.getTheme().palette if ac[V].R~=
ab.R or ac[V].G~=ab.G or ac[V].B~=ab.B then Y:Visible()end i.edit(V,ab)end}Y=Q:Button{Name='Reset Color',Visible=false,
Callback=function()X:SetColor(S[V])Y:Invisible()end}Q:TextBox{Name='Name Your Theme',Callback=function(ab)W=ab end}Q:
Button{Name='Save and Set New Theme',Callback=function()if W==''then y:Notify{Title=A.Title,Body=
'Theme name cannot be empty!',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end local ab=i.create(W,i.getColors(
))local ac={i.set(ab)}if ac[1]then table.clear(U)table.foreach(i.getThemes(),function(ad,ae)table.insert(U,{DisplayValue
=ae.name,Value=ae.uid})end)aa:SetItems(U)aa:SelectItem(ab)end i.export()q.printFileSystem()end}Q:Divider()end if q.
getgenv then q.getgenv().dariusInstance=y else _G.dariusInstance=y end return y[J.uid]end return y end)()end,function()
local aa,ab,ac=a(2)local ad return(function(...)return setmetatable({},{__index=function(ae,b)if ab:FindFirstChild(b)
then return ac(ab[b])else error('no bundle: '..b)end end})end)()end,function()local aa,ab,ac=a(3)local ad return(
function(...)local ae,b=ac(ab.PubTypes),ac(ab.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>
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
,doNothing:(...any)->()}return b('Fusion',{version={major=0,minor=2,isRelease=true},New=ac(ab.Instances.New),Hydrate=ac(
ab.Instances.Hydrate),Ref=ac(ab.Instances.Ref),Out=ac(ab.Instances.Out),Cleanup=ac(ab.Instances.Cleanup),Children=ac(ab.
Instances.Children),OnEvent=ac(ab.Instances.OnEvent),OnChange=ac(ab.Instances.OnChange),Value=ac(ab.State.Value),
Computed=ac(ab.State.Computed),ForPairs=ac(ab.State.ForPairs),ForKeys=ac(ab.State.ForKeys),ForValues=ac(ab.State.
ForValues),Observer=ac(ab.State.Observer),Tween=ac(ab.Animation.Tween),Spring=ac(ab.Animation.Spring),cleanup=ac(ab.
Utility.cleanup),doNothing=ac(ab.Utility.doNothing)})::Fusion end)()end,[5]=function()local aa,ab,ac=a(5)local ad return
(function(...)local ae=ab.Parent.Parent local b,c,d,e,f,g,h,i,j,k,l,m=ac(ae.PubTypes),ac(ae.Types),ac(ae.Logging.
logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Animation.unpackType),ac(ae.Animation.SpringScheduler),ac(ae.
Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(ae.Utility.xtypeof),ac(
ae.State.unwrap),{}local n,o={__index=m},{__mode='k'}function m.get(p,q:boolean?):any if q~=false then h(p)end return p.
_currentValue end function m.setPosition(p,q:PubTypes.Animatable)local r=typeof(q)if r~=p._currentType then d(
'springTypeMismatch',nil,r,p._currentType)end p._springPositions=f(q,r)p._currentValue=q g.add(p)j(p)end function m.
setVelocity(p,q:PubTypes.Animatable)local r=typeof(q)if r~=p._currentType then d('springTypeMismatch',nil,r,p.
_currentType)end p._springVelocities=f(q,r)g.add(p)end function m.addVelocity(p,q:PubTypes.Animatable)local r=typeof(q)
if r~=p._currentType then d('springTypeMismatch',nil,r,p._currentType)end local s=f(q,r)for t,u in ipairs(s)do p.
_springVelocities[t]+=u end g.add(p)end function m.update(p):boolean local q=p._goalState:get(false)if q==p._goalValue
then local r=l(p._damping)if typeof(r)~='number'then e('mistypedSpringDamping',nil,typeof(r))elseif r<0 then e(
'invalidSpringDamping',nil,r)else p._currentDamping=r end local s=l(p._speed)if typeof(s)~='number'then e(
'mistypedSpringSpeed',nil,typeof(s))elseif s<0 then e('invalidSpringSpeed',nil,s)else p._currentSpeed=s end return false
else p._goalValue=q local r,s=p._currentType,typeof(q)p._currentType=s local t=f(q,s)local u=#t p._springGoals=t if s~=r
then p._currentValue=p._goalValue local v,w=table.create(u,0),table.create(u,0)for x,y in ipairs(t)do v[x]=y end p.
_springPositions=v p._springVelocities=w g.remove(p)return true elseif u==0 then p._currentValue=p._goalValue return
true else g.add(p)return false end end end local function p<T>(q:PubTypes.Value<T>,r:PubTypes.CanBeState<number>?,s:
PubTypes.CanBeState<number>?):Types.Spring<T>if r==nil then r=10 end if s==nil then s=1 end local t={[q]=true}if k(r)==
'State'then t[r]=true end if k(s)=='State'then t[s]=true end local u=setmetatable({type='State',kind='Spring',
dependencySet=t,dependentSet=setmetatable({},o),_speed=r,_damping=s,_goalState=q,_goalValue=nil,_currentType=nil,
_currentValue=nil,_currentSpeed=l(r),_currentDamping=l(s),_springPositions=nil,_springGoals=nil,_springVelocities=nil},n
)i(u)q.dependentSet[u]=true u:update()return u end return p end)()end,[6]=function()local aa,ab,ac=a(6)local ad return(
function(...)local ae,b=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.
Parent local c,d,e,f=ac(b.Types),ac(b.Animation.packType),ac(b.Animation.springCoefficients),ac(b.Dependencies.updateAll
)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local g,h,i:Set<Spring>,j={},0.0001,{},os.clock()function g.add(k:
Spring)k._lastSchedule=j k._startDisplacements={}k._startVelocities={}for l,m in ipairs(k._springGoals)do k.
_startDisplacements[l]=k._springPositions[l]-m k._startVelocities[l]=k._springVelocities[l]end i[k]=true end function g.
remove(k:Spring)i[k]=nil end local function k()local l:Set<Spring> ={}j=os.clock()for m in pairs(i)do local n,o,p,q=e(j-
m._lastSchedule,m._currentDamping,m._currentSpeed)local r,s,t,u,v=m._springPositions,m._springVelocities,m.
_startDisplacements,m._startVelocities,false for w,x in ipairs(m._springGoals)do local y,z=t[w],u[w]local A,B=y*n+z*o,y*
p+z*q if math.abs(A)>h or math.abs(B)>h then v=true end r[w]=A+x s[w]=B end if not v then l[m]=true end end for n in
pairs(i)do n._currentValue=d(n._springPositions,n._currentType)f(n)end for o in pairs(l)do i[o]=nil end end ae:
BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.Value,k)return g end)()end,[7]=function()local aa,
ab,ac=a(7)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d,e,f,g,h,i,j=ac(ae.PubTypes),ac(ae.Types),
ac(ae.Animation.TweenScheduler),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Logging.
logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Utility.xtypeof),{}local k,l={__index=j},{__mode='k'}function j.get(o,p:
boolean?):any if p~=false then e(o)end return o._currentValue end function j.update(o):boolean local p=o._goalState:get(
false)if p==o._nextValue and not o._currentlyAnimating then return false end local q=o._tweenInfo if o._tweenInfoIsState
then q=q:get()end if typeof(q)~='TweenInfo'then h('mistypedTweenInfo',nil,typeof(q))return false end o._prevValue=o.
_currentValue o._nextValue=p o._currentTweenStartTime=os.clock()o._currentTweenInfo=q local r=q.DelayTime+q.Time if q.
Reverses then r+=q.Time end r*=q.RepeatCount+1 o._currentTweenDuration=r d.add(o)return false end local function o<T>(p:
PubTypes.StateObject<PubTypes.Animatable>,q:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local r=p:get(false)if q==nil
then q=TweenInfo.new()end local s,t={[p]=true},i(q)=='State'if t then s[q]=true end local u=q if t then u=u:get()end if
typeof(u)~='TweenInfo'then g('mistypedTweenInfo',nil,typeof(u))end local v=setmetatable({type='State',kind='Tween',
dependencySet=s,dependentSet=setmetatable({},l),_goalState=p,_tweenInfo=q,_tweenInfoIsState=t,_prevValue=r,_nextValue=r,
_currentValue=r,_currentTweenInfo=q,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},k)f(v)p.
dependentSet[v]=true return v end return o end)()end,[8]=function()local aa,ab,ac=a(8)local ad return(function(...)local
ae,b=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.Parent local c,d,e,f,g=
ac(b.Types),ac(b.Animation.lerpType),ac(b.Animation.getTweenRatio),ac(b.Dependencies.updateAll),{}type Set<T> ={[T]:any}
type Tween=Types.Tween<any>local h,i:Set<Tween> ={__mode='k'},{}setmetatable(i,h)function g.add(j:Tween)i[j]=true end
function g.remove(j:Tween)i[j]=nil end local function j()local k=os.clock()for l:Tween in pairs(i::any)do local o=k-l.
_currentTweenStartTime if o>l._currentTweenDuration then if l._currentTweenInfo.Reverses then l._currentValue=l.
_prevValue else l._currentValue=l._nextValue end l._currentlyAnimating=false f(l)g.remove(l)else local p=e(l.
_currentTweenInfo,o)local q=d(l._prevValue,l._nextValue,p)l._currentValue=q l._currentlyAnimating=true f(l)end end end
ae:BindToRenderStep('__FusionTweenScheduler',Enum.RenderPriority.First.Value,j)return g end)()end,[9]=function()local aa
,ab,ac=a(9)local ad return(function(...)local ae=cloneref and cloneref(game:GetService'TweenService')or game:GetService
'TweenService'local function b(c:TweenInfo,d:number):number local e,f,g,h,i,j=c.DelayTime,c.Time,c.Reverses,1+c.
RepeatCount,c.EasingStyle,c.EasingDirection local k=e+f if g then k+=f end if d>=k*h then return 1 end local l=d%k if l
<=e then return 0 end local o=(l-e)/f if o>1 then o=2-o end local p=ae:GetValue(o,i,j)return p end return b end)()end,[
10]=function()local aa,ab,ac=a(10)local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae
.Colour.Oklab)local function d(e:any,f:any,g:number):any local h=typeof(e)if typeof(f)==h then if h=='number'then local
i,j=f::number,e::number return(i-j)*g+j elseif h=='CFrame'then local i,j=f::CFrame,e::CFrame return j:Lerp(i,g)elseif h
=='Color3'then local i,j=f::Color3,e::Color3 local k,l=c.to(j),c.to(i)return c.from(k:Lerp(l,g),false)elseif h==
'ColorSequenceKeypoint'then local i,j=f::ColorSequenceKeypoint,e::ColorSequenceKeypoint local k,l=c.to(j.Value),c.to(i.
Value)return ColorSequenceKeypoint.new((i.Time-j.Time)*g+j.Time,c.from(k:Lerp(l,g),false))elseif h=='DateTime'then local
i,j=f::DateTime,e::DateTime return DateTime.fromUnixTimestampMillis((i.UnixTimestampMillis-j.UnixTimestampMillis)*g+j.
UnixTimestampMillis)elseif h=='NumberRange'then local i,j=f::NumberRange,e::NumberRange return NumberRange.new((i.Min-j.
Min)*g+j.Min,(i.Max-j.Max)*g+j.Max)elseif h=='NumberSequenceKeypoint'then local i,j=f::NumberSequenceKeypoint,e::
NumberSequenceKeypoint return NumberSequenceKeypoint.new((i.Time-j.Time)*g+j.Time,(i.Value-j.Value)*g+j.Value,(i.
Envelope-j.Envelope)*g+j.Envelope)elseif h=='PhysicalProperties'then local i,j=f::PhysicalProperties,e::
PhysicalProperties return PhysicalProperties.new((i.Density-j.Density)*g+j.Density,(i.Friction-j.Friction)*g+j.Friction,
(i.Elasticity-j.Elasticity)*g+j.Elasticity,(i.FrictionWeight-j.FrictionWeight)*g+j.FrictionWeight,(i.ElasticityWeight-j.
ElasticityWeight)*g+j.ElasticityWeight)elseif h=='Ray'then local i,j=f::Ray,e::Ray return Ray.new(j.Origin:Lerp(i.Origin
,g),j.Direction:Lerp(i.Direction,g))elseif h=='Rect'then local i,j=f::Rect,e::Rect return Rect.new(j.Min:Lerp(i.Min,g),j
.Max:Lerp(i.Max,g))elseif h=='Region3'then local i,j=f::Region3,e::Region3 local k,l=j.CFrame.Position:Lerp(i.CFrame.
Position,g),j.Size:Lerp(i.Size,g)/2 return Region3.new(k-l,k+l)elseif h=='Region3int16'then local i,j=f::Region3int16,e
::Region3int16 return Region3int16.new(Vector3int16.new((i.Min.X-j.Min.X)*g+j.Min.X,(i.Min.Y-j.Min.Y)*g+j.Min.Y,(i.Min.Z
-j.Min.Z)*g+j.Min.Z),Vector3int16.new((i.Max.X-j.Max.X)*g+j.Max.X,(i.Max.Y-j.Max.Y)*g+j.Max.Y,(i.Max.Z-j.Max.Z)*g+j.Max.
Z))elseif h=='UDim'then local i,j=f::UDim,e::UDim return UDim.new((i.Scale-j.Scale)*g+j.Scale,(i.Offset-j.Offset)*g+j.
Offset)elseif h=='UDim2'then local i,j=f::UDim2,e::UDim2 return j:Lerp(i,g)elseif h=='Vector2'then local i,j=f::Vector2,
e::Vector2 return j:Lerp(i,g)elseif h=='Vector2int16'then local i,j=f::Vector2int16,e::Vector2int16 return Vector2int16.
new((i.X-j.X)*g+j.X,(i.Y-j.Y)*g+j.Y)elseif h=='Vector3'then local i,j=f::Vector3,e::Vector3 return j:Lerp(i,g)elseif h==
'Vector3int16'then local i,j=f::Vector3int16,e::Vector3int16 return Vector3int16.new((i.X-j.X)*g+j.X,(i.Y-j.Y)*g+j.Y,(i.
Z-j.Z)*g+j.Z)end end if g<0.5 then return e else return f end end return d end)()end,[11]=function()local aa,ab,ac=a(11)
local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function d(e:{
number},f:string):PubTypes.Animatable?if f=='number'then return e[1]elseif f=='CFrame'then return CFrame.new(e[1],e[2],e
[3])*CFrame.fromAxisAngle(Vector3.new(e[4],e[5],e[6]).Unit,e[7])elseif f=='Color3'then return c.from(Vector3.new(e[1],e[
2],e[3]),false)elseif f=='ColorSequenceKeypoint'then return ColorSequenceKeypoint.new(e[4],c.from(Vector3.new(e[1],e[2],
e[3]),false))elseif f=='DateTime'then return DateTime.fromUnixTimestampMillis(e[1])elseif f=='NumberRange'then return
NumberRange.new(e[1],e[2])elseif f=='NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(e[2],e[1],e[3])elseif
f=='PhysicalProperties'then return PhysicalProperties.new(e[1],e[2],e[3],e[4],e[5])elseif f=='Ray'then return Ray.new(
Vector3.new(e[1],e[2],e[3]),Vector3.new(e[4],e[5],e[6]))elseif f=='Rect'then return Rect.new(e[1],e[2],e[3],e[4])elseif
f=='Region3'then local g,h=Vector3.new(e[1],e[2],e[3]),Vector3.new(e[4]/2,e[5]/2,e[6]/2)return Region3.new(g-h,g+h)
elseif f=='Region3int16'then return Region3int16.new(Vector3int16.new(e[1],e[2],e[3]),Vector3int16.new(e[4],e[5],e[6]))
elseif f=='UDim'then return UDim.new(e[1],e[2])elseif f=='UDim2'then return UDim2.new(e[1],e[2],e[3],e[4])elseif f==
'Vector2'then return Vector2.new(e[1],e[2])elseif f=='Vector2int16'then return Vector2int16.new(e[1],e[2])elseif f==
'Vector3'then return Vector3.new(e[1],e[2],e[3])elseif f=='Vector3int16'then return Vector3int16.new(e[1],e[2],e[3])else
return nil end end return d end)()end,[12]=function()local aa,ab,ac=a(12)local ad return(function(...)local function ae(
b:number,c:number,d:number):(number,number,number,number)if b==0 or d==0 then return 1,0,0,1 end local e,f,g,h if c>1
then local i,j=b*d,math.sqrt(c^2-1)local k,l=-0.5/j,-j-c local o,p=1/l,math.exp(i*l)local q=math.exp(i*o)e=(q*l-p*o)*k f
=(p-q)*k/d g=(q-p)*k*d h=(p*l-q*o)*k elseif c==1 then local i=b*d local j=math.exp(-i)e=j*(1+i)f=j*b g=j*(-i*d)h=j*(1-i)
else local i,j=b*d,math.sqrt(1-c^2)local k,l,o=1/j,j*i,math.exp(-i*c)local p,q=o*math.sin(l),o*math.cos(l)local r=p*k
local s=r*c e=s+q f=r g=-(s*c+p*j)h=q-s end return e,f,g,h end return ae end)()end,[13]=function()local aa,ab,ac=a(13)
local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function d(e:
any,f:string):{number}if f=='number'then local g=e::number return{g}elseif f=='CFrame'then local g,h=e:ToAxisAngle()
return{e.X,e.Y,e.Z,g.X,g.Y,g.Z,h}elseif f=='Color3'then local g=c.to(e)return{g.X,g.Y,g.Z}elseif f==
'ColorSequenceKeypoint'then local g=c.to(e.Value)return{g.X,g.Y,g.Z,e.Time}elseif f=='DateTime'then return{e.
UnixTimestampMillis}elseif f=='NumberRange'then return{e.Min,e.Max}elseif f=='NumberSequenceKeypoint'then return{e.Value
,e.Time,e.Envelope}elseif f=='PhysicalProperties'then return{e.Density,e.Friction,e.Elasticity,e.FrictionWeight,e.
ElasticityWeight}elseif f=='Ray'then return{e.Origin.X,e.Origin.Y,e.Origin.Z,e.Direction.X,e.Direction.Y,e.Direction.Z}
elseif f=='Rect'then return{e.Min.X,e.Min.Y,e.Max.X,e.Max.Y}elseif f=='Region3'then return{e.CFrame.X,e.CFrame.Y,e.
CFrame.Z,e.Size.X,e.Size.Y,e.Size.Z}elseif f=='Region3int16'then return{e.Min.X,e.Min.Y,e.Min.Z,e.Max.X,e.Max.Y,e.Max.Z}
elseif f=='UDim'then return{e.Scale,e.Offset}elseif f=='UDim2'then return{e.X.Scale,e.X.Offset,e.Y.Scale,e.Y.Offset}
elseif f=='Vector2'then return{e.X,e.Y}elseif f=='Vector2int16'then return{e.X,e.Y}elseif f=='Vector3'then return{e.X,e.
Y,e.Z}elseif f=='Vector3int16'then return{e.X,e.Y,e.Z}else return{}end end return d end)()end,[15]=function()local aa,ab
,ac=a(15)local ad return(function(...)local ae={}function ae.to(b:Color3):Vector3 local c,d,e=b.R*0.4122214708+b.G*
0.5363325363+b.B*0.0514459929,b.R*0.2119034982+b.G*0.6806995451+b.B*0.1073969566,b.R*0.0883024619+b.G*0.2817188376+b.B*
0.6299787005 local f,g,h=c^(0.3333333333333333),d^(0.3333333333333333),e^(0.3333333333333333)return Vector3.new(f*
0.2104542553+g*0.793617785-h*0.0040720468,f*1.9779984951-g*2.428592205+h*0.4505937099,f*0.0259040371+g*0.7827717662-h*
0.808675766)end function ae.from(b:Vector3,c:boolean?):Color3 local d,e,f=b.X+b.Y*0.3963377774+b.Z*0.2158037573,b.X-b.Y*
0.1055613458-b.Z*0.0638541728,b.X-b.Y*0.0894841775-b.Z*1.291485548 local g,h,i=d^3,e^3,f^3 local j,k,l=g*4.0767416621-h*
3.3077115913+i*0.2309699292,g*-1.2684380046+h*2.6097574011-i*0.3413193965,g*-4.196086299999999E-3-h*0.7034186147+i*
1.707614701 if not c then j=math.clamp(j,0,1)k=math.clamp(k,0,1)l=math.clamp(l,0,1)end return Color3.new(j,k,l)end
return ae end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(function(...)local ae=ab.Parent.Parent local b,c,
d=ac(ae.PubTypes),ac(ae.Logging.parseError),ac(ae.Dependencies.sharedState)type Set<T> ={[T]:any}local e,f=d.
initialisedStack,0 local function g(h:Set<PubTypes.Dependency>,i:(...any)->any,...):(boolean,any)local j=d.dependencySet
d.dependencySet=h d.initialisedStackSize+=1 local k,l=(d.initialisedStackSize)if k>f then l={}e[k]=l f=k else l=e[k]
table.clear(l)end local o=table.pack(xpcall(i,c,...))d.dependencySet=j d.initialisedStackSize-=1 return table.unpack(o,1
,o.n)end return g end)()end,[18]=function()local aa,ab,ac=a(18)local ad return(function(...)local ae=ab.Parent.Parent
local b,c=ac(ae.PubTypes),ac(ae.Dependencies.sharedState)local d=c.initialisedStack local function e(f:PubTypes.
Dependency)local g=c.initialisedStackSize for h,i in ipairs(d)do if h>g then return end i[f]=true end end return e end)(
)end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae=ab.Parent.Parent local b=ac(ae.PubTypes)
type Set<T> ={[T]:any}local c:{Set<PubTypes.Dependency>},d,e:Set<PubTypes.Dependency>?={},0 return{dependencySet=e,
initialisedStack=c,initialisedStackSize=d}end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)
local ae=ab.Parent.Parent local b=ac(ae.PubTypes)type Set<T> ={[T]:any}type Descendant=(PubTypes.Dependent&PubTypes.
Dependency)|PubTypes.Dependent local function c(d:PubTypes.Dependency)local e:{[Descendant]:number},f:{[Descendant]:
boolean},g:{Descendant},h,i={},{},{},0,1 for j in d.dependentSet do h+=1 g[h]=j f[j]=true end while i<=h do local k=g[i]
local l=e[k]e[k]=if l==nil then 1 else l+1 if(k::any).dependentSet~=nil then for o in(k::any).dependentSet do h+=1 g[h]=
o end end i+=1 end i=1 while i<=h do local k=g[i]local l=e[k]-1 e[k]=l if l==0 and f[k]and k:update()and(k::any).
dependentSet~=nil then for o in(k::any).dependentSet do f[o]=true end end i+=1 end end return c end)()end,[21]=function(
)local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Dependencies
.sharedState)local d=c.initialisedStack local function e(f:PubTypes.Dependency)local g=c.dependencySet if g~=nil then
local h=c.initialisedStackSize if h>0 then local i=d[h]if i[f]~=nil then return end end g[f]=true end end return e end)(
)end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d,e=ac(ae.
PubTypes),ac(ae.Logging.logWarn),ac(ae.State.Observer),ac(ae.Utility.xtypeof)type Set<T> ={[T]:boolean}local f,g=false,{
}g.type='SpecialKey'g.kind='Children'g.stage='descendants'function g.apply(h,i:any,j:Instance,k:{PubTypes.Task})local l:
Set<Instance>,o:Set<Instance>,p:{[PubTypes.StateObject<any>]:()->()},q:{[PubTypes.StateObject<any>]:()->()},r,s:()->()={
},{},{},{},false local function t()if not r then return end r=false o,l=l,o q,p=p,q table.clear(l)table.clear(p)
local function u(v:any,w:string?)local x=e(v)if x=='Instance'then l[v]=true if o[v]==nil then v.Parent=j else o[v]=nil
end if f and w~=nil then v.Name=w end elseif x=='State'then local y=v:get(false)if y~=nil then u(y,w)end local z=q[v]if
z==nil then z=d(v):onChange(s)else q[v]=nil end p[v]=z elseif x=='table'then for y,z in pairs(v)do local A,B:string?=(
typeof(y))if A=='string'then B=y elseif A=='number'and w~=nil then B=w..'_'..y end u(z,B)end else c(
'unrecognisedChildType',x)end end if i~=nil then u(i)end for v in pairs(o)do v.Parent=nil end for w,x in pairs(q)do x()
end end s=function()if not r then r=true task.defer(t)end end table.insert(k,function()i=nil r=true t()end)r=true t()end
return g::PubTypes.SpecialKey end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae=ab.
Parent.Parent local b,c=ac(ae.PubTypes),{}c.type='SpecialKey'c.kind='Cleanup'c.stage='observer'function c.apply(d,e:any,
f:Instance,g:{PubTypes.Task})table.insert(g,e)end return c end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(
function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Instances.applyInstanceProps)local function d(e:
Instance)return function(f:PubTypes.PropertyTable):Instance c(f,e)return e end end return d end)()end,[26]=function()
local aa,ab,ac=a(26)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d,e=ac(ae.PubTypes),ac(ae.Instances
.defaultProps),ac(ae.Instances.applyInstanceProps),ac(ae.Logging.logError)local function f(g:string)return function(h:
PubTypes.PropertyTable):Instance local i,j=pcall(Instance.new,g)if not i then e('cannotCreateClass',nil,g)end local k=c[
g]if k~=nil then for l,o in pairs(k)do j[l]=o end end d(h,j)return j end end return f end)()end,[27]=function()local aa,
ab,ac=a(27)local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Logging.logError)
local function d(e:string):PubTypes.SpecialKey local f={}f.type='SpecialKey'f.kind='OnChange'f.stage='observer'function
f.apply(g,h:any,i:Instance,j:{PubTypes.Task})local k,l=pcall(i.GetPropertyChangedSignal,i,e)if not k then c(
'cannotConnectChange',nil,i.ClassName,e)elseif typeof(h)~='function'then c('invalidChangeHandler',nil,e)else table.
insert(j,l:Connect(function()h((i::any)[e])end))end end return f end return d end)()end,[28]=function()local aa,ab,ac=a(
28)local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Logging.logError)
local function d(e:Instance,f:string)return(e::any)[f]end local function e(f:string):PubTypes.SpecialKey local g={}g.
type='SpecialKey'g.kind='OnEvent'g.stage='observer'function g.apply(h,i:any,j:Instance,k:{PubTypes.Task})local l,o=
pcall(d,j,f)if not l or typeof(o)~='RBXScriptSignal'then c('cannotConnectEvent',nil,j.ClassName,f)elseif typeof(i)~=
'function'then c('invalidEventHandler',nil,f)else table.insert(k,o:Connect(i))end end return g end return e end)()end,[
29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d=ac(ae.PubTypes),ac(
ae.Logging.logError),ac(ae.Utility.xtypeof)local function e(f:string):PubTypes.SpecialKey local g={}g.type='SpecialKey'g
.kind='Out'g.stage='observer'function g.apply(h,i:any,j:Instance,k:{PubTypes.Task})local l,o=pcall(j.
GetPropertyChangedSignal,j,f)if not l then c('invalidOutProperty',nil,j.ClassName,f)elseif d(i)~='State'or i.kind~=
'Value'then c'invalidOutType'else i:set((j::any)[f])table.insert(k,o:Connect(function()i:set((j::any)[f])end))table.
insert(k,function()i:set(nil)end)end end return g end return e end)()end,[30]=function()local aa,ab,ac=a(30)local ad
return(function(...)local ae=ab.Parent.Parent local b,c,d,e=ac(ae.PubTypes),ac(ae.Logging.logError),ac(ae.Utility.
xtypeof),{}e.type='SpecialKey'e.kind='Ref'e.stage='observer'function e.apply(f,g:any,h:Instance,i:{PubTypes.Task})if d(g
)~='State'or g.kind~='Value'then c'invalidRefType'else g:set(h)table.insert(i,function()g:set(nil)end)end end return e
end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d,e,f=ac(
ae.PubTypes),ac(ae.Utility.cleanup),ac(ae.Utility.xtypeof),ac(ae.Logging.logError),ac(ae.State.Observer)local function g
(h:Instance,i:string,j:any)(h::any)[i]=j end local function h(i:Instance,j:string)(i::any)[j]=(i::any)[j]end
local function i(j:Instance,k:string,l:any)if not pcall(g,j,k,l)then if not pcall(h,j,k)then if j==nil then e(
'setPropertyNilRef',nil,k,tostring(l))else e('cannotAssignProperty',nil,j.ClassName,k)end else local o,p=typeof(l),
typeof((j::any)[k])e('invalidPropertyType',nil,j.ClassName,k,p,o)end end end local function j(k:Instance,l:string,o:
PubTypes.CanBeState<any>,p:{PubTypes.Task})if d(o)=='State'then local q=false local function r()if not q then q=true
task.defer(function()q=false i(k,l,o:get(false))end)end end i(k,l,o:get(false))table.insert(p,f(o::any):onChange(r))else
i(k,l,o)end end local function k(l:PubTypes.PropertyTable,o:Instance)local p,q={self={}::{[PubTypes.SpecialKey]:any},
descendants={}::{[PubTypes.SpecialKey]:any},ancestor={}::{[PubTypes.SpecialKey]:any},observer={}::{[PubTypes.SpecialKey]
:any}},{}for r,s in pairs(l)do local t=d(r)if t=='string'then if r~='Parent'then j(o,r::string,s,q)end elseif t==
'SpecialKey'then local u=(r::PubTypes.SpecialKey).stage local v=p[u]if v==nil then e('unrecognisedPropertyStage',nil,u)
else v[r]=s end else e('unrecognisedPropertyKey',nil,d(r))end end for t,u in pairs(p.self)do t:apply(u,o,q)end for v,w
in pairs(p.descendants)do v:apply(w,o,q)end if l.Parent~=nil then j(o,'Parent',l.Parent,q)end for x,y in pairs(p.
ancestor)do x:apply(y,o,q)end for z,A in pairs(p.observer)do z:apply(A,o,q)end o.Destroying:Connect(function()c(q)end)
end return k end)()end,[32]=function()local aa,ab,ac=a(32)local ad return(function(...)return{ScreenGui={ResetOnSpawn=
false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},BillboardGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.
Sibling},SurfaceGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,SizingMode=Enum.SurfaceGuiSizingMode.
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
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[34]=function()local aa,ab,ac=a(34)local
ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.Types),ac(ae.Logging.messages)local function d(e:string
,f:Types.Error?,...)local g:string if c[e]~=nil then g=c[e]else e='unknownMessage'g=c[e]end local h if f==nil then h=
string.format('[Fusion] '..g..'\n(ID: '..e..')',...)else g=g:gsub('ERROR_MESSAGE',f.message)h=string.format('[Fusion] '
..g..'\n(ID: '..e..')\n---- Stack trace ----\n'..f.trace,...)end error(h:gsub('\n','\n    '),0)end return d end)()end,[
35]=function()local aa,ab,ac=a(35)local ad return(function(...)local ae=ab.Parent.Parent local b,c=ac(ae.Types),ac(ae.
Logging.messages)local function d(e:string,f:Types.Error?,...)local g:string if c[e]~=nil then g=c[e]else e=
'unknownMessage'g=c[e]end local h if f==nil then h=string.format('[Fusion] '..g..'\n(ID: '..e..')',...)else g=g:gsub(
'ERROR_MESSAGE',f.message)h=string.format('[Fusion] '..g..'\n(ID: '..e..')\n---- Stack trace ----\n'..f.trace,...)end
task.spawn(function(...)error(h:gsub('\n','\n    '),0)end,...)end return d end)()end,[36]=function()local aa,ab,ac=a(36)
local ad return(function(...)local ae=ab.Parent.Parent local b=ac(ae.Logging.messages)local function c(d,...)local e:
string if b[d]~=nil then e=b[d]else d='unknownMessage'e=b[d]end warn(string.format('[Fusion] '..e..'\n(ID: '..d..')',...
))end return c end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{cannotAssignProperty=
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
[['%s' isn't a valid stage for a special key to be applied at.]]}end)()end,[38]=function()local aa,ab,ac=a(38)local ad
return(function(...)local ae=ab.Parent.Parent local b=ac(ae.Types)local function c(d:string):Types.Error return{type=
'Error',raw=d,message=d:gsub('^.+:%d+:%s*',''),trace=debug.traceback(nil,2)}end return c end)()end,[39]=function()local
aa,ab,ac=a(39)local ad return(function(...)type Set<T> ={[T]:any}export type Symbol={type:string,name:string}export type
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
return nil end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)local ae=ab.Parent.Parent local b,c
,d,e,f,g,h,i,j=ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.useDependency),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.isSimilar),ac(ae.
Utility.needsDestruction),{}local k,l={__index=j},{__mode='k'}function j.get(o,p:boolean?):any if p~=false then e(o)end
return o._value end function j.update(o):boolean for p in pairs(o.dependencySet)do p.dependentSet[o]=nil end o.
_oldDependencySet,o.dependencySet=o.dependencySet,o._oldDependencySet table.clear(o.dependencySet)local q,z,A=c(o.
dependencySet,o._processor)if q then if o._destructor==nil and i(z)then g'destructorNeededComputed'end if A~=nil then g
'multiReturnComputed'end local B=o._value local C=h(B,z)if o._destructor~=nil then o._destructor(B)end o._value=z for D
in pairs(o.dependencySet)do D.dependentSet[o]=true end return not C else f('computedCallbackError',z)o._oldDependencySet
,o.dependencySet=o.dependencySet,o._oldDependencySet for B in pairs(o.dependencySet)do B.dependentSet[o]=true end return
false end end local function o<T>(p:()->T,q:((T)->())?):Types.Computed<T>local z=setmetatable({type='State',kind=
'Computed',dependencySet={},dependentSet=setmetatable({},l),_oldDependencySet={},_processor=p,_destructor=q,_value=nil},
k)d(z)z:update()return z end return o end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)local ae
=ab.Parent.Parent local b,c,d,e,f,g,h,i,j,k,l,o=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(
ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.
logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),
{}local p,q={__index=o},{__mode='k'}function o.get(z,A:boolean?):any if A~=false then f(z)end return z._outputTable end
function o.update(z):boolean local A=z._inputIsState local B,C,D,E,F,G,H=if A then z._inputTable:get(false)else z.
_inputTable,z._oldInputTable,z._outputTable,z._keyOIMap,z._keyIOMap,z._meta,false for I in pairs(z.dependencySet)do I.
dependentSet[z]=nil end z._oldDependencySet,z.dependencySet=z.dependencySet,z._oldDependencySet table.clear(z.
dependencySet)if A then z._inputTable.dependentSet[z]=true z.dependencySet[z._inputTable]=true end for J,K in pairs(B)do
local L=z._keyData[J]if L==nil then L={dependencySet=setmetatable({},q),oldDependencySet=setmetatable({},q),
dependencyValues=setmetatable({},q)}z._keyData[J]=L end local M=C[J]==nil if M==false then for N,O in pairs(L.
dependencyValues)do if O~=N:get(false)then M=true break end end end if M then L.oldDependencySet,L.dependencySet=L.
dependencySet,L.oldDependencySet table.clear(L.dependencySet)local N,O,P=d(L.dependencySet,z._processor,J)if N then if z
._destructor==nil and(l(O)or l(P))then j'destructorNeededForKeys'end local Q,R=E[O],F[J]if Q~=J and B[Q]~=nil then i(
'forKeysKeyCollision',nil,tostring(O),tostring(Q),tostring(O))end if R~=O and E[R]==J then local S=G[R]local T,U=xpcall(
z._destructor or k,g,R,S)if not T then h('forKeysDestructorError',U)end E[R]=nil D[R]=nil G[R]=nil end C[J]=K G[O]=P E[O
]=J F[J]=O D[O]=K H=true else L.oldDependencySet,L.dependencySet=L.dependencySet,L.oldDependencySet h(
'forKeysProcessorError',O)end end for N in pairs(L.dependencySet)do L.dependencyValues[N]=N:get(false)z.dependencySet[N]
=true N.dependentSet[z]=true end end for L,M in pairs(E)do if B[M]==nil then local N=G[L]local O,P=xpcall(z._destructor
or k,g,L,N)if not O then h('forKeysDestructorError',P)end C[M]=nil G[L]=nil E[L]=nil F[M]=nil D[L]=nil z._keyData[M]=nil
H=true end end return H end local function z<KI,KO,M>(A:PubTypes.CanBeState<{[KI]:any}>,B:(KI)->(KO,M?),C:((KO,M?)->())?
):Types.ForKeys<KI,KO,M>local D=A.type=='State'and typeof(A.get)=='function'local E=setmetatable({type='State',kind=
'ForKeys',dependencySet={},dependentSet=setmetatable({},q),_oldDependencySet={},_processor=B,_destructor=C,_inputIsState
=D,_inputTable=A,_oldInputTable={},_outputTable={},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},p)e(E)E:update()
return E end return z end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(...)local ae=ab.Parent.
Parent local b,c,d,e,f,g,h,i,j,k,l,o=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.
Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal)
,ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local p,q={
__index=o},{__mode='k'}function o.get(z,A:boolean?):any if A~=false then f(z)end return z._outputTable end function o.
update(z):boolean local A=z._inputIsState local B,C,D,E,F=if A then z._inputTable:get(false)else z._inputTable,z.
_oldInputTable,z._keyIOMap,z._meta,false for G in pairs(z.dependencySet)do G.dependentSet[z]=nil end z._oldDependencySet
,z.dependencySet=z.dependencySet,z._oldDependencySet table.clear(z.dependencySet)if A then z._inputTable.dependentSet[z]
=true z.dependencySet[z._inputTable]=true end z._oldOutputTable,z._outputTable=z._outputTable,z._oldOutputTable local H,
I=z._oldOutputTable,z._outputTable table.clear(I)for J,K in pairs(B)do local L=z._keyData[J]if L==nil then L={
dependencySet=setmetatable({},q),oldDependencySet=setmetatable({},q),dependencyValues=setmetatable({},q)}z._keyData[J]=L
end local M=C[J]~=K if M==false then for N,O in pairs(L.dependencyValues)do if O~=N:get(false)then M=true break end end
end if M then L.oldDependencySet,L.dependencySet=L.dependencySet,L.oldDependencySet table.clear(L.dependencySet)local N,
O,P,Q=d(L.dependencySet,z._processor,J,K)if N then if z._destructor==nil and(l(O)or l(P)or l(Q))then j
'destructorNeededForPairs'end if I[O]~=nil then local R,S for T,U in pairs(D)do if U==O then S=B[T]if S~=nil then R=T
break end end end if R~=nil then i('forPairsKeyCollision',nil,tostring(O),tostring(R),tostring(S),tostring(J),tostring(K
))end end local R=H[O]if R~=P then local S=E[O]if R~=nil then local T,U=xpcall(z._destructor or k,g,O,R,S)if not T then
h('forPairsDestructorError',U)end end H[O]=nil end C[J]=K D[J]=O E[O]=Q I[O]=P F=true else L.oldDependencySet,L.
dependencySet=L.dependencySet,L.oldDependencySet h('forPairsProcessorError',O)end else local N=D[J]if I[N]~=nil then
local O,P for Q,R in pairs(D)do if N==R then P=B[Q]if P~=nil then O=Q break end end end if O~=nil then i(
'forPairsKeyCollision',nil,tostring(N),tostring(O),tostring(P),tostring(J),tostring(K))end end I[N]=H[N]end for N in
pairs(L.dependencySet)do L.dependencyValues[N]=N:get(false)z.dependencySet[N]=true N.dependentSet[z]=true end end for L,
M in pairs(H)do if I[L]~=M then local N=E[L]if M~=nil then local O,P=xpcall(z._destructor or k,g,L,M,N)if not O then h(
'forPairsDestructorError',P)end end if I[L]==nil then E[L]=nil z._keyData[L]=nil end F=true end end for N in pairs(C)do
if B[N]==nil then C[N]=nil D[N]=nil end end return F end local function z<KI,VI,KO,VO,M>(A:PubTypes.CanBeState<{[KI]:VI}
>,B:(KI,VI)->(KO,VO,M?),C:((KO,VO,M?)->())?):Types.ForPairs<KI,VI,KO,VO,M>local D=A.type=='State'and typeof(A.get)==
'function'local E=setmetatable({type='State',kind='ForPairs',dependencySet={},dependentSet=setmetatable({},q),
_oldDependencySet={},_processor=B,_destructor=C,_inputIsState=D,_inputTable=A,_oldInputTable={},_outputTable={},
_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},p)e(E)E:update()return E end return z end)()end,[44]=function()
local aa,ab,ac=a(44)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d,e,f,g,h,i,j,k,l=ac(ae.PubTypes),
ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency
),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.
needsDestruction),{}local o,p={__index=l},{__mode='k'}function l.get(q,z:boolean?):any if z~=false then f(q)end return q
._outputTable end function l.update(q):boolean local z=q._inputIsState local A,B,C=if z then q._inputTable:get(false)
else q._inputTable,{},false q._oldValueCache,q._valueCache=q._valueCache,q._oldValueCache local D,E=q._valueCache,q.
_oldValueCache table.clear(D)for F in pairs(q.dependencySet)do F.dependentSet[q]=nil end q._oldDependencySet,q.
dependencySet=q.dependencySet,q._oldDependencySet table.clear(q.dependencySet)if z then q._inputTable.dependentSet[q]=
true q.dependencySet[q._inputTable]=true end for G,H in pairs(A)do local I=E[H]local J,K,L,M=(I==nil)if type(I)=='table'
and#I>0 then local N=table.remove(I,#I)K=N.value L=N.valueData M=N.meta if#I<=0 then E[H]=nil end elseif I~=nil then E[H
]=nil J=true end if L==nil then L={dependencySet=setmetatable({},p),oldDependencySet=setmetatable({},p),dependencyValues
=setmetatable({},p)}end if J==false then for N,O in pairs(L.dependencyValues)do if O~=N:get(false)then J=true break end
end end if J then L.oldDependencySet,L.dependencySet=L.dependencySet,L.oldDependencySet table.clear(L.dependencySet)
local N,O,P=d(L.dependencySet,q._processor,H)if N then if q._destructor==nil and(k(O)or k(P))then i
'destructorNeededForValues'end if K~=nil then local Q,R=xpcall(q._destructor or j,g,K,M)if not Q then h(
'forValuesDestructorError',R)end end K=O M=P C=true else L.oldDependencySet,L.dependencySet=L.dependencySet,L.
oldDependencySet h('forValuesProcessorError',O)end end local N=D[H]if N==nil then N={}D[H]=N end table.insert(N,{value=K
,valueData=L,meta=M})B[G]=K for O in pairs(L.dependencySet)do L.dependencyValues[O]=O:get(false)q.dependencySet[O]=true
O.dependentSet[q]=true end end for I,J in pairs(E)do for K,L in ipairs(J)do local M,N=L.value,L.meta local O,P=xpcall(q.
_destructor or j,g,M,N)if not O then h('forValuesDestructorError',P)end C=true end table.clear(J)end q._outputTable=B
return C end local function q<VI,VO,M>(z:PubTypes.CanBeState<{[any]:VI}>,A:(VI)->(VO,M?),B:((VO,M?)->())?):Types.
ForValues<VI,VO,M>local C=z.type=='State'and typeof(z.get)=='function'local D=setmetatable({type='State',kind=
'ForValues',dependencySet={},dependentSet=setmetatable({},p),_oldDependencySet={},_processor=A,_destructor=B,
_inputIsState=C,_inputTable=z,_outputTable={},_valueCache={},_oldValueCache={}},o)e(D)D:update()return D end return q
end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae=ab.Parent.Parent local b,c,d=ac(ae.
PubTypes),ac(ae.Types),ac(ae.Dependencies.initDependency)type Set<T> ={[T]:any}local e={}local f,g:Set<Types.Observer> =
{__index=e},{}function e.update(h):boolean for i,j in pairs(h._changeListeners)do task.spawn(j)end return false end
function e.onChange(h,i:()->()):()->()local j={}h._numChangeListeners+=1 h._changeListeners[j]=i g[h]=true local k=false
return function()if k then return end k=true h._changeListeners[j]=nil h._numChangeListeners-=1 if h._numChangeListeners
==0 then g[h]=nil end end end local function h(i:PubTypes.Value<any>):Types.Observer local j=setmetatable({type='State',
kind='Observer',dependencySet={[i]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},f)d(j)i.dependentSet
[j]=true return j end return h end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae=ab.
Parent.Parent local b,c,d,e,f,g=ac(ae.Types),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.updateAll),ac(ae.Utility.isSimilar),{}local h,i={__index=g},{__mode='k'}function g.get(j,k:boolean?):any if
k~=false then c(j)end return j._value end function g.set(j,k:any,l:boolean?)local o=j._value if l or not f(o,k)then j.
_value=k e(j)end end local function j<T>(k:T):Types.State<T>local l=setmetatable({type='State',kind='Value',dependentSet
=setmetatable({},i),_value=k},h)d(l)return l end return j end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(
function(...)local ae=ab.Parent.Parent local b,c=ac(ae.PubTypes),ac(ae.Utility.xtypeof)local function d<T>(e:PubTypes.
CanBeState<T>,f:boolean?):T return if c(e)=='State'then(e::PubTypes.StateObject<T>):get(f)else(e::T)end return d end)()
end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)local ae=ab.Parent local b=ac(ae.PubTypes)type Set<T
> ={[T]:any}export type None=PubTypes.Symbol&{}export type Error={type:string,raw:string,message:string,trace:string}
export type State<T> =PubTypes.Value<T>&{_value:T}export type Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<
PubTypes.Dependency>,_callback:()->T,_value:T}export type ForPairs<KI,VI,KO,VO,M> =PubTypes.ForPairs<KO,VO>&{
_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI,VI)->(KO,VO),_destructor:(VO,M?)->(),_inputIsState:boolean,
_inputTable:PubTypes.CanBeState<{[KI]:VI}>,_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO},_oldOutputTable:{[KO]:VO},
_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes
.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForKeys<KI,KO,M> =PubTypes.ForKeys<KO,any>&{
_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI)->(KO),_destructor:(KO,M?)->(),_inputIsState:boolean,
_inputTable:PubTypes.CanBeState<{[KI]:KO}>,_oldInputTable:{[KI]:KO},_outputTable:{[KO]:any},_keyOIMap:{[KO]:KI},_meta:{[
KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,
dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForValues<VI,VO,M> =PubTypes.ForValues<any,VO>&{
_oldDependencySet:Set<PubTypes.Dependency>,_processor:(VI)->(VO),_destructor:(VO,M?)->(),_inputIsState:boolean,
_inputTable:PubTypes.CanBeState<{[VI]:VO}>,_outputTable:{[any]:VI},_valueCache:{[VO]:any},_oldValueCache:{[VO]:any},
_meta:{[VO]:M?},_valueData:{[VI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,
dependencyValues:{[PubTypes.Dependency]:any}}}}export type Tween<T> =PubTypes.Tween<T>&{_goalState:State<T>,_tweenInfo:
TweenInfo,_prevValue:T,_nextValue:T,_currentValue:T,_currentTweenInfo:TweenInfo,_currentTweenDuration:number,
_currentTweenStartTime:number,_currentlyAnimating:boolean}export type Spring<T> =PubTypes.Spring<T>&{_speed:PubTypes.
CanBeState<number>,_speedIsState:boolean,_lastSpeed:number,_damping:PubTypes.CanBeState<number>,_dampingIsState:boolean,
_lastDamping:number,_goalState:State<T>,_goalValue:T,_currentType:string,_currentValue:T,_springPositions:{number},
_springGoals:{number},_springVelocities:{number}}export type Observer=PubTypes.Observer&{_changeListeners:Set<()->()>,
_numChangeListeners:number}return nil end)()end,[50]=function()local aa,ab,ac=a(50)local ad return(function(...)local ae
=ab.Parent.Parent local b=ac(ae.Types)return{type='Symbol',name='None'}::Types.None end)()end,[51]=function()local aa,ab
,ac=a(51)local ad return(function(...)local function ae(b:any)local c=typeof(b)if c=='Instance'then b:Destroy()elseif c
=='RBXScriptConnection'then b:Disconnect()elseif c=='function'then b()elseif c=='table'then if typeof(b.destroy)==
'function'then b:destroy()elseif typeof(b.Destroy)=='function'then b:Destroy()elseif b[1]~=nil then for d,e in ipairs(b)
do ae(e)end end end end local function b(...:any)for c=1,select('#',...)do ae(select(c,...))end end return b end)()end,[
52]=function()local aa,ab,ac=a(52)local ad return(function(...)local function ae(...:any)end return ae end)()end,[53]=
function()local aa,ab,ac=a(53)local ad return(function(...)local function ae(b:any,c:any):boolean if typeof(b)=='table'
then return false else return b==c end end return ae end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(
function(...)local function ae(b:any):boolean return typeof(b)=='Instance'end return ae end)()end,[55]=function()local
aa,ab,ac=a(55)local ad return(function(...)local ae=ab.Parent.Parent local b=ac(ae.Logging.logError)type table={[any]:
any}local function c(d:string,e:table):table local f=getmetatable(e::any)if f==nil then f={}setmetatable(e,f)end
function f.__index(g,h)b('strictReadError',nil,tostring(h),d)end return e end return c end)()end,[56]=function()local aa
,ab,ac=a(56)local ad return(function(...)local function ae(b:any)local c=typeof(b)if c=='table'and typeof(b.type)==
'string'then return b.type else return c end end return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(
function(...)local ae,b=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Fusion)local c,d,e=b.Value,{},{}type
uid=string type tag=string function e.update(f:string,g:string,h:string)if g~='uid'and e.find(f)and e.find(f)[g]then
local i=e.find(f)i[g]:set(h)elseif not e.find(f)then error("couldn't find uid: "..f)elseif g=='uid'or g=='__tag'then
error('cannot edit property '..g)elseif not e.find(f)[g]then else error'how?'end end function e.find(f:uid|tag):table
local g for h=1,#d do if d[h].uid==f or d[h].__tag==f then g=d[h]end end if not g then warn(
'no data found by identifier: '..tostring(f))return g end return g end function e.delete(f:string)local g=e.find(f)local
h,i=table.find(d,g),{}for j=1,#d do if j~=h then table.insert(i,d[j])end end d=i i=nil end function e.add(f:table,g:
string,h:boolean):table h=h or false if not h then for i,j in f do f[i]=c(j)end end f.__tag=g or nil f.uid=ae(16)
setmetatable(f,{__index={update=function(i,j,k)e.update(i.uid,j,k)end,delete=function()e.delete(f.uid)end}})table.
insert(d,f)return e.find(f.uid)end return e end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)
local ae,b,c=ac(ab.Parent).data,ac(ab.Parent.Parent.utilities).get,ac(ab.Parent).services local d,e=c.HttpService,ac(ab.
Parent).Fusion local f,g,h,i,j,k,l,o=e.Observer,e.Value,ac(ab.Parent.Parent.utilities).connections,ac(ab.Parent.Parent.
utilities).customFunctions,{},ae.add({list={}},'flags'),{},{}local p,q={toggle=function(p)local q=p.status.boolean h.
add(f(q):onChange(function()if not p.private then task.spawn(j.export)end local z=b(q)p.user.Value=z p.bindableEvent:
Fire(z)end))end,dropdown=function(p)local q=p.status.multiselect and p.status.items or p.status.item h.add(f(q):
onChange(function()if not p.private then task.spawn(j.export)end local z=b(q)p.user.Value=z p.bindableEvent:Fire(z)end))
end,keybind=function(p)local q=p.status.mobile and p.status.coordinate or p.status.keycode h.add(f(q):onChange(function(
)if not p.private then task.spawn(j.export)end local z=b(q)p.user.Value=z p.bindableEvent:Fire(z)end))end,slider=
function(p)local q=p.status.percentageOf h.add(f(q):onChange(function()if not p.private then task.spawn(j.export)end
local z=b(q)p.user.Value=z p.bindableEvent:Fire(z)end))end,textbox=function(p)local q=p.status.correctText h.add(f(q):
onChange(function()if not p.private then task.spawn(j.export)end local z=b(q)p.user.Value=z p.bindableEvent:Fire(z)end))
end,colorpicker=function(p)local q,z=p.status.color,p.status.transparency h.add(f(q):onChange(function()if not p.private
then task.spawn(j.export)end p.user.Value={b(q),b(z)}p.bindableEvent:Fire(unpack(p.user.Value))end))h.add(f(z):onChange(
function()if not p.private then task.spawn(j.export)end p.user.Value={b(q),b(z)}p.bindableEvent:Fire(unpack(p.user.Value
))end))end},{toggle=function(p)local q={}if p.boolean then q.boolean=b(p.boolean)end if p.keycode then q.keycode=b(p.
keycode)end return q end,dropdown=function(p)return p.multiselect and b(p.items)or b(p.item)end,keybind=function(p)local
q={}if p.keycode then q.keycode=b(p.keycode)end if p.coordinate then q.coordinate=b(p.coordinate)end return q end,slider
=function(p)return b(p.percentageOf)end,textbox=function(p)return b(p.correctText)end,colorpicker=function(p)return{
color=b(p.color),transparency=b(p.transparency)}end}function j.preregister(z)local A,B=e.New'BindableEvent'{},{}function
B.Connect(C,D)assert(typeof(D)=='function','Connect only takes functions')h.add(A.Event:Connect(D))end local C C={name=z
,status={},type='unknown',preregistered=true,bindableEvent=A,file=g{},user={Value=nil,OnChange=setmetatable(B,{
__newindex=function(D,E,F)return nil end})}}o[z]=C local D=b(k.list)D[C.name]=C k:update('list',D)return C end function
j.register(z,A,B,C)assert(not table.find(l,z),'Flags must all be unique!')table.insert(l,z)local D,E=e.New
'BindableEvent'{},{}function E.Connect(F,G)assert(typeof(G)=='function','Connect')h.add(D.Event:Connect(G))end local F
if not o[z]then F={name=z,status=A,type=B,private=C,preregistered=false,bindableEvent=D,file=g{},user={Value=nil,
OnChange=setmetatable(E,{__newindex=function()return nil end})}}p[F.type](F)local G=b(k.list)G[F.name]=F k:update('list'
,G)else F=o[z]F.type=B F.preregistered=false F.status=A F.private=C p[F.type](F)o[F.name]=nil end return F end j.config=
g''function j.export()local z,A={},b(k.list)for B,C in A do if C.private then continue end if C.type=='unknown'then
continue end z[C.name]=q[C.type](C.status)end if b(j.config)~=''then i.writefile(b(j.config),d:JSONEncode(z))end end
function j.load(z)for A,B in z do local C=b(k.list)[A]if not C then continue end C.file:set(B)end end return j end)()end
,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)return{lock='rbxassetid://10723434711',maximize=
'rbxassetid://15556636376',minimize='rbxassetid://15556637715',close='rbxassetid://10747384394',circle=
'rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',
fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command='rbxassetid://10723416765',input=
'rbxassetid://10734982297',search='rbxassetid://10734943674',finger='rbxassetid://10734929723',alert=
'rbxassetid://10709752996',paint='rbxassetid://10734910187'}end)()end,[60]=function()local aa,ab,ac=a(60)local ad return
(function(...)end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae=ac(ab.Parent.Parent.
utilities.customFunctions)local b,c=ae.cloneref,{}c=setmetatable(c,{__index=function(d,e)return b(game:GetService(e))end
})return c end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(function(...)local ae,b={},ac(ab.Parent.services
)local c,d,e=b.HttpService,ac(ab.Parent.Fusion),ac(ab.default)local f,g,h,i,j,k,l,o=d.Value,d.Observer,ac(ab.Parent.
Parent.utilities.get),ac(ab.Parent.Parent.utilities.animate),ac(ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.
utilities.randomString),ac(ab.Parent.Parent.utilities.customFunctions),{}local p,q,z=f{},f{},''g(p):onChange(function()
for A,B in ipairs(o)do task.spawn(B)end end)local A,B={},{}table.foreach(e,function(C)table.insert(B,C)end)function ae.
find(C)for D,E in A do if E.uid==C then return true,E end end return false end function ae.export()for C,D in A do local
E={}E.name=D.name E.uid=D.uid E.palette={}for F,G in D.palette do E.palette[F]=G:ToHex()end l.writefile(`darius/themes/{
D.name}-{D.uid}.json`,c:JSONEncode(E))end end function ae.create(C,D,E,F)F=F or false if E=='original'and F then return
end for G,H in B do if D[H]==nil then D[H]=e[H]end if typeof(D[H])~='Color3'then j(H.." isn't type Color3")end end for I
,J in D do if not table.find(B,I)then j('Incorrect value removed "'..tostring(I)..'"')D[I]=nil end end E=E or k(5)table.
insert(A,{name=C,uid=E,palette=D})ae.export()return E end function ae.delete(C)local D={ae.find(C)}if not D[1]then
return false,'no theme found'end local E=table.find(A,D[2])ae.set(z)table.remove(A,E)l.delfile(`darius/themes/{D[2].name
}-{D[2].uid}.json`)end function ae.edit(C,D)local E=h(p)E[C]=D p:set(E)end function ae.set(C)local D,E,F={ae.find(C)}if
D[1]then E,F=D[2],D[2].palette else return false,'no theme found'end local H={}table.foreach(F,function(I,J)H[I]=J end)p
:set(H)q:set(E)return true,'successfully set new theme'end function ae.import()for C,D in l.listfiles'darius/themes'do
local E=c:JSONDecode(l.readfile(D))table.foreach(E.palette,function(F,H)local I=Color3.fromHex(`#{H}`)E.palette[F]=I end
)ae.create(E.name,E.palette,E.uid,true)end end function ae.get(C)local D=h(p)if D[C]then return D[C]else error(C..
" isn't a theme element")end end for C,D in B do ae[D]=i(function()return h(p)[D]end,40,1)end function ae.init()local E,
F={'darius',`/themes`},''for H=1,#E do F=F..E[H]if not l.isfolder(F)then l.makefolder(F)end end z=ae.create('darius',e,
'original')ae.set(z)ae.import()end function ae.onChange(E)table.insert(o,E)end function ae.getTheme()return h(q)end
function ae.getThemes()return A end function ae.getColors()return h(p)end return ae end)()end,[63]=function()local aa,ab
,ac=a(63)local ad return(function(...)return{background=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text
=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',colorpickerBar=Color3.fromHex
'#DCE1E5',notificationButton=Color3.fromHex'#222427',mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=
Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',
disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.
fromHex'#ff9b61'}end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local ae=ab.Parent.Parent
return function(b)local c=ac(ae.Bundles)local d,e,f,g=c.data,c.themeSystem,c.icons,c.Fusion local h,i,j,k,l,o,p=g.New,g.
Children,g.Value,g.Observer,g.OnEvent,g.Computed,ac(ae.utilities)local q,z,A,B,C=p.get,p.animate,p.typecheck,p.
customFont,ac(ae.simpleElements)local D,E,F,H=C.UIPadding,C.UICorner,A(b,{Name='',DisabledText='',IsEnabled=false,
Visible=false,Callback=function()end},{b.IsEnabled and''or'IsEnabled',b.Visible and''or'Visible',b.DisabledText and''or
'DisabledText'})assert(F,table.concat(H,'\n'))local I,J,K,L,M,N,O,P,Q=d.find'selectedTab',d.find'searchText',d.add(b),b.
Parent,b.Name,b.Callback,b.IsEnabled or j(true),b.DisabledText or j'Component Disabled',b.Visible or j(true)local R=j(q(
I.string)==q(K.tab).uid)k(I.string):onChange(function()R:set(q(I.string)==q(K.tab).uid)end)local S=z(function()return q(
R)and 0 or 1 end,40,1)h'TextButton'{Interactable=o(function()if not q(O)then return false end return q(R)end),Visible=o(
function()if q(J.string)~=''and not string.find(q(M):lower(),q(J.string):lower())or not q(Q)then return false end return
true end),Parent=L,Size=UDim2.new(1,0,0,36),BackgroundColor3=e.background2,BackgroundTransparency=S,[l'Activated']=
function()if not q(O)then return end task.spawn(q(N))end,[i]={E(6),h'Frame'{ZIndex=2,Visible=o(function()if not q(O)then
return true end return false end),BackgroundTransparency=z(function()return q(R)and 0.2 or 1 end,40,1),BackgroundColor3=
e.disabledBackground,Size=UDim2.fromScale(1,1),[i]={E(6),h'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=f.lock,ImageColor3=e.disabledText,
ImageTransparency=S},h'TextLabel'{FontFace=B('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(
1,-24,0,18),TextColor3=e.disabledText,TextTransparency=S,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,29,0.5,0),Text=P,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[i]={D(0,5)}}}},h'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[i]={D(0,8),h'TextLabel'{FontFace=B('Montserrat',Enum.FontWeight.Bold),Size=
UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=e.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position
=UDim2.new(0,0,0.5,0),Text=M,TextTransparency=S,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},h'ImageLabel'{
Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image
=f.fingerprint,ImageColor3=e.text2,ImageTransparency=S}}}}}local T={}function T.SetName(U,V)local W,X=A({SetName=V},{
SetName=''})assert(W,table.concat(X,'\n'))M:set(V)end function T.SetCallback(U,V)local W,X=A({SetCallback=V},{
SetCallback=function()end})assert(W,table.concat(X,'\n'))N:set(V)end function T.Fire(U)task.spawn(q(N))end function T.
Enable(U)O:set(true)end function T.Disable(U)O:set(false)end function T.Visible(U)Q:set(true)end function T.Invisible(U)
Q:set(false)end return T end end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)local ae=ab.
Parent.Parent return function(b)local c=ac(ae.Bundles)local d,e,f,g,h=c.data,c.themeSystem,c.icons,c.flags,c.services
local i,j,k=h.RunService,h.UserInputService,c.Fusion local l,o,p,q,z,A,B,C=k.New,k.Children,k.Value,k.Observer,k.OnEvent
,k.Computed,k.Ref,ac(ae.utilities)local D,E,F,H,I,J,K=C.get,C.animate,C.typecheck,C.customFont,C.randomString,C.
connections,ac(ae.simpleElements)local L,M,N,O,P,Q,R,S,T,U=K.UIListLayout,K.UIPadding,K.UITextSizeConstraint,K.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,F(b,{Name='',DisabledText='',IsEnabled
=false,Callback=function()end,FLAG='',Visible=false,Color=Color3.new(),Transparency=0,HideTransparency=true,IgnoreConfig
=true},{b.IsEnabled and''or'IsEnabled',b.DisabledText and''or'DisabledText',b.FLAG and''or'FLAG',b.Color and''or'Color',
b.Visible and''or'Visible',b.Transparency and''or'Transparency',b.HideTransparency and''or'HideTransparency',b.
IgnoreConfig and''or'IgnoreConfig'})assert(T,table.concat(U,'\n'))local V,W,X,Y,Z,_,af,ag,ah,ai,aj,ak,al,am,an,ao=d.find
'selectedTab',d.find'searchText',d.find'useConfig',d.find'absoluteOffset',d.find'currentPicker',d.add(b),b.Parent,b.Name
,b.Callback,b.IsEnabled or p(true),b.DisabledText or p'Component Disabled',b.Color or p(Color3.new(1)),b.IgnoreConfig or
p(false),b.Transparency or p(0),b.Visible or p(true),b.HideTransparency or p(false)local ap,aq=(b.FLAG or p(_.uid))if D(
ap)~=''then aq=g.register(D(ap),{color=p(Color3.new(1)),transparency=p(0)},'colorpicker',D(ap)==_.uid)aq.user.Value={D(
aq.status.color),D(aq.status.transparency)}end local ar,as=aq.status.color,aq.status.transparency q(ar):onChange(
function()if D(ai)then task.spawn(D(ah),D(ar),D(as))end end)q(as):onChange(function()if D(ai)then task.spawn(D(ah),D(ar)
,D(as))end end)local at=p(D(V.string)==D(_.tab).uid)q(V.string):onChange(function()at:set(D(V.string)==D(_.tab).uid)end)
local au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL=E(function()return D(at)and 0 or 1 end,40,1),p(),p(0),p(),p(
0),p(),p(0),p(),p(false),p(),p(false),p(),p(false),p(0),p(0),(p(0))local function aM()return{Name=ag,Children={L(P.
LayoutOrder,Q.Vertical,R.Center,S.Top,UDim.new(0,5)),l'TextButton'{Size=UDim2.fromOffset(224,224),[B]=aB,[z'InputBegan']
=function(aN)if aN.UserInputType~=Enum.UserInputType.MouseButton1 then return end aC:set(true)local aO aO=aN.Changed:
Connect(function()if aN.UserInputState==Enum.UserInputState.End or aN.UserInputState.Cancel then aC:set(false)aO:
Disconnect()end end)end,[o]={l'UIGradient'{Color=A(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3
.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(D(aH),1,1))}end)},l'Frame'{Size=UDim2.fromScale(1,1),[
o]={l'UIGradient'{Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=A(function()return NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},l'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,Image=f.circle,Size=UDim2.fromOffset(10,10),ImageColor3=A(function()return Color3.
fromHSV(0,0,1-D(aJ))end),Position=A(function()return UDim2.fromScale(D(aI),1-D(aJ))end),[o]={l'ImageLabel'{ZIndex=2,
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=f.circle,Size=UDim2.fromScale(0.9,0.9),ImageColor3=A(
function()return Color3.fromHSV(D(aH),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},l'TextButton'{Size=UDim2.new(1,0,0
,24),[z'InputBegan']=function(aN)if aN.UserInputType~=Enum.UserInputType.MouseButton1 then return end aE:set(true)local
aO aO=aN.Changed:Connect(function()if aN.UserInputState==Enum.UserInputState.End or aN.UserInputState.Cancel then aE:
set(false)aO:Disconnect()end end)end,[B]=aD,[o]={l'UIGradient'{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.
fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),ColorSequenceKeypoint.new(0.4,Color3.fromHSV(
0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},l'Frame'{
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=e.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=A(function()return
UDim2.fromScale(1-D(aH),0.5)end)}}},l'ImageButton'{Visible=not D(ao),ZIndex=2,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=Enum.ScaleType.Crop,[z'InputBegan']=function(aN)if
aN.UserInputType~=Enum.UserInputType.MouseButton1 then return end aG:set(true)local aO aO=aN.Changed:Connect(function()
if aN.UserInputState==Enum.UserInputState.End or aN.UserInputState.Cancel then aG:set(false)aO:Disconnect()end end)end,[
B]=aF,[o]={l'Frame'{Size=UDim2.fromScale(1,1),[o]={l'UIGradient'{Color=A(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,D(ar)),ColorSequenceKeypoint.new(1,D(ar))}end),Transparency=A(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},l'Frame'{AnchorPoint=Vector2.
new(0,0.5),BackgroundColor3=e.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=A(function()return UDim2.fromScale(D(as),
0.5)end)}}},l'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[o]={L(P.LayoutOrder,Q.Horizontal,R.Left,S.Center
,UDim.new(0,4)),{l'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=e.text2
,BackgroundTransparency=1,TextSize=16,FontFace=H('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},l'TextBox'{Name=I(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',PlaceholderColor3=e
.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=e.text,Text=A(function()local aN={D(ar).R,D(ar).G,D(ar).B}for aO,aP
in aN do aN[aO]=math.floor(math.clamp(aP*255,0,255))end return table.concat(aN,', ')end),TextScaled=true,FontFace=H(
'Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[B]=az,[z'Changed']=
function(aN)local aO=D(az)if aN=='TextBounds'and aO and aO.TextBounds then aA:set(aO.TextBounds.X)end end,[z'FocusLost']
=function()local aN=D(az)local aO,aP=aN.Text:gsub(' ',''),{D(ar).R,D(ar).G,D(ar).B}for aQ,aR in aP do aP[aQ]=math.floor(
math.clamp(aR*255,0,255))end local aS,aT,aU=table.concat(aP,', '),pcall(function()local aS=string.split(aO,',')table.
foreach(aS,function(aT,aU)if not tonumber(aU)then return nil end aS[aT]=math.clamp(aU,0,255)end)return Color3.fromRGB(aS
[1],aS[2],aS[3])end)if aT and aU then ar:set(aU)aH:set(({D(ar):ToHSV()})[1])aI:set(({D(ar):ToHSV()})[2])aJ:set(({D(ar):
ToHSV()})[3])else aN.Text=aS end end,[o]={N(1,16),l'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(42
,16)},l'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=e.text2,Position=UDim2.fromScale(1,1),Size=E(function()
return UDim2.fromOffset(math.clamp(D(aA),0,110),2)end,40,1),[o]={O(0,1)}}}}}}},l'Frame'{Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,[o]={L(P.LayoutOrder,Q.Horizontal,R.Left,S.Center,UDim.new(0,5)),{l'TextLabel'{Size=UDim2.new(0
,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=e.text2,BackgroundTransparency=1,TextSize=16,FontFace
=H('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Right},l'TextBox'{Name=I(8),
BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.AutomaticSize.X,PlaceholderText='HSV',
PlaceholderColor3=e.text2,TextColor3=e.text,Text=A(function()local aN={D(ar):ToHSV()}for aO,aP in aN do aN[aO]=math.
floor(aP*100)/100 end return table.concat(aN,', ')end),TextScaled=true,FontFace=H('Montserrat',Enum.FontWeight.Bold),
ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[B]=ax,[z'Changed']=function(aN)local aO=D(ax)if aN==
'TextBounds'and aO and aO.TextBounds then ay:set(aO.TextBounds.X)end end,[z'FocusLost']=function()local aN=D(ax)local aO
,aP=aN.Text:gsub(' ',''),{D(ar):ToHSV()}for aQ,aR in aP do aP[aQ]=math.floor(aR*100)/100 end local aS,aT,aU=table.
concat(aP,', '),pcall(function()local aS=string.split(aO,',')table.foreach(aS,function(aT,aU)if not tonumber(aU)then
return nil end end)return Color3.fromHSV(unpack(aS))end)if aT and aU then ar:set(aU)aH:set(({D(ar):ToHSV()})[1])aI:set((
{D(ar):ToHSV()})[2])aJ:set(({D(ar):ToHSV()})[3])else aN.Text=aS end end,[o]={N(1,16),l'UISizeConstraint'{MaxSize=Vector2
.new(110,16),MinSize=Vector2.new(36,16)},l'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=e.text2,Position=UDim2
.fromScale(1,1),Size=E(function()return UDim2.fromOffset(math.clamp(D(ay),36,110),2)end,40,1),[o]={O(0,1)}}}}}}}}}end q(
ai):onChange(function()if not D(ai)and typeof(aK)=='Instance'then aK:Destroy()end end)l'Frame'{Interactable=A(function()
if not D(ai)then return false end return D(at)end),Visible=A(function()if D(W.string)~=''and not string.find(D(ag):
lower(),D(W.string):lower())or not D(an)then return false end return true end),Parent=af,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,BackgroundColor3=e.background2,[o]={O(6),l'Frame'{ZIndex=3,Visible=A(function()if not D(ai)then
return true end return false end),BackgroundTransparency=E(function()return D(at)and 0.2 or 1 end,40,1),BackgroundColor3
=e.disabledBackground,Size=UDim2.fromScale(1,1),[o]={O(6),l'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=f.lock,ImageColor3=e.disabledText,
ImageTransparency=au},l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=e.disabledText,TextTransparency=au,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=aj,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[o]={M(0,5)}}}},l'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[o]={L(P.LayoutOrder,Q.Horizontal,R.Left,S.Bottom,UDim.new(0,3)),l'Frame'{Size=
UDim2.new(1,-103,1,0),BackgroundColor3=e.background2,BackgroundTransparency=au,[o]={M(9,8),O(6),L(P.LayoutOrder,Q.
Horizontal,R.Left,S.Top),l'TextLabel'{FontFace=H('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),
BackgroundTransparency=1,TextColor3=e.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),
Text=ag,TextTransparency=au,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},l'TextButton'{Interactable=A(
function()if not D(ai)then return false end return D(at)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=e.background2,
BackgroundTransparency=au,[z'Activated']=function()if typeof(D(Z.module))=='Instance'then D(Z.module):Destroy()end aK,aL
=ac(ab.Parent.module)(aM())Z:update('module',aK)end,[o]={M(0,8),O(6),L(P.LayoutOrder,Q.Horizontal,R.Right,S.Center,UDim.
new(0,5)),l'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[o]={L(P.LayoutOrder,Q.Horizontal,R.Right,S.
Center,UDim.new(0,4)),l'TextBox'{Interactable=A(function()if not D(ai)then return false end return D(at)end),Name=I(8),
BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',PlaceholderColor3=e.text2,TextColor3=e.text,
TextTransparency=au,Text=A(function()return'#'..D(ar):ToHex()end),TextScaled=true,FontFace=H('Montserrat',Enum.
FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[z'Changed']=function(aN)local aO=D(av)
if aN=='TextBounds'and aO and aO.TextBounds then aw:set(aO.TextBounds.X)end end,[z'FocusLost']=function()local aN=D(av)
local aO=aN.Text:gsub('[^%w#]','')if not string.find(aO,'#')then aO='#'..aO end if string.len(aO)~=7 then aN.Text='#'..
D(ar):ToHex()else local aP,aQ=pcall(function()return Color3.fromHex(aO)end)if aP then ar:set(aQ)else aN.Text='#'..D(ar):
ToHex()end end end,[B]=av,[o]={N(1,16),l'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=e.text2,
BackgroundTransparency=E(function()if D(at)then return 0.5 end return 1 end,40,1),Position=UDim2.fromScale(1,1),Size=E(
function()return UDim2.fromOffset(math.clamp(D(aw),0,98),2)end,40,1),[o]={O(0,1)}}}}}},l'ImageLabel'{Size=UDim2.
fromOffset(24,24),Image=f.paint,ImageColor3=ar,BackgroundTransparency=1,ImageTransparency=E(function()return not D(at)
and 1 or D(as)end,40,1),[o]={O(6)}}}}}}}}J.add(i.Heartbeat:Connect(function()if D(aC)then local aN=D(aB)local aO=j:
GetMouseLocation()-aN.AbsolutePosition-Vector2.new(0,D(Y.number))aO=Vector2.new(math.clamp(aO.X,0,aN.AbsoluteSize.X),
math.clamp(aO.Y,0,aN.AbsoluteSize.Y))aI:set(aO.X/aN.AbsoluteSize.X)aJ:set((aN.AbsoluteSize.Y-aO.Y)/aN.AbsoluteSize.Y)ar:
set(Color3.fromHSV(D(aH),D(aI),D(aJ)))end if D(aE)then local aN=D(aD)local aO=j:GetMouseLocation()-aN.AbsolutePosition-
Vector2.new(0,D(Y.number))aO=Vector2.new(math.clamp(aO.X,0,aN.AbsoluteSize.X),0)aH:set((aN.AbsoluteSize.X-aO.X)/aN.
AbsoluteSize.X)ar:set(Color3.fromHSV(D(aH),D(aI),D(aJ)))end if D(aG)then local aN=D(aF)local aO=j:GetMouseLocation()-aN.
AbsolutePosition-Vector2.new(0,D(Y.number))aO=Vector2.new(math.clamp(aO.X,0,aN.AbsoluteSize.X),0)as:set(aO.X/aN.
AbsoluteSize.X)end end))if D(X.boolean)and not D(al)then q(aq.file):onChange(function()local aN,aO,aP=D(aq.file),true,
true if aN.color~=nil then local aQ=string.split(aN.color:gsub(' ',''),',')table.foreach(aQ,function(aR,aS)aQ[aR]=
tonumber(aS)end)ar:set(Color3.new(unpack(aQ)))aO=false end if aN.transparency~=nil then as:set(tonumber(aN.transparency)
)aP=false end if aO then ar:set(D(ak))end if aP then as:set(D(am))end aH:set(({D(ar):ToHSV()})[1])aI:set(({D(ar):ToHSV()
})[2])aJ:set(({D(ar):ToHSV()})[3])end)if aq.private then ar:set(D(ak))as:set(D(am))end else ar:set(D(ak))as:set(D(am))
end aH:set(({D(ar):ToHSV()})[1])aI:set(({D(ar):ToHSV()})[2])aJ:set(({D(ar):ToHSV()})[3])local aN={}function aN.SetName(
aO,aP)local aQ,aR=F({SetName=aP},{SetName=''})assert(aQ,table.concat(aR,'\n'))ag:set(aP)end function aN.SetColor(aO,aP)
local aQ,aR=F({SetColor=aP},{SetColor=Color3.new()})assert(aQ,table.concat(aR,'\n'))ar:set(aP)aH:set(({D(ar):ToHSV()})[1
])aI:set(({D(ar):ToHSV()})[2])aJ:set(({D(ar):ToHSV()})[3])end function aN.SetTransparency(aO,aP)local aQ,aR=F({
SetTransparency=aP},{SetTransparency=0})assert(aQ,table.concat(aR,'\n'))as:set(aP)end function aN.Enable(aO)ai:set(true)
end function aN.Disable(aO)ai:set(false)end function aN.Visible(aO)an:set(true)end function aN.Invisible(aO)an:set(false
)end return aN end end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.Parent.Parent
return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj
.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,aq,ar,as,at=ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af
.Parent local au=am(ap(ar.string)==ap(as.tab).uid)an(ar.string):onChange(function()au:set(ap(ar.string)==ap(as.tab).uid)
end)local av=aq(function()return ap(au)and 0 or 1 end,40,1)ak'Frame'{Parent=at,Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=av}}}end end)()end,[68]=function()local aa,ab,ac=a(
68)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al
=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.
Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.typecheck,at.customFont
,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH=ay.UIListLayout,ay.UIPadding,ay.UICorner,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name='',DisabledText='',FLAG='',Visible=false,
IsEnabled=false,Callback=function()end,Items={},Multiselect=true,Regex=function()end,IgnoreConfig=true,Alphabetical=true
},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.Visible and''or'Visible',af.IsEnabled and''or
'IsEnabled',af.Multiselect and''or'Multiselect',af.Regex and''or'Regex',af.IgnoreConfig and''or'IgnoreConfig',af.
Alphabetical and''or'Alphabetical'})assert(aG,table.concat(aH,'\n'))aG,aH=aw(af,{Default=af.Multiselect and{}or''},{af.
Default and''or'Default'})assert(aG,table.concat(aH,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string',
'The Regex function must always return a string')end local aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,b,c,d=ah.find
'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,ao{},af.Multiselect or ao(
false),af.Default,af.Visible or ao(true),af.IgnoreConfig or ao(false),af.IsEnabled or ao(true),af.Alphabetical or ao(
false),af.DisabledText or ao'Component Disabled',af.Regex or ao(function(aI)return aI end)local e,f=(af.FLAG or ao(aL.
uid))if au(e)~=''then f=ak.register(au(e),{items=ao{},item=ao'',multiselect=au(aQ)},'dropdown',au(e)==aL.uid)f.user.
Value=au(aQ)and au(f.status.items)or au(f.status.item)end local g,h,i,j,k,l,o=ao(),ao(),ao(false),ao(au(aQ)and{}or''),ao
{},{},ao(false)ap(f.status.items):onChange(function()if#au(f.status.items)==#au(aP)then o:set(true)else o:set(false)end
local p={}for q,z in au(f.status.items)do table.insert(p,au(d)(z))end task.wait()task.spawn(au(aO),p)j:set(au(f.status.
items))end)ap(f.status.item):onChange(function()task.wait()task.spawn(au(aO),au(d)(au(f.status.item)))j:set(au(d)(au(f.
status.item)))end)local p=ao(au(aI.string)==au(aL.tab).uid)ap(aI.string):onChange(function()p:set(au(aI.string)==au(aL.
tab).uid)end)local q=av(function()return au(p)and 0 or 1 end,40,1)am'Frame'{Parent=aM,Visible=ar(function()if au(aK.
string)~=''and not string.find(au(aN):lower(),au(aK.string):lower())or not au(aS)then return false end return true end),
Size=av(function()if au(i)and au(g)then local z,A=au(g),3 for B,C in z:GetChildren()do if C:IsA'UIListLayout'or C:IsA
'UICorner'or not C.Visible then continue end A+=(4+C.Size.Y.Offset)end return UDim2.new(1,0,0,A)end return UDim2.new(1,0
,0,36)end,40,1),BackgroundColor3=ai.background2,BackgroundTransparency=q,ClipsDescendants=true,[as]=g,[an]={aB(6),az(aC.
LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(0,4)),am'TextButton'{Interactable=ar(function()if not au(aU)then
return false end return au(p)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[aq'Activated']=function()i:set(not
au(i))end,[an]={am'Frame'{ZIndex=2,Visible=ar(function()if not au(aU)then return true end return false end),
BackgroundTransparency=av(function()return au(p)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=q},am'TextLabel'{
FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=q,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ar(
function()return au(c)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aA(0,5)}}}},am'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[an]={aA(8),am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=
UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(aQ)then return au(aN)..' '..tostring(#au(f.status.items))..'/'..
tostring(#au(aP))end if typeof(au(j))=='table'then return au(aN)end if l[au(j)]then return`{au(aN)}: {l[au(j)]}`end
return`{au(aN)}: {au(j)}`end),TextTransparency=q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{
Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image
=ar(function()return au(aQ)and aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=q}}}}},
am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,[an]={aA(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),
BackgroundColor3=ai.background,BackgroundTransparency=q,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextXAlignment=
Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,
TextTransparency=q,[as]=h,[aq'Changed']=function(z)local A=au(h)if z=='Text'and A and A.Text then local B=A.Text for C,D
in au(k)do if string.find(au(d)(D.Name):lower(),B:lower())or B==''then D.Visible=true else D.Visible=false end end end
end,[an]={am'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},aB(4),aA(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32
),BackgroundTransparency=1,Visible=aQ,[an]={aA(6,6,0,6),am'TextButton'{Interactable=aQ,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=q,BackgroundColor3=ai.background,[aq'Activated']=function()local z={}if not au(o)then for A,B in
au(aP)do B=typeof(B)=='table'and B.Value or B table.insert(z,au(d)(B))end end f.status.items:set(z)end,[an]={aB(4),aA(8)
,am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if
au(o)then return'Deselect All'end return'Select All'end),TextTransparency=q,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=ar(function()return UDim2.new(1,0,0,math.clamp((#au(aP)*34),34,136))
end),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.
Y,[an]={aA(6,6,0,6),az(au(b)and aC.Name or aC.LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(0,6)),k}}}}ap(aP):
onChange(function()local z={}for A,B in au(aP)do local C,D,E,F=(ao(false))if typeof(B)=='table'then local H,I=aw(B,{
DisplayValue='',Value='',Image=''},{B.Image and''or'Image',B.DisplayValue and''or'DisplayValue'})assert(H,table.concat(I
,'\n'))D=B.Value E=B.Image or nil F=B.DisplayValue or nil else local H,I=aw({Item=B},{Item=''})assert(H,table.concat(I,
'\n'))D=B end local H=au(d)(D)if F then l[D]=F end ap(f.status.items):onChange(function()if table.find(au(f.status.items
),H)then C:set(true)else C:set(false)end end)ap(f.status.item):onChange(function()if au(f.status.item)==H then C:set(
true)else C:set(false)end end)local I=am'TextButton'{Name=`{F~=nil and F or D}`,Size=UDim2.new(1,0,0,28),
BackgroundTransparency=q,BackgroundColor3=ai.background,[aq'Activated']=function()if au(aQ)then local I=au(f.status.
items)C:set(not au(C))if au(C)then table.insert(I,H)else table.remove(I,table.find(I,H))end f.status.items:set(I)else f.
status.item:set(H)i:set(false)end end,[an]={aB(4),aA(8),az(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,6))
,am'Frame'{Visible=ar(function()return au(aQ)and true or false end),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=q,BackgroundColor3=av(function()return au(C)and ai.get
'toggled'or ai.get'selectedTab'end,40,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=av(function()if
not au(p)then return 1 end if au(C)then return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},am'ImageLabel'{
Visible=ar(function()return E and true or false end),Size=UDim2.fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=E,ImageTransparency=q,ImageColor3=ai.text2},am'TextLabel'{
FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=ar(function()return au(aQ)and UDim2.new(1,-48,0,16)or UDim2.new(1,-
24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,0,0.5,0),Text=F or D,TextTransparency=q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(z,I)
end k:set(z)end)aP:set(au(af.Items))if au(aJ.boolean)and not au(aT)then ap(f.file):onChange(function()local z,A=au(f.
file),true if z~=nil then A=false end if au(aQ)then f.status.items:set(z)else f.status.item:set(z)end if A then if au(aQ
)then if aR and#au(aR)>0 then f.status.items:set(au(aR))end else if aR then f.status.item:set(au(aR))end end end end)if
f.private then if au(aQ)then if aR and#au(aR)>0 then f.status.items:set(au(aR))end else if aR then for z,A in au(aP)do
if typeof(A)=='table'and A.Value==au(aR)then f.status.item:set(au(aR))elseif A==au(aR)then f.status.item:set(au(aR))end
end end end end else if au(aQ)then if aR and#au(aR)>0 then f.status.items:set(au(aR))end else if aR then f.status.item:
set(au(aR))end end end local z={}function z.SetName(A,B)local C,D=aw({SetName=B},{SetName=''})assert(C,table.concat(D,
'\n'))aN:set(B)end function z.SetItems(A,B)local C,D=aw({SetItems=B},{SetItems={}})assert(C,table.concat(D,'\n'))aP:set(
B)local E,F={},false for H,I in au(aP)do local J if typeof(I)=='table'then J=I.Value else J=I end local K=au(d)(J)if au(
aQ)then if typeof(au(j))=='table'and table.find(au(j),K)then table.insert(E,K)F=true end else if au(j)==K then F=true f.
status.item:set(K)break end end end if F then if au(aQ)then f.status.items:set(E)end end end function z.SelectItem(A,B)
assert(not au(aQ),':SelectItem requires Multiselect to be false')local C,D=aw({SelectItem=B},{SelectItem=''})assert(C,
table.concat(D,'\n'))local E=false for F,H in au(aP)do local I=H if typeof(H)=='table'then I=H.Value end local J=au(d)(B
)if au(d)(I)==J then E=true break end end assert(E,":SelectItem couldn't find "..B)f.status.item:set(B)end function z.
SelectItems(A,B)assert(au(aQ),':SelectItems requires Multiselect to be true')local C,D=aw({SelectItems=B},{SelectItems={
}})assert(C,table.concat(D,'\n'))for E,F in B do local H=false for I,J in au(aP)do local K=typeof(J)=='table'and au(d)(J
.Value)or au(d)(J)if F==K then H=true break end end if H then B[E]=au(d)(F)else table.remove(B,E)end end f.status.items:
set(B)end function z.Enable(A)aU:set(true)end function z.Disable(A)aU:set(false)end function z.Visible(A)aS:set(true)end
function z.Invisible(A)aS:set(false)end return z end end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.
themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an
.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au
.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,
aN=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(af,{Name='',DisabledText='',FLAG='',Visible=false,
IsEnabled=false,Callback=function()end,Bind=Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.
FLAG and''or'FLAG',af.Visible and''or'Visible',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind',af.IgnoreConfig and
''or'IgnoreConfig'})assert(aM,table.concat(aN,'\n'))local aO,aP,aQ,aR,aS,aT,aU,b,c,d,e,f,g,h,i,j,k,l=ah.find
'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.
find'isListening',ah.find'bindData',ah.add(af),af.Parent,af.Name,af.Callback,af.Bind,af.Visible or aq(true),af.IsEnabled
or aq(true),af.DisabledText or aq'Component Disabled',af.IgnoreConfig or aq(false),aq()local function o(p:EnumItem,q:
string)local z,A=av(aP.binds),av(b.bindData)if table.find(z,p)then aL(('Key %s is already in use. %s'):format(p.Name,q))
else table.insert(z,p)if av(l)then table.remove(z,table.find(z,av(l)))A[av(l).Name]=nil end l:set(p)A[av(l).Name]={bind=
av(l),name=av(e)}b:update('bindData',A)aP:update('binds',z)end end local p,q=(af.FLAG or aq(c.uid))if av(p)~=''then q=ak
.register(av(p),{coordinate=aq(Vector2.new(0,0)),keycode=aq(nil),mobile=av(aS.boolean)},'keybind',av(p)==c.uid)q.user.
Value=av(aS.boolean)and av(q.status.coordinate)or av(q.status.keycode)end ar(q.status.keycode):onChange(function()if av(
l)and av(l).Name==av(q.status.keycode)then return end local z,A=pcall(function()return Enum.KeyCode[av(q.status.keycode)
]end)if z then o(A,'RAHHH')end end)ar(l):onChange(function()q.status.keycode:set(av(l).Name)end)local z=aq(av(aO.string)
==av(c.tab).uid)ar(aO.string):onChange(function()z:set(av(aO.string)==av(c.tab).uid)end)local A,B=aw(function()return
av(z)and 0 or 1 end,40,1),aq(false)local C=am.InputBegan:Connect(function(C,D)if av(aS.boolean)then return end if av(B)
then if C.KeyCode and C.KeyCode~=Enum.KeyCode.Unknown then o(C.KeyCode,'From input box')end B:set(false)task.wait()aU:
update('boolean',false)else if C.KeyCode and C.KeyCode==av(l)and not D and not av(aU.boolean)and av(i)then task.spawn(
av(f))end end end)ay.add(C)local D=aq(false)local function E(F)for H,I in Enum.KeyCode do if I.Name and I.Name==F then
return I end end return nil end local F,H H=ao'TextButton'{Visible=at(function()if not av(i)then return av(i)end return
av(D)end),Parent=aA.get(av(aT.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text=e,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if
F then F:Disconnect()F=nil q.status.coordinate:set(H.AbsolutePosition)else task.spawn(av(f))end end,[ap]={aD(4),aE(16),
aF(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=av(aS.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=d,Visible=at(function()if av(aR.string)~=''and not string.
find(av(e):lower(),av(aR.string):lower())or not av(h)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(i)then return true end return false end
),BackgroundTransparency=aw(function()return av(z)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=A},ao
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=A,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=at(function()return av(j)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=at(function()if not av(i)then return false end return av(z)end),Size=UDim2.new(0.225,0,1,
0),BackgroundColor3=ai.background2,BackgroundTransparency=A,[as'Activated']=function()if av(aS.boolean)then D:set(true)F
=aB(H,15)return end B:set(true)aU:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK
.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(aS.boolean
)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=A},ao'TextLabel'{Visible=not av(aS.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=A,Text=at(function()return av(B)and
'Listening'or av(l)and av(l).Name or'Waiting'end)},ao'TextLabel'{Visible=av(aS.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(D)and'Move Bind'or'Place Bind'end),
TextTransparency=A}}},ao'TextButton'{Visible=D,Interactable=at(function()if not av(i)then return false end return av(z)
end),Size=UDim2.fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=A,[as'Activated']=function()D:
set(false)H.Position=UDim2.fromScale(0.5,0.5)q.status.coordinate:set(H.AbsolutePosition)end,[ap]={aE(6),ao'ImageLabel'{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1
,Image=aj.close,ImageColor3=ai.red,ImageTransparency=A}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(D)and-42
or-3,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=A,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=e,TextTransparency=A,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(aQ.boolean)and not av(k)then ar(q.file):onChange(function()local I,
J=av(q.file),true if I.keycode~=nil then q.status.keycode:set(I.keycode)J=false end if J then if g then q.status.keycode
:set(av(g).Name)end end end)if q.private then if g then q.status.keycode:set(av(g).Name)end end else if g then q.status.
keycode:set(av(g).Name)end end local I={}function I.SetName(J,K)local L,M=ax({SetName=K},{SetName=''})assert(L,table.
concat(M,'\n'))e:set(K)end function I.SetBind(J,K:EnumItem)local L,M=ax({SetBind=K},{SetBind=Enum.keyCode.C})assert(L,
table.concat(M,'\n'))o(K,'At :SetBind')end function I.Enable(J)i:set(true)end function I.Disable(J)i:set(false)end
function I.Visible(J)h:set(true)end function I.Invisible(J)h:set(false)end return I end end)()end,[70]=function()local
aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Computed,ak
.Observer,ak.OnEvent,ac(ae.simpleElements)local as,at,au,av,aw,ax,ay,az,aA=ar.UICorner,ar.UIPadding,ar.
UITextSizeConstraint,ar.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ae.utilities)local aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM=aA.get,aA.animate,aA.getStringBounds,aA.customFont,ah.find
'selectedTab',ah.find'searchText',ah.find'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an'Active Keybinds',an''
local aN=an(aB(aF.string)==aB(aJ.tab).uid)ap(aF.string):onChange(function()aN:set(aB(aF.string)==aB(aJ.tab).uid)end)
local aO,aP=aC(function()return aB(aN)and 0 or 1 end,40,1),an(0)task.spawn(function()aP:set(aD(aB(aM),{Font=aE(
'Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end)aB(aK).Changed:Connect(
function(aQ)if aQ:lower()=='absolutesize'then aP:set(aD(aB(aM),{Font=aE('Montserrat',Enum.FontWeight.Medium),Size=16,
Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end end)ap(aM):onChange(function()aP:set(aD(aB(aM),{Font=aE('Montserrat',
Enum.FontWeight.Bold),Size=16,Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end)local function aQ(aR)local aS={}table.
foreach(aR,function(aT,aU)aS[aT]=aU.Name end)return table.concat(aS,', ')end local aR,aS,aT=(an'Active Keybinds')aT,aS=
ac(ab.Parent.module){Name=aR,Children={}}local function aU(b)local c,d={av(aw.LayoutOrder,ax.Vertical,ay.Center,az.Top,
UDim.new(0,5))},aB(aI.bindData)for e,f in aB(aH.binds)do local g=d[f.Name]table.insert(c,al'TextLabel'{Size=UDim2.new(1,
0,0,14),BackgroundTransparency=1,TextColor3=ai.text,FontFace=aE('Montserrat',Enum.FontWeight.Regular),TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,Text=ao(function()if g.boolean then return`[{g.bind.Name}] {g.name} (<i>{string.
upper(tostring(aB(g.boolean)))}</i>)`end return`[{g.bind.Name}] {g.name}`end)})end aS(c)end al'TextButton'{Visible=ao(
function()if aB(aG.string)~=''and not string.find(aB(aL):lower(),aB(aG.string):lower())and not string.find(aB(aM):lower(
),aB(aG.string):lower())then return false end return true end),BackgroundColor3=ai.background2,Parent=aK,
BackgroundTransparency=aO,Size=ao(function()return UDim2.new(1,0,0,36+aB(aP))end),AutomaticSize=Enum.AutomaticSize.Y,[aq
'Activated']=function()if typeof(aT)=='Instance'then aT:Destroy()aT=nil end aT,aS=ac(ab.Parent.module){Name=aR,Children=
{}}aU(aB(aH.binds))end,[am]={as(6),at(6),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,
Image=aj.command,ImageColor3=ai.text2,ImageTransparency=aO},al'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,-
25,0,18),Position=UDim2.fromOffset(25,0),BackgroundTransparency=1,TextTransparency=aO,TextXAlignment=Enum.TextXAlignment
.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=aE('Montserrat',Enum.FontWeight.Bold),
TextColor3=ai.text,Text=aL,[am]={au(1,18)}},al'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.
fromOffset(4,25),BackgroundTransparency=1,TextTransparency=aO,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextSize=16,FontFace=aE('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,Text=aM,Size=
ao(function()return UDim2.new(1,-4,0,aB(aP))end)}}}ap(aH.binds):onChange(function()aU(aB(aH.binds))end)aU(aB(aH.binds))
aM:set(aQ(aB(aH.binds)))ap(aH.binds):onChange(function()aM:set(aQ(aB(aH.binds)))end)end end)()end,[71]=function()local
aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae
.simpleElements)local aq,ar,as=ap.UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate
,as.customFont local ax,ay=au(af,{Text='',Visible=false},{af.Visible and''or'Visible'})assert(ax,table.concat(ay,'\n'))
local az,aA,aB,aC,aD,aE=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Text,af.Visible or am(true)
local aF=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function()aF:set(at(az.string)==at(aB.tab).uid)end)
local aG=av(function()return at(aF)and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if at(aA.string)~=''and not string
.find(at(aD):lower(),at(aA.string):lower())or not at(aE)then return false end return true end),Size=UDim2.new(1,0,0,36),
Parent=aC,BackgroundTransparency=aG,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak'TextLabel'{FontFace=aw(
'Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=aG,Size=UDim2
.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,
TextColor3=ai.text,Text=an(function()return at(aD)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}
local aH={}function aH.SetText(aI,aJ)local aK,aL=au({SetText=aJ},{SetText=''})assert(aK,table.concat(aL,'\n'))aD:set(aJ)
end function aH.Visible(aI)aE:set(true)end function aH.Invisible(aI)aE:set(false)end return aH end end)()end,[72]=
function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.
Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local as,at,au,av,aw,ax,ay,az=ar.get,ar.animate,ar.typecheck,ar
.customFont,ar.drag,ar.references,ar.connections,ac(ae.simpleElements)local aA,aB,aC,aD,aE,aF,aG,aH,aI=az.UIListLayout,
az.UIPadding,az.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,au(af,{Name={
},Children={}},{})assert(aH,table.concat(aI,'\n'))local aJ,aK,aL,aM=ah.find'instanceName',ah.find'absoluteOffset',af.
Name,an(af.Children)local aN,aO,aP=ax.get(as(aJ.name)),(an(false))aP=al'TextButton'{Parent=aN,Size=UDim2.fromOffset(240,
11),Position=UDim2.fromOffset(10,10+as(aK.number)),BackgroundTransparency=1,[ap'MouseButton1Down']=function()aO:set(true
)end,[am]={al'Frame'{Position=UDim2.new(0.5,-120,0,0),Size=UDim2.fromOffset(240,0),BackgroundColor3=ai.background2,
AutomaticSize=Enum.AutomaticSize.Y,[am]={aC(4),aB(8),al'TextButton'{AnchorPoint=Vector2.new(1,0),Position=UDim2.
fromScale(1,0),Size=UDim2.fromOffset(32,32),BackgroundColor3=ai.selectedTab,[ap'Activated']=function()aP:Destroy()end,[
am]={aC(6),al'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30
),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,[am]={aA(aD.LayoutOrder,aE.Vertical,aF.Center,aG.Top,UDim.
new(0,8)),al'Frame'{Size=at(function()return as(aO)and UDim2.new(0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),
BackgroundColor3=ai.text2,BackgroundTransparency=at(function()return as(aO)and 0 or 0.5 end,40,1),[am]={aC(6)}},al
'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,[am]={al'TextLabel'{Size=
UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=av('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,
TextScaled=true,Text=aL,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'Frame'{Size=UDim2.new(1,0,0,0),
Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,[am]=aM}}}}}}}}}local aQ,aR=
aw(aP,15)local aS=aR:Connect(function()aO:set(false)end)ay.add(aQ)ay.add(aS)aP.Destroying:Once(function()aQ:Disconnect()
aS:Disconnect()end)return aP,function(...)aM:set(...)end end end)()end,[73]=function()local aa,ab,ac=a(73)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.
Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,ac(ae.utilities)local ap,aq,ar,as,at,
au=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD
=au.UICorner,au.UIPadding,au.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,at(af,{Title='',Body='',Duration=1,Image='',ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{af.Image and
''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'})assert(aC,table.concat(aD,'\n'))local aE,aF,
aG,aH,aI,aJ,aK,aL,aM,aN,aO=am(af.Title),am(af.Body),am(af.Duration),am(af.Image or''),af.ImageColor and am(af.ImageColor
)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250)local aP=am(ar(ap(aF),{Size=14,Font=as(
'Montserrat',Enum.FontWeight.Medium),Width=ap(aO)-8-(aH and 32 or 0)}))local aQ=am(20+math.clamp(ap(aP).Y+4+10+(#ap(aJ)>
0 and 26 or 0),#ap(aJ)>0 and 56 or 30,9e9))local function aR(aS,aT)local aU=1 for b=1,aS do aU=aU*10 end local b=
tostring(math.round(aT*aU)/aU)local c=string.split(b,'.')if#c==1 then local d=''for e=1,aS do d=d..'0'end b=b..'.'..d
end return b end local aS,aT={}for aU,b in ap(aJ)do local c,d=at({Button=b},{Button={}})assert(c,table.concat(d,'\n'))c,
d=at(b,{Name='',Callback=function()end})assert(c,table.concat(d,'\n'))local e,f=b.Name,b.Callback local g=aj'TextButton'
{Size=UDim2.new(1/#ap(aJ),-2,1,-4),TextSize=14,Text=e,FontFace=as('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=ah
.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(f)aL:set(false)task.wait(0.4)aK:set(false)
task.delay(0.3,function()aM:set(true)end)task.wait(2)aT:Destroy()end,[al]={av(4)}}table.insert(aS,g)end aT=aj'Frame'{
Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(aO),ap(aK)and ap(aQ)+5 or 0)end,
30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(aM)end),Interactable=aL,AnchorPoint=
Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.fromOffset(ap(aO),ap(aQ)),[ak
'Activated']=function()aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)aT:
Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=UDim2.fromOffset(ap(aO),ap(aQ))
,Position=aq(function()return UDim2.fromScale(ap(aL)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),ax(ay.LayoutOrder,az.
Horizontal,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=ap(aH)~=''and true or false,Size=UDim2.new(0,24,1,0)
,BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=aH,ImageColor3=aI}}},aj'Frame'{Size=UDim2.new(1,ap(aH)~=''and-28
or 0,1,0),BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj'TextLabel'{Size=UDim2.
new(1,0,0,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment
.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aE},aj'TextLabel'{Size=UDim2.new(1,0,0,1),AutomaticSize=Enum.
AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Medium
),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,RichText=
true,TextColor3=ah.text2,Text=aF},aj'Frame'{Visible=an(function()return#ap(aJ)>0 and true or false end),Size=UDim2.new(1
,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,UDim.new(0,2)),aS}},aj
'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=aN,TextColor3=ah.text,
TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()aL:set(true
)end)task.spawn(function()repeat task.wait()until ap(aL)local c,d=(tick())repeat d=tick()-c aN:set(aR(1,math.clamp(d,0,
ap(aG))))task.wait()until d>ap(aG)end)task.spawn(function()aK:set(true)repeat task.wait()until ap(aL)task.wait(ap(aG))
task.wait(0.2)aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)aT:Destroy()
end)end end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.
Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap.UIPadding,ap.
UITextSizeConstraint,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.customFont,at.
typecheck local az,aA=ay(af,{Title='',Visible=false,Body=''},{af.Visible and''or'Visible'})assert(az,table.concat(aA,
'\n'))local aB,aC,aD,aE,aF,aG,aH=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body,af.
Visible or am(true)local aI=am(au(aB.string)==au(aD.tab).uid)ao(aB.string):onChange(function()aI:set(au(aB.string)==au(
aD.tab).uid)end)local aJ,aK=av(function()return au(aI)and 0 or 1 end,40,1),am(0)task.spawn(function()aK:set(aw(au(aG),{
Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)au(aE).Changed:
Connect(function(aL)if aL:lower()=='absolutesize'then aK:set(aw(au(aG),{Font=ax('Montserrat',Enum.FontWeight.Medium),
Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end end)ao(aG):onChange(function()aK:set(aw(au(aG),{Font=ax(
'Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function
()if au(aC.string)~=''and not string.find(au(aF):lower(),au(aC.string):lower())and not string.find(au(aG):lower(),au(aC.
string):lower())or not au(aH)then return false end return true end),BackgroundColor3=ai.background2,Parent=aE,
BackgroundTransparency=aJ,Size=an(function()return UDim2.new(1,0,0,36+au(aK))end),AutomaticSize=Enum.AutomaticSize.Y,[al
]={aq(6),ar(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,
TextTransparency=aJ,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=18,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aF,[al]={as(1,18)}},ak'TextLabel'{
Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=aJ,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=ax('Montserrat',Enum
.FontWeight.Medium),TextColor3=ai.text2,Text=aG,Size=an(function()return UDim2.new(1,-4,0,au(aK))end)}}}local aL={}
function aL.SetBody(aM,aN)local aO,aP=ay({SetBody=aN},{SetBody=''})assert(aO,table.concat(aP,'\n'))aG:set(aN)end
function aL.SetTitle(aM,aN)local aO,aP=ay({SetTitle=aN},{SetTitle=''})assert(aO,table.concat(aP,'\n'))aF:set(aN)end
function aL.Visible(aM)aH:set(true)end function aL.Invisible(aM)aH:set(false)end return aL end end)()end,[75]=function()
local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.UserInputService,al.
RunService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref
,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.typecheck,aw.customFont,ac(ae.simpleElements)local aC,aD,aE,
aF,aG,aH,aI,aJ,aK=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,az(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max
=0,DisplayAsPercent=false,DecimalPlace=0,Visible=false,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG
and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.
Visible and''or'Visible',af.DisplayAsPercent and''or'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace',af.
IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.concat(aK,'\n'))local aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,b,c,d,e,f=ah.
find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.Max,af.Min,af.
DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IsEnabled or ar(true),af.DisabledText or ar
'Component Disabled',af.IgnoreConfig or ar(false),af.Visible or ar(true)local g=ax(af.Default)and ar(math.clamp(ax(af.
Default),ax(aT),ax(aS)))if not ax(g)then g=ar(ax(aT))end local h,i=(af.FLAG or ar(aO.uid))if ax(h)~=''then i=ak.
register(ax(h),{percentageOf=ar(ax(aT))},'slider',ax(h)==aO.uid)i.user.Value=ax(i.status.percentageOf)end local j=ar(ax(
aL.string)==ax(aO.tab).uid)as(aL.string):onChange(function()j:set(ax(aL.string)==ax(aO.tab).uid)end)local k=ay(function(
)return ax(j)and 0 or 1 end,40,1)local function l(o,p,q,z,A)return(1-((o-p)/(q-p)))*z+((o-p)/(q-p))*A end local function
o(p)if ax(b)==0 then return math.floor(p)end return tonumber(string.format('%.'..ax(b)..'f',p))end local p=ar(0)as(i.
status.percentageOf):onChange(function()p:set(l(ax(i.status.percentageOf),ax(aT),ax(aS),0,1))if not ax(c)then return end
task.spawn(ax(aR),ax(i.status.percentageOf))end)local q,z,A,B=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(function(C
)if(C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch)and ax(B)then B:set(
false)end end)ap'Frame'{Parent=aP,Visible=au(function()if ax(aN.string)~=''and not string.find(ax(aQ):lower(),ax(aN.
string):lower())or not ax(f)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.
background2,BackgroundTransparency=ay(function()if ax(j)then return 0 end return 1 end,40,1),[aq]={aE(6),ap'Frame'{
ZIndex=2,Visible=au(function()if not ax(c)then return true end return false end),BackgroundTransparency=ay(function()
return ax(j)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={aE(6),ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=k},ap'TextLabel'{FontFace=aA(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=k,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()
return ax(d)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={aC(aF.LayoutOrder,aG.Horizontal,aH.Left,aI.Center,UDim.new(0,6)
),aD(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=k,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=aQ,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aG.
Horizontal,aH.Left,aI.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),
aC(aF.LayoutOrder,aG.Vertical,aH.Right,aI.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aA('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=k,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(function()if ax(aU)then
return tostring(o(ax(p)*100))..'%'end return ax(i.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(C)local D=ax(A)if C=='AbsoluteSize'and D and D.
AbsoluteSize then z:set(D.AbsoluteSize.X)end end,[at'FocusLost']=function()local C=ax(A)if tonumber(C.Text)then i.status
.percentageOf:set(math.clamp(tonumber(C.Text),ax(aT),ax(aS)))else if ax(aU)then C.Text=tostring(o(ax(p)*100))..'%'end C.
Text=ax(i.status.percentageOf)end end,[av]=A,[aq]={aD(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(j)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(z),2)end,40,1),[aq]={aE(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(c)then return false
end return ax(j)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=function()B:set(true)
end,[at'TouchLongPress']=function()B:set(true)end,[at'InputBegan']=function(C)if C.UserInputType==Enum.UserInputType.
MouseButton1 or C.UserInputType==Enum.UserInputType.Touch and ax(q)then local D,E=am:GetMouseLocation().X,ax(q).Size.X.
Offset local F=D-(ax(q).AbsolutePosition.X+E)while ax(B)and task.wait()do local H=am:GetMouseLocation().X local I=math.
clamp(E+(H-D)+F,0,ax(q).AbsoluteSize.X)i.status.percentageOf:set(o(l(I,0,ax(q).AbsoluteSize.X,ax(aT),ax(aS))))an.
RenderStepped:Wait()end end end,[av]=q,[aq]={aD(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=k,[aq]={aE(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=k,Size=
ay(function()return UDim2.new(ax(p),0,0,4)end,40,1),[aq]={aE(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=k,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[aq]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ay(function()if ax(j)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if ax(aM.boolean)and not ax(e)then as(i.file):onChange(function()local C,D=ax(i.file),true if C~=nil
then i.status.percentageOf:set(C)D=false end if D then i.status.percentageOf:set(ax(g))end end)if i.private then i.
status.percentageOf:set(ax(g))end else i.status.percentageOf:set(ax(g))end local C={}function C.SetName(D,E)local F,H=
az({SetName=E},{SetName=''})assert(F,table.concat(H,'\n'))aQ:set(E)end function C.SetValue(D,E)local F,H=az({SetValue=E}
,{SetValue=0})assert(F,table.concat(H,'\n'))i.status.percentageOf:set(math.clamp(E,ax(aT),ax(aS)))end function C.Enable(
D)c:set(true)end function C.Disable(D)c:set(false)end function C.Visible(D)f:set(true)end function C.Invisible(D)f:set(
false)end return C end end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap
=aj.New,aj.Children,aj.Value,aj.Observer,aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,ap.animate,ap.typecheck,
ap.customFont,ac(ae.simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UIPadding,au.UICorner,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},{af.Image and''or
'Image'})assert(aC,table.concat(aD,'\n'))local aE,aF,aG,aH,aI,aJ,aK=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.
Parent,af.Name,(am(false))if af.Image then aK=af.Image aJ:set(true)end local aL=am(false)an(aE.string):onChange(function
()local aM=aq(aE.string)aL:set(aM==aG.uid)end)ak'TextButton'{Name=aG.uid,Parent=aH,Size=UDim2.new(1,0,0,36),
BackgroundColor3=ar(function()return aq(aL)and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=
function()aE:update('string',aG.uid)end,[al]={ax(4),aw(6),av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4
)),ak'ImageLabel'{Visible=aJ,BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=aK,
ImageTransparency=ar(function()return aq(aL)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=aq(aJ)and UDim2.new(1,-28,1)or
UDim2.fromScale(1,1),FontFace=at('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=aI,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=ar(function()return aq(aL)and 0 or 0.6
end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}if not aq(aF.boolean)then aF:update('boolean',
true)aE:update('string',aG.uid)end return aG end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(
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
,aF,aG,aH,aI=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum
.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',PlaceHolderText='',DisabledText='',ClearTextOnFocus=false,
OnlyNumbers=true,OnLeave=true,Visible=false,Default='',FLAG='',IsEnabled=false,Callback=function()end,IgnoreConfig=true}
,{af.PlaceHolderText and''or'PlaceHolderText',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.Visible and''or'Visible',af.DisabledText and''or'DisabledText',af.IgnoreConfig and''or'IgnoreConfig',af
.IgnoreConfig and''or'IgnoreConfig'})assert(aH,table.concat(aI,'\n'))local aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,b,c,d,e,f
=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or
ao(true),af.DisabledText or ao'Component Disabled',af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false
),af.ClearTextOnFocus or ao(false),af.IgnoreConfig or ao(false),af.IgnoreConfig or ao(false),af.PlaceHolderText or ao'',
af.Visible or ao(true)local g,h=(af.FLAG or ao(aM.uid))if au(g)~=''then h=ak.register(au(g),{correctText=ao''},'textbox'
,au(g)==aM.uid)h.user.Value=au(h.status.correctText)end local i=ao(au(aJ.string)==au(aM.tab).uid)aq(aJ.string):onChange(
function()i:set(au(aJ.string)==au(aM.tab).uid)end)local j,k,l,o,p,q,z=av(function()return au(i)and 0 or 1 end,40,1),ao()
,ao(false),ao'',ao(au(h.status.correctText)),ao'',ao(false)aq(o):onChange(function()if au(aS)then if tonumber(au(o))or
au(o)==''then p:set(au(o))end else p:set(au(o))end local A=au(k)A.Text=au(p)if au(aU)then return end if au(aS)then if(
tonumber(au(o))or au(o)=='')and au(q)~=au(o)then task.spawn(au(aP),au(o))h.status.correctText:set(au(o))q:set(au(o))end
else if au(q)==au(o)then return end task.spawn(au(aP),au(o))h.status.correctText:set(au(o))q:set(au(o))end end)aq(l):
onChange(function()if au(aU)and not au(l)then if au(aS)then if(tonumber(au(o))or au(o)=='')and au(q)~=au(o)then task.
spawn(au(aP),au(o))h.status.correctText:set(au(o))q:set(au(o))end else if au(q)==au(o)then return end task.spawn(au(aP),
au(o))h.status.correctText:set(au(o))q:set(au(o))end end end)local A,B=ao(),ao(0)am'Frame'{Parent=aN,Visible=ap(function
()if au(aL.string)~=''and not string.find(au(aO):lower(),au(aL.string):lower())or not au(f)then return false end return
true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,Visible=ap(function()if not au(aQ)
then return true end return false end),BackgroundTransparency=av(function()return au(i)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aA(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=j},am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=j,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ap(function()return au(aR)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true
,[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aC(aD.LayoutOrder,aG.Horizontal,aF
.Left,aE.Center,UDim.new(0,3)),am'TextLabel'{Size=UDim2.fromScale(0,1),BackgroundColor3=ai.background2,
BackgroundTransparency=j,TextSize=18,Text=aO,AutomaticSize=Enum.AutomaticSize.X,TextTransparency=j,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,TextColor3=ai.text,FontFace=aw('Montserrat',Enum.FontWeight.Bold),[as'Changed']=
function(C)if C=='AbsoluteSize'and au(A)~=nil then B:set(au(A).AbsoluteSize.X)end end,[ar]=A,[an]={aA(6),az(0,6)}},am
'TextButton'{Interactable=ap(function()if not au(aQ)then return false end return au(i)end),Size=ap(function()if au(A)
then return UDim2.new(1,-au(B)-3,1)end return UDim2.fromScale(0.35,1)end),BackgroundColor3=ai.background2,
BackgroundTransparency=j,[as'Activated']=function()local C=au(k)if C then C:CaptureFocus()end end,[an]={aA(6),az(0,6),
aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,5)),am'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=j},am'TextBox'{Interactable=ap(function()
if not au(aQ)then return false end return au(i)end),ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=e,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextSize=16,TextXAlignment=Enum
.TextXAlignment.Left,FontFace=aw('Montserrat',Enum.FontWeight.Bold),Text=p,TextTransparency=j,ClearTextOnFocus=b,[ar]=k,
[as'Changed']=function(C)local D=au(k)if D.TextBounds.X>D.AbsoluteSize.X then z:set(true)end if D and D.Text and C==
'Text'then o:set(D.Text)end end,[as'Focused']=function()l:set(true)end,[as'FocusLost']=function()l:set(false)end,[an]={
am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[an]={am'UIGradient'{Rotation=0,Color=av(function()return
ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,
40,1),Transparency=av(function()if not au(i)then return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1,1)}end if au(z)then if au(l)then return NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.1,1),NumberSequenceKeypoint.new(1,1)}else return
NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end
end return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if au(
aK.boolean)and not au(d)then aq(h.file):onChange(function()local C,D=au(h.file),true if C~=nil then if au(aU)then l:set(
true)end o:set(C)if au(aU)then l:set(false)end D=false end if D then if au(aU)then l:set(true)end o:set(au(aT))if au(aU)
then l:set(false)end end end)if h.private then if au(aU)then l:set(true)end o:set(au(aT))if au(aU)then l:set(false)end
end else if au(aU)then l:set(true)end o:set(au(aT))if au(aU)then l:set(false)end end local C={}function C.SetName(D,E)
local F,H=ax({SetName=E},{SetName=''})assert(F,table.concat(H,'\n'))aO:set(E)end function C.SetInput(D,E)local F,H=ax({
SetInput=E},{SetInput=au(aS)and 1 or''})assert(F,table.concat(H,'\n'))o:set(E)end function C.Enable(D)aQ:set(true)end
function C.Disable(D)aQ:set(false)end function C.Visible(D)f:set(true)end function C.Invisible(D)f:set(false)end return
C end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an
=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed
,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references
,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC
.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],
ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=false,Visible=false,Callback=function()end,LinkKeybind=
true,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.
Default and''or'Default',af.Visible and''or'Visible',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or
'IgnoreConfig',af.IgnoreConfig and''or'IgnoreConfig'})assert(aM,table.concat(aN,'\n'))aM,aN=ax(af,{Bind=Enum.KeyCode.E},
{af.LinkKeybind and af.Bind and''or'Bind'})assert(aM,table.concat(aN,'\n'))local aO,aP,aQ,aR,aS,aT,aU,b,d,e,f,g,h,i,j,k,
l,o,p,q=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find
'isMobile',ah.find'isListening',ah.find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.Callback,af.Default
or aq(false),af.IsEnabled or aq(true),af.Visible or aq(true),af.Bind,af.IgnoreConfig or aq(false),af.DisabledText or aq
'Component Disabled',af.LinkKeybind or aq(false)local z,A=(af.FLAG or aq(e.uid))if av(z)~=''then A=ak.register(av(z),{
boolean=aq(false),keycode=aq(nil)},'toggle',av(z)==e.uid)A.user.Value=av(A.status.boolean)end local B=aq()local function
C(D:EnumItem,E:string)local F,H=av(aP.binds),av(b.bindData)if table.find(F,D)then aL(('Key %s is already in use. %s'):
format(D.Name,E))else table.insert(F,D)if av(B)then table.remove(F,table.find(F,av(B)))H[av(B).Name]=nil end B:set(D)H[
av(B).Name]={bind=av(B),name=av(g),boolean=A.status.boolean}b:update('bindData',H)aP:update('binds',F)end end ar(A.
status.boolean):onChange(function()if av(j)then task.spawn(av(h),av(A.status.boolean))end end)ar(A.status.keycode):
onChange(function()local D,E=pcall(function()return Enum.KeyCode[av(A.status.keycode)]end)if D then C(E,'RAHHH')end end)
table.insert(d.list,A.status.boolean)local D=aq(av(aO.string)==av(e.tab).uid)ar(aO.string):onChange(function()D:set(av(
aO.string)==av(e.tab).uid)end)local E,F=aw(function()return av(D)and 0 or 1 end,40,1),aq(false)local H=am.InputBegan:
Connect(function(H,I)if av(aT.boolean)then return end if av(F)then if H.KeyCode and H.KeyCode~=Enum.KeyCode.Unknown then
C(H.KeyCode,'From input box')end F:set(false)task.wait()aU:update('boolean',false)else if H.KeyCode and H.KeyCode==av(B)
and not I and not av(aU.boolean)and av(j)then A.status.boolean:set(not av(A.status.boolean))end end end)ay.add(H)local I
,J=(aq(false))local K=ao'TextButton'{Visible=at(function()if not av(j)then return av(j)end return av(I)end),Parent=aA.
get(av(aS.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),
TextScaled=true,Text=g,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai
.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if J then J:
Disconnect()J=nil else A.status.boolean:set(not av(A.status.boolean))end end,[ap]={aD(4),aE(16),aF(0,16),ao'ImageLabel'{
ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),
BackgroundTransparency=1,Image=av(aT.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=f,Visible=at(function()if av(aR.string)~=''and not string.find(av(g):lower(),
av(aR.string):lower())or not av(k)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency
=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(j)then return true end return false end),
BackgroundTransparency=aw(function()return av(D)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=E},ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=E,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(
function()return av(p)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=at(function()if not av(j)then return false end return av(D)end),Size=at(function()return
av(q)and UDim2.new(0.775,av(I)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=E,[as'Activated']=function()if not av(j)then return end A.status.boolean:set(not av(A.status.
boolean))end,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.
Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=E,BackgroundColor3=aw(function()return av(A.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(
function()if not av(D)then return 1 end if av(A.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=g,TextTransparency=E,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=I,
Interactable=at(function()if not av(j)then return false end return av(D)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=E,[as'Activated']=function()I:set(false)K.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=E}}},ao
'TextButton'{Visible=q,Interactable=at(function()if not av(j)then return false end return av(D)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=E,[as'Activated']=function()if av(aT.boolean)then I:set(
true)J=aB(K,15)return end F:set(true)aU:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.
Left,aK.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(aT.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=E},ao'TextLabel'{Visible=not av(aT.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=E,Text=at(function()return av(F)and
'Listening'or av(B)and av(B).Name or'Waiting'end)},ao'TextLabel'{Visible=av(aT.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(I)and'Move Bind'or'Place Bind'end),
TextTransparency=E}}}}}}}if av(aQ.boolean)and not av(o)then ar(A.file):onChange(function()local L,M,N=av(A.file),true,
true if L.boolean~=nil then A.status.boolean:set(L.boolean)M=false end if L.keycode~=nil then A.status.keycode:set(L.
keycode)N=false end if M then A.status.boolean:set(av(i))end if N then if l then A.status.keycode:set(av(l).Name)end end
end)if A.private then A.status.boolean:set(av(i))if l then A.status.keycode:set(av(l).Name)end end else A.status.boolean
:set(av(i))if l then A.status.keycode:set(av(l).Name)end end local L={}function L.SetName(M,N)local O,P=ax({SetName=N},{
SetName=''})assert(O,table.concat(P,'\n'))g:set(N)end function L.SetValue(M,N:boolean)local O,P=ax({SetValue=N},{
SetValue=true})assert(O,table.concat(P,'\n'))A.status.boolean:set(N)end function L.SetBind(M,N:EnumItem)assert(av(q),
'Requires LinkKeybind')local O,P=ax({SetBind=N},{SetBind=Enum.keyCode.C})assert(O,table.concat(P,'\n'))C(N,'At :SetBind'
)end function L.Enable(M)j:set(true)end function L.Disable(M)j:set(false)end function L.Visible(M)k:set(true)end
function L.Invisible(M)k:set(false)end return L end end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(
function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab.Parent
.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList',Title=
af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag end)()
end,[81]=function()local aa,ab,ac=a(81)local ad return(function(...)end)()end,[83]=function()local aa,ab,ac=a(83)local
ad return(function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(ae.Bundles)local ai=ah.services local
aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.
Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.
UIListLayout,av.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment
,Enum.VerticalAlignment,ac(ae.utilities)local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR=aE.get,aE.references,aE.drag,aE.
customFont,aE.animate,aE.connections,ac(ab.Parent.Parent.components.warn)[1],aq(),aq(),aq(),aq(),aq(),aq()aG.add(aQ,aP,
aO,aN,aM,aR)local aS,aT,aU,b,d,e,f,g,h,i,j,k,l,o,p,q=am.find'absoluteOffset',am.find'instanceName',am.find'selectedTab',
am.find'searchText',am.find'currentBinds',am.find'isVisible',am.find'isMobile',am.find'isListening',am.find'bindData',am
.find'destroyFunc'.func,aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(l):onChange(function()if aF(l)then o:
set(not aF(o))task.wait(0.3)p:set(not aF(p))task.wait(0.3)q:set(not aF(q))else q:set(not aF(q))task.wait(0.3)p:set(not
aF(p))task.wait(0.3)o:set(not aF(o))end end)at(p):onChange(function()j:set(aF(p)and 212 or 750)end)at(q):onChange(
function()k:set(aF(q)and 74 or 500)end)local z,A,B=aq(false),aq(),aq(false)local function C(D:EnumItem,E:string)local F,
H=aF(d.binds),aF(h.bindData)if table.find(F,D)then aL(('Key %s is already in use. %s'):format(D.Name,E))else table.
insert(F,D)if aF(A)then table.remove(F,table.find(F,aF(A)))H[aF(A).Name]=nil end A:set(D)B:set(true)H[aF(A).Name]={bind=
aF(A),name='Toggle Interface'}h:update('bindData',H)d:update('binds',F)end end if not aF(f.boolean)then C(af.HideBind,
'init')end local D=aq''at(aU.string):onChange(function()local E=aF(aU.string)local F=am.find(E)D:set(aF(F.Name):upper())
end)local E,F,H=(aq(af.Icon or''))local I=ao'ScreenGui'{Name=aF(aT.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=
false,IgnoreGuiInset=true,[ar]=aQ,[ap]={ao'Frame'{Name='screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},
ao'Frame'{Name='container',Visible=e.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aF(aS.number)
),Size=aJ(function()return UDim2.fromOffset(aF(j),aF(k))end,30,1),BackgroundColor3=ak.background,[ar]=aM,[ap]={ax(6),az(
16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right,aD.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),
Size=aJ(function()return UDim2.new(0,math.clamp(aF(j)-32-180-16,212,9e9),aF(o)and 0 or 1,0)end,30,1),
BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0
,10),BackgroundTransparency=1,Text=D,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,
FontFace=aI('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]
={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency
=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),
BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,5)),ao'ImageLabel'{Visible=as(
function()if aF(E)~=''then return true end return false end),Size=UDim2.fromOffset(44,44),BackgroundTransparency=1,Image
=E,ImageColor3=ak.text2},ao'Frame'{Size=as(function()if aF(E)~=''then return UDim2.new(1,-49,1,0)end return UDim2.new(1,
0,1,0)end),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,4)),ao'TextLabel'{Size
=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=aI('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=
true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.
Description,TextColor3=ak.text2,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left}}}}},ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2
,[au'Activated']=function()local I=aF(aR)if I then I:CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.
Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image
=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aI(
'Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(I)local J=aF(aR)if
I~='Text'and J and J.Text then return end b:update('string',J.Text)end,[ar]=aR}}}}},ao'Frame'{Name='tabFrameList',Size=
UDim2.new(1,0,1,-60),BackgroundTransparency=1,[ar]=aO}}}}},ao'Frame'{Size=aJ(function()return aF(q)and UDim2.new(0,180,0
,44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder
,aB.Vertical,aC.Center,aD.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.
LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=
ak.selectedTab,[au'Activated']=function()if aF(f.boolean)then B:set(true)H=aH(F,15)return end z:set(true)g:update(
'boolean',true)end,[ap]={ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aF(f.boolean)and al.finger or al.command,
ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not aF(f.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(z)and'Listening'or aF(A)and aF(A).Name or'Waiting'
end)},ao'TextLabel'{Visible=aF(f.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aI('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()
return aF(B)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.
selectedTab,[au'Activated']=function()l:set(not aF(l))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(l)
and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()if not aF(B)then ac(ae.components.notification){Parent=aP,
Title='Darius Interface',Body=`You must {aF(f.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end e:update('boolean',not aF(e.boolean))end,[ap]={ax(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=aJ(function()return aF(q)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[ar]=aN,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,6)),az(0,10)}},ao
'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=function()aF(i)()end,[ap]={ax(4)
,az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao'ImageLabel'{BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),
FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,Text='Destroy Interface',
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-
20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[ar]=aP,[ap]={aw(aA.LayoutOrder
,aB.Vertical,aC.Right,aD.Bottom)}}}}if I.screenSize.AbsoluteSize.X<aF(j)then j:set(I.screenSize.AbsoluteSize.X*0.9)end
if I.screenSize.AbsoluteSize.Y<aF(k)then k:set(I.screenSize.AbsoluteSize.Y*0.9)end F=ao'TextButton'{Visible=as(function(
)return(aF(B)and aF(f.boolean))end),Interactable=as(function()return(aF(B)and aF(f.boolean))end),Parent=aG.get(aF(aT.
name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,
Text='Toggle UI',FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au'Activated']=function()if H then H:Disconnect(
)H=nil else e:update('boolean',not aF(e.boolean))end end,[ap]={az(4),ax(16),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aF(f
.boolean)and al.finger or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local J=aj.InputBegan:
Connect(function(J,K)if aF(f.boolean)then return end if aF(z)then if J.KeyCode and J.KeyCode~=Enum.KeyCode.Unknown then
C(J.KeyCode,'From input box')end z:set(false)task.wait()g:update('boolean',false)else if J.KeyCode and J.KeyCode==aF(A)
and not K and not aF(g.boolean)then e:update('boolean',not aF(e.boolean))end end end)aK.add(J)local K=aH(aG.get
'container',15)aK.add(aG.get'container':GetPropertyChangedSignal'Position':Connect(function()local L=aG.get'container'
local M=L.AbsolutePosition+Vector2.new(aF(j)/2,aF(k)/2)if(M.X-I.screenSize.AbsoluteSize.X)/aF(j)>0.435 then K:
Disconnect()L.Position=UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.Offset)K=aH(aG.get'container',15)end if-((M.X-I.
screenSize.AbsoluteSize.X)/aF(j)+1)>0.8 then K:Disconnect()L.Position=UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.
Offset)K=aH(aG.get'container',15)end if(M.Y-(I.screenSize.AbsoluteSize.Y+aF(aS.number)))/aF(k)>0.32 then K:Disconnect()L
.Position=UDim2.new(L.Position.X.Scale,L.Position.X.Offset,0.5,aF(aS.number))K=aH(aG.get'container',15)end if-((M.Y-(I.
screenSize.AbsoluteSize.Y+aF(aS.number)))/aF(k)+1)>0.935 then K:Disconnect()L.Position=UDim2.new(L.Position.X.Scale,L.
Position.X.Offset,0.5,aF(aS.number))K=aH(aG.get'container',15)end end))end end)()end,[84]=function()local aa,ab,ac=a(84)
local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af
])else error('no utility: '..af)end end})end)()end,[85]=function()local aa,ab,ac=a(85)local ad return(function(...)local
ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.
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
ag end end function ae.printFileSystem()print(af)end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=
getgenv or nil function ae.isfile(ag:string)if isfile then return isfile(ag)else local ah,ai=af,false if ag:find'/'then
for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end
if ai then return false end return true end end function ae.isfolder(ag:string)if isfolder then return isfolder(ag)else
local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah
=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end function ae.writefile(ag:string,
ah:string)if writefile then return writefile(ag,ah)else local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])==
'table'then ai=ai[ak]elseif(typeof(ai[ak])=='string'or typeof(ai[ak])=='nil')then ai[ak]=ah end end end end function ae.
delfile(ag:string)if delfile then return delfile(ag)else local ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[
al]if typeof(ah)=='string'then ai[al]=nil else ai=ah end end end end function ae.readfile(ag:string)if readfile then
return readfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=
true break end end else ah=ah[ag]end if ai then warn'readfile: no file'return nil end return ah end end function ae.
makefolder(ag:string)if makefolder then return makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'
do if not ah[aj]then ah[aj]={}break else ah=ah[aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if
listfiles then return listfiles(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah
==nil then ai=true break end end else ah=ah[ag]end if ai or typeof(ah)=='string'then warn'no folder exists'return nil
end local aj={}for ak,al in ah do if typeof(al)=='string'then table.insert(aj,`{ag}/{ak}`)end end return aj end end
return ae end)()end,[95]=function()local aa,ab,ac=a(95)local ad return(function(...)return function(ae,af)local ag,ah=
ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae
local function ap(aq,ar,as)return aq+(ar-aq)*as end local aq=Instance.new'BindableEvent'local function ar(as)if not(ao)
then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,as*ah),ao.Y.
Scale,ap(ak.Position.Y.Offset,an.Y.Offset,as*ah))return end local at=(am-ai:GetMouseLocation())local au,av=(ao.X.Offset-
at.X),(ao.Y.Offset-at.Y)an=UDim2.new(ao.X.Scale,au,ao.Y.Scale,av)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.
Offset,au,as*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,av,as*ah))end ak.InputBegan:Connect(function(as)if as.UserInputType
==Enum.UserInputType.MouseButton1 or as.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:
GetMouseLocation()as.Changed:Connect(function()if as.UserInputState==Enum.UserInputState.End then aq:Fire()al=false end
end)end end)local as=aj.Heartbeat:Connect(ar)return as,aq.Event end end)()end,[96]=function()local aa,ab,ac=a(96)local
ad return(function(...)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return
ae end end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:string,af)ae=ae or''
local ag=Instance.new'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.
Parent.Parent.Bundles.services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[98]=function()local aa,ab,ac=
a(98)local ad return(function(...)local ae=string.split(
[[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then return af(ag-1)
..ae[math.random(1,#ae)]else return''end end return af end)()end,[99]=function()local aa,ab,ac=a(99)local ad return(
function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af.add(...)
for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if typeof(ah(aj))=='Instance'then if not
ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end)else if not ae[ah(
aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end end function af.get(ai)if
ae[ai]then return ae[ai]end end function af.remove(ai)if ae[ai]then ae[ai]=nil else warn(ai,
"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=nil if typeof(aj)=='Instance'then aj
:Destroy()end end end return af end)()end,[100]=function()local aa,ab,ac=a(100)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end,[101]
=function()local aa,ab,ac=a(101)local ad return(function(...)return function(ae:table,af:table,ag:table?):any ag=ag or{}
local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))and not table.find(ag,aj)then ah=
false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah,ai end end)()end},{{1,2,{
'Darius'},{{90,2,{'utilities'},{{97,2,{'getStringBounds'}},{92,2,{'connections'}},{93,2,{'customFont'}},{96,2,{'get'}},{
95,2,{'drag'}},{98,2,{'randomString'}},{100,2,{'tween'}},{101,2,{'typecheck'}},{91,2,{'animate'}},{99,2,{'references'}},
{94,2,{'customFunctions'}}}},{84,2,{'simpleElements'},{{85,2,{'UIAspectRatioConstraint'}},{89,2,{'UITextSizeConstraint'}
},{88,2,{'UIPadding'}},{86,2,{'UICorner'}},{87,2,{'UIListLayout'}}}},{81,2,{'darius.story'}},{82,1,{'layouts'},{{83,2,{
'main'}}}},{64,1,{'components'},{{69,2,{'keybind'}},{80,2,{'warn'}},{78,2,{'textbox'}},{68,2,{'dropdown'}},{77,2,{
'tabFrame'}},{79,2,{'toggle'}},{75,2,{'slider'}},{76,2,{'tabButton'}},{71,2,{'label'}},{73,2,{'notification'}},{67,2,{
'divider'}},{72,2,{'module'}},{70,2,{'keybindList'}},{65,2,{'button'}},{74,2,{'paragraph'}},{66,2,{'colorpicker'}}}},{2,
2,{'Bundles'},{{59,2,{'icons'}},{62,2,{'themeSystem'},{{63,2,{'default'}}}},{57,2,{'data'}},{61,2,{'services'}},{58,2,{
'flags'}},{60,2,{'lucide'}},{3,2,{'Fusion'},{{40,1,{'State'},{{46,2,{'Value'}},{44,2,{'ForValues'}},{41,2,{'Computed'}},
{42,2,{'ForKeys'}},{43,2,{'ForPairs'}},{45,2,{'Observer'}},{47,2,{'unwrap'}}}},{33,1,{'Logging'},{{36,2,{'logWarn'}},{37
,2,{'messages'}},{38,2,{'parseError'}},{34,2,{'logError'}},{35,2,{'logErrorNonFatal'}}}},{48,2,{'Types'}},{16,1,{
'Dependencies'},{{17,2,{'captureDependencies'}},{21,2,{'useDependency'}},{20,2,{'updateAll'}},{19,2,{'sharedState'}},{18
,2,{'initDependency'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{39,2,{'PubTypes'}},{4,1,{'Animation'},{{9,2,{
'getTweenRatio'}},{7,2,{'Tween'}},{10,2,{'lerpType'}},{11,2,{'packType'}},{6,2,{'SpringScheduler'}},{13,2,{'unpackType'}
},{5,2,{'Spring'}},{12,2,{'springCoefficients'}},{8,2,{'TweenScheduler'}}}},{49,1,{'Utility'},{{51,2,{'cleanup'}},{56,2,
{'xtypeof'}},{52,2,{'doNothing'}},{53,2,{'isSimilar'}},{54,2,{'needsDestruction'}},{55,2,{'restrictRead'}},{50,2,{'None'
}}}},{22,1,{'Instances'},{{31,2,{'applyInstanceProps'}},{24,2,{'Cleanup'}},{26,2,{'New'}},{32,2,{'defaultProps'}},{23,2,
{'Children'}},{25,2,{'Hydrate'}},{30,2,{'Ref'}},{29,2,{'Out'}},{28,2,{'OnEvent'}},{27,2,{'OnChange'}}}}}}}}}}},'0.4.1',
'WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,
_VERSION local au,av,aw,ax,ay,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,
ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB and aC then af=aC end end local aB=af
and af.defer local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]=
'Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local aL,aM={GetFullName={{},function(aL)local aM,aN=
aL.Name,aL.Parent while aN do aM=aN.Name..'.'..aM aN=aN.Parent end return aM end},GetChildren={{},function(aL)local aM={
}for aN in ai,aK[aL]do au(aM,aN)end return aM end},GetDescendants={{},function(aL)local aM={}for aN in ai,aK[aL]do au(aM
,aN)for aO,aP in ai,aN:GetDescendants()do au(aM,aP)end end return aM end},FindFirstChild={{'string','boolean?'},function
(aL,aM,aN)local aO=aK[aL]for aP in ai,aO do if aP.Name==aM then return aP end end if aN then for aQ in ai,aO do return
aQ:FindFirstChild(aM,true)end end end},FindFirstAncestor={{'string'},function(aL,aM)local aN=aL.Parent while aN do if aN
.Name==aM then return aN end aN=aN.Parent end end},WaitForChild={{'string','number?'},function(aL,aM)return aL:
FindFirstChild(aM)end}},{}for aN,aO in ai,aL do local aP,aQ,aR=aO[1],aO[2],{}for aS,aT in ai,aP do local aU,b=az(aT,
'^([^%?]+)(%??)')aR[aS]={aU,b}end aM[aN]=function(aU,...)if not aK[aU]then ah(
"Expected ':' not '.' calling member function "..aN,2)end local b={...}for d,e in ai,aR do local f=b[d]local g,h,i=an(f)
,e[1],e[2]if f==nil and not i then ah('Argument '..f..' missing or nil',3)end if h~='any'and g~=h and not(g=='nil'and i)
then ah('Argument '..d..' expects type "'..h..'", got "'..g..'"',2)end end return aQ(aU,...)end end local function aP(aQ
,aR,aS)local aT,aU=(ag({},{__mode='k'}))local function b(d)ah(d..' is not a valid (virtual) member of '..aQ..' "'..aR..
'"',3)end local function d(e)ah('Unable to assign (virtual) property '..e..'. Property is read only',3)end local e,f={},
{}f.__metatable=false f.__index=function(g,h)if h=='ClassName'then return aQ elseif h=='Name'then return aR elseif h==
'Parent'then return aS elseif aQ=='StringValue'and h=='Value'then return aU else local i=aM[h]if i then return i end end
for i in ai,aT do if i.Name==h then return i end end b(h)end f.__newindex=function(g,h,i)if h=='ClassName'then d(h)
elseif h=='Name'then aR=i elseif h=='Parent'then if i==e then return end if aS~=nil then aK[aS][e]=nil end aS=i if i~=
nil then aK[i][e]=true end elseif aQ=='StringValue'and h=='Value'then aU=i else b(h)end end f.__tostring=function()
return aR end ag(e,f)aK[e]=aT if aS~=nil then aK[aS][e]=true end return e end local function aQ(aR,aS)local aT,aU,b,d=aR
[1],aR[2],aR[3],aR[4]local e=aD[aU]local f=b and av(b,1)or e local g=aP(e,f,aS)aE[aT]=g if b then for h,i in ai,b do g[h
]=i end end if d then for h,i in ai,d do aQ(i,g)end end return g end local aR=aP('Folder','['..ad..']')for aS,aT in ai,
ab do aQ(aT,aR)end for aU,b in ai,aa do local d=aE[aU]aF[d]=b aG[d]=aU local e=d.ClassName if e=='LocalScript'or e==
'Script'then au(aI,d)end end local function d(e)local f,g=e.ClassName,aH[e]if g and f=='ModuleScript'then return ak(g)
end local h=aF[e]local function i(j)j=aq(j)local k,l,o=e:GetFullName(),az(j,'[^:]+:(%d+): (.+)')if not l or not at then
return k..':*: '..(o or j)end l=ar(l)local p=aG[e]local q=at[p]local z=l-q+1 if z<0 then z='?'end return k..':'..z..': '
..o end if f=='LocalScript'or f=='Script'then local j,k=ap(h)if not j then ah(i(k),0)end else local j={ap(h)}local k=av(
j,1)if not k then local l=av(j,1)ah(i(l),0)end aH[e]=j return ak(j)end end function a(e)local f=aE[e]local function g(h,
...)local i={ap(h,...)}local j=av(i,1)if not j then ah(i[1],3)end return ak(i)end local h=aw(ag({},{__index=aJ,
__newindex=function(h,i,j)aJ[i]=j end,__len=function()return#aJ end,__iter=function()return ai,aJ end}))local i,j=aw{
version=ac,envname=ad,shared=h,script=am,require=ao},f local function k(l,...)local o,p,q=an(l),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if o=='table'and aK[l]then if l
.ClassName~='ModuleScript'then ah(p,2)elseif l==f then ah(q,2)end return d(l)elseif o=='string'and ay(l,1,1)~='@'then if
#l==0 then ah('Attempted to call require with empty string',2)end local z=f if ay(l,1,1)=='/'then z=aR elseif ay(l,1,2)
=='./'then l=ay(l,3)end local A for B in aA(l,'([^/]*)/?')do local C=B if B=='..'then C='Parent'end if C~=''then local D
=z:FindFirstChild(C)if not D then local E=z.Parent if E then D=E:FindFirstChild(C)end end if D then z=D elseif B~=A and
B~='init'and B~='init.server'and B~='init.client'then ah('Virtual script path "'..l..'" not found',2)end end A=B end if
z.ClassName~='ModuleScript'then ah(p,2)elseif z==f then ah(q,2)end return d(z)end return g(ao,l,...)end return i,j,k end
for e,f in ai,aI do aC(d,f)end return d(aR:GetChildren()[1])