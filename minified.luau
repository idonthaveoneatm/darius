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
)if not af then ad:Enable()ac:Enable()return end if af.lock and ad then ad:Disable()ac:Disable()elseif not af.lock and
ad then ad:Enable()ac:Enable()end end},R:ButtonGroup()af:Button{Name='Load',Callback=function()if ab~=''then v.set(ab)
local ag=v.find(ab)y:Notify{Title=A.Title,Body=`Set configuration to "{ag.name}"`,Duration=3,Image=h.check}else y:Notify
{Title='Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}
local function ag(ah)table.clear(aa)table.foreach(v.getConfigs(),function(ai,aj)table.insert(aa,{DisplayValue=aj.name,
Value=aj.uid})end)ae:SetItems(aa)if ah then ae:SelectItem(ah)end end v.onCreate(ag)v.onSelect(ag)local ah,ai,aj,ak=''af:
Button{Name='Create',Callback=function()af:Invisible()ae:Invisible()ai:Visible()aj:Visible()ak:Visible()end}ai=R:TextBox
{Visible=false,Name='Name your configuration',Callback=function(al)ah=al end}aj=R:Button{Visible=false,Name=
'Complete new configuration',Callback=function()if ah~=''then v.create(ah,nil,false,nil)ag()af:Visible()ae:Visible()ai:
Invisible()aj:Invisible()ak:Invisible()y:Notify{Title=A.Title,Body=`Created "{ah}"`,Duration=3,Image=h.check}ai:SetInput
''else y:Notify{Title='Configuration Error',Body='Name cannot be empty',Duration=3,Image=h.alert,ImageColor=i.get'red'}
end end}ak=R:Button{Visible=false,Name='Cancel',Callback=function()af:Visible()ae:Visible()ai:Invisible()aj:Invisible()
ak:Invisible()ai:SetInput''end}ac=af:Button{Name='Save',DisabledText='Disabled',Callback=function()if ab~=''then v.save(
ab)local al=v.find(ab)y:Notify{Title=A.Title,Body=`Saved configuration "{al.name}"`,Duration=3,Image=h.check}else y:
Notify{Title='Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end
end}ad=af:Button{Name='Delete',DisabledText='Disabled',Callback=function()if ab==''then y:Notify{Title=
'Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end v.
delete(ab)ag()end}end end if q.getgenv then q.getgenv().dariusInstance=y else _G.dariusInstance=y end return y[I.uid]end
return y end)()end,function()local aa,ab,ac=a(2)local ad return(function(...)return setmetatable({},{__index=function(ae
,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no bundle: '..af)end end})end)()end,function()local aa,ab,
ac=a(3)local ad return(function(...)local ae,af=ac(ab.PubTypes),ac(ab.Utility.restrictRead)export type StateObject<T> =
PubTypes.StateObject<T>export type CanBeState<T> =PubTypes.CanBeState<T>export type Symbol=PubTypes.Symbol export type
Value<T> =PubTypes.Value<T>export type Computed<T> =PubTypes.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<
KO,VO>export type ForKeys<KI,KO> =PubTypes.ForKeys<KI,KO>export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export
type Observer=PubTypes.Observer export type Tween<T> =PubTypes.Tween<T>export type Spring<T> =PubTypes.Spring<T>type
Fusion={version:PubTypes.Version,New:(className:string)->((propertyTable:PubTypes.PropertyTable)->Instance),Hydrate:(
target:Instance)->((propertyTable:PubTypes.PropertyTable)->Instance),Ref:PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey
,Children:PubTypes.SpecialKey,Out:PubTypes.SpecialKey,OnEvent:(eventName:string)->PubTypes.SpecialKey,OnChange:(
propertyName:string)->PubTypes.SpecialKey,Value:<T>(initialValue:T)->Value<T>,Computed:<T>(callback:()->T,destructor:((T
)->())?)->Computed<T>,ForPairs:<KI,VI,KO,VO,M>(inputTable:CanBeState<{[KI]:VI}>,processor:(KI,VI)->(KO,VO,M?),destructor
:((KO,VO,M?)->())?)->ForPairs<KO,VO>,ForKeys:<KI,KO,M>(inputTable:CanBeState<{[KI]:any}>,processor:(KI)->(KO,M?),
destructor:((KO,M?)->())?)->ForKeys<KO,any>,ForValues:<VI,VO,M>(inputTable:CanBeState<{[any]:VI}>,processor:(VI)->(VO,M?
),destructor:((VO,M?)->())?)->ForValues<any,VO>,Observer:(watchedState:StateObject<any>)->Observer,Tween:<T>(goalState:
StateObject<T>,tweenInfo:TweenInfo?)->Tween<T>,Spring:<T>(goalState:StateObject<T>,speed:number?,damping:number?)->
Spring<T>,cleanup:(...any)->(),doNothing:(...any)->()}return af('Fusion',{version={major=0,minor=2,isRelease=true},New=
ac(ab.Instances.New),Hydrate=ac(ab.Instances.Hydrate),Ref=ac(ab.Instances.Ref),Out=ac(ab.Instances.Out),Cleanup=ac(ab.
Instances.Cleanup),Children=ac(ab.Instances.Children),OnEvent=ac(ab.Instances.OnEvent),OnChange=ac(ab.Instances.OnChange
),Value=ac(ab.State.Value),Computed=ac(ab.State.Computed),ForPairs=ac(ab.State.ForPairs),ForKeys=ac(ab.State.ForKeys),
ForValues=ac(ab.State.ForValues),Observer=ac(ab.State.Observer),Tween=ac(ab.Animation.Tween),Spring=ac(ab.Animation.
Spring),cleanup=ac(ab.Utility.cleanup),doNothing=ac(ab.Utility.doNothing)})::Fusion end)()end,[5]=function()local aa,ab,
ac=a(5)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=ac(ae.PubTypes),
ac(ae.Types),ac(ae.Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Animation.unpackType),ac(ae.Animation.
SpringScheduler),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(
ae.Utility.xtypeof),ac(ae.State.unwrap),{}local ar,b={__index=aq},{__mode='k'}function aq.get(c,d:boolean?):any if d~=
false then al(c)end return c._currentValue end function aq.setPosition(c,d:PubTypes.Animatable)local e=typeof(d)if e~=c.
_currentType then ah('springTypeMismatch',nil,e,c._currentType)end c._springPositions=aj(d,e)c._currentValue=d ak.add(c)
an(c)end function aq.setVelocity(c,d:PubTypes.Animatable)local e=typeof(d)if e~=c._currentType then ah(
'springTypeMismatch',nil,e,c._currentType)end c._springVelocities=aj(d,e)ak.add(c)end function aq.addVelocity(c,d:
PubTypes.Animatable)local e=typeof(d)if e~=c._currentType then ah('springTypeMismatch',nil,e,c._currentType)end local f=
aj(d,e)for g,h in ipairs(f)do c._springVelocities[g]+=h end ak.add(c)end function aq.update(c):boolean local d=c.
_goalState:get(false)if d==c._goalValue then local e=ap(c._damping)if typeof(e)~='number'then ai('mistypedSpringDamping'
,nil,typeof(e))elseif e<0 then ai('invalidSpringDamping',nil,e)else c._currentDamping=e end local f=ap(c._speed)if
typeof(f)~='number'then ai('mistypedSpringSpeed',nil,typeof(f))elseif f<0 then ai('invalidSpringSpeed',nil,f)else c.
_currentSpeed=f end return false else c._goalValue=d local e,f=c._currentType,typeof(d)c._currentType=f local g=aj(d,f)
local h=#g c._springGoals=g if f~=e then c._currentValue=c._goalValue local i,j=table.create(h,0),table.create(h,0)for k
,l in ipairs(g)do i[k]=l end c._springPositions=i c._springVelocities=j ak.remove(c)return true elseif h==0 then c.
_currentValue=c._goalValue return true else ak.add(c)return false end end end local function c<T>(d:PubTypes.Value<T>,e:
PubTypes.CanBeState<number>?,f:PubTypes.CanBeState<number>?):Types.Spring<T>if e==nil then e=10 end if f==nil then f=1
end local g={[d]=true}if ao(e)=='State'then g[e]=true end if ao(f)=='State'then g[f]=true end local h=setmetatable({type
='State',kind='Spring',dependencySet=g,dependentSet=setmetatable({},b),_speed=e,_damping=f,_goalState=d,_goalValue=nil,
_currentType=nil,_currentValue=nil,_currentSpeed=ap(e),_currentDamping=ap(f),_springPositions=nil,_springGoals=nil,
_springVelocities=nil},ar)am(h)d.dependentSet[h]=true h:update()return h end return c end)()end,[6]=function()local aa,
ab,ac=a(6)local ad return(function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService
'RunService',ab.Parent.Parent local ag,ah,ai,aj=ac(af.Types),ac(af.Animation.packType),ac(af.Animation.
springCoefficients),ac(af.Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local ak,al,am:Set<
Spring>,an={},0.0001,{},os.clock()function ak.add(ao:Spring)ao._lastSchedule=an ao._startDisplacements={}ao.
_startVelocities={}for ap,aq in ipairs(ao._springGoals)do ao._startDisplacements[ap]=ao._springPositions[ap]-aq ao.
_startVelocities[ap]=ao._springVelocities[ap]end am[ao]=true end function ak.remove(ao:Spring)am[ao]=nil end
local function ao()local ap:Set<Spring> ={}an=os.clock()for aq in pairs(am)do local ar,b,c,d=ai(an-aq._lastSchedule,aq.
_currentDamping,aq._currentSpeed)local e,f,g,h,i=aq._springPositions,aq._springVelocities,aq._startDisplacements,aq.
_startVelocities,false for j,k in ipairs(aq._springGoals)do local l,m=g[j],h[j]local n,o=l*ar+m*b,l*c+m*d if math.abs(n)
>al or math.abs(o)>al then i=true end e[j]=n+k f[j]=o end if not i then ap[aq]=true end end for ar in pairs(am)do ar.
_currentValue=ah(ar._springPositions,ar._currentType)aj(ar)end for b in pairs(ap)do am[b]=nil end end ae:
BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.Value,ao)return ak end)()end,[7]=function()local aa
,ab,ac=a(7)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an=ac(ae.PubTypes),ac(ae
.Types),ac(ae.Animation.TweenScheduler),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.
Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Utility.xtypeof),{}local ao,ap={__index=an},{__mode='k'}function
an.get(b,c:boolean?):any if c~=false then ai(b)end return b._currentValue end function an.update(b):boolean local c=b.
_goalState:get(false)if c==b._nextValue and not b._currentlyAnimating then return false end local d=b._tweenInfo if b.
_tweenInfoIsState then d=d:get()end if typeof(d)~='TweenInfo'then al('mistypedTweenInfo',nil,typeof(d))return false end
b._prevValue=b._currentValue b._nextValue=c b._currentTweenStartTime=os.clock()b._currentTweenInfo=d local e=d.DelayTime
+d.Time if d.Reverses then e+=d.Time end e*=d.RepeatCount+1 b._currentTweenDuration=e ah.add(b)return false end
local function b<T>(c:PubTypes.StateObject<PubTypes.Animatable>,d:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local e
=c:get(false)if d==nil then d=TweenInfo.new()end local f,g={[c]=true},am(d)=='State'if g then f[d]=true end local h=d if
g then h=h:get()end if typeof(h)~='TweenInfo'then ak('mistypedTweenInfo',nil,typeof(h))end local i=setmetatable({type=
'State',kind='Tween',dependencySet=f,dependentSet=setmetatable({},ap),_goalState=c,_tweenInfo=d,_tweenInfoIsState=g,
_prevValue=e,_nextValue=e,_currentValue=e,_currentTweenInfo=d,_currentTweenDuration=0,_currentTweenStartTime=0,
_currentlyAnimating=false},ao)aj(i)c.dependentSet[i]=true return i end return b end)()end,[8]=function()local aa,ab,ac=
a(8)local ad return(function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService
'RunService',ab.Parent.Parent local ag,ah,ai,aj,ak=ac(af.Types),ac(af.Animation.lerpType),ac(af.Animation.getTweenRatio)
,ac(af.Dependencies.updateAll),{}type Set<T> ={[T]:any}type Tween=Types.Tween<any>local al,am:Set<Tween> ={__mode='k'},{
}setmetatable(am,al)function ak.add(an:Tween)am[an]=true end function ak.remove(an:Tween)am[an]=nil end local function
an()local ao=os.clock()for ap:Tween in pairs(am::any)do local b=ao-ap._currentTweenStartTime if b>ap.
_currentTweenDuration then if ap._currentTweenInfo.Reverses then ap._currentValue=ap._prevValue else ap._currentValue=ap
._nextValue end ap._currentlyAnimating=false aj(ap)ak.remove(ap)else local c=ai(ap._currentTweenInfo,b)local d=ah(ap.
_prevValue,ap._nextValue,c)ap._currentValue=d ap._currentlyAnimating=true aj(ap)end end end ae:BindToRenderStep(
'__FusionTweenScheduler',Enum.RenderPriority.First.Value,an)return ak end)()end,[9]=function()local aa,ab,ac=a(9)local
ad return(function(...)local ae=cloneref and cloneref(game:GetService'TweenService')or game:GetService'TweenService'
local function af(ag:TweenInfo,ah:number):number local ai,aj,ak,al,am,an=ag.DelayTime,ag.Time,ag.Reverses,1+ag.
RepeatCount,ag.EasingStyle,ag.EasingDirection local ao=ai+aj if ak then ao+=aj end if ah>=ao*al then return 1 end local
ap=ah%ao if ap<=ai then return 0 end local b=(ap-ai)/aj if b>1 then b=2-b end local c=ae:GetValue(b,am,an)return c end
return af end)()end,[10]=function()local aa,ab,ac=a(10)local ad return(function(...)local ae=ab.Parent.Parent local af,
ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah(ai:any,aj:any,ak:number):any local al=typeof(ai)if typeof(aj)==
al then if al=='number'then local am,an=aj::number,ai::number return(am-an)*ak+an elseif al=='CFrame'then local am,an=aj
::CFrame,ai::CFrame return an:Lerp(am,ak)elseif al=='Color3'then local am,an=aj::Color3,ai::Color3 local ao,ap=ag.to(an)
,ag.to(am)return ag.from(ao:Lerp(ap,ak),false)elseif al=='ColorSequenceKeypoint'then local am,an=aj::
ColorSequenceKeypoint,ai::ColorSequenceKeypoint local ao,ap=ag.to(an.Value),ag.to(am.Value)return ColorSequenceKeypoint.
new((am.Time-an.Time)*ak+an.Time,ag.from(ao:Lerp(ap,ak),false))elseif al=='DateTime'then local am,an=aj::DateTime,ai::
DateTime return DateTime.fromUnixTimestampMillis((am.UnixTimestampMillis-an.UnixTimestampMillis)*ak+an.
UnixTimestampMillis)elseif al=='NumberRange'then local am,an=aj::NumberRange,ai::NumberRange return NumberRange.new((am.
Min-an.Min)*ak+an.Min,(am.Max-an.Max)*ak+an.Max)elseif al=='NumberSequenceKeypoint'then local am,an=aj::
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
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[34]=function()local aa,
ab,ac=a(34)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)
local function ah(ai:string,aj:Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=
ag[ai]end local al if aj==nil then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub(
'ERROR_MESSAGE',aj.message)al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)
end error(al:gsub('\n','\n    '),0)end return ah end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(
...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)local function ah(ai:string,aj:Types.Error
?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=ag[ai]end local al if aj==nil then al=
string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub('ERROR_MESSAGE',aj.message)al=string.format(
'[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)end task.spawn(function(...)error(al:gsub(
'\n','\n    '),0)end,...)end return ah end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local
ae=ab.Parent.Parent local af=ac(ae.Logging.messages)local function ag(ah,...)local ai:string if af[ah]~=nil then ai=af[
ah]else ah='unknownMessage'ai=af[ah]end warn(string.format('[Fusion] '..ai..'\n(ID: '..ah..')',...))end return ag end)()
end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{cannotAssignProperty=
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
return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Types)local function ag(ah:string):Types.Error return{type=
'Error',raw=ah,message=ah:gsub('^.+:%d+:%s*',''),trace=debug.traceback(nil,2)}end return ag end)()end,[39]=function()
local aa,ab,ac=a(39)local ad return(function(...)type Set<T> ={[T]:any}export type Symbol={type:string,name:string}
export type Animatable=number|CFrame|Color3|ColorSequenceKeypoint|DateTime|NumberRange|NumberSequenceKeypoint|
PhysicalProperties|Ray|Rect|Region3|Region3int16|UDim|UDim2|Vector2|Vector2int16|Vector3|Vector3int16 export type Task=
Instance|RBXScriptConnection|(()->())|{destroy:(any)->()}|{Destroy:(any)->()}|{Task}export type Version={major:number,
minor:number,isRelease:boolean}export type Dependency={dependentSet:Set<Dependent>}export type Dependent={update:(
Dependent)->boolean,dependencySet:Set<Dependency>}export type StateObject<T> =Dependency&{type:string,kind:string,get:(
StateObject<T>,asDependency:boolean?)->T}export type CanBeState<T> =StateObject<T>|T export type Value<T> =StateObject<T
>&{set:(Value<T>,newValue:any,force:boolean?)->()}export type Computed<T> =StateObject<T>&Dependent&{}export type
ForPairs<KO,VO> =StateObject<{[KO]:VO}>&Dependent&{}export type ForKeys<KO,V> =StateObject<{[KO]:V}>&Dependent&{}export
type ForValues<K,VO> =StateObject<{[K]:VO}>&Dependent&{}export type Tween<T> =StateObject<T>&Dependent&{}export type
Spring<T> =StateObject<T>&Dependent&{}export type Observer=Dependent&{onChange:(Observer,callback:()->())->(()->())}
export type SpecialKey={type:string,kind:string,stage:string,apply:(SpecialKey,value:any,applyTo:Instance,cleanupTasks:{
Task})->()}export type Children=Instance|StateObject<Children>|{[any]:Children}export type PropertyTable={[string|
SpecialKey]:any}return nil end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)local ae=ab.Parent.
Parent local af,ag,ah,ai,aj,ak,al,am,an=ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.
initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.
isSimilar),ac(ae.Utility.needsDestruction),{}local ao,ap={__index=an},{__mode='k'}function an.get(b,c:boolean?):any if c
~=false then ai(b)end return b._value end function an.update(b):boolean for c in pairs(b.dependencySet)do c.dependentSet
[b]=nil end b._oldDependencySet,b.dependencySet=b.dependencySet,b._oldDependencySet table.clear(b.dependencySet)local d,
m,n=ag(b.dependencySet,b._processor)if d then if b._destructor==nil and am(m)then ak'destructorNeededComputed'end if n~=
nil then ak'multiReturnComputed'end local o=b._value local p=al(o,m)if b._destructor~=nil then b._destructor(o)end b.
_value=m for q in pairs(b.dependencySet)do q.dependentSet[b]=true end return not p else aj('computedCallbackError',m)b.
_oldDependencySet,b.dependencySet=b.dependencySet,b._oldDependencySet for o in pairs(b.dependencySet)do o.dependentSet[b
]=true end return false end end local function b<T>(c:()->T,d:((T)->())?):Types.Computed<T>local m=setmetatable({type=
'State',kind='Computed',dependencySet={},dependentSet=setmetatable({},ap),_oldDependencySet={},_processor=c,_destructor=
d,_value=nil},ao)ah(m)m:update()return m end return b end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,b=ac(ae.PubTypes),ac(ae.Types),ac(ae.
Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.
parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.
Utility.needsDestruction),{}local c,d={__index=b},{__mode='k'}function b.get(m,n:boolean?):any if n~=false then aj(m)end
return m._outputTable end function b.update(m):boolean local n=m._inputIsState local o,p,q,r,s,t,u=if n then m.
_inputTable:get(false)else m._inputTable,m._oldInputTable,m._outputTable,m._keyOIMap,m._keyIOMap,m._meta,false for v in
pairs(m.dependencySet)do v.dependentSet[m]=nil end m._oldDependencySet,m.dependencySet=m.dependencySet,m.
_oldDependencySet table.clear(m.dependencySet)if n then m._inputTable.dependentSet[m]=true m.dependencySet[m._inputTable
]=true end for w,x in pairs(o)do local y=m._keyData[w]if y==nil then y={dependencySet=setmetatable({},d),
oldDependencySet=setmetatable({},d),dependencyValues=setmetatable({},d)}m._keyData[w]=y end local z=p[w]==nil if z==
false then for A,B in pairs(y.dependencyValues)do if B~=A:get(false)then z=true break end end end if z then y.
oldDependencySet,y.dependencySet=y.dependencySet,y.oldDependencySet table.clear(y.dependencySet)local A,B,C=ah(y.
dependencySet,m._processor,w)if A then if m._destructor==nil and(ap(B)or ap(C))then an'destructorNeededForKeys'end local
D,E=r[B],s[w]if D~=w and o[D]~=nil then am('forKeysKeyCollision',nil,tostring(B),tostring(D),tostring(B))end if E~=B and
r[E]==w then local F=t[E]local G,H=xpcall(m._destructor or ao,ak,E,F)if not G then al('forKeysDestructorError',H)end r[E
]=nil q[E]=nil t[E]=nil end p[w]=x t[B]=C r[B]=w s[w]=B q[B]=x u=true else y.oldDependencySet,y.dependencySet=y.
dependencySet,y.oldDependencySet al('forKeysProcessorError',B)end end for A in pairs(y.dependencySet)do y.
dependencyValues[A]=A:get(false)m.dependencySet[A]=true A.dependentSet[m]=true end end for y,z in pairs(r)do if o[z]==
nil then local A=t[y]local B,C=xpcall(m._destructor or ao,ak,y,A)if not B then al('forKeysDestructorError',C)end p[z]=
nil t[y]=nil r[y]=nil s[z]=nil q[y]=nil m._keyData[z]=nil u=true end end return u end local function m<KI,KO,M>(n:
PubTypes.CanBeState<{[KI]:any}>,o:(KI)->(KO,M?),p:((KO,M?)->())?):Types.ForKeys<KI,KO,M>local q=n.type=='State'and
typeof(n.get)=='function'local r=setmetatable({type='State',kind='ForKeys',dependencySet={},dependentSet=setmetatable({}
,d),_oldDependencySet={},_processor=o,_destructor=p,_inputIsState=q,_inputTable=n,_oldInputTable={},_outputTable={},
_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},c)ai(r)r:update()return r end return m end)()end,[43]=function()local aa
,ab,ac=a(43)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,b=ac(ae.
PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.
useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),
ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local c,d={__index=b},{__mode='k'}function b.get(m,n:boolean?):
any if n~=false then aj(m)end return m._outputTable end function b.update(m):boolean local n=m._inputIsState local o,p,q
,r,s=if n then m._inputTable:get(false)else m._inputTable,m._oldInputTable,m._keyIOMap,m._meta,false for t in pairs(m.
dependencySet)do t.dependentSet[m]=nil end m._oldDependencySet,m.dependencySet=m.dependencySet,m._oldDependencySet table
.clear(m.dependencySet)if n then m._inputTable.dependentSet[m]=true m.dependencySet[m._inputTable]=true end m.
_oldOutputTable,m._outputTable=m._outputTable,m._oldOutputTable local u,v=m._oldOutputTable,m._outputTable table.clear(v
)for w,x in pairs(o)do local y=m._keyData[w]if y==nil then y={dependencySet=setmetatable({},d),oldDependencySet=
setmetatable({},d),dependencyValues=setmetatable({},d)}m._keyData[w]=y end local z=p[w]~=x if z==false then for A,B in
pairs(y.dependencyValues)do if B~=A:get(false)then z=true break end end end if z then y.oldDependencySet,y.dependencySet
=y.dependencySet,y.oldDependencySet table.clear(y.dependencySet)local A,B,C,D=ah(y.dependencySet,m._processor,w,x)if A
then if m._destructor==nil and(ap(B)or ap(C)or ap(D))then an'destructorNeededForPairs'end if v[B]~=nil then local E,F
for G,H in pairs(q)do if H==B then F=o[G]if F~=nil then E=G break end end end if E~=nil then am('forPairsKeyCollision',
nil,tostring(B),tostring(E),tostring(F),tostring(w),tostring(x))end end local E=u[B]if E~=C then local F=r[B]if E~=nil
then local G,H=xpcall(m._destructor or ao,ak,B,E,F)if not G then al('forPairsDestructorError',H)end end u[B]=nil end p[w
]=x q[w]=B r[B]=D v[B]=C s=true else y.oldDependencySet,y.dependencySet=y.dependencySet,y.oldDependencySet al(
'forPairsProcessorError',B)end else local A=q[w]if v[A]~=nil then local B,C for D,E in pairs(q)do if A==E then C=o[D]if
C~=nil then B=D break end end end if B~=nil then am('forPairsKeyCollision',nil,tostring(A),tostring(B),tostring(C),
tostring(w),tostring(x))end end v[A]=u[A]end for A in pairs(y.dependencySet)do y.dependencyValues[A]=A:get(false)m.
dependencySet[A]=true A.dependentSet[m]=true end end for y,z in pairs(u)do if v[y]~=z then local A=r[y]if z~=nil then
local B,C=xpcall(m._destructor or ao,ak,y,z,A)if not B then al('forPairsDestructorError',C)end end if v[y]==nil then r[y
]=nil m._keyData[y]=nil end s=true end end for A in pairs(p)do if o[A]==nil then p[A]=nil q[A]=nil end end return s end
local function m<KI,VI,KO,VO,M>(n:PubTypes.CanBeState<{[KI]:VI}>,o:(KI,VI)->(KO,VO,M?),p:((KO,VO,M?)->())?):Types.
ForPairs<KI,VI,KO,VO,M>local q=n.type=='State'and typeof(n.get)=='function'local r=setmetatable({type='State',kind=
'ForPairs',dependencySet={},dependentSet=setmetatable({},d),_oldDependencySet={},_processor=o,_destructor=p,
_inputIsState=q,_inputTable=n,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},c)
ai(r)r:update()return r end return m end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(...)local ae=
ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.
captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(
ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local b,c={
__index=ap},{__mode='k'}function ap.get(d,m:boolean?):any if m~=false then aj(d)end return d._outputTable end function
ap.update(d):boolean local m=d._inputIsState local n,o,p=if m then d._inputTable:get(false)else d._inputTable,{},false d
._oldValueCache,d._valueCache=d._valueCache,d._oldValueCache local q,r=d._valueCache,d._oldValueCache table.clear(q)for
s in pairs(d.dependencySet)do s.dependentSet[d]=nil end d._oldDependencySet,d.dependencySet=d.dependencySet,d.
_oldDependencySet table.clear(d.dependencySet)if m then d._inputTable.dependentSet[d]=true d.dependencySet[d._inputTable
]=true end for t,u in pairs(n)do local v=r[u]local w,x,y,z=(v==nil)if type(v)=='table'and#v>0 then local A=table.remove(
v,#v)x=A.value y=A.valueData z=A.meta if#v<=0 then r[u]=nil end elseif v~=nil then r[u]=nil w=true end if y==nil then y=
{dependencySet=setmetatable({},c),oldDependencySet=setmetatable({},c),dependencyValues=setmetatable({},c)}end if w==
false then for A,B in pairs(y.dependencyValues)do if B~=A:get(false)then w=true break end end end if w then y.
oldDependencySet,y.dependencySet=y.dependencySet,y.oldDependencySet table.clear(y.dependencySet)local A,B,C=ah(y.
dependencySet,d._processor,u)if A then if d._destructor==nil and(ao(B)or ao(C))then am'destructorNeededForValues'end if
x~=nil then local D,E=xpcall(d._destructor or an,ak,x,z)if not D then al('forValuesDestructorError',E)end end x=B z=C p=
true else y.oldDependencySet,y.dependencySet=y.dependencySet,y.oldDependencySet al('forValuesProcessorError',B)end end
local A=q[u]if A==nil then A={}q[u]=A end table.insert(A,{value=x,valueData=y,meta=z})o[t]=x for B in pairs(y.
dependencySet)do y.dependencyValues[B]=B:get(false)d.dependencySet[B]=true B.dependentSet[d]=true end end for v,w in
pairs(r)do for x,y in ipairs(w)do local z,A=y.value,y.meta local B,C=xpcall(d._destructor or an,ak,z,A)if not B then al(
'forValuesDestructorError',C)end p=true end table.clear(w)end d._outputTable=o return p end local function d<VI,VO,M>(m:
PubTypes.CanBeState<{[any]:VI}>,n:(VI)->(VO,M?),o:((VO,M?)->())?):Types.ForValues<VI,VO,M>local p=m.type=='State'and
typeof(m.get)=='function'local q=setmetatable({type='State',kind='ForValues',dependencySet={},dependentSet=setmetatable(
{},c),_oldDependencySet={},_processor=n,_destructor=o,_inputIsState=p,_inputTable=m,_outputTable={},_valueCache={},
_oldValueCache={}},b)ai(q)q:update()return q end return d end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.initDependency)
type Set<T> ={[T]:any}local ai={}local aj,ak:Set<Types.Observer> ={__index=ai},{}function ai.update(al):boolean for am,
an in pairs(al._changeListeners)do task.spawn(an)end return false end function ai.onChange(al,am:()->()):()->()local an=
{}al._numChangeListeners+=1 al._changeListeners[an]=am ak[al]=true local ao=false return function()if ao then return end
ao=true al._changeListeners[an]=nil al._numChangeListeners-=1 if al._numChangeListeners==0 then ak[al]=nil end end end
local function al(am:PubTypes.Value<any>):Types.Observer local an=setmetatable({type='State',kind='Observer',
dependencySet={[am]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},aj)ah(an)am.dependentSet[an]=true
return an end return al end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae=ab.Parent.
Parent local af,ag,ah,ai,aj,ak=ac(ae.Types),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.updateAll),ac(ae.Utility.isSimilar),{}local al,am={__index=ak},{__mode='k'}function ak.get(an,ao:boolean?):
any if ao~=false then ag(an)end return an._value end function ak.set(an,ao:any,ap:boolean?)local b=an._value if ap or
not aj(b,ao)then an._value=ao ai(an)end end local function an<T>(ao:T):Types.State<T>local ap=setmetatable({type='State'
,kind='Value',dependentSet=setmetatable({},am),_value=ao},al)ah(ap)return ap end return an end)()end,[47]=function()
local aa,ab,ac=a(47)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Utility.
xtypeof)local function ah<T>(ai:PubTypes.CanBeState<T>,aj:boolean?):T return if ag(ai)=='State'then(ai::PubTypes.
StateObject<T>):get(aj)else(ai::T)end return ah end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(
...)local ae=ab.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}export type None=PubTypes.Symbol&{}export type
Error={type:string,raw:string,message:string,trace:string}export type State<T> =PubTypes.Value<T>&{_value:T}export type
Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,_value:T}export type
ForPairs<KI,VI,KO,VO,M> =PubTypes.ForPairs<KO,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI,VI)->(KO,VO
),_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:VI}>,_oldInputTable:{[KI]:VI},
_outputTable:{[KO]:VO},_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<
PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export
type ForKeys<KI,KO,M> =PubTypes.ForKeys<KO,any>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI)->(KO),
_destructor:(KO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:KO}>,_oldInputTable:{[KI]:KO},
_outputTable:{[KO]:any},_keyOIMap:{[KO]:KI},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,
oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForValues<VI,VO,M>
=PubTypes.ForValues<any,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(VI)->(VO),_destructor:(VO,M?)->(),
_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[VI]:VO}>,_outputTable:{[any]:VI},_valueCache:{[VO]:any},
_oldValueCache:{[VO]:any},_meta:{[VO]:M?},_valueData:{[VI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<
PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type Tween<T> =PubTypes.Tween<T>&{_goalState:
State<T>,_tweenInfo:TweenInfo,_prevValue:T,_nextValue:T,_currentValue:T,_currentTweenInfo:TweenInfo,
_currentTweenDuration:number,_currentTweenStartTime:number,_currentlyAnimating:boolean}export type Spring<T> =PubTypes.
Spring<T>&{_speed:PubTypes.CanBeState<number>,_speedIsState:boolean,_lastSpeed:number,_damping:PubTypes.CanBeState<
number>,_dampingIsState:boolean,_lastDamping:number,_goalState:State<T>,_goalValue:T,_currentType:string,_currentValue:T
,_springPositions:{number},_springGoals:{number},_springVelocities:{number}}export type Observer=PubTypes.Observer&{
_changeListeners:Set<()->()>,_numChangeListeners:number}return nil end)()end,[50]=function()local aa,ab,ac=a(50)local ad
return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Types)return{type='Symbol',name='None'}::Types.None end)()
end,[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local function ae(af:any)local ag=typeof(af)if ag==
'Instance'then af:Destroy()elseif ag=='RBXScriptConnection'then af:Disconnect()elseif ag=='function'then af()elseif ag==
'table'then if typeof(af.destroy)=='function'then af:destroy()elseif typeof(af.Destroy)=='function'then af:Destroy()
elseif af[1]~=nil then for ah,ai in ipairs(af)do ae(ai)end end end end local function af(...:any)for ag=1,select('#',...
)do ae(select(ag,...))end end return af end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)
local function ae(...:any)end return ae end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)
local function ae(af:any,ag:any):boolean if typeof(af)=='table'then return false else return af==ag end end return ae
end)()end,[54]=function()local aa,ab,ac=a(54)local ad return(function(...)local function ae(af:any):boolean return
typeof(af)=='Instance'end return ae end)()end,[55]=function()local aa,ab,ac=a(55)local ad return(function(...)local ae=
ab.Parent.Parent local af=ac(ae.Logging.logError)type table={[any]:any}local function ag(ah:string,ai:table):table local
aj=getmetatable(ai::any)if aj==nil then aj={}setmetatable(ai,aj)end function aj.__index(ak,al)af('strictReadError',nil,
tostring(al),ah)end return ai end return ag end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)
local function ae(af:any)local ag=typeof(af)if ag=='table'and typeof(af.type)=='string'then return af.type else return
ag end end return ae end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(function(...)local ae,af=ac(ab.Parent.
Parent.utilities.randomString),ac(ab.Parent)local ag=af.Fusion local ah,ai,aj=ag.Value,{},{}type uid=string type tag=
string function aj.update(ak:string,al:string,am:string)if al~='uid'and aj.find(ak)and aj.find(ak)[al]then local an=aj.
find(ak)an[al]:set(am)elseif not aj.find(ak)then error("couldn't find uid: "..ak)elseif al=='uid'or al=='__tag'then
error('cannot edit property '..al)elseif not aj.find(ak)[al]then else error'how?'end end function aj.find(ak:uid|tag):
table local al for am=1,#ai do if ai[am].uid==ak or ai[am].__tag==ak then al=ai[am]end end if not al then warn(
'no data found by identifier: '..tostring(ak))return al end return al end function aj.delete(ak:string)local al=aj.find(
ak)local am,an=table.find(ai,al),{}for ao=1,#ai do if ao~=am then table.insert(an,ai[ao])end end ai=an an=nil end
function aj.add(ak:table,al:string,am:boolean):table am=am or false if not am then for an,ao in ak do ak[an]=ah(ao)end
end ak.__tag=al or nil ak.uid=ae(16)setmetatable(ak,{__index={update=function(an,ao,ap)aj.update(an.uid,ao,ap)end,delete
=function()aj.delete(ak.uid)end}})table.insert(ai,ak)return aj.find(ak.uid)end return aj end)()end,[58]=function()local
aa,ab,ac=a(58)local ad return(function(...)local ae,af,ag=ac(ab.Parent).data,ac(ab.Parent.Parent.utilities).get,ac(ab.
Parent).services local ah,ai=ag.HttpService,ac(ab.Parent).Fusion local aj,ak,al=ai.Observer,ai.Value,ac(ab.Parent.Parent
.utilities)local am,an,ao,ap,b,c,d,m,n,o,p=al.connections,al.customFunctions,al.randomString,{},ae.add({list={}},'flags'
),{},{},{},{},{},{}ap.currentConfig={}ap.writeFiles=false ap.path=''local q,r={toggle=function(q)local r=q.status.
boolean am.add(aj(r):onChange(function()local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))end,dropdown=function(q)
local r=q.status.multiselect and q.status.items or q.status.item am.add(aj(r):onChange(function()local s=af(r)q.user.
Value=s q.bindableEvent:Fire(s)end))end,keybind=function(q)local r=q.status.mobile and q.status.coordinate or q.status.
keycode am.add(aj(r):onChange(function()local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))end,slider=function(q)
local r=q.status.percentageOf am.add(aj(r):onChange(function()local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))
end,textbox=function(q)local r=q.status.correctText am.add(aj(r):onChange(function()local s=af(r)q.user.Value=s q.
bindableEvent:Fire(s)end))end,colorpicker=function(q)local r,s=q.status.color,q.status.transparency am.add(aj(r):
onChange(function()q.user.Value={af(r),af(s)}q.bindableEvent:Fire(unpack(q.user.Value))end))am.add(aj(s):onChange(
function()q.user.Value={af(r),af(s)}q.bindableEvent:Fire(unpack(q.user.Value))end))end},{toggle=function(q)local r={}if
q.boolean then r.boolean=af(q.boolean)end if q.keycode then r.keycode=af(q.keycode)end if af(q.coordinate)then r.
coordinate={X=af(q.coordinate).X,Y=af(q.coordinate).Y}end return r end,dropdown=function(q)return q.multiselect and{
unpack(af(q.items))}or af(q.item)end,keybind=function(q)local r={}if q.keycode then r.keycode=af(q.keycode)end if af(q.
coordinate)then r.coordinate={X=af(q.coordinate).X,Y=af(q.coordinate).Y}end return r end,slider=function(q)return af(q.
percentageOf)end,textbox=function(q)return af(q.correctText)end,colorpicker=function(q)return{color=af(q.color):ToHex(),
transparency=af(q.transparency)}end}function ap.preregister(s,t)local u,v=ai.New'BindableEvent'{},{}function v.Connect(w
,x)assert(typeof(x)=='function','Connect only takes functions')am.add(u.Event:Connect(x))end local w,x=(ai.New
'BindableEvent'{})x={name=s,status={},type='unknown',preregistered=true,bindableEvent=u,file=w.Event,fileEvent=w,
preregisteredValue=t,user={Value=nil,OnChange=setmetatable(v,{__newindex=function(y,z,A)return nil end})}}d[s]=x local y
=af(b.list)y[x.name]=x b:update('list',y)return x end function ap.register(s,t,u,v)assert(not table.find(c,s),
'Flags must all be unique!')table.insert(c,s)local w,x=ai.New'BindableEvent'{},{}function x.Connect(y,z)assert(typeof(z)
=='function','Connect')am.add(w.Event:Connect(z))end local y if not d[s]then local z=(ai.New'BindableEvent'{})y={name=s,
status=t,type=u,private=v,preregistered=false,bindableEvent=w,file=z.Event,fileEvent=z,user={Value=nil,OnChange=
setmetatable(x,{__newindex=function()return nil end})}}q[y.type](y)local A=af(b.list)A[y.name]=y b:update('list',A)else
y=d[s]y.type=u y.status=t y.private=v q[y.type](y)d[y.name]=nil end return y end function ap.find(s)for t,u in o do if u
.uid==s then return u,t end end return false end function ap.create(s,t,u,v,w,x)u=u or false w=w or false x=x or false
if t=='original'and u then return end if w and u then table.insert(p,t)end if w and not u then for y,z in p do local A=
ap.find(z)if A and A.name==s then return z end end end t=t or ao(5)local y={}y.name=s y.fromSet=w y.lock=x y.uid=t y.
flagValues={}if v~=nil then y.flagValues=v else for z,A in af(b.list)do if A.private then continue end if A.type==
'unknown'then continue end y.flagValues[A.name]=r[A.type](A.status)end end table.insert(o,y)if ap.writeFiles then an.
writefile(`{ap.path}/{y.uid}.json`,ah:JSONEncode(y))end task.spawn(function()for z,A in m do task.spawn(A)end end)return
t end function ap.init()if ap.writeFiles then for s,t in an.listfiles(ap.path)do local u=ah:JSONDecode(an.readfile(t))ap
.create(u.name,u.uid,true,u.flagValues,u.fromSet,u.lock)end end end function load(s)for t,u in s.flagValues do local v=
af(b.list)[t]if not v then continue end v.fileEvent:Fire(u)end end function ap.set(s)if not s then ap.currentConfig={}
return end local t=ap.find(s)if not t then return end ap.currentConfig=t load(t)task.spawn(function()for u,v in m do
task.spawn(v,s)end end)end function ap.save(s)local t=ap.find(s)for u,v in af(b.list)do if v.private then continue end
if v.type=='unknown'then continue end t.flagValues[v.name]=r[v.type](v.status)end if ap.writeFiles then an.writefile(`{
ap.path}/{t.uid}.json`,ah:JSONEncode(t))end end function ap.delete(s)local t,u=ap.find(s)if t then if ap.writeFiles then
if an.isfile(`{ap.path}/{t.uid}.json`)then an.delfile(`{ap.path}/{t.uid}.json`)table.remove(o,u)end end table.remove(o,u
)end ap.set(nil)end function ap.export()return ah:JSONEncode(ap.currentConfig)end function ap.getConfigs()return o end
function ap.getConfig()return ap.currentConfig end function ap.onCreate(s)table.insert(m,s)end function ap.onSelect(s)
table.insert(n,s)end return ap end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)return{lock=
'rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize='rbxassetid://15556637715',close=
'rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown=
'rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command=
'rbxassetid://10723416765',input='rbxassetid://10734982297',search='rbxassetid://10734943674',finger=
'rbxassetid://10734929723',alert='rbxassetid://10709752996',paint='rbxassetid://10734910187',cog=
'rbxassetid://10709810948'}end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local ae=ac(ab.
Parent.Parent.utilities)local af,ag,ah=(ae.customFunctions)if af.getthreadidentity()<5 then ah=af.getthreadidentity()af.
setthreadidentity(5)end ag=loadstring(game:GetObjects'rbxassetid://85554466048193'[1].Source)()af.setthreadidentity(ah)
return ag end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae=ac(ab.Parent.Parent.
utilities.customFunctions)local af,ag=ae.cloneref,{}ag=setmetatable(ag,{__index=function(ah,ai)return af(game:
GetService(ai))end})return ag end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(function(...)local ae,af={},
ac(ab.Parent.services)local ag,ah=af.HttpService,ac(ab.Parent)local ai,aj=ah.Fusion,ac(ab.default)local ak,al,am,an,ao,
ap,b,c,d=ai.Value,ai.Observer,ac(ab.Parent.Parent.utilities.get),ac(ab.Parent.Parent.utilities.animate),warn,ac(ab.
Parent.Parent.utilities.randomString),ac(ab.Parent.Parent.utilities.customFunctions),{},{}local m,n,o=ak{},ak{},''al(m):
onChange(function()task.wait()for p,q in ipairs(c)do task.spawn(q)end end)local p,q,r={},{},{}table.foreach(aj,function(
s)table.insert(r,s)end)ae.path=''function ae.find(s)for t,u in p do if u.uid==s then return true,u end end return false
end function ae.create(s,t,u,v,w)v=v or false if u=='original'and v then return end for x,y in r do if t[y]==nil then t[
y]=aj[y]end if typeof(t[y])~='Color3'then ao(y.." isn't type Color3")end end for z,A in t do if not table.find(r,z)then
ao('Incorrect value removed "'..tostring(z)..'"')t[z]=nil end end if w and v then table.insert(q,u)end if w and not v
then for B,C in q do local D={ae.find(C)}if D[1]and D[2].name==s then return C end end end u=u or ap(5)table.insert(p,{
name=s,uid=u,fromSet=w or false,palette=t})local B={}B.name=s B.uid=u B.fromSet=w B.palette={}for C,D in t do B.palette[
C]=D:ToHex()end b.writefile(`{ae.path}/{u}.json`,ag:JSONEncode(B))task.spawn(function()for E,F in d do task.spawn(F)end
end)return u end function ae.delete(s)local t={ae.find(s)}if not t[1]then return false,'no theme found'end local u=table
.find(p,t[2])ae.set(o)table.remove(p,u)b.delfile(`{ae.path}/{t[2].uid}.json`)end function ae.edit(s,t)local u=am(m)u[s]=
t m:set(u)end function ae.editTheme(s:string,t:string,u:any)local v={ae.find(s)}if not v[1]then return false end local w
=v[2]w[t]=u local A={}A.name=w.name A.uid=s A.fromSet=w.fromSet A.palette={}for B,C in w.palette do A.palette[B]=C:
ToHex()end b.writefile(`{ae.path}/{s}.json`,ag:JSONEncode(A))return true end function ae.set(s)local t,u,v={ae.find(s)}
if t[1]then u,v=t[2],t[2].palette else return false,'no theme found'end local w={}table.foreach(v,function(A,B)w[A]=B
end)m:set(w)n:set(u)return true,'successfully set new theme'end function ae.export()local s,t=am(n),{}t.name=s.name t.
uid=s.uid t.fromSet=s.fromSet t.palette={}for u,v in s.palette do t.palette[u]=v:ToHex()end return ag:JSONEncode(t)end
function ae.save(s)local t={ae.find(s)}if t[1]then local u,v=t[2],{}v.name=u.name v.uid=u.uid v.fromSet=u.fromSet v.
palette={}for w,A in u.palette do v.palette[w]=A:ToHex()end u.palette=am(m)b.writefile(`{ae.path}/{s}.json`,ag:
JSONEncode(v))ae.set(s)return true else return false end end function ae.get(s)local t=am(m)if t[s]then return t[s]else
error(s.." isn't a theme element")end end for s,t in r do ae[t]=an(function()return am(m)[t]end,40,1)end function ae.
init()o=ae.create('darius',aj,'original')ae.set(o)for u,v in b.listfiles(ae.path)do local w=ag:JSONDecode(b.readfile(v))
table.foreach(w.palette,function(A,B)local C=Color3.fromHex(`#{B}`)w.palette[A]=C end)ae.create(w.name,w.palette,w.uid,
true,w.fromSet)end end function ae.onChange(u)table.insert(c,u)end function ae.onCreate(u)table.insert(d,u)end function
ae.getTheme()return am(n)end function ae.getThemes()return p end function ae.getColors()return am(m)end return ae end)()
end,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)return{background=Color3.fromHex'#2C2F33',
background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.
fromHex'#1A1A1B',scrollBar=Color3.fromHex'#DCE1E5',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.
fromHex'#222427',mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',
mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex
'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[65]=
function()local aa,ab,ac=a(65)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,b,c=ak.New,ak.Children,ak.Value
,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local d,m,n,o,p=c.get,c.animate,c.typecheck,c.customFont,ac(ae.
simpleElements)local q,r,s,t=p.UIPadding,p.UICorner,n(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback
=function()end},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible'})
assert(s,table.concat(t,'\n'))local u,v,w,A,B,C,D,E,F=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.
Name,af.Visible or an(true),af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.Callback local G=an(d(
u.string)==d(w.tab).uid)ao(u.string):onChange(function()G:set(d(u.string)==d(w.tab).uid)end)local H=m(function()return
d(G)and 0 or 1 end,40,1)al'TextButton'{Interactable=b(function()if not d(D)then return false end return d(G)end),Visible
=b(function()if d(v.string)~=''and not string.find(d(B):lower(),d(v.string):lower())or not d(C)then return false end
return true end),Parent=A,Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=H,[ap
'Activated']=function()if not d(D)then return end task.spawn(d(F))end,[am]={r(6),al'Frame'{ZIndex=2,Visible=b(function()
if not d(D)then return true end return false end),BackgroundTransparency=m(function()return d(G)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={r(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=H},al'TextLabel'{FontFace=o('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=H,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=E,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={q(0,5)}}}},al'Frame'{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={q(0,8),al'TextLabel'{FontFace=o('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=B,TextTransparency=H,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=ai.text2,ImageTransparency=H}}}}}local I={}function I.SetName(
J,K)local L,M=n({SetName=K},{SetName=''})assert(L,table.concat(M,'\n'))B:set(K)end function I.SetCallback(J,K)local L,M=
n({SetCallback=K},{SetCallback=function()end})assert(L,table.concat(M,'\n'))F:set(K)end function I.Fire(J)task.spawn(d(F
))end function I.Enable(J)D:set(true)end function I.Disable(J)D:set(false)end function I.Visible(J)C:set(true)end
function I.Invisible(J)C:set(false)end return I end end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,b,c=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,
ac(ae.utilities)local d,m,n,o,p=c.get,c.animate,c.typecheck,c.customFont,ac(ae.simpleElements)local q,r,s,t,u,v,w,A,B,C,
D=p.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,p.UIPadding,p.
UICorner,af.Parent,af.tab,an(0),an(true)local E=al'Frame'{Visible=D,Parent=A,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[am]={q(r.LayoutOrder,s.Horizontal,t.Left,u.Center,UDim.new(0,3))}}local F,G=an(E.AbsoluteSize)
,{}function G.Button(H,I)local J,K=n(I,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{I
.IsEnabled and''or'IsEnabled',I.Visible and''or'Visible',I.DisabledText and''or'DisabledText'})assert(J,table.concat(K,
'\n'))local L,M,N,O,P,Q,R,S=ah.find'selectedTab',ah.find'searchText',ah.add(I),I.Name,I.Callback,I.IsEnabled or an(true)
,I.DisabledText or an'Component Disabled',I.Visible or an(true)local T=an(d(L.string)==d(B).uid)ao(L.string):onChange(
function()T:set(d(L.string)==d(B).uid)end)local U=m(function()return d(T)and 0 or 1 end,40,1)al'TextButton'{Interactable
=b(function()if not d(Q)then return false end return d(T)end),Visible=b(function()if d(M.string)~=''and not string.find(
d(O):lower(),d(M.string):lower())or not d(S)then return false end return true end),Size=b(function()return UDim2.new(1/
d(C)-(d(C)-1==0 and 0 or((((d(C)-1)*3)/d(C))/d(F).X)),0,0,36)end),Parent=E,BackgroundColor3=ai.background2,
BackgroundTransparency=U,[ap'Activated']=function()if not d(Q)then return end task.spawn(d(P))end,[am]={w(6),al'Frame'{
ZIndex=2,Visible=b(function()if not d(Q)then return true end return false end),BackgroundTransparency=m(function()return
d(T)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={w(6),al'ImageLabel'{
Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image
=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=U},al'TextLabel'{FontFace=o('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=U,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=R,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[am]={v(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={v(0,8),al'TextLabel'{FontFace=
o('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=O,TextTransparency=U,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(16,16),AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=ai.text2,ImageTransparency=m(function()
return d(T)and 0.5 or 1 end,40,1)}}}}}if d(S)then C:set(d(C)+1)end ao(S):onChange(function()if d(S)then C:set(d(C)+1)
else C:set(d(C)-1)end end)local V={}function V.SetName(W,X)local Y,Z=n({SetName=X},{SetName=''})assert(Y,table.concat(Z,
'\n'))O:set(X)end function V.SetCallback(W,X)local Y,Z=n({SetCallback=X},{SetCallback=function()end})assert(Y,table.
concat(Z,'\n'))P:set(X)end function V.Fire(W)task.spawn(d(P))end function V.Enable(W)Q:set(true)end function V.Disable(W
)Q:set(false)end function V.Visible(W)S:set(true)end function V.Invisible(W)S:set(false)end return V end function G.
Visible(H)D:set(true)end function G.Invisible(H)D:set(false)end return G end end)()end,[67]=function()local aa,ab,ac=a(
67)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al
=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.RunService,al.UserInputService,ag.Fusion local
ap,b,c,d,m,n,o,p=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local q,r,s,t,u,v
,w=p.get,p.animate,p.typecheck,p.customFont,p.randomString,p.connections,ac(ae.simpleElements)local A,B,C,D,E,F,G,H,I,J=
w.UIListLayout,w.UIPadding,w.UITextSizeConstraint,w.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,s(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Color=
Color3.new(),Transparency=0,HideTransparency=true,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled
and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Color and''or'Color',af.Transparency and''or
'Transparency',af.HideTransparency and''or'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(I,table.
concat(J,'\n'))local K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',ah.find
'absoluteOffset',ah.find'currentPicker',ah.add(af),af.Parent,af.Name,af.DisabledText or c'Component Disabled',af.
IsEnabled or c(true),af.Visible or c(true),af.Callback,af.Color or c(Color3.new(1)),af.IgnoreConfig or c(false),af.
Transparency or c(0),af.HideTransparency or c(false)local _,as=(af.FLAG or c(P.uid))if q(_)~=''then as=ak.register(q(_),
{color=c(Color3.new(1)),transparency=c(0)},'colorpicker',q(_)==P.uid)as.user.Value={q(as.status.color),q(as.status.
transparency)}end local at,au=as.status.color,as.status.transparency d(at):onChange(function()if q(T)then task.spawn(q(V
),q(at),q(au))end end)d(au):onChange(function()if q(T)then task.spawn(q(V),q(at),q(au))end end)local av=c(q(K.string)==
q(P.tab).uid)d(K.string):onChange(function()av:set(q(K.string)==q(P.tab).uid)end)local aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,
aH,aI,aJ,aK,aL,aM,aN=r(function()return q(av)and 0 or 1 end,40,1),c(),c(0),c(),c(0),c(),c(0),c(),c(false),c(),c(false),
c(),c(false),c(0),c(0),(c(0))local function aO()return{Name=R,Children={A(E.LayoutOrder,F.Vertical,G.Center,H.Top,UDim.
new(0,5)),ap'TextButton'{Size=UDim2.fromOffset(224,224),[o]=aD,[m'InputBegan']=function(aP)if aP.UserInputType~=Enum.
UserInputType.MouseButton1 and aP.UserInputType~=Enum.UserInputType.Touch then return end aE:set(true)local aQ aQ=aP.
Changed:Connect(function()if aP.UserInputState==Enum.UserInputState.End or aP.UserInputState.Cancel then aE:set(false)aQ
:Disconnect()end end)end,[b]={ap'UIGradient'{Color=n(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(q(aJ),1,1))}end)},ap'Frame'{Size=UDim2.
fromScale(1,1),[b]={ap'UIGradient'{Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0
)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=n(function()return NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromOffset(10,10),ImageColor3=n(function()return Color3.
fromHSV(0,0,1-q(aL))end),Position=n(function()return UDim2.fromScale(q(aK),1-q(aL))end),[b]={ap'ImageLabel'{ZIndex=2,
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromScale(0.9,0.9),ImageColor3=n(
function()return Color3.fromHSV(q(aJ),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},ap'TextButton'{Size=UDim2.new(1,0,
0,24),[m'InputBegan']=function(aP)if aP.UserInputType~=Enum.UserInputType.MouseButton1 and aP.UserInputType~=Enum.
UserInputType.Touch then return end aG:set(true)local aQ aQ=aP.Changed:Connect(function()if aP.UserInputState==Enum.
UserInputState.End or aP.UserInputState.Cancel then aG:set(false)aQ:Disconnect()end end)end,[o]=aF,[b]={ap'UIGradient'{
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(
0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.
colorpickerBar,Size=UDim2.new(0,2,1,0),Position=n(function()return UDim2.fromScale(1-q(aJ),0.5)end)}}},ap'ImageButton'{
Visible=not q(Z),ZIndex=2,Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=
Enum.ScaleType.Crop,[m'InputBegan']=function(aP)if aP.UserInputType~=Enum.UserInputType.MouseButton1 and aP.
UserInputType~=Enum.UserInputType.Touch then return end aI:set(true)local aQ aQ=aP.Changed:Connect(function()if aP.
UserInputState==Enum.UserInputState.End or aP.UserInputState.Cancel then aI:set(false)aQ:Disconnect()end end)end,[o]=aH,
[b]={ap'Frame'{Size=UDim2.fromScale(1,1),[b]={ap'UIGradient'{Color=n(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,q(at)),ColorSequenceKeypoint.new(1,q(at))}end),Transparency=n(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'Frame'{AnchorPoint=Vector2
.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=n(function()return UDim2.fromScale(q(au)
,0.5)end)}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[b]={A(E.LayoutOrder,F.Horizontal,G.Left,H.
Center,UDim.new(0,4)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=
ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=t('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.
TextXAlignment.Right},ap'TextBox'{Name=u(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',
PlaceholderColor3=ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,Text=n(function()local aP={q(at).R,q(at
).G,q(at).B}for aQ,aR in aP do aP[aQ]=math.floor(math.clamp(aR*255,0,255))end return table.concat(aP,', ')end),
TextScaled=true,FontFace=t('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.
Right,[o]=aB,[m'Changed']=function(aP)local aQ=q(aB)if aP=='TextBounds'and aQ and aQ.TextBounds then aC:set(aQ.
TextBounds.X)end end,[m'FocusLost']=function()local aP=q(aB)local aQ,aR=aP.Text:gsub(' ',''),{q(at).R,q(at).G,q(at).B}
for aS,aT in aR do aR[aS]=math.floor(math.clamp(aT*255,0,255))end local aU,aV,aW=table.concat(aR,', '),pcall(function()
local aU=string.split(aQ,',')table.foreach(aU,function(aV,aW)if not tonumber(aW)then return nil end aU[aV]=math.clamp(aW
,0,255)end)return Color3.fromRGB(aU[1],aU[2],aU[3])end)if aV and aW then at:set(aW)aJ:set(({q(at):ToHSV()})[1])aK:set(({
q(at):ToHSV()})[2])aL:set(({q(at):ToHSV()})[3])else aP.Text=aU end end,[b]={C(1,16),ap'UISizeConstraint'{MaxSize=Vector2
.new(110,16),MinSize=Vector2.new(42,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,Position=
UDim2.fromScale(1,1),Size=r(function()return UDim2.fromOffset(math.clamp(q(aC),0,110),2)end,40,1),[b]={D(0,1)}}}}}}},ap
'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[b]={A(E.LayoutOrder,F.Horizontal,G.Left,H.Center,UDim.new(0,5
)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=ai.text2,
BackgroundTransparency=1,TextSize=16,FontFace=t('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},ap'TextBox'{Name=u(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.AutomaticSize.X,
PlaceholderText='HSV',PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=n(function()local aP={q(at):ToHSV()}for aQ,aR
in aP do aP[aQ]=math.floor(aR*100)/100 end return table.concat(aP,', ')end),TextScaled=true,FontFace=t('Montserrat',Enum
.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[o]=az,[m'Changed']=function(aP)local
aQ=q(az)if aP=='TextBounds'and aQ and aQ.TextBounds then aA:set(aQ.TextBounds.X)end end,[m'FocusLost']=function()local
aP=q(az)local aQ,aR=aP.Text:gsub(' ',''),{q(at):ToHSV()}for aS,aT in aR do aR[aS]=math.floor(aT*100)/100 end local aU,aV
,aW=table.concat(aR,', '),pcall(function()local aU=string.split(aQ,',')table.foreach(aU,function(aV,aW)if not tonumber(
aW)then return nil end end)return Color3.fromHSV(unpack(aU))end)if aV and aW then at:set(aW)aJ:set(({q(at):ToHSV()})[1])
aK:set(({q(at):ToHSV()})[2])aL:set(({q(at):ToHSV()})[3])else aP.Text=aU end end,[b]={C(1,16),ap'UISizeConstraint'{
MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.
text2,Position=UDim2.fromScale(1,1),Size=r(function()return UDim2.fromOffset(math.clamp(q(aA),36,110),2)end,40,1),[b]={
D(0,1)}}}}}}}}}end d(T):onChange(function()if not q(T)and typeof(aM)=='Instance'then aM:Destroy()end end)ap'Frame'{
Interactable=n(function()if not q(T)then return false end return q(av)end),Visible=n(function()if q(L.string)~=''and not
string.find(q(R):lower(),q(L.string):lower())or not q(U)then return false end return true end),Parent=Q,Size=UDim2.new(1
,0,0,36),BackgroundTransparency=1,BackgroundColor3=ai.background2,[b]={D(6),ap'Frame'{ZIndex=3,Visible=n(function()if
not q(T)then return true end return false end),BackgroundTransparency=r(function()return q(av)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[b]={D(6),ap'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=aw},ap'TextLabel'{FontFace=t('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=aw,TextScaled=true,AnchorPoint=Vector2.new(0,0.5)
,Position=UDim2.new(0,29,0.5,0),Text=S,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[b]={B(0,5)}}}},ap'Frame'{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[b]={A(E.LayoutOrder,F.Horizontal,G.Left,H.Bottom,UDim.new(0,3)),ap
'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=aw,[b]={B(9,8),D(6),A(E.
LayoutOrder,F.Horizontal,G.Left,H.Top),ap'TextLabel'{FontFace=t('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,
18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,
0.5,0),Text=R,TextTransparency=aw,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},ap'TextButton'{Interactable=
n(function()if not q(T)then return false end return q(av)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=ai.background2
,BackgroundTransparency=aw,[m'Activated']=function()if typeof(q(O.module))=='Instance'then q(O.module):Destroy()end aM,
aN=ac(ab.Parent.module)(aO())O:update('module',aM)end,[b]={B(0,8),D(6),A(E.LayoutOrder,F.Horizontal,G.Right,H.Center,
UDim.new(0,5)),ap'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[b]={A(E.LayoutOrder,F.Horizontal,G.Right,H
.Center,UDim.new(0,4)),ap'TextBox'{Interactable=n(function()if not q(T)then return false end return q(av)end),Name=u(8),
BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',PlaceholderColor3=ai.text2,TextColor3=ai.text,
TextTransparency=aw,Text=n(function()return'#'..q(at):ToHex()end),TextScaled=true,FontFace=t('Montserrat',Enum.
FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[m'Changed']=function(aP)local aQ=q(ax)
if aP=='TextBounds'and aQ and aQ.TextBounds then ay:set(aQ.TextBounds.X)end end,[m'FocusLost']=function()local aP=q(ax)
local aQ=aP.Text:gsub('[^%w#]','')if not string.find(aQ,'#')then aQ='#'..aQ end if string.len(aQ)~=7 then aP.Text='#'..
q(at):ToHex()else local aR,aS=pcall(function()return Color3.fromHex(aQ)end)if aR then at:set(aS)else aP.Text='#'..q(at):
ToHex()end end end,[o]=ax,[b]={C(1,16),ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,
BackgroundTransparency=r(function()if q(av)then return 0.5 end return 1 end,40,1),Position=UDim2.fromScale(1,1),Size=r(
function()return UDim2.fromOffset(math.clamp(q(ay),0,98),2)end,40,1),[b]={D(0,1)}}}}}},ap'ImageLabel'{Size=UDim2.
fromOffset(24,24),Image=aj.paint,ImageColor3=at,BackgroundTransparency=1,ImageTransparency=r(function()return not q(av)
and 1 or q(au)end,40,1),[b]={D(6)}}}}}}}}v.add(am.Heartbeat:Connect(function()if q(aE)then local aP=q(aD)local aQ=an:
GetMouseLocation()-aP.AbsolutePosition-Vector2.new(0,q(N.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),
math.clamp(aQ.Y,0,aP.AbsoluteSize.Y))aK:set(aQ.X/aP.AbsoluteSize.X)aL:set((aP.AbsoluteSize.Y-aQ.Y)/aP.AbsoluteSize.Y)at:
set(Color3.fromHSV(q(aJ),q(aK),q(aL)))end if q(aG)then local aP=q(aF)local aQ=an:GetMouseLocation()-aP.AbsolutePosition-
Vector2.new(0,q(N.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),0)aJ:set((aP.AbsoluteSize.X-aQ.X)/aP.
AbsoluteSize.X)at:set(Color3.fromHSV(q(aJ),q(aK),q(aL)))end if q(aI)then local aP=q(aH)local aQ=an:GetMouseLocation()-aP
.AbsolutePosition-Vector2.new(0,q(N.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),0)au:set(aQ.X/aP.
AbsoluteSize.X)end end))if q(M.boolean)and not q(X)then as.file:Connect(function(aP)local aQ,aR=true,true if aP.color~=
nil then if string.find(aP.color,',')then local aS=string.split(aP.color:gsub(' ',''),',')table.foreach(aS,function(aT,
aU)aS[aT]=tonumber(aU)end)at:set(Color3.new(unpack(aS)))else at:set(Color3.fromHex(`#{string.gsub(aP.color,'#','')}`))
end aQ=false end if aP.transparency~=nil then au:set(tonumber(aP.transparency))aR=false end if aQ then at:set(q(W))end
if aR then au:set(q(Y))end aJ:set(({q(at):ToHSV()})[1])aK:set(({q(at):ToHSV()})[2])aL:set(({q(at):ToHSV()})[3])end)if as
.private then at:set(q(W))au:set(q(Y))end else at:set(q(W))au:set(q(Y))end if as.preregistered and as.preregisteredValue
and typeof(as.preregisteredValue)=='table'then if as.preregisteredValue.color and typeof(as.preregisteredValue.color)==
'string'then local aP,aQ=pcall(function()return Color3.fromHex(as.preregisteredValue.color)end)if aP then at:set(aQ)end
end if not q(Z)then if as.preregisteredValue.transparency and typeof(as.preregisteredValue.transparency)=='number'then
au:set(as.preregisteredValue.transparency)end end end aJ:set(({q(at):ToHSV()})[1])aK:set(({q(at):ToHSV()})[2])aL:set(({
q(at):ToHSV()})[3])local aP={}function aP.SetName(aQ,aR)local aS,aT=s({SetName=aR},{SetName=''})assert(aS,table.concat(
aT,'\n'))R:set(aR)end function aP.SetColor(aQ,aR)local aS,aT=s({SetColor=aR},{SetColor=Color3.new()})assert(aS,table.
concat(aT,'\n'))at:set(aR)aJ:set(({q(at):ToHSV()})[1])aK:set(({q(at):ToHSV()})[2])aL:set(({q(at):ToHSV()})[3])end
function aP.SetTransparency(aQ,aR)local aS,aT=s({SetTransparency=aR},{SetTransparency=0})assert(aS,table.concat(aT,'\n')
)au:set(aR)end function aP.Enable(aQ)T:set(true)end function aP.Disable(aQ)T:set(false)end function aP.Visible(aQ)U:set(
true)end function aP.Invisible(aQ)U:set(false)end return aP end end)()end,[68]=function()local aa,ab,ac=a(68)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.
themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,as,at,au,av=
ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af.Parent local aw=am(ap(at.string)==ap(au.tab).uid)an(at.string):
onChange(function()aw:set(ap(at.string)==ap(au.tab).uid)end)local ax=as(function()return ap(aw)and 0 or 1 end,40,1)ak
'Frame'{Parent=av,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=ax}}}end end)()
end,[69]=function()local aa,ab,ac=a(69)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,as,at,au,av=
al.New,al.Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.
animate,av.typecheck,av.customFont,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aG,aH,aI,aJ=aA.UIListLayout,aA.UIPadding,aA
.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ay(af,{Name='',DisabledText=
'',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Items={},Multiselect=true,Regex=function()end,
IgnoreConfig=true,Alphabetical=true,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or
'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Multiselect and''or'Multiselect',af.Regex and''or
'Regex',af.IgnoreConfig and''or'IgnoreConfig',af.Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})
assert(aI,table.concat(aJ,'\n'))aI,aJ=ay(af,{Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aI,
table.concat(aJ,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string',
'The Regex function must always return a string')end local aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,c,d,m=ah.find
'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or ao
'Component Disabled',af.IsEnabled or ao(true),af.Visible or ao(true),af.Callback,ao{},af.Multiselect or ao(false),af.
Default,af.IgnoreConfig or ao(false),af.Alphabetical or ao(false),af.AlwaysOpen or ao(false),af.Regex or ao(function(aK)
return aK end)local n,o=(af.FLAG or ao(aN.uid))if aw(n)~=''then o=ak.register(aw(n),{items=ao{},item=ao'',multiselect=
aw(aV)},'dropdown',aw(n)==aN.uid)o.user.Value=aw(aV)and aw(o.status.items)or aw(o.status.item)end local p,q,r,s,t,u,v,w=
o.status.items,o.status.item,ao(),ao(false),ao(aw(aV)and{}or''),ao{},ao{},ao(false)ap(p):onChange(function()if#aw(p)==#
aw(aU)then w:set(true)else w:set(false)end local A={}for B,C in aw(p)do table.insert(A,aw(m)(C))end task.wait()task.
spawn(aw(aT),A)t:set(aw(p))end)ap(q):onChange(function()task.wait()task.spawn(aw(aT),aw(m)(aw(q)))t:set(aw(m)(aw(q)))end
)local A=ao(aw(aK.string)==aw(aN.tab).uid)ap(aK.string):onChange(function()A:set(aw(aK.string)==aw(aN.tab).uid)end)local
B=ax(function()return aw(A)and 0 or 1 end,40,1)local function C(D)for E,F in aw(aU)do local G=typeof(F)=='table'and F.
Value or F if G==D then return true end end return false end am'Frame'{Parent=aO,Visible=at(function()if aw(aM.string)~=
''and not string.find(aw(aP):lower(),aw(aM.string):lower())or not aw(aS)then return false end return true end),Size=ax(
function()if aw(s)then return UDim2.new(1,0,0,76+(aw(aV)and(42)or 6)+math.clamp((#aw(aU)*34),34,136))end return UDim2.
new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,BackgroundTransparency=B,ClipsDescendants=true,[an]={aD(6),aB(aE.
LayoutOrder,aF.Vertical,aG.Left,aH.Top,UDim.new(0,4)),am'TextButton'{Interactable=at(function()if not aw(aR)then return
false end return aw(A)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[as'Activated']=function()if aw(d)then
return end s:set(not aw(s))end,[an]={am'Frame'{ZIndex=2,Visible=at(function()if not aw(aR)then return true end return
false end),BackgroundTransparency=ax(function()return aw(A)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground
,Size=UDim2.fromScale(1,1),[an]={aD(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=B},am
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=B,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=at(function()return aw(aQ)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aC(0,5)}}}},am
'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=at(function()if aw(aV)then return aw(aP)..' '..tostring(#aw(p))..
'/'..tostring(#aw(aU))end if typeof(aw(t))=='table'then return aw(aP)end if aw(v)[aw(t)]then return`{aw(aP)}: {aw(v)[aw(
t)]}`end return`{aw(aP)}: {aw(t)}`end),TextTransparency=B,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=at(function()return aw(aV)and aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.
text2,ImageTransparency=B}}}}},am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,[an]={aC(0,6),am'TextBox'{
Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,BackgroundTransparency=B,FontFace=az('Montserrat',Enum.
FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',
TextColor3=ai.text,TextTransparency=B,[au]=r,[as'Changed']=function(D)local E=aw(r)if D=='Text'and E and E.Text then
local F=E.Text for G,H in aw(u)do if string.find(aw(m)(H.Name):lower(),F:lower())or F==''then H.Visible=true else H.
Visible=false end end end end,[an]={am'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},aD(4),aC(6,6,6,6)}}}},am
'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=aV,[an]={aC(6,6,0,6),am'TextButton'{Interactable=aV,
Size=UDim2.new(1,0,0,24),BackgroundTransparency=B,BackgroundColor3=ai.background,[as'Activated']=function()local D={}if
not aw(w)then for E,F in aw(aU)do F=typeof(F)=='table'and F.Value or F table.insert(D,aw(m)(F))end end p:set(D)end,[an]=
{aD(4),aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),
BackgroundTransparency=1,TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0
),Text=at(function()if aw(w)then return'Deselect All'end return'Select All'end),TextTransparency=B,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=at(function()return UDim2.new(1,-6,0,math.clamp(
(#aw(aU)*34),34,136))end),BackgroundTransparency=1,ScrollBarThickness=at(function()return#aw(aU)>4 and 6 or 0 end),
ScrollBarImageColor3=ai.scrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aC(6,at(
function()return#aw(aU)>4 and UDim.new(0,12)or UDim.new(0,0)end),0,6),aB(aw(c)and aE.Name or aE.LayoutOrder,aF.Vertical,
aG.Center,aH.Top,UDim.new(0,6)),u}}}}ap(aU):onChange(function()local D={}for E,F in aw(aU)do local G,H,I,J=(ao(false))if
typeof(F)=='table'then local K,L=ay(F,{DisplayValue='',Value='',Image=''},{F.Image and''or'Image',F.DisplayValue and''or
'DisplayValue'})assert(K,table.concat(L,'\n'))H=F.Value I=F.Image or nil J=F.DisplayValue or nil else local K,L=ay({Item
=F},{Item=''})assert(K,table.concat(L,'\n'))H=F end local K=aw(m)(H)if J then local L=aw(v)L[H]=J v:set(L)end ap(p):
onChange(function()if table.find(aw(p),K)then G:set(true)else G:set(false)end end)ap(q):onChange(function()if aw(q)==K
then G:set(true)else G:set(false)end end)local L=am'TextButton'{Name=`{J~=nil and J or H}`,Size=UDim2.new(1,0,0,28),
BackgroundTransparency=B,BackgroundColor3=ai.background,[as'Activated']=function()if aw(aV)then local L=aw(p)G:set(not
aw(G))if aw(G)then table.insert(L,K)else table.remove(L,table.find(L,K))end p:set(L)else q:set(K)if aw(d)then return end
s:set(false)end end,[an]={aD(4),aC(8),aB(aE.LayoutOrder,aF.Horizontal,aG.Left,aH.Center,UDim.new(0,6)),am'Frame'{Visible
=at(function()return aw(aV)and true or false end),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=
UDim2.new(1,0,0.5,0),BackgroundTransparency=B,BackgroundColor3=ax(function()return aw(G)and ai.get'toggled'or ai.get
'selectedTab'end,40,1),[an]={aD(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position
=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=ax(function()if not aw(A)then return 1
end if aw(G)then return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},am'ImageLabel'{Visible=at(function()
return I and true or false end),Size=UDim2.fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0
),BackgroundTransparency=1,Image=I,ImageTransparency=B,ImageColor3=ai.text2},am'TextLabel'{FontFace=az('Montserrat',Enum
.FontWeight.Bold),Size=at(function()return aw(aV)and UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=J or H,TextTransparency=B,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(D,L)end u:set(D)end
)aU:set(aw(af.Items))if aw(d)then s:set(true)end if aw(aL.boolean)and not aw(b)then o.file:Connect(function(D)local E=
true if D~=nil then E=false end if aw(aV)then local F={}for G,H in D do if C(H)then table.insert(F,H)end end local I,J=
aw(p),false local K,L=#I>#F and I or F,#I<#F and I or F for M,N in K do if L[M]~=N then J=true break end end if J then p
:set(F)end else q:set(D)end if E then if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then q:set(aw(aW
))end end end end)if o.private then if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then for D,E in
aw(aU)do if typeof(E)=='table'and E.Value==aw(aW)then q:set(aw(aW))elseif E==aw(aW)then q:set(aw(aW))end end end end end
else if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then q:set(aw(aW))end end end if o.preregistered
and o.preregisteredValue then if aw(aV)then if typeof(o.preregisteredValue)=='table'then local D={}for E,F in o.
preregisteredValue do if C(F)then table.insert(D,F)end end local G,I=aw(p),false local J,K=#G>#D and G or D,#G<#D and G
or D for L,M in J do if K[L]~=M then I=true break end end if I then p:set(D)end end else if typeof(o.preregisteredValue)
=='string'and C(o.preregisteredValue)then q:set(o.preregisteredValue)end end end local D={}function D.SetName(E,G)local
I,J=ay({SetName=G},{SetName=''})assert(I,table.concat(J,'\n'))aP:set(G)end function D.SetItems(E,G)local I,J=ay({
SetItems=G},{SetItems={}})assert(I,table.concat(J,'\n'))aU:set(G)local K,L={},false for M,N in aw(aU)do local O if
typeof(N)=='table'then O=N.Value else O=N end local P=aw(m)(O)if aw(aV)then if typeof(aw(t))=='table'and table.find(aw(t
),P)then table.insert(K,P)L=true end else if aw(t)==P then L=true q:set(P)break end end end if L then if aw(aV)then p:
set(K)end else if aw(aV)then p:set{}else q:set''end end end function D.SelectItem(E,G)assert(not aw(aV),
':SelectItem requires Multiselect to be false')local I,J=ay({SelectItem=G},{SelectItem=''})assert(I,table.concat(J,'\n')
)local K=false for L,M in aw(aU)do local N=M if typeof(M)=='table'then N=M.Value end local O=aw(m)(G)if aw(m)(N)==O then
K=true break end end assert(K,":SelectItem couldn't find "..G)q:set(G)end function D.SelectItems(E,G)assert(aw(aV),
':SelectItems requires Multiselect to be true')local I,J=ay({SelectItems=G},{SelectItems={}})assert(I,table.concat(J,
'\n'))for K,L in G do local M=false for N,O in aw(aU)do local P=typeof(O)=='table'and aw(m)(O.Value)or aw(m)(O)if L==P
then M=true break end end if M then G[K]=aw(m)(L)else table.remove(G,K)end end p:set(G)end function D.Enable(E)aR:set(
true)end function D.Disable(E)aR:set(false)end function D.Visible(E)aS:set(true)end function D.Invisible(E)aS:set(false)
end return D end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent
return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services
local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=an.New,an.Children,an.Value,an.Observer,an.OnEvent,
an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.animate,aw.typecheck,aw.connections,aw.customFont,aw
.references,aw.drag,ac(ae.simpleElements)local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=aE.UIPadding,aE.UICorner,aE.
UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Bind=
Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and
''or'Visible',af.FLAG and''or'FLAG',af.Bind and''or'Bind',af.IgnoreConfig and''or'IgnoreConfig'})assert(aO,table.concat(
aP,'\n'))local aQ,aR,aS,aT,aU,aV,aW,b,c,d,m,n,o,p,q,r,s,t=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',
ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.find'bindData',ah.find
'absoluteOffset'.number,ah.add(af),af.Parent,af.Name,af.DisabledText or as'Component Disabled',af.IsEnabled or as(true),
af.Visible or as(true),af.Callback,af.Bind,af.IgnoreConfig or as(false)local u,v=(af.FLAG or as(d.uid))if ax(u)~=''then
v=ak.register(ax(u),{coordinate=as(nil),keycode=as(nil),mobile=ax(aU.boolean)},'keybind',ax(u)==d.uid)v.user.Value=ax(aU
.boolean)and ax(v.status.coordinate)or ax(v.status.keycode)end local w=as()local function A(B:EnumItem,C:string)local D,
E=ax(aR.binds),ax(b.bindData)if table.find(D,B)then aN(('Key %s is already in use. %s'):format(B.Name,C))else table.
insert(D,B)if ax(w)then table.remove(D,table.find(D,ax(w)))E[ax(w).Name]=nil end w:set(B)E[ax(w).Name]={bind=ax(w),name=
ax(n)}b:update('bindData',E)aR:update('binds',D)v.status.keycode:set(ax(w).Name)end end local B=as(ax(aQ.string)==ax(d.
tab).uid)at(aQ.string):onChange(function()B:set(ax(aQ.string)==ax(d.tab).uid)end)local C,D=ay(function()return ax(B)and
0 or 1 end,40,1),as(false)local E=am.InputBegan:Connect(function(E,G)if ax(aU.boolean)then return end if ax(D)then if E.
KeyCode and E.KeyCode~=Enum.KeyCode.Unknown then A(E.KeyCode,'From input box')end D:set(false)task.wait()aW:update(
'boolean',false)else if E.KeyCode and E.KeyCode==ax(w)and not G and not ax(aW.boolean)and ax(p)then task.spawn(ax(r))end
end end)aA.add(E)local G,I,J=(as(false))J=ao'TextButton'{Visible=av(function()if not ax(p)then return ax(p)end return
ax(G)end),Parent=aC.get(ax(aV.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text=n,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if
I then I:Disconnect()I=nil v.status.coordinate:set(J.AbsolutePosition)else task.spawn(ax(r))end end,[ap]={aF(4),aG(16),
aH(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=ax(aU.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=m,Visible=av(function()if ax(aT.string)~=''and not string.
find(ax(n):lower(),ax(aT.string):lower())or not ax(q)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(p)then return true end return false end
),BackgroundTransparency=ay(function()return ax(B)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=C},ao
'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=C,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=av(function()return ax(o)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=av(function()if not ax(p)then return false end return ax(B)end),Size=UDim2.new(0.225,0,1,
0),BackgroundColor3=ai.background2,BackgroundTransparency=C,[au'Activated']=function()if ax(aU.boolean)then G:set(true)I
=aD(J,15)return end D:set(true)aW:update('boolean',true)end,[ap]={aG(6),aF(6),aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM
.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ax(aU.boolean
)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=C},ao'TextLabel'{Visible=not ax(aU.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=C,Text=av(function()return ax(D)and
'Listening'or ax(w)and ax(w).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(aU.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=av(function()return ax(G)and'Move Bind'or'Place Bind'end),
TextTransparency=C}}},ao'TextButton'{Visible=G,Interactable=av(function()if not ax(p)then return false end return ax(B)
end),Size=UDim2.fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=C,[au'Activated']=function()G:
set(false)J.Position=UDim2.fromScale(0.5,0.5)v.status.coordinate:set(nil)end,[ap]={aG(6),ao'ImageLabel'{AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.
close,ImageColor3=ai.red,ImageTransparency=C}}},ao'Frame'{Size=av(function()return UDim2.new(0.775,ax(G)and-42 or-3,0,36
)end),BackgroundColor3=ai.background2,BackgroundTransparency=C,[ap]={aG(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aF(8),aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=n,TextTransparency=C,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if ax(aS.boolean)and not ax(t)then v.file:Connect(function(K)local L=true
if K.keycode~=nil and((ax(w)and ax(w).Name or'')~=K.keycode)then local M,N=pcall(function()return Enum.KeyCode[K.keycode
]end)if M then A(N,'File1')end L=false end if L and ax(v.status.keycode)==nil then if s then A(ax(s),'NoFileFound')end
end if ax(aU.boolean)and K.coordinate then J.Position=UDim2.fromOffset(K.coordinate.X+30,K.coordinate.Y+30+ax(c))G:set(
true)v.status.coordinate:set(K.coordinate)elseif ax(aU.boolean)and not K.coordinate then G:set(false)J.Position=UDim2.
fromScale(0.5,0.5)end end)if v.private then if s then A(ax(s),'Private')end end else if s then A(ax(s),
'IgnoreConfig/UseConfig:false')end end if v.preregistered and v.preregisteredValue and typeof(v.preregisteredValue)==
'table'then if not ax(aU.boolean)then if v.preregisteredValue.keycode and typeof(v.preregisteredValue.keycode)=='string'
then local K,L=pcall(function()return Enum.KeyCode[v.preregisteredValue.keycode]end)if K then A(L,'Configuration1')end
end else if v.preregisteredValue.coordinate and typeof(v.preregisteredValue.coordinate)=='table'and v.preregisteredValue
.coordinate.X and v.preregisteredValue.coordinate.Y then if typeof(v.preregisteredValue.coordinate.X)=='number'and
typeof(v.preregisteredValue.coordinate.Y)=='number'then J.Position=UDim2.fromOffset(v.preregisteredValue.coordinate.X+30
,v.preregisteredValue.coordinate.Y+30+ax(c))G:set(true)end end end end local K={}function K.SetName(L,M)local N,O=az({
SetName=M},{SetName=''})assert(N,table.concat(O,'\n'))n:set(M)end function K.SetBind(L,M:EnumItem)local N,O=az({SetBind=
M},{SetBind=Enum.keyCode.C})assert(N,table.concat(O,'\n'))A(M,'At :SetBind')end function K.Enable(L)p:set(true)end
function K.Disable(L)p:set(false)end function K.Visible(L)q:set(true)end function K.Invisible(L)q:set(false)end return K
end end)()end,[71]=function()local aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,as,at=ak.New,
ak.Children,ak.Value,ak.Computed,ak.Observer,ak.OnEvent,ac(ae.simpleElements)local au,av,aw,ax,ay,az,aA,aB,aC=at.
UICorner,at.UIPadding,at.UITextSizeConstraint,at.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment
,Enum.VerticalAlignment,ac(ae.utilities)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO=aC.get,aC.animate,aC.getStringBounds,
aC.customFont,ah.find'selectedTab',ah.find'searchText',ah.find'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an
'Active Keybinds',an''local aP=an(aD(aH.string)==aD(aL.tab).uid)ap(aH.string):onChange(function()aP:set(aD(aH.string)==
aD(aL.tab).uid)end)local aQ,aR=aE(function()return aD(aP)and 0 or 1 end,40,1),an(0)task.spawn(function()aR:set(aF(aD(aO)
,{Font=aG('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aD(aM).AbsoluteSize.X)}).Y)end)aD(aM).Changed:
Connect(function(aS)if aS:lower()=='absolutesize'then aR:set(aF(aD(aO),{Font=aG('Montserrat',Enum.FontWeight.Medium),
Size=16,Width=math.round(aD(aM).AbsoluteSize.X)}).Y)end end)ap(aO):onChange(function()aR:set(aF(aD(aO),{Font=aG(
'Montserrat',Enum.FontWeight.Bold),Size=16,Width=math.round(aD(aM).AbsoluteSize.X)}).Y)end)local function aS(aT)local aU
={}table.foreach(aT,function(aV,aW)aU[aV]=aW.Name end)return table.concat(aU,', ')end local aT,aU,aV=(an
'Active Keybinds')aV,aU=ac(ab.Parent.module){Name=aT,Children={}}local function aW(b)local c,d={ax(ay.LayoutOrder,az.
Vertical,aA.Center,aB.Top,UDim.new(0,5))},aD(aK.bindData)for m,n in aD(aJ.binds)do local o=d[n.Name]table.insert(c,al
'TextLabel'{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text,FontFace=aG('Montserrat',Enum.
FontWeight.Regular),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,Text=ao(function()if o.boolean then return`[{o
.bind.Name}] {o.name} (<i>{string.upper(tostring(aD(o.boolean)))}</i>)`end return`[{o.bind.Name}] {o.name}`end)})end aU(
c)end al'TextButton'{Visible=ao(function()if aD(aI.string)~=''and not string.find(aD(aN):lower(),aD(aI.string):lower())
and not string.find(aD(aO):lower(),aD(aI.string):lower())then return false end return true end),BackgroundColor3=ai.
background2,Parent=aM,BackgroundTransparency=aQ,Size=ao(function()return UDim2.new(1,0,0,36+aD(aR))end),AutomaticSize=
Enum.AutomaticSize.Y,[as'Activated']=function()if typeof(aV)=='Instance'then aV:Destroy()aV=nil end aV,aU=ac(ab.Parent.
module){Name=aT,Children={}}aW(aD(aJ.binds))end,[am]={au(6),av(6),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.text2,ImageTransparency=aQ},al'TextLabel'{Name='Title',RichText
=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.fromOffset(25,0),BackgroundTransparency=1,TextTransparency=aQ,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=aG(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aN,[am]={aw(1,18)}},al'TextLabel'{Name='Body',TextWrapped=
true,RichText=true,Position=UDim2.fromOffset(4,25),BackgroundTransparency=1,TextTransparency=aQ,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=16,FontFace=aG('Montserrat',Enum.FontWeight.Medium),
TextColor3=ai.text2,Text=aO,Size=ao(function()return UDim2.new(1,-4,0,aD(aR))end)}}}ap(aJ.binds):onChange(function()aW(
aD(aJ.binds))end)aW(aD(aJ.binds))aO:set(aS(aD(aJ.binds)))ap(aJ.binds):onChange(function()aO:set(aS(aD(aJ.binds)))end)end
end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)
local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.
Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au=ap.UICorner,ap.UIPadding,ac(ae.utilities)local av,aw,
ax,ay=au.get,au.typecheck,au.animate,au.customFont local az,aA=aw(af,{Text='',Visible=false},{af.Visible and''or
'Visible'})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aG=ah.find'selectedTab',ah.find'searchText',ah.add(af),
af.Parent,af.Text,af.Visible or am(true)local aH=am(av(aB.string)==av(aD.tab).uid)ao(aB.string):onChange(function()aH:
set(av(aB.string)==av(aD.tab).uid)end)local aI=ax(function()return av(aH)and 0 or 1 end,40,1)ak'Frame'{Visible=an(
function()if av(aC.string)~=''and not string.find(av(aF):lower(),av(aC.string):lower())or not av(aG)then return false
end return true end),Size=UDim2.new(1,0,0,36),Parent=aE,BackgroundTransparency=aI,BackgroundColor3=ai.background2,[al]={
as(6),at(0,8),ak'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,
BackgroundTransparency=1,TextTransparency=aI,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.
new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return av(aF)end),[al]={ak
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}local aJ={}function aJ.SetText(aK,aL)local aM,aN=aw({SetText=aL}
,{SetText=''})assert(aM,table.concat(aN,'\n'))aF:set(aL)end function aJ.Visible(aK)aG:set(true)end function aJ.Invisible
(aK)aG:set(false)end return aJ end end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ab
.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local au,av,aw
,ax,ay,az,aA,aB=at.get,at.animate,at.typecheck,at.customFont,at.drag,at.references,at.connections,ac(ae.simpleElements)
local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name={},Children={}},{})assert(aJ,table.concat(aK,'\n'))local aL,aM,aN
,aO=ah.find'instanceName',ah.find'absoluteOffset',af.Name,an(af.Children)local aP,aQ,aR=az.get(au(aL.name)),(an(false))
aR=al'TextButton'{Parent=aP,Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10+au(aM.number)),
BackgroundTransparency=1,[ap'MouseButton1Down']=function()aQ:set(true)end,[am]={al'Frame'{Position=UDim2.new(0.5,-120,0,
0),Size=UDim2.fromOffset(240,0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={aE(4),aD(8),al
'TextButton'{AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),BackgroundColor3=ai
.selectedTab,[ap'Activated']=function()aR:Destroy()end,[am]={aE(6),al'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.
red,ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y
,[am]={aC(aF.LayoutOrder,aG.Vertical,aH.Center,aI.Top,UDim.new(0,8)),al'Frame'{Size=av(function()return au(aQ)and UDim2.
new(0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=av(function()return au(
aQ)and 0 or 0.5 end,40,1),[am]={aE(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=ax('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=aN,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]=aO}}}}}}}}}local aS,aT=ay(aR,15)local aU=aT:Connect(function()aQ:set(false)end)aA.add(aS)aA.add(aU)
aR.Destroying:Once(function()aS:Disconnect()aU:Disconnect()end)return aR,function(...)aO:set(...)end end end)()end,[74]=
function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,
ac(ae.utilities)local ap,as,at,au,av,aw=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.
simpleElements)local ax,ay,az,aA,aB,aC,aD,aE,aF=aw.UICorner,aw.UIPadding,aw.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,av(af,{Title='',Body='',Duration=1,Image='',ImageColor=
Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'
})assert(aE,table.concat(aF,'\n'))local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=am(af.Title),am(af.Body),am(af.Duration),am(af.
Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am'',am(250)
local function aQ(aR,aS)local aT=1 for aU=1,aR do aT=aT*10 end local aU=tostring(math.round(aS*aT)/aT)local aV=string.
split(aU,'.')if#aV==1 then local aW=''for b=1,aR do aW=aW..'0'end aU=aU..'.'..aW end return aU end local aR,aS={}for aT,
aU in ap(aL)do local aV,aW=av({Button=aU},{Button={}})assert(aV,table.concat(aW,'\n'))aV,aW=av(aU,{Name='',Callback=
function()end})assert(aV,table.concat(aW,'\n'))local b,c=aU.Name,aU.Callback local d=aj'TextButton'{Size=UDim2.new(1/#
ap(aL),-2,1,-4),TextSize=14,Text=b,FontFace=au('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=ah.notificationButton
,TextColor3=ah.text,[ak'Activated']=function()task.spawn(c)aN:set(false)task.wait(0.4)aM:set(false)task.wait(2)aS:
Destroy()end,[al]={ax(4)}}table.insert(aR,d)end aS=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=UDim2.
fromOffset(ap(aP),0),AutomaticSize=Enum.AutomaticSize.Y,[al]={ay(5,0,0,0),aj'TextButton'{BackgroundTransparency=1,Size=
UDim2.fromScale(1,1),[ak'Activated']=function()aN:set(false)task.wait(0.4)aM:set(false)aS:Destroy()end},aj'Frame'{Size=
UDim2.fromScale(1,0),BackgroundColor3=ah.background,AutomaticSize=Enum.AutomaticSize.Y,Position=as(function()return
UDim2.fromScale(ap(aN)and 0 or 1.2,0)end,30,1),[al]={az(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),
ay(0,4),ax(4),aj'Frame'{Visible=ap(aJ)~=''and true or false,Size=UDim2.new(0,24,1,0),BackgroundTransparency=1,[al]={aj
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),
BackgroundTransparency=1,Image=aJ,ImageColor3=aK}}},aj'Frame'{Size=UDim2.new(1,ap(aJ)~=''and-28 or 0,0,0),
BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,[al]={ay(2,0),az(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top),
aj'TextLabel'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=au('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aG},aj'TextLabel'{Size=UDim2.
new(1,0,0,1),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=au(
'Montserrat',Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,RichText=true,TextColor3=ah.text2,Text=aH},aj'Frame'{Visible=an(function()return#ap(
aL)>0 and true or false end),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,[al]={az(aA.LayoutOrder,aB.Horizontal,aC.
Center,aD.Center,UDim.new(0,2)),aR}},aj'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=au('Montserrat',Enum.FontWeight.
Medium),Text=aO,TextColor3=ah.text,TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}
task.delay(0.4,function()aN:set(true)end)task.spawn(function()repeat task.wait()until ap(aN)local aV,aW=(tick())repeat
aW=tick()-aV aO:set(aQ(1,math.clamp(aW,0,ap(aI))))task.wait()until aW>ap(aI)end)task.spawn(function()aM:set(true)repeat
task.wait()until ap(aN)task.wait(ap(aI))task.wait(0.2)aN:set(false)task.wait(0.4)aM:set(false)task.wait(2)aS:Destroy()
end)end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.
Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au,av=ap.UICorner,ap.UIPadding,ap.
UITextSizeConstraint,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.getStringBounds,av.customFont,av.
typecheck local aB,aC=aA(af,{Title='',Visible=false,Body=''},{af.Visible and''or'Visible'})assert(aB,table.concat(aC,
'\n'))local aD,aE,aF,aG,aH,aI,aJ=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body,af.
Visible or am(true)local aK=am(aw(aD.string)==aw(aF.tab).uid)ao(aD.string):onChange(function()aK:set(aw(aD.string)==aw(
aF.tab).uid)end)local aL,aM=ax(function()return aw(aK)and 0 or 1 end,40,1),am(0)task.spawn(function()aM:set(ay(aw(aI),{
Font=az('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(aw(aG).AbsoluteSize.X)}).Y)end)aw(aG).Changed:
Connect(function(aN)if aN:lower()=='absolutesize'then aM:set(ay(aw(aI),{Font=az('Montserrat',Enum.FontWeight.Medium),
Size=12,Width=math.round(aw(aG).AbsoluteSize.X)}).Y)end end)ao(aI):onChange(function()aM:set(ay(aw(aI),{Font=az(
'Montserrat',Enum.FontWeight.Bold),Size=12,Width=math.round(aw(aG).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function
()if aw(aE.string)~=''and not string.find(aw(aH):lower(),aw(aE.string):lower())and not string.find(aw(aI):lower(),aw(aE.
string):lower())or not aw(aJ)then return false end return true end),BackgroundColor3=ai.background2,Parent=aG,
BackgroundTransparency=aL,Size=an(function()return UDim2.new(1,0,0,36+aw(aM))end),AutomaticSize=Enum.AutomaticSize.Y,[al
]={as(6),at(6),ak'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,
TextTransparency=aL,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=18,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aH,[al]={au(1,18)}},ak'TextLabel'{
Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=aL,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=az('Montserrat',Enum
.FontWeight.Medium),TextColor3=ai.text2,Text=aI,Size=an(function()return UDim2.new(1,-4,0,aw(aM))end)}}}local aN={}
function aN.SetBody(aO,aP)local aQ,aR=aA({SetBody=aP},{SetBody=''})assert(aQ,table.concat(aR,'\n'))aI:set(aP)end
function aN.SetTitle(aO,aP)local aQ,aR=aA({SetTitle=aP},{SetTitle=''})assert(aQ,table.concat(aR,'\n'))aH:set(aP)end
function aN.Visible(aO)aJ:set(true)end function aN.Invisible(aO)aJ:set(false)end return aN end end)()end,[76]=function()
local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.UserInputService,al.
RunService,ag.Fusion local ap,as,at,au,av,aw,ax,ay=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref
,ac(ae.utilities)local az,aA,aB,aC,aD=ay.get,ay.animate,ay.typecheck,ay.customFont,ac(ae.simpleElements)local aE,aF,aG,
aH,aI,aJ,aK,aL,aM=aD.UIListLayout,aD.UIPadding,aD.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,aB(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',
Default=0,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af
.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Default and''or'Default',af.Min and''
or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace',af.
IgnoreConfig and''or'IgnoreConfig'})assert(aL,table.concat(aM,'\n'))local aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,c,d,m,n=ah.
find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or at
'Component Disabled',af.IsEnabled or at(true),af.Visible or at(true),af.Callback,af.Max,af.Min,af.DisplayAsPercent or
at(false),af.DecimalPlace or at(0),af.IgnoreConfig or at(false)local o=az(af.Default)and at(math.clamp(az(af.Default),
az(c),az(b)))if not az(o)then o=at(az(c))end local p=(af.FLAG and az(af.FLAG)~='')and az(af.FLAG)or aQ.uid local q=ak.
register(p,{percentageOf=at(az(c))},'slider',p==aQ.uid)q.user.Value=az(q.status.percentageOf)local r=at(az(aN.string)==
az(aQ.tab).uid)au(aN.string):onChange(function()r:set(az(aN.string)==az(aQ.tab).uid)end)local s=aA(function()return az(r
)and 0 or 1 end,40,1)local function t(u,v,w,A,B)return(1-((u-v)/(w-v)))*A+((u-v)/(w-v))*B end local function u(v)if az(m
)==0 then return math.floor(v)end return tonumber(string.format('%.'..az(m)..'f',v))end local v=at(0)au(q.status.
percentageOf):onChange(function()local w=az(q.status.percentageOf)if w>az(b)or w<az(c)then q.status.percentageOf:set(
math.clamp(w,az(c),az(b)))return end v:set(t(az(q.status.percentageOf),az(c),az(b),0,1))if not az(aU)then return end
task.spawn(az(aW),az(q.status.percentageOf))end)local w,A,B,C=at(),at(10),at(),at(false)am.InputEnded:Connect(function(D
)if(D.UserInputType==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch)and az(C)then C:set(
false)end end)ap'Frame'{Parent=aR,Visible=aw(function()if az(aP.string)~=''and not string.find(az(aS):lower(),az(aP.
string):lower())or not az(aV)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.
background2,BackgroundTransparency=aA(function()if az(r)then return 0 end return 1 end,40,1),[as]={aG(6),ap'Frame'{
ZIndex=2,Visible=aw(function()if not az(aU)then return true end return false end),BackgroundTransparency=aA(function()
return az(r)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[as]={aG(6),ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=s},ap'TextLabel'{FontFace=aC(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=s,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=aw(function()
return az(aT)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[as]={aF(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[as]={aE(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,6)
),aF(0,8),ap'TextLabel'{FontFace=aC('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=s,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=aS,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[as]={aE(aH.LayoutOrder,aI.
Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[as]={aG(4),
aE(aH.LayoutOrder,aI.Vertical,aJ.Right,aK.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aC('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=s,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=aw(function()if az(d)then return
tostring(u(az(v)*100))..'%'end return az(q.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[av'Changed']=function(D)local E=az(B)if D=='AbsoluteSize'and E and E.
AbsoluteSize then A:set(E.AbsoluteSize.X)end end,[av'FocusLost']=function()local D=az(B)if tonumber(D.Text)then q.status
.percentageOf:set(math.clamp(tonumber(D.Text),az(c),az(b)))else if az(d)then D.Text=tostring(u(az(v)*100))..'%'end D.
Text=az(q.status.percentageOf)end end,[ax]=B,[as]={aF(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=aA(function()if az(r)then return 0.5 end return 1 end,40,1),Size=aA(function()return UDim2.
fromOffset(az(A),2)end,40,1),[as]={aG(0,1)}}}},ap'TextButton'{Interactable=aw(function()if not az(aU)then return false
end return az(r)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[av'MouseButton1Down']=function()C:set(true)
end,[av'TouchLongPress']=function()C:set(true)end,[av'InputBegan']=function(D)if D.UserInputType==Enum.UserInputType.
MouseButton1 or D.UserInputType==Enum.UserInputType.Touch and az(w)then local E,G=am:GetMouseLocation().X,az(w).Size.X.
Offset local I=E-(az(w).AbsolutePosition.X+G)while az(C)and task.wait()do local J=am:GetMouseLocation().X local K=math.
clamp(G+(J-E)+I,0,az(w).AbsoluteSize.X)q.status.percentageOf:set(u(t(K,0,az(w).AbsoluteSize.X,az(c),az(b))))an.
RenderStepped:Wait()end end end,[ax]=w,[as]={aF(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=s,[as]={aG(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=s,Size=
aA(function()return UDim2.new(az(v),0,0,4)end,40,1),[as]={aG(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=s,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[as]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=aA(function()if az(r)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if az(aO.boolean)and not az(n)then q.file:Connect(function(D)local E=true if D~=nil then q.status.
percentageOf:set(math.clamp(D,az(c),az(b)))E=false end if E then q.status.percentageOf:set(az(o))end end)if q.private
then q.status.percentageOf:set(az(o))end else q.status.percentageOf:set(az(o))end if q.preregistered and q.
preregisteredValue and typeof(q.preregisteredValue)=='number'then q.status.percentageOf:set(math.clamp(q.
preregisteredValue,az(c),az(b)))end local D={}function D.SetName(E,G)local I,J=aB({SetName=G},{SetName=''})assert(I,
table.concat(J,'\n'))aS:set(G)end function D.SetValue(E,G)local I,J=aB({SetValue=G},{SetValue=0})assert(I,table.concat(J
,'\n'))q.status.percentageOf:set(math.clamp(G,az(c),az(b)))end function D.Enable(E)aU:set(true)end function D.Disable(E)
aU:set(false)end function D.Visible(E)aV:set(true)end function D.Invisible(E)aV:set(false)end return D end end)()end,[77
]=function()local aa,ab,ac=a(77)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae
.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer
,aj.OnEvent,ac(ae.utilities)local as,at,au,av,aw=ap.get,ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local
ax,ay,az,aA,aB,aC,aD,aE,aF=aw.UIListLayout,aw.UIPadding,aw.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,au(af,{Name='',Image=''},{af.Image and''or'Image'})assert(aE,table.concat(aF,
'\n'))local aG,aH,aI,aJ,aK,aL,aM=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.
Image then aM=af.Image aL:set(true)end local aN=am(false)an(aG.string):onChange(function()local aO=as(aG.string)aN:set(
aO==aI.uid)end)ak'TextButton'{Name=aI.uid,Parent=aJ,Size=UDim2.new(1,0,0,36),BackgroundColor3=at(function()return as(aN)
and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aG:update('string',aI.uid)end,[al]={az(
4),ay(6),ax(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=aL,
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=aM,ImageTransparency=at(function()
return as(aN)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=as(aL)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=av(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=aK,BackgroundTransparency=1,TextXAlignment=
Enum.TextXAlignment.Left,TextTransparency=at(function()return as(aN)and 0 or 0.6 end,40,1),[al]={ak
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}if not as(aH.boolean)then aH:update('boolean',true)aG:update(
'string',aI.uid)end return aI end end)()end,[78]=function()local aa,ab,ac=a(78)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=ai.New,ai.
Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,as,at,au,av=am.UIListLayout,Enum.SortOrder,Enum.FillDirection,
Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj'ScrollingFrame'{
ZIndex=al(function()return(au(av.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,as.Center,at.Top,UDim.new(0,4))}}
end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,as,
at,au,av=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.utilities)local aw,ax,ay,az,aA=av.
get,av.animate,av.customFont,av.typecheck,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK=aA.UIPadding,aA.
UICorner,aA.UITextSizeConstraint,aA.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.
FillDirection,az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',
PlaceHolderText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',IgnoreConfig=true},{af.DisabledText
and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.PlaceHolderText and''or
'PlaceHolderText',af.ClearTextOnFocus and''or'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or
'OnLeave',af.Default and''or'Default',af.FLAG and''or'FLAG',af.IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.
concat(aK,'\n'))local aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,c,d,m=ah.find'selectedTab',ah.find'useConfig',ah.find
'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible
or ao(true),af.Callback,af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.ClearTextOnFocus or
ao(false),af.IgnoreConfig or ao(false),af.PlaceHolderText or ao''local n,o=(af.FLAG or ao(aO.uid))if aw(n)~=''then o=ak.
register(aw(n),{correctText=ao''},'textbox',aw(n)==aO.uid)o.user.Value=aw(o.status.correctText)end local p=ao(aw(aL.
string)==aw(aO.tab).uid)as(aL.string):onChange(function()p:set(aw(aL.string)==aw(aO.tab).uid)end)local q,r,s,t,u,v,w=ax(
function()return aw(p)and 0 or 1 end,40,1),ao(),ao(false),ao'',ao(aw(o.status.correctText)),ao'',ao(false)as(t):
onChange(function()if aw(aV)then if tonumber(aw(t))or aw(t)==''then u:set(aw(t))end else u:set(aw(t))end local A=aw(r)A.
Text=aw(u)if aw(b)then return end if aw(aV)then if(tonumber(aw(t))or aw(t)=='')and aw(v)~=aw(t)then task.spawn(aw(aU),
aw(t))o.status.correctText:set(aw(t))v:set(aw(t))end else if aw(v)==aw(t)then return end task.spawn(aw(aU),aw(t))o.
status.correctText:set(aw(t))v:set(aw(t))end end)as(s):onChange(function()if aw(b)and not aw(s)then if aw(aV)then if(
tonumber(aw(t))or aw(t)=='')and aw(v)~=aw(t)then task.spawn(aw(aU),aw(t))o.status.correctText:set(aw(t))v:set(aw(t))end
else if aw(v)==aw(t)then return end task.spawn(aw(aU),aw(t))o.status.correctText:set(aw(t))v:set(aw(t))end end end)local
A,B=ao(),ao(0)am'Frame'{Parent=aP,Visible=ap(function()if aw(aN.string)~=''and not string.find(aw(aQ):lower(),aw(aN.
string):lower())or not aw(aT)then return false end return true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[
an]={am'Frame'{ZIndex=2,Visible=ap(function()if not aw(aS)then return true end return false end),BackgroundTransparency=
ax(function()return aw(p)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={
aC(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=q},am'TextLabel'{FontFace=ay(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=q,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ap(function()
return aw(aR)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aB(0,5)}}}},am'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[an]={aE(aF.LayoutOrder,aI.Horizontal,aH.Left,aG.Center,UDim.new(0,3)),am
'TextLabel'{Size=UDim2.fromScale(0,1),BackgroundColor3=ai.background2,BackgroundTransparency=q,TextSize=18,Text=aQ,
AutomaticSize=Enum.AutomaticSize.X,TextTransparency=q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,TextColor3=
ai.text,FontFace=ay('Montserrat',Enum.FontWeight.Bold),[au'Changed']=function(C)if C=='AbsoluteSize'and aw(A)~=nil then
B:set(aw(A).AbsoluteSize.X)end end,[at]=A,[an]={aC(6),aB(0,6)}},am'TextButton'{Interactable=ap(function()if not aw(aS)
then return false end return aw(p)end),Size=ap(function()if aw(A)then return UDim2.new(1,-aw(B)-3,1)end return UDim2.
fromScale(0.35,1)end),BackgroundColor3=ai.background2,BackgroundTransparency=q,[au'Activated']=function()local C=aw(r)if
C then C:CaptureFocus()end end,[an]={aC(6),aB(0,6),aE(aF.LayoutOrder,aI.Horizontal,aH.Left,aG.Center,UDim.new(0,5)),am
'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,
ImageTransparency=q},am'TextBox'{Interactable=ap(function()if not aw(aS)then return false end return aw(p)end),
ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),BackgroundTransparency=1,PlaceholderText=m,PlaceholderColor3=ai.text2,
TextColor3=ai.text,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,FontFace=ay('Montserrat',Enum.FontWeight.Bold),
Text=u,TextTransparency=q,ClearTextOnFocus=c,[at]=r,[au'Changed']=function(C)local D=aw(r)if D.TextBounds.X>D.
AbsoluteSize.X then w:set(true)end if D and D.Text and C=='Text'then t:set(D.Text)end end,[au'Focused']=function()s:set(
true)end,[au'FocusLost']=function()s:set(false)end,[an]={am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[
an]={am'UIGradient'{Rotation=0,Color=ax(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get
'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,40,1),Transparency=ax(function()if not aw(p)then
return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1
,1)}end if aw(w)then if aw(s)then return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(
0.1,1),NumberSequenceKeypoint.new(1,1)}else return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end end return NumberSequence.new{
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if aw(aM.boolean)and not aw(d)then o
.file:Connect(function(C)local D=true if C~=nil then if aw(b)then s:set(true)end t:set(C)if aw(b)then s:set(false)end D=
false end if D then if aw(b)then s:set(true)end t:set(aw(aW))if aw(b)then s:set(false)end end end)if o.private then if
aw(b)then s:set(true)end t:set(aw(aW))if aw(b)then s:set(false)end end else if aw(b)then s:set(true)end t:set(aw(aW))if
aw(b)then s:set(false)end end if o.preregistered and o.preregisteredValue then aJ,aK=az({FlagValue=o.preregisteredValue}
,{FlagValue=''})if aJ then if aw(b)then s:set(true)end t:set(o.preregisteredValue)if aw(b)then s:set(false)end end end
local C={}function C.SetName(D,E)local G,I=az({SetName=E},{SetName=''})assert(G,table.concat(I,'\n'))aQ:set(E)end
function C.SetInput(D,E)local G,I=az({SetInput=E},{SetInput=aw(aV)and 1 or''})assert(G,table.concat(I,'\n'))t:set(E)end
function C.Enable(D)aS:set(true)end function C.Disable(D)aS:set(false)end function C.Visible(D)aT:set(true)end function
C.Invisible(D)aT:set(false)end return C end end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons
,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=an.New,an.Children,an.Value,
an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.animate,aw.typecheck,aw.
connections,aw.customFont,aw.references,aw.drag,ac(ae.simpleElements)local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=aE.UIPadding
,aE.UICorner,aE.UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()
end,FLAG='',Default=false,LinkKeybind=true,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''
or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Default and''or'Default',af.LinkKeybind and''or
'LinkKeybind',af.IgnoreConfig and''or'IgnoreConfig',af.IgnoreConfig and''or'IgnoreConfig'})assert(aO,table.concat(aP,
'\n'))aO,aP=az(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or'Bind'})assert(aO,table.concat(aP,'\n'))local
aQ,aR,aS,aT,aU,aV,aW,b,c,d,m,n,o,p,q,r,s,t,u,v,w=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find
'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',ah.find'bindData',ah.find'toggles',ah.find
'absoluteOffset'.number,ah.add(af),af.Parent,af.Name,af.DisabledText or as'Component Disabled',af.IsEnabled or as(true),
af.Visible or as(true),af.Callback,af.Default or as(false),af.Bind,af.IgnoreConfig or as(false),af.LinkKeybind or as(
false)local A,B=(af.FLAG or as(m.uid))if ax(A)~=''then B=ak.register(ax(A),{boolean=as(false),keycode=as(nil),coordinate
=as(nil)},'toggle',ax(A)==m.uid)B.user.Value=ax(B.status.boolean)end local C=as()local function D(E:EnumItem,G:string)
local I,J=ax(aR.binds),ax(b.bindData)if table.find(I,E)then aN(('Key %s is already in use. %s'):format(E.Name,G))else
table.insert(I,E)if ax(C)then table.remove(I,table.find(I,ax(C)))J[ax(C).Name]=nil end C:set(E)J[ax(C).Name]={bind=ax(C)
,name=ax(o),boolean=B.status.boolean}b:update('bindData',J)aR:update('binds',I)B.status.keycode:set(ax(C).Name)end end
at(B.status.boolean):onChange(function()if ax(q)then task.spawn(ax(s),ax(B.status.boolean))end end)table.insert(c.list,B
.status.boolean)local E=as(ax(aQ.string)==ax(m.tab).uid)at(aQ.string):onChange(function()E:set(ax(aQ.string)==ax(m.tab).
uid)end)local G,I=ay(function()return ax(E)and 0 or 1 end,40,1),as(false)local J=am.InputBegan:Connect(function(J,K)if
ax(aV.boolean)then return end if ax(I)then if J.KeyCode and J.KeyCode~=Enum.KeyCode.Unknown then D(J.KeyCode,
'From input box')end I:set(false)task.wait()aW:update('boolean',false)else if J.KeyCode and J.KeyCode==ax(C)and not K
and not ax(aW.boolean)and ax(q)then B.status.boolean:set(not ax(B.status.boolean))end end end)aA.add(J)local K,L,M=(as(
false))M=ao'TextButton'{Visible=av(function()if not ax(q)then return ax(q)end return ax(K)end),Parent=aC.get(ax(aU.name)
),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=o
,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if L then L:Disconnect(
)L=nil B.status.coordinate:set(M.AbsolutePosition)else B.status.boolean:set(not ax(B.status.boolean))end end,[ap]={aF(4)
,aG(16),aH(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=ax(aV.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=n,Visible=av(function()if ax(aT.string)~=''and not string.
find(ax(o):lower(),ax(aT.string):lower())or not ax(r)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(q)then return true end return false end
),BackgroundTransparency=ay(function()return ax(E)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=G},ao
'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=G,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=av(function()return ax(p)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=av(function()if not ax(q)then return false end return ax(E)end),Size=av(function()return
ax(w)and UDim2.new(0.775,ax(K)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=G,[au'Activated']=function()if not ax(q)then return end B.status.boolean:set(not ax(B.status.
boolean))end,[ap]={aG(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aF(8),aI(aJ.LayoutOrder,aK.
Horizontal,aL.Left,aM.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=G,BackgroundColor3=ay(function()return ax(B.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=ay(
function()if not ax(E)then return 1 end if ax(B.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=o,TextTransparency=G,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=K,
Interactable=av(function()if not ax(q)then return false end return ax(E)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=G,[au'Activated']=function()K:set(false)B.status.coordinate:set(
nil)M.Position=UDim2.fromScale(0.5,0.5)end,[ap]={aG(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=G}}},ao'TextButton'{Visible=w,Interactable=av(function()if not ax(q)then return false end return ax(E)
end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=G,[au'Activated']=function()if
ax(aV.boolean)then K:set(true)L=aD(M,15)return end I:set(true)aW:update('boolean',true)end,[ap]={aG(6),aF(6),aI(aJ.
LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=ax(aV.boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=G},ao
'TextLabel'{Visible=not ax(aV.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum
.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=G,Text=
av(function()return ax(I)and'Listening'or ax(C)and ax(C).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(aV.boolean),Size
=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,Text=av(function()return ax(K)and'Move Bind'or'Place Bind'
end),TextTransparency=G}}}}}}}if ax(aS.boolean)and not ax(v)then B.file:Connect(function(N)local O,P=true,true if N.
boolean~=nil then B.status.boolean:set(N.boolean)O=false end if N.keycode~=nil and((ax(C)and ax(C).Name or'')~=N.keycode
)then local Q,R=pcall(function()return Enum.KeyCode[N.keycode]end)if Q then D(R,'File1')end P=false end if O then B.
status.boolean:set(ax(t))end if P then if u then D(ax(u),'NoFileFound')end end if ax(aV.boolean)and N.coordinate then M.
Position=UDim2.fromOffset(N.coordinate.X+30,N.coordinate.Y+30+ax(d))K:set(true)B.status.coordinate:set(N.coordinate)
elseif ax(aV.boolean)and not N.coordinate then K:set(false)M.Position=UDim2.fromScale(0.5,0.5)end end)if B.private then
B.status.boolean:set(ax(t))if u then D(ax(u),'Private')end end else B.status.boolean:set(ax(t))if u then D(ax(u),
'IgnoreConfig/UseConfig:false')end end if B.preregistered and B.preregisteredValue and typeof(B.preregisteredValue)==
'table'then if B.preregisteredValue.boolean and typeof(B.preregisteredValue.boolean)=='boolean'then B.status.boolean:
set(B.preregisteredValue.boolean)end if ax(w)then if not ax(aV.boolean)then if B.preregisteredValue.keycode and typeof(B
.preregisteredValue.keycode)=='string'then local N,O=pcall(function()return Enum.KeyCode[B.preregisteredValue.keycode]
end)if N then D(O,'Configuration1')end end else if B.preregisteredValue.coordinate and typeof(B.preregisteredValue.
coordinate)=='table'and B.preregisteredValue.coordinate.X and B.preregisteredValue.coordinate.Y then if typeof(B.
preregisteredValue.coordinate.X)=='number'and typeof(B.preregisteredValue.coordinate.Y)=='number'then M.Position=UDim2.
fromOffset(B.preregisteredValue.coordinate.X+30,B.preregisteredValue.coordinate.Y+30+ax(d))K:set(true)B.status.
coordinate:set(B.preregisteredValue.coordinate)end end end end end local N={}function N.SetName(O,P)local Q,R=az({
SetName=P},{SetName=''})assert(Q,table.concat(R,'\n'))o:set(P)end function N.SetValue(O,P:boolean)local Q,R=az({SetValue
=P},{SetValue=true})assert(Q,table.concat(R,'\n'))B.status.boolean:set(P)end function N.SetBind(O,P:EnumItem)assert(ax(w
),'Requires LinkKeybind')local Q,R=az({SetBind=P},{SetBind=Enum.keyCode.C})assert(Q,table.concat(R,'\n'))D(P,
'At :SetBind')end function N.Enable(O)q:set(true)end function N.Disable(O)q:set(false)end function N.Visible(O)r:set(
true)end function N.Invisible(O)r:set(false)end return N end end)()end,[81]=function()local aa,ab,ac=a(81)local ad
return(function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab
.Parent.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList'
,Title=af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag
end)()end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...)local ae=ab.Parent.Parent return function(af,
ag)local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,
ah.Fusion local ao,ap,as,at,au,av,aw,ax=an.New,an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.
simpleElements)local ay,az,aA,aB,aC,aD,aE,aF,aG=ax.UIListLayout,ax.UICorner,ax.UITextSizeConstraint,ax.UIPadding,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aH,aI,aJ,aK,aL,aM,aN,
aO,aP,aQ,aR,aS,aT=aG.get,aG.references,aG.drag,aG.customFont,aG.animate,aG.connections,ac(ab.Parent.Parent.components.
warn)[1],as(),as(),as(),as(),as(),as()aI.add(aS,aR,aQ,aP,aO,aT)local aU,aV,aW,b,c,d,m,n,o,p,q,r,s,t,u,v=am.find
'absoluteOffset',am.find'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible'
,am.find'isMobile',am.find'isListening',am.find'bindData',am.find'destroyFunc'.func,as(750),as(500),as(false),as(false),
as(false),as(false)av(s):onChange(function()if aH(s)then t:set(not aH(t))task.wait(0.3)u:set(not aH(u))task.wait(0.3)v:
set(not aH(v))else v:set(not aH(v))task.wait(0.3)u:set(not aH(u))task.wait(0.3)t:set(not aH(t))end end)av(u):onChange(
function()q:set(aH(u)and 212 or 750)end)av(v):onChange(function()r:set(aH(v)and 74 or 500)end)local w,A,B=as(false),as()
,as(false)local function C(D:EnumItem,E:string)local G,I=aH(c.binds),aH(o.bindData)if table.find(G,D)then aN((
'Key %s is already in use. %s'):format(D.Name,E))else table.insert(G,D)if aH(A)then table.remove(G,table.find(G,aH(A)))I
[aH(A).Name]=nil end A:set(D)B:set(true)I[aH(A).Name]={bind=aH(A),name='Toggle Interface'}o:update('bindData',I)c:
update('binds',G)end end if not aH(m.boolean)then C(af.HideBind,'init')end local D=as''av(aW.string):onChange(function()
local E=aH(aW.string)local G=am.find(E)D:set(aH(G.Name):upper())end)local E,G,I=(as(af.Icon or''))local J=ao'ScreenGui'{
Name=aH(aV.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[at]=aS,[ap]={ao'Frame'{Name=
'screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},ao'Frame'{Name='container',Visible=d.boolean,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aH(aU.number)),Size=aL(function()return UDim2.fromOffset(
aH(q),aH(r))end,30,1),BackgroundColor3=ak.background,[at]=aO,[ap]={az(6),aB(16),ay(aC.LayoutOrder,aD.Horizontal,aE.Right
,aF.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=aL(function()return UDim2.new(0,math.
clamp(aH(q)-32-180-16,212,9e9),aH(t)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao
'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=D,TextXAlignment=
Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=aK('Montserrat',Enum.FontWeight.ExtraBold),
TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},
ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.
new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.
Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.Horizontal,
aE.Left,aF.Top,UDim.new(0,5)),ao'ImageLabel'{Visible=au(function()if aH(E)~=''then return true end return false end),
Size=UDim2.fromOffset(44,44),BackgroundTransparency=1,Image=E,ImageColor3=ak.text2},ao'Frame'{Size=au(function()if aH(E)
~=''then return UDim2.new(1,-49,1,0)end return UDim2.new(1,0,1,0)end),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,
aD.Vertical,aE.Left,aF.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,
FontFace=aK('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.
TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=ak.text2,FontFace=aK(
'Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left}}}}}
,ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[aw'Activated']=function()local J=aH(aT)if
J then J:CaptureFocus()end end,[ap]={aB(0,4),az(6),ay(aC.LayoutOrder,aD.Horizontal,aE.Center,aF.Center,UDim.new(0,4)),ao
'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{
Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aK('Montserrat',Enum.FontWeight.Bold),
PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,[aw'Changed']=function(J)local K=aH(aT)if J~='Text'and K and K.Text then return
end b:update('string',K.Text)end,[at]=aT}}}}},ao'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),
BackgroundTransparency=1,[at]=aQ}}}}},ao'Frame'{Size=aL(function()return aH(v)and UDim2.new(0,180,0,44)or UDim2.new(0,
180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={az(6),ay(aC.LayoutOrder,aD.Vertical,aE.
Center,aF.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.
Horizontal,aE.Center,aF.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,
[aw'Activated']=function()if aH(m.boolean)then B:set(true)I=aJ(G,15)return end w:set(true)n:update('boolean',true)end,[
ap]={az(6),aB(6),ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.
fromOffset(20,20),BackgroundTransparency=1,Image=aH(m.boolean)and al.finger or al.command,ImageColor3=ak.text2,
ImageTransparency=0},ao'TextLabel'{Visible=not aH(m.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.
text2,Text=au(function()return aH(w)and'Listening'or aH(A)and aH(A).Name or'Waiting'end)},ao'TextLabel'{Visible=aH(m.
boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextScaled=
true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=au(function()return aH(B)and'Move Bind'or
'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[aw'Activated']=function
()s:set(not aH(s))end,[ap]={az(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=au(function()return aH(s)and al.minimize or al.maximize end),
ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,
[aw'Activated']=function()if not aH(B)then ac(ae.components.notification){Parent=aR,Title='Darius Interface',Body=`You must {
aH(m.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,Duration=5,Image=al.alert,ImageColor=ak.get
'red'}return end d:update('boolean',not aH(d.boolean))end,[ap]={az(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=al.close,ImageColor3=ak.
orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name='tabButtonList',Size=aL(function()return aH(v)and UDim2.new(1,0,
0,0)or UDim2.new(1,0,1,-90)end,30,1),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=true,[at]=aP,[ap]={ay(aC.LayoutOrder,aD.Vertical,aE.Left,aF.
Top,UDim.new(0,6)),aB(0,10)}},ao'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[aw'Activated']=
function()aH(p)()end,[ap]={az(4),aB(6),ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,4)),ao'ImageLabel'{
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao
'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,
Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,
Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[at]=aR,[
ap]={ay(aC.LayoutOrder,aD.Vertical,aE.Right,aF.Bottom)}}}}if J.screenSize.AbsoluteSize.X<aH(q)then q:set(J.screenSize.
AbsoluteSize.X*0.9)end if J.screenSize.AbsoluteSize.Y<aH(r)then r:set(J.screenSize.AbsoluteSize.Y*0.9)end G=ao
'TextButton'{Visible=au(function()return(aH(B)and aH(m.boolean))end),Interactable=au(function()return(aH(B)and aH(m.
boolean))end),Parent=aI.get(aH(aV.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text='Toggle UI',FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.
mobileButtonText,BackgroundColor3=ak.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[aw
'Activated']=function()if I then I:Disconnect()I=nil else d:update('boolean',not aH(d.boolean))end end,[ap]={aB(4),az(16
),aA(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=aH(m.boolean)and al.finger or al.command,ImageColor3=ak.
mobileButtonImage,ImageTransparency=0.8}}}local K=aj.InputBegan:Connect(function(K,L)if aH(m.boolean)then return end if
aH(w)then if K.KeyCode and K.KeyCode~=Enum.KeyCode.Unknown then C(K.KeyCode,'From input box')end w:set(false)task.wait()
n:update('boolean',false)else if K.KeyCode and K.KeyCode==aH(A)and not L and not aH(n.boolean)then d:update('boolean',
not aH(d.boolean))end end end)aM.add(K)local L=aJ(aI.get'container',15)aM.add(aI.get'container':GetPropertyChangedSignal
'Position':Connect(function()local M=aI.get'container'local N,O=M.AbsolutePosition+Vector2.new(aH(q)/2,aH(r)/2),J.
screenSize.AbsoluteSize local P,Q,R,S=O.X+(aH(s)and aH(q)/4 or(aH(q)/6)*2.5),O.Y+(aH(s)and aH(r)/8 or(aH(r)/6)*2.3),
false,''if N.X>P or O.X-N.X>P then R=true S='x'end if N.Y+aH(aU.number)>Q or O.Y-N.Y-aH(aU.number)>Q then R=true S='y'
end if R and S=='x'then L:Disconnect()M.Position=UDim2.new(0.5,0,M.Position.Y.Scale,M.Position.Y.Offset)L=aJ(aI.get
'container',15)elseif R and S=='y'then L:Disconnect()M.Position=UDim2.new(M.Position.X.Scale,M.Position.X.Offset,0.5,aH(
aU.number))L=aJ(aI.get'container',15)end end))end end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(
...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error(
'no utility: '..af)end end})end)()end,[85]=function()local aa,ab,ac=a(85)local ad return(function(...)local ae=ac(ab.
Parent.Parent.Bundles).Fusion return function(af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType
.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,
DominantAxis=ah}end end)()end,[86]=function()local aa,ab,ac=a(86)local ad return(function(...)local ae=ac(ab.Parent.
Parent.Bundles).Fusion return function(af,ag)ag=ag or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()
end,[87]=function()local aa,ab,ac=a(87)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return
function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.
FillDirection.Vertical,HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,VerticalAlignment=ai or Enum.
VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(
function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(...)local af={...}if#af==1 then return ae.New
'UIPadding'{PaddingTop=typeof(...)=='number'and UDim.new(0,...)or...,PaddingRight=typeof(...)=='number'and UDim.new(0,
...)or...,PaddingBottom=typeof(...)=='number'and UDim.new(0,...)or...,PaddingLeft=typeof(...)=='number'and UDim.new(0,
...)or...}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],
PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[1])=='number'and UDim.new(0,af
[1])or af[1],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}elseif#af==3 then return ae.New'UIPadding'
{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2
])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[2])=='number'and
UDim.new(0,af[2])or af[2]}else return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],
PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af
[3])or af[3],PaddingLeft=typeof(af[4])=='number'and UDim.new(0,af[4])or af[4]}end end end)()end,[89]=function()local aa,
ab,ac=a(89)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af:number?,ag:
number?)return ae.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[90]=function()local aa,ab,ac=a(
90)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab
[af])else error('no utility: '..af)end end})end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)
local ae=ac(ab.Parent.Parent.Bundles).Fusion local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah)
,ai,aj)end end)()end,[92]=function()local aa,ab,ac=a(92)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.
Parent.Bundles.services)function af.add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do if
typeof(ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil end end return af end)()end,[93]=function()local aa,ab
,ac=a(93)local ad return(function(...)local ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}
return function(af:string,ag:Enum.FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.
Regular ah=ah or Enum.FontStyle.Normal if ae[af]then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)(
)end,[94]=function()local aa,ab,ac=a(94)local ad return(function(...)local ae,af={},{}function ae.cloneref(ag)if
cloneref then return cloneref(ag)else return ag end end function ae.printFileSystem()print(af)end function ae.gethui(...
)return gethui(...)or nil end ae.getgenv=getgenv or nil function ae.isfile(ag:string)if isfile then return isfile(ag)
else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end
else ah=ah[ag]if ah==nil then ai=true end end if ai then return false end return true end end function ae.isfolder(ag:
string)if isfolder then return isfolder(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak in ag:split'/'do ah=ah[
ak]if ah==nil then ai=true break end end else ah=ah[ag]if ah==nil then ai=true end end if ai then return false end
return true end end function ae.writefile(ag:string,ah:string)if writefile then return writefile(ag,ah)else local ai=af
for aj,ak in ag:split'/'do if typeof(ai[ak])=='table'then ai=ai[ak]elseif(typeof(ai[ak])=='string'or typeof(ai[ak])==
'nil')then ai[ak]=ah end end end end function ae.delfile(ag:string)if delfile then return delfile(ag)else local ah=af
local ai,aj=ah,ag:split'/'for ak,al in aj do ah=ah[al]if typeof(ah)=='string'then ai[al]=nil else ai=ah end end end end
function ae.readfile(ag:string)if readfile then return readfile(ag)else local ah,ai=af,false if ag:find'/'then for aj,ak
in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai then warn'readfile: no file'
return nil end return ah end end function ae.makefolder(ag:string)if makefolder then return makefolder(ag)else local ah=
af if ag:find'/'then for ai,aj in ag:split'/'do if not ah[aj]then ah[aj]={}break else ah=ah[aj]end end else ah[ag]={}end
end end function ae.listfiles(ag:string)if listfiles then return listfiles(ag)else local ah,ai=af,false if ag:find'/'
then for aj,ak in ag:split'/'do ah=ah[ak]if ah==nil then ai=true break end end else ah=ah[ag]end if ai or typeof(ah)==
'string'then warn'no folder exists'return nil end local aj={}for ak,al in ah do if typeof(al)=='string'then table.
insert(aj,`{ag}/{ak}`)end end return aj end end function ae.getthreadidentity()if getthreadidentity then return
getthreadidentity()else return 5 end end function ae.setthreadidentity(ag:number)if setthreadidentity then return
setthreadidentity(ag)else return 5 end end return ae end)()end,[95]=function()local aa,ab,ac=a(95)local ad return(
function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao
=ag.UserInputService,ag.RunService,ae local function ap(as,at,au)return as+(at-as)*au end local as=Instance.new
'BindableEvent'local function at(au)if not(ao)then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(
ak.Position.X.Offset,an.X.Offset,au*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,an.Y.Offset,au*ah))return end local av=(am-ai
:GetMouseLocation())local aw,ax=(ao.X.Offset-av.X),(ao.Y.Offset-av.Y)an=UDim2.new(ao.X.Scale,aw,ao.Y.Scale,ax)ak.
Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,aw,au*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,ax,au*ah))end ak.
InputBegan:Connect(function(au)if au.UserInputType==Enum.UserInputType.MouseButton1 or au.UserInputType==Enum.
UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()au.Changed:Connect(function()if au.
UserInputState==Enum.UserInputState.End then as:Fire()al=false end end)end end)local au=aj.Heartbeat:Connect(at)return
au,as.Event end end)()end,[96]=function()local aa,ab,ac=a(96)local ad return(function(...)return function(ae,af)if
typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[97]=function()local aa,ab,ac=
a(97)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new'GetTextBoundsParams'ag.
Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.services).TextService
return ah:GetTextBoundsAsync(ag)end end)()end,[98]=function()local aa,ab,ac=a(98)local ad return(function(...)local ae=
string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then
return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[99]=function()local aa,ab,ac=a(99)local
ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles).Fusion.Observer,ac(ab.Parent.get)function af
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
'Darius'},{{90,2,{'utilities'},{{99,2,{'references'}},{98,2,{'randomString'}},{101,2,{'typecheck'}},{94,2,{
'customFunctions'}},{93,2,{'customFont'}},{97,2,{'getStringBounds'}},{91,2,{'animate'}},{92,2,{'connections'}},{100,2,{
'tween'}},{95,2,{'drag'}},{96,2,{'get'}}}},{84,2,{'simpleElements'},{{89,2,{'UITextSizeConstraint'}},{87,2,{
'UIListLayout'}},{85,2,{'UIAspectRatioConstraint'}},{86,2,{'UICorner'}},{88,2,{'UIPadding'}}}},{64,1,{'components'},{{67
,2,{'colorpicker'}},{72,2,{'label'}},{66,2,{'buttonGroup'}},{69,2,{'dropdown'}},{70,2,{'keybind'}},{68,2,{'divider'}},{
71,2,{'keybindList'}},{80,2,{'toggle'}},{78,2,{'tabFrame'}},{77,2,{'tabButton'}},{73,2,{'module'}},{81,2,{'warn'}},{79,2
,{'textbox'}},{65,2,{'button'}},{76,2,{'slider'}},{75,2,{'paragraph'}},{74,2,{'notification'}}}},{82,1,{'layouts'},{{83,
2,{'main'}}}},{2,2,{'Bundles'},{{3,2,{'Fusion'},{{16,1,{'Dependencies'},{{17,2,{'captureDependencies'}},{19,2,{
'sharedState'}},{21,2,{'useDependency'}},{20,2,{'updateAll'}},{18,2,{'initDependency'}}}},{48,2,{'Types'}},{39,2,{
'PubTypes'}},{40,1,{'State'},{{41,2,{'Computed'}},{47,2,{'unwrap'}},{45,2,{'Observer'}},{44,2,{'ForValues'}},{46,2,{
'Value'}},{42,2,{'ForKeys'}},{43,2,{'ForPairs'}}}},{22,1,{'Instances'},{{32,2,{'defaultProps'}},{25,2,{'Hydrate'}},{23,2
,{'Children'}},{24,2,{'Cleanup'}},{29,2,{'Out'}},{31,2,{'applyInstanceProps'}},{28,2,{'OnEvent'}},{26,2,{'New'}},{30,2,{
'Ref'}},{27,2,{'OnChange'}}}},{49,1,{'Utility'},{{56,2,{'xtypeof'}},{52,2,{'doNothing'}},{51,2,{'cleanup'}},{53,2,{
'isSimilar'}},{54,2,{'needsDestruction'}},{55,2,{'restrictRead'}},{50,2,{'None'}}}},{33,1,{'Logging'},{{36,2,{'logWarn'}
},{38,2,{'parseError'}},{34,2,{'logError'}},{37,2,{'messages'}},{35,2,{'logErrorNonFatal'}}}},{14,1,{'Colour'},{{15,2,{
'Oklab'}}}},{4,1,{'Animation'},{{10,2,{'lerpType'}},{8,2,{'TweenScheduler'}},{13,2,{'unpackType'}},{5,2,{'Spring'}},{12,
2,{'springCoefficients'}},{6,2,{'SpringScheduler'}},{7,2,{'Tween'}},{9,2,{'getTweenRatio'}},{11,2,{'packType'}}}}}},{57,
2,{'data'}},{62,2,{'themeSystem'},{{63,2,{'default'}}}},{61,2,{'services'}},{59,2,{'icons'}},{60,2,{'lucide'}},{58,2,{
'flags'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall
,tostring,tonumber,_VERSION local aw,ax,ay,az,aA,aB,aC=aj.insert,aj.remove,aj.freeze or function(aw)return aw end,al.
wrap,ae.sub,ae.match,ae.gmatch if au and aA(au,1,4)=='Lune'then local aD,aE=ap(ao,'@lune/task')if aD and aE then af=aE
end end local aD=af and af.defer local aE,aF,aG,aH,aI,aJ,aK,aL,aM=aD or function(aE,...)az(aE)(...)end,{[1]='Folder',[2]
='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local aN,aO={GetFullName={{},
function(aN)local aO,aP=aN.Name,aN.Parent while aP do aO=aP.Name..'.'..aO aP=aP.Parent end return aO end},GetChildren={{
},function(aN)local aO={}for aP in ai,aM[aN]do aw(aO,aP)end return aO end},GetDescendants={{},function(aN)local aO={}for
aP in ai,aM[aN]do aw(aO,aP)for aQ,aR in ai,aP:GetDescendants()do aw(aO,aR)end end return aO end},FindFirstChild={{
'string','boolean?'},function(aN,aO,aP)local aQ=aM[aN]for aR in ai,aQ do if aR.Name==aO then return aR end end if aP
then for aS in ai,aQ do return aS:FindFirstChild(aO,true)end end end},FindFirstAncestor={{'string'},function(aN,aO)local
aP=aN.Parent while aP do if aP.Name==aO then return aP end aP=aP.Parent end end},WaitForChild={{'string','number?'},
function(aN,aO)return aN:FindFirstChild(aO)end}},{}for aP,aQ in ai,aN do local aR,aS,aT=aQ[1],aQ[2],{}for aU,aV in ai,aR
do local aW,b=aB(aV,'^([^%?]+)(%??)')aT[aU]={aW,b}end aO[aP]=function(aW,...)if not aM[aW]then ah(
"Expected ':' not '.' calling member function "..aP,2)end local b={...}for c,d in ai,aT do local m=b[c]local n,o,p=an(m)
,d[1],d[2]if m==nil and not p then ah('Argument '..m..' missing or nil',3)end if o~='any'and n~=o and not(n=='nil'and p)
then ah('Argument '..c..' expects type "'..o..'", got "'..n..'"',2)end end return aS(aW,...)end end local function aR(aS
,aT,aU)local aV,aW=(ag({},{__mode='k'}))local function b(c)ah(c..' is not a valid (virtual) member of '..aS..' "'..aT..
'"',3)end local function c(d)ah('Unable to assign (virtual) property '..d..'. Property is read only',3)end local d,m={},
{}m.__metatable=false m.__index=function(n,o)if o=='ClassName'then return aS elseif o=='Name'then return aT elseif o==
'Parent'then return aU elseif aS=='StringValue'and o=='Value'then return aW else local p=aO[o]if p then return p end end
for p in ai,aV do if p.Name==o then return p end end b(o)end m.__newindex=function(n,o,p)if o=='ClassName'then c(o)
elseif o=='Name'then aT=p elseif o=='Parent'then if p==d then return end if aU~=nil then aM[aU][d]=nil end aU=p if p~=
nil then aM[p][d]=true end elseif aS=='StringValue'and o=='Value'then aW=p else b(o)end end m.__tostring=function()
return aT end ag(d,m)aM[d]=aV if aU~=nil then aM[aU][d]=true end return d end local function aS(aT,aU)local aV,aW,b,c=aT
[1],aT[2],aT[3],aT[4]local d=aF[aW]local m=b and ax(b,1)or d local n=aR(d,m,aU)aG[aV]=n if b then for o,p in ai,b do n[o
]=p end end if c then for o,p in ai,c do aS(p,n)end end return n end local aT=aR('Folder','['..ad..']')for aU,aV in ai,
ab do aS(aV,aT)end for aW,b in ai,aa do local c=aG[aW]aH[c]=b aI[c]=aW local d=c.ClassName if d=='LocalScript'or d==
'Script'then aw(aK,c)end end local function c(d)local m,n=d.ClassName,aJ[d]if n and m=='ModuleScript'then return ak(n)
end local o=aH[d]local function p(q)q=as(q)local r,s,t=d:GetFullName(),aB(q,'[^:]+:(%d+): (.+)')if not s or not av then
return r..':*: '..(t or q)end s=at(s)local u=aI[d]local v=av[u]local w=s-v+1 if w<0 then w='?'end return r..':'..w..': '
..t end if m=='LocalScript'or m=='Script'then local q,r=ap(o)if not q then ah(p(r),0)end else local q={ap(o)}local r=ax(
q,1)if not r then local s=ax(q,1)ah(p(s),0)end aJ[d]=q return ak(q)end end function a(d)local m=aG[d]local function n(o,
...)local p={ap(o,...)}local q=ax(p,1)if not q then ah(p[1],3)end return ak(p)end local o=ay(ag({},{__index=aL,
__newindex=function(o,p,q)aL[p]=q end,__len=function()return#aL end,__iter=function()return ai,aL end}))local p,q=ay{
version=ac,envname=ad,shared=o,script=am,require=ao},m local function r(s,...)local t,u,v=an(s),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if t=='table'and aM[s]then if s
.ClassName~='ModuleScript'then ah(u,2)elseif s==m then ah(v,2)end return c(s)elseif t=='string'and aA(s,1,1)~='@'then if
#s==0 then ah('Attempted to call require with empty string',2)end local w=m if aA(s,1,1)=='/'then w=aT elseif aA(s,1,2)
=='./'then s=aA(s,3)end local A for B in aC(s,'([^/]*)/?')do local C=B if B=='..'then C='Parent'end if C~=''then local D
=w:FindFirstChild(C)if not D then local E=w.Parent if E then D=E:FindFirstChild(C)end end if D then w=D elseif B~=A and
B~='init'and B~='init.server'and B~='init.client'then ah('Virtual script path "'..s..'" not found',2)end end A=B end if
w.ClassName~='ModuleScript'then ah(u,2)elseif w==m then ah(v,2)end return c(w)end return n(ao,s,...)end return p,q,r end
for d,m in ai,aK do aE(c,m)end return c(aT:GetChildren()[1])