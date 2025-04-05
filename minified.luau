local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,as,at,au,av={function()local b,c,d=a(1)local e return(
function(...)local f=d(c.Bundles)local g,h,i,j=f.data,f.icons,f.themeSystem,f.services local k,l=j.HttpService,f.Fusion
local m,n=l.Observer,d(c.utilities)local o,p,q,r,s,t,u,v,w=n.references,n.connections,n.customFunctions,n.randomString,n
.get,n.typecheck,d(c.layouts.main),d(c.Bundles.flags),d(c.components.warn)[2]local function x(y,z,A)A.Parent=z return d(
c.components[y])(A)end local y={}function y.Window(z,A)if q.getgenv then if q.getgenv().dariusInstance then p:
deleteConnections()o:clear()q.getgenv().dariusInstance=nil end else if _G.dariusInstance then p:deleteConnections()o:
clear()_G.dariusInstance=nil end end local B,C=t(A,{Title='',Description='',Icon='',HideBind=Enum.KeyCode.T,UseConfig=
false,IsMobile=false,Offset=0,Theme={},Workspace='',noOffset=false,Parent=Instance.new'Part'},{A.Icon and''or'Icon',A.
noOffset and''or'noOffset',A.IsMobile and''or'IsMobile',A.UseConfig and''or'UseConfig',A.Theme and''or'Theme',A.Parent
and''or'Parent',A.Offset and''or'Offset'})assert(B,table.concat(C,'\n'))w(A.Title)g.add({string=''},'selectedTab')g.add(
{boolean=false},'isFirst')local D=g.add({tbl={}},'setTheme')g.add({number=A.noOffset and 0 or 58},'absoluteOffset')g.
add({name=r(32)},'instanceName')g.add({binds={}},'currentBinds')g.add({bindData={}},'bindData')g.add({string=''},
'searchText')local E=g.add({list={}},'toggles',true)g.add({module=function()end},'currentPicker')g.add({module=function(
)end},'currentPicker')g.add({boolean=true},'isVisible')g.add({boolean=A.IsMobile},'isMobile')g.add({boolean=false},
'isListening')local F,G,H,I,J,K,L=g.add({func=function()end},'destroyFunc'),g.find'flags',g.add({boolean=false},
'configLoaded'),g.add({boolean=false},'useConfig'),g.add{data=A},{'darius',`/{A.Workspace}`},''for M=1,#K do L=L..K[M]if
not q.isfolder(L)then q.makefolder(L)end end v.path=`darius/{A.Workspace}`K={'darius',`/themes`}L=''for M=1,#K do L=L..K
[M]if not q.isfolder(L)then q.makefolder(L)end end i.path=`darius/themes`y.Folder=`darius/{A.Workspace}`i.init()local M=
i.getTheme().uid if A.Theme then B,C=t(A.Theme,{Name='',Colors={}})assert(B,table.concat(C,'\n'))D:update('tbl',A.Theme)
task.wait()i.set(i.create(A.Theme.Name,A.Theme.Colors,nil,nil,true))end v.init()local N if A.UseConfig then I:update(
'boolean',A.UseConfig)end y.flags={}setmetatable(y.flags,{__index=function(O,P)local Q=s(G.list)if Q[P]then return Q[P].
user else return v.preregister(P).user end return nil end})local O=l.New'BindableEvent'{}y.OnDestruction=O.Event u(A,O)
local P,Q=o.get'tabButtonList',o.get'tabFrameList'F:update('func',function()y.Destroyed=true O:Fire()for R,S in E.list
do S:set(false)end task.wait(0.1)p:deleteConnections()o:clear()O:Destroy()end)y[J.uid]={}local R=y[J.uid]function R.Tab(
S,T)local U=x('tabButton',P,T)local V=x('tabFrame',Q,{uid=U.uid})R[U.uid]={}local W=R[U.uid]function W.Button(X,Y)Y.tab=
U return x('button',V,Y)end function W.Toggle(X,Y)Y.tab=U return x('toggle',V,Y)end function W.Dropdown(X,Y)Y.tab=U
return x('dropdown',V,Y)end function W.Label(X,Y)return x('label',V,{tab=U,Text=Y})end function W.Paragraph(X,Y)Y.tab=U
return x('paragraph',V,Y)end function W.TextBox(X,Y)Y.tab=U return x('textbox',V,Y)end function W.Slider(X,Y)Y.tab=U
return x('slider',V,Y)end function W.Keybind(X,Y)Y.tab=U return x('keybind',V,Y)end function W.Divider(X)return x(
'divider',V,{tab=U})end function W.ColorPicker(X,Y)Y.tab=U return x('colorpicker',V,Y)end function W.KeybindList(X)
return x('keybindList',V,{tab=U})end function W.ButtonGroup(X)return x('buttonGroup',V,{tab=U})end return R[U.uid]end y.
Destroyed=false function y.Notify(S,T)return x('notification',o.get'notificationList',T)end function y.Destroy(S)y.
Destroyed=true O:Fire()for T,U in E.list do U:set(false)end task.wait(0.1)p:deleteConnections()o:clear()O:Destroy()end
function y.SetTheme(S,T)local U,V=t({['New Theme']=T},{['New Theme']=''})assert(U,table.concat(V,'\n'))if i.find(T)then
i.set(T)end end function y.GetThemeUID(S)return i.getTheme().uid end function y.ImportTheme(S,...)local T={...}if#T==1
then B,C=t(T,{[1]={}},{})assert(B,table.concat(C,'\n'))return i.create(`Import_{r(5)}`,T[1])elseif#T==2 then B,C=t(T,{[1
]='',[2]={}},{})assert(B,table.concat(C,'\n'))return i.create(T[1],T[2])end end function y.ExportTheme(S)return i.
export()end function y.SetConfiguration(S,T)v.set(T)end function y.GetConfigurationUID(S)return v.getConfig().uid end
function y.ImportConfiguration(S,...)local T={...}if#T==1 then B,C=t(T,{[1]={}},{})assert(B,table.concat(C,'\n'))return
v.create(`Import_{r(5)}`,nil,nil,T[1])elseif#T==2 then B,C=t(T,{[1]='',[2]={}},{})assert(B,table.concat(C,'\n'))return v
.create(T[1],nil,nil,T[2])end end function y.ExportConfiguration(S)return v.export()end function y.CreateSettings(S)
local T=R:Tab{Name='Settings',Image=h.cog}do local U,V,W,X=i.getTheme().palette,{},{},{}table.foreach(U,function(Y)table
.insert(W,Y)end)table.foreach(i.getThemes(),function(Y,Z)table.insert(X,{DisplayValue=Z.name,Value=Z.uid})end)local Y,Z,
_,aa,ab,ac,ad,ae,af,ag='',false,false local function ah(ai)if ai then ac:Visible()aa:Visible()if _ then ab:Visible()end
if i.getTheme().uid~='original'then af:Visible()ag:Visible()else af:Invisible()ag:Invisible()end else ab:Invisible()aa:
Invisible()ac:Invisible()af:Invisible()ag:Invisible()end end local ai=T:Dropdown{Name='Current Theme',Items=X,Default=i.
getTheme().uid,Callback=function(ai)i.set(ai)if aa and Y~=''then aa:SetColor(i.get(Y))end if ai=='original'and ad then
ad:Disable()elseif ai~='original'and ad then ad:Enable()end if ai=='original'and ae then ae:Disable()elseif ai~=
'original'and ae then ae:Enable()end if ag then ah(Z)end end}local function aj(ak:string?)table.clear(X)table.foreach(i.
getThemes(),function(al,am)table.insert(X,{DisplayValue=am.name,Value=am.uid})end)ai:SetItems(X)if ak then ai:
SelectItem(ak)end end i.onChange(function()ai:SelectItem(i.getTheme().uid)table.clear(V)table.foreach(i.getTheme().
palette,function(ak,al)V[ak]=al end)end)i.onCreate(function()aj()end)local ak,al,am,an,ao=T:ButtonGroup(),false
local function ap(aq)if aq then am:Visible()an:Visible()ao:Visible()else am:Invisible()an:Invisible()ao:Invisible()end
end ak:Button{Name='Edit',Callback=function()al=false ap(false)Z=not Z ah(Z)end}ac=T:Dropdown{Name='Colors',Visible=
false,Items=W,Callback=function(aq)Y=aq aa:SetColor(i.get(Y))aa:Enable()aa:SetName(`Editing: {Y}`)end}aa=T:ColorPicker{
Name='Editing Color: ',IsEnabled=false,Visible=false,DisabledText='Select Color First!',HideTransparency=true,Callback=
function(aq)local ar=i.getTheme().palette if ar[Y]:ToHex()~=aq:ToHex()then _=true ab:Visible()else ab:Invisible()_=false
end i.edit(Y,aq)end}ab=T:Button{Name='Reset Color',Visible=false,Callback=function()_=false aa:SetColor(V[Y])ab:
Invisible()end}local aq=''af=T:TextBox{Name='New Name',Visible=false,Callback=function(ar)aq=ar end}ag=T:Button{Name=
'Set Name',Visible=false,Callback=function()i.editTheme(i.getTheme().uid,'name',aq)aj()af:SetInput''end}local ar=''ak:
Button{Name='Create',Callback=function()Z=false ah(false)al=not al ap(al)end}am=T:TextBox{Name='Name your theme',Visible
=false,Callback=function(as)ar=as end}an=T:Button{Name='Create theme',Visible=false,Callback=function()if ar==''then y:
Notify{Title=A.Title,Body='Theme name cannot be empty!',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end local
as=i.create(ar,i.getColors())local at={i.set(as)}if at[1]then aj(as)al=false ap(al)end end}ao=T:Button{Name='Cancel',
Visible=false,Callback=function()al=false ap(al)am:SetInput''end}ae=ak:Button{Name='Save',DisabledText='Disabled',
Callback=function()local as=i.save(i.getTheme().uid)if as then task.wait()local at=i.getTheme().palette if at[Y]:ToHex()
~=V[Y]:ToHex()then _=true ab:Visible()else ab:Invisible()_=false end y:Notify{Title=A.Title,Body=`Saved theme with uid "{
i.getTheme().uid}"`,Duration=3,Image=h.check}else y:Notify{Title='Theme Manager Error',Body=`Couldn't find/save theme with uid "{
i.getTheme().uid}"`,Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ad=ak:Button{Name='Delete',DisabledText=
'Disabled',Callback=function()local as={i.find(i.getTheme().uid)}if as[1]then local at=as[2]i.delete(at.uid)aj(M)y:
Notify{Title=A.Title,Body=`Deleted theme with uid "{at.uid}"`,Duration=3,Image=h.check}else y:Notify{Title=
'Theme Manager Error',Body=`Couldn't find theme with uid "{i.getTheme().uid}"`,Duration=3,Image=h.alert,ImageColor=i.get
'red'}end end}end T:Divider()do local aa={}table.foreach(v.getConfigs(),function(ab,ac)table.insert(aa,{DisplayValue=ac.
name,Value=ac.uid})end)local ab=''local ac,ad=T:Dropdown{Name='Configs',Items=aa,AlwaysOpen=true,Callback=function(ac)ab
=ac end},T:ButtonGroup()ad:Button{Name='Load',Callback=function()if ab~=''then v.set(ab)local ae=v.find(ab)y:Notify{
Title=A.Title,Body=`Set configuration to "{ae.name}"`,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error'
,Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}local function ae(af)table.
clear(aa)table.foreach(v.getConfigs(),function(ag,ah)table.insert(aa,{DisplayValue=ah.name,Value=ah.uid})end)ac:
SetItems(aa)if af then ac:SelectItem(af)end end v.onCreate(ae)v.onSelect(ae)local af,ag,ah,ai=''ad:Button{Name='Create',
Callback=function()ad:Invisible()ac:Invisible()ag:Visible()ah:Visible()ai:Visible()end}ag=T:TextBox{Visible=false,Name=
'Name your configuration',Callback=function(aj)af=aj end}ah=T:Button{Visible=false,Name='Complete new configuration',
Callback=function()if af~=''then v.create(af,nil,false,nil)ae()ad:Visible()ac:Visible()ag:Invisible()ah:Invisible()ai:
Invisible()y:Notify{Title=A.Title,Body=`Created "{af}"`,Duration=3,Image=h.check}ag:SetInput''else y:Notify{Title=
'Configuration Error',Body='Name cannot be empty',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ai=T:Button{
Visible=false,Name='Cancel',Callback=function()ad:Visible()ac:Visible()ag:Invisible()ah:Invisible()ai:Invisible()ag:
SetInput''end}ad:Button{Name='Save',Callback=function()if ab~=''then v.save(ab)local aj=v.find(ab)y:Notify{Title=A.Title
,Body=`Saved configuration "{aj.name}"`,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ad:Button{Name='Delete',Callback=
function()if ab==''then y:Notify{Title='Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,
ImageColor=i.get'red'}return end v.delete(ab)ae()end}end end if q.getgenv then q.getgenv().dariusInstance=y else _G.
dariusInstance=y end return y[J.uid]end return y end)()end,function()local aa,ab,ac=a(2)local ad return(function(...)
return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no bundle: '..
af)end end})end)()end,function()local aa,ab,ac=a(3)local ad return(function(...)local ae,af=ac(ab.PubTypes),ac(ab.
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
speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->(),doNothing:(...any)->()}return af('Fusion',{version={major
=0,minor=2,isRelease=true},New=ac(ab.Instances.New),Hydrate=ac(ab.Instances.Hydrate),Ref=ac(ab.Instances.Ref),Out=ac(ab.
Instances.Out),Cleanup=ac(ab.Instances.Cleanup),Children=ac(ab.Instances.Children),OnEvent=ac(ab.Instances.OnEvent),
OnChange=ac(ab.Instances.OnChange),Value=ac(ab.State.Value),Computed=ac(ab.State.Computed),ForPairs=ac(ab.State.ForPairs
),ForKeys=ac(ab.State.ForKeys),ForValues=ac(ab.State.ForValues),Observer=ac(ab.State.Observer),Tween=ac(ab.Animation.
Tween),Spring=ac(ab.Animation.Spring),cleanup=ac(ab.Utility.cleanup),doNothing=ac(ab.Utility.doNothing)})::Fusion end)()
end,[5]=function()local aa,ab,ac=a(5)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,
am,an,ao,ap,aq=ac(ae.PubTypes),ac(ae.Types),ac(ae.Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Animation.
unpackType),ac(ae.Animation.SpringScheduler),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.updateAll),ac(ae.Utility.xtypeof),ac(ae.State.unwrap),{}local ar,as={__index=aq},{__mode='k'}function aq.
get(at,b:boolean?):any if b~=false then al(at)end return at._currentValue end function aq.setPosition(at,b:PubTypes.
Animatable)local c=typeof(b)if c~=at._currentType then ah('springTypeMismatch',nil,c,at._currentType)end at.
_springPositions=aj(b,c)at._currentValue=b ak.add(at)an(at)end function aq.setVelocity(at,b:PubTypes.Animatable)local c=
typeof(b)if c~=at._currentType then ah('springTypeMismatch',nil,c,at._currentType)end at._springVelocities=aj(b,c)ak.
add(at)end function aq.addVelocity(at,b:PubTypes.Animatable)local c=typeof(b)if c~=at._currentType then ah(
'springTypeMismatch',nil,c,at._currentType)end local d=aj(b,c)for e,f in ipairs(d)do at._springVelocities[e]+=f end ak.
add(at)end function aq.update(at):boolean local b=at._goalState:get(false)if b==at._goalValue then local c=ap(at.
_damping)if typeof(c)~='number'then ai('mistypedSpringDamping',nil,typeof(c))elseif c<0 then ai('invalidSpringDamping',
nil,c)else at._currentDamping=c end local d=ap(at._speed)if typeof(d)~='number'then ai('mistypedSpringSpeed',nil,typeof(
d))elseif d<0 then ai('invalidSpringSpeed',nil,d)else at._currentSpeed=d end return false else at._goalValue=b local c,d
=at._currentType,typeof(b)at._currentType=d local e=aj(b,d)local f=#e at._springGoals=e if d~=c then at._currentValue=at
._goalValue local g,h=table.create(f,0),table.create(f,0)for i,j in ipairs(e)do g[i]=j end at._springPositions=g at.
_springVelocities=h ak.remove(at)return true elseif f==0 then at._currentValue=at._goalValue return true else ak.add(at)
return false end end end local function at<T>(b:PubTypes.Value<T>,c:PubTypes.CanBeState<number>?,d:PubTypes.CanBeState<
number>?):Types.Spring<T>if c==nil then c=10 end if d==nil then d=1 end local e={[b]=true}if ao(c)=='State'then e[c]=
true end if ao(d)=='State'then e[d]=true end local f=setmetatable({type='State',kind='Spring',dependencySet=e,
dependentSet=setmetatable({},as),_speed=c,_damping=d,_goalState=b,_goalValue=nil,_currentType=nil,_currentValue=nil,
_currentSpeed=ap(c),_currentDamping=ap(d),_springPositions=nil,_springGoals=nil,_springVelocities=nil},ar)am(f)b.
dependentSet[f]=true f:update()return f end return at end)()end,[6]=function()local aa,ab,ac=a(6)local ad return(
function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.
Parent local ag,ah,ai,aj=ac(af.Types),ac(af.Animation.packType),ac(af.Animation.springCoefficients),ac(af.Dependencies.
updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local ak,al,am:Set<Spring>,an={},0.0001,{},os.clock()
function ak.add(ao:Spring)ao._lastSchedule=an ao._startDisplacements={}ao._startVelocities={}for ap,aq in ipairs(ao.
_springGoals)do ao._startDisplacements[ap]=ao._springPositions[ap]-aq ao._startVelocities[ap]=ao._springVelocities[ap]
end am[ao]=true end function ak.remove(ao:Spring)am[ao]=nil end local function ao()local ap:Set<Spring> ={}an=os.clock()
for aq in pairs(am)do local ar,as,at,b=ai(an-aq._lastSchedule,aq._currentDamping,aq._currentSpeed)local c,d,e,f,g=aq.
_springPositions,aq._springVelocities,aq._startDisplacements,aq._startVelocities,false for h,i in ipairs(aq._springGoals
)do local j,k=e[h],f[h]local l,m=j*ar+k*as,j*at+k*b if math.abs(l)>al or math.abs(m)>al then g=true end c[h]=l+i d[h]=m
end if not g then ap[aq]=true end end for ar in pairs(am)do ar._currentValue=ah(ar._springPositions,ar._currentType)aj(
ar)end for as in pairs(ap)do am[as]=nil end end ae:BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.
Value,ao)return ak end)()end,[7]=function()local aa,ab,ac=a(7)local ad return(function(...)local ae=ab.Parent.Parent
local af,ag,ah,ai,aj,ak,al,am,an=ac(ae.PubTypes),ac(ae.Types),ac(ae.Animation.TweenScheduler),ac(ae.Dependencies.
useDependency),ac(ae.Dependencies.initDependency),ac(ae.Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Utility.
xtypeof),{}local ao,ap={__index=an},{__mode='k'}function an.get(as,at:boolean?):any if at~=false then ai(as)end return
as._currentValue end function an.update(as):boolean local at=as._goalState:get(false)if at==as._nextValue and not as.
_currentlyAnimating then return false end local b=as._tweenInfo if as._tweenInfoIsState then b=b:get()end if typeof(b)~=
'TweenInfo'then al('mistypedTweenInfo',nil,typeof(b))return false end as._prevValue=as._currentValue as._nextValue=at as
._currentTweenStartTime=os.clock()as._currentTweenInfo=b local c=b.DelayTime+b.Time if b.Reverses then c+=b.Time end c*=
b.RepeatCount+1 as._currentTweenDuration=c ah.add(as)return false end local function as<T>(at:PubTypes.StateObject<
PubTypes.Animatable>,b:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local c=at:get(false)if b==nil then b=TweenInfo.
new()end local d,e={[at]=true},am(b)=='State'if e then d[b]=true end local f=b if e then f=f:get()end if typeof(f)~=
'TweenInfo'then ak('mistypedTweenInfo',nil,typeof(f))end local g=setmetatable({type='State',kind='Tween',dependencySet=d
,dependentSet=setmetatable({},ap),_goalState=at,_tweenInfo=b,_tweenInfoIsState=e,_prevValue=c,_nextValue=c,_currentValue
=c,_currentTweenInfo=b,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},ao)aj(g)at.
dependentSet[g]=true return g end return as end)()end,[8]=function()local aa,ab,ac=a(8)local ad return(function(...)
local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.Parent local ag,
ah,ai,aj,ak=ac(af.Types),ac(af.Animation.lerpType),ac(af.Animation.getTweenRatio),ac(af.Dependencies.updateAll),{}type
Set<T> ={[T]:any}type Tween=Types.Tween<any>local al,am:Set<Tween> ={__mode='k'},{}setmetatable(am,al)function ak.add(an
:Tween)am[an]=true end function ak.remove(an:Tween)am[an]=nil end local function an()local ao=os.clock()for ap:Tween in
pairs(am::any)do local as=ao-ap._currentTweenStartTime if as>ap._currentTweenDuration then if ap._currentTweenInfo.
Reverses then ap._currentValue=ap._prevValue else ap._currentValue=ap._nextValue end ap._currentlyAnimating=false aj(ap)
ak.remove(ap)else local at=ai(ap._currentTweenInfo,as)local b=ah(ap._prevValue,ap._nextValue,at)ap._currentValue=b ap.
_currentlyAnimating=true aj(ap)end end end ae:BindToRenderStep('__FusionTweenScheduler',Enum.RenderPriority.First.Value,
an)return ak end)()end,[9]=function()local aa,ab,ac=a(9)local ad return(function(...)local ae=cloneref and cloneref(game
:GetService'TweenService')or game:GetService'TweenService'local function af(ag:TweenInfo,ah:number):number local ai,aj,
ak,al,am,an=ag.DelayTime,ag.Time,ag.Reverses,1+ag.RepeatCount,ag.EasingStyle,ag.EasingDirection local ao=ai+aj if ak
then ao+=aj end if ah>=ao*al then return 1 end local ap=ah%ao if ap<=ai then return 0 end local as=(ap-ai)/aj if as>1
then as=2-as end local at=ae:GetValue(as,am,an)return at end return af end)()end,[10]=function()local aa,ab,ac=a(10)
local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah(
ai:any,aj:any,ak:number):any local al=typeof(ai)if typeof(aj)==al then if al=='number'then local am,an=aj::number,ai::
number return(am-an)*ak+an elseif al=='CFrame'then local am,an=aj::CFrame,ai::CFrame return an:Lerp(am,ak)elseif al==
'Color3'then local am,an=aj::Color3,ai::Color3 local ao,ap=ag.to(an),ag.to(am)return ag.from(ao:Lerp(ap,ak),false)elseif
al=='ColorSequenceKeypoint'then local am,an=aj::ColorSequenceKeypoint,ai::ColorSequenceKeypoint local ao,ap=ag.to(an.
Value),ag.to(am.Value)return ColorSequenceKeypoint.new((am.Time-an.Time)*ak+an.Time,ag.from(ao:Lerp(ap,ak),false))elseif
al=='DateTime'then local am,an=aj::DateTime,ai::DateTime return DateTime.fromUnixTimestampMillis((am.UnixTimestampMillis
-an.UnixTimestampMillis)*ak+an.UnixTimestampMillis)elseif al=='NumberRange'then local am,an=aj::NumberRange,ai::
NumberRange return NumberRange.new((am.Min-an.Min)*ak+an.Min,(am.Max-an.Max)*ak+an.Max)elseif al==
'NumberSequenceKeypoint'then local am,an=aj::NumberSequenceKeypoint,ai::NumberSequenceKeypoint return
NumberSequenceKeypoint.new((am.Time-an.Time)*ak+an.Time,(am.Value-an.Value)*ak+an.Value,(am.Envelope-an.Envelope)*ak+an.
Envelope)elseif al=='PhysicalProperties'then local am,an=aj::PhysicalProperties,ai::PhysicalProperties return
PhysicalProperties.new((am.Density-an.Density)*ak+an.Density,(am.Friction-an.Friction)*ak+an.Friction,(am.Elasticity-an.
Elasticity)*ak+an.Elasticity,(am.FrictionWeight-an.FrictionWeight)*ak+an.FrictionWeight,(am.ElasticityWeight-an.
ElasticityWeight)*ak+an.ElasticityWeight)elseif al=='Ray'then local am,an=aj::Ray,ai::Ray return Ray.new(an.Origin:Lerp(
am.Origin,ak),an.Direction:Lerp(am.Direction,ak))elseif al=='Rect'then local am,an=aj::Rect,ai::Rect return Rect.new(an.
Min:Lerp(am.Min,ak),an.Max:Lerp(am.Max,ak))elseif al=='Region3'then local am,an=aj::Region3,ai::Region3 local ao,ap=an.
CFrame.Position:Lerp(am.CFrame.Position,ak),an.Size:Lerp(am.Size,ak)/2 return Region3.new(ao-ap,ao+ap)elseif al==
'Region3int16'then local am,an=aj::Region3int16,ai::Region3int16 return Region3int16.new(Vector3int16.new((am.Min.X-an.
Min.X)*ak+an.Min.X,(am.Min.Y-an.Min.Y)*ak+an.Min.Y,(am.Min.Z-an.Min.Z)*ak+an.Min.Z),Vector3int16.new((am.Max.X-an.Max.X)
*ak+an.Max.X,(am.Max.Y-an.Max.Y)*ak+an.Max.Y,(am.Max.Z-an.Max.Z)*ak+an.Max.Z))elseif al=='UDim'then local am,an=aj::UDim
,ai::UDim return UDim.new((am.Scale-an.Scale)*ak+an.Scale,(am.Offset-an.Offset)*ak+an.Offset)elseif al=='UDim2'then
local am,an=aj::UDim2,ai::UDim2 return an:Lerp(am,ak)elseif al=='Vector2'then local am,an=aj::Vector2,ai::Vector2 return
an:Lerp(am,ak)elseif al=='Vector2int16'then local am,an=aj::Vector2int16,ai::Vector2int16 return Vector2int16.new((am.X-
an.X)*ak+an.X,(am.Y-an.Y)*ak+an.Y)elseif al=='Vector3'then local am,an=aj::Vector3,ai::Vector3 return an:Lerp(am,ak)
elseif al=='Vector3int16'then local am,an=aj::Vector3int16,ai::Vector3int16 return Vector3int16.new((am.X-an.X)*ak+an.X,
(am.Y-an.Y)*ak+an.Y,(am.Z-an.Z)*ak+an.Z)end end if ak<0.5 then return ai else return aj end end return ah end)()end,[11]
=function()local aa,ab,ac=a(11)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.
Colour.Oklab)local function ah(ai:{number},aj:string):PubTypes.Animatable?if aj=='number'then return ai[1]elseif aj==
'CFrame'then return CFrame.new(ai[1],ai[2],ai[3])*CFrame.fromAxisAngle(Vector3.new(ai[4],ai[5],ai[6]).Unit,ai[7])elseif
aj=='Color3'then return ag.from(Vector3.new(ai[1],ai[2],ai[3]),false)elseif aj=='ColorSequenceKeypoint'then return
ColorSequenceKeypoint.new(ai[4],ag.from(Vector3.new(ai[1],ai[2],ai[3]),false))elseif aj=='DateTime'then return DateTime.
fromUnixTimestampMillis(ai[1])elseif aj=='NumberRange'then return NumberRange.new(ai[1],ai[2])elseif aj==
'NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(ai[2],ai[1],ai[3])elseif aj=='PhysicalProperties'then
return PhysicalProperties.new(ai[1],ai[2],ai[3],ai[4],ai[5])elseif aj=='Ray'then return Ray.new(Vector3.new(ai[1],ai[2],
ai[3]),Vector3.new(ai[4],ai[5],ai[6]))elseif aj=='Rect'then return Rect.new(ai[1],ai[2],ai[3],ai[4])elseif aj=='Region3'
then local ak,al=Vector3.new(ai[1],ai[2],ai[3]),Vector3.new(ai[4]/2,ai[5]/2,ai[6]/2)return Region3.new(ak-al,ak+al)
elseif aj=='Region3int16'then return Region3int16.new(Vector3int16.new(ai[1],ai[2],ai[3]),Vector3int16.new(ai[4],ai[5],
ai[6]))elseif aj=='UDim'then return UDim.new(ai[1],ai[2])elseif aj=='UDim2'then return UDim2.new(ai[1],ai[2],ai[3],ai[4]
)elseif aj=='Vector2'then return Vector2.new(ai[1],ai[2])elseif aj=='Vector2int16'then return Vector2int16.new(ai[1],ai[
2])elseif aj=='Vector3'then return Vector3.new(ai[1],ai[2],ai[3])elseif aj=='Vector3int16'then return Vector3int16.new(
ai[1],ai[2],ai[3])else return nil end end return ah end)()end,[12]=function()local aa,ab,ac=a(12)local ad return(
function(...)local function ae(af:number,ag:number,ah:number):(number,number,number,number)if af==0 or ah==0 then return
1,0,0,1 end local ai,aj,ak,al if ag>1 then local am,an=af*ah,math.sqrt(ag^2-1)local ao,ap=-0.5/an,-an-ag local as,at=1/
ap,math.exp(am*ap)local b=math.exp(am*as)ai=(b*ap-at*as)*ao aj=(at-b)*ao/ah ak=(b-at)*ao*ah al=(at*ap-b*as)*ao elseif ag
==1 then local am=af*ah local an=math.exp(-am)ai=an*(1+am)aj=an*af ak=an*(-am*ah)al=an*(1-am)else local am,an=af*ah,math
.sqrt(1-ag^2)local ao,ap,as=1/an,an*am,math.exp(-am*ag)local at,b=as*math.sin(ap),as*math.cos(ap)local c=at*ao local d=c
*ag ai=d+b aj=c ak=-(d*ag+at*an)al=b-d end return ai,aj,ak,al end return ae end)()end,[13]=function()local aa,ab,ac=a(13
)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah
(ai:any,aj:string):{number}if aj=='number'then local ak=ai::number return{ak}elseif aj=='CFrame'then local ak,al=ai:
ToAxisAngle()return{ai.X,ai.Y,ai.Z,ak.X,ak.Y,ak.Z,al}elseif aj=='Color3'then local ak=ag.to(ai)return{ak.X,ak.Y,ak.Z}
elseif aj=='ColorSequenceKeypoint'then local ak=ag.to(ai.Value)return{ak.X,ak.Y,ak.Z,ai.Time}elseif aj=='DateTime'then
return{ai.UnixTimestampMillis}elseif aj=='NumberRange'then return{ai.Min,ai.Max}elseif aj=='NumberSequenceKeypoint'then
return{ai.Value,ai.Time,ai.Envelope}elseif aj=='PhysicalProperties'then return{ai.Density,ai.Friction,ai.Elasticity,ai.
FrictionWeight,ai.ElasticityWeight}elseif aj=='Ray'then return{ai.Origin.X,ai.Origin.Y,ai.Origin.Z,ai.Direction.X,ai.
Direction.Y,ai.Direction.Z}elseif aj=='Rect'then return{ai.Min.X,ai.Min.Y,ai.Max.X,ai.Max.Y}elseif aj=='Region3'then
return{ai.CFrame.X,ai.CFrame.Y,ai.CFrame.Z,ai.Size.X,ai.Size.Y,ai.Size.Z}elseif aj=='Region3int16'then return{ai.Min.X,
ai.Min.Y,ai.Min.Z,ai.Max.X,ai.Max.Y,ai.Max.Z}elseif aj=='UDim'then return{ai.Scale,ai.Offset}elseif aj=='UDim2'then
return{ai.X.Scale,ai.X.Offset,ai.Y.Scale,ai.Y.Offset}elseif aj=='Vector2'then return{ai.X,ai.Y}elseif aj=='Vector2int16'
then return{ai.X,ai.Y}elseif aj=='Vector3'then return{ai.X,ai.Y,ai.Z}elseif aj=='Vector3int16'then return{ai.X,ai.Y,ai.Z
}else return{}end end return ah end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(function(...)local ae={}
function ae.to(af:Color3):Vector3 local ag,ah,ai=af.R*0.4122214708+af.G*0.5363325363+af.B*0.0514459929,af.R*0.2119034982
+af.G*0.6806995451+af.B*0.1073969566,af.R*0.0883024619+af.G*0.2817188376+af.B*0.6299787005 local aj,ak,al=ag^(
0.3333333333333333),ah^(0.3333333333333333),ai^(0.3333333333333333)return Vector3.new(aj*0.2104542553+ak*0.793617785-al*
0.0040720468,aj*1.9779984951-ak*2.428592205+al*0.4505937099,aj*0.0259040371+ak*0.7827717662-al*0.808675766)end function
ae.from(af:Vector3,ag:boolean?):Color3 local ah,ai,aj=af.X+af.Y*0.3963377774+af.Z*0.2158037573,af.X-af.Y*0.1055613458-af
.Z*0.0638541728,af.X-af.Y*0.0894841775-af.Z*1.291485548 local ak,al,am=ah^3,ai^3,aj^3 local an,ao,ap=ak*4.0767416621-al*
3.3077115913+am*0.2309699292,ak*-1.2684380046+al*2.6097574011-am*0.3413193965,ak*-4.196086299999999E-3-al*0.7034186147+
am*1.707614701 if not ag then an=math.clamp(an,0,1)ao=math.clamp(ao,0,1)ap=math.clamp(ap,0,1)end return Color3.new(an,ao
,ap)end return ae end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(function(...)local ae=ab.Parent.Parent
local af,ag,ah=ac(ae.PubTypes),ac(ae.Logging.parseError),ac(ae.Dependencies.sharedState)type Set<T> ={[T]:any}local ai,
aj=ah.initialisedStack,0 local function ak(al:Set<PubTypes.Dependency>,am:(...any)->any,...):(boolean,any)local an=ah.
dependencySet ah.dependencySet=al ah.initialisedStackSize+=1 local ao,ap=(ah.initialisedStackSize)if ao>aj then ap={}ai[
ao]=ap aj=ao else ap=ai[ao]table.clear(ap)end local as=table.pack(xpcall(am,ag,...))ah.dependencySet=an ah.
initialisedStackSize-=1 return table.unpack(as,1,as.n)end return ak end)()end,[18]=function()local aa,ab,ac=a(18)local
ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Dependencies.sharedState)local ah=ag.
initialisedStack local function ai(aj:PubTypes.Dependency)local ak=ag.initialisedStackSize for al,am in ipairs(ah)do if
al>ak then return end am[aj]=true end end return ai end)()end,[19]=function()local aa,ab,ac=a(19)local ad return(
function(...)local ae=ab.Parent.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}local ag:{Set<PubTypes.Dependency>}
,ah,ai:Set<PubTypes.Dependency>?={},0 return{dependencySet=ai,initialisedStack=ag,initialisedStackSize=ah}end)()end,[20]
=function()local aa,ab,ac=a(20)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.PubTypes)type Set<T
> ={[T]:any}type Descendant=(PubTypes.Dependent&PubTypes.Dependency)|PubTypes.Dependent local function ag(ah:PubTypes.
Dependency)local ai:{[Descendant]:number},aj:{[Descendant]:boolean},ak:{Descendant},al,am={},{},{},0,1 for an in ah.
dependentSet do al+=1 ak[al]=an aj[an]=true end while am<=al do local ao=ak[am]local ap=ai[ao]ai[ao]=if ap==nil then 1
else ap+1 if(ao::any).dependentSet~=nil then for as in(ao::any).dependentSet do al+=1 ak[al]=as end end am+=1 end am=1
while am<=al do local ao=ak[am]local ap=ai[ao]-1 ai[ao]=ap if ap==0 and aj[ao]and ao:update()and(ao::any).dependentSet~=
nil then for as in(ao::any).dependentSet do aj[as]=true end end am+=1 end end return ag end)()end,[21]=function()local
aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Dependencies.
sharedState)local ah=ag.initialisedStack local function ai(aj:PubTypes.Dependency)local ak=ag.dependencySet if ak~=nil
then local al=ag.initialisedStackSize if al>0 then local am=ah[al]if am[aj]~=nil then return end end ak[aj]=true end end
return ai end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent local af,
ag,ah,ai=ac(ae.PubTypes),ac(ae.Logging.logWarn),ac(ae.State.Observer),ac(ae.Utility.xtypeof)type Set<T> ={[T]:boolean}
local aj,ak=false,{}ak.type='SpecialKey'ak.kind='Children'ak.stage='descendants'function ak.apply(al,am:any,an:Instance,
ao:{PubTypes.Task})local ap:Set<Instance>,as:Set<Instance>,at:{[PubTypes.StateObject<any>]:()->()},b:{[PubTypes.
StateObject<any>]:()->()},c,d:()->()={},{},{},{},false local function e()if not c then return end c=false as,ap=ap,as b,
at=at,b table.clear(ap)table.clear(at)local function f(g:any,h:string?)local i=ai(g)if i=='Instance'then ap[g]=true if
as[g]==nil then g.Parent=an else as[g]=nil end if aj and h~=nil then g.Name=h end elseif i=='State'then local j=g:get(
false)if j~=nil then f(j,h)end local k=b[g]if k==nil then k=ah(g):onChange(d)else b[g]=nil end at[g]=k elseif i=='table'
then for j,k in pairs(g)do local l,m:string?=(typeof(j))if l=='string'then m=j elseif l=='number'and h~=nil then m=h..
'_'..j end f(k,m)end else ag('unrecognisedChildType',i)end end if am~=nil then f(am)end for g in pairs(as)do g.Parent=
nil end for h,i in pairs(b)do i()end end d=function()if not c then c=true task.defer(e)end end table.insert(ao,function(
)am=nil c=true e()end)c=true e()end return ak::PubTypes.SpecialKey end)()end,[24]=function()local aa,ab,ac=a(24)local ad
return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),{}ag.type='SpecialKey'ag.kind='Cleanup'ag.
stage='observer'function ag.apply(ah,ai:any,aj:Instance,ak:{PubTypes.Task})table.insert(ak,ai)end return ag end)()end,[
25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(
ae.Instances.applyInstanceProps)local function ah(ai:Instance)return function(aj:PubTypes.PropertyTable):Instance ag(aj,
ai)return ai end end return ah end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae=ab.
Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.Instances.defaultProps),ac(ae.Instances.applyInstanceProps),ac(ae.
Logging.logError)local function aj(ak:string)return function(al:PubTypes.PropertyTable):Instance local am,an=pcall(
Instance.new,ak)if not am then ai('cannotCreateClass',nil,ak)end local ao=ag[ak]if ao~=nil then for ap,as in pairs(ao)do
an[ap]=as end end ah(al,an)return an end end return aj end)()end,[27]=function()local aa,ab,ac=a(27)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Logging.logError)local function ah(ai:string):
PubTypes.SpecialKey local aj={}aj.type='SpecialKey'aj.kind='OnChange'aj.stage='observer'function aj.apply(ak,al:any,am:
Instance,an:{PubTypes.Task})local ao,ap=pcall(am.GetPropertyChangedSignal,am,ai)if not ao then ag('cannotConnectChange',
nil,am.ClassName,ai)elseif typeof(al)~='function'then ag('invalidChangeHandler',nil,ai)else table.insert(an,ap:Connect(
function()al((am::any)[ai])end))end end return aj end return ah end)()end,[28]=function()local aa,ab,ac=a(28)local ad
return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Logging.logError)local function ah(ai:
Instance,aj:string)return(ai::any)[aj]end local function ai(aj:string):PubTypes.SpecialKey local ak={}ak.type=
'SpecialKey'ak.kind='OnEvent'ak.stage='observer'function ak.apply(al,am:any,an:Instance,ao:{PubTypes.Task})local ap,as=
pcall(ah,an,aj)if not ap or typeof(as)~='RBXScriptSignal'then ag('cannotConnectEvent',nil,an.ClassName,aj)elseif typeof(
am)~='function'then ag('invalidEventHandler',nil,aj)else table.insert(ao,as:Connect(am))end end return ak end return ai
end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae
.PubTypes),ac(ae.Logging.logError),ac(ae.Utility.xtypeof)local function ai(aj:string):PubTypes.SpecialKey local ak={}ak.
type='SpecialKey'ak.kind='Out'ak.stage='observer'function ak.apply(al,am:any,an:Instance,ao:{PubTypes.Task})local ap,as=
pcall(an.GetPropertyChangedSignal,an,aj)if not ap then ag('invalidOutProperty',nil,an.ClassName,aj)elseif ah(am)~=
'State'or am.kind~='Value'then ag'invalidOutType'else am:set((an::any)[aj])table.insert(ao,as:Connect(function()am:set((
an::any)[aj])end))table.insert(ao,function()am:set(nil)end)end end return ak end return ai end)()end,[30]=function()
local aa,ab,ac=a(30)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.
Logging.logError),ac(ae.Utility.xtypeof),{}ai.type='SpecialKey'ai.kind='Ref'ai.stage='observer'function ai.apply(aj,ak:
any,al:Instance,am:{PubTypes.Task})if ah(ak)~='State'or ak.kind~='Value'then ag'invalidRefType'else ak:set(al)table.
insert(am,function()ak:set(nil)end)end end return ai end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj=ac(ae.PubTypes),ac(ae.Utility.cleanup),ac(ae.Utility.xtypeof
),ac(ae.Logging.logError),ac(ae.State.Observer)local function ak(al:Instance,am:string,an:any)(al::any)[am]=an end
local function al(am:Instance,an:string)(am::any)[an]=(am::any)[an]end local function am(an:Instance,ao:string,ap:any)if
not pcall(ak,an,ao,ap)then if not pcall(al,an,ao)then if an==nil then ai('setPropertyNilRef',nil,ao,tostring(ap))else
ai('cannotAssignProperty',nil,an.ClassName,ao)end else local as,at=typeof(ap),typeof((an::any)[ao])ai(
'invalidPropertyType',nil,an.ClassName,ao,at,as)end end end local function an(ao:Instance,ap:string,as:PubTypes.
CanBeState<any>,at:{PubTypes.Task})if ah(as)=='State'then local b=false local function c()if not b then b=true task.
defer(function()b=false am(ao,ap,as:get(false))end)end end am(ao,ap,as:get(false))table.insert(at,aj(as::any):onChange(c
))else am(ao,ap,as)end end local function ao(ap:PubTypes.PropertyTable,as:Instance)local at,b={self={}::{[PubTypes.
SpecialKey]:any},descendants={}::{[PubTypes.SpecialKey]:any},ancestor={}::{[PubTypes.SpecialKey]:any},observer={}::{[
PubTypes.SpecialKey]:any}},{}for c,d in pairs(ap)do local e=ah(c)if e=='string'then if c~='Parent'then an(as,c::string,d
,b)end elseif e=='SpecialKey'then local f=(c::PubTypes.SpecialKey).stage local g=at[f]if g==nil then ai(
'unrecognisedPropertyStage',nil,f)else g[c]=d end else ai('unrecognisedPropertyKey',nil,ah(c))end end for e,f in pairs(
at.self)do e:apply(f,as,b)end for g,h in pairs(at.descendants)do g:apply(h,as,b)end if ap.Parent~=nil then an(as,
'Parent',ap.Parent,b)end for i,j in pairs(at.ancestor)do i:apply(j,as,b)end for k,l in pairs(at.observer)do k:apply(l,as
,b)end as.Destroying:Connect(function()ag(b)end)end return ao end)()end,[32]=function()local aa,ab,ac=a(32)local ad
return(function(...)return{ScreenGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},BillboardGui={
ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},SurfaceGui={ResetOnSpawn=false,ZIndexBehavior=Enum.
ZIndexBehavior.Sibling,SizingMode=Enum.SurfaceGuiSizingMode.PixelsPerStud,PixelsPerStud=50},Frame={BackgroundColor3=
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},ScrollingFrame={BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,ScrollBarImageColor3=Color3.new(0,0,0)},TextLabel={BackgroundColor3=
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.
new(0,0,0),TextSize=14},TextButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,
AutoButtonColor=false,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextBox={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,ClearTextOnFocus=false,Font=Enum.
Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},ImageLabel={BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},ImageButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.
new(0,0,0),BorderSizePixel=0,AutoButtonColor=false},ViewportFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=
Color3.new(0,0,0),BorderSizePixel=0},VideoFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0},CanvasGroup={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end
)()end,[34]=function()local aa,ab,ac=a(34)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types
),ac(ae.Logging.messages)local function ah(ai:string,aj:Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]
else ai='unknownMessage'ak=ag[ai]end local al if aj==nil then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)
else ak=ak:gsub('ERROR_MESSAGE',aj.message)al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'
..aj.trace,...)end error(al:gsub('\n','\n    '),0)end return ah end)()end,[35]=function()local aa,ab,ac=a(35)local ad
return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Types),ac(ae.Logging.messages)local function ah(ai:
string,aj:Types.Error?,...)local ak:string if ag[ai]~=nil then ak=ag[ai]else ai='unknownMessage'ak=ag[ai]end local al if
aj==nil then al=string.format('[Fusion] '..ak..'\n(ID: '..ai..')',...)else ak=ak:gsub('ERROR_MESSAGE',aj.message)al=
string.format('[Fusion] '..ak..'\n(ID: '..ai..')\n---- Stack trace ----\n'..aj.trace,...)end task.spawn(function(...)
error(al:gsub('\n','\n    '),0)end,...)end return ah end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(
function(...)local ae=ab.Parent.Parent local af=ac(ae.Logging.messages)local function ag(ah,...)local ai:string if af[ah
]~=nil then ai=af[ah]else ah='unknownMessage'ai=af[ah]end warn(string.format('[Fusion] '..ai..'\n(ID: '..ah..')',...))
end return ag end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return{cannotAssignProperty=
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
isSimilar),ac(ae.Utility.needsDestruction),{}local ao,ap={__index=an},{__mode='k'}function an.get(as,at:boolean?):any if
at~=false then ai(as)end return as._value end function an.update(as):boolean for at in pairs(as.dependencySet)do at.
dependentSet[as]=nil end as._oldDependencySet,as.dependencySet=as.dependencySet,as._oldDependencySet table.clear(as.
dependencySet)local b,k,l=ag(as.dependencySet,as._processor)if b then if as._destructor==nil and am(k)then ak
'destructorNeededComputed'end if l~=nil then ak'multiReturnComputed'end local m=as._value local n=al(m,k)if as.
_destructor~=nil then as._destructor(m)end as._value=k for o in pairs(as.dependencySet)do o.dependentSet[as]=true end
return not n else aj('computedCallbackError',k)as._oldDependencySet,as.dependencySet=as.dependencySet,as.
_oldDependencySet for m in pairs(as.dependencySet)do m.dependentSet[as]=true end return false end end local function as<
T>(at:()->T,b:((T)->())?):Types.Computed<T>local k=setmetatable({type='State',kind='Computed',dependencySet={},
dependentSet=setmetatable({},ap),_oldDependencySet={},_processor=at,_destructor=b,_value=nil},ao)ah(k)k:update()return k
end return as end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)local ae=ab.Parent.Parent local
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,as=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.
Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal)
,ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local at,b={
__index=as},{__mode='k'}function as.get(k,l:boolean?):any if l~=false then aj(k)end return k._outputTable end function
as.update(k):boolean local l=k._inputIsState local m,n,o,p,q,r,s=if l then k._inputTable:get(false)else k._inputTable,k.
_oldInputTable,k._outputTable,k._keyOIMap,k._keyIOMap,k._meta,false for t in pairs(k.dependencySet)do t.dependentSet[k]=
nil end k._oldDependencySet,k.dependencySet=k.dependencySet,k._oldDependencySet table.clear(k.dependencySet)if l then k.
_inputTable.dependentSet[k]=true k.dependencySet[k._inputTable]=true end for u,v in pairs(m)do local w=k._keyData[u]if w
==nil then w={dependencySet=setmetatable({},b),oldDependencySet=setmetatable({},b),dependencyValues=setmetatable({},b)}k
._keyData[u]=w end local x=n[u]==nil if x==false then for y,z in pairs(w.dependencyValues)do if z~=y:get(false)then x=
true break end end end if x then w.oldDependencySet,w.dependencySet=w.dependencySet,w.oldDependencySet table.clear(w.
dependencySet)local y,z,A=ah(w.dependencySet,k._processor,u)if y then if k._destructor==nil and(ap(z)or ap(A))then an
'destructorNeededForKeys'end local B,C=p[z],q[u]if B~=u and m[B]~=nil then am('forKeysKeyCollision',nil,tostring(z),
tostring(B),tostring(z))end if C~=z and p[C]==u then local D=r[C]local E,F=xpcall(k._destructor or ao,ak,C,D)if not E
then al('forKeysDestructorError',F)end p[C]=nil o[C]=nil r[C]=nil end n[u]=v r[z]=A p[z]=u q[u]=z o[z]=v s=true else w.
oldDependencySet,w.dependencySet=w.dependencySet,w.oldDependencySet al('forKeysProcessorError',z)end end for y in pairs(
w.dependencySet)do w.dependencyValues[y]=y:get(false)k.dependencySet[y]=true y.dependentSet[k]=true end end for w,x in
pairs(p)do if m[x]==nil then local y=r[w]local z,A=xpcall(k._destructor or ao,ak,w,y)if not z then al(
'forKeysDestructorError',A)end n[x]=nil r[w]=nil p[w]=nil q[x]=nil o[w]=nil k._keyData[x]=nil s=true end end return s
end local function k<KI,KO,M>(l:PubTypes.CanBeState<{[KI]:any}>,m:(KI)->(KO,M?),n:((KO,M?)->())?):Types.ForKeys<KI,KO,M>
local o=l.type=='State'and typeof(l.get)=='function'local p=setmetatable({type='State',kind='ForKeys',dependencySet={},
dependentSet=setmetatable({},b),_oldDependencySet={},_processor=m,_destructor=n,_inputIsState=o,_inputTable=l,
_oldInputTable={},_outputTable={},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},at)ai(p)p:update()return p end return
k end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,
aj,ak,al,am,an,ao,ap,as=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.
initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.
Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local at,b={__index=as
},{__mode='k'}function as.get(k,l:boolean?):any if l~=false then aj(k)end return k._outputTable end function as.update(k
):boolean local l=k._inputIsState local m,n,o,p,q=if l then k._inputTable:get(false)else k._inputTable,k._oldInputTable,
k._keyIOMap,k._meta,false for r in pairs(k.dependencySet)do r.dependentSet[k]=nil end k._oldDependencySet,k.
dependencySet=k.dependencySet,k._oldDependencySet table.clear(k.dependencySet)if l then k._inputTable.dependentSet[k]=
true k.dependencySet[k._inputTable]=true end k._oldOutputTable,k._outputTable=k._outputTable,k._oldOutputTable local s,t
=k._oldOutputTable,k._outputTable table.clear(t)for u,v in pairs(m)do local w=k._keyData[u]if w==nil then w={
dependencySet=setmetatable({},b),oldDependencySet=setmetatable({},b),dependencyValues=setmetatable({},b)}k._keyData[u]=w
end local x=n[u]~=v if x==false then for y,z in pairs(w.dependencyValues)do if z~=y:get(false)then x=true break end end
end if x then w.oldDependencySet,w.dependencySet=w.dependencySet,w.oldDependencySet table.clear(w.dependencySet)local y,
z,A,B=ah(w.dependencySet,k._processor,u,v)if y then if k._destructor==nil and(ap(z)or ap(A)or ap(B))then an
'destructorNeededForPairs'end if t[z]~=nil then local C,D for E,F in pairs(o)do if F==z then D=m[E]if D~=nil then C=E
break end end end if C~=nil then am('forPairsKeyCollision',nil,tostring(z),tostring(C),tostring(D),tostring(u),tostring(
v))end end local C=s[z]if C~=A then local D=p[z]if C~=nil then local E,F=xpcall(k._destructor or ao,ak,z,C,D)if not E
then al('forPairsDestructorError',F)end end s[z]=nil end n[u]=v o[u]=z p[z]=B t[z]=A q=true else w.oldDependencySet,w.
dependencySet=w.dependencySet,w.oldDependencySet al('forPairsProcessorError',z)end else local y=o[u]if t[y]~=nil then
local z,A for B,C in pairs(o)do if y==C then A=m[B]if A~=nil then z=B break end end end if z~=nil then am(
'forPairsKeyCollision',nil,tostring(y),tostring(z),tostring(A),tostring(u),tostring(v))end end t[y]=s[y]end for y in
pairs(w.dependencySet)do w.dependencyValues[y]=y:get(false)k.dependencySet[y]=true y.dependentSet[k]=true end end for w,
x in pairs(s)do if t[w]~=x then local y=p[w]if x~=nil then local z,A=xpcall(k._destructor or ao,ak,w,x,y)if not z then
al('forPairsDestructorError',A)end end if t[w]==nil then p[w]=nil k._keyData[w]=nil end q=true end end for y in pairs(n)
do if m[y]==nil then n[y]=nil o[y]=nil end end return q end local function k<KI,VI,KO,VO,M>(l:PubTypes.CanBeState<{[KI]:
VI}>,m:(KI,VI)->(KO,VO,M?),n:((KO,VO,M?)->())?):Types.ForPairs<KI,VI,KO,VO,M>local o=l.type=='State'and typeof(l.get)==
'function'local p=setmetatable({type='State',kind='ForPairs',dependencySet={},dependentSet=setmetatable({},b),
_oldDependencySet={},_processor=m,_destructor=n,_inputIsState=o,_inputTable=l,_oldInputTable={},_outputTable={},
_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},at)ai(p)p:update()return p end return k end)()end,[44]=function()
local aa,ab,ac=a(44)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,ao,ap=ac(ae.
PubTypes),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.
useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),
ac(ae.Utility.needsDestruction),{}local as,at={__index=ap},{__mode='k'}function ap.get(b,k:boolean?):any if k~=false
then aj(b)end return b._outputTable end function ap.update(b):boolean local k=b._inputIsState local l,m,n=if k then b.
_inputTable:get(false)else b._inputTable,{},false b._oldValueCache,b._valueCache=b._valueCache,b._oldValueCache local o,
p=b._valueCache,b._oldValueCache table.clear(o)for q in pairs(b.dependencySet)do q.dependentSet[b]=nil end b.
_oldDependencySet,b.dependencySet=b.dependencySet,b._oldDependencySet table.clear(b.dependencySet)if k then b.
_inputTable.dependentSet[b]=true b.dependencySet[b._inputTable]=true end for r,s in pairs(l)do local t=p[s]local u,v,w,x
=(t==nil)if type(t)=='table'and#t>0 then local y=table.remove(t,#t)v=y.value w=y.valueData x=y.meta if#t<=0 then p[s]=
nil end elseif t~=nil then p[s]=nil u=true end if w==nil then w={dependencySet=setmetatable({},at),oldDependencySet=
setmetatable({},at),dependencyValues=setmetatable({},at)}end if u==false then for y,z in pairs(w.dependencyValues)do if
z~=y:get(false)then u=true break end end end if u then w.oldDependencySet,w.dependencySet=w.dependencySet,w.
oldDependencySet table.clear(w.dependencySet)local y,z,A=ah(w.dependencySet,b._processor,s)if y then if b._destructor==
nil and(ao(z)or ao(A))then am'destructorNeededForValues'end if v~=nil then local B,C=xpcall(b._destructor or an,ak,v,x)
if not B then al('forValuesDestructorError',C)end end v=z x=A n=true else w.oldDependencySet,w.dependencySet=w.
dependencySet,w.oldDependencySet al('forValuesProcessorError',z)end end local y=o[s]if y==nil then y={}o[s]=y end table.
insert(y,{value=v,valueData=w,meta=x})m[r]=v for z in pairs(w.dependencySet)do w.dependencyValues[z]=z:get(false)b.
dependencySet[z]=true z.dependentSet[b]=true end end for t,u in pairs(p)do for v,w in ipairs(u)do local x,y=w.value,w.
meta local z,A=xpcall(b._destructor or an,ak,x,y)if not z then al('forValuesDestructorError',A)end n=true end table.
clear(u)end b._outputTable=m return n end local function b<VI,VO,M>(k:PubTypes.CanBeState<{[any]:VI}>,l:(VI)->(VO,M?),m:
((VO,M?)->())?):Types.ForValues<VI,VO,M>local n=k.type=='State'and typeof(k.get)=='function'local o=setmetatable({type=
'State',kind='ForValues',dependencySet={},dependentSet=setmetatable({},at),_oldDependencySet={},_processor=l,_destructor
=m,_inputIsState=n,_inputTable=k,_outputTable={},_valueCache={},_oldValueCache={}},as)ai(o)o:update()return o end return
b end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(
ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.initDependency)type Set<T> ={[T]:any}local ai={}local aj,ak:Set<Types.
Observer> ={__index=ai},{}function ai.update(al):boolean for am,an in pairs(al._changeListeners)do task.spawn(an)end
return false end function ai.onChange(al,am:()->()):()->()local an={}al._numChangeListeners+=1 al._changeListeners[an]=
am ak[al]=true local ao=false return function()if ao then return end ao=true al._changeListeners[an]=nil al.
_numChangeListeners-=1 if al._numChangeListeners==0 then ak[al]=nil end end end local function al(am:PubTypes.Value<any>
):Types.Observer local an=setmetatable({type='State',kind='Observer',dependencySet={[am]=true},dependentSet={},
_changeListeners={},_numChangeListeners=0},aj)ah(an)am.dependentSet[an]=true return an end return al end)()end,[46]=
function()local aa,ab,ac=a(46)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak=ac(ae.Types
),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(ae.Utility.
isSimilar),{}local al,am={__index=ak},{__mode='k'}function ak.get(an,ao:boolean?):any if ao~=false then ag(an)end return
an._value end function ak.set(an,ao:any,ap:boolean?)local as=an._value if ap or not aj(as,ao)then an._value=ao ai(an)end
end local function an<T>(ao:T):Types.State<T>local ap=setmetatable({type='State',kind='Value',dependentSet=setmetatable(
{},am),_value=ao},al)ah(ap)return ap end return an end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function
(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Utility.xtypeof)local function ah<T>(ai:PubTypes.
CanBeState<T>,aj:boolean?):T return if ag(ai)=='State'then(ai::PubTypes.StateObject<T>):get(aj)else(ai::T)end return ah
end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)local ae=ab.Parent local af=ac(ae.PubTypes)
type Set<T> ={[T]:any}export type None=PubTypes.Symbol&{}export type Error={type:string,raw:string,message:string,trace:
string}export type State<T> =PubTypes.Value<T>&{_value:T}export type Computed<T> =PubTypes.Computed<T>&{
_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,_value:T}export type ForPairs<KI,VI,KO,VO,M> =PubTypes.
ForPairs<KO,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI,VI)->(KO,VO),_destructor:(VO,M?)->(),
_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:VI}>,_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO},
_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,
oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForKeys<KI,KO,M> =
PubTypes.ForKeys<KO,any>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI)->(KO),_destructor:(KO,M?)->(),
_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:KO}>,_oldInputTable:{[KI]:KO},_outputTable:{[KO]:any},
_keyOIMap:{[KO]:KI},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes
.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type ForValues<VI,VO,M> =PubTypes.ForValues<any,VO>&{
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
=ab.Parent.Parent local af=ac(ae.Types)return{type='Symbol',name='None'}::Types.None end)()end,[51]=function()local aa,
ab,ac=a(51)local ad return(function(...)local function ae(af:any)local ag=typeof(af)if ag=='Instance'then af:Destroy()
elseif ag=='RBXScriptConnection'then af:Disconnect()elseif ag=='function'then af()elseif ag=='table'then if typeof(af.
destroy)=='function'then af:destroy()elseif typeof(af.Destroy)=='function'then af:Destroy()elseif af[1]~=nil then for ah
,ai in ipairs(af)do ae(ai)end end end end local function af(...:any)for ag=1,select('#',...)do ae(select(ag,...))end end
return af end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)local function ae(...:any)end return
ae end)()end,[53]=function()local aa,ab,ac=a(53)local ad return(function(...)local function ae(af:any,ag:any):boolean if
typeof(af)=='table'then return false else return af==ag end end return ae end)()end,[54]=function()local aa,ab,ac=a(54)
local ad return(function(...)local function ae(af:any):boolean return typeof(af)=='Instance'end return ae end)()end,[55]
=function()local aa,ab,ac=a(55)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Logging.logError)
type table={[any]:any}local function ag(ah:string,ai:table):table local aj=getmetatable(ai::any)if aj==nil then aj={}
setmetatable(ai,aj)end function aj.__index(ak,al)af('strictReadError',nil,tostring(al),ah)end return ai end return ag
end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)local function ae(af:any)local ag=typeof(af)if
ag=='table'and typeof(af.type)=='string'then return af.type else return ag end end return ae end)()end,[57]=function()
local aa,ab,ac=a(57)local ad return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent)
local ag=af.Fusion local ah,ai,aj=ag.Value,{},{}type uid=string type tag=string function aj.update(ak:string,al:string,
am:string)if al~='uid'and aj.find(ak)and aj.find(ak)[al]then local an=aj.find(ak)an[al]:set(am)elseif not aj.find(ak)
then error("couldn't find uid: "..ak)elseif al=='uid'or al=='__tag'then error('cannot edit property '..al)elseif not aj.
find(ak)[al]then else error'how?'end end function aj.find(ak:uid|tag):table local al for am=1,#ai do if ai[am].uid==ak
or ai[am].__tag==ak then al=ai[am]end end if not al then warn('no data found by identifier: '..tostring(ak))return al
end return al end function aj.delete(ak:string)local al=aj.find(ak)local am,an=table.find(ai,al),{}for ao=1,#ai do if ao
~=am then table.insert(an,ai[ao])end end ai=an an=nil end function aj.add(ak:table,al:string,am:boolean):table am=am or
false if not am then for an,ao in ak do ak[an]=ah(ao)end end ak.__tag=al or nil ak.uid=ae(16)setmetatable(ak,{__index={
update=function(an,ao,ap)aj.update(an.uid,ao,ap)end,delete=function()aj.delete(ak.uid)end}})table.insert(ai,ak)return aj
.find(ak.uid)end return aj end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local ae,af,ag=ac(
ab.Parent).data,ac(ab.Parent.Parent.utilities).get,ac(ab.Parent).services local ah,ai=ag.HttpService,ac(ab.Parent).
Fusion local aj,ak,al=ai.Observer,ai.Value,ac(ab.Parent.Parent.utilities)local am,an,ao,ap,as,at,b,k,l,m=al.connections,
al.customFunctions,al.randomString,{},ae.add({list={}},'flags'),{},{},{},{},{}ap.currentConfig={}ap.path=''local n,o={
toggle=function(n)local o=n.status.boolean am.add(aj(o):onChange(function()local p=af(o)n.user.Value=p n.bindableEvent:
Fire(p)end))end,dropdown=function(n)local o=n.status.multiselect and n.status.items or n.status.item am.add(aj(o):
onChange(function()local p=af(o)n.user.Value=p n.bindableEvent:Fire(p)end))end,keybind=function(n)local o=n.status.
mobile and n.status.coordinate or n.status.keycode am.add(aj(o):onChange(function()local p=af(o)n.user.Value=p n.
bindableEvent:Fire(p)end))end,slider=function(n)local o=n.status.percentageOf am.add(aj(o):onChange(function()local p=
af(o)n.user.Value=p n.bindableEvent:Fire(p)end))end,textbox=function(n)local o=n.status.correctText am.add(aj(o):
onChange(function()local p=af(o)n.user.Value=p n.bindableEvent:Fire(p)end))end,colorpicker=function(n)local o,p=n.status
.color,n.status.transparency am.add(aj(o):onChange(function()n.user.Value={af(o),af(p)}n.bindableEvent:Fire(unpack(n.
user.Value))end))am.add(aj(p):onChange(function()n.user.Value={af(o),af(p)}n.bindableEvent:Fire(unpack(n.user.Value))end
))end},{toggle=function(n)local o={}if n.boolean then o.boolean=af(n.boolean)end if n.keycode then o.keycode=af(n.
keycode)end if af(n.coordinate)then o.coordinate={X=af(n.coordinate).X,Y=af(n.coordinate).Y}end return o end,dropdown=
function(n)return n.multiselect and{unpack(af(n.items))}or af(n.item)end,keybind=function(n)local o={}if n.keycode then
o.keycode=af(n.keycode)end if af(n.coordinate)then o.coordinate={X=af(n.coordinate).X,Y=af(n.coordinate).Y}end return o
end,slider=function(n)return af(n.percentageOf)end,textbox=function(n)return af(n.correctText)end,colorpicker=function(n
)return{color=af(n.color):ToHex(),transparency=af(n.transparency)}end}function ap.preregister(p)local q,r=ai.New
'BindableEvent'{},{}function r.Connect(s,t)assert(typeof(t)=='function','Connect only takes functions')am.add(q.Event:
Connect(t))end local s s={name=p,status={},type='unknown',preregistered=true,bindableEvent=q,file=ak{},user={Value=nil,
OnChange=setmetatable(r,{__newindex=function(t,u,v)return nil end})}}b[p]=s local t=af(as.list)t[s.name]=s as:update(
'list',t)return s end function ap.register(p,q,r,s)assert(not table.find(at,p),'Flags must all be unique!')table.insert(
at,p)local t,u=ai.New'BindableEvent'{},{}function u.Connect(v,w)assert(typeof(w)=='function','Connect')am.add(t.Event:
Connect(w))end local v if not b[p]then local w=(ai.New'BindableEvent'{})v={name=p,status=q,type=r,private=s,
preregistered=false,bindableEvent=t,file=w.Event,fileEvent=w,user={Value=nil,OnChange=setmetatable(u,{__newindex=
function()return nil end})}}n[v.type](v)local x=af(as.list)x[v.name]=v as:update('list',x)else v=b[p]v.type=r v.
preregistered=false v.status=q v.private=s n[v.type](v)b[v.name]=nil end return v end function ap.find(p)for q,r in m do
if r.uid==p then return r,q end end return false end function ap.create(p,q,r,s)r=r or false if q=='original'and r then
return end local t={}t.name=p t.uid=q or ao(5)t.flagValues={}if r then t.flagValues=s else for u,v in af(as.list)do if v
.private then continue end if v.type=='unknown'then continue end t.flagValues[v.name]=o[v.type](v.status)end end table.
insert(m,t)an.writefile(`{ap.path}/{t.uid}.json`,ah:JSONEncode(t))task.spawn(function()for u,v in k do task.spawn(v)end
end)return q end function ap.init()for p,q in an.listfiles(ap.path)do local r=ah:JSONDecode(an.readfile(q))ap.create(r.
name,r.uid,true,r.flagValues)end end function load(p)for q,r in p.flagValues do local s=af(as.list)[q]if not s then
continue end s.fileEvent:Fire(r)end end function ap.set(p)local q=ap.find(p)if not q then return end ap.currentConfig=q
load(q)task.spawn(function()for r,s in k do task.spawn(s,p)end end)end function ap.save(p)local q=ap.find(p)for r,s in
af(as.list)do if s.private then continue end if s.type=='unknown'then continue end q.flagValues[s.name]=o[s.type](s.
status)end an.writefile(`{ap.path}/{q.uid}.json`,ah:JSONEncode(q))end function ap.delete(p)local q,r=ap.find(p)if q then
if an.isfile(`{ap.path}/{q.uid}.json`)then an.delfile(`{ap.path}/{q.uid}.json`)table.remove(m,r)end end end function ap.
export()return ah:JSONEncode(ap.currentConfig)end function ap.getConfigs()return m end function ap.getConfig()return ap.
currentConfig end function ap.onCreate(p)table.insert(k,p)end function ap.onSelect(p)table.insert(l,p)end return ap end
)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)return{lock='rbxassetid://10723434711',maximize=
'rbxassetid://15556636376',minimize='rbxassetid://15556637715',close='rbxassetid://10747384394',circle=
'rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',
fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command='rbxassetid://10723416765',input=
'rbxassetid://10734982297',search='rbxassetid://10734943674',finger='rbxassetid://10734929723',alert=
'rbxassetid://10709752996',paint='rbxassetid://10734910187',cog='rbxassetid://10709810948'}end)()end,[60]=function()
local aa,ab,ac=a(60)local ad return(function(...)local ae=ac(ab.Parent.Parent.utilities)local af,ag,ah=(ae.
customFunctions)if af.getthreadidentity()<5 then ah=af.getthreadidentity()af.setthreadidentity(5)end ag=loadstring(game:
GetObjects'rbxassetid://85554466048193'[1].Source)()af.setthreadidentity(ah)return ag end)()end,[61]=function()local aa,
ab,ac=a(61)local ad return(function(...)local ae=ac(ab.Parent.Parent.utilities.customFunctions)local af,ag=ae.cloneref,{
}ag=setmetatable(ag,{__index=function(ah,ai)return af(game:GetService(ai))end})return ag end)()end,[62]=function()local
aa,ab,ac=a(62)local ad return(function(...)local ae,af={},ac(ab.Parent.services)local ag,ah=af.HttpService,ac(ab.Parent)
local ai,aj=ah.Fusion,ac(ab.default)local ak,al,am,an,ao,ap,as,at,b=ai.Value,ai.Observer,ac(ab.Parent.Parent.utilities.
get),ac(ab.Parent.Parent.utilities.animate),ac(ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.utilities.
randomString),ac(ab.Parent.Parent.utilities.customFunctions),{},{}local k,l,m=ak{},ak{},''al(k):onChange(function()task.
wait()for n,o in ipairs(at)do task.spawn(o)end end)local n,o,p={},{},{}table.foreach(aj,function(q)table.insert(p,q)end)
ae.path=''function ae.find(q)for r,s in n do if s.uid==q then return true,s end end return false end function ae.create(
q,r,s,t,u)t=t or false if s=='original'and t then return end for v,w in p do if r[w]==nil then r[w]=aj[w]end if typeof(r
[w])~='Color3'then ao(w.." isn't type Color3")end end for x,y in r do if not table.find(p,x)then ao(
'Incorrect value removed "'..tostring(x)..'"')r[x]=nil end end if u and t then table.insert(o,s)end if u and not t then
for z,A in o do local B=ae.find(A)if B.name==q then return A.uid end end end s=s or ap(5)table.insert(n,{name=q,uid=s,
fromSet=u or false,palette=r})local z={}z.name=q z.uid=s z.fromSet=u z.palette={}for A,B in r do z.palette[A]=B:ToHex()
end as.writefile(`{ae.path}/{s}.json`,ag:JSONEncode(z))task.spawn(function()for C,D in b do task.spawn(D)end end)return
s end function ae.delete(q)local r={ae.find(q)}if not r[1]then return false,'no theme found'end local s=table.find(n,r[2
])ae.set(m)table.remove(n,s)as.delfile(`{ae.path}/{r[2].uid}.json`)end function ae.edit(q,r)local s=am(k)s[q]=r k:set(s)
end function ae.editTheme(q:string,r:string,s:any)local t={ae.find(q)}if not t[1]then return false end local u=t[2]u[r]=
s local y={}y.name=u.name y.uid=q y.fromSet=u.fromSet y.palette={}for z,A in u.palette do y.palette[z]=A:ToHex()end as.
writefile(`{ae.path}/{q}.json`,ag:JSONEncode(y))return true end function ae.set(q)local r,s,t={ae.find(q)}if r[1]then s,
t=r[2],r[2].palette else return false,'no theme found'end local u={}table.foreach(t,function(y,z)u[y]=z end)k:set(u)l:
set(s)return true,'successfully set new theme'end function ae.export()local q,r=am(l),{}r.name=q.name r.uid=q.uid r.
fromSet=q.fromSet r.palette={}for s,t in q.palette do r.palette[s]=t:ToHex()end return ag:JSONEncode(r)end function ae.
save(q)local r={ae.find(q)}if r[1]then local s,t=r[2],{}t.name=s.name t.uid=s.uid t.fromSet=s.fromSet t.palette={}for u,
y in s.palette do t.palette[u]=y:ToHex()end s.palette=am(k)as.writefile(`{ae.path}/{q}.json`,ag:JSONEncode(t))ae.set(q)
return true else return false end end function ae.get(q)local r=am(k)if r[q]then return r[q]else error(q..
" isn't a theme element")end end for q,r in p do ae[r]=an(function()return am(k)[r]end,40,1)end function ae.init()m=ae.
create('darius',aj,'original')ae.set(m)for s,t in as.listfiles(ae.path)do local u=ag:JSONDecode(as.readfile(t))table.
foreach(u.palette,function(y,z)local A=Color3.fromHex(`#{z}`)u.palette[y]=A end)ae.create(u.name,u.palette,u.uid,true,u.
fromSet)end end function ae.onChange(s)table.insert(at,s)end function ae.onCreate(s)table.insert(b,s)end function ae.
getTheme()return am(l)end function ae.getThemes()return n end function ae.getColors()return am(k)end return ae end)()end
,[63]=function()local aa,ab,ac=a(63)local ad return(function(...)return{background=Color3.fromHex'#2C2F33',background2=
Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',
scrollBar=Color3.fromHex'#DCE1E5',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.fromHex'#222427',
mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex
'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex
'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[65]=function()local aa,ab,ac=a(65)
local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.
data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.
Computed,ac(ae.utilities)local b,k,l,m,n=at.get,at.animate,at.typecheck,at.customFont,ac(ae.simpleElements)local o,p,q,r
=n.UIPadding,n.UICorner,l(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{af.
DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible'})assert(q,table.concat(r,
'\n'))local s,t,u,y,z,A,B,C,D=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Visible or an(
true),af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.Callback local E=an(b(s.string)==b(u.tab).
uid)ao(s.string):onChange(function()E:set(b(s.string)==b(u.tab).uid)end)local F=k(function()return b(E)and 0 or 1 end,40
,1)al'TextButton'{Interactable=as(function()if not b(B)then return false end return b(E)end),Visible=as(function()if b(t
.string)~=''and not string.find(b(z):lower(),b(t.string):lower())or not b(A)then return false end return true end),
Parent=y,Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=F,[ap'Activated']=function()if
not b(B)then return end task.spawn(b(D))end,[am]={p(6),al'Frame'{ZIndex=2,Visible=as(function()if not b(B)then return
true end return false end),BackgroundTransparency=k(function()return b(E)and 0.2 or 1 end,40,1),BackgroundColor3=ai.
disabledBackground,Size=UDim2.fromScale(1,1),[am]={p(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,
ImageTransparency=F},al'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=F,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=C,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={o(0,5)}}}},al'Frame'{Size=UDim2
.fromScale(1,1),BackgroundTransparency=1,[am]={o(0,8),al'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),Size=
UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=z,TextTransparency=F,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=ai.text2,ImageTransparency=F}}}}}local G={}function G.SetName(
H,I)local J,K=l({SetName=I},{SetName=''})assert(J,table.concat(K,'\n'))z:set(I)end function G.SetCallback(H,I)local J,K=
l({SetCallback=I},{SetCallback=function()end})assert(J,table.concat(K,'\n'))D:set(I)end function G.Fire(H)task.spawn(b(D
))end function G.Enable(H)B:set(true)end function G.Disable(H)B:set(false)end function G.Visible(H)A:set(true)end
function G.Invisible(H)A:set(false)end return G end end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed
,ac(ae.utilities)local b,k,l,m,n=at.get,at.animate,at.typecheck,at.customFont,ac(ae.simpleElements)local o,p,q,r,s,t,u,y
,z,A,B=n.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,n.UIPadding,n.
UICorner,af.Parent,af.tab,an(0),an(true)local C=al'Frame'{Visible=B,Parent=y,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[am]={o(p.LayoutOrder,q.Horizontal,r.Left,s.Center,UDim.new(0,3))}}local D,E=an(C.AbsoluteSize)
,{}function E.Button(F,G)local H,I=l(G,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{G
.IsEnabled and''or'IsEnabled',G.Visible and''or'Visible',G.DisabledText and''or'DisabledText'})assert(H,table.concat(I,
'\n'))local J,K,L,M,N,O,P,Q=ah.find'selectedTab',ah.find'searchText',ah.add(G),G.Name,G.Callback,G.IsEnabled or an(true)
,G.DisabledText or an'Component Disabled',G.Visible or an(true)local R=an(b(J.string)==b(z).uid)ao(J.string):onChange(
function()R:set(b(J.string)==b(z).uid)end)local S=k(function()return b(R)and 0 or 1 end,40,1)al'TextButton'{Interactable
=as(function()if not b(O)then return false end return b(R)end),Visible=as(function()if b(K.string)~=''and not string.
find(b(M):lower(),b(K.string):lower())or not b(Q)then return false end return true end),Size=as(function()return UDim2.
new(1/b(A)-(b(A)-1==0 and 0 or((((b(A)-1)*3)/b(A))/b(D).X)),0,0,36)end),Parent=C,BackgroundColor3=ai.background2,
BackgroundTransparency=S,[ap'Activated']=function()if not b(O)then return end task.spawn(b(N))end,[am]={u(6),al'Frame'{
ZIndex=2,Visible=as(function()if not b(O)then return true end return false end),BackgroundTransparency=k(function()
return b(R)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={u(6),al
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=S},al'TextLabel'{FontFace=m(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=S,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=P,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,[am]={t(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am
]={t(0,8),al'TextLabel'{FontFace=m('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32,0,18),BackgroundTransparency=
1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=M,
TextTransparency=S,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=
ai.text2,ImageTransparency=k(function()return b(R)and 0.5 or 1 end,40,1)}}}}}if b(Q)then A:set(b(A)+1)end ao(Q):
onChange(function()if b(Q)then A:set(b(A)+1)else A:set(b(A)-1)end end)local T={}function T.SetName(U,V)local W,X=l({
SetName=V},{SetName=''})assert(W,table.concat(X,'\n'))M:set(V)end function T.SetCallback(U,V)local W,X=l({SetCallback=V}
,{SetCallback=function()end})assert(W,table.concat(X,'\n'))N:set(V)end function T.Fire(U)task.spawn(b(N))end function T.
Enable(U)O:set(true)end function T.Disable(U)O:set(false)end function T.Visible(U)Q:set(true)end function T.Invisible(U)
Q:set(false)end return T end function E.Visible(F)B:set(true)end function E.Invisible(F)B:set(false)end return E end end
)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.Parent.Parent return function(af)
local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.
RunService,al.UserInputService,ag.Fusion local ap,as,at,b,k,l,m,n=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.
Computed,ao.Ref,ac(ae.utilities)local o,p,q,r,s,t,u=n.get,n.animate,n.typecheck,n.customFont,n.randomString,n.
connections,ac(ae.simpleElements)local y,z,A,B,C,D,E,F,G,H=u.UIListLayout,u.UIPadding,u.UITextSizeConstraint,u.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,q(af,{Name='',DisabledText='',
IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Color=Color3.new(),Transparency=0,HideTransparency=true,
IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af
.FLAG and''or'FLAG',af.Color and''or'Color',af.Transparency and''or'Transparency',af.HideTransparency and''or
'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(G,table.concat(H,'\n'))local I,J,K,L,M,N,O,P,Q,R,S,T,U,
V,W,X=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',ah.find'absoluteOffset',ah.find'currentPicker',ah.add(
af),af.Parent,af.Name,af.DisabledText or at'Component Disabled',af.IsEnabled or at(true),af.Visible or at(true),af.
Callback,af.Color or at(Color3.new(1)),af.IgnoreConfig or at(false),af.Transparency or at(0),af.HideTransparency or at(
false)local Y,Z=(af.FLAG or at(N.uid))if o(Y)~=''then Z=ak.register(o(Y),{color=at(Color3.new(1)),transparency=at(0)},
'colorpicker',o(Y)==N.uid)Z.user.Value={o(Z.status.color),o(Z.status.transparency)}end local _,au=Z.status.color,Z.
status.transparency b(_):onChange(function()if o(R)then task.spawn(o(T),o(_),o(au))end end)b(au):onChange(function()if
o(R)then task.spawn(o(T),o(_),o(au))end end)local av=at(o(I.string)==o(N.tab).uid)b(I.string):onChange(function()av:set(
o(I.string)==o(N.tab).uid)end)local aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN=p(function()return o(av)and 0
or 1 end,40,1),at(),at(0),at(),at(0),at(),at(0),at(),at(false),at(),at(false),at(),at(false),at(0),at(0),(at(0))
local function aO()return{Name=P,Children={y(C.LayoutOrder,D.Vertical,E.Center,F.Top,UDim.new(0,5)),ap'TextButton'{Size=
UDim2.fromOffset(224,224),[m]=aD,[k'InputBegan']=function(aP)if aP.UserInputType~=Enum.UserInputType.MouseButton1 and aP
.UserInputType~=Enum.UserInputType.Touch then return end aE:set(true)local aQ aQ=aP.Changed:Connect(function()if aP.
UserInputState==Enum.UserInputState.End or aP.UserInputState.Cancel then aE:set(false)aQ:Disconnect()end end)end,[as]={
ap'UIGradient'{Color=l(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(o(aJ),1,1))}end)},ap'Frame'{Size=UDim2.fromScale(1,1),[as]={ap'UIGradient'{
Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(0,0,0))},Transparency=l(function()return NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)}end)}}},ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=
1,Image=aj.circle,Size=UDim2.fromOffset(10,10),ImageColor3=l(function()return Color3.fromHSV(0,0,1-o(aL))end),Position=
l(function()return UDim2.fromScale(o(aK),1-o(aL))end),[as]={ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromScale(0.9,0.9),ImageColor3=l(function()return Color3.fromHSV(o(
aJ),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},ap'TextButton'{Size=UDim2.new(1,0,0,24),[k'InputBegan']=function(aP)
if aP.UserInputType~=Enum.UserInputType.MouseButton1 and aP.UserInputType~=Enum.UserInputType.Touch then return end aG:
set(true)local aQ aQ=aP.Changed:Connect(function()if aP.UserInputState==Enum.UserInputState.End or aP.UserInputState.
Cancel then aG:set(false)aQ:Disconnect()end end)end,[m]=aF,[as]={ap'UIGradient'{Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.
colorpickerBar,Size=UDim2.new(0,2,1,0),Position=l(function()return UDim2.fromScale(1-o(aJ),0.5)end)}}},ap'ImageButton'{
Visible=not o(X),ZIndex=2,Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=
Enum.ScaleType.Crop,[k'InputBegan']=function(aP)if aP.UserInputType~=Enum.UserInputType.MouseButton1 and aP.
UserInputType~=Enum.UserInputType.Touch then return end aI:set(true)local aQ aQ=aP.Changed:Connect(function()if aP.
UserInputState==Enum.UserInputState.End or aP.UserInputState.Cancel then aI:set(false)aQ:Disconnect()end end)end,[m]=aH,
[as]={ap'Frame'{Size=UDim2.fromScale(1,1),[as]={ap'UIGradient'{Color=l(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,o(_)),ColorSequenceKeypoint.new(1,o(_))}end),Transparency=l(function()return NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=l(function()return UDim2.fromScale(o(au),0.5)end)}}}
,ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[as]={y(C.LayoutOrder,D.Horizontal,E.Left,F.Center,UDim.
new(0,4)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=ai.text2,
BackgroundTransparency=1,TextSize=16,FontFace=r('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.
Right},ap'TextBox'{Name=s(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',PlaceholderColor3=
ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,Text=l(function()local aP={o(_).R,o(_).G,o(_).B}for aQ,aR
in aP do aP[aQ]=math.floor(math.clamp(aR*255,0,255))end return table.concat(aP,', ')end),TextScaled=true,FontFace=r(
'Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[m]=aB,[k'Changed']=
function(aP)local aQ=o(aB)if aP=='TextBounds'and aQ and aQ.TextBounds then aC:set(aQ.TextBounds.X)end end,[k'FocusLost']
=function()local aP=o(aB)local aQ,aR=aP.Text:gsub(' ',''),{o(_).R,o(_).G,o(_).B}for aS,aT in aR do aR[aS]=math.floor(
math.clamp(aT*255,0,255))end local aU,aV,aW=table.concat(aR,', '),pcall(function()local aU=string.split(aQ,',')table.
foreach(aU,function(aV,aW)if not tonumber(aW)then return nil end aU[aV]=math.clamp(aW,0,255)end)return Color3.fromRGB(aU
[1],aU[2],aU[3])end)if aV and aW then _:set(aW)aJ:set(({o(_):ToHSV()})[1])aK:set(({o(_):ToHSV()})[2])aL:set(({o(_):
ToHSV()})[3])else aP.Text=aU end end,[as]={A(1,16),ap'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(
42,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=p(function
()return UDim2.fromOffset(math.clamp(o(aC),0,110),2)end,40,1),[as]={B(0,1)}}}}}}},ap'Frame'{Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,[as]={y(C.LayoutOrder,D.Horizontal,E.Left,F.Center,UDim.new(0,5)),{ap'TextLabel'{Size=UDim2.
new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=ai.text2,BackgroundTransparency=1,TextSize=16,
FontFace=r('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Right},ap'TextBox'{Name=s(8),
BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.AutomaticSize.X,PlaceholderText='HSV',
PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=l(function()local aP={o(_):ToHSV()}for aQ,aR in aP do aP[aQ]=math.
floor(aR*100)/100 end return table.concat(aP,', ')end),TextScaled=true,FontFace=r('Montserrat',Enum.FontWeight.Bold),
ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[m]=az,[k'Changed']=function(aP)local aQ=o(az)if aP==
'TextBounds'and aQ and aQ.TextBounds then aA:set(aQ.TextBounds.X)end end,[k'FocusLost']=function()local aP=o(az)local aQ
,aR=aP.Text:gsub(' ',''),{o(_):ToHSV()}for aS,aT in aR do aR[aS]=math.floor(aT*100)/100 end local aU,aV,aW=table.concat(
aR,', '),pcall(function()local aU=string.split(aQ,',')table.foreach(aU,function(aV,aW)if not tonumber(aW)then return nil
end end)return Color3.fromHSV(unpack(aU))end)if aV and aW then _:set(aW)aJ:set(({o(_):ToHSV()})[1])aK:set(({o(_):ToHSV()
})[2])aL:set(({o(_):ToHSV()})[3])else aP.Text=aU end end,[as]={A(1,16),ap'UISizeConstraint'{MaxSize=Vector2.new(110,16),
MinSize=Vector2.new(36,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,Position=UDim2.fromScale(
1,1),Size=p(function()return UDim2.fromOffset(math.clamp(o(aA),36,110),2)end,40,1),[as]={B(0,1)}}}}}}}}}end b(R):
onChange(function()if not o(R)and typeof(aM)=='Instance'then aM:Destroy()end end)ap'Frame'{Interactable=l(function()if
not o(R)then return false end return o(av)end),Visible=l(function()if o(J.string)~=''and not string.find(o(P):lower(),o(
J.string):lower())or not o(S)then return false end return true end),Parent=O,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,BackgroundColor3=ai.background2,[as]={B(6),ap'Frame'{ZIndex=3,Visible=l(function()if not o(R)
then return true end return false end),BackgroundTransparency=p(function()return o(av)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[as]={B(6),ap'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=aw},ap'TextLabel'{FontFace=r('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=aw,TextScaled=true,AnchorPoint=Vector2.new(0,0.5)
,Position=UDim2.new(0,29,0.5,0),Text=Q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[as]={z(0,5)}}}},ap'Frame'{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[as]={y(C.LayoutOrder,D.Horizontal,E.Left,F.Bottom,UDim.new(0,3)),ap
'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=aw,[as]={z(9,8),B(6),y(C.
LayoutOrder,D.Horizontal,E.Left,F.Top),ap'TextLabel'{FontFace=r('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,
18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,
0.5,0),Text=P,TextTransparency=aw,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},ap'TextButton'{Interactable=
l(function()if not o(R)then return false end return o(av)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=ai.background2
,BackgroundTransparency=aw,[k'Activated']=function()if typeof(o(M.module))=='Instance'then o(M.module):Destroy()end aM,
aN=ac(ab.Parent.module)(aO())M:update('module',aM)end,[as]={z(0,8),B(6),y(C.LayoutOrder,D.Horizontal,E.Right,F.Center,
UDim.new(0,5)),ap'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[as]={y(C.LayoutOrder,D.Horizontal,E.Right,
F.Center,UDim.new(0,4)),ap'TextBox'{Interactable=l(function()if not o(R)then return false end return o(av)end),Name=s(8)
,BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',PlaceholderColor3=ai.text2,TextColor3=ai.text,
TextTransparency=aw,Text=l(function()return'#'..o(_):ToHex()end),TextScaled=true,FontFace=r('Montserrat',Enum.FontWeight
.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[k'Changed']=function(aP)local aQ=o(ax)if aP==
'TextBounds'and aQ and aQ.TextBounds then ay:set(aQ.TextBounds.X)end end,[k'FocusLost']=function()local aP=o(ax)local aQ
=aP.Text:gsub('[^%w#]','')if not string.find(aQ,'#')then aQ='#'..aQ end if string.len(aQ)~=7 then aP.Text='#'..o(_):
ToHex()else local aR,aS=pcall(function()return Color3.fromHex(aQ)end)if aR then _:set(aS)else aP.Text='#'..o(_):ToHex()
end end end,[m]=ax,[as]={A(1,16),ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,
BackgroundTransparency=p(function()if o(av)then return 0.5 end return 1 end,40,1),Position=UDim2.fromScale(1,1),Size=p(
function()return UDim2.fromOffset(math.clamp(o(ay),0,98),2)end,40,1),[as]={B(0,1)}}}}}},ap'ImageLabel'{Size=UDim2.
fromOffset(24,24),Image=aj.paint,ImageColor3=_,BackgroundTransparency=1,ImageTransparency=p(function()return not o(av)
and 1 or o(au)end,40,1),[as]={B(6)}}}}}}}}t.add(am.Heartbeat:Connect(function()if o(aE)then local aP=o(aD)local aQ=an:
GetMouseLocation()-aP.AbsolutePosition-Vector2.new(0,o(L.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),
math.clamp(aQ.Y,0,aP.AbsoluteSize.Y))aK:set(aQ.X/aP.AbsoluteSize.X)aL:set((aP.AbsoluteSize.Y-aQ.Y)/aP.AbsoluteSize.Y)_:
set(Color3.fromHSV(o(aJ),o(aK),o(aL)))end if o(aG)then local aP=o(aF)local aQ=an:GetMouseLocation()-aP.AbsolutePosition-
Vector2.new(0,o(L.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),0)aJ:set((aP.AbsoluteSize.X-aQ.X)/aP.
AbsoluteSize.X)_:set(Color3.fromHSV(o(aJ),o(aK),o(aL)))end if o(aI)then local aP=o(aH)local aQ=an:GetMouseLocation()-aP.
AbsolutePosition-Vector2.new(0,o(L.number))aQ=Vector2.new(math.clamp(aQ.X,0,aP.AbsoluteSize.X),0)au:set(aQ.X/aP.
AbsoluteSize.X)end end))if o(K.boolean)and not o(V)then Z.file:Connect(function(aP)local aQ,aR=true,true if aP.color~=
nil then if string.find(aP.color,',')then local aS=string.split(aP.color:gsub(' ',''),',')table.foreach(aS,function(aT,
aU)aS[aT]=tonumber(aU)end)_:set(Color3.new(unpack(aS)))else _:set(Color3.fromHex(`#{aP.color}`))end aQ=false end if aP.
transparency~=nil then au:set(tonumber(aP.transparency))aR=false end if aQ then _:set(o(U))end if aR then au:set(o(W))
end aJ:set(({o(_):ToHSV()})[1])aK:set(({o(_):ToHSV()})[2])aL:set(({o(_):ToHSV()})[3])end)if Z.private then _:set(o(U))au
:set(o(W))end else _:set(o(U))au:set(o(W))end aJ:set(({o(_):ToHSV()})[1])aK:set(({o(_):ToHSV()})[2])aL:set(({o(_):ToHSV(
)})[3])local aP={}function aP.SetName(aQ,aR)local aS,aT=q({SetName=aR},{SetName=''})assert(aS,table.concat(aT,'\n'))P:
set(aR)end function aP.SetColor(aQ,aR)local aS,aT=q({SetColor=aR},{SetColor=Color3.new()})assert(aS,table.concat(aT,'\n'
))_:set(aR)aJ:set(({o(_):ToHSV()})[1])aK:set(({o(_):ToHSV()})[2])aL:set(({o(_):ToHSV()})[3])end function aP.
SetTransparency(aQ,aR)local aS,aT=q({SetTransparency=aR},{SetTransparency=0})assert(aS,table.concat(aT,'\n'))au:set(aR)
end function aP.Enable(aQ)R:set(true)end function aP.Disable(aQ)R:set(false)end function aP.Visible(aQ)S:set(true)end
function aP.Invisible(aQ)S:set(false)end return aP end end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,
ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,as,at,au,av=ao.get,ao.
animate,ah.find'selectedTab',ah.add(af),af.Parent local aw=am(ap(at.string)==ap(au.tab).uid)an(at.string):onChange(
function()aw:set(ap(at.string)==ap(au.tab).uid)end)local ax=as(function()return ap(aw)and 0 or 1 end,40,1)ak'Frame'{
Parent=av,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=ax}}}end end)()end,[69]=
function()local aa,ab,ac=a(69)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,as,at,au,av=al.New,al.
Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.
typecheck,av.customFont,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aG,aH,aI,aJ=aA.UIListLayout,aA.UIPadding,aA.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ay(af,{Name='',DisabledText='',
IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Items={},Multiselect=true,Regex=function()end,IgnoreConfig=
true,Alphabetical=true,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.
Visible and''or'Visible',af.FLAG and''or'FLAG',af.Multiselect and''or'Multiselect',af.Regex and''or'Regex',af.
IgnoreConfig and''or'IgnoreConfig',af.Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})assert(aI,
table.concat(aJ,'\n'))aI,aJ=ay(af,{Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aI,table.
concat(aJ,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string','The Regex function must always return a string')
end local aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,k,l,m=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.
add(af),af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible or ao(true),af.
Callback,ao{},af.Multiselect or ao(false),af.Default,af.IgnoreConfig or ao(false),af.Alphabetical or ao(false),af.
AlwaysOpen or ao(false),af.Regex or ao(function(aK)return aK end)local n,o=(af.FLAG or ao(aN.uid))if aw(n)~=''then o=ak.
register(aw(n),{items=ao{},item=ao'',multiselect=aw(aV)},'dropdown',aw(n)==aN.uid)o.user.Value=aw(aV)and aw(o.status.
items)or aw(o.status.item)end local p,q,r,s,t,u,y,z=o.status.items,o.status.item,ao(),ao(false),ao(aw(aV)and{}or''),ao{}
,ao{},ao(false)ap(p):onChange(function()if#aw(p)==#aw(aU)then z:set(true)else z:set(false)end local A={}for B,C in aw(p)
do table.insert(A,aw(m)(C))end task.wait()task.spawn(aw(aT),A)t:set(aw(p))end)ap(q):onChange(function()task.wait()task.
spawn(aw(aT),aw(m)(aw(q)))t:set(aw(m)(aw(q)))end)local A=ao(aw(aK.string)==aw(aN.tab).uid)ap(aK.string):onChange(
function()A:set(aw(aK.string)==aw(aN.tab).uid)end)local B=ax(function()return aw(A)and 0 or 1 end,40,1)am'Frame'{Parent=
aO,Visible=at(function()if aw(aM.string)~=''and not string.find(aw(aP):lower(),aw(aM.string):lower())or not aw(aS)then
return false end return true end),Size=ax(function()if aw(s)then return UDim2.new(1,0,0,76+(aw(aV)and(42)or 6)+math.
clamp((#aw(aU)*34),34,136))end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,
BackgroundTransparency=B,ClipsDescendants=true,[an]={aD(6),aB(aE.LayoutOrder,aF.Vertical,aG.Left,aH.Top,UDim.new(0,4)),
am'TextButton'{Interactable=at(function()if not aw(aR)then return false end return aw(A)end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[as'Activated']=function()if aw(l)then return end s:set(not aw(s))end,[an]={am'Frame'{ZIndex=2,
Visible=at(function()if not aw(aR)then return true end return false end),BackgroundTransparency=ax(function()return aw(A
)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aD(6),am'ImageLabel'{Size
=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.
lock,ImageColor3=ai.disabledText,ImageTransparency=B},am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=B,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()return aw(aQ)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[an]={aC(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={
aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,
TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=at(function()if aw(
aV)then return aw(aP)..' '..tostring(#aw(p))..'/'..tostring(#aw(aU))end if typeof(aw(t))=='table'then return aw(aP)end
if aw(y)[aw(t)]then return`{aw(aP)}: {aw(y)[aw(t)]}`end return`{aw(aP)}: {aw(t)}`end),TextTransparency=B,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=at(function()return aw(aV)and aj.multiDropdown or aj.
normalDropdown end),ImageColor3=ai.text2,ImageTransparency=B}}}}},am'Frame'{Size=UDim2.new(1,0,0,32),
BackgroundTransparency=1,[an]={aC(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,
BackgroundTransparency=B,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,TextTransparency=B,[au]=r,[as'Changed'
]=function(C)local D=aw(r)if C=='Text'and D and D.Text then local E=D.Text for F,G in aw(u)do if string.find(aw(m)(G.
Name):lower(),E:lower())or E==''then G.Visible=true else G.Visible=false end end end end,[an]={am'UITextSizeConstraint'{
MinTextSize=0,MaxTextSize=16},aD(4),aC(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=
aV,[an]={aC(6,6,0,6),am'TextButton'{Interactable=aV,Size=UDim2.new(1,0,0,24),BackgroundTransparency=B,BackgroundColor3=
ai.background,[as'Activated']=function()local C={}if not aw(z)then for D,E in aw(aU)do E=typeof(E)=='table'and E.Value
or E table.insert(C,aw(m)(E))end end p:set(C)end,[an]={aD(4),aC(8),am'TextLabel'{FontFace=az('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=at(function()if aw(z)then return'Deselect All'end return
'Select All'end),TextTransparency=B,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},am'ScrollingFrame'{ZIndex
=3,Size=at(function()return UDim2.new(1,-6,0,math.clamp((#aw(aU)*34),34,136))end),BackgroundTransparency=1,
ScrollBarThickness=at(function()return#aw(aU)>4 and 6 or 0 end),ScrollBarImageColor3=ai.scrollBar,CanvasSize=UDim2.new(0
,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aC(6,at(function()return#aw(aU)>4 and UDim.new(0,12)or UDim.new(0
,0)end),0,6),aB(aw(k)and aE.Name or aE.LayoutOrder,aF.Vertical,aG.Center,aH.Top,UDim.new(0,6)),u}}}}ap(aU):onChange(
function()local C={}for D,E in aw(aU)do local F,G,H,I=(ao(false))if typeof(E)=='table'then local J,K=ay(E,{DisplayValue=
'',Value='',Image=''},{E.Image and''or'Image',E.DisplayValue and''or'DisplayValue'})assert(J,table.concat(K,'\n'))G=E.
Value H=E.Image or nil I=E.DisplayValue or nil else local J,K=ay({Item=E},{Item=''})assert(J,table.concat(K,'\n'))G=E
end local J=aw(m)(G)if I then local K=aw(y)K[G]=I y:set(K)end ap(p):onChange(function()if table.find(aw(p),J)then F:set(
true)else F:set(false)end end)ap(q):onChange(function()if aw(q)==J then F:set(true)else F:set(false)end end)local K=am
'TextButton'{Name=`{I~=nil and I or G}`,Size=UDim2.new(1,0,0,28),BackgroundTransparency=B,BackgroundColor3=ai.background
,[as'Activated']=function()if aw(aV)then local K=aw(p)F:set(not aw(F))if aw(F)then table.insert(K,J)else table.remove(K,
table.find(K,J))end p:set(K)else q:set(J)if aw(l)then return end s:set(false)end end,[an]={aD(4),aC(8),aB(aE.LayoutOrder
,aF.Horizontal,aG.Left,aH.Center,UDim.new(0,6)),am'Frame'{Visible=at(function()return aw(aV)and true or false end),Size=
UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=B,
BackgroundColor3=ax(function()return aw(F)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[an]={aD(6),am'ImageLabel'{
Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,
Image=aj.check,ImageTransparency=ax(function()if not aw(A)then return 1 end if aw(F)then return 0 end return 1 end,40,1)
,ImageColor3=ai.selectedTab}}},am'ImageLabel'{Visible=at(function()return H and true or false end),Size=UDim2.
fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=H,
ImageTransparency=B,ImageColor3=ai.text2},am'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=at(function(
)return aw(aV)and UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=I or G,TextTransparency=B,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(C,K)end u:set(C)end)aU:set(aw(af.Items))if aw(l)
then s:set(true)end if aw(aL.boolean)and not aw(b)then o.file:Connect(function(C)local D=true if C~=nil then D=false end
if aw(aV)then p:set(C)else q:set(C)end if D then if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then
q:set(aw(aW))end end end end)if o.private then if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then
for C,D in aw(aU)do if typeof(D)=='table'and D.Value==aw(aW)then q:set(aw(aW))elseif D==aw(aW)then q:set(aw(aW))end end
end end end else if aw(aV)then if aW and#aw(aW)>0 then p:set(aw(aW))end else if aW then q:set(aw(aW))end end end local C
={}function C.SetName(D,E)local F,G=ay({SetName=E},{SetName=''})assert(F,table.concat(G,'\n'))aP:set(E)end function C.
SetItems(D,E)local F,G=ay({SetItems=E},{SetItems={}})assert(F,table.concat(G,'\n'))aU:set(E)local H,I={},false for J,K
in aw(aU)do local L if typeof(K)=='table'then L=K.Value else L=K end local M=aw(m)(L)if aw(aV)then if typeof(aw(t))==
'table'and table.find(aw(t),M)then table.insert(H,M)I=true end else if aw(t)==M then I=true q:set(M)break end end end if
I then if aw(aV)then p:set(H)end else if aw(aV)then p:set{}else q:set''end end end function C.SelectItem(D,E)assert(not
aw(aV),':SelectItem requires Multiselect to be false')local F,G=ay({SelectItem=E},{SelectItem=''})assert(F,table.concat(
G,'\n'))local H=false for I,J in aw(aU)do local K=J if typeof(J)=='table'then K=J.Value end local L=aw(m)(E)if aw(m)(K)
==L then H=true break end end assert(H,":SelectItem couldn't find "..E)q:set(E)end function C.SelectItems(D,E)assert(aw(
aV),':SelectItems requires Multiselect to be true')local F,G=ay({SelectItems=E},{SelectItems={}})assert(F,table.concat(G
,'\n'))for H,I in E do local J=false for K,L in aw(aU)do local M=typeof(L)=='table'and aw(m)(L.Value)or aw(m)(L)if I==M
then J=true break end end if J then E[H]=aw(m)(I)else table.remove(E,H)end end p:set(E)end function C.Enable(D)aR:set(
true)end function C.Disable(D)aR:set(false)end function C.Visible(D)aS:set(true)end function C.Invisible(D)aS:set(false)
end return C end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae=ab.Parent.Parent
return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services
local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=an.New,an.Children,an.Value,an.Observer,an.OnEvent,
an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.animate,aw.typecheck,aw.connections,aw.customFont,aw
.references,aw.drag,ac(ae.simpleElements)local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=aE.UIPadding,aE.UICorner,aE.
UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Bind=
Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and
''or'Visible',af.FLAG and''or'FLAG',af.Bind and''or'Bind',af.IgnoreConfig and''or'IgnoreConfig'})assert(aO,table.concat(
aP,'\n'))local aQ,aR,aS,aT,aU,aV,aW,b,k,l,m,n,o,p,q,r,s=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah
.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.find'bindData',ah.add(af),af.Parent,af
.Name,af.DisabledText or as'Component Disabled',af.IsEnabled or as(true),af.Visible or as(true),af.Callback,af.Bind,af.
IgnoreConfig or as(false)local t,u=(af.FLAG or as(k.uid))if ax(t)~=''then u=ak.register(ax(t),{coordinate=as(nil),
keycode=as(nil),mobile=ax(aU.boolean)},'keybind',ax(t)==k.uid)u.user.Value=ax(aU.boolean)and ax(u.status.coordinate)or
ax(u.status.keycode)end local y=as()local function z(A:EnumItem,B:string)local C,D=ax(aR.binds),ax(b.bindData)if table.
find(C,A)then aN(('Key %s is already in use. %s'):format(A.Name,B))else table.insert(C,A)if ax(y)then table.remove(C,
table.find(C,ax(y)))D[ax(y).Name]=nil end y:set(A)D[ax(y).Name]={bind=ax(y),name=ax(m)}b:update('bindData',D)aR:update(
'binds',C)u.status.keycode:set(ax(y).Name)end end local A=as(ax(aQ.string)==ax(k.tab).uid)at(aQ.string):onChange(
function()A:set(ax(aQ.string)==ax(k.tab).uid)end)local B,C=ay(function()return ax(A)and 0 or 1 end,40,1),as(false)local
D=am.InputBegan:Connect(function(D,E)if ax(aU.boolean)then return end if ax(C)then if D.KeyCode and D.KeyCode~=Enum.
KeyCode.Unknown then z(D.KeyCode,'From input box')end C:set(false)task.wait()aW:update('boolean',false)else if D.KeyCode
and D.KeyCode==ax(y)and not E and not ax(aW.boolean)and ax(o)then task.spawn(ax(q))end end end)aA.add(D)local E,F,G=(as(
false))G=ao'TextButton'{Visible=av(function()if not ax(o)then return ax(o)end return ax(E)end),Parent=aC.get(ax(aV.name)
),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=m
,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if F then F:Disconnect(
)F=nil u.status.coordinate:set(G.AbsolutePosition)else task.spawn(ax(q))end end,[ap]={aF(4),aG(16),aH(0,16),ao
'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),
BackgroundTransparency=1,Image=ax(aU.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=l,Visible=av(function()if ax(aT.string)~=''and not string.find(ax(m):lower(),
ax(aT.string):lower())or not ax(p)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency
=1,[ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(o)then return true end return false end),
BackgroundTransparency=ay(function()return ax(A)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=B},ao'TextLabel'{
FontFace=aB('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=B,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=av(
function()return ax(n)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=av(function()if not ax(o)then return false end return ax(A)end),Size=UDim2.new(0.225,0,1,0
),BackgroundColor3=ai.background2,BackgroundTransparency=B,[au'Activated']=function()if ax(aU.boolean)then E:set(true)F=
aD(G,15)return end C:set(true)aW:update('boolean',true)end,[ap]={aG(6),aF(6),aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.
Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ax(aU.boolean)
and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=B},ao'TextLabel'{Visible=not ax(aU.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=B,Text=av(function()return ax(C)and
'Listening'or ax(y)and ax(y).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(aU.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=av(function()return ax(E)and'Move Bind'or'Place Bind'end),
TextTransparency=B}}},ao'TextButton'{Visible=E,Interactable=av(function()if not ax(o)then return false end return ax(A)
end),Size=UDim2.fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=B,[au'Activated']=function()E:
set(false)G.Position=UDim2.fromScale(0.5,0.5)u.status.coordinate:set(G.AbsolutePosition)end,[ap]={aG(6),ao'ImageLabel'{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1
,Image=aj.close,ImageColor3=ai.red,ImageTransparency=B}}},ao'Frame'{Size=av(function()return UDim2.new(0.775,ax(E)and-42
or-3,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=B,[ap]={aG(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aF(8),aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=m,TextTransparency=B,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if ax(aS.boolean)and not ax(s)then u.file:Connect(function(H)local I=true
if H.keycode~=nil then if ax(y)and ax(y).Name==H.keycode then return end local J,K=pcall(function()return Enum.KeyCode[H
.keycode]end)if J then z(K,'File1')end I=false end if I then if r then u.status.keycode:set(ax(r).Name)end end if ax(aU.
boolean)and H.coordinate then G.Position=UDim2.fromOffset(H.coordinate.X+30,H.coordinate.Y+30)E:set(true)end end)if u.
private then if r then u.status.keycode:set(ax(r).Name)end end else if r then u.status.keycode:set(ax(r).Name)end end
local H={}function H.SetName(I,J)local K,L=az({SetName=J},{SetName=''})assert(K,table.concat(L,'\n'))m:set(J)end
function H.SetBind(I,J:EnumItem)local K,L=az({SetBind=J},{SetBind=Enum.keyCode.C})assert(K,table.concat(L,'\n'))z(J,
'At :SetBind')end function H.Enable(I)o:set(true)end function H.Disable(I)o:set(false)end function H.Visible(I)p:set(
true)end function H.Invisible(I)p:set(false)end return H end end)()end,[71]=function()local aa,ab,ac=a(71)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Computed,ak.Observer,ak.OnEvent
,ac(ae.simpleElements)local au,av,aw,ax,ay,az,aA,aB,aC=at.UICorner,at.UIPadding,at.UITextSizeConstraint,at.UIListLayout,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aD,aE,aF,aG,aH,
aI,aJ,aK,aL,aM,aN,aO=aC.get,aC.animate,aC.getStringBounds,aC.customFont,ah.find'selectedTab',ah.find'searchText',ah.find
'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an'Active Keybinds',an''local aP=an(aD(aH.string)==aD(aL.tab).uid)
ap(aH.string):onChange(function()aP:set(aD(aH.string)==aD(aL.tab).uid)end)local aQ,aR=aE(function()return aD(aP)and 0 or
1 end,40,1),an(0)task.spawn(function()aR:set(aF(aD(aO),{Font=aG('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.
round(aD(aM).AbsoluteSize.X)}).Y)end)aD(aM).Changed:Connect(function(aS)if aS:lower()=='absolutesize'then aR:set(aF(aD(
aO),{Font=aG('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aD(aM).AbsoluteSize.X)}).Y)end end)ap(aO):
onChange(function()aR:set(aF(aD(aO),{Font=aG('Montserrat',Enum.FontWeight.Bold),Size=16,Width=math.round(aD(aM).
AbsoluteSize.X)}).Y)end)local function aS(aT)local aU={}table.foreach(aT,function(aV,aW)aU[aV]=aW.Name end)return table.
concat(aU,', ')end local aT,aU,aV=(an'Active Keybinds')aV,aU=ac(ab.Parent.module){Name=aT,Children={}}local function aW(
b)local k,l={ax(ay.LayoutOrder,az.Vertical,aA.Center,aB.Top,UDim.new(0,5))},aD(aK.bindData)for m,n in aD(aJ.binds)do
local o=l[n.Name]table.insert(k,al'TextLabel'{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text,
FontFace=aG('Montserrat',Enum.FontWeight.Regular),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,Text=ao(function
()if o.boolean then return`[{o.bind.Name}] {o.name} (<i>{string.upper(tostring(aD(o.boolean)))}</i>)`end return`[{o.bind
.Name}] {o.name}`end)})end aU(k)end al'TextButton'{Visible=ao(function()if aD(aI.string)~=''and not string.find(aD(aN):
lower(),aD(aI.string):lower())and not string.find(aD(aO):lower(),aD(aI.string):lower())then return false end return true
end),BackgroundColor3=ai.background2,Parent=aM,BackgroundTransparency=aQ,Size=ao(function()return UDim2.new(1,0,0,36+aD(
aR))end),AutomaticSize=Enum.AutomaticSize.Y,[as'Activated']=function()if typeof(aV)=='Instance'then aV:Destroy()aV=nil
end aV,aU=ac(ab.Parent.module){Name=aT,Children={}}aW(aD(aJ.binds))end,[am]={au(6),av(6),al'ImageLabel'{ZIndex=0,Size=
UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.text2,ImageTransparency=aQ},al
'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.fromOffset(25,0),BackgroundTransparency
=1,TextTransparency=aQ,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=18,FontFace=aG('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aN,[am]={aw(1,18)}},al'TextLabel'{
Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,25),BackgroundTransparency=1,TextTransparency=aQ,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=16,FontFace=aG('Montserrat',Enum
.FontWeight.Medium),TextColor3=ai.text2,Text=aO,Size=ao(function()return UDim2.new(1,-4,0,aD(aR))end)}}}ap(aJ.binds):
onChange(function()aW(aD(aJ.binds))end)aW(aD(aJ.binds))aO:set(aS(aD(aJ.binds)))ap(aJ.binds):onChange(function()aO:set(
aS(aD(aJ.binds)))end)end end)()end,[72]=function()local aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap
=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au=ap.UICorner,ap.UIPadding,ac(ae.
utilities)local av,aw,ax,ay=au.get,au.typecheck,au.animate,au.customFont local az,aA=aw(af,{Text='',Visible=false},{af.
Visible and''or'Visible'})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aG=ah.find'selectedTab',ah.find
'searchText',ah.add(af),af.Parent,af.Text,af.Visible or am(true)local aH=am(av(aB.string)==av(aD.tab).uid)ao(aB.string):
onChange(function()aH:set(av(aB.string)==av(aD.tab).uid)end)local aI=ax(function()return av(aH)and 0 or 1 end,40,1)ak
'Frame'{Visible=an(function()if av(aC.string)~=''and not string.find(av(aF):lower(),av(aC.string):lower())or not av(aG)
then return false end return true end),Size=UDim2.new(1,0,0,36),Parent=aE,BackgroundTransparency=aI,BackgroundColor3=ai.
background2,[al]={as(6),at(0,8),ak'TextLabel'{FontFace=ay('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=
true,BackgroundTransparency=1,TextTransparency=aI,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=
Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return av(aF)end),[al]={
ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}local aJ={}function aJ.SetText(aK,aL)local aM,aN=aw({SetText=
aL},{SetText=''})assert(aM,table.concat(aN,'\n'))aF:set(aL)end function aJ.Visible(aK)aG:set(true)end function aJ.
Invisible(aK)aG:set(false)end return aJ end end)()end,[73]=function()local aa,ab,ac=a(73)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag
.Fusion local al,am,an,ao,ap,as,at=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local
au,av,aw,ax,ay,az,aA,aB=at.get,at.animate,at.typecheck,at.customFont,at.drag,at.references,at.connections,ac(ae.
simpleElements)local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name={},Children={}},{})assert(aJ,table.concat(aK,
'\n'))local aL,aM,aN,aO=ah.find'instanceName',ah.find'absoluteOffset',af.Name,an(af.Children)local aP,aQ,aR=az.get(au(aL
.name)),(an(false))aR=al'TextButton'{Parent=aP,Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10+au(aM.
number)),BackgroundTransparency=1,[ap'MouseButton1Down']=function()aQ:set(true)end,[am]={al'Frame'{Position=UDim2.new(
0.5,-120,0,0),Size=UDim2.fromOffset(240,0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={aE(4
),aD(8),al'TextButton'{AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),
BackgroundColor3=ai.selectedTab,[ap'Activated']=function()aR:Destroy()end,[am]={aE(6),al'ImageLabel'{AnchorPoint=Vector2
.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,
ImageColor3=ai.red,ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,[am]={aC(aF.LayoutOrder,aG.Vertical,aH.Center,aI.Top,UDim.new(0,8)),al'Frame'{Size=av(function()return
au(aQ)and UDim2.new(0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=av(
function()return au(aQ)and 0 or 0.5 end,40,1),[am]={aE(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=ax(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=aN,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},al'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=
Enum.AutomaticSize.Y,[am]=aO}}}}}}}}}local aS,aT=ay(aR,15)local aU=aT:Connect(function()aQ:set(false)end)aA.add(aS)aA.
add(aU)aR.Destroying:Once(function()aS:Disconnect()aU:Disconnect()end)return aR,function(...)aO:set(...)end end end)()
end,[74]=function()local aa,ab,ac=a(74)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.
Computed,ac(ae.utilities)local ap,as,at,au,av,aw=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.
simpleElements)local ax,ay,az,aA,aB,aC,aD,aE,aF=aw.UICorner,aw.UIPadding,aw.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,av(af,{Title='',Body='',Duration=1,Image='',ImageColor=
Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'
})assert(aE,table.concat(aF,'\n'))local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ=am(af.Title),am(af.Body),am(af.Duration),am(af.
Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250)
local aR=am(at(ap(aH),{Size=14,Font=au('Montserrat',Enum.FontWeight.Medium),Width=ap(aQ)-8-(aJ and 32 or 0)}))local aS=
am(20+math.clamp(ap(aR).Y+4+10+(#ap(aL)>0 and 26 or 0),#ap(aL)>0 and 56 or 30,9e9))local function aT(aU,aV)local aW=1
for b=1,aU do aW=aW*10 end local b=tostring(math.round(aV*aW)/aW)local k=string.split(b,'.')if#k==1 then local l=''for m
=1,aU do l=l..'0'end b=b..'.'..l end return b end local aU,aV={}for aW,b in ap(aL)do local k,l=av({Button=b},{Button={}}
)assert(k,table.concat(l,'\n'))k,l=av(b,{Name='',Callback=function()end})assert(k,table.concat(l,'\n'))local m,n=b.Name,
b.Callback local o=aj'TextButton'{Size=UDim2.new(1/#ap(aL),-2,1,-4),TextSize=14,Text=m,FontFace=au('Montserrat',Enum.
FontWeight.Bold),BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(n)aN:
set(false)task.wait(0.4)aM:set(false)task.delay(0.3,function()aO:set(true)end)task.wait(2)aV:Destroy()end,[al]={ax(4)}}
table.insert(aU,o)end aV=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=as(function()return UDim2.fromOffset(
ap(aQ),ap(aM)and ap(aS)+5 or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(
aO)end),Interactable=aN,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.
fromOffset(ap(aQ),ap(aS)),[ak'Activated']=function()aN:set(false)task.wait(0.4)aM:set(false)task.delay(0.3,function()aO:
set(true)end)task.wait(2)aV:Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=
UDim2.fromOffset(ap(aQ),ap(aS)),Position=as(function()return UDim2.fromScale(ap(aN)and 0 or 1.2,1)end,30,1),[al]={ay(0,4
),az(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ax(4),aj'Frame'{Visible=ap(aJ)~=''and true or false,
Size=UDim2.new(0,24,1,0),BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=aJ,ImageColor3=aK}}},aj'Frame'{Size=UDim2.
new(1,ap(aJ)~=''and-28 or 0,1,0),BackgroundTransparency=1,[al]={ay(2,0),az(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top),aj
'TextLabel'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=au('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aG},aj'TextLabel'{Size=UDim2.
new(1,0,0,1),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=au(
'Montserrat',Enum.FontWeight.Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top,TextWrapped=true,RichText=true,TextColor3=ah.text2,Text=aH},aj'Frame'{Visible=an(function()return#ap(
aL)>0 and true or false end),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,[al]={az(aA.LayoutOrder,aB.Horizontal,aC.
Center,aD.Center,UDim.new(0,2)),aU}},aj'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=au('Montserrat',Enum.FontWeight.
Medium),Text=aP,TextColor3=ah.text,TextSize=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}
task.delay(0.4,function()aN:set(true)end)task.spawn(function()repeat task.wait()until ap(aN)local k,l=(tick())repeat l=
tick()-k aP:set(aT(1,math.clamp(l,0,ap(aI))))task.wait()until l>ap(aI)end)task.spawn(function()aM:set(true)repeat task.
wait()until ap(aN)task.wait(ap(aI))task.wait(0.2)aN:set(false)task.wait(0.4)aM:set(false)task.delay(0.3,function()aO:
set(true)end)task.wait(2)aV:Destroy()end)end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local as,at,au,av=ap.
UICorner,ap.UIPadding,ap.UITextSizeConstraint,ac(ae.utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.getStringBounds,
av.customFont,av.typecheck local aB,aC=aA(af,{Title='',Visible=false,Body=''},{af.Visible and''or'Visible'})assert(aB,
table.concat(aC,'\n'))local aD,aE,aF,aG,aH,aI,aJ=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,
af.Body,af.Visible or am(true)local aK=am(aw(aD.string)==aw(aF.tab).uid)ao(aD.string):onChange(function()aK:set(aw(aD.
string)==aw(aF.tab).uid)end)local aL,aM=ax(function()return aw(aK)and 0 or 1 end,40,1),am(0)task.spawn(function()aM:set(
ay(aw(aI),{Font=az('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(aw(aG).AbsoluteSize.X)}).Y)end)aw(aG).
Changed:Connect(function(aN)if aN:lower()=='absolutesize'then aM:set(ay(aw(aI),{Font=az('Montserrat',Enum.FontWeight.
Medium),Size=12,Width=math.round(aw(aG).AbsoluteSize.X)}).Y)end end)ao(aI):onChange(function()aM:set(ay(aw(aI),{Font=az(
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
IgnoreConfig and''or'IgnoreConfig'})assert(aL,table.concat(aM,'\n'))local aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,k,l,m,n=ah.
find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or at
'Component Disabled',af.IsEnabled or at(true),af.Visible or at(true),af.Callback,af.Max,af.Min,af.DisplayAsPercent or
at(false),af.DecimalPlace or at(0),af.IgnoreConfig or at(false)local o=az(af.Default)and at(math.clamp(az(af.Default),
az(k),az(b)))if not az(o)then o=at(az(k))end local p=(af.FLAG and az(af.FLAG)~='')and az(af.FLAG)or aQ.uid local q=ak.
register(p,{percentageOf=at(az(k))},'slider',p==aQ.uid)q.user.Value=az(q.status.percentageOf)local r=at(az(aN.string)==
az(aQ.tab).uid)au(aN.string):onChange(function()r:set(az(aN.string)==az(aQ.tab).uid)end)local s=aA(function()return az(r
)and 0 or 1 end,40,1)local function t(u,y,z,A,B)return(1-((u-y)/(z-y)))*A+((u-y)/(z-y))*B end local function u(y)if az(m
)==0 then return math.floor(y)end return tonumber(string.format('%.'..az(m)..'f',y))end local y=at(0)au(q.status.
percentageOf):onChange(function()y:set(t(az(q.status.percentageOf),az(k),az(b),0,1))if not az(aU)then return end task.
spawn(az(aW),az(q.status.percentageOf))end)local z,A,B,C=at(),at(10),at(),at(false)am.InputEnded:Connect(function(D)if(D
.UserInputType==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch)and az(C)then C:set(false)
end end)ap'Frame'{Parent=aR,Visible=aw(function()if az(aP.string)~=''and not string.find(az(aS):lower(),az(aP.string):
lower())or not az(aV)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,
BackgroundTransparency=aA(function()if az(r)then return 0 end return 1 end,40,1),[as]={aG(6),ap'Frame'{ZIndex=2,Visible=
aw(function()if not az(aU)then return true end return false end),BackgroundTransparency=aA(function()return az(r)and 0.2
or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[as]={aG(6),ap'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=s},ap'TextLabel'{FontFace=aC('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=s,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=aw(function()return az(aT)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[as]={aF(0,5)}}}},ap'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[as]={
aE(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,6)),aF(0,8),ap'TextLabel'{FontFace=aC('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=s,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=aS,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,[as]={aE(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.
new(0.2,-5,1,0),BackgroundTransparency=1,[as]={aG(4),aE(aH.LayoutOrder,aI.Vertical,aJ.Right,aK.Center,UDim.new(0,1)),ap
'TextBox'{FontFace=aC('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai
.text2,TextTransparency=s,TextScaled=true,ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,
0.5,0),Text=aw(function()if az(l)then return tostring(u(az(y)*100))..'%'end return az(q.status.percentageOf)or''end),
TextXAlignment=Enum.TextXAlignment.Right,RichText=true,AutomaticSize=Enum.AutomaticSize.X,[av'Changed']=function(D)local
E=az(B)if D=='AbsoluteSize'and E and E.AbsoluteSize then A:set(E.AbsoluteSize.X)end end,[av'FocusLost']=function()local
D=az(B)if tonumber(D.Text)then q.status.percentageOf:set(math.clamp(tonumber(D.Text),az(k),az(b)))else if az(l)then D.
Text=tostring(u(az(y)*100))..'%'end D.Text=az(q.status.percentageOf)end end,[ax]=B,[as]={aF(0,5,0,5)}},ap'Frame'{
BackgroundColor3=ai.text2,BackgroundTransparency=aA(function()if az(r)then return 0.5 end return 1 end,40,1),Size=aA(
function()return UDim2.fromOffset(az(A),2)end,40,1),[as]={aG(0,1)}}}},ap'TextButton'{Interactable=aw(function()if not
az(aU)then return false end return az(r)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[av'MouseButton1Down'
]=function()C:set(true)end,[av'TouchLongPress']=function()C:set(true)end,[av'InputBegan']=function(D)if D.UserInputType
==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch and az(z)then local E,F=am:
GetMouseLocation().X,az(z).Size.X.Offset local G=E-(az(z).AbsolutePosition.X+F)while az(C)and task.wait()do local H=am:
GetMouseLocation().X local I=math.clamp(F+(H-E)+G,0,az(z).AbsoluteSize.X)q.status.percentageOf:set(u(t(I,0,az(z).
AbsoluteSize.X,az(k),az(b))))an.RenderStepped:Wait()end end end,[ax]=z,[as]={aF(0,6),ap'Frame'{AnchorPoint=Vector2.new(0
,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=s,[
as]={aG(0,1)}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,
BackgroundTransparency=s,Size=aA(function()return UDim2.new(az(y),0,0,4)end,40,1),[as]={aG(0,1),ap'ImageLabel'{Image=aj.
circle,BackgroundTransparency=1,ImageColor3=ai.selectedTab,ImageTransparency=s,Size=UDim2.fromOffset(18,18),Position=
UDim2.new(1,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),[as]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),Size=UDim2.fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=aA(function()if az(r)
then return 0.8 end return 1 end,40,1)}}}}}}}}}}}}}if az(aO.boolean)and not az(n)then q.file:Connect(function(D)local E=
true if D~=nil then q.status.percentageOf:set(D)E=false end if E then q.status.percentageOf:set(az(o))end end)if q.
private then q.status.percentageOf:set(az(o))end else q.status.percentageOf:set(az(o))end local D={}function D.SetName(E
,F)local G,H=aB({SetName=F},{SetName=''})assert(G,table.concat(H,'\n'))aS:set(F)end function D.SetValue(E,F)local G,H=
aB({SetValue=F},{SetValue=0})assert(G,table.concat(H,'\n'))q.status.percentageOf:set(math.clamp(F,az(k),az(b)))end
function D.Enable(E)aU:set(true)end function D.Disable(E)aU:set(false)end function D.Visible(E)aV:set(true)end function
D.Invisible(E)aV:set(false)end return D end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion
local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Observer,aj.OnEvent,ac(ae.utilities)local as,at,au,av,aw=ap.get,
ap.animate,ap.typecheck,ap.customFont,ac(ae.simpleElements)local ax,ay,az,aA,aB,aC,aD,aE,aF=aw.UIListLayout,aw.UIPadding
,aw.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,au(af,{Name='',Image=''},
{af.Image and''or'Image'})assert(aE,table.concat(aF,'\n'))local aG,aH,aI,aJ,aK,aL,aM=ah.find'selectedTab',ah.find
'isFirst',ah.add(af),af.Parent,af.Name,(am(false))if af.Image then aM=af.Image aL:set(true)end local aN=am(false)an(aG.
string):onChange(function()local aO=as(aG.string)aN:set(aO==aI.uid)end)ak'TextButton'{Name=aI.uid,Parent=aJ,Size=UDim2.
new(1,0,0,36),BackgroundColor3=at(function()return as(aN)and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao
'Activated']=function()aG:update('string',aI.uid)end,[al]={az(4),ay(6),ax(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center
,UDim.new(0,4)),ak'ImageLabel'{Visible=aL,BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,
Image=aM,ImageTransparency=at(function()return as(aN)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=as(aL)and UDim2.new(1,-
28,1)or UDim2.fromScale(1,1),FontFace=av('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=aK,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=at(function()return as(aN)and 0 or 0.6
end,40,1),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}if not as(aH.boolean)then aH:update('boolean',
true)aG:update('string',aI.uid)end return aI end end)()end,[78]=function()local aa,ab,ac=a(78)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=
ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,as,at,au,av=am.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj
'ScrollingFrame'{ZIndex=al(function()return(au(av.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=
UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,as.Center
,at.Top,UDim.new(0,4))}}end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent
.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
Fusion local am,an,ao,ap,as,at,au,av=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.
utilities)local aw,ax,ay,az,aA=av.get,av.animate,av.customFont,av.typecheck,ac(ae.simpleElements)local aB,aC,aD,aE,aF,aG
,aH,aI,aJ,aK=aA.UIPadding,aA.UICorner,aA.UITextSizeConstraint,aA.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum
.HorizontalAlignment,Enum.FillDirection,az(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()
end,FLAG='',PlaceHolderText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',IgnoreConfig=true},{af.
DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.PlaceHolderText and''
or'PlaceHolderText',af.ClearTextOnFocus and''or'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or
'OnLeave',af.Default and''or'Default',af.FLAG and''or'FLAG',af.IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.
concat(aK,'\n'))local aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,b,k,l,m=ah.find'selectedTab',ah.find'useConfig',ah.find
'searchText',ah.add(af),af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible
or ao(true),af.Callback,af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.ClearTextOnFocus or
ao(false),af.IgnoreConfig or ao(false),af.PlaceHolderText or ao''local n,o=(af.FLAG or ao(aO.uid))if aw(n)~=''then o=ak.
register(aw(n),{correctText=ao''},'textbox',aw(n)==aO.uid)o.user.Value=aw(o.status.correctText)end local p=ao(aw(aL.
string)==aw(aO.tab).uid)as(aL.string):onChange(function()p:set(aw(aL.string)==aw(aO.tab).uid)end)local q,r,s,t,u,y,z=ax(
function()return aw(p)and 0 or 1 end,40,1),ao(),ao(false),ao'',ao(aw(o.status.correctText)),ao'',ao(false)as(t):
onChange(function()if aw(aV)then if tonumber(aw(t))or aw(t)==''then u:set(aw(t))end else u:set(aw(t))end local A=aw(r)A.
Text=aw(u)if aw(b)then return end if aw(aV)then if(tonumber(aw(t))or aw(t)=='')and aw(y)~=aw(t)then task.spawn(aw(aU),
aw(t))o.status.correctText:set(aw(t))y:set(aw(t))end else if aw(y)==aw(t)then return end task.spawn(aw(aU),aw(t))o.
status.correctText:set(aw(t))y:set(aw(t))end end)as(s):onChange(function()if aw(b)and not aw(s)then if aw(aV)then if(
tonumber(aw(t))or aw(t)=='')and aw(y)~=aw(t)then task.spawn(aw(aU),aw(t))o.status.correctText:set(aw(t))y:set(aw(t))end
else if aw(y)==aw(t)then return end task.spawn(aw(aU),aw(t))o.status.correctText:set(aw(t))y:set(aw(t))end end end)local
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
Text=u,TextTransparency=q,ClearTextOnFocus=k,[at]=r,[au'Changed']=function(C)local D=aw(r)if D.TextBounds.X>D.
AbsoluteSize.X then z:set(true)end if D and D.Text and C=='Text'then t:set(D.Text)end end,[au'Focused']=function()s:set(
true)end,[au'FocusLost']=function()s:set(false)end,[an]={am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[
an]={am'UIGradient'{Rotation=0,Color=ax(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get
'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,40,1),Transparency=ax(function()if not aw(p)then
return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1
,1)}end if aw(z)then if aw(s)then return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(
0.1,1),NumberSequenceKeypoint.new(1,1)}else return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end end return NumberSequence.new{
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if aw(aM.boolean)and not aw(l)then o
.file:Connect(function(C)local D=true if C~=nil then if aw(b)then s:set(true)end t:set(C)if aw(b)then s:set(false)end D=
false end if D then if aw(b)then s:set(true)end t:set(aw(aW))if aw(b)then s:set(false)end end end)if o.private then if
aw(b)then s:set(true)end t:set(aw(aW))if aw(b)then s:set(false)end end else if aw(b)then s:set(true)end t:set(aw(aW))if
aw(b)then s:set(false)end end local C={}function C.SetName(D,E)local F,G=az({SetName=E},{SetName=''})assert(F,table.
concat(G,'\n'))aQ:set(E)end function C.SetInput(D,E)local F,G=az({SetInput=E},{SetInput=aw(aV)and 1 or''})assert(F,table
.concat(G,'\n'))t:set(E)end function C.Enable(D)aS:set(true)end function C.Disable(D)aS:set(false)end function C.Visible
(D)aT:set(true)end function C.Invisible(D)aT:set(false)end return C end end)()end,[80]=function()local aa,ab,ac=a(80)
local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag
.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,as,at,au,av,aw=
an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local ax,ay,az,aA,aB,aC,aD,aE=aw.get,aw.
animate,aw.typecheck,aw.connections,aw.customFont,aw.references,aw.drag,ac(ae.simpleElements)local aF,aG,aH,aI,aJ,aK,aL,
aM,aN,aO,aP=aE.UIPadding,aE.UICorner,aE.UITextSizeConstraint,aE.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],az(af,{Name='',DisabledText='',IsEnabled=false,Visible=
false,Callback=function()end,FLAG='',Default=false,LinkKeybind=true,IgnoreConfig=true},{af.DisabledText and''or
'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Default and''or
'Default',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or'IgnoreConfig',af.IgnoreConfig and''or
'IgnoreConfig'})assert(aO,table.concat(aP,'\n'))aO,aP=az(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or
'Bind'})assert(aO,table.concat(aP,'\n'))local aQ,aR,aS,aT,aU,aV,aW,b,k,l,m,n,o,p,q,r,s,t,u,y=ah.find'selectedTab',ah.
find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',
ah.find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.DisabledText or as'Component Disabled',af.IsEnabled
or as(true),af.Visible or as(true),af.Callback,af.Default or as(false),af.Bind,af.IgnoreConfig or as(false),af.
LinkKeybind or as(false)local z,A=(af.FLAG or as(l.uid))if ax(z)~=''then A=ak.register(ax(z),{boolean=as(false),keycode=
as(nil),coordinate=as(nil)},'toggle',ax(z)==l.uid)A.user.Value=ax(A.status.boolean)end local B=as()local function C(D:
EnumItem,E:string)local F,G=ax(aR.binds),ax(b.bindData)if table.find(F,D)then aN(('Key %s is already in use. %s'):
format(D.Name,E))else table.insert(F,D)if ax(B)then table.remove(F,table.find(F,ax(B)))G[ax(B).Name]=nil end B:set(D)G[
ax(B).Name]={bind=ax(B),name=ax(n),boolean=A.status.boolean}b:update('bindData',G)aR:update('binds',F)A.status.keycode:
set(ax(B).Name)end end at(A.status.boolean):onChange(function()if ax(p)then task.spawn(ax(r),ax(A.status.boolean))end
end)table.insert(k.list,A.status.boolean)local D=as(ax(aQ.string)==ax(l.tab).uid)at(aQ.string):onChange(function()D:set(
ax(aQ.string)==ax(l.tab).uid)end)local E,F=ay(function()return ax(D)and 0 or 1 end,40,1),as(false)local G=am.InputBegan:
Connect(function(G,H)if ax(aV.boolean)then return end if ax(F)then if G.KeyCode and G.KeyCode~=Enum.KeyCode.Unknown then
C(G.KeyCode,'From input box')end F:set(false)task.wait()aW:update('boolean',false)else if G.KeyCode and G.KeyCode==ax(B)
and not H and not ax(aW.boolean)and ax(p)then A.status.boolean:set(not ax(A.status.boolean))end end end)aA.add(G)local H
,I,J=(as(false))J=ao'TextButton'{Visible=av(function()if not ax(p)then return ax(p)end return ax(H)end),Parent=aC.get(
ax(aU.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=
true,Text=n,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[au'Activated']=function()if I then I:Disconnect(
)I=nil A.status.coordinate:set(J.AbsolutePosition)else A.status.boolean:set(not ax(A.status.boolean))end end,[ap]={aF(4)
,aG(16),aH(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=ax(aV.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=m,Visible=av(function()if ax(aT.string)~=''and not string.
find(ax(n):lower(),ax(aT.string):lower())or not ax(q)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=av(function()if not ax(p)then return true end return false end
),BackgroundTransparency=ay(function()return ax(D)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=E},ao
'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=E,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=av(function()return ax(o)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aF(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aI(aJ.LayoutOrder,aK.Horizontal,aL.Left,aM.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=av(function()if not ax(p)then return false end return ax(D)end),Size=av(function()return
ax(y)and UDim2.new(0.775,ax(H)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=E,[au'Activated']=function()if not ax(p)then return end A.status.boolean:set(not ax(A.status.
boolean))end,[ap]={aG(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aF(8),aI(aJ.LayoutOrder,aK.
Horizontal,aL.Left,aM.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=E,BackgroundColor3=ay(function()return ax(A.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aG(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=ay(
function()if not ax(D)then return 1 end if ax(A.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=aB('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=n,TextTransparency=E,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=H,
Interactable=av(function()if not ax(p)then return false end return ax(D)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=E,[au'Activated']=function()H:set(false)J.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aG(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=E}}},ao
'TextButton'{Visible=y,Interactable=av(function()if not ax(p)then return false end return ax(D)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=E,[au'Activated']=function()if ax(aV.boolean)then H:set(
true)I=aD(J,15)return end F:set(true)aW:update('boolean',true)end,[ap]={aG(6),aF(6),aI(aJ.LayoutOrder,aK.Horizontal,aL.
Left,aM.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=ax(aV.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=E},ao'TextLabel'{Visible=not ax(aV.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=E,Text=av(function()return ax(F)and
'Listening'or ax(B)and ax(B).Name or'Waiting'end)},ao'TextLabel'{Visible=ax(aV.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aB('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=av(function()return ax(H)and'Move Bind'or'Place Bind'end),
TextTransparency=E}}}}}}}if ax(aS.boolean)and not ax(u)then A.file:Connect(function(K)local L,M=true,true if K.boolean~=
nil then A.status.boolean:set(K.boolean)L=false end if K.keycode~=nil then if ax(B)and ax(B).Name==K.keycode then return
end local N,O=pcall(function()return Enum.KeyCode[K.keycode]end)if N then C(O,'File1')end M=false end if L then A.status
.boolean:set(ax(s))end if M then if t then A.status.keycode:set(ax(t).Name)end end if ax(aV.boolean)and K.coordinate
then J.Position=UDim2.fromOffset(K.coordinate.X+30,K.coordinate.Y+30)H:set(true)end end)if A.private then A.status.
boolean:set(ax(s))if t then A.status.keycode:set(ax(t).Name)end end else A.status.boolean:set(ax(s))if t then A.status.
keycode:set(ax(t).Name)end end local K={}function K.SetName(L,M)local N,O=az({SetName=M},{SetName=''})assert(N,table.
concat(O,'\n'))n:set(M)end function K.SetValue(L,M:boolean)local N,O=az({SetValue=M},{SetValue=true})assert(N,table.
concat(O,'\n'))A.status.boolean:set(M)end function K.SetBind(L,M:EnumItem)assert(ax(y),'Requires LinkKeybind')local N,O=
az({SetBind=M},{SetBind=Enum.keyCode.C})assert(N,table.concat(O,'\n'))C(M,'At :SetBind')end function K.Enable(L)p:set(
true)end function K.Disable(L)p:set(false)end function K.Visible(L)q:set(true)end function K.Invisible(L)q:set(false)end
return K end end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(function(...)local ae,af,ag=ab.Parent.Parent,
'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab.Parent.notification),ac(ae.utilities).references
local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList',Title=af,Body=ah,Duration=3,Image=al.alert,
ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag end)()end,[83]=function()local aa,ab,ac=a(83)
local ad return(function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(ae.Bundles)local ai=ah.services
local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao,ap,as,at,au,av,aw,ax=an.New,
an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local ay,az,aA,aB,aC,aD,aE,aF,aG=ax.
UIListLayout,ax.UICorner,ax.UITextSizeConstraint,ax.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment
,Enum.VerticalAlignment,ac(ae.utilities)local aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT=aG.get,aG.references,aG.drag,aG.
customFont,aG.animate,aG.connections,ac(ab.Parent.Parent.components.warn)[1],as(),as(),as(),as(),as(),as()aI.add(aS,aR,
aQ,aP,aO,aT)local aU,aV,aW,b,k,l,m,n,o,p,q,r,s,t,u,y=am.find'absoluteOffset',am.find'instanceName',am.find'selectedTab',
am.find'searchText',am.find'currentBinds',am.find'isVisible',am.find'isMobile',am.find'isListening',am.find'bindData',am
.find'destroyFunc'.func,as(750),as(500),as(false),as(false),as(false),as(false)av(s):onChange(function()if aH(s)then t:
set(not aH(t))task.wait(0.3)u:set(not aH(u))task.wait(0.3)y:set(not aH(y))else y:set(not aH(y))task.wait(0.3)u:set(not
aH(u))task.wait(0.3)t:set(not aH(t))end end)av(u):onChange(function()q:set(aH(u)and 212 or 750)end)av(y):onChange(
function()r:set(aH(y)and 74 or 500)end)local z,A,B=as(false),as(),as(false)local function C(D:EnumItem,E:string)local F,
G=aH(k.binds),aH(o.bindData)if table.find(F,D)then aN(('Key %s is already in use. %s'):format(D.Name,E))else table.
insert(F,D)if aH(A)then table.remove(F,table.find(F,aH(A)))G[aH(A).Name]=nil end A:set(D)B:set(true)G[aH(A).Name]={bind=
aH(A),name='Toggle Interface'}o:update('bindData',G)k:update('binds',F)end end if not aH(m.boolean)then C(af.HideBind,
'init')end local D=as''av(aW.string):onChange(function()local E=aH(aW.string)local F=am.find(E)D:set(aH(F.Name):upper())
end)local E,F,G=(as(af.Icon or''))local H=ao'ScreenGui'{Name=aH(aV.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=
false,IgnoreGuiInset=true,[at]=aS,[ap]={ao'Frame'{Name='screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},
ao'Frame'{Name='container',Visible=l.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aH(aU.number)
),Size=aL(function()return UDim2.fromOffset(aH(q),aH(r))end,30,1),BackgroundColor3=ak.background,[at]=aO,[ap]={az(6),aB(
16),ay(aC.LayoutOrder,aD.Horizontal,aE.Right,aF.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),
Size=aL(function()return UDim2.new(0,math.clamp(aH(q)-32-180-16,212,9e9),aH(t)and 0 or 1,0)end,30,1),
BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0
,10),BackgroundTransparency=1,Text=D,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,
FontFace=aK('Montserrat',Enum.FontWeight.ExtraBold),TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]
={ay(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency
=1,[ap]={ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),
BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Top,UDim.new(0,5)),ao'ImageLabel'{Visible=au(
function()if aH(E)~=''then return true end return false end),Size=UDim2.fromOffset(44,44),BackgroundTransparency=1,Image
=E,ImageColor3=ak.text2},ao'Frame'{Size=au(function()if aH(E)~=''then return UDim2.new(1,-49,1,0)end return UDim2.new(1,
0,1,0)end),BackgroundTransparency=1,[ap]={ay(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.new(0,4)),ao'TextLabel'{Size
=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=aK('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=
true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.
Description,TextColor3=ak.text2,FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left}}}}},ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2
,[aw'Activated']=function()local H=aH(aT)if H then H:CaptureFocus()end end,[ap]={aB(0,4),az(6),ay(aC.LayoutOrder,aD.
Horizontal,aE.Center,aF.Center,UDim.new(0,4)),ao'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image
=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aK(
'Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[aw'Changed']=function(H)local I=aH(aT)if
H~='Text'and I and I.Text then return end b:update('string',I.Text)end,[at]=aT}}}}},ao'Frame'{Name='tabFrameList',Size=
UDim2.new(1,0,1,-60),BackgroundTransparency=1,[at]=aQ}}}}},ao'Frame'{Size=aL(function()return aH(y)and UDim2.new(0,180,0
,44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={az(6),ay(aC.LayoutOrder
,aD.Vertical,aE.Center,aF.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={ay(aC.
LayoutOrder,aD.Horizontal,aE.Center,aF.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=
ak.selectedTab,[aw'Activated']=function()if aH(m.boolean)then B:set(true)G=aJ(F,15)return end z:set(true)n:update(
'boolean',true)end,[ap]={az(6),aB(6),ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,5)),ao'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aH(m.boolean)and al.finger or al.command,
ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not aH(m.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=au(function()return aH(z)and'Listening'or aH(A)and aH(A).Name or'Waiting'
end)},ao'TextLabel'{Visible=aH(m.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aK('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=au(function()
return aH(B)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.
selectedTab,[aw'Activated']=function()s:set(not aH(s))end,[ap]={az(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=au(function()return aH(s)
and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=ak.selectedTab,[aw'Activated']=function()if not aH(B)then ac(ae.components.notification){Parent=aR,
Title='Darius Interface',Body=`You must {aH(m.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end l:update('boolean',not aH(l.boolean))end,[ap]={az(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=aL(function()return aH(y)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[at]=aP,[ap]={ay(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.new(0,6)),aB(0,10)}},ao
'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[aw'Activated']=function()aH(p)()end,[ap]={az(4)
,aB(6),ay(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,4)),ao'ImageLabel'{BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),
FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,Text='Destroy Interface',
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-
20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[at]=aR,[ap]={ay(aC.LayoutOrder
,aD.Vertical,aE.Right,aF.Bottom)}}}}if H.screenSize.AbsoluteSize.X<aH(q)then q:set(H.screenSize.AbsoluteSize.X*0.9)end
if H.screenSize.AbsoluteSize.Y<aH(r)then r:set(H.screenSize.AbsoluteSize.Y*0.9)end F=ao'TextButton'{Visible=au(function(
)return(aH(B)and aH(m.boolean))end),Interactable=au(function()return(aH(B)and aH(m.boolean))end),Parent=aI.get(aH(aV.
name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,
Text='Toggle UI',FontFace=aK('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[aw'Activated']=function()if G then G:Disconnect(
)G=nil else l:update('boolean',not aH(l.boolean))end end,[ap]={aB(4),az(16),aA(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aH(m
.boolean)and al.finger or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local I=aj.InputBegan:
Connect(function(I,J)if aH(m.boolean)then return end if aH(z)then if I.KeyCode and I.KeyCode~=Enum.KeyCode.Unknown then
C(I.KeyCode,'From input box')end z:set(false)task.wait()n:update('boolean',false)else if I.KeyCode and I.KeyCode==aH(A)
and not J and not aH(n.boolean)then l:update('boolean',not aH(l.boolean))end end end)aM.add(I)local J=aJ(aI.get
'container',15)aM.add(aI.get'container':GetPropertyChangedSignal'Position':Connect(function()local K=aI.get'container'
local L=K.AbsolutePosition+Vector2.new(aH(q)/2,aH(r)/2)if(L.X-H.screenSize.AbsoluteSize.X)/aH(q)>(aH(s)and 0.3 or 0.435)
then J:Disconnect()K.Position=UDim2.new(0.5,0,K.Position.Y.Scale,K.Position.Y.Offset)J=aJ(aI.get'container',15)end if-((
L.X-H.screenSize.AbsoluteSize.X)/aH(q)+1)>(aH(s)and 3.9 or 0.8)then J:Disconnect()K.Position=UDim2.new(0.5,0,K.Position.
Y.Scale,K.Position.Y.Offset)J=aJ(aI.get'container',15)end if(L.Y-(H.screenSize.AbsoluteSize.Y+aH(aU.number)))/aH(r)>(aH(
s)and 0.2 or 0.32)then J:Disconnect()K.Position=UDim2.new(K.Position.X.Scale,K.Position.X.Offset,0.5,aH(aU.number))J=aJ(
aI.get'container',15)end if-((L.Y-(H.screenSize.AbsoluteSize.Y+aH(aU.number)))/aH(r)+1)>(aH(s)and 8 or 0.935)then J:
Disconnect()K.Position=UDim2.new(K.Position.X.Scale,K.Position.X.Offset,0.5,aH(aU.number))J=aJ(aI.get'container',15)end
end))end end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...)return setmetatable({},{__index=
function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[85]=
function()local aa,ab,ac=a(85)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(
af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.
Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[86]=function()
local aa,ab,ac=a(86)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af,ag)ag=
ag or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[87]=function()local aa,ab,ac=a(87)local ad
return(function(...)local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af,ag,ah,ai,aj)return ae.New
'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,
HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=
aj or UDim.new(0,0)}end end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae=ac(ab.Parent.
Parent.Bundles).Fusion return function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingTop=typeof(...)==
'number'and UDim.new(0,...)or...,PaddingRight=typeof(...)=='number'and UDim.new(0,...)or...,PaddingBottom=typeof(...)==
'number'and UDim.new(0,...)or...,PaddingLeft=typeof(...)=='number'and UDim.new(0,...)or...}elseif#af==2 then return ae.
New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and
UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingLeft=typeof(af[2])==
'number'and UDim.new(0,af[2])or af[2]}elseif#af==3 then return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and
UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])
=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}else return ae.
New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and
UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[4])==
'number'and UDim.new(0,af[4])or af[4]}end end end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(...)
local ae=ac(ab.Parent.Parent.Bundles).Fusion return function(af:number?,ag:number?)return ae.New'UITextSizeConstraint'{
MinTextSize=af,MaxTextSize=ag}end end)()end,[90]=function()local aa,ab,ac=a(90)local ad return(function(...)return
setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end
end})end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles).
Fusion local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[92]=function()
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
function ae.getthreadidentity()if getthreadidentity then return getthreadidentity()else return 5 end end function ae.
setthreadidentity(ag:number)if setthreadidentity then return setthreadidentity(ag)else return 5 end end return ae end)()
end,[95]=function()local aa,ab,ac=a(95)local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.
Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(as,
at,au)return as+(at-as)*au end local as=Instance.new'BindableEvent'local function at(au)if not(ao)then return end if not
(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,au*ah),ao.Y.Scale,ap(ak.Position.Y.
Offset,an.Y.Offset,au*ah))return end local av=(am-ai:GetMouseLocation())local aw,ax=(ao.X.Offset-av.X),(ao.Y.Offset-av.Y
)an=UDim2.new(ao.X.Scale,aw,ao.Y.Scale,ax)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,aw,au*ah),ao.Y.Scale,
ap(ak.Position.Y.Offset,ax,au*ah))end ak.InputBegan:Connect(function(au)if au.UserInputType==Enum.UserInputType.
MouseButton1 or au.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()au.
Changed:Connect(function()if au.UserInputState==Enum.UserInputState.End then as:Fire()al=false end end)end end)local au=
aj.Heartbeat:Connect(at)return au,as.Event end end)()end,[96]=function()local aa,ab,ac=a(96)local ad return(function(...
)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[97]=
function()local aa,ab,ac=a(97)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new
'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.
services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[98]=function()local aa,ab,ac=a(98)local ad return(
function(...)local ae=string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function
af(ag)if ag>0 then return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[99]=function()local
aa,ab,ac=a(99)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles).Fusion.Observer,ac(ab.
Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if
typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if
ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=
nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[100]=function()local aa,ab,ac=a(100)local
ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.
Tween(af(ag),ah)end end)()end,[101]=function()local aa,ab,ac=a(101)local ad return(function(...)return function(ae:table
,af:table,ag:table?):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))
and not table.find(ag,aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end
return ah,ai end end)()end},{{1,2,{'Darius'},{{84,2,{'simpleElements'},{{85,2,{'UIAspectRatioConstraint'}},{88,2,{
'UIPadding'}},{87,2,{'UIListLayout'}},{89,2,{'UITextSizeConstraint'}},{86,2,{'UICorner'}}}},{2,2,{'Bundles'},{{61,2,{
'services'}},{3,2,{'Fusion'},{{16,1,{'Dependencies'},{{19,2,{'sharedState'}},{17,2,{'captureDependencies'}},{18,2,{
'initDependency'}},{21,2,{'useDependency'}},{20,2,{'updateAll'}}}},{40,1,{'State'},{{47,2,{'unwrap'}},{46,2,{'Value'}},{
45,2,{'Observer'}},{42,2,{'ForKeys'}},{44,2,{'ForValues'}},{43,2,{'ForPairs'}},{41,2,{'Computed'}}}},{39,2,{'PubTypes'}}
,{48,2,{'Types'}},{49,1,{'Utility'},{{56,2,{'xtypeof'}},{51,2,{'cleanup'}},{50,2,{'None'}},{53,2,{'isSimilar'}},{54,2,{
'needsDestruction'}},{52,2,{'doNothing'}},{55,2,{'restrictRead'}}}},{33,1,{'Logging'},{{38,2,{'parseError'}},{37,2,{
'messages'}},{34,2,{'logError'}},{36,2,{'logWarn'}},{35,2,{'logErrorNonFatal'}}}},{4,1,{'Animation'},{{5,2,{'Spring'}},{
7,2,{'Tween'}},{12,2,{'springCoefficients'}},{9,2,{'getTweenRatio'}},{10,2,{'lerpType'}},{11,2,{'packType'}},{6,2,{
'SpringScheduler'}},{13,2,{'unpackType'}},{8,2,{'TweenScheduler'}}}},{22,1,{'Instances'},{{32,2,{'defaultProps'}},{30,2,
{'Ref'}},{28,2,{'OnEvent'}},{25,2,{'Hydrate'}},{24,2,{'Cleanup'}},{29,2,{'Out'}},{23,2,{'Children'}},{31,2,{
'applyInstanceProps'}},{27,2,{'OnChange'}},{26,2,{'New'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}}}},{62,2,{'themeSystem'}
,{{63,2,{'default'}}}},{60,2,{'lucide'}},{58,2,{'flags'}},{59,2,{'icons'}},{57,2,{'data'}}}},{64,1,{'components'},{{78,2
,{'tabFrame'}},{79,2,{'textbox'}},{67,2,{'colorpicker'}},{81,2,{'warn'}},{68,2,{'divider'}},{75,2,{'paragraph'}},{76,2,{
'slider'}},{70,2,{'keybind'}},{65,2,{'button'}},{74,2,{'notification'}},{72,2,{'label'}},{71,2,{'keybindList'}},{80,2,{
'toggle'}},{77,2,{'tabButton'}},{73,2,{'module'}},{69,2,{'dropdown'}},{66,2,{'buttonGroup'}}}},{90,2,{'utilities'},{{97,
2,{'getStringBounds'}},{100,2,{'tween'}},{99,2,{'references'}},{93,2,{'customFont'}},{101,2,{'typecheck'}},{94,2,{
'customFunctions'}},{98,2,{'randomString'}},{91,2,{'animate'}},{96,2,{'get'}},{95,2,{'drag'}},{92,2,{'connections'}}}},{
82,1,{'layouts'},{{83,2,{'main'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,
script,type,require,pcall,tostring,tonumber,_VERSION local aw,ax,ay,az,aA,aB,aC=aj.insert,aj.remove,aj.freeze or
function(aw)return aw end,al.wrap,ae.sub,ae.match,ae.gmatch if au and aA(au,1,4)=='Lune'then local aD,aE=ap(ao,
'@lune/task')if aD and aE then af=aE end end local aD=af and af.defer local aE,aF,aG,aH,aI,aJ,aK,aL,aM=aD or function(aE
,...)az(aE)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{}
,{}local aN,aO={GetFullName={{},function(aN)local aO,aP=aN.Name,aN.Parent while aP do aO=aP.Name..'.'..aO aP=aP.Parent
end return aO end},GetChildren={{},function(aN)local aO={}for aP in ai,aM[aN]do aw(aO,aP)end return aO end},
GetDescendants={{},function(aN)local aO={}for aP in ai,aM[aN]do aw(aO,aP)for aQ,aR in ai,aP:GetDescendants()do aw(aO,aR)
end end return aO end},FindFirstChild={{'string','boolean?'},function(aN,aO,aP)local aQ=aM[aN]for aR in ai,aQ do if aR.
Name==aO then return aR end end if aP then for aS in ai,aQ do return aS:FindFirstChild(aO,true)end end end},
FindFirstAncestor={{'string'},function(aN,aO)local aP=aN.Parent while aP do if aP.Name==aO then return aP end aP=aP.
Parent end end},WaitForChild={{'string','number?'},function(aN,aO)return aN:FindFirstChild(aO)end}},{}for aP,aQ in ai,aN
do local aR,aS,aT=aQ[1],aQ[2],{}for aU,aV in ai,aR do local aW,b=aB(aV,'^([^%?]+)(%??)')aT[aU]={aW,b}end aO[aP]=function
(aW,...)if not aM[aW]then ah("Expected ':' not '.' calling member function "..aP,2)end local b={...}for k,l in ai,aT do
local m=b[k]local n,o,p=an(m),l[1],l[2]if m==nil and not p then ah('Argument '..m..' missing or nil',3)end if o~='any'
and n~=o and not(n=='nil'and p)then ah('Argument '..k..' expects type "'..o..'", got "'..n..'"',2)end end return aS(aW,
...)end end local function aR(aS,aT,aU)local aV,aW=(ag({},{__mode='k'}))local function b(k)ah(k..
' is not a valid (virtual) member of '..aS..' "'..aT..'"',3)end local function k(l)ah(
'Unable to assign (virtual) property '..l..'. Property is read only',3)end local l,m={},{}m.__metatable=false m.__index=
function(n,o)if o=='ClassName'then return aS elseif o=='Name'then return aT elseif o=='Parent'then return aU elseif aS==
'StringValue'and o=='Value'then return aW else local p=aO[o]if p then return p end end for p in ai,aV do if p.Name==o
then return p end end b(o)end m.__newindex=function(n,o,p)if o=='ClassName'then k(o)elseif o=='Name'then aT=p elseif o==
'Parent'then if p==l then return end if aU~=nil then aM[aU][l]=nil end aU=p if p~=nil then aM[p][l]=true end elseif aS==
'StringValue'and o=='Value'then aW=p else b(o)end end m.__tostring=function()return aT end ag(l,m)aM[l]=aV if aU~=nil
then aM[aU][l]=true end return l end local function aS(aT,aU)local aV,aW,b,k=aT[1],aT[2],aT[3],aT[4]local l=aF[aW]local
m=b and ax(b,1)or l local n=aR(l,m,aU)aG[aV]=n if b then for o,p in ai,b do n[o]=p end end if k then for o,p in ai,k do
aS(p,n)end end return n end local aT=aR('Folder','['..ad..']')for aU,aV in ai,ab do aS(aV,aT)end for aW,b in ai,aa do
local k=aG[aW]aH[k]=b aI[k]=aW local l=k.ClassName if l=='LocalScript'or l=='Script'then aw(aK,k)end end local function
k(l)local m,n=l.ClassName,aJ[l]if n and m=='ModuleScript'then return ak(n)end local o=aH[l]local function p(q)q=as(q)
local r,s,t=l:GetFullName(),aB(q,'[^:]+:(%d+): (.+)')if not s or not av then return r..':*: '..(t or q)end s=at(s)local
u=aI[l]local y=av[u]local z=s-y+1 if z<0 then z='?'end return r..':'..z..': '..t end if m=='LocalScript'or m=='Script'
then local q,r=ap(o)if not q then ah(p(r),0)end else local q={ap(o)}local r=ax(q,1)if not r then local s=ax(q,1)ah(p(s),
0)end aJ[l]=q return ak(q)end end function a(l)local m=aG[l]local function n(o,...)local p={ap(o,...)}local q=ax(p,1)if
not q then ah(p[1],3)end return ak(p)end local o=ay(ag({},{__index=aL,__newindex=function(o,p,q)aL[p]=q end,__len=
function()return#aL end,__iter=function()return ai,aL end}))local p,q=ay{version=ac,envname=ad,shared=o,script=am,
require=ao},m local function r(s,...)local t,u,y=an(s),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if t=='table'and aM[s]then if s.ClassName~='ModuleScript'then ah(u,2)elseif s==m
then ah(y,2)end return k(s)elseif t=='string'and aA(s,1,1)~='@'then if#s==0 then ah(
'Attempted to call require with empty string',2)end local z=m if aA(s,1,1)=='/'then z=aT elseif aA(s,1,2)=='./'then s=
aA(s,3)end local A for B in aC(s,'([^/]*)/?')do local C=B if B=='..'then C='Parent'end if C~=''then local D=z:
FindFirstChild(C)if not D then local E=z.Parent if E then D=E:FindFirstChild(C)end end if D then z=D elseif B~=A and B~=
'init'and B~='init.server'and B~='init.client'then ah('Virtual script path "'..s..'" not found',2)end end A=B end if z.
ClassName~='ModuleScript'then ah(u,2)elseif z==m then ah(y,2)end return k(z)end return n(ao,s,...)end return p,q,r end
for l,m in ai,aK do aE(k,m)end return k(aT:GetChildren()[1])