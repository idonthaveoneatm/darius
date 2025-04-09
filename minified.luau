local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,as,at,au,av={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i,j=f.data,f.icons,f.themeSystem,f.services local k,l=j.HttpService,f.Fusion
local m,n=l.Observer,d(c.utilities)local o,p,q,r,s,t,u,v,w=n.references,n.connections,n.customFunctions,n.randomString,n
.get,n.typecheck,d(c.layouts.main),d(c.Bundles.flags),d(c.components.warn)[2]local function x(y,z,A)A.Parent=z return d(
c.components[y])(A)end local y={}function y.Window(z,A)if q.getgenv then if q.getgenv().dariusInstance then p:
deleteConnections()o:clear()q.getgenv().dariusInstance=nil end else if _G.dariusInstance then p:deleteConnections()o:
clear()_G.dariusInstance=nil end end local B,C=t(A,{Title='',Description='',Icon='',HideBind=Enum.KeyCode.T,UseConfig=
false,IsMobile=false,Offset=0,Theme={},Configuration={},noOffset=false,Parent=Instance.new'Part'},{A.Icon and''or'Icon',
A.noOffset and''or'noOffset',A.IsMobile and''or'IsMobile',A.UseConfig and''or'UseConfig',A.Theme and''or'Theme',A.
Configuration and''or'Configuration',A.Parent and''or'Parent',A.Offset and''or'Offset'})assert(B,table.concat(C,'\n'))if
A.UseConfig then B,C=t(A,{Workspace=''},{})assert(B,table.concat(C,'\n'))end w(A.Title)g.add({string=''},'selectedTab')g
.add({boolean=false},'isFirst')local D=g.add({tbl={}},'setTheme')g.add({number=A.noOffset and 0 or 58},'absoluteOffset')
g.add({name=r(32)},'instanceName')g.add({binds={}},'currentBinds')g.add({bindData={}},'bindData')g.add({string=''},
'searchText')local E=g.add({list={}},'toggles',true)g.add({module=function()end},'currentPicker')g.add({module=function(
)end},'currentPicker')g.add({boolean=true},'isVisible')g.add({boolean=A.IsMobile},'isMobile')g.add({boolean=false},
'isListening')local F,G,H,I=g.add({func=function()end},'destroyFunc'),g.find'flags',g.add({boolean=false},'useConfig'),g
.add{data=A}if A.UseConfig then local J,K={'darius',`/{A.Workspace}`},''for L=1,#J do K=K..J[L]if not q.isfolder(K)then
q.makefolder(K)end end v.writeFiles=true v.path=`darius/{A.Workspace}`y.Folder=`darius/{A.Workspace}`end local J,K={
'darius',`/themes`},''for L=1,#J do K=K..J[L]if not q.isfolder(K)then q.makefolder(K)end end i.path=`darius/themes`i.
init()local L=i.getTheme().uid if A.Theme then B,C=t(A.Theme,{Name='',Colors={}})assert(B,table.concat(C,'\n'))D:update(
'tbl',A.Theme)task.wait()i.set(i.create(A.Theme.Name,A.Theme.Colors,nil,nil,true))end v.init()if A.Configuration then B,
C=t(A.Configuration,{Name='',FlagValues={}})assert(B,table.concat(C,'\n'))local M=v.create(A.Configuration.Name,nil,nil,
A.Configuration.FlagValues,true,A.Configuration.Lock)v.set(M)for N,O in A.Configuration.FlagValues do v.preregister(N,O)
end end if A.UseConfig then H:update('boolean',A.UseConfig)end y.flags={}setmetatable(y.flags,{__index=function(M,N)
local O=s(G.list)if O[N]then return O[N].user else return v.preregister(N).user end return nil end})local M=l.New
'BindableEvent'{}y.OnDestruction=M.Event u(A,M)local N,O=o.get'tabButtonList',o.get'tabFrameList'F:update('func',
function()y.Destroyed=true M:Fire()for P,Q in E.list do Q:set(false)end task.wait(0.1)p:deleteConnections()o:clear()M:
Destroy()end)y[I.uid]={}local P=y[I.uid]function P.Tab(Q,R)local S=x('tabButton',N,R)local T=x('tabFrame',O,{uid=S.uid})
P[S.uid]={}local U=P[S.uid]function U.Button(V,W)W.tab=S return x('button',T,W)end function U.Toggle(V,W)W.tab=S return
x('toggle',T,W)end function U.Dropdown(V,W)W.tab=S return x('dropdown',T,W)end function U.Label(V,W)return x('label',T,{
tab=S,Text=W})end function U.Paragraph(V,W)W.tab=S return x('paragraph',T,W)end function U.TextBox(V,W)W.tab=S return x(
'textbox',T,W)end function U.Slider(V,W)W.tab=S return x('slider',T,W)end function U.Keybind(V,W)W.tab=S return x(
'keybind',T,W)end function U.Divider(V)return x('divider',T,{tab=S})end function U.ColorPicker(V,W)W.tab=S return x(
'colorpicker',T,W)end function U.KeybindList(V)return x('keybindList',T,{tab=S})end function U.ButtonGroup(V)return x(
'buttonGroup',T,{tab=S})end return P[S.uid]end y.Destroyed=false function y.Notify(Q,R)return x('notification',o.get
'notificationList',R)end function y.Destroy(Q)y.Destroyed=true M:Fire()task.spawn(function()for R,S in E.list do S:set(
false)end end)task.wait()p:deleteConnections()o:clear()M:Destroy()end function y.SetTheme(Q,R)local S,T=t({['New Theme']
=R},{['New Theme']=''})assert(S,table.concat(T,'\n'))if i.find(R)then i.set(R)end end function y.GetThemeUID(Q)return i.
getTheme().uid end function y.ImportTheme(Q,...)local R={...}if#R==1 then B,C=t(R,{[1]={}},{})assert(B,table.concat(C,
'\n'))return i.create(`Import_{r(5)}`,R[1])elseif#R==2 then B,C=t(R,{[1]='',[2]={}},{})assert(B,table.concat(C,'\n'))
return i.create(R[1],R[2])end end function y.ExportTheme(Q)return i.export()end function y.SetConfiguration(Q,R)v.set(R)
end function y.GetConfigurationUID(Q)return v.getConfig().uid end function y.ImportConfiguration(Q,...)local R={...}if#R
==1 then B,C=t(R,{[1]={}},{})assert(B,table.concat(C,'\n'))return v.create(`Import_{r(5)}`,nil,nil,R[1])elseif#R==2 then
B,C=t(R,{[1]='',[2]={}},{})assert(B,table.concat(C,'\n'))return v.create(R[1],nil,nil,R[2])end end function y.
ExportConfiguration(Q)return v.export()end function y.CreateSettings(Q)local R=P:Tab{Name='Settings',Image=h.cog}do
local S,T,U,V=i.getTheme().palette,{},{},{}table.foreach(S,function(W)table.insert(U,W)end)table.foreach(i.getThemes(),
function(W,X)table.insert(V,{DisplayValue=X.name,Value=X.uid})end)local W,X,Y,Z,_,aa,ab,ac,ad,ae='',false,false
local function af(ag)if ag then aa:Visible()Z:Visible()if Y then _:Visible()end if i.getTheme().uid~='original'then ad:
Visible()ae:Visible()else ad:Invisible()ae:Invisible()end else _:Invisible()Z:Invisible()aa:Invisible()ad:Invisible()ae:
Invisible()end end local ag=R:Dropdown{Name='Current Theme',Items=V,Default=i.getTheme().uid,Callback=function(ag)i.set(
ag)if Z and W~=''then Z:SetColor(i.get(W))end if ag=='original'and ab then ab:Disable()elseif ag~='original'and ab then
ab:Enable()end if ag=='original'and ac then ac:Disable()elseif ag~='original'and ac then ac:Enable()end if ae then af(X)
end end}local function ah(ai:string?)table.clear(V)table.foreach(i.getThemes(),function(aj,ak)table.insert(V,{
DisplayValue=ak.name,Value=ak.uid})end)ag:SetItems(V)if ai then ag:SelectItem(ai)end end i.onChange(function()ag:
SelectItem(i.getTheme().uid)table.clear(T)table.foreach(i.getTheme().palette,function(ai,aj)T[ai]=aj end)end)i.onCreate(
function()ah()end)local ai,aj,ak,al,am=R:ButtonGroup(),false local function an(ao)if ao then ak:Visible()al:Visible()am:
Visible()else ak:Invisible()al:Invisible()am:Invisible()end end ai:Button{Name='Edit',Callback=function()aj=false an(
false)X=not X af(X)end}aa=R:Dropdown{Name='Colors',Visible=false,Items=U,Callback=function(ao)W=ao Z:SetColor(i.get(W))Z
:Enable()Z:SetName(`Editing: {W}`)end}Z=R:ColorPicker{Name='Editing Color: ',IsEnabled=false,Visible=false,DisabledText=
'Select Color First!',HideTransparency=true,Callback=function(ao)local ap=i.getTheme().palette if ap[W]:ToHex()~=ao:
ToHex()then Y=true _:Visible()else _:Invisible()Y=false end i.edit(W,ao)end}_=R:Button{Name='Reset Color',Visible=false,
Callback=function()Y=false Z:SetColor(T[W])_:Invisible()end}local ao=''ad=R:TextBox{Name='New Name',Visible=false,
Callback=function(ap)ao=ap end}ae=R:Button{Name='Set Name',Visible=false,Callback=function()i.editTheme(i.getTheme().uid
,'name',ao)ah()ad:SetInput''end}local ap=''ai:Button{Name='Create',Callback=function()X=false af(false)aj=not aj an(aj)
end}ak=R:TextBox{Name='Name your theme',Visible=false,Callback=function(aq)ap=aq end}al=R:Button{Name='Create theme',
Visible=false,Callback=function()if ap==''then y:Notify{Title=A.Title,Body='Theme name cannot be empty!',Duration=3,
Image=h.alert,ImageColor=i.get'red'}return end local aq=i.create(ap,i.getColors())local ar={i.set(aq)}if ar[1]then ah(aq
)aj=false an(aj)end end}am=R:Button{Name='Cancel',Visible=false,Callback=function()aj=false an(aj)ak:SetInput''end}ac=ai
:Button{Name='Save',DisabledText='Disabled',Callback=function()local aq=i.save(i.getTheme().uid)if aq then task.wait()
local ar=i.getTheme().palette if ar[W]:ToHex()~=T[W]:ToHex()then Y=true _:Visible()else _:Invisible()Y=false end y:
Notify{Title=A.Title,Body=`Saved theme with uid "{i.getTheme().uid}"`,Duration=3,Image=h.check}else y:Notify{Title=
'Theme Manager Error',Body=`Couldn't find/save theme with uid "{i.getTheme().uid}"`,Duration=3,Image=h.alert,ImageColor=
i.get'red'}end end}ab=ai:Button{Name='Delete',DisabledText='Disabled',Callback=function()local aq={i.find(i.getTheme().
uid)}if aq[1]then local ar=aq[2]i.delete(ar.uid)ah(L)y:Notify{Title=A.Title,Body=`Deleted theme with uid "{ar.uid}"`,
Duration=3,Image=h.check}else y:Notify{Title='Theme Manager Error',Body=`Couldn't find theme with uid "{i.getTheme().uid
}"`,Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}end if A.UseConfig then R:Divider()local aa={}table.foreach(v
.getConfigs(),function(ab,ac)table.insert(aa,{DisplayValue=ac.name,Value=ac.uid})end)local ab,ac,ad=''local ae,af=R:
Dropdown{Name='Configs',Items=aa,Default=v.getConfig().uid,AlwaysOpen=true,Callback=function(ae)ab=ae local af=v.find(ae
)if af.lock and ad then ad:Disable()ac:Disable()elseif not af.lock and ad then ad:Enable()ac:Enable()end end},R:
ButtonGroup()af:Button{Name='Load',Callback=function()if ab~=''then v.set(ab)local ag=v.find(ab)y:Notify{Title=A.Title,
Body=`Set configuration to "{ag.name}"`,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}local function ag(ah)table.clear(aa)
table.foreach(v.getConfigs(),function(ai,aj)table.insert(aa,{DisplayValue=aj.name,Value=aj.uid})end)ae:SetItems(aa)if ah
then ae:SelectItem(ah)end end v.onCreate(ag)v.onSelect(ag)local ah,ai,aj,ak=''af:Button{Name='Create',Callback=function(
)af:Invisible()ae:Invisible()ai:Visible()aj:Visible()ak:Visible()end}ai=R:TextBox{Visible=false,Name=
'Name your configuration',Callback=function(al)ah=al end}aj=R:Button{Visible=false,Name='Complete new configuration',
Callback=function()if ah~=''then v.create(ah,nil,false,nil)ag()af:Visible()ae:Visible()ai:Invisible()aj:Invisible()ak:
Invisible()y:Notify{Title=A.Title,Body=`Created "{ah}"`,Duration=3,Image=h.check}ai:SetInput''else y:Notify{Title=
'Configuration Error',Body='Name cannot be empty',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ak=R:Button{
Visible=false,Name='Cancel',Callback=function()af:Visible()ae:Visible()ai:Invisible()aj:Invisible()ak:Invisible()ai:
SetInput''end}ac=af:Button{Name='Save',DisabledText='Disabled',Callback=function()if ab~=''then v.save(ab)local al=v.
find(ab)y:Notify{Title=A.Title,Body=`Saved configuration "{al.name}"`,Duration=3,Image=h.check}else y:Notify{Title=
'Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ad=af:
Button{Name='Delete',DisabledText='Disabled',Callback=function()if ab==''then y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end v.delete(ab)ag()end}end end if q.
getgenv then q.getgenv().dariusInstance=y else _G.dariusInstance=y end return y[I.uid]end return y end)()end,function()
local aa,ab,ac=a(2)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)
then return ac(ab[af])else error('no bundle: '..af)end end})end)()end,function()local aa,ab,ac=a(3)local ad return(
function(...)local ae,af=ac(ab.PubTypes),ac(ab.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>
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
,doNothing:(...any)->()}return af('Fusion',{version={major=0,minor=2,isRelease=true},New=ac(ab.Instances.New),Hydrate=
ac(ab.Instances.Hydrate),Ref=ac(ab.Instances.Ref),Out=ac(ab.Instances.Out),Cleanup=ac(ab.Instances.Cleanup),Children=ac(
ab.Instances.Children),OnEvent=ac(ab.Instances.OnEvent),OnChange=ac(ab.Instances.OnChange),Value=ac(ab.State.Value),
Computed=ac(ab.State.Computed),ForPairs=ac(ab.State.ForPairs),ForKeys=ac(ab.State.ForKeys),ForValues=ac(ab.State.
ForValues),Observer=ac(ab.State.Observer),Tween=ac(ab.Animation.Tween),Spring=ac(ab.Animation.Spring),cleanup=ac(ab.
Utility.cleanup),doNothing=ac(ab.Utility.doNothing)})::Fusion end)()end,[5]=function()local aa,ab,ac=a(5)local ad return
(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=ac(ae.PubTypes),ac(ae.Types),ac(ae.
Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Animation.unpackType),ac(ae.Animation.SpringScheduler),ac(ae.
Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(ae.Utility.xtypeof),ac(
ae.State.unwrap),{}local ar,b={__index=aq},{__mode='k'}function aq.get(c,d:boolean?):any if d~=false then al(c)end
return c._currentValue end function aq.setPosition(c,d:PubTypes.Animatable)local e=typeof(d)if e~=c._currentType then
ah('springTypeMismatch',nil,e,c._currentType)end c._springPositions=aj(d,e)c._currentValue=d ak.add(c)an(c)end function
aq.setVelocity(c,d:PubTypes.Animatable)local e=typeof(d)if e~=c._currentType then ah('springTypeMismatch',nil,e,c.
_currentType)end c._springVelocities=aj(d,e)ak.add(c)end function aq.addVelocity(c,d:PubTypes.Animatable)local e=typeof(
d)if e~=c._currentType then ah('springTypeMismatch',nil,e,c._currentType)end local f=aj(d,e)for g,h in ipairs(f)do c.
_springVelocities[g]+=h end ak.add(c)end function aq.update(c):boolean local d=c._goalState:get(false)if d==c._goalValue
then local e=ap(c._damping)if typeof(e)~='number'then ai('mistypedSpringDamping',nil,typeof(e))elseif e<0 then ai(
'invalidSpringDamping',nil,e)else c._currentDamping=e end local f=ap(c._speed)if typeof(f)~='number'then ai(
'mistypedSpringSpeed',nil,typeof(f))elseif f<0 then ai('invalidSpringSpeed',nil,f)else c._currentSpeed=f end return
false else c._goalValue=d local e,f=c._currentType,typeof(d)c._currentType=f local g=aj(d,f)local h=#g c._springGoals=g
if f~=e then c._currentValue=c._goalValue local i,j=table.create(h,0),table.create(h,0)for k,l in ipairs(g)do i[k]=l end
c._springPositions=i c._springVelocities=j ak.remove(c)return true elseif h==0 then c._currentValue=c._goalValue return
true else ak.add(c)return false end end end local function c<T>(d:PubTypes.Value<T>,e:PubTypes.CanBeState<number>?,f:
PubTypes.CanBeState<number>?):Types.Spring<T>if e==nil then e=10 end if f==nil then f=1 end local g={[d]=true}if ao(e)==
'State'then g[e]=true end if ao(f)=='State'then g[f]=true end local h=setmetatable({type='State',kind='Spring',
dependencySet=g,dependentSet=setmetatable({},b),_speed=e,_damping=f,_goalState=d,_goalValue=nil,_currentType=nil,
_currentValue=nil,_currentSpeed=ap(e),_currentDamping=ap(f),_springPositions=nil,_springGoals=nil,_springVelocities=nil}
,ar)am(h)d.dependentSet[h]=true h:update()return h end return c end)()end,[6]=function()local aa,ab,ac=a(6)local ad
return(function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.
Parent.Parent local ag,ah,ai,aj=ac(af.Types),ac(af.Animation.packType),ac(af.Animation.springCoefficients),ac(af.
Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local ak,al,am:Set<Spring>,an={},0.0001,{},os.
clock()function ak.add(ao:Spring)ao._lastSchedule=an ao._startDisplacements={}ao._startVelocities={}for ap,aq in ipairs(
ao._springGoals)do ao._startDisplacements[ap]=ao._springPositions[ap]-aq ao._startVelocities[ap]=ao._springVelocities[ap
]end am[ao]=true end function ak.remove(ao:Spring)am[ao]=nil end local function ao()local ap:Set<Spring> ={}an=os.clock(
)for aq in pairs(am)do local ar,b,c,d=ai(an-aq._lastSchedule,aq._currentDamping,aq._currentSpeed)local e,f,g,h,i=aq.
_springPositions,aq._springVelocities,aq._startDisplacements,aq._startVelocities,false for j,k in ipairs(aq._springGoals
)do local l,m=g[j],h[j]local n,o=l*ar+m*b,l*c+m*d if math.abs(n)>al or math.abs(o)>al then i=true end e[j]=n+k f[j]=o
end if not i then ap[aq]=true end end for ar in pairs(am)do ar._currentValue=ah(ar._springPositions,ar._currentType)aj(
ar)end for b in pairs(ap)do am[b]=nil end end ae:BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.
Value,ao)return ak end)()end,[7]=function()local aa,ab,ac=a(7)local ad return(function(...)local ae=ab.Parent.Parent
local af,ag,ah,ai,aj,ak,al,am,an=ac(ae.PubTypes),ac(ae.Types),ac(ae.Animation.TweenScheduler),ac(ae.Dependencies.
useDependency),ac(ae.Dependencies.initDependency),ac(ae.Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Utility.
xtypeof),{}local ao,ap={__index=an},{__mode='k'}function an.get(b,c:boolean?):any if c~=false then ai(b)end return b.
_currentValue end function an.update(b):boolean local c=b._goalState:get(false)if c==b._nextValue and not b.
_currentlyAnimating then return false end local d=b._tweenInfo if b._tweenInfoIsState then d=d:get()end if typeof(d)~=
'TweenInfo'then al('mistypedTweenInfo',nil,typeof(d))return false end b._prevValue=b._currentValue b._nextValue=c b.
_currentTweenStartTime=os.clock()b._currentTweenInfo=d local e=d.DelayTime+d.Time if d.Reverses then e+=d.Time end e*=d.
RepeatCount+1 b._currentTweenDuration=e ah.add(b)return false end local function b<T>(c:PubTypes.StateObject<PubTypes.
Animatable>,d:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local e=c:get(false)if d==nil then d=TweenInfo.new()end
local f,g={[c]=true},am(d)=='State'if g then f[d]=true end local h=d if g then h=h:get()end if typeof(h)~='TweenInfo'
then ak('mistypedTweenInfo',nil,typeof(h))end local i=setmetatable({type='State',kind='Tween',dependencySet=f,
dependentSet=setmetatable({},ap),_goalState=c,_tweenInfo=d,_tweenInfoIsState=g,_prevValue=e,_nextValue=e,_currentValue=e
,_currentTweenInfo=d,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},ao)aj(i)c.dependentSet[
i]=true return i end return b end)()end,[8]=function()local aa,ab,ac=a(8)local ad return(function(...)local ae,af=
cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.Parent local ag,ah,ai,aj,ak=
ac(af.Types),ac(af.Animation.lerpType),ac(af.Animation.getTweenRatio),ac(af.Dependencies.updateAll),{}type Set<T> ={[T]:
any}type Tween=Types.Tween<any>local al,am:Set<Tween> ={__mode='k'},{}setmetatable(am,al)function ak.add(an:Tween)am[an]
=true end function ak.remove(an:Tween)am[an]=nil end local function an()local ao=os.clock()for ap:Tween in pairs(am::any
)do local b=ao-ap._currentTweenStartTime if b>ap._currentTweenDuration then if ap._currentTweenInfo.Reverses then ap.
_currentValue=ap._prevValue else ap._currentValue=ap._nextValue end ap._currentlyAnimating=false aj(ap)ak.remove(ap)else
local c=ai(ap._currentTweenInfo,b)local d=ah(ap._prevValue,ap._nextValue,c)ap._currentValue=d ap._currentlyAnimating=
true aj(ap)end end end ae:BindToRenderStep('__FusionTweenScheduler',Enum.RenderPriority.First.Value,an)return ak end)()
end,[9]=function()local aa,ab,ac=a(9)local ad return(function(...)local ae=cloneref and cloneref(game:GetService
'TweenService')or game:GetService'TweenService'local function af(ag:TweenInfo,ah:number):number local ai,aj,ak,al,am,an=
ag.DelayTime,ag.Time,ag.Reverses,1+ag.RepeatCount,ag.EasingStyle,ag.EasingDirection local ao=ai+aj if ak then ao+=aj end
if ah>=ao*al then return 1 end local ap=ah%ao if ap<=ai then return 0 end local b=(ap-ai)/aj if b>1 then b=2-b end local
c=ae:GetValue(b,am,an)return c end return af end)()end,[10]=function()local aa,ab,ac=a(10)local ad return(function(...)
local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah(ai:any,aj:any,ak:number):any
local al=typeof(ai)if typeof(aj)==al then if al=='number'then local am,an=aj::number,ai::number return(am-an)*ak+an
elseif al=='CFrame'then local am,an=aj::CFrame,ai::CFrame return an:Lerp(am,ak)elseif al=='Color3'then local am,an=aj::
Color3,ai::Color3 local ao,ap=ag.to(an),ag.to(am)return ag.from(ao:Lerp(ap,ak),false)elseif al=='ColorSequenceKeypoint'
then local am,an=aj::ColorSequenceKeypoint,ai::ColorSequenceKeypoint local ao,ap=ag.to(an.Value),ag.to(am.Value)return
ColorSequenceKeypoint.new((am.Time-an.Time)*ak+an.Time,ag.from(ao:Lerp(ap,ak),false))elseif al=='DateTime'then local am,
an=aj::DateTime,ai::DateTime return DateTime.fromUnixTimestampMillis((am.UnixTimestampMillis-an.UnixTimestampMillis)*ak+
an.UnixTimestampMillis)elseif al=='NumberRange'then local am,an=aj::NumberRange,ai::NumberRange return NumberRange.new((
am.Min-an.Min)*ak+an.Min,(am.Max-an.Max)*ak+an.Max)elseif al=='NumberSequenceKeypoint'then local am,an=aj::
NumberSequenceKeypoint,ai::NumberSequenceKeypoint return NumberSequenceKeypoint.new((am.Time-an.Time)*ak+an.Time,(am.
Value-an.Value)*ak+an.Value,(am.Envelope-an.Envelope)*ak+an.Envelope)elseif al=='PhysicalProperties'then local am,an=aj
::PhysicalProperties,ai::PhysicalProperties return PhysicalProperties.new((am.Density-an.Density)*ak+an.Density,(am.
Friction-an.Friction)*ak+an.Friction,(am.Elasticity-an.Elasticity)*ak+an.Elasticity,(am.FrictionWeight-an.FrictionWeight
)*ak+an.FrictionWeight,(am.ElasticityWeight-an.ElasticityWeight)*ak+an.ElasticityWeight)elseif al=='Ray'then local am,an
=aj::Ray,ai::Ray return Ray.new(an.Origin:Lerp(am.Origin,ak),an.Direction:Lerp(am.Direction,ak))elseif al=='Rect'then
local am,an=aj::Rect,ai::Rect return Rect.new(an.Min:Lerp(am.Min,ak),an.Max:Lerp(am.Max,ak))elseif al=='Region3'then
local am,an=aj::Region3,ai::Region3 local ao,ap=an.CFrame.Position:Lerp(am.CFrame.Position,ak),an.Size:Lerp(am.Size,ak)/
2 return Region3.new(ao-ap,ao+ap)elseif al=='Region3int16'then local am,an=aj::Region3int16,ai::Region3int16 return
Region3int16.new(Vector3int16.new((am.Min.X-an.Min.X)*ak+an.Min.X,(am.Min.Y-an.Min.Y)*ak+an.Min.Y,(am.Min.Z-an.Min.Z)*ak
+an.Min.Z),Vector3int16.new((am.Max.X-an.Max.X)*ak+an.Max.X,(am.Max.Y-an.Max.Y)*ak+an.Max.Y,(am.Max.Z-an.Max.Z)*ak+an.
Max.Z))elseif al=='UDim'then local am,an=aj::UDim,ai::UDim return UDim.new((am.Scale-an.Scale)*ak+an.Scale,(am.Offset-an
.Offset)*ak+an.Offset)elseif al=='UDim2'then local am,an=aj::UDim2,ai::UDim2 return an:Lerp(am,ak)elseif al=='Vector2'
then local am,an=aj::Vector2,ai::Vector2 return an:Lerp(am,ak)elseif al=='Vector2int16'then local am,an=aj::Vector2int16
,ai::Vector2int16 return Vector2int16.new((am.X-an.X)*ak+an.X,(am.Y-an.Y)*ak+an.Y)elseif al=='Vector3'then local am,an=
aj::Vector3,ai::Vector3 return an:Lerp(am,ak)elseif al=='Vector3int16'then local am,an=aj::Vector3int16,ai::Vector3int16
return Vector3int16.new((am.X-an.X)*ak+an.X,(am.Y-an.Y)*ak+an.Y,(am.Z-an.Z)*ak+an.Z)end end if ak<0.5 then return ai
else return aj end end return ah end)()end,[11]=function()local aa,ab,ac=a(11)local ad return(function(...)local ae=ab.
Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah(ai:{number},aj:string):PubTypes.
Animatable?if aj=='number'then return ai[1]elseif aj=='CFrame'then return CFrame.new(ai[1],ai[2],ai[3])*CFrame.
fromAxisAngle(Vector3.new(ai[4],ai[5],ai[6]).Unit,ai[7])elseif aj=='Color3'then return ag.from(Vector3.new(ai[1],ai[2],
ai[3]),false)elseif aj=='ColorSequenceKeypoint'then return ColorSequenceKeypoint.new(ai[4],ag.from(Vector3.new(ai[1],ai[
2],ai[3]),false))elseif aj=='DateTime'then return DateTime.fromUnixTimestampMillis(ai[1])elseif aj=='NumberRange'then
return NumberRange.new(ai[1],ai[2])elseif aj=='NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(ai[2],ai[1]
,ai[3])elseif aj=='PhysicalProperties'then return PhysicalProperties.new(ai[1],ai[2],ai[3],ai[4],ai[5])elseif aj=='Ray'
then return Ray.new(Vector3.new(ai[1],ai[2],ai[3]),Vector3.new(ai[4],ai[5],ai[6]))elseif aj=='Rect'then return Rect.new(
ai[1],ai[2],ai[3],ai[4])elseif aj=='Region3'then local ak,al=Vector3.new(ai[1],ai[2],ai[3]),Vector3.new(ai[4]/2,ai[5]/2,
ai[6]/2)return Region3.new(ak-al,ak+al)elseif aj=='Region3int16'then return Region3int16.new(Vector3int16.new(ai[1],ai[2
],ai[3]),Vector3int16.new(ai[4],ai[5],ai[6]))elseif aj=='UDim'then return UDim.new(ai[1],ai[2])elseif aj=='UDim2'then
return UDim2.new(ai[1],ai[2],ai[3],ai[4])elseif aj=='Vector2'then return Vector2.new(ai[1],ai[2])elseif aj==
'Vector2int16'then return Vector2int16.new(ai[1],ai[2])elseif aj=='Vector3'then return Vector3.new(ai[1],ai[2],ai[3])
elseif aj=='Vector3int16'then return Vector3int16.new(ai[1],ai[2],ai[3])else return nil end end return ah end)()end,[12]
=function()local aa,ab,ac=a(12)local ad return(function(...)local function ae(af:number,ag:number,ah:number):(number,
number,number,number)if af==0 or ah==0 then return 1,0,0,1 end local ai,aj,ak,al if ag>1 then local am,an=af*ah,math.
sqrt(ag^2-1)local ao,ap=-0.5/an,-an-ag local b,c=1/ap,math.exp(am*ap)local d=math.exp(am*b)ai=(d*ap-c*b)*ao aj=(c-d)*ao/
ah ak=(d-c)*ao*ah al=(c*ap-d*b)*ao elseif ag==1 then local am=af*ah local an=math.exp(-am)ai=an*(1+am)aj=an*af ak=an*(-
am*ah)al=an*(1-am)else local am,an=af*ah,math.sqrt(1-ag^2)local ao,ap,b=1/an,an*am,math.exp(-am*ag)local c,d=b*math.sin(
ap),b*math.cos(ap)local e=c*ao local f=e*ag ai=f+d aj=e ak=-(f*ag+c*an)al=d-f end return ai,aj,ak,al end return ae end)(
)end,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.
PubTypes),ac(ae.Colour.Oklab)local function ah(ai:any,aj:string):{number}if aj=='number'then local ak=ai::number return{
ak}elseif aj=='CFrame'then local ak,al=ai:ToAxisAngle()return{ai.X,ai.Y,ai.Z,ak.X,ak.Y,ak.Z,al}elseif aj=='Color3'then
local ak=ag.to(ai)return{ak.X,ak.Y,ak.Z}elseif aj=='ColorSequenceKeypoint'then local ak=ag.to(ai.Value)return{ak.X,ak.Y,
ak.Z,ai.Time}elseif aj=='DateTime'then return{ai.UnixTimestampMillis}elseif aj=='NumberRange'then return{ai.Min,ai.Max}
elseif aj=='NumberSequenceKeypoint'then return{ai.Value,ai.Time,ai.Envelope}elseif aj=='PhysicalProperties'then return{
ai.Density,ai.Friction,ai.Elasticity,ai.FrictionWeight,ai.ElasticityWeight}elseif aj=='Ray'then return{ai.Origin.X,ai.
Origin.Y,ai.Origin.Z,ai.Direction.X,ai.Direction.Y,ai.Direction.Z}elseif aj=='Rect'then return{ai.Min.X,ai.Min.Y,ai.Max.
X,ai.Max.Y}elseif aj=='Region3'then return{ai.CFrame.X,ai.CFrame.Y,ai.CFrame.Z,ai.Size.X,ai.Size.Y,ai.Size.Z}elseif aj==
'Region3int16'then return{ai.Min.X,ai.Min.Y,ai.Min.Z,ai.Max.X,ai.Max.Y,ai.Max.Z}elseif aj=='UDim'then return{ai.Scale,ai
.Offset}elseif aj=='UDim2'then return{ai.X.Scale,ai.X.Offset,ai.Y.Scale,ai.Y.Offset}elseif aj=='Vector2'then return{ai.X
,ai.Y}elseif aj=='Vector2int16'then return{ai.X,ai.Y}elseif aj=='Vector3'then return{ai.X,ai.Y,ai.Z}elseif aj==
'Vector3int16'then return{ai.X,ai.Y,ai.Z}else return{}end end return ah end)()end,[15]=function()local aa,ab,ac=a(15)
local ad return(function(...)local ae={}function ae.to(af:Color3):Vector3 local ag,ah,ai=af.R*0.4122214708+af.G*
0.5363325363+af.B*0.0514459929,af.R*0.2119034982+af.G*0.6806995451+af.B*0.1073969566,af.R*0.0883024619+af.G*0.2817188376
+af.B*0.6299787005 local aj,ak,al=ag^(0.3333333333333333),ah^(0.3333333333333333),ai^(0.3333333333333333)return Vector3.
new(aj*0.2104542553+ak*0.793617785-al*0.0040720468,aj*1.9779984951-ak*2.428592205+al*0.4505937099,aj*0.0259040371+ak*
0.7827717662-al*0.808675766)end function ae.from(af:Vector3,ag:boolean?):Color3 local ah,ai,aj=af.X+af.Y*0.3963377774+af
.Z*0.2158037573,af.X-af.Y*0.1055613458-af.Z*0.0638541728,af.X-af.Y*0.0894841775-af.Z*1.291485548 local ak,al,am=ah^3,ai^
3,aj^3 local an,ao,ap=ak*4.0767416621-al*3.3077115913+am*0.2309699292,ak*-1.2684380046+al*2.6097574011-am*0.3413193965,
ak*-4.196086299999999E-3-al*0.7034186147+am*1.707614701 if not ag then an=math.clamp(an,0,1)ao=math.clamp(ao,0,1)ap=math
.clamp(ap,0,1)end return Color3.new(an,ao,ap)end return ae end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Logging.parseError),ac(ae.Dependencies.
sharedState)type Set<T> ={[T]:any}local ai,aj=ah.initialisedStack,0 local function ak(al:Set<PubTypes.Dependency>,am:(
...any)->any,...):(boolean,any)local an=ah.dependencySet ah.dependencySet=al ah.initialisedStackSize+=1 local ao,ap=(ah.
initialisedStackSize)if ao>aj then ap={}ai[ao]=ap aj=ao else ap=ai[ao]table.clear(ap)end local b=table.pack(xpcall(am,ag
,...))ah.dependencySet=an ah.initialisedStackSize-=1 return table.unpack(b,1,b.n)end return ak end)()end,[18]=function()
local aa,ab,ac=a(18)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.
Dependencies.sharedState)local ah=ag.initialisedStack local function ai(aj:PubTypes.Dependency)local ak=ag.
initialisedStackSize for al,am in ipairs(ah)do if al>ak then return end am[aj]=true end end return ai end)()end,[19]=
function()local aa,ab,ac=a(19)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.PubTypes)type Set<T>
={[T]:any}local ag:{Set<PubTypes.Dependency>},ah,ai:Set<PubTypes.Dependency>?={},0 return{dependencySet=ai,
initialisedStack=ag,initialisedStackSize=ah}end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)
local ae=ab.Parent.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}type Descendant=(PubTypes.Dependent&PubTypes.
Dependency)|PubTypes.Dependent local function ag(ah:PubTypes.Dependency)local ai:{[Descendant]:number},aj:{[Descendant]:
boolean},ak:{Descendant},al,am={},{},{},0,1 for an in ah.dependentSet do al+=1 ak[al]=an aj[an]=true end while am<=al do
local ao=ak[am]local ap=ai[ao]ai[ao]=if ap==nil then 1 else ap+1 if(ao::any).dependentSet~=nil then for b in(ao::any).
dependentSet do al+=1 ak[al]=b end end am+=1 end am=1 while am<=al do local ao=ak[am]local ap=ai[ao]-1 ai[ao]=ap if ap==
0 and aj[ao]and ao:update()and(ao::any).dependentSet~=nil then for b in(ao::any).dependentSet do aj[b]=true end end am+=
1 end end return ag end)()end,[21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent
local af,ag=ac(ae.PubTypes),ac(ae.Dependencies.sharedState)local ah=ag.initialisedStack local function ai(aj:PubTypes.
Dependency)local ak=ag.dependencySet if ak~=nil then local al=ag.initialisedStackSize if al>0 then local am=ah[al]if am[
aj]~=nil then return end end ak[aj]=true end end return ai end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.Logging.logWarn),ac(ae.State.Observer),
ac(ae.Utility.xtypeof)type Set<T> ={[T]:boolean}local aj,ak=false,{}ak.type='SpecialKey'ak.kind='Children'ak.stage=
'descendants'function ak.apply(al,am:any,an:Instance,ao:{PubTypes.Task})local ap:Set<Instance>,b:Set<Instance>,c:{[
PubTypes.StateObject<any>]:()->()},d:{[PubTypes.StateObject<any>]:()->()},e,f:()->()={},{},{},{},false local function g(
)if not e then return end e=false b,ap=ap,b d,c=c,d table.clear(ap)table.clear(c)local function h(i:any,j:string?)local
k=ai(i)if k=='Instance'then ap[i]=true if b[i]==nil then i.Parent=an else b[i]=nil end if aj and j~=nil then i.Name=j
end elseif k=='State'then local l=i:get(false)if l~=nil then h(l,j)end local m=d[i]if m==nil then m=ah(i):onChange(f)
else d[i]=nil end c[i]=m elseif k=='table'then for l,m in pairs(i)do local n,o:string?=(typeof(l))if n=='string'then o=l
elseif n=='number'and j~=nil then o=j..'_'..l end h(m,o)end else ag('unrecognisedChildType',k)end end if am~=nil then h(
am)end for i in pairs(b)do i.Parent=nil end for j,k in pairs(d)do k()end end f=function()if not e then e=true task.
defer(g)end end table.insert(ao,function()am=nil e=true g()end)e=true g()end return ak::PubTypes.SpecialKey end)()end,[
24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),{}
ag.type='SpecialKey'ag.kind='Cleanup'ag.stage='observer'function ag.apply(ah,ai:any,aj:Instance,ak:{PubTypes.Task})table
.insert(ak,ai)end return ag end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.Parent
.Parent local af,ag=ac(ae.PubTypes),ac(ae.Instances.applyInstanceProps)local function ah(ai:Instance)return function(aj:
PubTypes.PropertyTable):Instance ag(aj,ai)return ai end end return ah end)()end,[26]=function()local aa,ab,ac=a(26)local
ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.Instances.defaultProps),ac(ae.
Instances.applyInstanceProps),ac(ae.Logging.logError)local function aj(ak:string)return function(al:PubTypes.
PropertyTable):Instance local am,an=pcall(Instance.new,ak)if not am then ai('cannotCreateClass',nil,ak)end local ao=ag[
ak]if ao~=nil then for ap,b in pairs(ao)do an[ap]=b end end ah(al,an)return an end end return aj end)()end,[27]=function
()local aa,ab,ac=a(27)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Logging.
logError)local function ah(ai:string):PubTypes.SpecialKey local aj={}aj.type='SpecialKey'aj.kind='OnChange'aj.stage=
'observer'function aj.apply(ak,al:any,am:Instance,an:{PubTypes.Task})local ao,ap=pcall(am.GetPropertyChangedSignal,am,ai
)if not ao then ag('cannotConnectChange',nil,am.ClassName,ai)elseif typeof(al)~='function'then ag('invalidChangeHandler'
,nil,ai)else table.insert(an,ap:Connect(function()al((am::any)[ai])end))end end return aj end return ah end)()end,[28]=
function()local aa,ab,ac=a(28)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.
Logging.logError)local function ah(ai:Instance,aj:string)return(ai::any)[aj]end local function ai(aj:string):PubTypes.
SpecialKey local ak={}ak.type='SpecialKey'ak.kind='OnEvent'ak.stage='observer'function ak.apply(al,am:any,an:Instance,ao
:{PubTypes.Task})local ap,b=pcall(ah,an,aj)if not ap or typeof(b)~='RBXScriptSignal'then ag('cannotConnectEvent',nil,an.
ClassName,aj)elseif typeof(am)~='function'then ag('invalidEventHandler',nil,aj)else table.insert(ao,b:Connect(am))end
end return ak end return ai end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae=ab.Parent
.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Logging.logError),ac(ae.Utility.xtypeof)local function ai(aj:string):
PubTypes.SpecialKey local ak={}ak.type='SpecialKey'ak.kind='Out'ak.stage='observer'function ak.apply(al,am:any,an:
Instance,ao:{PubTypes.Task})local ap,b=pcall(an.GetPropertyChangedSignal,an,aj)if not ap then ag('invalidOutProperty',
nil,an.ClassName,aj)elseif ah(am)~='State'or am.kind~='Value'then ag'invalidOutType'else am:set((an::any)[aj])table.
insert(ao,b:Connect(function()am:set((an::any)[aj])end))table.insert(ao,function()am:set(nil)end)end end return ak end
return ai end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae=ab.Parent.Parent local af,
ag,ah,ai=ac(ae.PubTypes),ac(ae.Logging.logError),ac(ae.Utility.xtypeof),{}ai.type='SpecialKey'ai.kind='Ref'ai.stage=
'observer'function ai.apply(aj,ak:any,al:Instance,am:{PubTypes.Task})if ah(ak)~='State'or ak.kind~='Value'then ag
'invalidRefType'else ak:set(al)table.insert(am,function()ak:set(nil)end)end end return ai end)()end,[31]=function()local
aa,ab,ac=a(31)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj=ac(ae.PubTypes),ac(ae.Utility.
cleanup),ac(ae.Utility.xtypeof),ac(ae.Logging.logError),ac(ae.State.Observer)local function ak(al:Instance,am:string,an:
any)(al::any)[am]=an end local function al(am:Instance,an:string)(am::any)[an]=(am::any)[an]end local function am(an:
Instance,ao:string,ap:any)if not pcall(ak,an,ao,ap)then if not pcall(al,an,ao)then if an==nil then ai(
'setPropertyNilRef',nil,ao,tostring(ap))else ai('cannotAssignProperty',nil,an.ClassName,ao)end else local b,c=typeof(ap)
,typeof((an::any)[ao])ai('invalidPropertyType',nil,an.ClassName,ao,c,b)end end end local function an(ao:Instance,ap:
string,b:PubTypes.CanBeState<any>,c:{PubTypes.Task})if ah(b)=='State'then local d=false local function e()if not d then
d=true task.defer(function()d=false am(ao,ap,b:get(false))end)end end am(ao,ap,b:get(false))table.insert(c,aj(b::any):
onChange(e))else am(ao,ap,b)end end local function ao(ap:PubTypes.PropertyTable,b:Instance)local c,d={self={}::{[
PubTypes.SpecialKey]:any},descendants={}::{[PubTypes.SpecialKey]:any},ancestor={}::{[PubTypes.SpecialKey]:any},observer=
{}::{[PubTypes.SpecialKey]:any}},{}for e,f in pairs(ap)do local g=ah(e)if g=='string'then if e~='Parent'then an(b,e::
string,f,d)end elseif g=='SpecialKey'then local h=(e::PubTypes.SpecialKey).stage local i=c[h]if i==nil then ai(
'unrecognisedPropertyStage',nil,h)else i[e]=f end else ai('unrecognisedPropertyKey',nil,ah(e))end end for g,h in pairs(c
.self)do g:apply(h,b,d)end for i,j in pairs(c.descendants)do i:apply(j,b,d)end if ap.Parent~=nil then an(b,'Parent',ap.
Parent,d)end for k,l in pairs(c.ancestor)do k:apply(l,b,d)end for m,n in pairs(c.observer)do m:apply(n,b,d)end b.
Destroying:Connect(function()ag(d)end)end return ao end)()end,[32]=function()local aa,ab,ac=a(32)local ad return(
function(...)return{ScreenGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},BillboardGui={ResetOnSpawn
=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},SurfaceGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.
Sibling,SizingMode=Enum.SurfaceGuiSizingMode.PixelsPerStud,PixelsPerStud=50},Frame={BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},ScrollingFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3
.new(0,0,0),BorderSizePixel=0,ScrollBarImageColor3=Color3.new(0,0,0)},TextLabel={BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize
=14},TextButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,AutoButtonColor=
false,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextBox={BackgroundColor3=Color3.new(1
,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,ClearTextOnFocus=false,Font=Enum.Font.SourceSans,Text='',
TextColor3=Color3.new(0,0,0),TextSize=14},ImageLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0},ImageButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,
AutoButtonColor=false},ViewportFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=
0},VideoFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},CanvasGroup={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[59]=function()local aa,
ab,ac=a(59)local ad return(function(...)return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',
minimize='rbxassetid://15556637715',close='rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown=
'rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check=
'rbxassetid://10709790644',command='rbxassetid://10723416765',input='rbxassetid://10734982297',search=
'rbxassetid://10734943674',finger='rbxassetid://10734929723',alert='rbxassetid://10709752996',paint=
'rbxassetid://10734910187',cog='rbxassetid://10709810948'}end)()end,[83]=function()local aa,ab,ac=a(83)local ad return(
function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,
am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao,ap,b,c,d,m,n,o=an.New,an.Children,an.Value,
an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local p,q,r,s,t,u,v,w,x=o.UIListLayout,o.UICorner,o.
UITextSizeConstraint,o.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae
.utilities)local y,z,A,B,C,D,E,F,G,H,I,J,K=x.get,x.references,x.drag,x.customFont,x.animate,x.connections,ac(ab.Parent.
Parent.components.warn)[1],b(),b(),b(),b(),b(),b()z.add(J,I,H,G,F,K)local L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,_=am.find
'absoluteOffset',am.find'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible'
,am.find'isMobile',am.find'isListening',am.find'bindData',am.find'destroyFunc'.func,b(750),b(500),b(false),b(false),b(
false),b(false)m(X):onChange(function()if y(X)then Y:set(not y(Y))task.wait(0.3)Z:set(not y(Z))task.wait(0.3)_:set(not
y(_))else _:set(not y(_))task.wait(0.3)Z:set(not y(Z))task.wait(0.3)Y:set(not y(Y))end end)m(Z):onChange(function()V:
set(y(Z)and 212 or 750)end)m(_):onChange(function()W:set(y(_)and 74 or 500)end)local as,at,au=b(false),b(),b(false)
local function av(aw:EnumItem,ax:string)local ay,az=y(P.binds),y(T.bindData)if table.find(ay,aw)then E((
'Key %s is already in use. %s'):format(aw.Name,ax))else table.insert(ay,aw)if y(at)then table.remove(ay,table.find(ay,y(
at)))az[y(at).Name]=nil end at:set(aw)au:set(true)az[y(at).Name]={bind=y(at),name='Toggle Interface'}T:update('bindData'
,az)P:update('binds',ay)end end if not y(R.boolean)then av(af.HideBind,'init')end local aw=b''m(N.string):onChange(
function()local ax=y(N.string)local ay=am.find(ax)aw:set(y(ay.Name):upper())end)local ax,ay,az=(b(af.Icon or''))local aA
=ao'ScreenGui'{Name=y(M.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[c]=J,[ap]={ao
'Frame'{Name='screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},ao'Frame'{Name='container',Visible=Q.
boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,y(L.number)),Size=C(function()return UDim2.
fromOffset(y(V),y(W))end,30,1),BackgroundColor3=ak.background,[c]=F,[ap]={q(6),s(16),p(t.LayoutOrder,u.Horizontal,v.
Right,w.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=C(function()return UDim2.new(0,math.
clamp(y(V)-32-180-16,212,9e9),y(Y)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao
'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=aw,TextXAlignment=
Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=B('Montserrat',Enum.FontWeight.ExtraBold),
TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},
ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={p(t.LayoutOrder,u.Vertical,v.Left,w.Top,UDim.new(0,16
)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={p(t.LayoutOrder,u.Horizontal,v.Left,w.Top,UDim.new(
0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[ap]={p(t.LayoutOrder,u.Horizontal,v.Left,w.Top,
UDim.new(0,5)),ao'ImageLabel'{Visible=d(function()if y(ax)~=''then return true end return false end),Size=UDim2.
fromOffset(44,44),BackgroundTransparency=1,Image=ax,ImageColor3=ak.text2},ao'Frame'{Size=d(function()if y(ax)~=''then
return UDim2.new(1,-49,1,0)end return UDim2.new(1,0,1,0)end),BackgroundTransparency=1,[ap]={p(t.LayoutOrder,u.Vertical,v
.Left,w.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=B(
'Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left
},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=ak.text2,FontFace=B('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left}}}}},ao'TextButton'{
Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[n'Activated']=function()local aA=y(K)if aA then aA:
CaptureFocus()end end,[ap]={s(0,4),q(6),p(t.LayoutOrder,u.Horizontal,v.Center,w.Center,UDim.new(0,4)),ao'ImageLabel'{
Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1
,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=B('Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',
PlaceholderColor3=ak.text2,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,
ClearTextOnFocus=true,[n'Changed']=function(aA)local aB=y(K)if aA~='Text'and aB and aB.Text then return end O:update(
'string',aB.Text)end,[c]=K}}}}},ao'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),BackgroundTransparency=1,[c]=H}}
}}},ao'Frame'{Size=C(function()return y(_)and UDim2.new(0,180,0,44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.
background2,ClipsDescendants=true,[ap]={q(6),p(t.LayoutOrder,u.Vertical,v.Center,w.Top,UDim.new(0,8)),ao'Frame'{Size=
UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={p(t.LayoutOrder,u.Horizontal,v.Center,w.Center,UDim.new(0,4)),ao
'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,[n'Activated']=function()if y(R.boolean)then au:
set(true)az=A(ay,15)return end as:set(true)S:update('boolean',true)end,[ap]={q(6),s(6),p(t.LayoutOrder,u.Horizontal,v.
Left,w.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=y(R.
boolean)and al.finger or al.command,ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not y(R.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=B('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=d(function()return y(as)and'Listening'or y(at)and y(
at).Name or'Waiting'end)},ao'TextLabel'{Visible=y(R.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=B('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.
text2,Text=d(function()return y(au)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),
BackgroundColor3=ak.selectedTab,[n'Activated']=function()X:set(not y(X))end,[ap]={q(6),ao'ImageLabel'{AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=d(
function()return y(X)and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size
=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[n'Activated']=function()if not y(au)then ac(ae.components.
notification){Parent=I,Title='Darius Interface',Body=`You must {y(R.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`
,Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end Q:update('boolean',not y(Q.boolean))end,[ap]={q(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=C(function()return y(_)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[c]=G,[ap]={p(t.LayoutOrder,u.Vertical,v.Left,w.Top,UDim.new(0,6)),s(0,10)}},ao'TextButton'{Size=
UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[n'Activated']=function()y(U)()end,[ap]={q(4),s(6),p(t.LayoutOrder
,u.Horizontal,v.Left,w.Center,UDim.new(0,4)),ao'ImageLabel'{BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),
ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=B('Montserrat',
Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment
=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao
'Frame'{Name='notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),
AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[c]=I,[ap]={p(t.LayoutOrder,u.Vertical,v.Right,w.Bottom)}}}}if aA.
screenSize.AbsoluteSize.X<y(V)then V:set(aA.screenSize.AbsoluteSize.X*0.9)end if aA.screenSize.AbsoluteSize.Y<y(W)then W
:set(aA.screenSize.AbsoluteSize.Y*0.9)end ay=ao'TextButton'{Visible=d(function()return(y(au)and y(R.boolean))end),
Interactable=d(function()return(y(au)and y(R.boolean))end),Parent=z.get(y(M.name)),Size=UDim2.fromOffset(60,60),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text='Toggle UI',FontFace=B(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.mobileButtonBackground,
BackgroundTransparency=0.6,TextTransparency=0.1,[n'Activated']=function()if az then az:Disconnect()az=nil else Q:update(
'boolean',not y(Q.boolean))end end,[ap]={s(4),q(16),r(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=y(R.boolean)and al.finger
or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local aB=aj.InputBegan:Connect(function(aB,aC)if
y(R.boolean)then return end if y(as)then if aB.KeyCode and aB.KeyCode~=Enum.KeyCode.Unknown then av(aB.KeyCode,
'From input box')end as:set(false)task.wait()S:update('boolean',false)else if aB.KeyCode and aB.KeyCode==y(at)and not aC
and not y(S.boolean)then Q:update('boolean',not y(Q.boolean))end end end)D.add(aB)local aC=A(z.get'container',15)D.add(z
.get'container':GetPropertyChangedSignal'Position':Connect(function()local aD=z.get'container'local aE,aF=aD.
AbsolutePosition+Vector2.new(y(V)/2,y(W)/2),aA.screenSize.AbsoluteSize local aG,aH,aI,aJ=aF.X+(y(X)and y(V)/4 or(y(V)/6)
*2.5),aF.Y+(y(X)and y(W)/8 or(y(W)/6)*2.3),false,''if aE.X>aG or aF.X-aE.X>aG then aI=true aJ='x'end if aE.Y+y(L.number)
>aH or aF.Y-aE.Y-y(L.number)>aH then aI=true aJ='y'end if aI and aJ=='x'then aC:Disconnect()aD.Position=UDim2.new(0.5,0,
aD.Position.Y.Scale,aD.Position.Y.Offset)aC=A(z.get'container',15)elseif aI and aJ=='y'then aC:Disconnect()aD.Position=
UDim2.new(aD.Position.X.Scale,aD.Position.X.Offset,0.5,y(L.number))aC=A(z.get'container',15)end end))end end)()end,[95]=
function()local aa,ab,ac=a(95)local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles
.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(as,at,au)return as
+(at-as)*au end local as=Instance.new'BindableEvent'local function at(au)if not(ao)then return end if not(al)and(an)then
ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,au*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,an.Y.
Offset,au*ah))return end local av=(am-ai:GetMouseLocation())local aw,ax=(ao.X.Offset-av.X),(ao.Y.Offset-av.Y)an=UDim2.
new(ao.X.Scale,aw,ao.Y.Scale,ax)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,aw,au*ah),ao.Y.Scale,ap(ak.
Position.Y.Offset,ax,au*ah))end ak.InputBegan:Connect(function(au)if au.UserInputType==Enum.UserInputType.MouseButton1
or au.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()au.Changed:Connect(
function()if au.UserInputState==Enum.UserInputState.End then as:Fire()al=false end end)end end)local au=aj.Heartbeat:
Connect(at)return au,as.Event end end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)
local function ae(af:any,ag:any):boolean if typeof(af)=='table'then return false else return af==ag end end return ae
end)()end,[93]=function()local aa,ab,ac=a(93)local ad return(function(...)local ae={Inter='rbxassetid://12187365364',
Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.FontWeight?,ah:Enum.FontStyle?)assert(af,
'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal if ae[af]then return Font.new(ae[af],ag,
ah)else error('no font:',af)end end end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae=
ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local au,av,aw
,ax,ay,az,aA,aB=at.get,at.animate,at.typecheck,at.customFont,at.drag,at.references,at.connections,ac(ae.simpleElements)
local aC,aD,aE,aF,aG,aH,aI,aJ,b=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name={},Children={}},{})assert(aJ,table.concat(b,'\n'))local c,d,m,n=
ah.find'instanceName',ah.find'absoluteOffset',af.Name,an(af.Children)local o,p,q=az.get(au(c.name)),(an(false))q=al
'TextButton'{Parent=o,Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10+au(d.number)),BackgroundTransparency
=1,[ap'MouseButton1Down']=function()p:set(true)end,[am]={al'Frame'{Position=UDim2.new(0.5,-120,0,0),Size=UDim2.
fromOffset(240,0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={aE(4),aD(8),al'TextButton'{
AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),BackgroundColor3=ai.selectedTab,
[ap'Activated']=function()q:Destroy()end,[am]={aE(6),al'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,[am
]={aC(aF.LayoutOrder,aG.Vertical,aH.Center,aI.Top,UDim.new(0,8)),al'Frame'{Size=av(function()return au(p)and UDim2.new(
0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=av(function()return au(p)
and 0 or 0.5 end,40,1),[am]={aE(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=ax('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=m,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]=n}}}}}}}}}local r,s=ay(q,15)local t=s:Connect(function()p:set(false)end)aA.add(r)aA.add(t)q.
Destroying:Once(function()r:Disconnect()t:Disconnect()end)return q,function(...)n:set(...)end end end)()end,[36]=
function()local aa,ab,ac=a(36)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Logging.messages)
local function ag(ah,...)local ai:string if af[ah]~=nil then ai=af[ah]else ah='unknownMessage'ai=af[ah]end warn(string.
format('[Fusion] '..ai..'\n(ID: '..ah..')',...))end return ag end)()end,[92]=function()local aa,ab,ac=a(92)local ad
return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.add(ah)table.insert(ae,ah)end
function af.deleteConnections()for ah,ai in ae do if typeof(ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil
end end return af end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(...)local ae=ab.Parent.Parent
local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,as=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.
Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal)
,ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local at,au={
__index=as},{__mode='k'}function as.get(av,aw:boolean?):any if aw~=false then aj(av)end return av._outputTable end
function as.update(av):boolean local aw=av._inputIsState local ax,ay,az,aA,aB=if aw then av._inputTable:get(false)else
av._inputTable,av._oldInputTable,av._keyIOMap,av._meta,false for aC in pairs(av.dependencySet)do aC.dependentSet[av]=nil
end av._oldDependencySet,av.dependencySet=av.dependencySet,av._oldDependencySet table.clear(av.dependencySet)if aw then
av._inputTable.dependentSet[av]=true av.dependencySet[av._inputTable]=true end av._oldOutputTable,av._outputTable=av.
_outputTable,av._oldOutputTable local aD,aE=av._oldOutputTable,av._outputTable table.clear(aE)for aF,aG in pairs(ax)do
local aH=av._keyData[aF]if aH==nil then aH={dependencySet=setmetatable({},au),oldDependencySet=setmetatable({},au),
dependencyValues=setmetatable({},au)}av._keyData[aF]=aH end local aI=ay[aF]~=aG if aI==false then for aJ,b in pairs(aH.
dependencyValues)do if b~=aJ:get(false)then aI=true break end end end if aI then aH.oldDependencySet,aH.dependencySet=aH
.dependencySet,aH.oldDependencySet table.clear(aH.dependencySet)local aJ,b,c,d=ah(aH.dependencySet,av._processor,aF,aG)
if aJ then if av._destructor==nil and(ap(b)or ap(c)or ap(d))then an'destructorNeededForPairs'end if aE[b]~=nil then
local m,n for o,p in pairs(az)do if p==b then n=ax[o]if n~=nil then m=o break end end end if m~=nil then am(
'forPairsKeyCollision',nil,tostring(b),tostring(m),tostring(n),tostring(aF),tostring(aG))end end local m=aD[b]if m~=c
then local n=aA[b]if m~=nil then local o,p=xpcall(av._destructor or ao,ak,b,m,n)if not o then al(
'forPairsDestructorError',p)end end aD[b]=nil end ay[aF]=aG az[aF]=b aA[b]=d aE[b]=c aB=true else aH.oldDependencySet,aH
.dependencySet=aH.dependencySet,aH.oldDependencySet al('forPairsProcessorError',b)end else local aJ=az[aF]if aE[aJ]~=nil
then local b,c for d,m in pairs(az)do if aJ==m then c=ax[d]if c~=nil then b=d break end end end if b~=nil then am(
'forPairsKeyCollision',nil,tostring(aJ),tostring(b),tostring(c),tostring(aF),tostring(aG))end end aE[aJ]=aD[aJ]end for
aJ in pairs(aH.dependencySet)do aH.dependencyValues[aJ]=aJ:get(false)av.dependencySet[aJ]=true aJ.dependentSet[av]=true
end end for aH,aI in pairs(aD)do if aE[aH]~=aI then local aJ=aA[aH]if aI~=nil then local b,c=xpcall(av._destructor or ao
,ak,aH,aI,aJ)if not b then al('forPairsDestructorError',c)end end if aE[aH]==nil then aA[aH]=nil av._keyData[aH]=nil end
aB=true end end for aJ in pairs(ay)do if ax[aJ]==nil then ay[aJ]=nil az[aJ]=nil end end return aB end local function av<
KI,VI,KO,VO,M>(aw:PubTypes.CanBeState<{[KI]:VI}>,ax:(KI,VI)->(KO,VO,M?),ay:((KO,VO,M?)->())?):Types.ForPairs<KI,VI,KO,VO
,M>local az=aw.type=='State'and typeof(aw.get)=='function'local aA=setmetatable({type='State',kind='ForPairs',
dependencySet={},dependentSet=setmetatable({},au),_oldDependencySet={},_processor=ax,_destructor=ay,_inputIsState=az,
_inputTable=aw,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},at)ai(aA)aA:
update()return aA end return av end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local ae=ac(ab
.Parent.Parent.utilities)local af,ag,ah=(ae.customFunctions)if af.getthreadidentity()<5 then ah=af.getthreadidentity()af
.setthreadidentity(5)end ag=loadstring(game:GetObjects'rbxassetid://85554466048193'[1].Source)()af.setthreadidentity(ah)
return ag end)()end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,
ao,ap,as,at,au,av=al.New,al.Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local aw,ax,ay,
az,aA=av.get,av.animate,av.typecheck,av.customFont,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aG,aH,aI,aJ=aA.UIListLayout
,aA.UIPadding,aA.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ay(af,{Name=
'',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Items={},Multiselect=true,Regex=function
()end,IgnoreConfig=true,Alphabetical=true,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or
'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Multiselect and''or'Multiselect',af.Regex and''or
'Regex',af.IgnoreConfig and''or'IgnoreConfig',af.Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})
assert(aI,table.concat(aJ,'\n'))aI,aJ=ay(af,{Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aI,
table.concat(aJ,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string',
'The Regex function must always return a string')end local b,c,d,m,n,o,p,q,r,s,t,u,v,w,x,y,z=ah.find'selectedTab',ah.
find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled
or ao(true),af.Visible or ao(true),af.Callback,ao{},af.Multiselect or ao(false),af.Default,af.IgnoreConfig or ao(false),
af.Alphabetical or ao(false),af.AlwaysOpen or ao(false),af.Regex or ao(function(b)return b end)local A,B=(af.FLAG or ao(
m.uid))if aw(A)~=''then B=ak.register(aw(A),{items=ao{},item=ao'',multiselect=aw(u)},'dropdown',aw(A)==m.uid)B.user.
Value=aw(u)and aw(B.status.items)or aw(B.status.item)end local C,D,E,F,G,H,I,J=B.status.items,B.status.item,ao(),ao(
false),ao(aw(u)and{}or''),ao{},ao{},ao(false)ap(C):onChange(function()if#aw(C)==#aw(t)then J:set(true)else J:set(false)
end local K={}for L,M in aw(C)do table.insert(K,aw(z)(M))end task.wait()task.spawn(aw(s),K)G:set(aw(C))end)ap(D):
onChange(function()task.wait()task.spawn(aw(s),aw(z)(aw(D)))G:set(aw(z)(aw(D)))end)local K=ao(aw(b.string)==aw(m.tab).
uid)ap(b.string):onChange(function()K:set(aw(b.string)==aw(m.tab).uid)end)local L=ax(function()return aw(K)and 0 or 1
end,40,1)local function M(N)for O,P in aw(t)do local Q=typeof(P)=='table'and P.Value or P if Q==N then return true end
end return false end am'Frame'{Parent=n,Visible=at(function()if aw(d.string)~=''and not string.find(aw(o):lower(),aw(d.
string):lower())or not aw(r)then return false end return true end),Size=ax(function()if aw(F)then return UDim2.new(1,0,0
,76+(aw(u)and(42)or 6)+math.clamp((#aw(t)*34),34,136))end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.
background2,BackgroundTransparency=L,ClipsDescendants=true,[an]={aD(6),aB(aE.LayoutOrder,aF.Vertical,aG.Left,aH.Top,UDim
.new(0,4)),am'TextButton'{Interactable=at(function()if not aw(q)then return false end return aw(K)end),Size=UDim2.new(1,
0,0,36),BackgroundTransparency=1,[as'Activated']=function()if aw(y)then return end F:set(not aw(F))end,[an]={am'Frame'{
ZIndex=2,Visible=at(function()if not aw(q)then return true end return false end),BackgroundTransparency=ax(function()
return aw(K)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aD(6),am
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=L},am'TextLabel'{FontFace=az(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=L,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()
return aw(p)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aC(0,5)}}}},am'Frame'{Size=UDim2.fromScale(
1,1),BackgroundTransparency=1,[an]={aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,
-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(
0,0,0.5,0),Text=at(function()if aw(u)then return aw(o)..' '..tostring(#aw(C))..'/'..tostring(#aw(t))end if typeof(aw(G))
=='table'then return aw(o)end if aw(I)[aw(G)]then return`{aw(o)}: {aw(I)[aw(G)]}`end return`{aw(o)}: {aw(G)}`end),
TextTransparency=L,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=at(function()return aw(u)and
aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=L}}}}},am'Frame'{Size=UDim2.new(1,0,0,
32),BackgroundTransparency=1,[an]={aC(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,
BackgroundTransparency=L,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,TextTransparency=L,[au]=E,[as'Changed'
]=function(N)local O=aw(E)if N=='Text'and O and O.Text then local P=O.Text for Q,R in aw(H)do if string.find(aw(z)(R.
Name):lower(),P:lower())or P==''then R.Visible=true else R.Visible=false end end end end,[an]={am'UITextSizeConstraint'{
MinTextSize=0,MaxTextSize=16},aD(4),aC(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=
u,[an]={aC(6,6,0,6),am'TextButton'{Interactable=u,Size=UDim2.new(1,0,0,24),BackgroundTransparency=L,BackgroundColor3=ai.
background,[as'Activated']=function()local N={}if not aw(J)then for O,P in aw(t)do P=typeof(P)=='table'and P.Value or P
table.insert(N,aw(z)(P))end end C:set(N)end,[an]={aD(4),aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=at(function()if aw(J)then return'Deselect All'end return'Select All'end),
TextTransparency=L,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=at(
function()return UDim2.new(1,-6,0,math.clamp((#aw(t)*34),34,136))end),BackgroundTransparency=1,ScrollBarThickness=at(
function()return#aw(t)>4 and 6 or 0 end),ScrollBarImageColor3=ai.scrollBar,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aC(6,at(function()return#aw(t)>4 and UDim.new(0,12)or UDim.new(0,0)end),0
,6),aB(aw(x)and aE.Name or aE.LayoutOrder,aF.Vertical,aG.Center,aH.Top,UDim.new(0,6)),H}}}}ap(t):onChange(function()
local N={}for O,P in aw(t)do local Q,R,S,T=(ao(false))if typeof(P)=='table'then local U,V=ay(P,{DisplayValue='',Value=''
,Image=''},{P.Image and''or'Image',P.DisplayValue and''or'DisplayValue'})assert(U,table.concat(V,'\n'))R=P.Value S=P.
Image or nil T=P.DisplayValue or nil else local U,V=ay({Item=P},{Item=''})assert(U,table.concat(V,'\n'))R=P end local U=
aw(z)(R)if T then local V=aw(I)V[R]=T I:set(V)end ap(C):onChange(function()if table.find(aw(C),U)then Q:set(true)else Q:
set(false)end end)ap(D):onChange(function()if aw(D)==U then Q:set(true)else Q:set(false)end end)local V=am'TextButton'{
Name=`{T~=nil and T or R}`,Size=UDim2.new(1,0,0,28),BackgroundTransparency=L,BackgroundColor3=ai.background,[as
'Activated']=function()if aw(u)then local V=aw(C)Q:set(not aw(Q))if aw(Q)then table.insert(V,U)else table.remove(V,table
.find(V,U))end C:set(V)else D:set(U)if aw(y)then return end F:set(false)end end,[an]={aD(4),aC(8),aB(aE.LayoutOrder,aF.
Horizontal,aG.Left,aH.Center,UDim.new(0,6)),am'Frame'{Visible=at(function()return aw(u)and true or false end),Size=UDim2
.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=L,
BackgroundColor3=ax(function()return aw(Q)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[an]={aD(6),am'ImageLabel'{
Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,
Image=aj.check,ImageTransparency=ax(function()if not aw(K)then return 1 end if aw(Q)then return 0 end return 1 end,40,1)
,ImageColor3=ai.selectedTab}}},am'ImageLabel'{Visible=at(function()return S and true or false end),Size=UDim2.
fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=S,
ImageTransparency=L,ImageColor3=ai.text2},am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=at(function(
)return aw(u)and UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=T or R,TextTransparency=L,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(N,V)end H:set(N)end)t:set(aw(af.Items))if aw(y)then
F:set(true)end if aw(c.boolean)and not aw(w)then B.file:Connect(function(N)local O=true if N~=nil then O=false end if
aw(u)then C:set(N)else D:set(N)end if O then if aw(u)then if v and#aw(v)>0 then C:set(aw(v))end else if v then D:set(aw(
v))end end end end)if B.private then if aw(u)then if v and#aw(v)>0 then C:set(aw(v))end else if v then for N,O in aw(t)
do if typeof(O)=='table'and O.Value==aw(v)then D:set(aw(v))elseif O==aw(v)then D:set(aw(v))end end end end end else if
aw(u)then if v and#aw(v)>0 then C:set(aw(v))end else if v then D:set(aw(v))end end end if B.preregistered and B.
preregisteredValue then if aw(u)then if typeof(B.preregisteredValue)=='table'then local N={}for O,P in B.
preregisteredValue do if M(P)then table.insert(N,P)end end C:set(N)end else if typeof(B.preregisteredValue)=='string'and
M(B.preregisteredValue)then D:set(B.preregisteredValue)end end end local N={}function N.SetName(O,P)local Q,R=ay({
SetName=P},{SetName=''})assert(Q,table.concat(R,'\n'))o:set(P)end function N.SetItems(O,P)local Q,R=ay({SetItems=P},{
SetItems={}})assert(Q,table.concat(R,'\n'))t:set(P)local S,T={},false for U,V in aw(t)do local W if typeof(V)=='table'
then W=V.Value else W=V end local X=aw(z)(W)if aw(u)then if typeof(aw(G))=='table'and table.find(aw(G),X)then table.
insert(S,X)T=true end else if aw(G)==X then T=true D:set(X)break end end end if T then if aw(u)then C:set(S)end else if
aw(u)then C:set{}else D:set''end end end function N.SelectItem(O,P)assert(not aw(u),
':SelectItem requires Multiselect to be false')local Q,R=ay({SelectItem=P},{SelectItem=''})assert(Q,table.concat(R,'\n')
)local S=false for T,U in aw(t)do local V=U if typeof(U)=='table'then V=U.Value end local W=aw(z)(P)if aw(z)(V)==W then
S=true break end end assert(S,":SelectItem couldn't find "..P)D:set(P)end function N.SelectItems(O,P)assert(aw(u),
':SelectItems requires Multiselect to be true')local Q,R=ay({SelectItems=P},{SelectItems={}})assert(Q,table.concat(R,
'\n'))for S,T in P do local U=false for V,W in aw(t)do local X=typeof(W)=='table'and aw(z)(W.Value)or aw(z)(W)if T==X
then U=true break end end if U then P[S]=aw(z)(T)else table.remove(P,S)end end C:set(P)end function N.Enable(O)q:set(
true)end function N.Disable(O)q:set(false)end function N.Visible(O)r:set(true)end function N.Invisible(O)r:set(false)end
return N end end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local function ae(af:any):boolean
return typeof(af)=='Instance'end return ae end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag
.Fusion local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local
au,av,aw,ax,ay=at.get,at.animate,at.typecheck,at.customFont,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ=
ay.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ay.UIPadding,ay.
UICorner,af.Parent,af.tab,an(0),an(true)local b=al'Frame'{Visible=aJ,Parent=aG,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[am]={az(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,3))}}local c,d=an(b.
AbsoluteSize),{}function d.Button(m,n)local o,p=aw(n,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=
function()end},{n.IsEnabled and''or'IsEnabled',n.Visible and''or'Visible',n.DisabledText and''or'DisabledText'})assert(o
,table.concat(p,'\n'))local q,r,s,t,u,v,w,x=ah.find'selectedTab',ah.find'searchText',ah.add(n),n.Name,n.Callback,n.
IsEnabled or an(true),n.DisabledText or an'Component Disabled',n.Visible or an(true)local y=an(au(q.string)==au(aH).uid)
ao(q.string):onChange(function()y:set(au(q.string)==au(aH).uid)end)local z=av(function()return au(y)and 0 or 1 end,40,1)
al'TextButton'{Interactable=as(function()if not au(v)then return false end return au(y)end),Visible=as(function()if au(r
.string)~=''and not string.find(au(t):lower(),au(r.string):lower())or not au(x)then return false end return true end),
Size=as(function()return UDim2.new(1/au(aI)-(au(aI)-1==0 and 0 or((((au(aI)-1)*3)/au(aI))/au(c).X)),0,0,36)end),Parent=b
,BackgroundColor3=ai.background2,BackgroundTransparency=z,[ap'Activated']=function()if not au(v)then return end task.
spawn(au(u))end,[am]={aF(6),al'Frame'{ZIndex=2,Visible=as(function()if not au(v)then return true end return false end),
BackgroundTransparency=av(function()return au(y)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[am]={aF(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=z},al'TextLabel'{
FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=z,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=w,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={aE(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[am]={aE(0,8),al'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32
,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0
,0.5,0),Text=t,TextTransparency=z,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.
fromOffset(16,16),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.
fingerprint,ImageColor3=ai.text2,ImageTransparency=av(function()return au(y)and 0.5 or 1 end,40,1)}}}}}if au(x)then aI:
set(au(aI)+1)end ao(x):onChange(function()if au(x)then aI:set(au(aI)+1)else aI:set(au(aI)-1)end end)local A={}function A
.SetName(B,C)local D,E=aw({SetName=C},{SetName=''})assert(D,table.concat(E,'\n'))t:set(C)end function A.SetCallback(B,C)
local D,E=aw({SetCallback=C},{SetCallback=function()end})assert(D,table.concat(E,'\n'))u:set(C)end function A.Fire(B)
task.spawn(au(u))end function A.Enable(B)v:set(true)end function A.Disable(B)v:set(false)end function A.Visible(B)x:set(
true)end function A.Invisible(B)x:set(false)end return A end function d.Visible(m)aJ:set(true)end function d.Invisible(m
)aJ:set(false)end return d end end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag
.services local am,an,ao=al.RunService,al.UserInputService,ag.Fusion local ap,as,at,au,av,aw,ax,ay=ao.New,ao.Children,ao
.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local az,aA,aB,aC,aD,aE,aF=ay.get,ay.animate,ay.
typecheck,ay.customFont,ay.randomString,ay.connections,ac(ae.simpleElements)local aG,aH,aI,aJ,b,c,d,m,n,o=aF.
UIListLayout,aF.UIPadding,aF.UITextSizeConstraint,aF.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment
,Enum.VerticalAlignment,aB(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',
Color=Color3.new(),Transparency=0,HideTransparency=true,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.
IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Color and''or'Color',af.Transparency
and''or'Transparency',af.HideTransparency and''or'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(n,
table.concat(o,'\n'))local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',
ah.find'absoluteOffset',ah.find'currentPicker',ah.add(af),af.Parent,af.Name,af.DisabledText or at'Component Disabled',af
.IsEnabled or at(true),af.Visible or at(true),af.Callback,af.Color or at(Color3.new(1)),af.IgnoreConfig or at(false),af.
Transparency or at(0),af.HideTransparency or at(false)local F,G=(af.FLAG or at(u.uid))if az(F)~=''then G=ak.register(az(
F),{color=at(Color3.new(1)),transparency=at(0)},'colorpicker',az(F)==u.uid)G.user.Value={az(G.status.color),az(G.status.
transparency)}end local H,I=G.status.color,G.status.transparency au(H):onChange(function()if az(y)then task.spawn(az(A),
az(H),az(I))end end)au(I):onChange(function()if az(y)then task.spawn(az(A),az(H),az(I))end end)local J=at(az(p.string)==
az(u.tab).uid)au(p.string):onChange(function()J:set(az(p.string)==az(u.tab).uid)end)local K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,
Z,_,aK=aA(function()return az(J)and 0 or 1 end,40,1),at(),at(0),at(),at(0),at(),at(0),at(),at(false),at(),at(false),at()
,at(false),at(0),at(0),(at(0))local function aL()return{Name=w,Children={aG(b.LayoutOrder,c.Vertical,d.Center,m.Top,UDim
.new(0,5)),ap'TextButton'{Size=UDim2.fromOffset(224,224),[ax]=R,[av'InputBegan']=function(aM)if aM.UserInputType~=Enum.
UserInputType.MouseButton1 and aM.UserInputType~=Enum.UserInputType.Touch then return end S:set(true)local aN aN=aM.
Changed:Connect(function()if aM.UserInputState==Enum.UserInputState.End or aM.UserInputState.Cancel then S:set(false)aN:
Disconnect()end end)end,[as]={ap'UIGradient'{Color=aw(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(az(X),1,1))}end)},ap'Frame'{Size=UDim2.
fromScale(1,1),[as]={ap'UIGradient'{Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,
0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=aw(function()return NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromOffset(10,10),ImageColor3=aw(function()return Color3.
fromHSV(0,0,1-az(Z))end),Position=aw(function()return UDim2.fromScale(az(Y),1-az(Z))end),[as]={ap'ImageLabel'{ZIndex=2,
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromScale(0.9,0.9),ImageColor3=aw(
function()return Color3.fromHSV(az(X),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},ap'TextButton'{Size=UDim2.new(1,0,
0,24),[av'InputBegan']=function(aM)if aM.UserInputType~=Enum.UserInputType.MouseButton1 and aM.UserInputType~=Enum.
UserInputType.Touch then return end U:set(true)local aN aN=aM.Changed:Connect(function()if aM.UserInputState==Enum.
UserInputState.End or aM.UserInputState.Cancel then U:set(false)aN:Disconnect()end end)end,[ax]=T,[as]={ap'UIGradient'{
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(
0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.
colorpickerBar,Size=UDim2.new(0,2,1,0),Position=aw(function()return UDim2.fromScale(1-az(X),0.5)end)}}},ap'ImageButton'{
Visible=not az(E),ZIndex=2,Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=
Enum.ScaleType.Crop,[av'InputBegan']=function(aM)if aM.UserInputType~=Enum.UserInputType.MouseButton1 and aM.
UserInputType~=Enum.UserInputType.Touch then return end W:set(true)local aN aN=aM.Changed:Connect(function()if aM.
UserInputState==Enum.UserInputState.End or aM.UserInputState.Cancel then W:set(false)aN:Disconnect()end end)end,[ax]=V,[
as]={ap'Frame'{Size=UDim2.fromScale(1,1),[as]={ap'UIGradient'{Color=aw(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,az(H)),ColorSequenceKeypoint.new(1,az(H))}end),Transparency=aw(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'Frame'{AnchorPoint=Vector2
.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=aw(function()return UDim2.fromScale(az(I
),0.5)end)}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[as]={aG(b.LayoutOrder,c.Horizontal,d.Left,m.
Center,UDim.new(0,4)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=
ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=aC('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.
TextXAlignment.Right},ap'TextBox'{Name=aD(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',
PlaceholderColor3=ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,Text=aw(function()local aM={az(H).R,az(
H).G,az(H).B}for aN,aO in aM do aM[aN]=math.floor(math.clamp(aO*255,0,255))end return table.concat(aM,', ')end),
TextScaled=true,FontFace=aC('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.
Right,[ax]=P,[av'Changed']=function(aM)local aN=az(P)if aM=='TextBounds'and aN and aN.TextBounds then Q:set(aN.
TextBounds.X)end end,[av'FocusLost']=function()local aM=az(P)local aN,aO=aM.Text:gsub(' ',''),{az(H).R,az(H).G,az(H).B}
for aP,aQ in aO do aO[aP]=math.floor(math.clamp(aQ*255,0,255))end local aR,aS,aT=table.concat(aO,', '),pcall(function()
local aR=string.split(aN,',')table.foreach(aR,function(aS,aT)if not tonumber(aT)then return nil end aR[aS]=math.clamp(aT
,0,255)end)return Color3.fromRGB(aR[1],aR[2],aR[3])end)if aS and aT then H:set(aT)X:set(({az(H):ToHSV()})[1])Y:set(({az(
H):ToHSV()})[2])Z:set(({az(H):ToHSV()})[3])else aM.Text=aR end end,[as]={aI(1,16),ap'UISizeConstraint'{MaxSize=Vector2.
new(110,16),MinSize=Vector2.new(42,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,Position=
UDim2.fromScale(1,1),Size=aA(function()return UDim2.fromOffset(math.clamp(az(Q),0,110),2)end,40,1),[as]={aJ(0,1)}}}}}}},
ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[as]={aG(b.LayoutOrder,c.Horizontal,d.Left,m.Center,UDim.
new(0,5)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=ai.text2,
BackgroundTransparency=1,TextSize=16,FontFace=aC('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},ap'TextBox'{Name=aD(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.AutomaticSize.X,
PlaceholderText='HSV',PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=aw(function()local aM={az(H):ToHSV()}for aN,aO
in aM do aM[aN]=math.floor(aO*100)/100 end return table.concat(aM,', ')end),TextScaled=true,FontFace=aC('Montserrat',
Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[ax]=N,[av'Changed']=function(aM)
local aN=az(N)if aM=='TextBounds'and aN and aN.TextBounds then O:set(aN.TextBounds.X)end end,[av'FocusLost']=function()
local aM=az(N)local aN,aO=aM.Text:gsub(' ',''),{az(H):ToHSV()}for aP,aQ in aO do aO[aP]=math.floor(aQ*100)/100 end local
aR,aS,aT=table.concat(aO,', '),pcall(function()local aR=string.split(aN,',')table.foreach(aR,function(aS,aT)if not
tonumber(aT)then return nil end end)return Color3.fromHSV(unpack(aR))end)if aS and aT then H:set(aT)X:set(({az(H):ToHSV(
)})[1])Y:set(({az(H):ToHSV()})[2])Z:set(({az(H):ToHSV()})[3])else aM.Text=aR end end,[as]={aI(1,16),ap'UISizeConstraint'
{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.
text2,Position=UDim2.fromScale(1,1),Size=aA(function()return UDim2.fromOffset(math.clamp(az(O),36,110),2)end,40,1),[as]=
{aJ(0,1)}}}}}}}}}end au(y):onChange(function()if not az(y)and typeof(_)=='Instance'then _:Destroy()end end)ap'Frame'{
Interactable=aw(function()if not az(y)then return false end return az(J)end),Visible=aw(function()if az(q.string)~=''and
not string.find(az(w):lower(),az(q.string):lower())or not az(z)then return false end return true end),Parent=v,Size=
UDim2.new(1,0,0,36),BackgroundTransparency=1,BackgroundColor3=ai.background2,[as]={aJ(6),ap'Frame'{ZIndex=3,Visible=aw(
function()if not az(y)then return true end return false end),BackgroundTransparency=aA(function()return az(J)and 0.2 or
1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[as]={aJ(6),ap'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=K},ap'TextLabel'{FontFace=aC('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=K,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=x,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[as]={aH(0,5)}}}},ap'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[as]={aG(b.LayoutOrder,c.Horizontal,
d.Left,m.Bottom,UDim.new(0,3)),ap'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.background2,
BackgroundTransparency=K,[as]={aH(9,8),aJ(6),aG(b.LayoutOrder,c.Horizontal,d.Left,m.Top),ap'TextLabel'{FontFace=aC(
'Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=w,TextTransparency=K,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}},ap'TextButton'{Interactable=aw(function()if not az(y)then return false end return
az(J)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=K,[av'Activated']=function()
if typeof(az(t.module))=='Instance'then az(t.module):Destroy()end _,aK=ac(ab.Parent.module)(aL())t:update('module',_)end
,[as]={aH(0,8),aJ(6),aG(b.LayoutOrder,c.Horizontal,d.Right,m.Center,UDim.new(0,5)),ap'Frame'{Size=UDim2.new(1,-29,0,36),
BackgroundTransparency=1,[as]={aG(b.LayoutOrder,c.Horizontal,d.Right,m.Center,UDim.new(0,4)),ap'TextBox'{Interactable=
aw(function()if not az(y)then return false end return az(J)end),Name=aD(8),BackgroundTransparency=1,Size=UDim2.new(1,0,0
,16),PlaceholderText='Hex',PlaceholderColor3=ai.text2,TextColor3=ai.text,TextTransparency=K,Text=aw(function()return'#'
..az(H):ToHex()end),TextScaled=true,FontFace=aC('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=
Enum.TextXAlignment.Right,[av'Changed']=function(aM)local aN=az(L)if aM=='TextBounds'and aN and aN.TextBounds then M:
set(aN.TextBounds.X)end end,[av'FocusLost']=function()local aM=az(L)local aN=aM.Text:gsub('[^%w#]','')if not string.
find(aN,'#')then aN='#'..aN end if string.len(aN)~=7 then aM.Text='#'..az(H):ToHex()else local aO,aP=pcall(function()
return Color3.fromHex(aN)end)if aO then H:set(aP)else aM.Text='#'..az(H):ToHex()end end end,[ax]=L,[as]={aI(1,16),ap
'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=aA(function()if az(J)then return
0.5 end return 1 end,40,1),Position=UDim2.fromScale(1,1),Size=aA(function()return UDim2.fromOffset(math.clamp(az(M),0,98
),2)end,40,1),[as]={aJ(0,1)}}}}}},ap'ImageLabel'{Size=UDim2.fromOffset(24,24),Image=aj.paint,ImageColor3=H,
BackgroundTransparency=1,ImageTransparency=aA(function()return not az(J)and 1 or az(I)end,40,1),[as]={aJ(6)}}}}}}}}aE.
add(am.Heartbeat:Connect(function()if az(S)then local aM=az(R)local aN=an:GetMouseLocation()-aM.AbsolutePosition-Vector2
.new(0,az(s.number))aN=Vector2.new(math.clamp(aN.X,0,aM.AbsoluteSize.X),math.clamp(aN.Y,0,aM.AbsoluteSize.Y))Y:set(aN.X/
aM.AbsoluteSize.X)Z:set((aM.AbsoluteSize.Y-aN.Y)/aM.AbsoluteSize.Y)H:set(Color3.fromHSV(az(X),az(Y),az(Z)))end if az(U)
then local aM=az(T)local aN=an:GetMouseLocation()-aM.AbsolutePosition-Vector2.new(0,az(s.number))aN=Vector2.new(math.
clamp(aN.X,0,aM.AbsoluteSize.X),0)X:set((aM.AbsoluteSize.X-aN.X)/aM.AbsoluteSize.X)H:set(Color3.fromHSV(az(X),az(Y),az(Z
)))end if az(W)then local aM=az(V)local aN=an:GetMouseLocation()-aM.AbsolutePosition-Vector2.new(0,az(s.number))aN=
Vector2.new(math.clamp(aN.X,0,aM.AbsoluteSize.X),0)I:set(aN.X/aM.AbsoluteSize.X)end end))if az(r.boolean)and not az(C)
then G.file:Connect(function(aM)local aN,aO=true,true if aM.color~=nil then if string.find(aM.color,',')then local aP=
string.split(aM.color:gsub(' ',''),',')table.foreach(aP,function(aQ,aR)aP[aQ]=tonumber(aR)end)H:set(Color3.new(unpack(aP
)))else H:set(Color3.fromHex(`#{string.gsub(aM.color,'#','')}`))end aN=false end if aM.transparency~=nil then I:set(
tonumber(aM.transparency))aO=false end if aN then H:set(az(B))end if aO then I:set(az(D))end X:set(({az(H):ToHSV()})[1])
Y:set(({az(H):ToHSV()})[2])Z:set(({az(H):ToHSV()})[3])end)if G.private then H:set(az(B))I:set(az(D))end else H:set(az(B)
)I:set(az(D))end if G.preregistered and G.preregisteredValue and typeof(G.preregisteredValue)=='table'then if G.
preregisteredValue.color and typeof(G.preregisteredValue.color)=='string'then local aM,aN=pcall(function()return Color3.
fromHex(G.preregisteredValue.color)end)if aM then H:set(aN)end end if not az(E)then if G.preregisteredValue.transparency
and typeof(G.preregisteredValue.transparency)=='number'then I:set(G.preregisteredValue.transparency)end end end X:set(({
az(H):ToHSV()})[1])Y:set(({az(H):ToHSV()})[2])Z:set(({az(H):ToHSV()})[3])local aM={}function aM.SetName(aN,aO)local aP,
aQ=aB({SetName=aO},{SetName=''})assert(aP,table.concat(aQ,'\n'))w:set(aO)end function aM.SetColor(aN,aO)local aP,aQ=aB({
SetColor=aO},{SetColor=Color3.new()})assert(aP,table.concat(aQ,'\n'))H:set(aO)X:set(({az(H):ToHSV()})[1])Y:set(({az(H):
ToHSV()})[2])Z:set(({az(H):ToHSV()})[3])end function aM.SetTransparency(aN,aO)local aP,aQ=aB({SetTransparency=aO},{
SetTransparency=0})assert(aP,table.concat(aQ,'\n'))I:set(aO)end function aM.Enable(aN)y:set(true)end function aM.Disable
(aN)y:set(false)end function aM.Visible(aN)z:set(true)end function aM.Invisible(aN)z:set(false)end return aM end end)()
end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al
,am,an=ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.
useDependency),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.isSimilar),ac(ae.Utility.
needsDestruction),{}local ao,ap={__index=an},{__mode='k'}function an.get(as,at:boolean?):any if at~=false then ai(as)end
return as._value end function an.update(as):boolean for at in pairs(as.dependencySet)do at.dependentSet[as]=nil end as.
_oldDependencySet,as.dependencySet=as.dependencySet,as._oldDependencySet table.clear(as.dependencySet)local au,av,aw=ag(
as.dependencySet,as._processor)if au then if as._destructor==nil and am(av)then ak'destructorNeededComputed'end if aw~=
nil then ak'multiReturnComputed'end local ax=as._value local ay=al(ax,av)if as._destructor~=nil then as._destructor(ax)
end as._value=av for az in pairs(as.dependencySet)do az.dependentSet[as]=true end return not ay else aj(
'computedCallbackError',av)as._oldDependencySet,as.dependencySet=as.dependencySet,as._oldDependencySet for ax in pairs(
as.dependencySet)do ax.dependentSet[as]=true end return false end end local function as<T>(at:()->T,au:((T)->())?):Types
.Computed<T>local av=setmetatable({type='State',kind='Computed',dependencySet={},dependentSet=setmetatable({},ap),
_oldDependencySet={},_processor=at,_destructor=au,_value=nil},ao)ah(av)av:update()return av end return as end)()end,[68]
=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(
ae.utilities)local ap,as,at,au,av=ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af.Parent local aw=am(ap(at.string)
==ap(au.tab).uid)an(at.string):onChange(function()aw:set(ap(at.string)==ap(au.tab).uid)end)local ax=as(function()return
ap(aw)and 0 or 1 end,40,1)ak'Frame'{Parent=av,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=
UDim2.new(1,0,0,2),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,
BackgroundTransparency=ax}}}end end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)local ae=ac(ab
.Parent.Parent.Bundles).Fusion local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end end
)()end,[99]=function()local aa,ab,ac=a(99)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.
Bundles).Fusion.Observer,ac(ab.Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(
aj):onChange(function()if typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(
aj).Name,' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).
Name,' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(
ai)if ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae
[ai]=nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[96]=function()local aa,ab,ac=a(96)
local ad return(function(...)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end
return ae end end)()end,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)return{background=Color3.fromHex
'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=
Color3.fromHex'#1A1A1B',scrollBar=Color3.fromHex'#DCE1E5',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=
Color3.fromHex'#222427',mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',
mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex
'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[48]=
function()local aa,ab,ac=a(48)local ad return(function(...)local ae=ab.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:
any}export type None=PubTypes.Symbol&{}export type Error={type:string,raw:string,message:string,trace:string}export type
State<T> =PubTypes.Value<T>&{_value:T}export type Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.
Dependency>,_callback:()->T,_value:T}export type ForPairs<KI,VI,KO,VO,M> =PubTypes.ForPairs<KO,VO>&{_oldDependencySet:
Set<PubTypes.Dependency>,_processor:(KI,VI)->(KO,VO),_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.
CanBeState<{[KI]:VI}>,_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO},_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},
_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,
dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForKeys<KI,KO,M> =PubTypes.ForKeys<KO,any>&{_oldDependencySet
:Set<PubTypes.Dependency>,_processor:(KI)->(KO),_destructor:(KO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.
CanBeState<{[KI]:KO}>,_oldInputTable:{[KI]:KO},_outputTable:{[KO]:any},_keyOIMap:{[KO]:KI},_meta:{[KO]:M?},_keyData:{[KI
]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.
Dependency]:any}}}}export type ForValues<VI,VO,M> =PubTypes.ForValues<any,VO>&{_oldDependencySet:Set<PubTypes.Dependency
>,_processor:(VI)->(VO),_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[VI]:VO}>,
_outputTable:{[any]:VI},_valueCache:{[VO]:any},_oldValueCache:{[VO]:any},_meta:{[VO]:M?},_valueData:{[VI]:{dependencySet
:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}
export type Tween<T> =PubTypes.Tween<T>&{_goalState:State<T>,_tweenInfo:TweenInfo,_prevValue:T,_nextValue:T,
_currentValue:T,_currentTweenInfo:TweenInfo,_currentTweenDuration:number,_currentTweenStartTime:number,
_currentlyAnimating:boolean}export type Spring<T> =PubTypes.Spring<T>&{_speed:PubTypes.CanBeState<number>,_speedIsState:
boolean,_lastSpeed:number,_damping:PubTypes.CanBeState<number>,_dampingIsState:boolean,_lastDamping:number,_goalState:
State<T>,_goalValue:T,_currentType:string,_currentValue:T,_springPositions:{number},_springGoals:{number},
_springVelocities:{number}}export type Observer=PubTypes.Observer&{_changeListeners:Set<()->()>,_numChangeListeners:
number}return nil end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)local function ae(...:any)
end return ae end)()end,[101]=function()local aa,ab,ac=a(101)local ad return(function(...)return function(ae:table,af:
table,ag:table?):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))and
not table.find(ag,aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah
,ai end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(function(...)local ae,af={},{}function ae.cloneref(
ag)if cloneref then return cloneref(ag)else return ag end end function ae.printFileSystem()print(af)end function ae.
gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil function ae.isfile(ag:string)if isfile then return
isfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break
end end else ah=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end function ae.
isfolder(ag:string)if isfolder then return isfolder(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split
'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then return
false end return true end end function ae.writefile(ag:string,ah:string)if writefile then return writefile(ag,ah)else
local ai=af for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=ai[ak]elseif(typeof(ai[ak])=='string'or typeof(
ai[ak])=='nil')then ai[ak]=ah end end end end function ae.delfile(ag:string)if delfile then return delfile(ag)else local
ah=af local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[al]=nil else ai=ah end end
end end function ae.readfile(ag:string)if readfile then return readfile(ag)else local ah,ai=af,false if ag:find'/'then
for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai then warn
'readfile: no file'return nil end return ah end end function ae.makefolder(ag:string)if makefolder then return
makefolder(ag)else local ah=af if ag:find'/'then for ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else ah=ah[
aj]end end else ah[ag]={}end end end function ae.listfiles(ag:string)if listfiles then return listfiles(ag)else local ah
,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]
end if ai or typeof(ah)=='string'then warn'no folder exists'return nil end local aj={}for ak,al in ah do if typeof(al)==
'string'then table.insert(aj,`{ag}/{ak}`)end end return aj end end function ae.getthreadidentity()if getthreadidentity
then return getthreadidentity()else return 5 end end function ae.setthreadidentity(ag:number)if setthreadidentity then
return setthreadidentity(ag)else return 5 end end return ae end)()end,[78]=function()local aa,ab,ac=a(78)local ad return
(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj
,ak,al,am=ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,as,at,au,av=am.UIListLayout,Enum.SortOrder,
Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj
'ScrollingFrame'{ZIndex=al(function()return(au(av.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=
UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,as.Center
,at.Top,UDim.new(0,4))}}end end)()end,[90]=function()local aa,ab,ac=a(90)local ad return(function(...)return
setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end
end})end)()end,[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local function ae(af:any)local ag=typeof(
af)if ag=='Instance'then af:Destroy()elseif ag=='RBXScriptConnection'then af:Disconnect()elseif ag=='function'then af()
elseif ag=='table'then if typeof(af.destroy)=='function'then af:destroy()elseif typeof(af.Destroy)=='function'then af:
Destroy()elseif af[1]~=nil then for ah,ai in ipairs(af)do ae(ai)end end end end local function af(...:any)for ag=1,
select('#',...)do ae(select(ag,...))end end return af end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(
function(...)local ae,af={},ac(ab.Parent.services)local ag,ah=af.HttpService,ac(ab.Parent)local ai,aj=ah.Fusion,ac(ab.
default)local ak,al,am,an,ao,ap,as,at,au=ai.Value,ai.Observer,ac(ab.Parent.Parent.utilities.get),ac(ab.Parent.Parent.
utilities.animate),ac(ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Parent.
utilities.customFunctions),{},{}local av,aw,ax=ak{},ak{},''al(av):onChange(function()task.wait()for ay,az in ipairs(at)
do task.spawn(az)end end)local ay,az,aA={},{},{}table.foreach(aj,function(aB)table.insert(aA,aB)end)ae.path=''function
ae.find(aB)for aC,aD in ay do if aD.uid==aB then return true,aD end end return false end function ae.create(aB,aC,aD,aE,
aF)aE=aE or false if aD=='original'and aE then return end for aG,aH in aA do if aC[aH]==nil then aC[aH]=aj[aH]end if
typeof(aC[aH])~='Color3'then ao(aH.." isn't type Color3")end end for aI,aJ in aC do if not table.find(aA,aI)then ao(
'Incorrect value removed "'..tostring(aI)..'"')aC[aI]=nil end end if aF and aE then table.insert(az,aD)end if aF and not
aE then for aK,aL in az do local aM={ae.find(aL)}if aM[1]and aM[2].name==aB then return aL end end end aD=aD or ap(5)
table.insert(ay,{name=aB,uid=aD,fromSet=aF or false,palette=aC})local aK={}aK.name=aB aK.uid=aD aK.fromSet=aF aK.palette
={}for aL,aM in aC do aK.palette[aL]=aM:ToHex()end as.writefile(`{ae.path}/{aD}.json`,ag:JSONEncode(aK))task.spawn(
function()for aN,aO in au do task.spawn(aO)end end)return aD end function ae.delete(aB)local aC={ae.find(aB)}if not aC[1
]then return false,'no theme found'end local aD=table.find(ay,aC[2])ae.set(ax)table.remove(ay,aD)as.delfile(`{ae.path}/{
aC[2].uid}.json`)end function ae.edit(aB,aC)local aD=am(av)aD[aB]=aC av:set(aD)end function ae.editTheme(aB:string,aC:
string,aD:any)local aE={ae.find(aB)}if not aE[1]then return false end local aF=aE[2]aF[aC]=aD local aJ={}aJ.name=aF.name
aJ.uid=aB aJ.fromSet=aF.fromSet aJ.palette={}for aK,aL in aF.palette do aJ.palette[aK]=aL:ToHex()end as.writefile(`{ae.
path}/{aB}.json`,ag:JSONEncode(aJ))return true end function ae.set(aB)local aC,aD,aE={ae.find(aB)}if aC[1]then aD,aE=aC[
2],aC[2].palette else return false,'no theme found'end local aF={}table.foreach(aE,function(aJ,aK)aF[aJ]=aK end)av:set(
aF)aw:set(aD)return true,'successfully set new theme'end function ae.export()local aB,aC=am(aw),{}aC.name=aB.name aC.uid
=aB.uid aC.fromSet=aB.fromSet aC.palette={}for aD,aE in aB.palette do aC.palette[aD]=aE:ToHex()end return ag:JSONEncode(
aC)end function ae.save(aB)local aC={ae.find(aB)}if aC[1]then local aD,aE=aC[2],{}aE.name=aD.name aE.uid=aD.uid aE.
fromSet=aD.fromSet aE.palette={}for aF,aJ in aD.palette do aE.palette[aF]=aJ:ToHex()end aD.palette=am(av)as.writefile(`{
ae.path}/{aB}.json`,ag:JSONEncode(aE))ae.set(aB)return true else return false end end function ae.get(aB)local aC=am(av)
if aC[aB]then return aC[aB]else error(aB.." isn't a theme element")end end for aB,aC in aA do ae[aC]=an(function()return
am(av)[aC]end,40,1)end function ae.init()ax=ae.create('darius',aj,'original')ae.set(ax)for aD,aE in as.listfiles(ae.path
)do local aF=ag:JSONDecode(as.readfile(aE))table.foreach(aF.palette,function(aJ,aK)local aL=Color3.fromHex(`#{aK}`)aF.
palette[aJ]=aL end)ae.create(aF.name,aF.palette,aF.uid,true,aF.fromSet)end end function ae.onChange(aD)table.insert(at,
aD)end function ae.onCreate(aD)table.insert(au,aD)end function ae.getTheme()return am(aw)end function ae.getThemes()
return ay end function ae.getColors()return am(av)end return ae end)()end,[87]=function()local aa,ab,ac=a(87)local ad
return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af,ag,ah,ai,aj)return ae.New
'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,
HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=
aj or UDim.new(0,0)}end end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae=ac(ab.Parent.
Parent.utilities.customFunctions)local af,ag=ae.cloneref,{}ag=setmetatable(ag,{__index=function(ah,ai)return af(game:
GetService(ai))end})return ag end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Computed,ak.Observer,ak.OnEvent,ac(ae.simpleElements)local au,
av,aw,ax,ay,az,aA,aB,aC=at.UICorner,at.UIPadding,at.UITextSizeConstraint,at.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aD,aE,aF,aJ,aK,aL,aM,aN,aO,aP,aQ,aR=
aC.get,aC.animate,aC.getStringBounds,aC.customFont,ah.find'selectedTab',ah.find'searchText',ah.find'currentBinds',ah.
find'bindData',ah.add(af),af.Parent,an'Active Keybinds',an''local aS=an(aD(aK.string)==aD(aO.tab).uid)ap(aK.string):
onChange(function()aS:set(aD(aK.string)==aD(aO.tab).uid)end)local aT,b=aE(function()return aD(aS)and 0 or 1 end,40,1),
an(0)task.spawn(function()b:set(aF(aD(aR),{Font=aJ('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aD(aP).
AbsoluteSize.X)}).Y)end)aD(aP).Changed:Connect(function(c)if c:lower()=='absolutesize'then b:set(aF(aD(aR),{Font=aJ(
'Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aD(aP).AbsoluteSize.X)}).Y)end end)ap(aR):onChange(
function()b:set(aF(aD(aR),{Font=aJ('Montserrat',Enum.FontWeight.Bold),Size=16,Width=math.round(aD(aP).AbsoluteSize.X)}).
Y)end)local function c(d)local m={}table.foreach(d,function(n,o)m[n]=o.Name end)return table.concat(m,', ')end local d,m
,n=(an'Active Keybinds')n,m=ac(ab.Parent.module){Name=d,Children={}}local function o(p)local q,r={ax(ay.LayoutOrder,az.
Vertical,aA.Center,aB.Top,UDim.new(0,5))},aD(aN.bindData)for s,t in aD(aM.binds)do local u=r[t.Name]table.insert(q,al
'TextLabel'{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text,FontFace=aJ('Montserrat',Enum.
FontWeight.Regular),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,Text=ao(function()if u.boolean then return`[{u
.bind.Name}] {u.name} (<i>{string.upper(tostring(aD(u.boolean)))}</i>)`end return`[{u.bind.Name}] {u.name}`end)})end m(q
)end al'TextButton'{Visible=ao(function()if aD(aL.string)~=''and not string.find(aD(aQ):lower(),aD(aL.string):lower())
and not string.find(aD(aR):lower(),aD(aL.string):lower())then return false end return true end),BackgroundColor3=ai.
background2,Parent=aP,BackgroundTransparency=aT,Size=ao(function()return UDim2.new(1,0,0,36+aD(b))end),AutomaticSize=
Enum.AutomaticSize.Y,[as'Activated']=function()if typeof(n)=='Instance'then n:Destroy()n=nil end n,m=ac(ab.Parent.module
){Name=d,Children={}}o(aD(aM.binds))end,[am]={au(6),av(6),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.text2,ImageTransparency=aT},al'TextLabel'{Name='Title',RichText
=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.fromOffset(25,0),BackgroundTransparency=1,TextTransparency=aT,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=aJ(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aQ,[am]={aw(1,18)}},al'TextLabel'{Name='Body',TextWrapped=
true,RichText=true,Position=UDim2.fromOffset(4,25),BackgroundTransparency=1,TextTransparency=aT,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=16,FontFace=aJ('Montserrat',Enum.FontWeight.Medium),
TextColor3=ai.text2,Text=aR,Size=ao(function()return UDim2.new(1,-4,0,aD(b))end)}}}ap(aM.binds):onChange(function()o(aD(
aM.binds))end)o(aD(aM.binds))aR:set(c(aD(aM.binds)))ap(aM.binds):onChange(function()aR:set(c(aD(aM.binds)))end)end end)(
)end,[57]=function()local aa,ab,ac=a(57)local ad return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.
randomString),ac(ab.Parent)local ag=af.Fusion local ah,ai,aj=ag.Value,{},{}type uid=string type tag=string function aj.
update(ak:string,al:string,am:string)if al~='uid'and aj.find(ak)and aj.find(ak)[al]then local an=aj.find(ak)an[al]:set(
am)elseif not aj.find(ak)then error("couldn't find uid: "..ak)elseif al=='uid'or al=='__tag'then error(
'cannot edit property '..al)elseif not aj.find(ak)[al]then else error'how?'end end function aj.find(ak:uid|tag):table
local al for am=1,#ai do if ai[am].uid==ak or ai[am].__tag==ak then al=ai[am]end end if not al then warn(
'no data found by identifier: '..tostring(ak))return al end return al end function aj.delete(ak:string)local al=aj.find(
ak)local am,an=table.find(ai,al),{}for ao=1,#ai do if ao~=am then table.insert(an,ai[ao])end end ai=an an=nil end
function aj.add(ak:table,al:string,am:boolean):table am=am or false if not am then for an,ao in ak do ak[an]=ah(ao)end
end ak.__tag=al or nil ak.uid=ae(16)setmetatable(ak,{__index={update=function(an,ao,ap)aj.update(an.uid,ao,ap)end,delete
=function()aj.delete(ak.uid)end}})table.insert(ai,ak)return aj.find(ak.uid)end return aj end)()end,[85]=function()local
aa,ab,ac=a(85)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af:number,ag:
Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return
ae.New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[34]=function()local aa,ab,ac
=a(34)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)
local function ah(ai:string,aj:Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=
ag[ai]end local al if aj==nil then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub(
'ERROR_MESSAGE',aj.message)al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)
end error(al:gsub('\n','\n    '),0)end return ah end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au,av=ap.
UICorner,ap.UIPadding,ap.UITextSizeConstraint,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.getStringBounds,
av.customFont,av.typecheck local aB,aC=aA(af,{Title='',Visible=false,Body=''},{af.Visible and''or'Visible'})assert(aB,
table.concat(aC,'\n'))local aD,aE,aF,aJ,aK,aL,aM=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,
af.Body,af.Visible or am(true)local aN=am(aw(aD.string)==aw(aF.tab).uid)ao(aD.string):onChange(function()aN:set(aw(aD.
string)==aw(aF.tab).uid)end)local aO,aP=ax(function()return aw(aN)and 0 or 1 end,40,1),am(0)task.spawn(function()aP:set(
ay(aw(aL),{Font=az('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(aw(aJ).AbsoluteSize.X)}).Y)end)aw(aJ).
Changed:Connect(function(aQ)if aQ:lower()=='absolutesize'then aP:set(ay(aw(aL),{Font=az('Montserrat',Enum.FontWeight.
Medium),Size=12,Width=math.round(aw(aJ).AbsoluteSize.X)}).Y)end end)ao(aL):onChange(function()aP:set(ay(aw(aL),{Font=az(
'Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(aw(aJ).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function
()if aw(aE.string)~=''and not string.find(aw(aK):lower(),aw(aE.string):lower())and not string.find(aw(aL):lower(),aw(aE.
string):lower())or not aw(aM)then return false end return true end),BackgroundColor3=ai.background2,Parent=aJ,
BackgroundTransparency=aO,Size=an(function()return UDim2.new(1,0,0,36+aw(aP))end),AutomaticSize=Enum.AutomaticSize.Y,[al
]={as(6),at(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,
TextTransparency=aO,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=18,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aK,[al]={au(1,18)}},ak'TextLabel'{
Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=aO,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=az('Montserrat',Enum
.FontWeight.Medium),TextColor3=ai.text2,Text=aL,Size=an(function()return UDim2.new(1,-4,0,aw(aP))end)}}}local aQ={}
function aQ.SetBody(aR,aS)local aT,b=aA({SetBody=aS},{SetBody=''})assert(aT,table.concat(b,'\n'))aL:set(aS)end function
aQ.SetTitle(aR,aS)local aT,b=aA({SetTitle=aS},{SetTitle=''})assert(aT,table.concat(b,'\n'))aK:set(aS)end function aQ.
Visible(aR)aM:set(true)end function aQ.Invisible(aR)aM:set(false)end return aQ end end)()end,[50]=function()local aa,ab,
ac=a(50)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Types)return{type='Symbol',name='None'}::
Types.None end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)local ae=ab.Parent.Parent local af=
ac(ae.Types)local function ag(ah:string):Types.Error return{type='Error',raw=ah,message=ah:gsub('^.+:%d+:%s*',''),trace=
debug.traceback(nil,2)}end return ag end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local ae=
ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local au,av,aw
,ax,ay=at.get,at.animate,at.typecheck,at.customFont,ac(ae.simpleElements)local az,aA,aB,aC=ay.UIPadding,ay.UICorner,aw(
af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{af.DisabledText and''or'DisabledText'
,af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible'})assert(aB,table.concat(aC,'\n'))local aD,aE,aF,aJ,aK,aL,aM
,aN,aO=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Visible or an(true),af.IsEnabled or an(
true),af.DisabledText or an'Component Disabled',af.Callback local aP=an(au(aD.string)==au(aF.tab).uid)ao(aD.string):
onChange(function()aP:set(au(aD.string)==au(aF.tab).uid)end)local aQ=av(function()return au(aP)and 0 or 1 end,40,1)al
'TextButton'{Interactable=as(function()if not au(aM)then return false end return au(aP)end),Visible=as(function()if au(
aE.string)~=''and not string.find(au(aK):lower(),au(aE.string):lower())or not au(aL)then return false end return true
end),Parent=aJ,Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=aQ,[ap'Activated']=
function()if not au(aM)then return end task.spawn(au(aO))end,[am]={aA(6),al'Frame'{ZIndex=2,Visible=as(function()if not
au(aM)then return true end return false end),BackgroundTransparency=av(function()return au(aP)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={aA(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=aQ},al'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1
,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=aQ,TextScaled=true,AnchorPoint=Vector2.new(0,0.5
),Position=UDim2.new(0,29,0.5,0),Text=aN,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={az(0,5)}}}},al
'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={az(0,8),al'TextLabel'{FontFace=ax('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=aK,TextTransparency=aQ,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=ai.text2,ImageTransparency=aQ}}}}}local aR={}function aR.
SetName(aS,aT)local b,c=aw({SetName=aT},{SetName=''})assert(b,table.concat(c,'\n'))aK:set(aT)end function aR.SetCallback
(aS,aT)local b,c=aw({SetCallback=aT},{SetCallback=function()end})assert(b,table.concat(c,'\n'))aO:set(aT)end function aR
.Fire(aS)task.spawn(au(aO))end function aR.Enable(aS)aM:set(true)end function aR.Disable(aS)aM:set(false)end function aR
.Visible(aS)aL:set(true)end function aR.Invisible(aS)aL:set(false)end return aR end end)()end,[84]=function()local aa,ab
,ac=a(84)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return
ac(ab[af])else error('no utility: '..af)end end})end)()end,[100]=function()local aa,ab,ac=a(100)local ad return(function
(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.Tween(af(ag),ah)
end end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.
Logging.logError)type table={[any]:any}local function ag(ah:string,ai:table):table local aj=getmetatable(ai::any)if aj==
nil then aj={}setmetatable(ai,aj)end function aj.__index(ak,al)af('strictReadError',nil,tostring(al),ah)end return ai
end return ag end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)local function ae(af:any)local
ag=typeof(af)if ag=='table'and typeof(af.type)=='string'then return af.type else return ag end end return ae end)()end,[
98]=function()local aa,ab,ac=a(98)local ad return(function(...)local ae=string.split(
[[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then return af(ag-1)
..ae[math.random(1,#ae)]else return''end end return af end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)local function ah(ai:string,aj:
Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=ag[ai]end local al if aj==nil
then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub('ERROR_MESSAGE',aj.message)al=string.
format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)end task.spawn(function(...)error(al:
gsub('\n','\n    '),0)end,...)end return ah end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons
,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=an.New,an.Children,an.Value,
an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.animate,aw.typecheck,aw.
connections,aw.customFont,aw.references,aw.drag,ac(ae.simpleElements)local aF,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS=aE.UIPadding
,aE.UICorner,aE.UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()
end,FLAG='',Bind=Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or
'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Bind and''or'Bind',af.IgnoreConfig and''or
'IgnoreConfig'})assert(aR,table.concat(aS,'\n'))local aT,b,c,d,m,n,o,p,q,r,s,t,u,v,w,x,y=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.
find'bindData',ah.add(af),af.Parent,af.Name,af.DisabledText or as'Component Disabled',af.IsEnabled or as(true),af.
Visible or as(true),af.Callback,af.Bind,af.IgnoreConfig or as(false)local z,A=(af.FLAG or as(q.uid))if ax(z)~=''then A=
ak.register(ax(z),{coordinate=as(nil),keycode=as(nil),mobile=ax(m.boolean)},'keybind',ax(z)==q.uid)A.user.Value=ax(m.
boolean)and ax(A.status.coordinate)or ax(A.status.keycode)end local B=as()local function C(D:EnumItem,E:string)local F,G
=ax(b.binds),ax(p.bindData)if table.find(F,D)then aQ(('Key %s is already in use. %s'):format(D.Name,E))else table.
insert(F,D)if ax(B)then table.remove(F,table.find(F,ax(B)))G[ax(B).Name]=nil end B:set(D)G[ax(B).Name]={bind=ax(B),name=
ax(s)}p:update('bindData',G)b:update('binds',F)A.status.keycode:set(ax(B).Name)end end local D=as(ax(aT.string)==ax(q.
tab).uid)at(aT.string):onChange(function()D:set(ax(aT.string)==ax(q.tab).uid)end)local E,F=ay(function()return ax(D)and
0 or 1 end,40,1),as(false)local G=am.InputBegan:Connect(function(G,H)if ax(m.boolean)then return end if ax(F)then if G.
KeyCode and G.KeyCode~=Enum.KeyCode.Unknown then C(G.KeyCode,'From input box')end F:set(false)task.wait()o:update(
'boolean',false)else if G.KeyCode and G.KeyCode==ax(B)and not H and not ax(o.boolean)and ax(u)then task.spawn(ax(w))end
end end)aA.add(G)local H,I,J=(as(false))J=ao'TextButton'{Visible=av(function()if not ax(u)then return ax(u)end return
ax(H)end),Parent=aC.get(ax(n.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text=s,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if
I then I:Disconnect()I=nil A.status.coordinate:set(J.AbsolutePosition)else task.spawn(ax(w))end end,[ap]={aF(4),aJ(16),
aK(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=ax(m.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=r,Visible=av(function()if ax(d.string)~=''and not string.
find(ax(s):lower(),ax(d.string):lower())or not ax(v)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(u)then return true end return false end
),BackgroundTransparency=ay(function()return ax(D)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aJ(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=E},ao
'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=E,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=av(function()return ax(t)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aL(aM.LayoutOrder,aN.Horizontal,aO.Left,aP.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=av(function()if not ax(u)then return false end return ax(D)end),Size=UDim2.new(0.225,0,1,
0),BackgroundColor3=ai.background2,BackgroundTransparency=E,[au'Activated']=function()if ax(m.boolean)then H:set(true)I=
aD(J,15)return end F:set(true)o:update('boolean',true)end,[ap]={aJ(6),aF(6),aL(aM.LayoutOrder,aN.Horizontal,aO.Left,aP.
Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ax(m.boolean)
and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=E},ao'TextLabel'{Visible=not ax(m.boolean),Size=UDim2
.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=E,Text=av(function()return ax(F)and'Listening'or ax(B)
and ax(B).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(m.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=av(function()return ax(H)and'Move Bind'or'Place Bind'end),TextTransparency=E}}},ao'TextButton'{Visible=H,
Interactable=av(function()if not ax(u)then return false end return ax(D)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=E,[au'Activated']=function()H:set(false)J.Position=UDim2.
fromScale(0.5,0.5)A.status.coordinate:set(J.AbsolutePosition)end,[ap]={aJ(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=
ai.red,ImageTransparency=E}}},ao'Frame'{Size=av(function()return UDim2.new(0.775,ax(H)and-42 or-3,0,36)end),
BackgroundColor3=ai.background2,BackgroundTransparency=E,[ap]={aJ(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aF(8),aL(aM.LayoutOrder,aN.Horizontal,aO.Left,aP.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=s,TextTransparency=E,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if ax(c.boolean)and not ax(y)then A.file:Connect(function(K)local L=true
if K.keycode~=nil then if ax(B)and ax(B).Name==K.keycode then return end local M,N=pcall(function()return Enum.KeyCode[K
.keycode]end)if M then C(N,'File1')end L=false end if L and ax(A.status.keycode)==nil then if x then C(ax(x),
'NoFileFound')end end if ax(m.boolean)and K.coordinate then J.Position=UDim2.fromOffset(K.coordinate.X+30,K.coordinate.Y
+30)H:set(true)end end)if A.private then if x then C(ax(x),'Private')end end else if x then C(ax(x),
'IgnoreConfig/UseConfig:false')end end if A.preregistered and A.preregisteredValue and typeof(A.preregisteredValue)==
'table'then if not ax(m.boolean)then if A.preregisteredValue.keycode and typeof(A.preregisteredValue.keycode)=='string'
then local K,L=pcall(function()return Enum.KeyCode[A.preregisteredValue.keycode]end)if K then C(L,'Configuration1')end
end else if A.preregisteredValue.coordinate and typeof(A.preregisteredValue.coordinate)=='table'and A.preregisteredValue
.coordinate.X and A.preregisteredValue.coordinate.Y then if typeof(A.preregisteredValue.coordinate.X)=='number'and
typeof(A.preregisteredValue.coordinate.Y)=='number'then J.Position=UDim2.fromOffset(A.preregisteredValue.coordinate.X+30
,A.preregisteredValue.coordinate.Y+30)H:set(true)end end end end local K={}function K.SetName(L,M)local N,O=az({SetName=
M},{SetName=''})assert(N,table.concat(O,'\n'))s:set(M)end function K.SetBind(L,M:EnumItem)local N,O=az({SetBind=M},{
SetBind=Enum.keyCode.C})assert(N,table.concat(O,'\n'))C(M,'At :SetBind')end function K.Enable(L)u:set(true)end function
K.Disable(L)u:set(false)end function K.Visible(L)v:set(true)end function K.Invisible(L)v:set(false)end return K end end
)()end,[86]=function()local aa,ab,ac=a(86)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion
return function(af,ag)ag=ag or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[77]=function()local
aa,ab,ac=a(77)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer,aj.OnEvent,ac(ae.
utilities)local as,at,au,av,aw=ap.get,ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local ax,ay,az,aA,aB,aC
,aD,aE,aF=aw.UIListLayout,aw.UIPadding,aw.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,au(af,{Name='',Image=''},{af.Image and''or'Image'})assert(aE,table.concat(aF,'\n'))local aJ,aK,aL,aM,
aN,aO,aP=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image then aP=af.Image aO:
set(true)end local aQ=am(false)an(aJ.string):onChange(function()local aR=as(aJ.string)aQ:set(aR==aL.uid)end)ak
'TextButton'{Name=aL.uid,Parent=aM,Size=UDim2.new(1,0,0,36),BackgroundColor3=at(function()return as(aQ)and ai.get
'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aJ:update('string',aL.uid)end,[al]={az(4),ay(6),
ax(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=aO,BackgroundTransparency=1,Size
=UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=aP,ImageTransparency=at(function()return as(aQ)and 0 or 0.6 end,40,1
)},ak'TextLabel'{Size=as(aO)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=av('Montserrat',Enum.FontWeight.Bold)
,TextColor3=ai.text2,TextScaled=true,Text=aN,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=at(function()return as(aQ)and 0 or 0.6 end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}}}}if not as(aK.boolean)then aK:update('boolean',true)aJ:update('string',aL.uid)end return aL end end)()
end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,as,at,au,av=
al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.
animate,av.customFont,av.typecheck,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aJ,aK,aL,aM,aN=aA.UIPadding,aA.UICorner,aA.
UITextSizeConstraint,aA.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.FillDirection,
az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',PlaceHolderText='',
ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',IgnoreConfig=true},{af.DisabledText and''or
'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.PlaceHolderText and''or'PlaceHolderText',
af.ClearTextOnFocus and''or'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default
and''or'Default',af.FLAG and''or'FLAG',af.IgnoreConfig and''or'IgnoreConfig'})assert(aM,table.concat(aN,'\n'))local aO,
aP,aQ,aR,aS,aT,b,c,d,m,n,o,p,q,r,s=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.
Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible or ao(true),af.Callback,af.
OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.ClearTextOnFocus or ao(false),af.IgnoreConfig or
ao(false),af.PlaceHolderText or ao''local t,u=(af.FLAG or ao(aR.uid))if aw(t)~=''then u=ak.register(aw(t),{correctText=
ao''},'textbox',aw(t)==aR.uid)u.user.Value=aw(u.status.correctText)end local v=ao(aw(aO.string)==aw(aR.tab).uid)as(aO.
string):onChange(function()v:set(aw(aO.string)==aw(aR.tab).uid)end)local w,x,y,z,A,B,C=ax(function()return aw(v)and 0 or
1 end,40,1),ao(),ao(false),ao'',ao(aw(u.status.correctText)),ao'',ao(false)as(z):onChange(function()if aw(n)then if
tonumber(aw(z))or aw(z)==''then A:set(aw(z))end else A:set(aw(z))end local D=aw(x)D.Text=aw(A)if aw(p)then return end if
aw(n)then if(tonumber(aw(z))or aw(z)=='')and aw(B)~=aw(z)then task.spawn(aw(m),aw(z))u.status.correctText:set(aw(z))B:
set(aw(z))end else if aw(B)==aw(z)then return end task.spawn(aw(m),aw(z))u.status.correctText:set(aw(z))B:set(aw(z))end
end)as(y):onChange(function()if aw(p)and not aw(y)then if aw(n)then if(tonumber(aw(z))or aw(z)=='')and aw(B)~=aw(z)then
task.spawn(aw(m),aw(z))u.status.correctText:set(aw(z))B:set(aw(z))end else if aw(B)==aw(z)then return end task.spawn(aw(
m),aw(z))u.status.correctText:set(aw(z))B:set(aw(z))end end end)local D,E=ao(),ao(0)am'Frame'{Parent=aS,Visible=ap(
function()if aw(aQ.string)~=''and not string.find(aw(aT):lower(),aw(aQ.string):lower())or not aw(d)then return false end
return true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,Visible=ap(function()if not
aw(c)then return true end return false end),BackgroundTransparency=ax(function()return aw(v)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aC(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=w},am'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=w,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ap(function()return aw(b)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,
[an]={aB(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aE(aF.LayoutOrder,aL.Horizontal,aK.
Left,aJ.Center,UDim.new(0,3)),am'TextLabel'{Size=UDim2.fromScale(0,1),BackgroundColor3=ai.background2,
BackgroundTransparency=w,TextSize=18,Text=aT,AutomaticSize=Enum.AutomaticSize.X,TextTransparency=w,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,TextColor3=ai.text,FontFace=ay('Montserrat',Enum.FontWeight.Bold),[au'Changed']=
function(F)if F=='AbsoluteSize'and aw(D)~=nil then E:set(aw(D).AbsoluteSize.X)end end,[at]=D,[an]={aC(6),aB(0,6)}},am
'TextButton'{Interactable=ap(function()if not aw(c)then return false end return aw(v)end),Size=ap(function()if aw(D)then
return UDim2.new(1,-aw(E)-3,1)end return UDim2.fromScale(0.35,1)end),BackgroundColor3=ai.background2,
BackgroundTransparency=w,[au'Activated']=function()local F=aw(x)if F then F:CaptureFocus()end end,[an]={aC(6),aB(0,6),
aE(aF.LayoutOrder,aL.Horizontal,aK.Left,aJ.Center,UDim.new(0,5)),am'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=w},am'TextBox'{Interactable=ap(function()
if not aw(c)then return false end return aw(v)end),ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=s,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextSize=16,TextXAlignment=Enum
.TextXAlignment.Left,FontFace=ay('Montserrat',Enum.FontWeight.Bold),Text=A,TextTransparency=w,ClearTextOnFocus=q,[at]=x,
[au'Changed']=function(F)local G=aw(x)if G.TextBounds.X>G.AbsoluteSize.X then C:set(true)end if G and G.Text and F==
'Text'then z:set(G.Text)end end,[au'Focused']=function()y:set(true)end,[au'FocusLost']=function()y:set(false)end,[an]={
am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[an]={am'UIGradient'{Rotation=0,Color=ax(function()return
ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,
40,1),Transparency=ax(function()if not aw(v)then return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1,1)}end if aw(C)then if aw(y)then return NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.1,1),NumberSequenceKeypoint.new(1,1)}else return
NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end
end return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if aw(
aP.boolean)and not aw(r)then u.file:Connect(function(F)local G=true if F~=nil then if aw(p)then y:set(true)end z:set(F)
if aw(p)then y:set(false)end G=false end if G then if aw(p)then y:set(true)end z:set(aw(o))if aw(p)then y:set(false)end
end end)if u.private then if aw(p)then y:set(true)end z:set(aw(o))if aw(p)then y:set(false)end end else if aw(p)then y:
set(true)end z:set(aw(o))if aw(p)then y:set(false)end end if u.preregistered and u.preregisteredValue then aM,aN=az({
FlagValue=u.preregisteredValue},{FlagValue=''})if aM then if aw(p)then y:set(true)end z:set(u.preregisteredValue)if aw(p
)then y:set(false)end end end local F={}function F.SetName(G,H)local I,J=az({SetName=H},{SetName=''})assert(I,table.
concat(J,'\n'))aT:set(H)end function F.SetInput(G,H)local I,J=az({SetInput=H},{SetInput=aw(n)and 1 or''})assert(I,table.
concat(J,'\n'))z:set(H)end function F.Enable(G)c:set(true)end function F.Disable(G)c:set(false)end function F.Visible(G)
d:set(true)end function F.Invisible(G)d:set(false)end return F end end)()end,[58]=function()local aa,ab,ac=a(58)local ad
return(function(...)local ae,af,ag=ac(ab.Parent).data,ac(ab.Parent.Parent.utilities).get,ac(ab.Parent).services local ah
,ai=ag.HttpService,ac(ab.Parent).Fusion local aj,ak,al=ai.Observer,ai.Value,ac(ab.Parent.Parent.utilities)local am,an,ao
,ap,as,at,au,av,aw,ax,ay=al.connections,al.customFunctions,al.randomString,{},ae.add({list={}},'flags'),{},{},{},{},{},{
}ap.currentConfig={}ap.writeFiles=false ap.path=''local az,aA={toggle=function(az)local aA=az.status.boolean am.add(aj(
aA):onChange(function()local aB=af(aA)az.user.Value=aB az.bindableEvent:Fire(aB)end))end,dropdown=function(az)local aA=
az.status.multiselect and az.status.items or az.status.item am.add(aj(aA):onChange(function()local aB=af(aA)az.user.
Value=aB az.bindableEvent:Fire(aB)end))end,keybind=function(az)local aA=az.status.mobile and az.status.coordinate or az.
status.keycode am.add(aj(aA):onChange(function()local aB=af(aA)az.user.Value=aB az.bindableEvent:Fire(aB)end))end,slider
=function(az)local aA=az.status.percentageOf am.add(aj(aA):onChange(function()local aB=af(aA)az.user.Value=aB az.
bindableEvent:Fire(aB)end))end,textbox=function(az)local aA=az.status.correctText am.add(aj(aA):onChange(function()local
aB=af(aA)az.user.Value=aB az.bindableEvent:Fire(aB)end))end,colorpicker=function(az)local aA,aB=az.status.color,az.
status.transparency am.add(aj(aA):onChange(function()az.user.Value={af(aA),af(aB)}az.bindableEvent:Fire(unpack(az.user.
Value))end))am.add(aj(aB):onChange(function()az.user.Value={af(aA),af(aB)}az.bindableEvent:Fire(unpack(az.user.Value))
end))end},{toggle=function(az)local aA={}if az.boolean then aA.boolean=af(az.boolean)end if az.keycode then aA.keycode=
af(az.keycode)end if af(az.coordinate)then aA.coordinate={X=af(az.coordinate).X,Y=af(az.coordinate).Y}end return aA end,
dropdown=function(az)return az.multiselect and{unpack(af(az.items))}or af(az.item)end,keybind=function(az)local aA={}if
az.keycode then aA.keycode=af(az.keycode)end if af(az.coordinate)then aA.coordinate={X=af(az.coordinate).X,Y=af(az.
coordinate).Y}end return aA end,slider=function(az)return af(az.percentageOf)end,textbox=function(az)return af(az.
correctText)end,colorpicker=function(az)return{color=af(az.color):ToHex(),transparency=af(az.transparency)}end}function
ap.preregister(aB,aC)local aD,aE=ai.New'BindableEvent'{},{}function aE.Connect(aF,aJ)assert(typeof(aJ)=='function',
'Connect only takes functions')am.add(aD.Event:Connect(aJ))end local aF,aJ=(ai.New'BindableEvent'{})aJ={name=aB,status={
},type='unknown',preregistered=true,bindableEvent=aD,file=aF.Event,fileEvent=aF,preregisteredValue=aC,user={Value=nil,
OnChange=setmetatable(aE,{__newindex=function(aK,aL,aM)return nil end})}}au[aB]=aJ local aK=af(as.list)aK[aJ.name]=aJ as
:update('list',aK)return aJ end function ap.register(aB,aC,aD,aE)assert(not table.find(at,aB),
'Flags must all be unique!')table.insert(at,aB)local aF,aJ=ai.New'BindableEvent'{},{}function aJ.Connect(aK,aL)assert(
typeof(aL)=='function','Connect')am.add(aF.Event:Connect(aL))end local aK if not au[aB]then local aL=(ai.New
'BindableEvent'{})aK={name=aB,status=aC,type=aD,private=aE,preregistered=false,bindableEvent=aF,file=aL.Event,fileEvent=
aL,user={Value=nil,OnChange=setmetatable(aJ,{__newindex=function()return nil end})}}az[aK.type](aK)local aM=af(as.list)
aM[aK.name]=aK as:update('list',aM)else aK=au[aB]aK.type=aD aK.status=aC aK.private=aE az[aK.type](aK)au[aK.name]=nil
end return aK end function ap.find(aB)for aC,aD in ax do if aD.uid==aB then return aD,aC end end return false end
function ap.create(aB,aC,aD,aE,aF,aJ)aD=aD or false aF=aF or false aJ=aJ or false if aC=='original'and aD then return
end if aF and aD then table.insert(ay,aC)end if aF and not aD then for aK,aL in ay do local aM=ap.find(aL)if aM and aM.
name==aB then return aL end end end aC=aC or ao(5)local aK={}aK.name=aB aK.fromSet=aF aK.lock=aJ aK.uid=aC aK.flagValues
={}if aE~=nil then aK.flagValues=aE else for aL,aM in af(as.list)do if aM.private then continue end if aM.type==
'unknown'then continue end aK.flagValues[aM.name]=aA[aM.type](aM.status)end end table.insert(ax,aK)if ap.writeFiles then
an.writefile(`{ap.path}/{aK.uid}.json`,ah:JSONEncode(aK))end task.spawn(function()for aL,aM in av do task.spawn(aM)end
end)return aC end function ap.init()if ap.writeFiles then for aB,aC in an.listfiles(ap.path)do local aD=ah:JSONDecode(an
.readfile(aC))ap.create(aD.name,aD.uid,true,aD.flagValues,aD.fromSet,aD.lock)end end end function load(aB)for aC,aD in
aB.flagValues do local aE=af(as.list)[aC]if not aE then continue end aE.fileEvent:Fire(aD)end end function ap.set(aB)
local aC=ap.find(aB)if not aC then return end ap.currentConfig=aC load(aC)task.spawn(function()for aD,aE in av do task.
spawn(aE,aB)end end)end function ap.save(aB)local aC=ap.find(aB)for aD,aE in af(as.list)do if aE.private then continue
end if aE.type=='unknown'then continue end aC.flagValues[aE.name]=aA[aE.type](aE.status)end if ap.writeFiles then an.
writefile(`{ap.path}/{aC.uid}.json`,ah:JSONEncode(aC))end end function ap.delete(aB)local aC,aD=ap.find(aB)if aC then if
ap.writeFiles then if an.isfile(`{ap.path}/{aC.uid}.json`)then an.delfile(`{ap.path}/{aC.uid}.json`)table.remove(ax,aD)
end end table.remove(ax,aD)end end function ap.export()return ah:JSONEncode(ap.currentConfig)end function ap.getConfigs(
)return ax end function ap.getConfig()return ap.currentConfig end function ap.onCreate(aB)table.insert(av,aB)end
function ap.onSelect(aB)table.insert(aw,aB)end return ap end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(
function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab.Parent
.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList',Title=
af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag end)()
end,[39]=function()local aa,ab,ac=a(39)local ad return(function(...)type Set<T> ={[T]:any}export type Symbol={type:
string,name:string}export type Animatable=number|CFrame|Color3|ColorSequenceKeypoint|DateTime|NumberRange|
NumberSequenceKeypoint|PhysicalProperties|Ray|Rect|Region3|Region3int16|UDim|UDim2|Vector2|Vector2int16|Vector3|
Vector3int16 export type Task=Instance|RBXScriptConnection|(()->())|{destroy:(any)->()}|{Destroy:(any)->()}|{Task}export
type Version={major:number,minor:number,isRelease:boolean}export type Dependency={dependentSet:Set<Dependent>}export
type Dependent={update:(Dependent)->boolean,dependencySet:Set<Dependency>}export type StateObject<T> =Dependency&{type:
string,kind:string,get:(StateObject<T>,asDependency:boolean?)->T}export type CanBeState<T> =StateObject<T>|T export type
Value<T> =StateObject<T>&{set:(Value<T>,newValue:any,force:boolean?)->()}export type Computed<T> =StateObject<T>&
Dependent&{}export type ForPairs<KO,VO> =StateObject<{[KO]:VO}>&Dependent&{}export type ForKeys<KO,V> =StateObject<{[KO]
:V}>&Dependent&{}export type ForValues<K,VO> =StateObject<{[K]:VO}>&Dependent&{}export type Tween<T> =StateObject<T>&
Dependent&{}export type Spring<T> =StateObject<T>&Dependent&{}export type Observer=Dependent&{onChange:(Observer,
callback:()->())->(()->())}export type SpecialKey={type:string,kind:string,stage:string,apply:(SpecialKey,value:any,
applyTo:Instance,cleanupTasks:{Task})->()}export type Children=Instance|StateObject<Children>|{[any]:Children}export
type PropertyTable={[string|SpecialKey]:any}return nil end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.
themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=an.New,an
.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.animate,aw
.typecheck,aw.connections,aw.customFont,aw.references,aw.drag,ac(ae.simpleElements)local aF,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,
aS=aE.UIPadding,aE.UICorner,aE.UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=
false,Callback=function()end,FLAG='',Default=false,LinkKeybind=true,IgnoreConfig=true},{af.DisabledText and''or
'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Default and''or
'Default',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or'IgnoreConfig',af.IgnoreConfig and''or
'IgnoreConfig'})assert(aR,table.concat(aS,'\n'))aR,aS=az(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or
'Bind'})assert(aR,table.concat(aS,'\n'))local aT,b,c,d,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',ah.
find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.DisabledText or as'Component Disabled',af.IsEnabled or
as(true),af.Visible or as(true),af.Callback,af.Default or as(false),af.Bind,af.IgnoreConfig or as(false),af.LinkKeybind
or as(false)local C,D=(af.FLAG or as(r.uid))if ax(C)~=''then D=ak.register(ax(C),{boolean=as(false),keycode=as(nil),
coordinate=as(nil)},'toggle',ax(C)==r.uid)D.user.Value=ax(D.status.boolean)end local E=as()local function F(G:EnumItem,H
:string)local I,J=ax(b.binds),ax(p.bindData)if table.find(I,G)then aQ(('Key %s is already in use. %s'):format(G.Name,H))
else table.insert(I,G)if ax(E)then table.remove(I,table.find(I,ax(E)))J[ax(E).Name]=nil end E:set(G)J[ax(E).Name]={bind=
ax(E),name=ax(t),boolean=D.status.boolean}p:update('bindData',J)b:update('binds',I)D.status.keycode:set(ax(E).Name)end
end at(D.status.boolean):onChange(function()if ax(v)then task.spawn(ax(x),ax(D.status.boolean))end end)table.insert(q.
list,D.status.boolean)local G=as(ax(aT.string)==ax(r.tab).uid)at(aT.string):onChange(function()G:set(ax(aT.string)==ax(r
.tab).uid)end)local H,I=ay(function()return ax(G)and 0 or 1 end,40,1),as(false)local J=am.InputBegan:Connect(function(J,
K)if ax(n.boolean)then return end if ax(I)then if J.KeyCode and J.KeyCode~=Enum.KeyCode.Unknown then F(J.KeyCode,
'From input box')end I:set(false)task.wait()o:update('boolean',false)else if J.KeyCode and J.KeyCode==ax(E)and not K and
not ax(o.boolean)and ax(v)then D.status.boolean:set(not ax(D.status.boolean))end end end)aA.add(J)local K,L,M=(as(false)
)M=ao'TextButton'{Visible=av(function()if not ax(v)then return ax(v)end return ax(K)end),Parent=aC.get(ax(m.name)),Size=
UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=t,
FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground
,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if L then L:Disconnect()L=nil D.status.
coordinate:set(M.AbsolutePosition)else D.status.boolean:set(not ax(D.status.boolean))end end,[ap]={aF(4),aJ(16),aK(0,16)
,ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32)
,BackgroundTransparency=1,Image=ax(n.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=s,Visible=av(function()if ax(d.string)~=''and not string.find(ax(t):lower(),ax(
d.string):lower())or not ax(w)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[
ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(v)then return true end return false end),BackgroundTransparency=
ay(function()return ax(G)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={
aJ(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=H},ao'TextLabel'{FontFace=aB(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=H,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=av(function()
return ax(u)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aL(aM.LayoutOrder,aN.Horizontal,aO.Left,aP.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=av(function()if not ax(v)then return false end return ax(G)end),Size=av(function()return
ax(B)and UDim2.new(0.775,ax(K)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=H,[au'Activated']=function()if not ax(v)then return end D.status.boolean:set(not ax(D.status.
boolean))end,[ap]={aJ(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aF(8),aL(aM.LayoutOrder,aN.
Horizontal,aO.Left,aP.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=H,BackgroundColor3=ay(function()return ax(D.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aJ(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=ay(
function()if not ax(G)then return 1 end if ax(D.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=t,TextTransparency=H,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=K,
Interactable=av(function()if not ax(v)then return false end return ax(G)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=H,[au'Activated']=function()K:set(false)M.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aJ(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=H}}},ao
'TextButton'{Visible=B,Interactable=av(function()if not ax(v)then return false end return ax(G)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=H,[au'Activated']=function()if ax(n.boolean)then K:set(
true)L=aD(M,15)return end I:set(true)o:update('boolean',true)end,[ap]={aJ(6),aF(6),aL(aM.LayoutOrder,aN.Horizontal,aO.
Left,aP.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ax(n.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=H},ao'TextLabel'{Visible=not ax(n.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=H,Text=av(function()return ax(I)and
'Listening'or ax(E)and ax(E).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(n.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=av(function()return ax(K)and'Move Bind'or'Place Bind'end),
TextTransparency=H}}}}}}}if ax(c.boolean)and not ax(A)then D.file:Connect(function(N)local O,P=true,true if N.boolean~=
nil then D.status.boolean:set(N.boolean)O=false end if N.keycode~=nil then if ax(E)and ax(E).Name==N.keycode then return
end local Q,R=pcall(function()return Enum.KeyCode[N.keycode]end)if Q then F(R,'File1')end P=false end if O then D.status
.boolean:set(ax(y))end if P then if z then F(ax(z),'NoFileFound')end end if ax(n.boolean)and N.coordinate then M.
Position=UDim2.fromOffset(N.coordinate.X+30,N.coordinate.Y+30)K:set(true)end end)if D.private then D.status.boolean:set(
ax(y))if z then F(ax(z),'Private')end end else D.status.boolean:set(ax(y))if z then F(ax(z),
'IgnoreConfig/UseConfig:false')end end if D.preregistered and D.preregisteredValue and typeof(D.preregisteredValue)==
'table'then if D.preregisteredValue.boolean and typeof(D.preregisteredValue.boolean)=='boolean'then D.status.boolean:
set(D.preregisteredValue.boolean)end if ax(B)then if not ax(n.boolean)then if D.preregisteredValue.keycode and typeof(D.
preregisteredValue.keycode)=='string'then local N,O=pcall(function()return Enum.KeyCode[D.preregisteredValue.keycode]end
)if N then F(O,'Configuration1')end end else if D.preregisteredValue.coordinate and typeof(D.preregisteredValue.
coordinate)=='table'and D.preregisteredValue.coordinate.X and D.preregisteredValue.coordinate.Y then if typeof(D.
preregisteredValue.coordinate.X)=='number'and typeof(D.preregisteredValue.coordinate.Y)=='number'then M.Position=UDim2.
fromOffset(D.preregisteredValue.coordinate.X+30,D.preregisteredValue.coordinate.Y+30)K:set(true)end end end end end
local N={}function N.SetName(O,P)local Q,R=az({SetName=P},{SetName=''})assert(Q,table.concat(R,'\n'))t:set(P)end
function N.SetValue(O,P:boolean)local Q,R=az({SetValue=P},{SetValue=true})assert(Q,table.concat(R,'\n'))D.status.boolean
:set(P)end function N.SetBind(O,P:EnumItem)assert(ax(B),'Requires LinkKeybind')local Q,R=az({SetBind=P},{SetBind=Enum.
keyCode.C})assert(Q,table.concat(R,'\n'))F(P,'At :SetBind')end function N.Enable(O)v:set(true)end function N.Disable(O)v
:set(false)end function N.Visible(O)w:set(true)end function N.Invisible(O)w:set(false)end return N end end)()end,[47]=
function()local aa,ab,ac=a(47)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.
Utility.xtypeof)local function ah<T>(ai:PubTypes.CanBeState<T>,aj:boolean?):T return if ag(ai)=='State'then(ai::PubTypes
.StateObject<T>):get(aj)else(ai::T)end return ah end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au=ap.
UICorner,ap.UIPadding,ac(ae.utilities)local av,aw,ax,ay=au.get,au.typecheck,au.animate,au.customFont local az,aA=aw(af,{
Text='',Visible=false},{af.Visible and''or'Visible'})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aJ=ah.find
'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Text,af.Visible or am(true)local aK=am(av(aB.string)==av(aD.
tab).uid)ao(aB.string):onChange(function()aK:set(av(aB.string)==av(aD.tab).uid)end)local aL=ax(function()return av(aK)
and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if av(aC.string)~=''and not string.find(av(aF):lower(),av(aC.string):
lower())or not av(aJ)then return false end return true end),Size=UDim2.new(1,0,0,36),Parent=aE,BackgroundTransparency=aL
,BackgroundColor3=ai.background2,[al]={as(6),at(0,8),ak'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),
RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=aL,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0
,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()
return av(aF)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}local aM={}function aM.SetText(aN,aO)
local aP,aQ=aw({SetText=aO},{SetText=''})assert(aP,table.concat(aQ,'\n'))aF:set(aO)end function aM.Visible(aN)aJ:set(
true)end function aM.Invisible(aN)aJ:set(false)end return aM end end)()end,[44]=function()local aa,ab,ac=a(44)local ad
return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap=ac(ae.PubTypes),ac(ae.Types),ac(ae.
Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.
parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction
),{}local as,at={__index=ap},{__mode='k'}function ap.get(au,av:boolean?):any if av~=false then aj(au)end return au.
_outputTable end function ap.update(au):boolean local av=au._inputIsState local aw,ax,ay=if av then au._inputTable:get(
false)else au._inputTable,{},false au._oldValueCache,au._valueCache=au._valueCache,au._oldValueCache local az,aA=au.
_valueCache,au._oldValueCache table.clear(az)for aB in pairs(au.dependencySet)do aB.dependentSet[au]=nil end au.
_oldDependencySet,au.dependencySet=au.dependencySet,au._oldDependencySet table.clear(au.dependencySet)if av then au.
_inputTable.dependentSet[au]=true au.dependencySet[au._inputTable]=true end for aC,aD in pairs(aw)do local aE=aA[aD]
local aF,aJ,aK,aL=(aE==nil)if type(aE)=='table'and#aE>0 then local aM=table.remove(aE,#aE)aJ=aM.value aK=aM.valueData aL
=aM.meta if#aE<=0 then aA[aD]=nil end elseif aE~=nil then aA[aD]=nil aF=true end if aK==nil then aK={dependencySet=
setmetatable({},at),oldDependencySet=setmetatable({},at),dependencyValues=setmetatable({},at)}end if aF==false then for
aM,aN in pairs(aK.dependencyValues)do if aN~=aM:get(false)then aF=true break end end end if aF then aK.oldDependencySet,
aK.dependencySet=aK.dependencySet,aK.oldDependencySet table.clear(aK.dependencySet)local aM,aN,aO=ah(aK.dependencySet,au
._processor,aD)if aM then if au._destructor==nil and(ao(aN)or ao(aO))then am'destructorNeededForValues'end if aJ~=nil
then local aP,aQ=xpcall(au._destructor or an,ak,aJ,aL)if not aP then al('forValuesDestructorError',aQ)end end aJ=aN aL=
aO ay=true else aK.oldDependencySet,aK.dependencySet=aK.dependencySet,aK.oldDependencySet al('forValuesProcessorError',
aN)end end local aM=az[aD]if aM==nil then aM={}az[aD]=aM end table.insert(aM,{value=aJ,valueData=aK,meta=aL})ax[aC]=aJ
for aN in pairs(aK.dependencySet)do aK.dependencyValues[aN]=aN:get(false)au.dependencySet[aN]=true aN.dependentSet[au]=
true end end for aE,aF in pairs(aA)do for aJ,aK in ipairs(aF)do local aL,aM=aK.value,aK.meta local aN,aO=xpcall(au.
_destructor or an,ak,aL,aM)if not aN then al('forValuesDestructorError',aO)end ay=true end table.clear(aF)end au.
_outputTable=ax return ay end local function au<VI,VO,M>(av:PubTypes.CanBeState<{[any]:VI}>,aw:(VI)->(VO,M?),ax:((VO,M?
)->())?):Types.ForValues<VI,VO,M>local ay=av.type=='State'and typeof(av.get)=='function'local az=setmetatable({type=
'State',kind='ForValues',dependencySet={},dependentSet=setmetatable({},at),_oldDependencySet={},_processor=aw,
_destructor=ax,_inputIsState=ay,_inputTable=av,_outputTable={},_valueCache={},_oldValueCache={}},as)ai(az)az:update()
return az end return au end)()end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.
OnEvent,ai.Children,ai.Value,ai.Computed,ac(ae.utilities)local ap,as,at,au,av,aw=ao.get,ao.animate,ao.getStringBounds,ao
.customFont,ao.typecheck,ac(ae.simpleElements)local ax,ay,az,aA,aB,aC,aD,aE,aF=aw.UICorner,aw.UIPadding,aw.UIListLayout,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,av(af,{Title='',Body='',Duration=1,
Image='',ImageColor=Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.
Buttons and''or'Buttons'})assert(aE,table.concat(aF,'\n'))local aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS=am(af.Title),am(af.Body),
am(af.Duration),am(af.Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),
am'',am(250)local function aT(b,c)local d=1 for m=1,b do d=d*10 end local m=tostring(math.round(c*d)/d)local n=string.
split(m,'.')if#n==1 then local o=''for p=1,b do o=o..'0'end m=m..'.'..o end return m end local b,c={}for d,m in ap(aO)do
local n,o=av({Button=m},{Button={}})assert(n,table.concat(o,'\n'))n,o=av(m,{Name='',Callback=function()end})assert(n,
table.concat(o,'\n'))local p,q=m.Name,m.Callback local r=aj'TextButton'{Size=UDim2.new(1/#ap(aO),-2,1,-4),TextSize=14,
Text=p,FontFace=au('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak
'Activated']=function()task.spawn(q)aQ:set(false)task.wait(0.4)aP:set(false)task.wait(2)c:Destroy()end,[al]={ax(4)}}
table.insert(b,r)end c=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=UDim2.fromOffset(ap(aS),0),AutomaticSize
=Enum.AutomaticSize.Y,[al]={ay(5,0,0,0),aj'TextButton'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ak'Activated'
]=function()aQ:set(false)task.wait(0.4)aP:set(false)c:Destroy()end},aj'Frame'{Size=UDim2.fromScale(1,0),BackgroundColor3
=ah.background,AutomaticSize=Enum.AutomaticSize.Y,Position=as(function()return UDim2.fromScale(ap(aQ)and 0 or 1.2,0)end,
30,1),[al]={az(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ay(0,4),ax(4),aj'Frame'{Visible=ap(aM)~=''
and true or false,Size=UDim2.new(0,24,1,0),BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=aM,ImageColor3=aN}}},
aj'Frame'{Size=UDim2.new(1,ap(aM)~=''and-28 or 0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,[al]={
ay(2,0),az(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top),aj'TextLabel'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,
FontFace=au('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,TextSize=16,RichText=true,
TextColor3=ah.text,Text=aJ},aj'TextLabel'{Size=UDim2.new(1,0,0,1),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.
fromOffset(8,25),BackgroundTransparency=1,FontFace=au('Montserrat',Enum.FontWeight.Medium),TextSize=14,TextXAlignment=
Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,RichText=true,TextColor3=ah.text2,Text=
aK},aj'Frame'{Visible=an(function()return#ap(aO)>0 and true or false end),Size=UDim2.new(1,0,0,26),
BackgroundTransparency=1,[al]={az(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,2)),b}},aj'TextLabel'{Size
=UDim2.new(1,0,0,10),FontFace=au('Montserrat',Enum.FontWeight.Medium),Text=aR,TextColor3=ah.text,TextSize=10,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()aQ:set(true)end)task.
spawn(function()repeat task.wait()until ap(aQ)local n,o=(tick())repeat o=tick()-n aR:set(aT(1,math.clamp(o,0,ap(aL))))
task.wait()until o>ap(aL)end)task.spawn(function()aP:set(true)repeat task.wait()until ap(aQ)task.wait(ap(aL))task.wait(
0.2)aQ:set(false)task.wait(0.4)aP:set(false)task.wait(2)c:Destroy()end)end end)()end,[45]=function()local aa,ab,ac=a(45)
local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.
initDependency)type Set<T> ={[T]:any}local ai={}local aj,ak:Set<Types.Observer> ={__index=ai},{}function ai.update(al):
boolean for am,an in pairs(al._changeListeners)do task.spawn(an)end return false end function ai.onChange(al,am:()->()):
()->()local an={}al._numChangeListeners+=1 al._changeListeners[an]=am ak[al]=true local ao=false return function()if ao
then return end ao=true al._changeListeners[an]=nil al._numChangeListeners-=1 if al._numChangeListeners==0 then ak[al]=
nil end end end local function al(am:PubTypes.Value<any>):Types.Observer local an=setmetatable({type='State',kind=
'Observer',dependencySet={[am]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},aj)ah(an)am.dependentSet
[an]=true return an end return al end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)local ae=ab.
Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,as=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.
captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(
ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.
needsDestruction),{}local at,au={__index=as},{__mode='k'}function as.get(av,aw:boolean?):any if aw~=false then aj(av)end
return av._outputTable end function as.update(av):boolean local aw=av._inputIsState local ax,ay,az,aA,aB,aC,aD=if aw
then av._inputTable:get(false)else av._inputTable,av._oldInputTable,av._outputTable,av._keyOIMap,av._keyIOMap,av._meta,
false for aE in pairs(av.dependencySet)do aE.dependentSet[av]=nil end av._oldDependencySet,av.dependencySet=av.
dependencySet,av._oldDependencySet table.clear(av.dependencySet)if aw then av._inputTable.dependentSet[av]=true av.
dependencySet[av._inputTable]=true end for aF,aJ in pairs(ax)do local aK=av._keyData[aF]if aK==nil then aK={
dependencySet=setmetatable({},au),oldDependencySet=setmetatable({},au),dependencyValues=setmetatable({},au)}av._keyData[
aF]=aK end local aL=ay[aF]==nil if aL==false then for aM,aN in pairs(aK.dependencyValues)do if aN~=aM:get(false)then aL=
true break end end end if aL then aK.oldDependencySet,aK.dependencySet=aK.dependencySet,aK.oldDependencySet table.clear(
aK.dependencySet)local aM,aN,aO=ah(aK.dependencySet,av._processor,aF)if aM then if av._destructor==nil and(ap(aN)or ap(
aO))then an'destructorNeededForKeys'end local aP,aQ=aA[aN],aB[aF]if aP~=aF and ax[aP]~=nil then am('forKeysKeyCollision'
,nil,tostring(aN),tostring(aP),tostring(aN))end if aQ~=aN and aA[aQ]==aF then local aR=aC[aQ]local aS,aT=xpcall(av.
_destructor or ao,ak,aQ,aR)if not aS then al('forKeysDestructorError',aT)end aA[aQ]=nil az[aQ]=nil aC[aQ]=nil end ay[aF]
=aJ aC[aN]=aO aA[aN]=aF aB[aF]=aN az[aN]=aJ aD=true else aK.oldDependencySet,aK.dependencySet=aK.dependencySet,aK.
oldDependencySet al('forKeysProcessorError',aN)end end for aM in pairs(aK.dependencySet)do aK.dependencyValues[aM]=aM:
get(false)av.dependencySet[aM]=true aM.dependentSet[av]=true end end for aK,aL in pairs(aA)do if ax[aL]==nil then local
aM=aC[aK]local aN,aO=xpcall(av._destructor or ao,ak,aK,aM)if not aN then al('forKeysDestructorError',aO)end ay[aL]=nil
aC[aK]=nil aA[aK]=nil aB[aL]=nil az[aK]=nil av._keyData[aL]=nil aD=true end end return aD end local function av<KI,KO,M>
(aw:PubTypes.CanBeState<{[KI]:any}>,ax:(KI)->(KO,M?),ay:((KO,M?)->())?):Types.ForKeys<KI,KO,M>local az=aw.type=='State'
and typeof(aw.get)=='function'local aA=setmetatable({type='State',kind='ForKeys',dependencySet={},dependentSet=
setmetatable({},au),_oldDependencySet={},_processor=ax,_destructor=ay,_inputIsState=az,_inputTable=aw,_oldInputTable={},
_outputTable={},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},at)ai(aA)aA:update()return aA end return av end)()end,[
88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return
function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingTop=typeof(...)=='number'and UDim.new(0,...)or
...,PaddingRight=typeof(...)=='number'and UDim.new(0,...)or...,PaddingBottom=typeof(...)=='number'and UDim.new(0,...)or
...,PaddingLeft=typeof(...)=='number'and UDim.new(0,...)or...}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=
typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],
PaddingBottom=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[
2])or af[2]}elseif#af==3 then return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],
PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af
[3])or af[3],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}else return ae.New'UIPadding'{PaddingTop=
typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],
PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[4])=='number'and UDim.new(0,af[
4])or af[4]}end end end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:string,
af)ae=ae or''local ag=Instance.new'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width
local ah=ac(ab.Parent.Parent.Bundles.services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[89]=function()
local aa,ab,ac=a(89)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af:number?
,ag:number?)return ae.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[46]=function()local aa,ab,
ac=a(46)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak=ac(ae.Types),ac(ae.Dependencies.
useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(ae.Utility.isSimilar),{}local al,am={
__index=ak},{__mode='k'}function ak.get(an,ao:boolean?):any if ao~=false then ag(an)end return an._value end function ak
.set(an,ao:any,ap:boolean?)local as=an._value if ap or not aj(as,ao)then an._value=ao ai(an)end end local function an<T>
(ao:T):Types.State<T>local ap=setmetatable({type='State',kind='Value',dependentSet=setmetatable({},am),_value=ao},al)ah(
ap)return ap end return an end)()end,[76]=function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
services local am,an,ao=al.UserInputService,al.RunService,ag.Fusion local ap,as,at,au,av,aw,ax,ay=ao.New,ao.Children,ao.
Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local az,aA,aB,aC,aD=ay.get,ay.animate,ay.typecheck,ay.
customFont,ac(ae.simpleElements)local aE,aF,aJ,aK,aL,aM,aN,aO,aP=aD.UIListLayout,aD.UIPadding,aD.UICorner,Enum.SortOrder
,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aB(af,{Name='',DisabledText='',IsEnabled=false,
Visible=false,Callback=function()end,FLAG='',Default=0,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0,IgnoreConfig=
true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or
'FLAG',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or'DisplayAsPercent'
,af.DecimalPlace and''or'DecimalPlace',af.IgnoreConfig and''or'IgnoreConfig'})assert(aO,table.concat(aP,'\n'))local aQ,
aR,aS,aT,b,c,d,m,n,o,p,q,r,s,t=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,
af.DisabledText or at'Component Disabled',af.IsEnabled or at(true),af.Visible or at(true),af.Callback,af.Max,af.Min,af.
DisplayAsPercent or at(false),af.DecimalPlace or at(0),af.IgnoreConfig or at(false)local u=az(af.Default)and at(math.
clamp(az(af.Default),az(q),az(p)))if not az(u)then u=at(az(q))end local v=(af.FLAG and az(af.FLAG)~='')and az(af.FLAG)or
aT.uid local w=ak.register(v,{percentageOf=at(az(q))},'slider',v==aT.uid)w.user.Value=az(w.status.percentageOf)local x=
at(az(aQ.string)==az(aT.tab).uid)au(aQ.string):onChange(function()x:set(az(aQ.string)==az(aT.tab).uid)end)local y=aA(
function()return az(x)and 0 or 1 end,40,1)local function z(A,B,C,D,E)return(1-((A-B)/(C-B)))*D+((A-B)/(C-B))*E end
local function A(B)if az(s)==0 then return math.floor(B)end return tonumber(string.format('%.'..az(s)..'f',B))end local
B=at(0)au(w.status.percentageOf):onChange(function()local C=az(w.status.percentageOf)if C>az(p)or C<az(q)then w.status.
percentageOf:set(math.clamp(C,az(q),az(p)))return end B:set(z(az(w.status.percentageOf),az(q),az(p),0,1))if not az(m)
then return end task.spawn(az(o),az(w.status.percentageOf))end)local C,D,E,F=at(),at(10),at(),at(false)am.InputEnded:
Connect(function(G)if(G.UserInputType==Enum.UserInputType.MouseButton1 or G.UserInputType==Enum.UserInputType.Touch)and
az(F)then F:set(false)end end)ap'Frame'{Parent=b,Visible=aw(function()if az(aS.string)~=''and not string.find(az(c):
lower(),az(aS.string):lower())or not az(n)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundColor3=ai.background2,BackgroundTransparency=aA(function()if az(x)then return 0 end return 1 end,40,1),[as]={
aJ(6),ap'Frame'{ZIndex=2,Visible=aw(function()if not az(m)then return true end return false end),BackgroundTransparency=
aA(function()return az(x)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[as]={
aJ(6),ap'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=y},ap'TextLabel'{FontFace=aC(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=y,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=aw(function()
return az(d)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[as]={aF(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[as]={aE(aK.LayoutOrder,aL.Horizontal,aM.Left,aN.Center,UDim.new(0,6)
),aF(0,8),ap'TextLabel'{FontFace=aC('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=y,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=c,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[as]={aE(aK.LayoutOrder,aL.
Horizontal,aM.Left,aN.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[as]={aJ(4),
aE(aK.LayoutOrder,aL.Vertical,aM.Right,aN.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aC('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=y,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=aw(function()if az(r)then return
tostring(A(az(B)*100))..'%'end return az(w.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[av'Changed']=function(G)local H=az(E)if G=='AbsoluteSize'and H and H.
AbsoluteSize then D:set(H.AbsoluteSize.X)end end,[av'FocusLost']=function()local G=az(E)if tonumber(G.Text)then w.status
.percentageOf:set(math.clamp(tonumber(G.Text),az(q),az(p)))else if az(r)then G.Text=tostring(A(az(B)*100))..'%'end G.
Text=az(w.status.percentageOf)end end,[ax]=E,[as]={aF(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=aA(function()if az(x)then return 0.5 end return 1 end,40,1),Size=aA(function()return UDim2.
fromOffset(az(D),2)end,40,1),[as]={aJ(0,1)}}}},ap'TextButton'{Interactable=aw(function()if not az(m)then return false
end return az(x)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[av'MouseButton1Down']=function()F:set(true)
end,[av'TouchLongPress']=function()F:set(true)end,[av'InputBegan']=function(G)if G.UserInputType==Enum.UserInputType.
MouseButton1 or G.UserInputType==Enum.UserInputType.Touch and az(C)then local H,I=am:GetMouseLocation().X,az(C).Size.X.
Offset local J=H-(az(C).AbsolutePosition.X+I)while az(F)and task.wait()do local K=am:GetMouseLocation().X local L=math.
clamp(I+(K-H)+J,0,az(C).AbsoluteSize.X)w.status.percentageOf:set(A(z(L,0,az(C).AbsoluteSize.X,az(q),az(p))))an.
RenderStepped:Wait()end end end,[ax]=C,[as]={aF(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=y,[as]={aJ(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=y,Size=
aA(function()return UDim2.new(az(B),0,0,4)end,40,1),[as]={aJ(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=y,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[as]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=aA(function()if az(x)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if az(aR.boolean)and not az(t)then w.file:Connect(function(G)local H=true if G~=nil then w.status.
percentageOf:set(G)H=false end if H then w.status.percentageOf:set(az(u))end end)if w.private then w.status.percentageOf
:set(az(u))end else w.status.percentageOf:set(az(u))end if w.preregistered and w.preregisteredValue and typeof(w.
preregisteredValue)=='number'then w.status.percentageOf:set(w.preregisteredValue)end local G={}function G.SetName(H,I)
local J,K=aB({SetName=I},{SetName=''})assert(J,table.concat(K,'\n'))c:set(I)end function G.SetValue(H,I)local J,K=aB({
SetValue=I},{SetValue=0})assert(J,table.concat(K,'\n'))w.status.percentageOf:set(math.clamp(I,az(q),az(p)))end function
G.Enable(H)m:set(true)end function G.Disable(H)m:set(false)end function G.Visible(H)n:set(true)end function G.Invisible(
H)n:set(false)end return G end end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{
cannotAssignProperty="The class type '%s' has no assignable property '%s'.",cannotConnectChange=
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
[['%s' isn't a valid stage for a special key to be applied at.]]}end)()end},{{1,2,{'Darius'},{{84,2,{'simpleElements'},{
{86,2,{'UICorner'}},{89,2,{'UITextSizeConstraint'}},{88,2,{'UIPadding'}},{87,2,{'UIListLayout'}},{85,2,{
'UIAspectRatioConstraint'}}}},{64,1,{'components'},{{66,2,{'buttonGroup'}},{71,2,{'keybindList'}},{70,2,{'keybind'}},{67
,2,{'colorpicker'}},{76,2,{'slider'}},{65,2,{'button'}},{77,2,{'tabButton'}},{75,2,{'paragraph'}},{72,2,{'label'}},{73,2
,{'module'}},{80,2,{'toggle'}},{68,2,{'divider'}},{69,2,{'dropdown'}},{74,2,{'notification'}},{81,2,{'warn'}},{78,2,{
'tabFrame'}},{79,2,{'textbox'}}}},{2,2,{'Bundles'},{{3,2,{'Fusion'},{{40,1,{'State'},{{45,2,{'Observer'}},{46,2,{'Value'
}},{43,2,{'ForPairs'}},{42,2,{'ForKeys'}},{47,2,{'unwrap'}},{41,2,{'Computed'}},{44,2,{'ForValues'}}}},{33,1,{'Logging'}
,{{38,2,{'parseError'}},{34,2,{'logError'}},{35,2,{'logErrorNonFatal'}},{37,2,{'messages'}},{36,2,{'logWarn'}}}},{22,1,{
'Instances'},{{31,2,{'applyInstanceProps'}},{23,2,{'Children'}},{27,2,{'OnChange'}},{32,2,{'defaultProps'}},{26,2,{'New'
}},{29,2,{'Out'}},{24,2,{'Cleanup'}},{30,2,{'Ref'}},{25,2,{'Hydrate'}},{28,2,{'OnEvent'}}}},{39,2,{'PubTypes'}},{4,1,{
'Animation'},{{8,2,{'TweenScheduler'}},{5,2,{'Spring'}},{9,2,{'getTweenRatio'}},{12,2,{'springCoefficients'}},{11,2,{
'packType'}},{13,2,{'unpackType'}},{10,2,{'lerpType'}},{6,2,{'SpringScheduler'}},{7,2,{'Tween'}}}},{16,1,{'Dependencies'
},{{17,2,{'captureDependencies'}},{18,2,{'initDependency'}},{21,2,{'useDependency'}},{19,2,{'sharedState'}},{20,2,{
'updateAll'}}}},{48,2,{'Types'}},{49,1,{'Utility'},{{50,2,{'None'}},{52,2,{'doNothing'}},{54,2,{'needsDestruction'}},{55
,2,{'restrictRead'}},{51,2,{'cleanup'}},{53,2,{'isSimilar'}},{56,2,{'xtypeof'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}}}}
,{57,2,{'data'}},{59,2,{'icons'}},{60,2,{'lucide'}},{58,2,{'flags'}},{61,2,{'services'}},{62,2,{'themeSystem'},{{63,2,{
'default'}}}}}},{90,2,{'utilities'},{{94,2,{'customFunctions'}},{92,2,{'connections'}},{101,2,{'typecheck'}},{98,2,{
'randomString'}},{96,2,{'get'}},{99,2,{'references'}},{91,2,{'animate'}},{97,2,{'getStringBounds'}},{93,2,{'customFont'}
},{100,2,{'tween'}},{95,2,{'drag'}}}},{82,1,{'layouts'},{{83,2,{'main'}}}}}}},'0.4.1','WaxRuntime',string,task,
setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local aw,ax,ay,az,aA
,aB,aC=aj.insert,aj.remove,aj.freeze or function(aw)return aw end,al.wrap,ae.sub,ae.match,ae.gmatch if au and aA(au,1,4)
=='Lune'then local aD,aE=ap(ao,'@lune/task')if aD and aE then af=aE end end local aD=af and af.defer local aE,aF,aJ,aK,
aL,aM,aN,aO,aP=aD or function(aE,...)az(aE)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]=
'StringValue'},{},{},{},{},{},{},{}local aQ,aR={GetFullName={{},function(aQ)local aR,aS=aQ.Name,aQ.Parent while aS do aR
=aS.Name..'.'..aR aS=aS.Parent end return aR end},GetChildren={{},function(aQ)local aR={}for aS in ai,aP[aQ]do aw(aR,aS)
end return aR end},GetDescendants={{},function(aQ)local aR={}for aS in ai,aP[aQ]do aw(aR,aS)for aT,b in ai,aS:
GetDescendants()do aw(aR,b)end end return aR end},FindFirstChild={{'string','boolean?'},function(aQ,aR,aS)local aT=aP[aQ
]for b in ai,aT do if b.Name==aR then return b end end if aS then for c in ai,aT do return c:FindFirstChild(aR,true)end
end end},FindFirstAncestor={{'string'},function(aQ,aR)local aS=aQ.Parent while aS do if aS.Name==aR then return aS end
aS=aS.Parent end end},WaitForChild={{'string','number?'},function(aQ,aR)return aQ:FindFirstChild(aR)end}},{}for aS,aT in
ai,aQ do local b,c,d=aT[1],aT[2],{}for m,n in ai,b do local o,p=aB(n,'^([^%?]+)(%??)')d[m]={o,p}end aR[aS]=function(o,
...)if not aP[o]then ah("Expected ':' not '.' calling member function "..aS,2)end local p={...}for q,r in ai,d do local
s=p[q]local t,u,v=an(s),r[1],r[2]if s==nil and not v then ah('Argument '..s..' missing or nil',3)end if u~='any'and t~=u
and not(t=='nil'and v)then ah('Argument '..q..' expects type "'..u..'", got "'..t..'"',2)end end return c(o,...)end end
local function b(c,d,m)local n,o=(ag({},{__mode='k'}))local function p(q)ah(q..' is not a valid (virtual) member of '..c
..' "'..d..'"',3)end local function q(r)ah('Unable to assign (virtual) property '..r..'. Property is read only',3)end
local r,s={},{}s.__metatable=false s.__index=function(t,u)if u=='ClassName'then return c elseif u=='Name'then return d
elseif u=='Parent'then return m elseif c=='StringValue'and u=='Value'then return o else local v=aR[u]if v then return v
end end for v in ai,n do if v.Name==u then return v end end p(u)end s.__newindex=function(t,u,v)if u=='ClassName'then q(
u)elseif u=='Name'then d=v elseif u=='Parent'then if v==r then return end if m~=nil then aP[m][r]=nil end m=v if v~=nil
then aP[v][r]=true end elseif c=='StringValue'and u=='Value'then o=v else p(u)end end s.__tostring=function()return d
end ag(r,s)aP[r]=n if m~=nil then aP[m][r]=true end return r end local function c(d,m)local n,o,p,q=d[1],d[2],d[3],d[4]
local r=aF[o]local s=p and ax(p,1)or r local t=b(r,s,m)aJ[n]=t if p then for u,v in ai,p do t[u]=v end end if q then for
u,v in ai,q do c(v,t)end end return t end local d=b('Folder','['..ad..']')for m,n in ai,ab do c(n,d)end for o,p in ai,aa
do local q=aJ[o]aK[q]=p aL[q]=o local r=q.ClassName if r=='LocalScript'or r=='Script'then aw(aN,q)end end local function
q(r)local s,t=r.ClassName,aM[r]if t and s=='ModuleScript'then return ak(t)end local u=aK[r]local function v(w)w=as(w)
local x,y,z=r:GetFullName(),aB(w,'[^:]+:(%d+): (.+)')if not y or not av then return x..':*: '..(z or w)end y=at(y)local
A=aL[r]local B=av[A]local C=y-B+1 if C<0 then C='?'end return x..':'..C..': '..z end if s=='LocalScript'or s=='Script'
then local w,x=ap(u)if not w then ah(v(x),0)end else local w={ap(u)}local x=ax(w,1)if not x then local y=ax(w,1)ah(v(y),
0)end aM[r]=w return ak(w)end end function a(r)local s=aJ[r]local function t(u,...)local v={ap(u,...)}local w=ax(v,1)if
not w then ah(v[1],3)end return ak(v)end local u=ay(ag({},{__index=aO,__newindex=function(u,v,w)aO[v]=w end,__len=
function()return#aO end,__iter=function()return ai,aO end}))local v,w=ay{version=ac,envname=ad,shared=u,script=am,
require=ao},s local function x(y,...)local z,A,B=an(y),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if z=='table'and aP[y]then if y.ClassName~='ModuleScript'then ah(A,2)elseif y==s
then ah(B,2)end return q(y)elseif z=='string'and aA(y,1,1)~='@'then if#y==0 then ah(
'Attempted to call require with empty string',2)end local C=s if aA(y,1,1)=='/'then C=d elseif aA(y,1,2)=='./'then y=aA(
y,3)end local D for E in aC(y,'([^/]*)/?')do local F=E if E=='..'then F='Parent'end if F~=''then local G=C:
FindFirstChild(F)if not G then local H=C.Parent if H then G=H:FindFirstChild(F)end end if G then C=G elseif E~=D and E~=
'init'and E~='init.server'and E~='init.client'then ah('Virtual script path "'..y..'" not found',2)end end D=E end if C.
ClassName~='ModuleScript'then ah(A,2)elseif C==s then ah(B,2)end return q(C)end return t(ao,y,...)end return v,w,x end
for r,s in ai,aN do aE(q,s)end return q(d:GetChildren()[1])