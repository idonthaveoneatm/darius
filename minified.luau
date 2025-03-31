local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={function()local b,c,d=a(1)local e return(
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
'configLoaded'),g.add({boolean=false},'useConfig'),g.add{data=A},{'darius',`/{A.Workspace}`,`/configurations`},''for M=1
,#K do L=L..K[M]if not q.isfolder(L)then q.makefolder(L)end end v.path=`darius/{A.Workspace}/configurations`K={'darius',
`/{A.Workspace}`,`/themes`}L=''for M=1,#K do L=L..K[M]if not q.isfolder(L)then q.makefolder(L)end end i.path=`darius/{A.
Workspace}/themes`y.Folder=`darius/{A.Workspace}`i.init()local M=i.getTheme().uid if A.Theme then B,C=t(A.Theme,{Name=''
,Colors={}})assert(B,table.concat(C,'\n'))D:update('tbl',A.Theme)task.wait()i.set(i.create(A.Theme.Name,A.Theme.Colors,
nil,nil,true))end v.init()local N if A.UseConfig then I:update('boolean',A.UseConfig)end y.flags={}setmetatable(y.flags,
{__index=function(O,P)local Q=s(G.list)if Q[P]then return Q[P].user else return v.preregister(P).user end return nil end
})local O=l.New'BindableEvent'{}y.OnDestruction=O.Event u(A,O)local P,Q=o.get'tabButtonList',o.get'tabFrameList'F:
update('func',function()y.Destroyed=true O:Fire()for R,S in E.list do S:set(false)end task.wait(0.1)p:deleteConnections(
)o:clear()O:Destroy()end)y[J.uid]={}local R=y[J.uid]function R.Tab(S,T)local U=x('tabButton',P,T)local V=x('tabFrame',Q,
{uid=U.uid})R[U.uid]={}local W=R[U.uid]function W.Button(X,Y)Y.tab=U return x('button',V,Y)end function W.Toggle(X,Y)Y.
tab=U return x('toggle',V,Y)end function W.Dropdown(X,Y)Y.tab=U return x('dropdown',V,Y)end function W.Label(X,Y)return
x('label',V,{tab=U,Text=Y})end function W.Paragraph(X,Y)Y.tab=U return x('paragraph',V,Y)end function W.TextBox(X,Y)Y.
tab=U return x('textbox',V,Y)end function W.Slider(X,Y)Y.tab=U return x('slider',V,Y)end function W.Keybind(X,Y)Y.tab=U
return x('keybind',V,Y)end function W.Divider(X)return x('divider',V,{tab=U})end function W.ColorPicker(X,Y)Y.tab=U
return x('colorpicker',V,Y)end function W.ButtonGroup(X)return x('buttonGroup',V,{tab=U})end return R[U.uid]end y.
Destroyed=false function y.Notify(S,T)return x('notification',o.get'notificationList',T)end function y.Destroy(S)y.
Destroyed=true O:Fire()for T,U in E.list do U:set(false)end task.wait(0.1)p:deleteConnections()o:clear()O:Destroy()end
function y.LoadConfig(S)if not A.UseConfig then return end end function y.SetTheme(S,T)local U,V=t({['New Theme']=T},{[
'New Theme']={}})assert(U,table.concat(V,'\n'))end function y.ExportTheme(S)local T,U=i.getTheme(),{}U.name=T.name U.uid
=T.uid U.palette={}for V,W in T.palette do U.palette[V]=W:ToHex()end return k:JSONEncode(U)end function y.CreateSettings
(S)local T,U,V,W,X=R:Tab{Name='Settings',Image=h.cog},i.getTheme().palette,{},{},{}table.foreach(U,function(Y)table.
insert(W,Y)end)table.foreach(i.getThemes(),function(Y,Z)table.insert(X,{DisplayValue=Z.name,Value=Z.uid})end)local Y,Z,_
,aa,ab,ac='',''local ad=T:Dropdown{Name='Current Theme',Items=X,Default=i.getTheme().uid,Callback=function(ad)if M==ad
and ab then ab:Invisible()elseif M~=ad and ab then ab:Visible()end i.set(ad)U=i.getTheme().palette table.clear(V)table.
foreach(U,function(ae,af)V[ae]=af end)if _ and Y~=''then _:SetColor(i.get(Y))end end}ab=T:Toggle{Name=
'Do you want to delete this theme?',Visible=false,Callback=function(ae)if ae then ac:Visible()else ac:Invisible()end end
}ac=T:Button{Name='Delete Theme',Visible=false,DisabledText='Check the box above first!',Callback=function()i.delete(i.
getTheme().uid)ab:SetValue(false)table.clear(X)table.foreach(i.getThemes(),function(ae,af)table.insert(X,{DisplayValue=
af.name,Value=af.uid})end)ad:SetItems(X)ad:SelectItem(M)end}T:Label'Edit Theme:'T:Dropdown{Name='Theme Colors',Items=W,
Alphabetical=true,Callback=function(ae)Y=ae _:Enable()_:SetName(`Editing Color: {Y}`)_:SetColor(i.get(Y))end}_=T:
ColorPicker{Name='Editing Color: ',IsEnabled=false,DisabledText='Select Color First!',HideTransparency=true,Callback=
function(ae)local af=i.getTheme().palette if af[Y].R~=ae.R or af[Y].G~=ae.G or af[Y].B~=ae.B then aa:Visible()end i.
edit(Y,ae)end}aa=T:Button{Name='Reset Color',Visible=false,Callback=function()_:SetColor(V[Y])aa:Invisible()end}T:
TextBox{Name='Name Your Theme',Callback=function(ae)Z=ae end}T:Button{Name='Save and Set New Theme',Callback=function()
if Z==''then y:Notify{Title=A.Title,Body='Theme name cannot be empty!',Duration=3,Image=h.alert,ImageColor=i.get'red'}
return end local ae=i.create(Z,i.getColors())local af={i.set(ae)}if af[1]then table.clear(X)table.foreach(i.getThemes(),
function(ag,ah)table.insert(X,{DisplayValue=ah.name,Value=ah.uid})end)ad:SetItems(X)ad:SelectItem(ae)end i.export()q.
printFileSystem()end}T:Divider()local ae={}table.foreach(v.getConfigs(),function(af,ag)table.insert(ae,{DisplayValue=ag.
name,Value=ag.uid})end)local af=''local ag,ah=T:Dropdown{Name='Configs',Items=ae,AlwaysOpen=true,Callback=function(ag)af
=ag end},T:ButtonGroup()ah:Button{Name='Load',Callback=function()if af~=''then v.set(af)local ai=v.find(af)y:Notify{
Title=A.Title,Body=`Set configuration to "{ai.name}"`,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error'
,Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}local function ai()table.clear(
ae)table.foreach(v.getConfigs(),function(aj,ak)table.insert(ae,{DisplayValue=ak.name,Value=ak.uid})end)ag:SetItems(ae)
end local aj,ak,al,am=''ah:Button{Name='Create',Callback=function()ah:Invisible()ag:Invisible()ak:Visible()al:Visible()
am:Visible()end}ak=T:TextBox{Visible=false,Name='Name your configuration',Callback=function(an)aj=an end}al=T:Button{
Visible=false,Name='Complete new configuration',Callback=function()if aj~=''then v.create(aj,nil,false,nil)ai()ah:
Visible()ag:Visible()ak:Invisible()al:Invisible()am:Invisible()ak:SetInput''y:Notify{Title=A.Title,Body=`Created "{aj}"`
,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error',Body='Name cannot be empty',Duration=3,Image=h.alert
,ImageColor=i.get'red'}end end}am=T:Button{Visible=false,Name='Cancel',Callback=function()ah:Visible()ag:Visible()ak:
Invisible()al:Invisible()am:Invisible()ak:SetInput''end}ah:Button{Name='Save',Callback=function()if af~=''then v.save(af
)local an=v.find(af)y:Notify{Title=A.Title,Body=`Saved configuration "{an.name}"`,Duration=3,Image=h.check}else y:Notify
{Title='Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ah:
Button{Name='Delete',Callback=function()if af==''then y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end v.delete(af)ai()end}end if q.
getgenv then q.getgenv().dariusInstance=y else _G.dariusInstance=y end return y[J.uid]end return y end)()end,function()
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
(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,b,c,d=ac(ae.PubTypes),ac(ae.Types),ac(ae.
Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Animation.unpackType),ac(ae.Animation.SpringScheduler),ac(ae.
Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.updateAll),ac(ae.Utility.xtypeof),ac(
ae.State.unwrap),{}local e,f={__index=d},{__mode='k'}function d.get(g,h:boolean?):any if h~=false then al(g)end return g
._currentValue end function d.setPosition(g,h:PubTypes.Animatable)local i=typeof(h)if i~=g._currentType then ah(
'springTypeMismatch',nil,i,g._currentType)end g._springPositions=aj(h,i)g._currentValue=h ak.add(g)an(g)end function d.
setVelocity(g,h:PubTypes.Animatable)local i=typeof(h)if i~=g._currentType then ah('springTypeMismatch',nil,i,g.
_currentType)end g._springVelocities=aj(h,i)ak.add(g)end function d.addVelocity(g,h:PubTypes.Animatable)local i=typeof(h
)if i~=g._currentType then ah('springTypeMismatch',nil,i,g._currentType)end local j=aj(h,i)for k,l in ipairs(j)do g.
_springVelocities[k]+=l end ak.add(g)end function d.update(g):boolean local h=g._goalState:get(false)if h==g._goalValue
then local i=c(g._damping)if typeof(i)~='number'then ai('mistypedSpringDamping',nil,typeof(i))elseif i<0 then ai(
'invalidSpringDamping',nil,i)else g._currentDamping=i end local j=c(g._speed)if typeof(j)~='number'then ai(
'mistypedSpringSpeed',nil,typeof(j))elseif j<0 then ai('invalidSpringSpeed',nil,j)else g._currentSpeed=j end return
false else g._goalValue=h local i,j=g._currentType,typeof(h)g._currentType=j local k=aj(h,j)local l=#k g._springGoals=k
if j~=i then g._currentValue=g._goalValue local m,n=table.create(l,0),table.create(l,0)for o,p in ipairs(k)do m[o]=p end
g._springPositions=m g._springVelocities=n ak.remove(g)return true elseif l==0 then g._currentValue=g._goalValue return
true else ak.add(g)return false end end end local function g<T>(h:PubTypes.Value<T>,i:PubTypes.CanBeState<number>?,j:
PubTypes.CanBeState<number>?):Types.Spring<T>if i==nil then i=10 end if j==nil then j=1 end local k={[h]=true}if b(i)==
'State'then k[i]=true end if b(j)=='State'then k[j]=true end local l=setmetatable({type='State',kind='Spring',
dependencySet=k,dependentSet=setmetatable({},f),_speed=i,_damping=j,_goalState=h,_goalValue=nil,_currentType=nil,
_currentValue=nil,_currentSpeed=c(i),_currentDamping=c(j),_springPositions=nil,_springGoals=nil,_springVelocities=nil},e
)am(l)h.dependentSet[l]=true l:update()return l end return g end)()end,[6]=function()local aa,ab,ac=a(6)local ad return(
function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')or game:GetService'RunService',ab.Parent.
Parent local ag,ah,ai,aj=ac(af.Types),ac(af.Animation.packType),ac(af.Animation.springCoefficients),ac(af.Dependencies.
updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local ak,al,am:Set<Spring>,an={},0.0001,{},os.clock()
function ak.add(b:Spring)b._lastSchedule=an b._startDisplacements={}b._startVelocities={}for c,d in ipairs(b.
_springGoals)do b._startDisplacements[c]=b._springPositions[c]-d b._startVelocities[c]=b._springVelocities[c]end am[b]=
true end function ak.remove(b:Spring)am[b]=nil end local function b()local c:Set<Spring> ={}an=os.clock()for d in pairs(
am)do local e,f,g,h=ai(an-d._lastSchedule,d._currentDamping,d._currentSpeed)local i,j,k,l,m=d._springPositions,d.
_springVelocities,d._startDisplacements,d._startVelocities,false for n,o in ipairs(d._springGoals)do local p,q=k[n],l[n]
local r,s=p*e+q*f,p*g+q*h if math.abs(r)>al or math.abs(s)>al then m=true end i[n]=r+o j[n]=s end if not m then c[d]=
true end end for e in pairs(am)do e._currentValue=ah(e._springPositions,e._currentType)aj(e)end for f in pairs(c)do am[f
]=nil end end ae:BindToRenderStep('__FusionSpringScheduler',Enum.RenderPriority.First.Value,b)return ak end)()end,[7]=
function()local aa,ab,ac=a(7)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an=ac(
ae.PubTypes),ac(ae.Types),ac(ae.Animation.TweenScheduler),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.
initDependency),ac(ae.Logging.logError),ac(ae.Logging.logErrorNonFatal),ac(ae.Utility.xtypeof),{}local b,c={__index=an},
{__mode='k'}function an.get(f,g:boolean?):any if g~=false then ai(f)end return f._currentValue end function an.update(f)
:boolean local g=f._goalState:get(false)if g==f._nextValue and not f._currentlyAnimating then return false end local h=f
._tweenInfo if f._tweenInfoIsState then h=h:get()end if typeof(h)~='TweenInfo'then al('mistypedTweenInfo',nil,typeof(h))
return false end f._prevValue=f._currentValue f._nextValue=g f._currentTweenStartTime=os.clock()f._currentTweenInfo=h
local i=h.DelayTime+h.Time if h.Reverses then i+=h.Time end i*=h.RepeatCount+1 f._currentTweenDuration=i ah.add(f)return
false end local function f<T>(g:PubTypes.StateObject<PubTypes.Animatable>,h:PubTypes.CanBeState<TweenInfo>?):Types.Tween
<T>local i=g:get(false)if h==nil then h=TweenInfo.new()end local j,k={[g]=true},am(h)=='State'if k then j[h]=true end
local l=h if k then l=l:get()end if typeof(l)~='TweenInfo'then ak('mistypedTweenInfo',nil,typeof(l))end local m=
setmetatable({type='State',kind='Tween',dependencySet=j,dependentSet=setmetatable({},c),_goalState=g,_tweenInfo=h,
_tweenInfoIsState=k,_prevValue=i,_nextValue=i,_currentValue=i,_currentTweenInfo=h,_currentTweenDuration=0,
_currentTweenStartTime=0,_currentlyAnimating=false},b)aj(m)g.dependentSet[m]=true return m end return f end)()end,[8]=
function()local aa,ab,ac=a(8)local ad return(function(...)local ae,af=cloneref and cloneref(game:GetService'RunService')
or game:GetService'RunService',ab.Parent.Parent local ag,ah,ai,aj,ak=ac(af.Types),ac(af.Animation.lerpType),ac(af.
Animation.getTweenRatio),ac(af.Dependencies.updateAll),{}type Set<T> ={[T]:any}type Tween=Types.Tween<any>local al,am:
Set<Tween> ={__mode='k'},{}setmetatable(am,al)function ak.add(an:Tween)am[an]=true end function ak.remove(an:Tween)am[an
]=nil end local function an()local b=os.clock()for c:Tween in pairs(am::any)do local f=b-c._currentTweenStartTime if f>c
._currentTweenDuration then if c._currentTweenInfo.Reverses then c._currentValue=c._prevValue else c._currentValue=c.
_nextValue end c._currentlyAnimating=false aj(c)ak.remove(c)else local g=ai(c._currentTweenInfo,f)local h=ah(c.
_prevValue,c._nextValue,g)c._currentValue=h c._currentlyAnimating=true aj(c)end end end ae:BindToRenderStep(
'__FusionTweenScheduler',Enum.RenderPriority.First.Value,an)return ak end)()end,[9]=function()local aa,ab,ac=a(9)local
ad return(function(...)local ae=cloneref and cloneref(game:GetService'TweenService')or game:GetService'TweenService'
local function af(ag:TweenInfo,ah:number):number local ai,aj,ak,al,am,an=ag.DelayTime,ag.Time,ag.Reverses,1+ag.
RepeatCount,ag.EasingStyle,ag.EasingDirection local b=ai+aj if ak then b+=aj end if ah>=b*al then return 1 end local c=
ah%b if c<=ai then return 0 end local f=(c-ai)/aj if f>1 then f=2-f end local g=ae:GetValue(f,am,an)return g end return
af end)()end,[10]=function()local aa,ab,ac=a(10)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae
.PubTypes),ac(ae.Colour.Oklab)local function ah(ai:any,aj:any,ak:number):any local al=typeof(ai)if typeof(aj)==al then
if al=='number'then local am,an=aj::number,ai::number return(am-an)*ak+an elseif al=='CFrame'then local am,an=aj::CFrame
,ai::CFrame return an:Lerp(am,ak)elseif al=='Color3'then local am,an=aj::Color3,ai::Color3 local b,c=ag.to(an),ag.to(am)
return ag.from(b:Lerp(c,ak),false)elseif al=='ColorSequenceKeypoint'then local am,an=aj::ColorSequenceKeypoint,ai::
ColorSequenceKeypoint local b,c=ag.to(an.Value),ag.to(am.Value)return ColorSequenceKeypoint.new((am.Time-an.Time)*ak+an.
Time,ag.from(b:Lerp(c,ak),false))elseif al=='DateTime'then local am,an=aj::DateTime,ai::DateTime return DateTime.
fromUnixTimestampMillis((am.UnixTimestampMillis-an.UnixTimestampMillis)*ak+an.UnixTimestampMillis)elseif al==
'NumberRange'then local am,an=aj::NumberRange,ai::NumberRange return NumberRange.new((am.Min-an.Min)*ak+an.Min,(am.Max-
an.Max)*ak+an.Max)elseif al=='NumberSequenceKeypoint'then local am,an=aj::NumberSequenceKeypoint,ai::
NumberSequenceKeypoint return NumberSequenceKeypoint.new((am.Time-an.Time)*ak+an.Time,(am.Value-an.Value)*ak+an.Value,(
am.Envelope-an.Envelope)*ak+an.Envelope)elseif al=='PhysicalProperties'then local am,an=aj::PhysicalProperties,ai::
PhysicalProperties return PhysicalProperties.new((am.Density-an.Density)*ak+an.Density,(am.Friction-an.Friction)*ak+an.
Friction,(am.Elasticity-an.Elasticity)*ak+an.Elasticity,(am.FrictionWeight-an.FrictionWeight)*ak+an.FrictionWeight,(am.
ElasticityWeight-an.ElasticityWeight)*ak+an.ElasticityWeight)elseif al=='Ray'then local am,an=aj::Ray,ai::Ray return Ray
.new(an.Origin:Lerp(am.Origin,ak),an.Direction:Lerp(am.Direction,ak))elseif al=='Rect'then local am,an=aj::Rect,ai::Rect
return Rect.new(an.Min:Lerp(am.Min,ak),an.Max:Lerp(am.Max,ak))elseif al=='Region3'then local am,an=aj::Region3,ai::
Region3 local b,c=an.CFrame.Position:Lerp(am.CFrame.Position,ak),an.Size:Lerp(am.Size,ak)/2 return Region3.new(b-c,b+c)
elseif al=='Region3int16'then local am,an=aj::Region3int16,ai::Region3int16 return Region3int16.new(Vector3int16.new((am
.Min.X-an.Min.X)*ak+an.Min.X,(am.Min.Y-an.Min.Y)*ak+an.Min.Y,(am.Min.Z-an.Min.Z)*ak+an.Min.Z),Vector3int16.new((am.Max.X
-an.Max.X)*ak+an.Max.X,(am.Max.Y-an.Max.Y)*ak+an.Max.Y,(am.Max.Z-an.Max.Z)*ak+an.Max.Z))elseif al=='UDim'then local am,
an=aj::UDim,ai::UDim return UDim.new((am.Scale-an.Scale)*ak+an.Scale,(am.Offset-an.Offset)*ak+an.Offset)elseif al==
'UDim2'then local am,an=aj::UDim2,ai::UDim2 return an:Lerp(am,ak)elseif al=='Vector2'then local am,an=aj::Vector2,ai::
Vector2 return an:Lerp(am,ak)elseif al=='Vector2int16'then local am,an=aj::Vector2int16,ai::Vector2int16 return
Vector2int16.new((am.X-an.X)*ak+an.X,(am.Y-an.Y)*ak+an.Y)elseif al=='Vector3'then local am,an=aj::Vector3,ai::Vector3
return an:Lerp(am,ak)elseif al=='Vector3int16'then local am,an=aj::Vector3int16,ai::Vector3int16 return Vector3int16.
new((am.X-an.X)*ak+an.X,(am.Y-an.Y)*ak+an.Y,(am.Z-an.Z)*ak+an.Z)end end if ak<0.5 then return ai else return aj end end
return ah end)()end,[11]=function()local aa,ab,ac=a(11)local ad return(function(...)local ae=ab.Parent.Parent local af,
ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)local function ah(ai:{number},aj:string):PubTypes.Animatable?if aj=='number'then
return ai[1]elseif aj=='CFrame'then return CFrame.new(ai[1],ai[2],ai[3])*CFrame.fromAxisAngle(Vector3.new(ai[4],ai[5],ai
[6]).Unit,ai[7])elseif aj=='Color3'then return ag.from(Vector3.new(ai[1],ai[2],ai[3]),false)elseif aj==
'ColorSequenceKeypoint'then return ColorSequenceKeypoint.new(ai[4],ag.from(Vector3.new(ai[1],ai[2],ai[3]),false))elseif
aj=='DateTime'then return DateTime.fromUnixTimestampMillis(ai[1])elseif aj=='NumberRange'then return NumberRange.new(ai[
1],ai[2])elseif aj=='NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(ai[2],ai[1],ai[3])elseif aj==
'PhysicalProperties'then return PhysicalProperties.new(ai[1],ai[2],ai[3],ai[4],ai[5])elseif aj=='Ray'then return Ray.
new(Vector3.new(ai[1],ai[2],ai[3]),Vector3.new(ai[4],ai[5],ai[6]))elseif aj=='Rect'then return Rect.new(ai[1],ai[2],ai[3
],ai[4])elseif aj=='Region3'then local ak,al=Vector3.new(ai[1],ai[2],ai[3]),Vector3.new(ai[4]/2,ai[5]/2,ai[6]/2)return
Region3.new(ak-al,ak+al)elseif aj=='Region3int16'then return Region3int16.new(Vector3int16.new(ai[1],ai[2],ai[3]),
Vector3int16.new(ai[4],ai[5],ai[6]))elseif aj=='UDim'then return UDim.new(ai[1],ai[2])elseif aj=='UDim2'then return
UDim2.new(ai[1],ai[2],ai[3],ai[4])elseif aj=='Vector2'then return Vector2.new(ai[1],ai[2])elseif aj=='Vector2int16'then
return Vector2int16.new(ai[1],ai[2])elseif aj=='Vector3'then return Vector3.new(ai[1],ai[2],ai[3])elseif aj==
'Vector3int16'then return Vector3int16.new(ai[1],ai[2],ai[3])else return nil end end return ah end)()end,[12]=function()
local aa,ab,ac=a(12)local ad return(function(...)local function ae(af:number,ag:number,ah:number):(number,number,number,
number)if af==0 or ah==0 then return 1,0,0,1 end local ai,aj,ak,al if ag>1 then local am,an=af*ah,math.sqrt(ag^2-1)local
b,c=-0.5/an,-an-ag local f,g=1/c,math.exp(am*c)local h=math.exp(am*f)ai=(h*c-g*f)*b aj=(g-h)*b/ah ak=(h-g)*b*ah al=(g*c-
h*f)*b elseif ag==1 then local am=af*ah local an=math.exp(-am)ai=an*(1+am)aj=an*af ak=an*(-am*ah)al=an*(1-am)else local
am,an=af*ah,math.sqrt(1-ag^2)local b,c,f=1/an,an*am,math.exp(-am*ag)local g,h=f*math.sin(c),f*math.cos(c)local i=g*b
local j=i*ag ai=j+h aj=i ak=-(j*ag+g*an)al=h-j end return ai,aj,ak,al end return ae end)()end,[13]=function()local aa,ab
,ac=a(13)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Colour.Oklab)
local function ah(ai:any,aj:string):{number}if aj=='number'then local ak=ai::number return{ak}elseif aj=='CFrame'then
local ak,al=ai:ToAxisAngle()return{ai.X,ai.Y,ai.Z,ak.X,ak.Y,ak.Z,al}elseif aj=='Color3'then local ak=ag.to(ai)return{ak.
X,ak.Y,ak.Z}elseif aj=='ColorSequenceKeypoint'then local ak=ag.to(ai.Value)return{ak.X,ak.Y,ak.Z,ai.Time}elseif aj==
'DateTime'then return{ai.UnixTimestampMillis}elseif aj=='NumberRange'then return{ai.Min,ai.Max}elseif aj==
'NumberSequenceKeypoint'then return{ai.Value,ai.Time,ai.Envelope}elseif aj=='PhysicalProperties'then return{ai.Density,
ai.Friction,ai.Elasticity,ai.FrictionWeight,ai.ElasticityWeight}elseif aj=='Ray'then return{ai.Origin.X,ai.Origin.Y,ai.
Origin.Z,ai.Direction.X,ai.Direction.Y,ai.Direction.Z}elseif aj=='Rect'then return{ai.Min.X,ai.Min.Y,ai.Max.X,ai.Max.Y}
elseif aj=='Region3'then return{ai.CFrame.X,ai.CFrame.Y,ai.CFrame.Z,ai.Size.X,ai.Size.Y,ai.Size.Z}elseif aj==
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
3,aj^3 local an,b,c=ak*4.0767416621-al*3.3077115913+am*0.2309699292,ak*-1.2684380046+al*2.6097574011-am*0.3413193965,ak*
-4.196086299999999E-3-al*0.7034186147+am*1.707614701 if not ag then an=math.clamp(an,0,1)b=math.clamp(b,0,1)c=math.
clamp(c,0,1)end return Color3.new(an,b,c)end return ae end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Logging.parseError),ac(ae.Dependencies.
sharedState)type Set<T> ={[T]:any}local ai,aj=ah.initialisedStack,0 local function ak(al:Set<PubTypes.Dependency>,am:(
...any)->any,...):(boolean,any)local an=ah.dependencySet ah.dependencySet=al ah.initialisedStackSize+=1 local b,c=(ah.
initialisedStackSize)if b>aj then c={}ai[b]=c aj=b else c=ai[b]table.clear(c)end local f=table.pack(xpcall(am,ag,...))ah
.dependencySet=an ah.initialisedStackSize-=1 return table.unpack(f,1,f.n)end return ak end)()end,[18]=function()local aa
,ab,ac=a(18)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Dependencies.
sharedState)local ah=ag.initialisedStack local function ai(aj:PubTypes.Dependency)local ak=ag.initialisedStackSize for
al,am in ipairs(ah)do if al>ak then return end am[aj]=true end end return ai end)()end,[19]=function()local aa,ab,ac=a(
19)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}local ag:{Set<
PubTypes.Dependency>},ah,ai:Set<PubTypes.Dependency>?={},0 return{dependencySet=ai,initialisedStack=ag,
initialisedStackSize=ah}end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)local ae=ab.Parent.
Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}type Descendant=(PubTypes.Dependent&PubTypes.Dependency)|PubTypes.
Dependent local function ag(ah:PubTypes.Dependency)local ai:{[Descendant]:number},aj:{[Descendant]:boolean},ak:{
Descendant},al,am={},{},{},0,1 for an in ah.dependentSet do al+=1 ak[al]=an aj[an]=true end while am<=al do local b=ak[
am]local c=ai[b]ai[b]=if c==nil then 1 else c+1 if(b::any).dependentSet~=nil then for f in(b::any).dependentSet do al+=1
ak[al]=f end end am+=1 end am=1 while am<=al do local b=ak[am]local c=ai[b]-1 ai[b]=c if c==0 and aj[b]and b:update()and
(b::any).dependentSet~=nil then for f in(b::any).dependentSet do aj[f]=true end end am+=1 end end return ag end)()end,[
21]=function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(
ae.Dependencies.sharedState)local ah=ag.initialisedStack local function ai(aj:PubTypes.Dependency)local ak=ag.
dependencySet if ak~=nil then local al=ag.initialisedStackSize if al>0 then local am=ah[al]if am[aj]~=nil then return
end end ak[aj]=true end end return ai end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae
=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.Logging.logWarn),ac(ae.State.Observer),ac(ae.Utility.xtypeof)
type Set<T> ={[T]:boolean}local aj,ak=false,{}ak.type='SpecialKey'ak.kind='Children'ak.stage='descendants'function ak.
apply(al,am:any,an:Instance,b:{PubTypes.Task})local c:Set<Instance>,f:Set<Instance>,g:{[PubTypes.StateObject<any>]:()->(
)},h:{[PubTypes.StateObject<any>]:()->()},i,j:()->()={},{},{},{},false local function k()if not i then return end i=
false f,c=c,f h,g=g,h table.clear(c)table.clear(g)local function l(m:any,n:string?)local o=ai(m)if o=='Instance'then c[m
]=true if f[m]==nil then m.Parent=an else f[m]=nil end if aj and n~=nil then m.Name=n end elseif o=='State'then local p=
m:get(false)if p~=nil then l(p,n)end local q=h[m]if q==nil then q=ah(m):onChange(j)else h[m]=nil end g[m]=q elseif o==
'table'then for p,q in pairs(m)do local r,s:string?=(typeof(p))if r=='string'then s=p elseif r=='number'and n~=nil then
s=n..'_'..p end l(q,s)end else ag('unrecognisedChildType',o)end end if am~=nil then l(am)end for m in pairs(f)do m.
Parent=nil end for n,o in pairs(h)do o()end end j=function()if not i then i=true task.defer(k)end end table.insert(b,
function()am=nil i=true k()end)i=true k()end return ak::PubTypes.SpecialKey end)()end,[24]=function()local aa,ab,ac=a(24
)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),{}ag.type='SpecialKey'ag.kind=
'Cleanup'ag.stage='observer'function ag.apply(ah,ai:any,aj:Instance,ak:{PubTypes.Task})table.insert(ak,ai)end return ag
end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.
PubTypes),ac(ae.Instances.applyInstanceProps)local function ah(ai:Instance)return function(aj:PubTypes.PropertyTable):
Instance ag(aj,ai)return ai end end return ah end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)
local ae=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.Instances.defaultProps),ac(ae.Instances.
applyInstanceProps),ac(ae.Logging.logError)local function aj(ak:string)return function(al:PubTypes.PropertyTable):
Instance local am,an=pcall(Instance.new,ak)if not am then ai('cannotCreateClass',nil,ak)end local b=ag[ak]if b~=nil then
for c,f in pairs(b)do an[c]=f end end ah(al,an)return an end end return aj end)()end,[27]=function()local aa,ab,ac=a(27)
local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Logging.logError)local function
ah(ai:string):PubTypes.SpecialKey local aj={}aj.type='SpecialKey'aj.kind='OnChange'aj.stage='observer'function aj.apply(
ak,al:any,am:Instance,an:{PubTypes.Task})local b,c=pcall(am.GetPropertyChangedSignal,am,ai)if not b then ag(
'cannotConnectChange',nil,am.ClassName,ai)elseif typeof(al)~='function'then ag('invalidChangeHandler',nil,ai)else table.
insert(an,c:Connect(function()al((am::any)[ai])end))end end return aj end return ah end)()end,[28]=function()local aa,ab
,ac=a(28)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Logging.logError)
local function ah(ai:Instance,aj:string)return(ai::any)[aj]end local function ai(aj:string):PubTypes.SpecialKey local ak
={}ak.type='SpecialKey'ak.kind='OnEvent'ak.stage='observer'function ak.apply(al,am:any,an:Instance,b:{PubTypes.Task})
local c,f=pcall(ah,an,aj)if not c or typeof(f)~='RBXScriptSignal'then ag('cannotConnectEvent',nil,an.ClassName,aj)elseif
typeof(am)~='function'then ag('invalidEventHandler',nil,aj)else table.insert(b,f:Connect(am))end end return ak end
return ai end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae=ab.Parent.Parent local af,
ag,ah=ac(ae.PubTypes),ac(ae.Logging.logError),ac(ae.Utility.xtypeof)local function ai(aj:string):PubTypes.SpecialKey
local ak={}ak.type='SpecialKey'ak.kind='Out'ak.stage='observer'function ak.apply(al,am:any,an:Instance,b:{PubTypes.Task}
)local c,f=pcall(an.GetPropertyChangedSignal,an,aj)if not c then ag('invalidOutProperty',nil,an.ClassName,aj)elseif ah(
am)~='State'or am.kind~='Value'then ag'invalidOutType'else am:set((an::any)[aj])table.insert(b,f:Connect(function()am:
set((an::any)[aj])end))table.insert(b,function()am:set(nil)end)end end return ak end return ai end)()end,[30]=function()
local aa,ab,ac=a(30)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai=ac(ae.PubTypes),ac(ae.
Logging.logError),ac(ae.Utility.xtypeof),{}ai.type='SpecialKey'ai.kind='Ref'ai.stage='observer'function ai.apply(aj,ak:
any,al:Instance,am:{PubTypes.Task})if ah(ak)~='State'or ak.kind~='Value'then ag'invalidRefType'else ak:set(al)table.
insert(am,function()ak:set(nil)end)end end return ai end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj=ac(ae.PubTypes),ac(ae.Utility.cleanup),ac(ae.Utility.xtypeof
),ac(ae.Logging.logError),ac(ae.State.Observer)local function ak(al:Instance,am:string,an:any)(al::any)[am]=an end
local function al(am:Instance,an:string)(am::any)[an]=(am::any)[an]end local function am(an:Instance,b:string,c:any)if
not pcall(ak,an,b,c)then if not pcall(al,an,b)then if an==nil then ai('setPropertyNilRef',nil,b,tostring(c))else ai(
'cannotAssignProperty',nil,an.ClassName,b)end else local f,g=typeof(c),typeof((an::any)[b])ai('invalidPropertyType',nil,
an.ClassName,b,g,f)end end end local function an(b:Instance,c:string,f:PubTypes.CanBeState<any>,g:{PubTypes.Task})if ah(
f)=='State'then local h=false local function i()if not h then h=true task.defer(function()h=false am(b,c,f:get(false))
end)end end am(b,c,f:get(false))table.insert(g,aj(f::any):onChange(i))else am(b,c,f)end end local function b(c:PubTypes.
PropertyTable,f:Instance)local g,h={self={}::{[PubTypes.SpecialKey]:any},descendants={}::{[PubTypes.SpecialKey]:any},
ancestor={}::{[PubTypes.SpecialKey]:any},observer={}::{[PubTypes.SpecialKey]:any}},{}for i,j in pairs(c)do local k=ah(i)
if k=='string'then if i~='Parent'then an(f,i::string,j,h)end elseif k=='SpecialKey'then local l=(i::PubTypes.SpecialKey)
.stage local m=g[l]if m==nil then ai('unrecognisedPropertyStage',nil,l)else m[i]=j end else ai('unrecognisedPropertyKey'
,nil,ah(i))end end for k,l in pairs(g.self)do k:apply(l,f,h)end for m,n in pairs(g.descendants)do m:apply(n,f,h)end if c
.Parent~=nil then an(f,'Parent',c.Parent,h)end for o,p in pairs(g.ancestor)do o:apply(p,f,h)end for q,r in pairs(g.
observer)do q:apply(r,f,h)end f.Destroying:Connect(function()ag(h)end)end return b end)()end,[32]=function()local aa,ab,
ac=a(32)local ad return(function(...)return{ScreenGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},
BillboardGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},SurfaceGui={ResetOnSpawn=false,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling,SizingMode=Enum.SurfaceGuiSizingMode.PixelsPerStud,PixelsPerStud=50},Frame={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},ScrollingFrame={BackgroundColor3=
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,ScrollBarImageColor3=Color3.new(0,0,0)},TextLabel={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,Font=Enum.Font.SourceSans,Text='',
TextColor3=Color3.new(0,0,0),TextSize=14},TextButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},
TextBox={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,ClearTextOnFocus=false,Font
=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},ImageLabel={BackgroundColor3=Color3.new(1,1,1),
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
isSimilar),ac(ae.Utility.needsDestruction),{}local b,c={__index=an},{__mode='k'}function an.get(f,g:boolean?):any if g~=
false then ai(f)end return f._value end function an.update(f):boolean for g in pairs(f.dependencySet)do g.dependentSet[f
]=nil end f._oldDependencySet,f.dependencySet=f.dependencySet,f._oldDependencySet table.clear(f.dependencySet)local h,q,
r=ag(f.dependencySet,f._processor)if h then if f._destructor==nil and am(q)then ak'destructorNeededComputed'end if r~=
nil then ak'multiReturnComputed'end local s=f._value local t=al(s,q)if f._destructor~=nil then f._destructor(s)end f.
_value=q for u in pairs(f.dependencySet)do u.dependentSet[f]=true end return not t else aj('computedCallbackError',q)f.
_oldDependencySet,f.dependencySet=f.dependencySet,f._oldDependencySet for s in pairs(f.dependencySet)do s.dependentSet[f
]=true end return false end end local function f<T>(g:()->T,h:((T)->())?):Types.Computed<T>local q=setmetatable({type=
'State',kind='Computed',dependencySet={},dependentSet=setmetatable({},c),_oldDependencySet={},_processor=g,_destructor=h
,_value=nil},b)ah(q)q:update()return q end return f end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,b,c,f=ac(ae.PubTypes),ac(ae.Types),ac(ae.
Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.
parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.
Utility.needsDestruction),{}local g,h={__index=f},{__mode='k'}function f.get(q,r:boolean?):any if r~=false then aj(q)end
return q._outputTable end function f.update(q):boolean local r=q._inputIsState local s,t,u,v,w,x,y=if r then q.
_inputTable:get(false)else q._inputTable,q._oldInputTable,q._outputTable,q._keyOIMap,q._keyIOMap,q._meta,false for z in
pairs(q.dependencySet)do z.dependentSet[q]=nil end q._oldDependencySet,q.dependencySet=q.dependencySet,q.
_oldDependencySet table.clear(q.dependencySet)if r then q._inputTable.dependentSet[q]=true q.dependencySet[q._inputTable
]=true end for A,B in pairs(s)do local C=q._keyData[A]if C==nil then C={dependencySet=setmetatable({},h),
oldDependencySet=setmetatable({},h),dependencyValues=setmetatable({},h)}q._keyData[A]=C end local D=t[A]==nil if D==
false then for E,F in pairs(C.dependencyValues)do if F~=E:get(false)then D=true break end end end if D then C.
oldDependencySet,C.dependencySet=C.dependencySet,C.oldDependencySet table.clear(C.dependencySet)local E,F,G=ah(C.
dependencySet,q._processor,A)if E then if q._destructor==nil and(c(F)or c(G))then an'destructorNeededForKeys'end local H
,I=v[F],w[A]if H~=A and s[H]~=nil then am('forKeysKeyCollision',nil,tostring(F),tostring(H),tostring(F))end if I~=F and
v[I]==A then local J=x[I]local K,L=xpcall(q._destructor or b,ak,I,J)if not K then al('forKeysDestructorError',L)end v[I]
=nil u[I]=nil x[I]=nil end t[A]=B x[F]=G v[F]=A w[A]=F u[F]=B y=true else C.oldDependencySet,C.dependencySet=C.
dependencySet,C.oldDependencySet al('forKeysProcessorError',F)end end for E in pairs(C.dependencySet)do C.
dependencyValues[E]=E:get(false)q.dependencySet[E]=true E.dependentSet[q]=true end end for C,D in pairs(v)do if s[D]==
nil then local E=x[C]local F,G=xpcall(q._destructor or b,ak,C,E)if not F then al('forKeysDestructorError',G)end t[D]=nil
x[C]=nil v[C]=nil w[D]=nil u[C]=nil q._keyData[D]=nil y=true end end return y end local function q<KI,KO,M>(r:PubTypes.
CanBeState<{[KI]:any}>,s:(KI)->(KO,M?),t:((KO,M?)->())?):Types.ForKeys<KI,KO,M>local u=r.type=='State'and typeof(r.get)
=='function'local v=setmetatable({type='State',kind='ForKeys',dependencySet={},dependentSet=setmetatable({},h),
_oldDependencySet={},_processor=s,_destructor=t,_inputIsState=u,_inputTable=r,_oldInputTable={},_outputTable={},
_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},g)ai(v)v:update()return v end return q end)()end,[43]=function()local aa
,ab,ac=a(43)local ad return(function(...)local ae=ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,b,c,f=ac(ae.PubTypes
),ac(ae.Types),ac(ae.Dependencies.captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.
useDependency),ac(ae.Logging.parseError),ac(ae.Logging.logErrorNonFatal),ac(ae.Logging.logError),ac(ae.Logging.logWarn),
ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local g,h={__index=f},{__mode='k'}function f.get(q,r:boolean?):
any if r~=false then aj(q)end return q._outputTable end function f.update(q):boolean local r=q._inputIsState local s,t,u
,v,w=if r then q._inputTable:get(false)else q._inputTable,q._oldInputTable,q._keyIOMap,q._meta,false for x in pairs(q.
dependencySet)do x.dependentSet[q]=nil end q._oldDependencySet,q.dependencySet=q.dependencySet,q._oldDependencySet table
.clear(q.dependencySet)if r then q._inputTable.dependentSet[q]=true q.dependencySet[q._inputTable]=true end q.
_oldOutputTable,q._outputTable=q._outputTable,q._oldOutputTable local y,z=q._oldOutputTable,q._outputTable table.clear(z
)for A,B in pairs(s)do local C=q._keyData[A]if C==nil then C={dependencySet=setmetatable({},h),oldDependencySet=
setmetatable({},h),dependencyValues=setmetatable({},h)}q._keyData[A]=C end local D=t[A]~=B if D==false then for E,F in
pairs(C.dependencyValues)do if F~=E:get(false)then D=true break end end end if D then C.oldDependencySet,C.dependencySet
=C.dependencySet,C.oldDependencySet table.clear(C.dependencySet)local E,F,G,H=ah(C.dependencySet,q._processor,A,B)if E
then if q._destructor==nil and(c(F)or c(G)or c(H))then an'destructorNeededForPairs'end if z[F]~=nil then local I,J for K
,L in pairs(u)do if L==F then J=s[K]if J~=nil then I=K break end end end if I~=nil then am('forPairsKeyCollision',nil,
tostring(F),tostring(I),tostring(J),tostring(A),tostring(B))end end local I=y[F]if I~=G then local J=v[F]if I~=nil then
local K,L=xpcall(q._destructor or b,ak,F,I,J)if not K then al('forPairsDestructorError',L)end end y[F]=nil end t[A]=B u[
A]=F v[F]=H z[F]=G w=true else C.oldDependencySet,C.dependencySet=C.dependencySet,C.oldDependencySet al(
'forPairsProcessorError',F)end else local E=u[A]if z[E]~=nil then local F,G for H,I in pairs(u)do if E==I then G=s[H]if
G~=nil then F=H break end end end if F~=nil then am('forPairsKeyCollision',nil,tostring(E),tostring(F),tostring(G),
tostring(A),tostring(B))end end z[E]=y[E]end for E in pairs(C.dependencySet)do C.dependencyValues[E]=E:get(false)q.
dependencySet[E]=true E.dependentSet[q]=true end end for C,D in pairs(y)do if z[C]~=D then local E=v[C]if D~=nil then
local F,G=xpcall(q._destructor or b,ak,C,D,E)if not F then al('forPairsDestructorError',G)end end if z[C]==nil then v[C]
=nil q._keyData[C]=nil end w=true end end for E in pairs(t)do if s[E]==nil then t[E]=nil u[E]=nil end end return w end
local function q<KI,VI,KO,VO,M>(r:PubTypes.CanBeState<{[KI]:VI}>,s:(KI,VI)->(KO,VO,M?),t:((KO,VO,M?)->())?):Types.
ForPairs<KI,VI,KO,VO,M>local u=r.type=='State'and typeof(r.get)=='function'local v=setmetatable({type='State',kind=
'ForPairs',dependencySet={},dependentSet=setmetatable({},h),_oldDependencySet={},_processor=s,_destructor=t,
_inputIsState=u,_inputTable=r,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},g)
ai(v)v:update()return v end return q end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(...)local ae=
ab.Parent.Parent local af,ag,ah,ai,aj,ak,al,am,an,b,c=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.
captureDependencies),ac(ae.Dependencies.initDependency),ac(ae.Dependencies.useDependency),ac(ae.Logging.parseError),ac(
ae.Logging.logErrorNonFatal),ac(ae.Logging.logWarn),ac(ae.Utility.cleanup),ac(ae.Utility.needsDestruction),{}local f,g={
__index=c},{__mode='k'}function c.get(h,q:boolean?):any if q~=false then aj(h)end return h._outputTable end function c.
update(h):boolean local q=h._inputIsState local r,s,t=if q then h._inputTable:get(false)else h._inputTable,{},false h.
_oldValueCache,h._valueCache=h._valueCache,h._oldValueCache local u,v=h._valueCache,h._oldValueCache table.clear(u)for w
in pairs(h.dependencySet)do w.dependentSet[h]=nil end h._oldDependencySet,h.dependencySet=h.dependencySet,h.
_oldDependencySet table.clear(h.dependencySet)if q then h._inputTable.dependentSet[h]=true h.dependencySet[h._inputTable
]=true end for x,y in pairs(r)do local z=v[y]local A,B,C,D=(z==nil)if type(z)=='table'and#z>0 then local E=table.remove(
z,#z)B=E.value C=E.valueData D=E.meta if#z<=0 then v[y]=nil end elseif z~=nil then v[y]=nil A=true end if C==nil then C=
{dependencySet=setmetatable({},g),oldDependencySet=setmetatable({},g),dependencyValues=setmetatable({},g)}end if A==
false then for E,F in pairs(C.dependencyValues)do if F~=E:get(false)then A=true break end end end if A then C.
oldDependencySet,C.dependencySet=C.dependencySet,C.oldDependencySet table.clear(C.dependencySet)local E,F,G=ah(C.
dependencySet,h._processor,y)if E then if h._destructor==nil and(b(F)or b(G))then am'destructorNeededForValues'end if B
~=nil then local H,I=xpcall(h._destructor or an,ak,B,D)if not H then al('forValuesDestructorError',I)end end B=F D=G t=
true else C.oldDependencySet,C.dependencySet=C.dependencySet,C.oldDependencySet al('forValuesProcessorError',F)end end
local E=u[y]if E==nil then E={}u[y]=E end table.insert(E,{value=B,valueData=C,meta=D})s[x]=B for F in pairs(C.
dependencySet)do C.dependencyValues[F]=F:get(false)h.dependencySet[F]=true F.dependentSet[h]=true end end for z,A in
pairs(v)do for B,C in ipairs(A)do local D,E=C.value,C.meta local F,G=xpcall(h._destructor or an,ak,D,E)if not F then al(
'forValuesDestructorError',G)end t=true end table.clear(A)end h._outputTable=s return t end local function h<VI,VO,M>(q:
PubTypes.CanBeState<{[any]:VI}>,r:(VI)->(VO,M?),s:((VO,M?)->())?):Types.ForValues<VI,VO,M>local t=q.type=='State'and
typeof(q.get)=='function'local u=setmetatable({type='State',kind='ForValues',dependencySet={},dependentSet=setmetatable(
{},g),_oldDependencySet={},_processor=r,_destructor=s,_inputIsState=t,_inputTable=q,_outputTable={},_valueCache={},
_oldValueCache={}},f)ai(u)u:update()return u end return h end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(
function(...)local ae=ab.Parent.Parent local af,ag,ah=ac(ae.PubTypes),ac(ae.Types),ac(ae.Dependencies.initDependency)
type Set<T> ={[T]:any}local ai={}local aj,ak:Set<Types.Observer> ={__index=ai},{}function ai.update(al):boolean for am,
an in pairs(al._changeListeners)do task.spawn(an)end return false end function ai.onChange(al,am:()->()):()->()local an=
{}al._numChangeListeners+=1 al._changeListeners[an]=am ak[al]=true local b=false return function()if b then return end b
=true al._changeListeners[an]=nil al._numChangeListeners-=1 if al._numChangeListeners==0 then ak[al]=nil end end end
local function al(am:PubTypes.Value<any>):Types.Observer local an=setmetatable({type='State',kind='Observer',
dependencySet={[am]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},aj)ah(an)am.dependentSet[an]=true
return an end return al end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae=ab.Parent.
Parent local af,ag,ah,ai,aj,ak=ac(ae.Types),ac(ae.Dependencies.useDependency),ac(ae.Dependencies.initDependency),ac(ae.
Dependencies.updateAll),ac(ae.Utility.isSimilar),{}local al,am={__index=ak},{__mode='k'}function ak.get(an,b:boolean?):
any if b~=false then ag(an)end return an._value end function ak.set(an,b:any,c:boolean?)local f=an._value if c or not
aj(f,b)then an._value=b ai(an)end end local function an<T>(b:T):Types.State<T>local c=setmetatable({type='State',kind=
'Value',dependentSet=setmetatable({},am),_value=b},al)ah(c)return c end return an end)()end,[47]=function()local aa,ab,
ac=a(47)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.PubTypes),ac(ae.Utility.xtypeof)
local function ah<T>(ai:PubTypes.CanBeState<T>,aj:boolean?):T return if ag(ai)=='State'then(ai::PubTypes.StateObject<T>)
:get(aj)else(ai::T)end return ah end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)local ae=ab.
Parent local af=ac(ae.PubTypes)type Set<T> ={[T]:any}export type None=PubTypes.Symbol&{}export type Error={type:string,
raw:string,message:string,trace:string}export type State<T> =PubTypes.Value<T>&{_value:T}export type Computed<T> =
PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,_value:T}export type ForPairs<KI,VI,KO,
VO,M> =PubTypes.ForPairs<KO,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(KI,VI)->(KO,VO),_destructor:(VO,
M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:VI}>,_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO}
,_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<PubTypes.Dependency>,
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
local aa,ab,ac=a(57)local ad return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.
Fusion)local ag,ah,ai=af.Value,{},{}type uid=string type tag=string function ai.update(aj:string,ak:string,al:string)if
ak~='uid'and ai.find(aj)and ai.find(aj)[ak]then local am=ai.find(aj)am[ak]:set(al)elseif not ai.find(aj)then error(
"couldn't find uid: "..aj)elseif ak=='uid'or ak=='__tag'then error('cannot edit property '..ak)elseif not ai.find(aj)[ak
]then else error'how?'end end function ai.find(aj:uid|tag):table local ak for al=1,#ah do if ah[al].uid==aj or ah[al].
__tag==aj then ak=ah[al]end end if not ak then warn('no data found by identifier: '..tostring(aj))return ak end return
ak end function ai.delete(aj:string)local ak=ai.find(aj)local al,am=table.find(ah,ak),{}for an=1,#ah do if an~=al then
table.insert(am,ah[an])end end ah=am am=nil end function ai.add(aj:table,ak:string,al:boolean):table al=al or false if
not al then for am,an in aj do aj[am]=ag(an)end end aj.__tag=ak or nil aj.uid=ae(16)setmetatable(aj,{__index={update=
function(am,an,b)ai.update(am.uid,an,b)end,delete=function()ai.delete(aj.uid)end}})table.insert(ah,aj)return ai.find(aj.
uid)end return ai end)()end,[58]=function()local aa,ab,ac=a(58)local ad return(function(...)local ae,af,ag=ac(ab.Parent)
.data,ac(ab.Parent.Parent.utilities).get,ac(ab.Parent).services local ah,ai=ag.HttpService,ac(ab.Parent).Fusion local aj
,ak,al=ai.Observer,ai.Value,ac(ab.Parent.Parent.utilities)local am,an,b,c,f,g,h=al.connections,al.customFunctions,al.
randomString,{},ae.add({list={}},'flags'),{},{}local q,r,s={toggle=function(q)local r=q.status.boolean am.add(aj(r):
onChange(function()if not q.private then task.spawn(c.export)end local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end)
)end,dropdown=function(q)local r=q.status.multiselect and q.status.items or q.status.item am.add(aj(r):onChange(function
()if not q.private then task.spawn(c.export)end local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))end,keybind=
function(q)local r=q.status.mobile and q.status.coordinate or q.status.keycode am.add(aj(r):onChange(function()if not q.
private then task.spawn(c.export)end local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))end,slider=function(q)local
r=q.status.percentageOf am.add(aj(r):onChange(function()if not q.private then task.spawn(c.export)end local s=af(r)q.
user.Value=s q.bindableEvent:Fire(s)end))end,textbox=function(q)local r=q.status.correctText am.add(aj(r):onChange(
function()if not q.private then task.spawn(c.export)end local s=af(r)q.user.Value=s q.bindableEvent:Fire(s)end))end,
colorpicker=function(q)local r,s=q.status.color,q.status.transparency am.add(aj(r):onChange(function()if not q.private
then task.spawn(c.export)end q.user.Value={af(r),af(s)}q.bindableEvent:Fire(unpack(q.user.Value))end))am.add(aj(s):
onChange(function()if not q.private then task.spawn(c.export)end q.user.Value={af(r),af(s)}q.bindableEvent:Fire(unpack(q
.user.Value))end))end},{toggle=function(q)local r={}if q.boolean then r.boolean=af(q.boolean)end if q.keycode then r.
keycode=af(q.keycode)end return r end,dropdown=function(q)return q.multiselect and af(q.items)or af(q.item)end,keybind=
function(q)local r={}if q.keycode then r.keycode=af(q.keycode)end if q.coordinate then r.coordinate=af(q.coordinate)end
return r end,slider=function(q)return af(q.percentageOf)end,textbox=function(q)return af(q.correctText)end,colorpicker=
function(q)return{color=af(q.color),transparency=af(q.transparency)}end},{}c.currentConfig=''c.path=''function c.
preregister(t)local u,v=ai.New'BindableEvent'{},{}function v.Connect(w,x)assert(typeof(x)=='function',
'Connect only takes functions')am.add(u.Event:Connect(x))end local w w={name=t,status={},type='unknown',preregistered=
true,bindableEvent=u,file=ak{},user={Value=nil,OnChange=setmetatable(v,{__newindex=function(x,y,z)return nil end})}}h[t]
=w local x=af(f.list)x[w.name]=w f:update('list',x)return w end function c.register(t,u,v,w)assert(not table.find(g,t),
'Flags must all be unique!')table.insert(g,t)local x,y=ai.New'BindableEvent'{},{}function y.Connect(z,A)assert(typeof(A)
=='function','Connect')am.add(x.Event:Connect(A))end local z if not h[t]then z={name=t,status=u,type=v,private=w,
preregistered=false,bindableEvent=x,file=ak{},user={Value=nil,OnChange=setmetatable(y,{__newindex=function()return nil
end})}}q[z.type](z)local A=af(f.list)A[z.name]=z f:update('list',A)else z=h[t]z.type=v z.preregistered=false z.status=u
z.private=w q[z.type](z)h[z.name]=nil end return z end function c.find(t)for u,v in s do if v.uid==t then return v,u end
end return false end function c.create(t,u,v,w)v=v or false if u=='original'and v then return end local x={}x.name=t x.
uid=u or b(5)x.flagValues={}if v then x.flagValues=w else for y,z in af(f.list)do if z.private then continue end if z.
type=='unknown'then continue end x.flagValues[z.name]=r[z.type](z.status)end end table.insert(s,x)return u end function
c.init()for t,u in an.listfiles(c.path)do local v=ah:JSONDecode(an.readfile(u))c.create(v.name,v.uid,true,v.flagValues)
end end function c.load(t)for u,v in t do local w=af(f.list)[u]if not w then continue end w.file:set(v)end end function
c.set(t)local u=c.find(t)if not u then return end c.currentConfig=t c.load(u.flagValues)end function c.save(t)local u=c.
find(t)for v,w in af(f.list)do if w.private then continue end if w.type=='unknown'then continue end u.flagValues[w.name]
=r[w.type](w.status)end an.writefile(`{c.path}/{u.uid}.json`,ah:JSONEncode(u))end function c.delete(t)local u,v=c.find(t
)if u then if an.isfile(`{c.path}/{u.uid}.json`)then an.delfile(`{c.path}/{u.uid}.json`)table.remove(s,v)end end end
function c.getConfigs()return s end return c end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)
return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize='rbxassetid://15556637715',close=
'rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown='rbxassetid://10723433811',multiDropdown=
'rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check='rbxassetid://10709790644',command=
'rbxassetid://10723416765',input='rbxassetid://10734982297',search='rbxassetid://10734943674',finger=
'rbxassetid://10734929723',alert='rbxassetid://10709752996',paint='rbxassetid://10734910187',cog=
'rbxassetid://10709810948'}end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local ae=
loadstring(game:GetObjects'rbxassetid://85554466048193'[1].Source)()return ae end)()end,[61]=function()local aa,ab,ac=a(
61)local ad return(function(...)local ae=ac(ab.Parent.Parent.utilities.customFunctions)local af,ag=ae.cloneref,{}ag=
setmetatable(ag,{__index=function(ah,ai)return af(game:GetService(ai))end})return ag end)()end,[62]=function()local aa,
ab,ac=a(62)local ad return(function(...)local ae,af={},ac(ab.Parent.services)local ag,ah,ai,aj=af.HttpService,ac(ab.
Parent.data),ac(ab.Parent.Fusion),ac(ab.default)local ak,al,am,an,b,c,f,g=ai.Value,ai.Observer,ac(ab.Parent.Parent.
utilities.get),ac(ab.Parent.Parent.utilities.animate),ac(ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.utilities
.randomString),ac(ab.Parent.Parent.utilities.customFunctions),{}local h,q,r=ak{},ak{},''al(h):onChange(function()for s,t
in ipairs(g)do task.spawn(t)end end)local s,t,u={},{},{}table.foreach(aj,function(v)table.insert(u,v)end)ae.path=''
function ae.find(v)for w,x in s do if x.uid==v then return true,x end end return false end function ae.export()for v,w
in s do local x={}x.name=w.name x.uid=w.uid x.fromSet=w.fromSet x.palette={}for y,z in w.palette do x.palette[y]=z:
ToHex()end f.writefile(`{ae.path}/{w.uid}.json`,ag:JSONEncode(x))end end function ae.create(v,w,x,y,z)y=y or false if x
=='original'and y then return end for A,B in u do if w[B]==nil then w[B]=aj[B]end if typeof(w[B])~='Color3'then b(B..
" isn't type Color3")end end for C,D in w do if not table.find(u,C)then b('Incorrect value removed "'..tostring(C)..'"')
w[C]=nil end end if z and y then table.insert(t,x)end if z and not y then for E,F in t do local G=ae.find(F)if G.name==v
then return F.uid end end end x=x or c(5)table.insert(s,{name=v,uid=x,fromSet=z or false,palette=w})ae.export()return x
end function ae.delete(v)local w={ae.find(v)}if not w[1]then return false,'no theme found'end local x=table.find(s,w[2])
ae.set(r)table.remove(s,x)f.delfile(`{ae.path}/{w[2].uid}.json`)end function ae.edit(v,w)local x=am(h)x[v]=w h:set(x)end
function ae.set(v)local w,x,y={ae.find(v)}if w[1]then x,y=w[2],w[2].palette else return false,'no theme found'end local
z={}table.foreach(y,function(B,C)z[B]=C end)h:set(z)q:set(x)return true,'successfully set new theme'end function ae.
import(v,w)ae.create(v,w)end function ae.get(v)local w=am(h)if w[v]then return w[v]else error(v..
" isn't a theme element")end end for v,w in u do ae[w]=an(function()return am(h)[w]end,40,1)end function ae.init()r=ae.
create('darius',aj,'original')ae.set(r)for x,y in f.listfiles(ae.path)do local z=ag:JSONDecode(f.readfile(y))table.
foreach(z.palette,function(B,C)local D=Color3.fromHex(`#{C}`)z.palette[B]=D end)ae.create(z.name,z.palette,z.uid,true,z.
fromSet)end end function ae.onChange(x)table.insert(g,x)end function ae.getTheme()return am(q)end function ae.getThemes(
)return s end function ae.getColors()return am(h)end return ae end)()end,[63]=function()local aa,ab,ac=a(63)local ad
return(function(...)return{background=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=Color3.fromHex
'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',scrollBar=Color3.fromHex'#DCE1E5',
colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.fromHex'#222427',mobileButtonBackground=Color3.fromHex
'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.
fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),
orange=Color3.fromHex'#ff9b61'}end)()end,[65]=function()local aa,ab,ac=a(65)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,b,c,f,g=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local h,q,r,s,t=g.
get,g.animate,g.typecheck,g.customFont,ac(ae.simpleElements)local u,v,w,x=t.UIPadding,t.UICorner,r(af,{Name='',
DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{af.IsEnabled and''or'IsEnabled',af.Visible and''
or'Visible',af.DisabledText and''or'DisabledText'})assert(w,table.concat(x,'\n'))local y,z,B,C,D,E,F,G,H=ah.find
'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or an(true),af.DisabledText or
an'Component Disabled',af.Visible or an(true)local I=an(h(y.string)==h(B.tab).uid)b(y.string):onChange(function()I:set(
h(y.string)==h(B.tab).uid)end)local J=q(function()return h(I)and 0 or 1 end,40,1)al'TextButton'{Interactable=f(function(
)if not h(F)then return false end return h(I)end),Visible=f(function()if h(z.string)~=''and not string.find(h(D):lower()
,h(z.string):lower())or not h(H)then return false end return true end),Parent=C,Size=UDim2.new(1,0,0,36),
BackgroundColor3=ai.background2,BackgroundTransparency=J,[c'Activated']=function()if not h(F)then return end task.spawn(
h(E))end,[am]={v(6),al'Frame'{ZIndex=2,Visible=f(function()if not h(F)then return true end return false end),
BackgroundTransparency=q(function()return h(I)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.
fromScale(1,1),[am]={v(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(
0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=J},al'TextLabel'{
FontFace=s('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=J,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=G,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={u(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[am]={u(0,8),al'TextLabel'{FontFace=s('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0
,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,
0.5,0),Text=D,TextTransparency=J,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.
fingerprint,ImageColor3=ai.text2,ImageTransparency=J}}}}}local K={}function K.SetName(L,M)local N,O=r({SetName=M},{
SetName=''})assert(N,table.concat(O,'\n'))D:set(M)end function K.SetCallback(L,M)local N,O=r({SetCallback=M},{
SetCallback=function()end})assert(N,table.concat(O,'\n'))E:set(M)end function K.Fire(L)task.spawn(h(E))end function K.
Enable(L)F:set(true)end function K.Disable(L)F:set(false)end function K.Visible(L)H:set(true)end function K.Invisible(L)
H:set(false)end return K end end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion
local al,am,an,b,c,f,g=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local h,q,r,s,t=g.
get,g.animate,g.typecheck,g.customFont,ac(ae.simpleElements)local u,v,w,x,y,z,B,C,D,E,F=t.UIListLayout,Enum.SortOrder,
Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,t.UIPadding,t.UICorner,af.Parent,af.tab,an(0),an(true
)local G,H=al'Frame'{Visible=F,Parent=C,Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[am]={u(v.LayoutOrder,w.
Horizontal,x.Left,y.Center,UDim.new(0,4))}},{}function H.Button(I,J)local K,L=r(J,{Name='',DisabledText='',IsEnabled=
false,Visible=false,Callback=function()end},{J.IsEnabled and''or'IsEnabled',J.Visible and''or'Visible',J.DisabledText
and''or'DisabledText'})assert(K,table.concat(L,'\n'))E:set(h(E)+1)local M,N,O,P,Q,R,S,T=ah.find'selectedTab',ah.find
'searchText',ah.add(J),J.Name,J.Callback,J.IsEnabled or an(true),J.DisabledText or an'Component Disabled',J.Visible or
an(true)local U=an(h(M.string)==h(D).uid)b(M.string):onChange(function()U:set(h(M.string)==h(D).uid)end)local V=q(
function()return h(U)and 0 or 1 end,40,1)al'TextButton'{Interactable=f(function()if not h(R)then return false end return
h(U)end),Visible=f(function()if h(N.string)~=''and not string.find(h(P):lower(),h(N.string):lower())or not h(T)then
return false end return true end),Size=f(function()return UDim2.new(1/h(E),h(E)-1<0 and 0 or-(((h(E)-1)*4)/h(E)),0,36)
end),Parent=G,BackgroundColor3=ai.background2,BackgroundTransparency=V,[c'Activated']=function()if not h(R)then return
end task.spawn(h(Q))end,[am]={B(6),al'Frame'{ZIndex=2,Visible=f(function()if not h(R)then return true end return false
end),BackgroundTransparency=q(function()return h(U)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[am]={B(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=V},al
'TextLabel'{FontFace=s('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3
=ai.disabledText,TextTransparency=V,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=S
,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={z(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[am]={z(0,8),al'TextLabel'{FontFace=s('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32,0
,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,
0.5,0),Text=P,TextTransparency=V,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.
fromOffset(16,16),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.
fingerprint,ImageColor3=ai.text2,ImageTransparency=q(function()return h(U)and 0.5 or 1 end,40,1)}}}}}local W={}function
W.SetName(X,Y)local Z,_=r({SetName=Y},{SetName=''})assert(Z,table.concat(_,'\n'))P:set(Y)end function W.SetCallback(X,Y)
local Z,_=r({SetCallback=Y},{SetCallback=function()end})assert(Z,table.concat(_,'\n'))Q:set(Y)end function W.Fire(X)task
.spawn(h(Q))end function W.Enable(X)R:set(true)end function W.Disable(X)R:set(false)end function W.Visible(X)T:set(true)
end function W.Invisible(X)T:set(false)end return W end function H.Visible(I)F:set(true)end function H.Invisible(I)F:
set(false)end return H end end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae=ab.Parent.
Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
services local am,an,b=al.RunService,al.UserInputService,ag.Fusion local c,f,g,h,q,r,s,t=b.New,b.Children,b.Value,b.
Observer,b.OnEvent,b.Computed,b.Ref,ac(ae.utilities)local u,v,w,x,y,z,B=t.get,t.animate,t.typecheck,t.customFont,t.
randomString,t.connections,ac(ae.simpleElements)local C,D,E,F,G,H,I,J,K,L=B.UIListLayout,B.UIPadding,B.
UITextSizeConstraint,B.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,w(af,{
Name='',DisabledText='',IsEnabled=false,Callback=function()end,FLAG='',Visible=false,Color=Color3.new(),Transparency=0,
HideTransparency=true,IgnoreConfig=true},{af.IsEnabled and''or'IsEnabled',af.DisabledText and''or'DisabledText',af.FLAG
and''or'FLAG',af.Color and''or'Color',af.Visible and''or'Visible',af.Transparency and''or'Transparency',af.
HideTransparency and''or'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(K,table.concat(L,'\n'))local M,
N,O,P,Q,R,S,T,U,V,W,X,Y,Z,_,ao=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',ah.find'absoluteOffset',ah.
find'currentPicker',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or g(true),af.DisabledText or g
'Component Disabled',af.Color or g(Color3.new(1)),af.IgnoreConfig or g(false),af.Transparency or g(0),af.Visible or g(
true),af.HideTransparency or g(false)local ap,aq=(af.FLAG or g(R.uid))if u(ap)~=''then aq=ak.register(u(ap),{color=g(
Color3.new(1)),transparency=g(0)},'colorpicker',u(ap)==R.uid)aq.user.Value={u(aq.status.color),u(aq.status.transparency)
}end local ar,as=aq.status.color,aq.status.transparency h(ar):onChange(function()if u(V)then task.spawn(u(U),u(ar),u(as)
)end end)h(as):onChange(function()if u(V)then task.spawn(u(U),u(ar),u(as))end end)local at=g(u(M.string)==u(R.tab).uid)
h(M.string):onChange(function()at:set(u(M.string)==u(R.tab).uid)end)local au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,
aJ,aK,aL=v(function()return u(at)and 0 or 1 end,40,1),g(),g(0),g(),g(0),g(),g(0),g(),g(false),g(),g(false),g(),g(false),
g(0),g(0),(g(0))local function aM()return{Name=T,Children={C(G.LayoutOrder,H.Vertical,I.Center,J.Top,UDim.new(0,5)),c
'TextButton'{Size=UDim2.fromOffset(224,224),[s]=aB,[q'InputBegan']=function(aN)if aN.UserInputType~=Enum.UserInputType.
MouseButton1 then return end aC:set(true)local aO aO=aN.Changed:Connect(function()if aN.UserInputState==Enum.
UserInputState.End or aN.UserInputState.Cancel then aC:set(false)aO:Disconnect()end end)end,[f]={c'UIGradient'{Color=r(
function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,
Color3.fromHSV(u(aH),1,1))}end)},c'Frame'{Size=UDim2.fromScale(1,1),[f]={c'UIGradient'{Rotation=270,Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=
r(function()return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},c
'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromOffset(10
,10),ImageColor3=r(function()return Color3.fromHSV(0,0,1-u(aJ))end),Position=r(function()return UDim2.fromScale(u(aI),1-
u(aJ))end),[f]={c'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=
UDim2.fromScale(0.9,0.9),ImageColor3=r(function()return Color3.fromHSV(u(aH),1,1)end),Position=UDim2.fromScale(0.5,0.5)}
}}}},c'TextButton'{Size=UDim2.new(1,0,0,24),[q'InputBegan']=function(aN)if aN.UserInputType~=Enum.UserInputType.
MouseButton1 then return end aE:set(true)local aO aO=aN.Changed:Connect(function()if aN.UserInputState==Enum.
UserInputState.End or aN.UserInputState.Cancel then aE:set(false)aO:Disconnect()end end)end,[s]=aD,[f]={c'UIGradient'{
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(
0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},c'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.
colorpickerBar,Size=UDim2.new(0,2,1,0),Position=r(function()return UDim2.fromScale(1-u(aH),0.5)end)}}},c'ImageButton'{
Visible=not u(ao),ZIndex=2,Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=
Enum.ScaleType.Crop,[q'InputBegan']=function(aN)if aN.UserInputType~=Enum.UserInputType.MouseButton1 then return end aG:
set(true)local aO aO=aN.Changed:Connect(function()if aN.UserInputState==Enum.UserInputState.End or aN.UserInputState.
Cancel then aG:set(false)aO:Disconnect()end end)end,[s]=aF,[f]={c'Frame'{Size=UDim2.fromScale(1,1),[f]={c'UIGradient'{
Color=r(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,u(ar)),ColorSequenceKeypoint.new(1,u(ar))}end),
Transparency=r(function()return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}
}},c'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=r(
function()return UDim2.fromScale(u(as),0.5)end)}}},c'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[f]={C(G.
LayoutOrder,H.Horizontal,I.Left,J.Center,UDim.new(0,4)),{c'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.
AutomaticSize.X,Text='RGB:',TextColor3=ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=x('Montserrat',Enum.
FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Right},c'TextBox'{Name=y(8),BackgroundTransparency=1,Size=UDim2.new(
0,42,0,16),PlaceholderText='RGB',PlaceholderColor3=ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,Text=
r(function()local aN={u(ar).R,u(ar).G,u(ar).B}for aO,aP in aN do aN[aO]=math.floor(math.clamp(aP*255,0,255))end return
table.concat(aN,', ')end),TextScaled=true,FontFace=x('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,
TextXAlignment=Enum.TextXAlignment.Right,[s]=az,[q'Changed']=function(aN)local aO=u(az)if aN=='TextBounds'and aO and aO.
TextBounds then aA:set(aO.TextBounds.X)end end,[q'FocusLost']=function()local aN=u(az)local aO,aP=aN.Text:gsub(' ',''),{
u(ar).R,u(ar).G,u(ar).B}for aQ,aR in aP do aP[aQ]=math.floor(math.clamp(aR*255,0,255))end local aS,aT,aU=table.concat(aP
,', '),pcall(function()local aS=string.split(aO,',')table.foreach(aS,function(aT,aU)if not tonumber(aU)then return nil
end aS[aT]=math.clamp(aU,0,255)end)return Color3.fromRGB(aS[1],aS[2],aS[3])end)if aT and aU then ar:set(aU)aH:set(({u(ar
):ToHSV()})[1])aI:set(({u(ar):ToHSV()})[2])aJ:set(({u(ar):ToHSV()})[3])else aN.Text=aS end end,[f]={E(1,16),c
'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(42,16)},c'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=v(function()return UDim2.fromOffset(math.clamp(u(aA),0,110)
,2)end,40,1),[f]={F(0,1)}}}}}}},c'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[f]={C(G.LayoutOrder,H.
Horizontal,I.Left,J.Center,UDim.new(0,5)),{c'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text
='HSV:',TextColor3=ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=x('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Right},c'TextBox'{Name=y(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),
AutomaticSize=Enum.AutomaticSize.X,PlaceholderText='HSV',PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=r(function()
local aN={u(ar):ToHSV()}for aO,aP in aN do aN[aO]=math.floor(aP*100)/100 end return table.concat(aN,', ')end),TextScaled
=true,FontFace=x('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[s]=
ax,[q'Changed']=function(aN)local aO=u(ax)if aN=='TextBounds'and aO and aO.TextBounds then ay:set(aO.TextBounds.X)end
end,[q'FocusLost']=function()local aN=u(ax)local aO,aP=aN.Text:gsub(' ',''),{u(ar):ToHSV()}for aQ,aR in aP do aP[aQ]=
math.floor(aR*100)/100 end local aS,aT,aU=table.concat(aP,', '),pcall(function()local aS=string.split(aO,',')table.
foreach(aS,function(aT,aU)if not tonumber(aU)then return nil end end)return Color3.fromHSV(unpack(aS))end)if aT and aU
then ar:set(aU)aH:set(({u(ar):ToHSV()})[1])aI:set(({u(ar):ToHSV()})[2])aJ:set(({u(ar):ToHSV()})[3])else aN.Text=aS end
end,[f]={E(1,16),c'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},c'Frame'{AnchorPoint=
Vector2.new(1,0.5),BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=v(function()return UDim2.fromOffset(math
.clamp(u(ay),36,110),2)end,40,1),[f]={F(0,1)}}}}}}}}}end h(V):onChange(function()if not u(V)and typeof(aK)=='Instance'
then aK:Destroy()end end)c'Frame'{Interactable=r(function()if not u(V)then return false end return u(at)end),Visible=r(
function()if u(N.string)~=''and not string.find(u(T):lower(),u(N.string):lower())or not u(_)then return false end return
true end),Parent=S,Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,BackgroundColor3=ai.background2,[f]={F(6),c'Frame'{
ZIndex=3,Visible=r(function()if not u(V)then return true end return false end),BackgroundTransparency=v(function()return
u(at)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[f]={F(6),c'ImageLabel'{
Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image
=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=au},c'TextLabel'{FontFace=x('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=au,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=W,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[f]={D(0,5)}}}},c'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[f]={C(G.LayoutOrder,H.Horizontal,I.
Left,J.Bottom,UDim.new(0,3)),c'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=
au,[f]={D(9,8),F(6),C(G.LayoutOrder,H.Horizontal,I.Left,J.Top),c'TextLabel'{FontFace=x('Montserrat',Enum.FontWeight.Bold
),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=T,TextTransparency=au,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},c
'TextButton'{Interactable=r(function()if not u(V)then return false end return u(at)end),Size=UDim2.new(0,100,0,36),
BackgroundColor3=ai.background2,BackgroundTransparency=au,[q'Activated']=function()if typeof(u(Q.module))=='Instance'
then u(Q.module):Destroy()end aK,aL=ac(ab.Parent.module)(aM())Q:update('module',aK)end,[f]={D(0,8),F(6),C(G.LayoutOrder,
H.Horizontal,I.Right,J.Center,UDim.new(0,5)),c'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[f]={C(G.
LayoutOrder,H.Horizontal,I.Right,J.Center,UDim.new(0,4)),c'TextBox'{Interactable=r(function()if not u(V)then return
false end return u(at)end),Name=y(8),BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',
PlaceholderColor3=ai.text2,TextColor3=ai.text,TextTransparency=au,Text=r(function()return'#'..u(ar):ToHex()end),
TextScaled=true,FontFace=x('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.
Right,[q'Changed']=function(aN)local aO=u(av)if aN=='TextBounds'and aO and aO.TextBounds then aw:set(aO.TextBounds.X)end
end,[q'FocusLost']=function()local aN=u(av)local aO=aN.Text:gsub('[^%w#]','')if not string.find(aO,'#')then aO='#'..aO
end if string.len(aO)~=7 then aN.Text='#'..u(ar):ToHex()else local aP,aQ=pcall(function()return Color3.fromHex(aO)end)if
aP then ar:set(aQ)else aN.Text='#'..u(ar):ToHex()end end end,[s]=av,[f]={E(1,16),c'Frame'{AnchorPoint=Vector2.new(1,0.5)
,BackgroundColor3=ai.text2,BackgroundTransparency=v(function()if u(at)then return 0.5 end return 1 end,40,1),Position=
UDim2.fromScale(1,1),Size=v(function()return UDim2.fromOffset(math.clamp(u(aw),0,98),2)end,40,1),[f]={F(0,1)}}}}}},c
'ImageLabel'{Size=UDim2.fromOffset(24,24),Image=aj.paint,ImageColor3=ar,BackgroundTransparency=1,ImageTransparency=v(
function()return not u(at)and 1 or u(as)end,40,1),[f]={F(6)}}}}}}}}z.add(am.Heartbeat:Connect(function()if u(aC)then
local aN=u(aB)local aO=an:GetMouseLocation()-aN.AbsolutePosition-Vector2.new(0,u(P.number))aO=Vector2.new(math.clamp(aO.
X,0,aN.AbsoluteSize.X),math.clamp(aO.Y,0,aN.AbsoluteSize.Y))aI:set(aO.X/aN.AbsoluteSize.X)aJ:set((aN.AbsoluteSize.Y-aO.Y
)/aN.AbsoluteSize.Y)ar:set(Color3.fromHSV(u(aH),u(aI),u(aJ)))end if u(aE)then local aN=u(aD)local aO=an:
GetMouseLocation()-aN.AbsolutePosition-Vector2.new(0,u(P.number))aO=Vector2.new(math.clamp(aO.X,0,aN.AbsoluteSize.X),0)
aH:set((aN.AbsoluteSize.X-aO.X)/aN.AbsoluteSize.X)ar:set(Color3.fromHSV(u(aH),u(aI),u(aJ)))end if u(aG)then local aN=u(
aF)local aO=an:GetMouseLocation()-aN.AbsolutePosition-Vector2.new(0,u(P.number))aO=Vector2.new(math.clamp(aO.X,0,aN.
AbsoluteSize.X),0)as:set(aO.X/aN.AbsoluteSize.X)end end))if u(O.boolean)and not u(Y)then h(aq.file):onChange(function()
local aN,aO,aP=u(aq.file),true,true if aN.color~=nil then local aQ=string.split(aN.color:gsub(' ',''),',')table.foreach(
aQ,function(aR,aS)aQ[aR]=tonumber(aS)end)ar:set(Color3.new(unpack(aQ)))aO=false end if aN.transparency~=nil then as:set(
tonumber(aN.transparency))aP=false end if aO then ar:set(u(X))end if aP then as:set(u(Z))end aH:set(({u(ar):ToHSV()})[1]
)aI:set(({u(ar):ToHSV()})[2])aJ:set(({u(ar):ToHSV()})[3])end)if aq.private then ar:set(u(X))as:set(u(Z))end else ar:set(
u(X))as:set(u(Z))end aH:set(({u(ar):ToHSV()})[1])aI:set(({u(ar):ToHSV()})[2])aJ:set(({u(ar):ToHSV()})[3])local aN={}
function aN.SetName(aO,aP)local aQ,aR=w({SetName=aP},{SetName=''})assert(aQ,table.concat(aR,'\n'))T:set(aP)end function
aN.SetColor(aO,aP)local aQ,aR=w({SetColor=aP},{SetColor=Color3.new()})assert(aQ,table.concat(aR,'\n'))ar:set(aP)aH:set((
{u(ar):ToHSV()})[1])aI:set(({u(ar):ToHSV()})[2])aJ:set(({u(ar):ToHSV()})[3])end function aN.SetTransparency(aO,aP)local
aQ,aR=w({SetTransparency=aP},{SetTransparency=0})assert(aQ,table.concat(aR,'\n'))as:set(aP)end function aN.Enable(aO)V:
set(true)end function aN.Disable(aO)V:set(false)end function aN.Visible(aO)_:set(true)end function aN.Invisible(aO)_:
set(false)end return aN end end)()end,[68]=function()local aa,ab,ac=a(68)local ad return(function(...)local ae=ab.Parent
.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao=
aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,aq,ar,as,at=ao.get,ao.animate,ah.find'selectedTab',ah.
add(af),af.Parent local au=am(ap(ar.string)==ap(as.tab).uid)an(ar.string):onChange(function()au:set(ap(ar.string)==ap(as
.tab).uid)end)local av=aq(function()return ap(au)and 0 or 1 end,40,1)ak'Frame'{Parent=at,Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=av}}}end end)()end,[69]=function()local aa,ab,ac=a(
69)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al
=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.
Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.typecheck,at.customFont
,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH=ay.UIListLayout,ay.UIPadding,ay.UICorner,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name='',DisabledText='',FLAG='',Visible=false,
IsEnabled=false,Callback=function()end,Items={},Multiselect=true,Regex=function()end,IgnoreConfig=true,Alphabetical=true
,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.Visible and''or'Visible',af.IsEnabled
and''or'IsEnabled',af.Multiselect and''or'Multiselect',af.Regex and''or'Regex',af.IgnoreConfig and''or'IgnoreConfig',af.
Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})assert(aG,table.concat(aH,'\n'))aG,aH=aw(af,{
Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aG,table.concat(aH,'\n'))if af.Regex then assert(
typeof(af.Regex'')=='string','The Regex function must always return a string')end local aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS
,aT,aU,b,c,f,g=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,ao{}
,af.Multiselect or ao(false),af.Default,af.Visible or ao(true),af.IgnoreConfig or ao(false),af.IsEnabled or ao(true),af.
Alphabetical or ao(false),af.AlwaysOpen or ao(false),af.DisabledText or ao'Component Disabled',af.Regex or ao(function(
aI)return aI end)local h,q=(af.FLAG or ao(aL.uid))if au(h)~=''then q=ak.register(au(h),{items=ao{},item=ao'',multiselect
=au(aQ)},'dropdown',au(h)==aL.uid)q.user.Value=au(aQ)and au(q.status.items)or au(q.status.item)end local r,s,t,u,v,w=ao(
),ao(false),ao(au(aQ)and{}or''),ao{},{},ao(false)ap(q.status.items):onChange(function()if#au(q.status.items)==#au(aP)
then w:set(true)else w:set(false)end local x={}for y,z in au(q.status.items)do table.insert(x,au(g)(z))end task.wait()
task.spawn(au(aO),x)t:set(au(q.status.items))end)ap(q.status.item):onChange(function()task.wait()task.spawn(au(aO),au(g
)(au(q.status.item)))t:set(au(g)(au(q.status.item)))end)local x=ao(au(aI.string)==au(aL.tab).uid)ap(aI.string):onChange(
function()x:set(au(aI.string)==au(aL.tab).uid)end)local y=av(function()return au(x)and 0 or 1 end,40,1)am'Frame'{Parent=
aM,Visible=ar(function()if au(aK.string)~=''and not string.find(au(aN):lower(),au(aK.string):lower())or not au(aS)then
return false end return true end),Size=av(function()if au(s)then return UDim2.new(1,0,0,76+(au(aQ)and(36)or 6)+math.
clamp((#au(aP)*34),34,136))end return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,
BackgroundTransparency=y,ClipsDescendants=true,[an]={aB(6),az(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.new(0,4)),
am'TextButton'{Interactable=ar(function()if not au(aU)then return false end return au(x)end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[aq'Activated']=function()if au(c)then return end s:set(not au(s))end,[an]={am'Frame'{ZIndex=2,
Visible=ar(function()if not au(aU)then return true end return false end),BackgroundTransparency=av(function()return au(x
)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aB(6),am'ImageLabel'{Size
=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.
lock,ImageColor3=ai.disabledText,ImageTransparency=y},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=y,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ar(function()return au(f)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[an]={aA(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={
aA(8),am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,
TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(
aQ)then return au(aN)..' '..tostring(#au(q.status.items))..'/'..tostring(#au(aP))end if typeof(au(t))=='table'then
return au(aN)end if v[au(t)]then return`{au(aN)}: {v[au(t)]}`end return`{au(aN)}: {au(t)}`end),TextTransparency=y,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.
new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=ar(function()return au(aQ)and aj.multiDropdown
or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=y}}}}},am'Frame'{Size=UDim2.new(1,0,0,32),
BackgroundTransparency=1,[an]={aA(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,
BackgroundTransparency=y,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,TextTransparency=y,[as]=r,[aq'Changed'
]=function(z)local B=au(r)if z=='Text'and B and B.Text then local C=B.Text for D,E in au(u)do if string.find(au(g)(E.
Name):lower(),C:lower())or C==''then E.Visible=true else E.Visible=false end end end end,[an]={am'UITextSizeConstraint'{
MinTextSize=0,MaxTextSize=16},aB(4),aA(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=
aQ,[an]={aA(6,6,0,6),am'TextButton'{Interactable=aQ,Size=UDim2.new(1,0,0,24),BackgroundTransparency=y,BackgroundColor3=
ai.background,[aq'Activated']=function()local z={}if not au(w)then for B,C in au(aP)do C=typeof(C)=='table'and C.Value
or C table.insert(z,au(g)(C))end end q.status.items:set(z)end,[an]={aB(4),aA(8),am'TextLabel'{FontFace=ax('Montserrat',
Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(w)then return'Deselect All'end return
'Select All'end),TextTransparency=y,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},am'ScrollingFrame'{ZIndex
=3,Size=ar(function()return UDim2.new(1,-6,0,math.clamp((#au(aP)*34),34,136))end),BackgroundTransparency=1,
ScrollBarThickness=ar(function()return#au(aP)>4 and 6 or 0 end),ScrollBarImageColor3=ai.scrollBar,CanvasSize=UDim2.new(0
,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aA(6,ar(function()return#au(aP)>4 and UDim.new(0,12)or UDim.new(0
,0)end),0,6),az(au(b)and aC.Name or aC.LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(0,6)),u}}}}ap(aP):onChange(
function()local z={}for B,C in au(aP)do local D,E,F,G=(ao(false))if typeof(C)=='table'then local H,I=aw(C,{DisplayValue=
'',Value='',Image=''},{C.Image and''or'Image',C.DisplayValue and''or'DisplayValue'})assert(H,table.concat(I,'\n'))E=C.
Value F=C.Image or nil G=C.DisplayValue or nil else local H,I=aw({Item=C},{Item=''})assert(H,table.concat(I,'\n'))E=C
end local H=au(g)(E)if G then v[E]=G end ap(q.status.items):onChange(function()if table.find(au(q.status.items),H)then D
:set(true)else D:set(false)end end)ap(q.status.item):onChange(function()if au(q.status.item)==H then D:set(true)else D:
set(false)end end)local I=am'TextButton'{Name=`{G~=nil and G or E}`,Size=UDim2.new(1,0,0,28),BackgroundTransparency=y,
BackgroundColor3=ai.background,[aq'Activated']=function()if au(aQ)then local I=au(q.status.items)D:set(not au(D))if au(D
)then table.insert(I,H)else table.remove(I,table.find(I,H))end q.status.items:set(I)else q.status.item:set(H)if au(c)
then return end s:set(false)end end,[an]={aB(4),aA(8),az(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,6)),
am'Frame'{Visible=ar(function()return au(aQ)and true or false end),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(
1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=y,BackgroundColor3=av(function()return au(D)and ai.get
'toggled'or ai.get'selectedTab'end,40,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=av(function()if
not au(x)then return 1 end if au(D)then return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},am'ImageLabel'{
Visible=ar(function()return F and true or false end),Size=UDim2.fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=F,ImageTransparency=y,ImageColor3=ai.text2},am'TextLabel'{
FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=ar(function()return au(aQ)and UDim2.new(1,-48,0,16)or UDim2.new(1,-
24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,0,0.5,0),Text=G or E,TextTransparency=y,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(z,I)
end u:set(z)end)aP:set(au(af.Items))if au(c)then s:set(true)end if au(aJ.boolean)and not au(aT)then ap(q.file):onChange(
function()local z,B=au(q.file),true if z~=nil then B=false end if au(aQ)then q.status.items:set(z)else q.status.item:
set(z)end if B then if au(aQ)then if aR and#au(aR)>0 then q.status.items:set(au(aR))end else if aR then q.status.item:
set(au(aR))end end end end)if q.private then if au(aQ)then if aR and#au(aR)>0 then q.status.items:set(au(aR))end else if
aR then for z,B in au(aP)do if typeof(B)=='table'and B.Value==au(aR)then q.status.item:set(au(aR))elseif B==au(aR)then q
.status.item:set(au(aR))end end end end end else if au(aQ)then if aR and#au(aR)>0 then q.status.items:set(au(aR))end
else if aR then q.status.item:set(au(aR))end end end local z={}function z.SetName(B,C)local D,E=aw({SetName=C},{SetName=
''})assert(D,table.concat(E,'\n'))aN:set(C)end function z.SetItems(B,C)local D,E=aw({SetItems=C},{SetItems={}})assert(D,
table.concat(E,'\n'))aP:set(C)local F,G={},false for H,I in au(aP)do local J if typeof(I)=='table'then J=I.Value else J=
I end local K=au(g)(J)if au(aQ)then if typeof(au(t))=='table'and table.find(au(t),K)then table.insert(F,K)G=true end
else if au(t)==K then G=true q.status.item:set(K)break end end end if G then if au(aQ)then q.status.items:set(F)end else
if au(aQ)then q.status.items:set{}else q.status.item:set''end end end function z.SelectItem(B,C)assert(not au(aQ),
':SelectItem requires Multiselect to be false')local D,E=aw({SelectItem=C},{SelectItem=''})assert(D,table.concat(E,'\n')
)local F=false for G,H in au(aP)do local I=H if typeof(H)=='table'then I=H.Value end local J=au(g)(C)if au(g)(I)==J then
F=true break end end assert(F,":SelectItem couldn't find "..C)q.status.item:set(C)end function z.SelectItems(B,C)assert(
au(aQ),':SelectItems requires Multiselect to be true')local D,E=aw({SelectItems=C},{SelectItems={}})assert(D,table.
concat(E,'\n'))for F,G in C do local H=false for I,J in au(aP)do local K=typeof(J)=='table'and au(g)(J.Value)or au(g)(J)
if G==K then H=true break end end if H then C[F]=au(g)(G)else table.remove(C,F)end end q.status.items:set(C)end function
z.Enable(B)aU:set(true)end function z.Disable(B)aU:set(false)end function z.Visible(B)aS:set(true)end function z.
Invisible(B)aS:set(false)end return z end end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)
local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons
,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,
an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.
connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN=aC.UIPadding
,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,ac(ab.Parent.warn)[1],ax(af,{Name='',DisabledText='',FLAG='',Visible=false,IsEnabled=false,Callback=
function()end,Bind=Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.
Visible and''or'Visible',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind',af.IgnoreConfig and''or'IgnoreConfig'})
assert(aM,table.concat(aN,'\n'))local aO,aP,aQ,aR,aS,aT,aU,b,c,f,g,h,q,r,s,t,u,v=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',ah.
find'bindData',ah.add(af),af.Parent,af.Name,af.Callback,af.Bind,af.Visible or aq(true),af.IsEnabled or aq(true),af.
DisabledText or aq'Component Disabled',af.IgnoreConfig or aq(false),aq()local function w(x:EnumItem,y:string)local z,B=
av(aP.binds),av(b.bindData)if table.find(z,x)then aL(('Key %s is already in use. %s'):format(x.Name,y))else table.
insert(z,x)if av(v)then table.remove(z,table.find(z,av(v)))B[av(v).Name]=nil end v:set(x)B[av(v).Name]={bind=av(v),name=
av(g)}b:update('bindData',B)aP:update('binds',z)end end local x,y=(af.FLAG or aq(c.uid))if av(x)~=''then y=ak.register(
av(x),{coordinate=aq(Vector2.new(0,0)),keycode=aq(nil),mobile=av(aS.boolean)},'keybind',av(x)==c.uid)y.user.Value=av(aS.
boolean)and av(y.status.coordinate)or av(y.status.keycode)end ar(y.status.keycode):onChange(function()if av(v)and av(v).
Name==av(y.status.keycode)then return end local z,B=pcall(function()return Enum.KeyCode[av(y.status.keycode)]end)if z
then w(B,'RAHHH')end end)ar(v):onChange(function()y.status.keycode:set(av(v).Name)end)local z=aq(av(aO.string)==av(c.tab
).uid)ar(aO.string):onChange(function()z:set(av(aO.string)==av(c.tab).uid)end)local B,C=aw(function()return av(z)and 0
or 1 end,40,1),aq(false)local D=am.InputBegan:Connect(function(D,E)if av(aS.boolean)then return end if av(C)then if D.
KeyCode and D.KeyCode~=Enum.KeyCode.Unknown then w(D.KeyCode,'From input box')end C:set(false)task.wait()aU:update(
'boolean',false)else if D.KeyCode and D.KeyCode==av(v)and not E and not av(aU.boolean)and av(s)then task.spawn(av(h))end
end end)ay.add(D)local E=aq(false)local function F(G)for H,I in Enum.KeyCode do if I.Name and I.Name==G then return I
end end return nil end local G,H H=ao'TextButton'{Visible=at(function()if not av(s)then return av(s)end return av(E)end)
,Parent=aA.get(av(aT.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,
0.5),TextScaled=true,Text=g,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,
BackgroundColor3=ai.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if
G then G:Disconnect()G=nil y.status.coordinate:set(H.AbsolutePosition)else task.spawn(av(h))end end,[ap]={aD(4),aE(16),
aF(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=av(aS.boolean)and aj.finger or aj.command,ImageColor3=ai.
mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{Parent=f,Visible=at(function()if av(aR.string)~=''and not string.
find(av(g):lower(),av(aR.string):lower())or not av(r)then return false end return true end),Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(s)then return true end return false end
),BackgroundTransparency=aw(function()return av(z)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=
UDim2.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=B},ao
'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),
TextColor3=ai.disabledText,TextTransparency=B,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5
,0),Text=at(function()return av(t)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'
{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3
)),ao'TextButton'{Interactable=at(function()if not av(s)then return false end return av(z)end),Size=UDim2.new(0.225,0,1,
0),BackgroundColor3=ai.background2,BackgroundTransparency=B,[as'Activated']=function()if av(aS.boolean)then E:set(true)G
=aB(H,15)return end C:set(true)aU:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK
.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(aS.boolean
)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=B},ao'TextLabel'{Visible=not av(aS.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=B,Text=at(function()return av(C)and
'Listening'or av(v)and av(v).Name or'Waiting'end)},ao'TextLabel'{Visible=av(aS.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(E)and'Move Bind'or'Place Bind'end),
TextTransparency=B}}},ao'TextButton'{Visible=E,Interactable=at(function()if not av(s)then return false end return av(z)
end),Size=UDim2.fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=B,[as'Activated']=function()E:
set(false)H.Position=UDim2.fromScale(0.5,0.5)y.status.coordinate:set(H.AbsolutePosition)end,[ap]={aE(6),ao'ImageLabel'{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1
,Image=aj.close,ImageColor3=ai.red,ImageTransparency=B}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(E)and-42
or-3,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=B,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=g,TextTransparency=B,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(aQ.boolean)and not av(u)then ar(y.file):onChange(function()local I,
J=av(y.file),true if I.keycode~=nil then y.status.keycode:set(I.keycode)J=false end if J then if q then y.status.keycode
:set(av(q).Name)end end end)if y.private then if q then y.status.keycode:set(av(q).Name)end end else if q then y.status.
keycode:set(av(q).Name)end end local I={}function I.SetName(J,K)local L,M=ax({SetName=K},{SetName=''})assert(L,table.
concat(M,'\n'))g:set(K)end function I.SetBind(J,K:EnumItem)local L,M=ax({SetBind=K},{SetBind=Enum.keyCode.C})assert(L,
table.concat(M,'\n'))w(K,'At :SetBind')end function I.Enable(J)s:set(true)end function I.Disable(J)s:set(false)end
function I.Visible(J)r:set(true)end function I.Invisible(J)r:set(false)end return I end end)()end,[71]=function()local
aa,ab,ac=a(71)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
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
ac(ab.Parent.module){Name=aR,Children={}}local function aU(b)local c,f={av(aw.LayoutOrder,ax.Vertical,ay.Center,az.Top,
UDim.new(0,5))},aB(aI.bindData)for g,h in aB(aH.binds)do local q=f[h.Name]table.insert(c,al'TextLabel'{Size=UDim2.new(1,
0,0,14),BackgroundTransparency=1,TextColor3=ai.text,FontFace=aE('Montserrat',Enum.FontWeight.Regular),TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,Text=ao(function()if q.boolean then return`[{q.bind.Name}] {q.name} (<i>{string.
upper(tostring(aB(q.boolean)))}</i>)`end return`[{q.bind.Name}] {q.name}`end)})end aS(c)end al'TextButton'{Visible=ao(
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
aM:set(aQ(aB(aH.binds)))ap(aH.binds):onChange(function()aM:set(aQ(aB(aH.binds)))end)end end)()end,[72]=function()local
aa,ab,ac=a(72)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
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
end function aH.Visible(aI)aE:set(true)end function aH.Invisible(aI)aE:set(false)end return aH end end)()end,[73]=
function()local aa,ab,ac=a(73)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
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
aS:Disconnect()end)return aP,function(...)aM:set(...)end end end)()end,[74]=function()local aa,ab,ac=a(74)local ad
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
tostring(math.round(aT*aU)/aU)local c=string.split(b,'.')if#c==1 then local f=''for g=1,aS do f=f..'0'end b=b..'.'..f
end return b end local aS,aT={}for aU,b in ap(aJ)do local c,f=at({Button=b},{Button={}})assert(c,table.concat(f,'\n'))c,
f=at(b,{Name='',Callback=function()end})assert(c,table.concat(f,'\n'))local g,h=b.Name,b.Callback local q=aj'TextButton'
{Size=UDim2.new(1/#ap(aJ),-2,1,-4),TextSize=14,Text=g,FontFace=as('Montserrat',Enum.FontWeight.Bold),BackgroundColor3=ah
.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(h)aL:set(false)task.wait(0.4)aK:set(false)
task.delay(0.3,function()aM:set(true)end)task.wait(2)aT:Destroy()end,[al]={av(4)}}table.insert(aS,q)end aT=aj'Frame'{
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
)end)task.spawn(function()repeat task.wait()until ap(aL)local c,f=(tick())repeat f=tick()-c aN:set(aR(1,math.clamp(f,0,
ap(aG))))task.wait()until f>ap(aG)end)task.spawn(function()aK:set(true)repeat task.wait()until ap(aL)task.wait(ap(aG))
task.wait(0.2)aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)aT:Destroy()
end)end end)()end,[75]=function()local aa,ab,ac=a(75)local ad return(function(...)local ae=ab.Parent.Parent return
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
function aL.Visible(aM)aH:set(true)end function aL.Invisible(aM)aH:set(false)end return aL end end)()end,[76]=function()
local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)
local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.UserInputService,al.
RunService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref
,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.typecheck,aw.customFont,ac(ae.simpleElements)local aC,aD,aE,
aF,aG,aH,aI,aJ,aK=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,
Enum.VerticalAlignment,az(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=0,Callback=function()end,Min=0,Max
=0,DisplayAsPercent=false,DecimalPlace=0,Visible=false,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG
and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.
Visible and''or'Visible',af.DisplayAsPercent and''or'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace',af.
IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.concat(aK,'\n'))local aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,b,c,f,g,h=ah.
find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.Max,af.Min,af.
DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IsEnabled or ar(true),af.DisabledText or ar
'Component Disabled',af.IgnoreConfig or ar(false),af.Visible or ar(true)local q=ax(af.Default)and ar(math.clamp(ax(af.
Default),ax(aT),ax(aS)))if not ax(q)then q=ar(ax(aT))end local r,s=(af.FLAG or ar(aO.uid))if ax(r)~=''then s=ak.
register(ax(r),{percentageOf=ar(ax(aT))},'slider',ax(r)==aO.uid)s.user.Value=ax(s.status.percentageOf)end local t=ar(ax(
aL.string)==ax(aO.tab).uid)as(aL.string):onChange(function()t:set(ax(aL.string)==ax(aO.tab).uid)end)local u=ay(function(
)return ax(t)and 0 or 1 end,40,1)local function v(w,x,y,z,B)return(1-((w-x)/(y-x)))*z+((w-x)/(y-x))*B end local function
w(x)if ax(b)==0 then return math.floor(x)end return tonumber(string.format('%.'..ax(b)..'f',x))end local x=ar(0)as(s.
status.percentageOf):onChange(function()x:set(v(ax(s.status.percentageOf),ax(aT),ax(aS),0,1))if not ax(c)then return end
task.spawn(ax(aR),ax(s.status.percentageOf))end)local y,z,B,C=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(function(D
)if(D.UserInputType==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch)and ax(C)then C:set(
false)end end)ap'Frame'{Parent=aP,Visible=au(function()if ax(aN.string)~=''and not string.find(ax(aQ):lower(),ax(aN.
string):lower())or not ax(h)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.
background2,BackgroundTransparency=ay(function()if ax(t)then return 0 end return 1 end,40,1),[aq]={aE(6),ap'Frame'{
ZIndex=2,Visible=au(function()if not ax(c)then return true end return false end),BackgroundTransparency=ay(function()
return ax(t)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={aE(6),ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=u},ap'TextLabel'{FontFace=aA(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=u,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()
return ax(f)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={aC(aF.LayoutOrder,aG.Horizontal,aH.Left,aI.Center,UDim.new(0,6)
),aD(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=u,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=aQ,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aG.
Horizontal,aH.Left,aI.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),
aC(aF.LayoutOrder,aG.Vertical,aH.Right,aI.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aA('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=u,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(function()if ax(aU)then
return tostring(w(ax(x)*100))..'%'end return ax(s.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(D)local E=ax(B)if D=='AbsoluteSize'and E and E.
AbsoluteSize then z:set(E.AbsoluteSize.X)end end,[at'FocusLost']=function()local D=ax(B)if tonumber(D.Text)then s.status
.percentageOf:set(math.clamp(tonumber(D.Text),ax(aT),ax(aS)))else if ax(aU)then D.Text=tostring(w(ax(x)*100))..'%'end D.
Text=ax(s.status.percentageOf)end end,[av]=B,[aq]={aD(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(t)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(z),2)end,40,1),[aq]={aE(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(c)then return false
end return ax(t)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=function()C:set(true)
end,[at'TouchLongPress']=function()C:set(true)end,[at'InputBegan']=function(D)if D.UserInputType==Enum.UserInputType.
MouseButton1 or D.UserInputType==Enum.UserInputType.Touch and ax(y)then local E,F=am:GetMouseLocation().X,ax(y).Size.X.
Offset local G=E-(ax(y).AbsolutePosition.X+F)while ax(C)and task.wait()do local H=am:GetMouseLocation().X local I=math.
clamp(F+(H-E)+G,0,ax(y).AbsoluteSize.X)s.status.percentageOf:set(w(v(I,0,ax(y).AbsoluteSize.X,ax(aT),ax(aS))))an.
RenderStepped:Wait()end end end,[av]=y,[aq]={aD(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=u,[aq]={aE(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=u,Size=
ay(function()return UDim2.new(ax(x),0,0,4)end,40,1),[aq]={aE(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=u,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[aq]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ay(function()if ax(t)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if ax(aM.boolean)and not ax(g)then as(s.file):onChange(function()local D,E=ax(s.file),true if D~=nil
then s.status.percentageOf:set(D)E=false end if E then s.status.percentageOf:set(ax(q))end end)if s.private then s.
status.percentageOf:set(ax(q))end else s.status.percentageOf:set(ax(q))end local D={}function D.SetName(E,F)local G,H=
az({SetName=F},{SetName=''})assert(G,table.concat(H,'\n'))aQ:set(F)end function D.SetValue(E,F)local G,H=az({SetValue=F}
,{SetValue=0})assert(G,table.concat(H,'\n'))s.status.percentageOf:set(math.clamp(F,ax(aT),ax(aS)))end function D.Enable(
E)c:set(true)end function D.Disable(E)c:set(false)end function D.Visible(E)h:set(true)end function D.Invisible(E)h:set(
false)end return D end end)()end,[77]=function()local aa,ab,ac=a(77)local ad return(function(...)local ae=ab.Parent.
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
true)aE:update('string',aG.uid)end return aG end end)()end,[78]=function()local aa,ab,ac=a(78)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=
ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj
'ScrollingFrame'{ZIndex=al(function()return(as(at.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=
UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center
,ar.Top,UDim.new(0,4))}}end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent
.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.
utilities)local au,av,aw,ax,ay=at.get,at.animate,at.customFont,at.typecheck,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE
,aF,aG,aH,aI=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum
.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',PlaceHolderText='',DisabledText='',ClearTextOnFocus=false,
OnlyNumbers=true,OnLeave=true,Visible=false,Default='',FLAG='',IsEnabled=false,Callback=function()end,IgnoreConfig=true}
,{af.PlaceHolderText and''or'PlaceHolderText',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.Visible and''or'Visible',af.DisabledText and''or'DisabledText',af.IgnoreConfig and''or'IgnoreConfig',af
.IgnoreConfig and''or'IgnoreConfig'})assert(aH,table.concat(aI,'\n'))local aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,b,c,f,g,h
=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or
ao(true),af.DisabledText or ao'Component Disabled',af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false
),af.ClearTextOnFocus or ao(false),af.IgnoreConfig or ao(false),af.IgnoreConfig or ao(false),af.PlaceHolderText or ao'',
af.Visible or ao(true)local q,r=(af.FLAG or ao(aM.uid))if au(q)~=''then r=ak.register(au(q),{correctText=ao''},'textbox'
,au(q)==aM.uid)r.user.Value=au(r.status.correctText)end local s=ao(au(aJ.string)==au(aM.tab).uid)aq(aJ.string):onChange(
function()s:set(au(aJ.string)==au(aM.tab).uid)end)local t,u,v,w,x,y,z=av(function()return au(s)and 0 or 1 end,40,1),ao()
,ao(false),ao'',ao(au(r.status.correctText)),ao'',ao(false)aq(w):onChange(function()if au(aS)then if tonumber(au(w))or
au(w)==''then x:set(au(w))end else x:set(au(w))end local B=au(u)B.Text=au(x)if au(aU)then return end if au(aS)then if(
tonumber(au(w))or au(w)=='')and au(y)~=au(w)then task.spawn(au(aP),au(w))r.status.correctText:set(au(w))y:set(au(w))end
else if au(y)==au(w)then return end task.spawn(au(aP),au(w))r.status.correctText:set(au(w))y:set(au(w))end end)aq(v):
onChange(function()if au(aU)and not au(v)then if au(aS)then if(tonumber(au(w))or au(w)=='')and au(y)~=au(w)then task.
spawn(au(aP),au(w))r.status.correctText:set(au(w))y:set(au(w))end else if au(y)==au(w)then return end task.spawn(au(aP),
au(w))r.status.correctText:set(au(w))y:set(au(w))end end end)local B,C=ao(),ao(0)am'Frame'{Parent=aN,Visible=ap(function
()if au(aL.string)~=''and not string.find(au(aO):lower(),au(aL.string):lower())or not au(h)then return false end return
true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,Visible=ap(function()if not au(aQ)
then return true end return false end),BackgroundTransparency=av(function()return au(s)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aA(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=t},am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=t,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ap(function()return au(aR)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true
,[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aC(aD.LayoutOrder,aG.Horizontal,aF
.Left,aE.Center,UDim.new(0,3)),am'TextLabel'{Size=UDim2.fromScale(0,1),BackgroundColor3=ai.background2,
BackgroundTransparency=t,TextSize=18,Text=aO,AutomaticSize=Enum.AutomaticSize.X,TextTransparency=t,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,TextColor3=ai.text,FontFace=aw('Montserrat',Enum.FontWeight.Bold),[as'Changed']=
function(D)if D=='AbsoluteSize'and au(B)~=nil then C:set(au(B).AbsoluteSize.X)end end,[ar]=B,[an]={aA(6),az(0,6)}},am
'TextButton'{Interactable=ap(function()if not au(aQ)then return false end return au(s)end),Size=ap(function()if au(B)
then return UDim2.new(1,-au(C)-3,1)end return UDim2.fromScale(0.35,1)end),BackgroundColor3=ai.background2,
BackgroundTransparency=t,[as'Activated']=function()local D=au(u)if D then D:CaptureFocus()end end,[an]={aA(6),az(0,6),
aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,5)),am'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=t},am'TextBox'{Interactable=ap(function()
if not au(aQ)then return false end return au(s)end),ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=g,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextSize=16,TextXAlignment=Enum
.TextXAlignment.Left,FontFace=aw('Montserrat',Enum.FontWeight.Bold),Text=x,TextTransparency=t,ClearTextOnFocus=b,[ar]=u,
[as'Changed']=function(D)local E=au(u)if E.TextBounds.X>E.AbsoluteSize.X then z:set(true)end if E and E.Text and D==
'Text'then w:set(E.Text)end end,[as'Focused']=function()v:set(true)end,[as'FocusLost']=function()v:set(false)end,[an]={
am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[an]={am'UIGradient'{Rotation=0,Color=av(function()return
ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,
40,1),Transparency=av(function()if not au(s)then return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1,1)}end if au(z)then if au(v)then return NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.1,1),NumberSequenceKeypoint.new(1,1)}else return
NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end
end return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if au(
aK.boolean)and not au(f)then aq(r.file):onChange(function()local D,E=au(r.file),true if D~=nil then if au(aU)then v:set(
true)end w:set(D)if au(aU)then v:set(false)end E=false end if E then if au(aU)then v:set(true)end w:set(au(aT))if au(aU)
then v:set(false)end end end)if r.private then if au(aU)then v:set(true)end w:set(au(aT))if au(aU)then v:set(false)end
end else if au(aU)then v:set(true)end w:set(au(aT))if au(aU)then v:set(false)end end local D={}function D.SetName(E,F)
local G,H=ax({SetName=F},{SetName=''})assert(G,table.concat(H,'\n'))aO:set(F)end function D.SetInput(E,F)local G,H=ax({
SetInput=F},{SetInput=au(aS)and 1 or''})assert(G,table.concat(H,'\n'))w:set(F)end function D.Enable(E)aQ:set(true)end
function D.Disable(E)aQ:set(false)end function D.Visible(E)h:set(true)end function D.Invisible(E)h:set(false)end return
D end end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an
=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed
,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references
,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC
.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],
ax(af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=false,Visible=false,Callback=function()end,LinkKeybind=
true,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.
Default and''or'Default',af.Visible and''or'Visible',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or
'IgnoreConfig',af.IgnoreConfig and''or'IgnoreConfig'})assert(aM,table.concat(aN,'\n'))aM,aN=ax(af,{Bind=Enum.KeyCode.E},
{af.LinkKeybind and af.Bind and''or'Bind'})assert(aM,table.concat(aN,'\n'))local aO,aP,aQ,aR,aS,aT,aU,b,f,g,h,q,r,s,t,u,
v,w,x,y=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find
'isMobile',ah.find'isListening',ah.find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.Callback,af.Default
or aq(false),af.IsEnabled or aq(true),af.Visible or aq(true),af.Bind,af.IgnoreConfig or aq(false),af.DisabledText or aq
'Component Disabled',af.LinkKeybind or aq(false)local z,B=(af.FLAG or aq(g.uid))if av(z)~=''then B=ak.register(av(z),{
boolean=aq(false),keycode=aq(nil)},'toggle',av(z)==g.uid)B.user.Value=av(B.status.boolean)end local C=aq()local function
D(E:EnumItem,F:string)local G,H=av(aP.binds),av(b.bindData)if table.find(G,E)then aL(('Key %s is already in use. %s'):
format(E.Name,F))else table.insert(G,E)if av(C)then table.remove(G,table.find(G,av(C)))H[av(C).Name]=nil end C:set(E)H[
av(C).Name]={bind=av(C),name=av(q),boolean=B.status.boolean}b:update('bindData',H)aP:update('binds',G)end end ar(B.
status.boolean):onChange(function()if av(t)then task.spawn(av(r),av(B.status.boolean))end end)ar(B.status.keycode):
onChange(function()local E,F=pcall(function()return Enum.KeyCode[av(B.status.keycode)]end)if E then D(F,'RAHHH')end end)
table.insert(f.list,B.status.boolean)local E=aq(av(aO.string)==av(g.tab).uid)ar(aO.string):onChange(function()E:set(av(
aO.string)==av(g.tab).uid)end)local F,G=aw(function()return av(E)and 0 or 1 end,40,1),aq(false)local H=am.InputBegan:
Connect(function(H,I)if av(aT.boolean)then return end if av(G)then if H.KeyCode and H.KeyCode~=Enum.KeyCode.Unknown then
D(H.KeyCode,'From input box')end G:set(false)task.wait()aU:update('boolean',false)else if H.KeyCode and H.KeyCode==av(C)
and not I and not av(aU.boolean)and av(t)then B.status.boolean:set(not av(B.status.boolean))end end end)ay.add(H)local I
,J=(aq(false))local K=ao'TextButton'{Visible=at(function()if not av(t)then return av(t)end return av(I)end),Parent=aA.
get(av(aS.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),
TextScaled=true,Text=q,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai
.mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if J then J:
Disconnect()J=nil else B.status.boolean:set(not av(B.status.boolean))end end,[ap]={aD(4),aE(16),aF(0,16),ao'ImageLabel'{
ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),
BackgroundTransparency=1,Image=av(aT.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=h,Visible=at(function()if av(aR.string)~=''and not string.find(av(q):lower(),
av(aR.string):lower())or not av(u)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency
=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(t)then return true end return false end),
BackgroundTransparency=aw(function()return av(E)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=F},ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=F,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(
function()return av(x)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=at(function()if not av(t)then return false end return av(E)end),Size=at(function()return
av(y)and UDim2.new(0.775,av(I)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=F,[as'Activated']=function()if not av(t)then return end B.status.boolean:set(not av(B.status.
boolean))end,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.
Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=F,BackgroundColor3=aw(function()return av(B.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(
function()if not av(E)then return 1 end if av(B.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=q,TextTransparency=F,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=I,
Interactable=at(function()if not av(t)then return false end return av(E)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=function()I:set(false)K.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=F}}},ao
'TextButton'{Visible=y,Interactable=at(function()if not av(t)then return false end return av(E)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=function()if av(aT.boolean)then I:set(
true)J=aB(K,15)return end G:set(true)aU:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.
Left,aK.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(aT.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=F},ao'TextLabel'{Visible=not av(aT.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=F,Text=at(function()return av(G)and
'Listening'or av(C)and av(C).Name or'Waiting'end)},ao'TextLabel'{Visible=av(aT.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(I)and'Move Bind'or'Place Bind'end),
TextTransparency=F}}}}}}}if av(aQ.boolean)and not av(w)then ar(B.file):onChange(function()local L,M,N=av(B.file),true,
true if L.boolean~=nil then B.status.boolean:set(L.boolean)M=false end if L.keycode~=nil then B.status.keycode:set(L.
keycode)N=false end if M then B.status.boolean:set(av(s))end if N then if v then B.status.keycode:set(av(v).Name)end end
end)if B.private then B.status.boolean:set(av(s))if v then B.status.keycode:set(av(v).Name)end end else B.status.boolean
:set(av(s))if v then B.status.keycode:set(av(v).Name)end end local L={}function L.SetName(M,N)local O,P=ax({SetName=N},{
SetName=''})assert(O,table.concat(P,'\n'))q:set(N)end function L.SetValue(M,N:boolean)local O,P=ax({SetValue=N},{
SetValue=true})assert(O,table.concat(P,'\n'))B.status.boolean:set(N)end function L.SetBind(M,N:EnumItem)assert(av(y),
'Requires LinkKeybind')local O,P=ax({SetBind=N},{SetBind=Enum.keyCode.C})assert(O,table.concat(P,'\n'))D(N,'At :SetBind'
)end function L.Enable(M)t:set(true)end function L.Disable(M)t:set(false)end function L.Visible(M)u:set(true)end
function L.Invisible(M)u:set(false)end return L end end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(
function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab.Parent
.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList',Title=
af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag end)()
end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...)local ae=ab.Parent.Parent return function(af,ag)
local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.
Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.
simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aF,aG,aH,aI,aJ,aK,aL,
aM,aN,aO,aP,aQ,aR=aE.get,aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,ac(ab.Parent.Parent.components.
warn)[1],aq(),aq(),aq(),aq(),aq(),aq()aG.add(aQ,aP,aO,aN,aM,aR)local aS,aT,aU,b,f,g,h,q,r,s,t,u,v,w,x,y=am.find
'absoluteOffset',am.find'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible'
,am.find'isMobile',am.find'isListening',am.find'bindData',am.find'destroyFunc'.func,aq(750),aq(500),aq(false),aq(false),
aq(false),aq(false)at(v):onChange(function()if aF(v)then w:set(not aF(w))task.wait(0.3)x:set(not aF(x))task.wait(0.3)y:
set(not aF(y))else y:set(not aF(y))task.wait(0.3)x:set(not aF(x))task.wait(0.3)w:set(not aF(w))end end)at(x):onChange(
function()t:set(aF(x)and 212 or 750)end)at(y):onChange(function()u:set(aF(y)and 74 or 500)end)local z,B,C=aq(false),aq()
,aq(false)local function D(E:EnumItem,F:string)local G,H=aF(f.binds),aF(r.bindData)if table.find(G,E)then aL((
'Key %s is already in use. %s'):format(E.Name,F))else table.insert(G,E)if aF(B)then table.remove(G,table.find(G,aF(B)))H
[aF(B).Name]=nil end B:set(E)C:set(true)H[aF(B).Name]={bind=aF(B),name='Toggle Interface'}r:update('bindData',H)f:
update('binds',G)end end if not aF(h.boolean)then D(af.HideBind,'init')end local E=aq''at(aU.string):onChange(function()
local F=aF(aU.string)local G=am.find(F)E:set(aF(G.Name):upper())end)local F,G,H=(aq(af.Icon or''))local I=ao'ScreenGui'{
Name=aF(aT.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[ar]=aQ,[ap]={ao'Frame'{Name=
'screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},ao'Frame'{Name='container',Visible=g.boolean,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aF(aS.number)),Size=aJ(function()return UDim2.fromOffset(
aF(t),aF(u))end,30,1),BackgroundColor3=ak.background,[ar]=aM,[ap]={ax(6),az(16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right
,aD.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=aJ(function()return UDim2.new(0,math.
clamp(aF(t)-32-180-16,212,9e9),aF(w)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao
'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=E,TextXAlignment=
Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=aI('Montserrat',Enum.FontWeight.ExtraBold),
TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=70}}},
ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.
new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.
Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,
aC.Left,aD.Top,UDim.new(0,5)),ao'ImageLabel'{Visible=as(function()if aF(F)~=''then return true end return false end),
Size=UDim2.fromOffset(44,44),BackgroundTransparency=1,Image=F,ImageColor3=ak.text2},ao'Frame'{Size=as(function()if aF(F)
~=''then return UDim2.new(1,-49,1,0)end return UDim2.new(1,0,1,0)end),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,
aB.Vertical,aC.Left,aD.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(1,0,0.6,0),Text=af.Title,TextColor3=ak.text,
FontFace=aI('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.
TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.Description,TextColor3=ak.text2,FontFace=aI(
'Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left}}}}}
,ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[au'Activated']=function()local I=aF(aR)if
I then I:CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao
'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{
Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aI('Montserrat',Enum.FontWeight.Bold),
PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(I)local J=aF(aR)if I~='Text'and J and J.Text then return
end b:update('string',J.Text)end,[ar]=aR}}}}},ao'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),
BackgroundTransparency=1,[ar]=aO}}}}},ao'Frame'{Size=aJ(function()return aF(y)and UDim2.new(0,180,0,44)or UDim2.new(0,
180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder,aB.Vertical,aC.
Center,aD.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.
Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,
[au'Activated']=function()if aF(h.boolean)then C:set(true)H=aH(G,15)return end z:set(true)q:update('boolean',true)end,[
ap]={ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.
fromOffset(20,20),BackgroundTransparency=1,Image=aF(h.boolean)and al.finger or al.command,ImageColor3=ak.text2,
ImageTransparency=0},ao'TextLabel'{Visible=not aF(h.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.
text2,Text=as(function()return aF(z)and'Listening'or aF(B)and aF(B).Name or'Waiting'end)},ao'TextLabel'{Visible=aF(h.
boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=
true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(C)and'Move Bind'or
'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[au'Activated']=function
()v:set(not aF(v))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(v)and al.minimize or al.maximize end),
ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,
[au'Activated']=function()if not aF(C)then ac(ae.components.notification){Parent=aP,Title='Darius Interface',Body=`You must {
aF(h.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,Duration=5,Image=al.alert,ImageColor=ak.get
'red'}return end g:update('boolean',not aF(g.boolean))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=al.close,ImageColor3=ak.
orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name='tabButtonList',Size=aJ(function()return aF(y)and UDim2.new(1,0,
0,0)or UDim2.new(1,0,1,-90)end,30,1),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=true,[ar]=aN,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.
Top,UDim.new(0,6)),az(0,10)}},ao'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()aF(s)()end,[ap]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao'ImageLabel'{
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao
'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,
Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,
Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[ar]=aP,[
ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}if I.screenSize.AbsoluteSize.X<aF(t)then t:set(I.screenSize.
AbsoluteSize.X*0.9)end if I.screenSize.AbsoluteSize.Y<aF(u)then u:set(I.screenSize.AbsoluteSize.Y*0.9)end G=ao
'TextButton'{Visible=as(function()return(aF(C)and aF(h.boolean))end),Interactable=as(function()return(aF(C)and aF(h.
boolean))end),Parent=aG.get(aF(aT.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text='Toggle UI',FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.
mobileButtonText,BackgroundColor3=ak.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au
'Activated']=function()if H then H:Disconnect()H=nil else g:update('boolean',not aF(g.boolean))end end,[ap]={az(4),ax(16
),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=aF(h.boolean)and al.finger or al.command,ImageColor3=ak.
mobileButtonImage,ImageTransparency=0.8}}}local J=aj.InputBegan:Connect(function(J,K)if aF(h.boolean)then return end if
aF(z)then if J.KeyCode and J.KeyCode~=Enum.KeyCode.Unknown then D(J.KeyCode,'From input box')end z:set(false)task.wait()
q:update('boolean',false)else if J.KeyCode and J.KeyCode==aF(B)and not K and not aF(q.boolean)then g:update('boolean',
not aF(g.boolean))end end end)aK.add(J)local K=aH(aG.get'container',15)aK.add(aG.get'container':GetPropertyChangedSignal
'Position':Connect(function()local L=aG.get'container'local M=L.AbsolutePosition+Vector2.new(aF(t)/2,aF(u)/2)if(M.X-I.
screenSize.AbsoluteSize.X)/aF(t)>0.435 then K:Disconnect()L.Position=UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.
Offset)K=aH(aG.get'container',15)end if-((M.X-I.screenSize.AbsoluteSize.X)/aF(t)+1)>0.8 then K:Disconnect()L.Position=
UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.Offset)K=aH(aG.get'container',15)end if(M.Y-(I.screenSize.AbsoluteSize.Y
+aF(aS.number)))/aF(u)>0.32 then K:Disconnect()L.Position=UDim2.new(L.Position.X.Scale,L.Position.X.Offset,0.5,aF(aS.
number))K=aH(aG.get'container',15)end if-((M.Y-(I.screenSize.AbsoluteSize.Y+aF(aS.number)))/aF(u)+1)>0.935 then K:
Disconnect()L.Position=UDim2.new(L.Position.X.Scale,L.Position.X.Offset,0.5,aF(aS.number))K=aH(aG.get'container',15)end
end))end end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...)return setmetatable({},{__index=
function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[85]=
function()local aa,ab,ac=a(85)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(
af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.
Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[86]=function()
local aa,ab,ac=a(86)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag
or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[87]=function()local aa,ab,ac=a(87)local ad
return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag,ah,ai,aj)return ae.New
'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,
HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=
aj or UDim.new(0,0)}end end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae=ac(ab.Parent.
Parent.Bundles.Fusion)return function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingLeft=UDim.new(0,
...),PaddingRight=UDim.new(0,...),PaddingTop=UDim.new(0,...),PaddingBottom=UDim.new(0,...)}elseif#af==2 then return ae.
New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2]),PaddingBottom=UDim.new(0,af[1]),PaddingLeft=
UDim.new(0,af[2])}elseif#af==3 then return ae.New'UIPadding'{PaddingTop=UDim.new(0,af[1]),PaddingRight=UDim.new(0,af[2])
,PaddingBottom=UDim.new(0,af[3]),PaddingLeft=UDim.new(0,af[2])}else return ae.New'UIPadding'{PaddingTop=typeof(af[1])==
'number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=
typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[4])=='number'and UDim.new(0,af[4])or af[4]}
end end end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)return function(af:number?,ag:number?)return ae.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)(
)end,[90]=function()local aa,ab,ac=a(90)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if
ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[91]=function()local aa,ab,
ac=a(91)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring
return function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[92]=function()local aa,ab,ac=a(92)local ad return(
function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.add(ah)table.insert(ae,ah)end
function af.deleteConnections()for ah,ai in ae do if typeof(ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil
end end return af end)()end,[93]=function()local aa,ab,ac=a(93)local ad return(function(...)local ae={Inter=
'rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.FontWeight?,ah:Enum.
FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal if ae[af]then
return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[94]=function()local aa,ab,ac=a(94)local ad
return(function(...)local ae,af={},{}function ae.cloneref(ag)if cloneref then return cloneref(ag)else return ag end end
function ae.printFileSystem()print(af)end function ae.gethui(...)return gethui(...)or nil end ae.getgenv=getgenv or nil
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
'Darius'},{{90,2,{'utilities'},{{91,2,{'animate'}},{95,2,{'drag'}},{97,2,{'getStringBounds'}},{96,2,{'get'}},{92,2,{
'connections'}},{93,2,{'customFont'}},{100,2,{'tween'}},{101,2,{'typecheck'}},{99,2,{'references'}},{98,2,{
'randomString'}},{94,2,{'customFunctions'}}}},{82,1,{'layouts'},{{83,2,{'main'}}}},{84,2,{'simpleElements'},{{85,2,{
'UIAspectRatioConstraint'}},{88,2,{'UIPadding'}},{86,2,{'UICorner'}},{87,2,{'UIListLayout'}},{89,2,{
'UITextSizeConstraint'}}}},{2,2,{'Bundles'},{{61,2,{'services'}},{62,2,{'themeSystem'},{{63,2,{'default'}}}},{59,2,{
'icons'}},{58,2,{'flags'}},{60,2,{'lucide'}},{57,2,{'data'}},{3,2,{'Fusion'},{{22,1,{'Instances'},{{30,2,{'Ref'}},{28,2,
{'OnEvent'}},{23,2,{'Children'}},{29,2,{'Out'}},{32,2,{'defaultProps'}},{31,2,{'applyInstanceProps'}},{24,2,{'Cleanup'}}
,{25,2,{'Hydrate'}},{27,2,{'OnChange'}},{26,2,{'New'}}}},{16,1,{'Dependencies'},{{18,2,{'initDependency'}},{19,2,{
'sharedState'}},{20,2,{'updateAll'}},{17,2,{'captureDependencies'}},{21,2,{'useDependency'}}}},{48,2,{'Types'}},{39,2,{
'PubTypes'}},{33,1,{'Logging'},{{38,2,{'parseError'}},{34,2,{'logError'}},{36,2,{'logWarn'}},{37,2,{'messages'}},{35,2,{
'logErrorNonFatal'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{40,1,{'State'},{{41,2,{'Computed'}},{44,2,{'ForValues'}},{
42,2,{'ForKeys'}},{47,2,{'unwrap'}},{46,2,{'Value'}},{43,2,{'ForPairs'}},{45,2,{'Observer'}}}},{4,1,{'Animation'},{{10,2
,{'lerpType'}},{9,2,{'getTweenRatio'}},{5,2,{'Spring'}},{6,2,{'SpringScheduler'}},{7,2,{'Tween'}},{12,2,{
'springCoefficients'}},{11,2,{'packType'}},{13,2,{'unpackType'}},{8,2,{'TweenScheduler'}}}},{49,1,{'Utility'},{{53,2,{
'isSimilar'}},{54,2,{'needsDestruction'}},{51,2,{'cleanup'}},{50,2,{'None'}},{56,2,{'xtypeof'}},{52,2,{'doNothing'}},{55
,2,{'restrictRead'}}}}}}}},{64,1,{'components'},{{65,2,{'button'}},{80,2,{'toggle'}},{68,2,{'divider'}},{81,2,{'warn'}},
{67,2,{'colorpicker'}},{76,2,{'slider'}},{74,2,{'notification'}},{73,2,{'module'}},{78,2,{'tabFrame'}},{69,2,{'dropdown'
}},{71,2,{'keybindList'}},{77,2,{'tabButton'}},{66,2,{'buttonGroup'}},{72,2,{'label'}},{79,2,{'textbox'}},{75,2,{
'paragraph'}},{70,2,{'keybind'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,coroutine,
script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay,az,aA=aj.insert,aj.remove,aj.freeze or
function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,
'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB or function(aC
,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{}
,{}local aL,aM={GetFullName={{},function(aL)local aM,aN=aL.Name,aL.Parent while aN do aM=aN.Name..'.'..aM aN=aN.Parent
end return aM end},GetChildren={{},function(aL)local aM={}for aN in ai,aK[aL]do au(aM,aN)end return aM end},
GetDescendants={{},function(aL)local aM={}for aN in ai,aK[aL]do au(aM,aN)for aO,aP in ai,aN:GetDescendants()do au(aM,aP)
end end return aM end},FindFirstChild={{'string','boolean?'},function(aL,aM,aN)local aO=aK[aL]for aP in ai,aO do if aP.
Name==aM then return aP end end if aN then for aQ in ai,aO do return aQ:FindFirstChild(aM,true)end end end},
FindFirstAncestor={{'string'},function(aL,aM)local aN=aL.Parent while aN do if aN.Name==aM then return aN end aN=aN.
Parent end end},WaitForChild={{'string','number?'},function(aL,aM)return aL:FindFirstChild(aM)end}},{}for aN,aO in ai,aL
do local aP,aQ,aR=aO[1],aO[2],{}for aS,aT in ai,aP do local aU,b=az(aT,'^([^%?]+)(%??)')aR[aS]={aU,b}end aM[aN]=function
(aU,...)if not aK[aU]then ah("Expected ':' not '.' calling member function "..aN,2)end local b={...}for f,g in ai,aR do
local h=b[f]local q,r,s=an(h),g[1],g[2]if h==nil and not s then ah('Argument '..h..' missing or nil',3)end if r~='any'
and q~=r and not(q=='nil'and s)then ah('Argument '..f..' expects type "'..r..'", got "'..q..'"',2)end end return aQ(aU,
...)end end local function aP(aQ,aR,aS)local aT,aU=(ag({},{__mode='k'}))local function b(f)ah(f..
' is not a valid (virtual) member of '..aQ..' "'..aR..'"',3)end local function f(g)ah(
'Unable to assign (virtual) property '..g..'. Property is read only',3)end local g,h={},{}h.__metatable=false h.__index=
function(q,r)if r=='ClassName'then return aQ elseif r=='Name'then return aR elseif r=='Parent'then return aS elseif aQ==
'StringValue'and r=='Value'then return aU else local s=aM[r]if s then return s end end for s in ai,aT do if s.Name==r
then return s end end b(r)end h.__newindex=function(q,r,s)if r=='ClassName'then f(r)elseif r=='Name'then aR=s elseif r==
'Parent'then if s==g then return end if aS~=nil then aK[aS][g]=nil end aS=s if s~=nil then aK[s][g]=true end elseif aQ==
'StringValue'and r=='Value'then aU=s else b(r)end end h.__tostring=function()return aR end ag(g,h)aK[g]=aT if aS~=nil
then aK[aS][g]=true end return g end local function aQ(aR,aS)local aT,aU,b,f=aR[1],aR[2],aR[3],aR[4]local g=aD[aU]local
h=b and av(b,1)or g local q=aP(g,h,aS)aE[aT]=q if b then for r,s in ai,b do q[r]=s end end if f then for r,s in ai,f do
aQ(s,q)end end return q end local aR=aP('Folder','['..ad..']')for aS,aT in ai,ab do aQ(aT,aR)end for aU,b in ai,aa do
local f=aE[aU]aF[f]=b aG[f]=aU local g=f.ClassName if g=='LocalScript'or g=='Script'then au(aI,f)end end local function
f(g)local h,q=g.ClassName,aH[g]if q and h=='ModuleScript'then return ak(q)end local r=aF[g]local function s(t)t=aq(t)
local u,v,w=g:GetFullName(),az(t,'[^:]+:(%d+): (.+)')if not v or not at then return u..':*: '..(w or t)end v=ar(v)local
x=aG[g]local y=at[x]local z=v-y+1 if z<0 then z='?'end return u..':'..z..': '..w end if h=='LocalScript'or h=='Script'
then local t,u=ap(r)if not t then ah(s(u),0)end else local t={ap(r)}local u=av(t,1)if not u then local v=av(t,1)ah(s(v),
0)end aH[g]=t return ak(t)end end function a(g)local h=aE[g]local function q(r,...)local s={ap(r,...)}local t=av(s,1)if
not t then ah(s[1],3)end return ak(s)end local r=aw(ag({},{__index=aJ,__newindex=function(r,s,t)aJ[s]=t end,__len=
function()return#aJ end,__iter=function()return ai,aJ end}))local s,t=aw{version=ac,envname=ad,shared=r,script=am,
require=ao},h local function u(v,...)local w,x,y=an(v),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if w=='table'and aK[v]then if v.ClassName~='ModuleScript'then ah(x,2)elseif v==h
then ah(y,2)end return f(v)elseif w=='string'and ay(v,1,1)~='@'then if#v==0 then ah(
'Attempted to call require with empty string',2)end local z=h if ay(v,1,1)=='/'then z=aR elseif ay(v,1,2)=='./'then v=
ay(v,3)end local B for C in aA(v,'([^/]*)/?')do local D=C if C=='..'then D='Parent'end if D~=''then local E=z:
FindFirstChild(D)if not E then local F=z.Parent if F then E=F:FindFirstChild(D)end end if E then z=E elseif C~=B and C~=
'init'and C~='init.server'and C~='init.client'then ah('Virtual script path "'..v..'" not found',2)end end B=C end if z.
ClassName~='ModuleScript'then ah(x,2)elseif z==h then ah(y,2)end return f(z)end return q(ao,v,...)end return s,t,u end
for g,h in ai,aI do aC(f,h)end return f(aR:GetChildren()[1])