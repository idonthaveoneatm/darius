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
'divider',V,{tab=U})end function W.ColorPicker(X,Y)Y.tab=U return x('colorpicker',V,Y)end function W.ButtonGroup(X)
return x('buttonGroup',V,{tab=U})end return R[U.uid]end y.Destroyed=false function y.Notify(S,T)return x('notification',
o.get'notificationList',T)end function y.Destroy(S)y.Destroyed=true O:Fire()for T,U in E.list do U:set(false)end task.
wait(0.1)p:deleteConnections()o:clear()O:Destroy()end function y.LoadConfig(S)if not A.UseConfig then return end end
function y.SetTheme(S,T)local U,V=t({['New Theme']=T},{['New Theme']={}})assert(U,table.concat(V,'\n'))end function y.
ExportTheme(S)local T,U=i.getTheme(),{}U.name=T.name U.uid=T.uid U.palette={}for V,W in T.palette do U.palette[V]=W:
ToHex()end return k:JSONEncode(U)end function y.CreateSettings(S)local T,U,V,W,X=R:Tab{Name='Settings',Image=h.cog},i.
getTheme().palette,{},{},{}table.foreach(U,function(Y)table.insert(W,Y)end)table.foreach(i.getThemes(),function(Y,Z)
table.insert(X,{DisplayValue=Z.name,Value=Z.uid})end)local Y,Z,_,aa,ab,ac=''local ad=T:Dropdown{Name='Current Theme',
Items=X,Default=i.getTheme().uid,Callback=function(ad)i.set(ad)U=i.getTheme().palette table.clear(V)table.foreach(U,
function(ae,af)V[ae]=af end)if Z and Y~=''then Z:SetColor(i.get(Y))end if ad=='original'and ab then ab:Disable()elseif
ad~='original'and ab then ab:Enable()end if ad=='original'and ac then ac:Disable()elseif ad~='original'and ac then ac:
Enable()end end}local function ae(af)table.clear(X)table.foreach(i.getThemes(),function(ag,ah)table.insert(X,{
DisplayValue=ah.name,Value=ah.uid})end)ad:SetItems(X)ad:SelectItem(af)end local af,ag,ah=T:ButtonGroup(),false,false
local function ai(aj)if aj then aa:Visible()Z:Visible()if ah then _:Visible()end else _:Invisible()Z:Invisible()aa:
Invisible()end end local aj,ak,al,am=false local function an(ao)if ao then ak:Visible()al:Visible()am:Visible()else ak:
Invisible()al:Invisible()am:Invisible()end end af:Button{Name='Edit',Callback=function()aj=false an(false)ag=not ag ai(
ag)end}aa=T:Dropdown{Name='Colors',Visible=false,Items=W,Callback=function(ao)Y=ao Z:SetColor(i.get(Y))Z:Enable()Z:
SetName(`Editing: {Y}`)end}Z=T:ColorPicker{Name='Editing Color: ',IsEnabled=false,Visible=false,DisabledText=
'Select Color First!',HideTransparency=true,Callback=function(ao)local ap=i.getTheme().palette if ap[Y].R~=ao.R or ap[Y]
.G~=ao.G or ap[Y].B~=ao.B then ah=true _:Visible()elseif ap[Y].R==ao.R or ap[Y].G==ao.G or ap[Y].B==ao.B then ah=false
end i.edit(Y,ao)end}_=T:Button{Name='Reset Color',Visible=false,Callback=function()ah=false Z:SetColor(V[Y])_:Invisible(
)end}local ao=''af:Button{Name='Create',Callback=function()ag=false ai(false)aj=not aj an(aj)end}ak=T:TextBox{Name=
'Name your theme',Visible=false,Callback=function(ap)ao=ap end}al=T:Button{Name='Create theme',Visible=false,Callback=
function()if ao==''then y:Notify{Title=A.Title,Body='Theme name cannot be empty!',Duration=3,Image=h.alert,ImageColor=i.
get'red'}return end local ap=i.create(ao,i.getColors())local aq={i.set(ap)}if aq[1]then ae(ap)aj=false an(aj)end end}am=
T:Button{Name='Cancel',Visible=false,Callback=function()aj=false an(aj)ak:SetInput''end}ac=af:Button{Name='Save',
DisabledText='Disabled',Callback=function()local ap=i.save(i.getTheme().uid)if ap then y:Notify{Title=A.Title,Body=`Saved theme with uid "{
i.getTheme().uid}"`,Duration=3,Image=h.check}else y:Notify{Title='Theme Manager Error',Body=`Couldn't find/save theme with uid "{
i.getTheme().uid}"`,Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}ab=af:Button{Name='Delete',DisabledText=
'Disabled',Callback=function()local ap={i.find(i.getTheme().uid)}if ap[1]then local aq=ap[2]i.delete(aq.uid)ae(M)y:
Notify{Title=A.Title,Body=`Deleted theme with uid "{aq.uid}"`,Duration=3,Image=h.check}else y:Notify{Title=
'Theme Manager Error',Body=`Couldn't find theme with uid "{i.getTheme().uid}"`,Duration=3,Image=h.alert,ImageColor=i.get
'red'}end end}T:Divider()local ap={}table.foreach(v.getConfigs(),function(aq,ar)table.insert(ap,{DisplayValue=ar.name,
Value=ar.uid})end)local aq=''local ar,as=T:Dropdown{Name='Configs',Items=ap,AlwaysOpen=true,Callback=function(ar)aq=ar
end},T:ButtonGroup()as:Button{Name='Load',Callback=function()if aq~=''then v.set(aq)local at=v.find(aq)y:Notify{Title=A.
Title,Body=`Set configuration to "{at.name}"`,Duration=3,Image=h.check}else y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end end}local function at()table.clear(ap)
table.foreach(v.getConfigs(),function(au,av)table.insert(ap,{DisplayValue=av.name,Value=av.uid})end)ar:SetItems(ap)end
local au,av,aw,ax=''as:Button{Name='Create',Callback=function()as:Invisible()ar:Invisible()av:Visible()aw:Visible()ax:
Visible()end}av=T:TextBox{Visible=false,Name='Name your configuration',Callback=function(ay)au=ay end}aw=T:Button{
Visible=false,Name='Complete new configuration',Callback=function()if au~=''then v.create(au,nil,false,nil)at()as:
Visible()ar:Visible()av:Invisible()aw:Invisible()ax:Invisible()y:Notify{Title=A.Title,Body=`Created "{au}"`,Duration=3,
Image=h.check}av:SetInput''else y:Notify{Title='Configuration Error',Body='Name cannot be empty',Duration=3,Image=h.
alert,ImageColor=i.get'red'}end end}ax=T:Button{Visible=false,Name='Cancel',Callback=function()as:Visible()ar:Visible()
av:Invisible()aw:Invisible()ax:Invisible()av:SetInput''end}as:Button{Name='Save',Callback=function()if aq~=''then v.
save(aq)local ay=v.find(aq)y:Notify{Title=A.Title,Body=`Saved configuration "{ay.name}"`,Duration=3,Image=h.check}else y
:Notify{Title='Configuration Error',Body='No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}end
end}as:Button{Name='Delete',Callback=function()if aq==''then y:Notify{Title='Configuration Error',Body=
'No configuration selected',Duration=3,Image=h.alert,ImageColor=i.get'red'}return end v.delete(aq)at()end}end if q.
getgenv then q.getgenv().dariusInstance=y else _G.dariusInstance=y end return y[J.uid]end return y end)()end,function()
local aa,ab,ac=a(2)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)
then return ac(ab[af])else error('no bundle: '..af)end end})end)()end,function()local aa,ab,ac=a(3)local ad return(
function(...)local ae=ac(game:GetObjects'rbxassetid://110500042647914'[1])return ae end)()end,function()local aa,ab,ac=
a(4)local ad return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Fusion)local ag,ah
,ai=af.Value,{},{}type uid=string type tag=string function ai.update(aj:string,ak:string,al:string)if ak~='uid'and ai.
find(aj)and ai.find(aj)[ak]then local am=ai.find(aj)am[ak]:set(al)elseif not ai.find(aj)then error("couldn't find uid: "
..aj)elseif ak=='uid'or ak=='__tag'then error('cannot edit property '..ak)elseif not ai.find(aj)[ak]then else error
'how?'end end function ai.find(aj:uid|tag):table local ak for al=1,#ah do if ah[al].uid==aj or ah[al].__tag==aj then ak=
ah[al]end end if not ak then warn('no data found by identifier: '..tostring(aj))return ak end return ak end function ai.
delete(aj:string)local ak=ai.find(aj)local al,am=table.find(ah,ak),{}for an=1,#ah do if an~=al then table.insert(am,ah[
an])end end ah=am am=nil end function ai.add(aj:table,ak:string,al:boolean):table al=al or false if not al then for am,
an in aj do aj[am]=ag(an)end end aj.__tag=ak or nil aj.uid=ae(16)setmetatable(aj,{__index={update=function(am,an,ao)ai.
update(am.uid,an,ao)end,delete=function()ai.delete(aj.uid)end}})table.insert(ah,aj)return ai.find(aj.uid)end return ai
end)()end,function()local aa,ab,ac=a(5)local ad return(function(...)local ae,af,ag=ac(ab.Parent).data,ac(ab.Parent.
Parent.utilities).get,ac(ab.Parent).services local ah,ai=ag.HttpService,ac(ab.Parent).Fusion local aj,ak,al=ai.Observer,
ai.Value,ac(ab.Parent.Parent.utilities)local am,an,ao,ap,aq,ar,as=al.connections,al.customFunctions,al.randomString,{},
ae.add({list={}},'flags'),{},{}local at,au,av={toggle=function(at)local au=at.status.boolean am.add(aj(au):onChange(
function()local av=af(au)at.user.Value=av at.bindableEvent:Fire(av)end))end,dropdown=function(at)local au=at.status.
multiselect and at.status.items or at.status.item am.add(aj(au):onChange(function()local av=af(au)at.user.Value=av at.
bindableEvent:Fire(av)end))end,keybind=function(at)local au=at.status.mobile and at.status.coordinate or at.status.
keycode am.add(aj(au):onChange(function()local av=af(au)at.user.Value=av at.bindableEvent:Fire(av)end))end,slider=
function(at)local au=at.status.percentageOf am.add(aj(au):onChange(function()local av=af(au)at.user.Value=av at.
bindableEvent:Fire(av)end))end,textbox=function(at)local au=at.status.correctText am.add(aj(au):onChange(function()local
av=af(au)at.user.Value=av at.bindableEvent:Fire(av)end))end,colorpicker=function(at)local au,av=at.status.color,at.
status.transparency am.add(aj(au):onChange(function()at.user.Value={af(au),af(av)}at.bindableEvent:Fire(unpack(at.user.
Value))end))am.add(aj(av):onChange(function()at.user.Value={af(au),af(av)}at.bindableEvent:Fire(unpack(at.user.Value))
end))end},{toggle=function(at)local au={}if at.boolean then au.boolean=af(at.boolean)end if at.keycode then au.keycode=
af(at.keycode)end return au end,dropdown=function(at)return at.multiselect and af(at.items)or af(at.item)end,keybind=
function(at)local au={}if at.keycode then au.keycode=af(at.keycode)end if at.coordinate then au.coordinate=af(at.
coordinate)end return au end,slider=function(at)return af(at.percentageOf)end,textbox=function(at)return af(at.
correctText)end,colorpicker=function(at)return{color=af(at.color),transparency=af(at.transparency)}end},{}ap.
currentConfig=''ap.path=''function ap.preregister(aw)local ax,ay=ai.New'BindableEvent'{},{}function ay.Connect(b,c)
assert(typeof(c)=='function','Connect only takes functions')am.add(ax.Event:Connect(c))end local b b={name=aw,status={},
type='unknown',preregistered=true,bindableEvent=ax,file=ak{},user={Value=nil,OnChange=setmetatable(ay,{__newindex=
function(c,d,e)return nil end})}}as[aw]=b local c=af(aq.list)c[b.name]=b aq:update('list',c)return b end function ap.
register(aw,ax,ay,b)assert(not table.find(ar,aw),'Flags must all be unique!')table.insert(ar,aw)local c,d=ai.New
'BindableEvent'{},{}function d.Connect(e,f)assert(typeof(f)=='function','Connect')am.add(c.Event:Connect(f))end local e
if not as[aw]then e={name=aw,status=ax,type=ay,private=b,preregistered=false,bindableEvent=c,file=ak{},user={Value=nil,
OnChange=setmetatable(d,{__newindex=function()return nil end})}}at[e.type](e)local f=af(aq.list)f[e.name]=e aq:update(
'list',f)else e=as[aw]e.type=ay e.preregistered=false e.status=ax e.private=b at[e.type](e)as[e.name]=nil end return e
end function ap.find(aw)for ax,ay in av do if ay.uid==aw then return ay,ax end end return false end function ap.create(
aw,ax,ay,b)ay=ay or false if ax=='original'and ay then return end local c={}c.name=aw c.uid=ax or ao(5)c.flagValues={}if
ay then c.flagValues=b else for d,e in af(aq.list)do if e.private then continue end if e.type=='unknown'then continue
end c.flagValues[e.name]=au[e.type](e.status)end end table.insert(av,c)return ax end function ap.init()for aw,ax in an.
listfiles(ap.path)do local ay=ah:JSONDecode(an.readfile(ax))ap.create(ay.name,ay.uid,true,ay.flagValues)end end function
ap.load(aw)for ax,ay in aw do local b=af(aq.list)[ax]if not b then continue end b.file:set(ay)end end function ap.set(aw
)local ax=ap.find(aw)if not ax then return end ap.currentConfig=aw ap.load(ax.flagValues)end function ap.save(aw)local
ax=ap.find(aw)for ay,b in af(aq.list)do if b.private then continue end if b.type=='unknown'then continue end ax.
flagValues[b.name]=au[b.type](b.status)end an.writefile(`{ap.path}/{ax.uid}.json`,ah:JSONEncode(ax))end function ap.
delete(aw)local ax,ay=ap.find(aw)if ax then if an.isfile(`{ap.path}/{ax.uid}.json`)then an.delfile(`{ap.path}/{ax.uid}.json`
)table.remove(av,ay)end end end function ap.getConfigs()return av end return ap end)()end,function()local aa,ab,ac=a(6)
local ad return(function(...)return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize=
'rbxassetid://15556637715',close='rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown=
'rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check=
'rbxassetid://10709790644',command='rbxassetid://10723416765',input='rbxassetid://10734982297',search=
'rbxassetid://10734943674',finger='rbxassetid://10734929723',alert='rbxassetid://10709752996',paint=
'rbxassetid://10734910187',cog='rbxassetid://10709810948'}end)()end,function()local aa,ab,ac=a(7)local ad return(
function(...)local ae=loadstring(game:GetObjects'rbxassetid://85554466048193'[1].Source)()return ae end)()end,function()
local aa,ab,ac=a(8)local ad return(function(...)local ae=ac(ab.Parent.Parent.utilities.customFunctions)local af,ag=ae.
cloneref,{}ag=setmetatable(ag,{__index=function(ah,ai)return af(game:GetService(ai))end})return ag end)()end,function()
local aa,ab,ac=a(9)local ad return(function(...)local ae,af={},ac(ab.Parent.services)local ag,ah,ai,aj=af.HttpService,
ac(ab.Parent.data),ac(ab.Parent.Fusion),ac(ab.default)local ak,al,am,an,ao,ap,aq,ar=ai.Value,ai.Observer,ac(ab.Parent.
Parent.utilities.get),ac(ab.Parent.Parent.utilities.animate),ac(ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.
utilities.randomString),ac(ab.Parent.Parent.utilities.customFunctions),{}local as,at,au=ak{},ak{},''al(as):onChange(
function()for av,aw in ipairs(ar)do task.spawn(aw)end end)local av,aw,ax={},{},{}table.foreach(aj,function(ay)table.
insert(ax,ay)end)ae.path=''function ae.find(ay)for b,c in av do if c.uid==ay then return true,c end end return false end
function ae.create(ay,b,c,d,e)d=d or false if c=='original'and d then return end for f,g in ax do if b[g]==nil then b[g]
=aj[g]end if typeof(b[g])~='Color3'then ao(g.." isn't type Color3")end end for h,i in b do if not table.find(ax,h)then
ao('Incorrect value removed "'..tostring(h)..'"')b[h]=nil end end if e and d then table.insert(aw,c)end if e and not d
then for j,k in aw do local l=ae.find(k)if l.name==ay then return k.uid end end end c=c or ap(5)table.insert(av,{name=ay
,uid=c,fromSet=e or false,palette=b})local j={}j.name=ay j.uid=c j.fromSet=e j.palette={}for k,l in b do j.palette[k]=l:
ToHex()end aq.writefile(`{ae.path}/{c}.json`,ag:JSONEncode(j))return c end function ae.delete(ay)local b={ae.find(ay)}if
not b[1]then return false,'no theme found'end local c=table.find(av,b[2])ae.set(au)table.remove(av,c)aq.delfile(`{ae.
path}/{b[2].uid}.json`)end function ae.edit(ay,b)local c=am(as)c[ay]=b as:set(c)end function ae.set(ay)local b,c,d={ae.
find(ay)}if b[1]then c,d=b[2],b[2].palette else return false,'no theme found'end local e={}table.foreach(d,function(i,j)
e[i]=j end)as:set(e)at:set(c)return true,'successfully set new theme'end function ae.save(ay)local b={ae.find(ay)}if b[1
]then local c,d=b[2],{}d.name=c.name d.uid=ay d.fromSet=c.fromSet d.palette={}for e,i in am(as)do d.palette[e]=i:ToHex()
end c.palette=am(as)aq.writefile(`{ae.path}/{ay}.json`,ag:JSONEncode(d))return true else return false end end function
ae.get(ay)local b=am(as)if b[ay]then return b[ay]else error(ay.." isn't a theme element")end end for ay,b in ax do ae[b]
=an(function()return am(as)[b]end,40,1)end function ae.init()au=ae.create('darius',aj,'original')ae.set(au)for c,d in aq
.listfiles(ae.path)do local e=ag:JSONDecode(aq.readfile(d))table.foreach(e.palette,function(i,j)local k=Color3.fromHex(`#{
j}`)e.palette[i]=k end)ae.create(e.name,e.palette,e.uid,true,e.fromSet)end end function ae.onChange(c)table.insert(ar,c)
end function ae.getTheme()return am(at)end function ae.getThemes()return av end function ae.getColors()return am(as)end
return ae end)()end,function()local aa,ab,ac=a(10)local ad return(function(...)return{background=Color3.fromHex'#2C2F33'
,background2=Color3.fromHex'#222427',text=Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.
fromHex'#1A1A1B',scrollBar=Color3.fromHex'#DCE1E5',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.
fromHex'#222427',mobileButtonBackground=Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',
mobileButtonImage=Color3.fromHex'#2C2F33',disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex
'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[12]=
function()local aa,ab,ac=a(12)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.
Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local as,at,au,av,aw=ar.get,ar.animate,ar.typecheck,ar.
customFont,ac(ae.simpleElements)local ax,ay,b,c=aw.UIPadding,aw.UICorner,au(af,{Name='',DisabledText='',IsEnabled=false,
Visible=false,Callback=function()end},{af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.DisabledText and''
or'DisabledText'})assert(b,table.concat(c,'\n'))local d,e,i,j,k,l,m,n,o=ah.find'selectedTab',ah.find'searchText',ah.add(
af),af.Parent,af.Name,af.Callback,af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.Visible or an(
true)local p=an(as(d.string)==as(i.tab).uid)ao(d.string):onChange(function()p:set(as(d.string)==as(i.tab).uid)end)local
q=at(function()return as(p)and 0 or 1 end,40,1)al'TextButton'{Interactable=aq(function()if not as(m)then return false
end return as(p)end),Visible=aq(function()if as(e.string)~=''and not string.find(as(k):lower(),as(e.string):lower())or
not as(o)then return false end return true end),Parent=j,Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,
BackgroundTransparency=q,[ap'Activated']=function()if not as(m)then return end task.spawn(as(l))end,[am]={ay(6),al
'Frame'{ZIndex=2,Visible=aq(function()if not as(m)then return true end return false end),BackgroundTransparency=at(
function()return as(p)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={ay(6
),al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=q},al'TextLabel'{FontFace=av(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=q,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=n,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,[am]={ax(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[
am]={ax(0,8),al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=k,TextTransparency=q,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(
24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.fingerprint,
ImageColor3=ai.text2,ImageTransparency=q}}}}}local r={}function r.SetName(s,t)local u,v=au({SetName=t},{SetName=''})
assert(u,table.concat(v,'\n'))k:set(t)end function r.SetCallback(s,t)local u,v=au({SetCallback=t},{SetCallback=function(
)end})assert(u,table.concat(v,'\n'))l:set(t)end function r.Fire(s)task.spawn(as(l))end function r.Enable(s)m:set(true)
end function r.Disable(s)m:set(false)end function r.Visible(s)o:set(true)end function r.Invisible(s)o:set(false)end
return r end end)()end,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,
ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local as,at,au,av,aw=ar.get,ar.animate
,ar.typecheck,ar.customFont,ac(ae.simpleElements)local ax,ay,b,c,d,e,i,j,k,l,m=aw.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw.UIPadding,aw.UICorner,af.Parent,af.tab,an(0),an(true)
local n=al'Frame'{Visible=m,Parent=j,Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[am]={ax(ay.LayoutOrder,b.
Horizontal,c.Left,d.Center,UDim.new(0,3))}}local o,p=an(n.AbsoluteSize),{}function p.Button(q,r)local s,t=au(r,{Name='',
DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{r.IsEnabled and''or'IsEnabled',r.Visible and''or
'Visible',r.DisabledText and''or'DisabledText'})assert(s,table.concat(t,'\n'))l:set(as(l)+1)local u,v,w,x,y,z,A,B=ah.
find'selectedTab',ah.find'searchText',ah.add(r),r.Name,r.Callback,r.IsEnabled or an(true),r.DisabledText or an
'Component Disabled',r.Visible or an(true)local C=an(as(u.string)==as(k).uid)ao(u.string):onChange(function()C:set(as(u.
string)==as(k).uid)end)local D=at(function()return as(C)and 0 or 1 end,40,1)al'TextButton'{Interactable=aq(function()if
not as(z)then return false end return as(C)end),Visible=aq(function()if as(v.string)~=''and not string.find(as(x):lower(
),as(v.string):lower())or not as(B)then return false end return true end),Size=aq(function()return UDim2.new(1/as(l)-(
as(l)-1==0 and 0 or((((as(l)-1)*3)/as(l))/as(o).X)),0,0,36)end),Parent=n,BackgroundColor3=ai.background2,
BackgroundTransparency=D,[ap'Activated']=function()if not as(z)then return end task.spawn(as(y))end,[am]={i(6),al'Frame'
{ZIndex=2,Visible=aq(function()if not as(z)then return true end return false end),BackgroundTransparency=at(function()
return as(C)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={i(6),al
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=D},al'TextLabel'{FontFace=av(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=D,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=A,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,[am]={e(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am
]={e(0,8),al'TextLabel'{FontFace=av('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32,0,18),BackgroundTransparency
=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=x,
TextTransparency=D,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=
ai.text2,ImageTransparency=at(function()return as(C)and 0.5 or 1 end,40,1)}}}}}local E={}function E.SetName(F,G)local H,
I=au({SetName=G},{SetName=''})assert(H,table.concat(I,'\n'))x:set(G)end function E.SetCallback(F,G)local H,I=au({
SetCallback=G},{SetCallback=function()end})assert(H,table.concat(I,'\n'))y:set(G)end function E.Fire(F)task.spawn(as(y))
end function E.Enable(F)z:set(true)end function E.Disable(F)z:set(false)end function E.Visible(F)B:set(true)end function
E.Invisible(F)B:set(false)end return E end function p.Visible(q)m:set(true)end function p.Invisible(q)m:set(false)end
return p end end)()end,[14]=function()local aa,ab,ac=a(14)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an
,ao=al.RunService,al.UserInputService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao.Children,ao.Value,ao.Observer,ao
.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local ax,ay,b,c,d,e,i=aw.get,aw.animate,aw.typecheck,aw.customFont,aw.
randomString,aw.connections,ac(ae.simpleElements)local j,k,l,m,n,o,p,q,r,s=i.UIListLayout,i.UIPadding,i.
UITextSizeConstraint,i.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,b(af,{
Name='',DisabledText='',IsEnabled=false,Callback=function()end,FLAG='',Visible=false,Color=Color3.new(),Transparency=0,
HideTransparency=true,IgnoreConfig=true},{af.IsEnabled and''or'IsEnabled',af.DisabledText and''or'DisabledText',af.FLAG
and''or'FLAG',af.Color and''or'Color',af.Visible and''or'Visible',af.Transparency and''or'Transparency',af.
HideTransparency and''or'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(r,table.concat(s,'\n'))local t,
u,v,w,x,y,z,A,B,C,D,E,F,G,H,I=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',ah.find'absoluteOffset',ah.
find'currentPicker',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ar(true),af.DisabledText or ar
'Component Disabled',af.Color or ar(Color3.new(1)),af.IgnoreConfig or ar(false),af.Transparency or ar(0),af.Visible or
ar(true),af.HideTransparency or ar(false)local J,K=(af.FLAG or ar(y.uid))if ax(J)~=''then K=ak.register(ax(J),{color=ar(
Color3.new(1)),transparency=ar(0)},'colorpicker',ax(J)==y.uid)K.user.Value={ax(K.status.color),ax(K.status.transparency)
}end local L,M=K.status.color,K.status.transparency as(L):onChange(function()if ax(C)then task.spawn(ax(B),ax(L),ax(M))
end end)as(M):onChange(function()if ax(C)then task.spawn(ax(B),ax(L),ax(M))end end)local N=ar(ax(t.string)==ax(y.tab).
uid)as(t.string):onChange(function()N:set(ax(t.string)==ax(y.tab).uid)end)local O,P,Q,R,S,T,U,V,W,X,Y,Z,_,az,aA,aB,aC,aD
=ay(function()return ax(N)and 0 or 1 end,40,1),ar(),ar(0),ar(),ar(0),ar(),ar(0),ar(),ar(false),ar(),ar(false),ar(),ar(
false),ar(0),ar(0),(ar(0))local function aE()return{Name=A,Children={j(n.LayoutOrder,o.Vertical,p.Center,q.Top,UDim.new(
0,5)),ap'TextButton'{Size=UDim2.fromOffset(224,224),[av]=V,[at'InputBegan']=function(aF)if aF.UserInputType~=Enum.
UserInputType.MouseButton1 then return end W:set(true)local aG aG=aF.Changed:Connect(function()if aF.UserInputState==
Enum.UserInputState.End or aF.UserInputState.Cancel then W:set(false)aG:Disconnect()end end)end,[aq]={ap'UIGradient'{
Color=au(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(ax(az),1,1))}end)},ap'Frame'{Size=UDim2.fromScale(1,1),[aq]={ap'UIGradient'{
Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(0,0,0))},Transparency=au(function()return NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)}end)}}},ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=
1,Image=aj.circle,Size=UDim2.fromOffset(10,10),ImageColor3=au(function()return Color3.fromHSV(0,0,1-ax(aB))end),Position
=au(function()return UDim2.fromScale(ax(aA),1-ax(aB))end),[aq]={ap'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5)
,BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromScale(0.9,0.9),ImageColor3=au(function()return Color3.fromHSV(
ax(az),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},ap'TextButton'{Size=UDim2.new(1,0,0,24),[at'InputBegan']=function
(aF)if aF.UserInputType~=Enum.UserInputType.MouseButton1 then return end Y:set(true)local aG aG=aF.Changed:Connect(
function()if aF.UserInputState==Enum.UserInputState.End or aF.UserInputState.Cancel then Y:set(false)aG:Disconnect()end
end)end,[av]=X,[aq]={ap'UIGradient'{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),
ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=au(function()return
UDim2.fromScale(1-ax(az),0.5)end)}}},ap'ImageButton'{Visible=not ax(I),ZIndex=2,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=Enum.ScaleType.Crop,[at'InputBegan']=function(aF)if
aF.UserInputType~=Enum.UserInputType.MouseButton1 then return end _:set(true)local aG aG=aF.Changed:Connect(function()if
aF.UserInputState==Enum.UserInputState.End or aF.UserInputState.Cancel then _:set(false)aG:Disconnect()end end)end,[av]=
Z,[aq]={ap'Frame'{Size=UDim2.fromScale(1,1),[aq]={ap'UIGradient'{Color=au(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,ax(L)),ColorSequenceKeypoint.new(1,ax(L))}end),Transparency=au(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'Frame'{AnchorPoint=Vector2
.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position=au(function()return UDim2.fromScale(ax(M
),0.5)end)}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[aq]={j(n.LayoutOrder,o.Horizontal,p.Left,q.
Center,UDim.new(0,4)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='RGB:',TextColor3=
ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=c('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.
TextXAlignment.Right},ap'TextBox'{Name=d(8),BackgroundTransparency=1,Size=UDim2.new(0,42,0,16),PlaceholderText='RGB',
PlaceholderColor3=ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,Text=au(function()local aF={ax(L).R,ax(
L).G,ax(L).B}for aG,aH in aF do aF[aG]=math.floor(math.clamp(aH*255,0,255))end return table.concat(aF,', ')end),
TextScaled=true,FontFace=c('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.
Right,[av]=T,[at'Changed']=function(aF)local aG=ax(T)if aF=='TextBounds'and aG and aG.TextBounds then U:set(aG.
TextBounds.X)end end,[at'FocusLost']=function()local aF=ax(T)local aG,aH=aF.Text:gsub(' ',''),{ax(L).R,ax(L).G,ax(L).B}
for aI,aJ in aH do aH[aI]=math.floor(math.clamp(aJ*255,0,255))end local aK,aL,aM=table.concat(aH,', '),pcall(function()
local aK=string.split(aG,',')table.foreach(aK,function(aL,aM)if not tonumber(aM)then return nil end aK[aL]=math.clamp(aM
,0,255)end)return Color3.fromRGB(aK[1],aK[2],aK[3])end)if aL and aM then L:set(aM)az:set(({ax(L):ToHSV()})[1])aA:set(({
ax(L):ToHSV()})[2])aB:set(({ax(L):ToHSV()})[3])else aF.Text=aK end end,[aq]={l(1,16),ap'UISizeConstraint'{MaxSize=
Vector2.new(110,16),MinSize=Vector2.new(42,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=ai.text2,
Position=UDim2.fromScale(1,1),Size=ay(function()return UDim2.fromOffset(math.clamp(ax(U),0,110),2)end,40,1),[aq]={m(0,1)
}}}}}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[aq]={j(n.LayoutOrder,o.Horizontal,p.Left,q.Center,
UDim.new(0,5)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,Text='HSV:',TextColor3=ai.
text2,BackgroundTransparency=1,TextSize=16,FontFace=c('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.
TextXAlignment.Right},ap'TextBox'{Name=d(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),AutomaticSize=Enum.
AutomaticSize.X,PlaceholderText='HSV',PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=au(function()local aF={ax(L):
ToHSV()}for aG,aH in aF do aF[aG]=math.floor(aH*100)/100 end return table.concat(aF,', ')end),TextScaled=true,FontFace=
c('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[av]=R,[at'Changed']
=function(aF)local aG=ax(R)if aF=='TextBounds'and aG and aG.TextBounds then S:set(aG.TextBounds.X)end end,[at'FocusLost'
]=function()local aF=ax(R)local aG,aH=aF.Text:gsub(' ',''),{ax(L):ToHSV()}for aI,aJ in aH do aH[aI]=math.floor(aJ*100)/
100 end local aK,aL,aM=table.concat(aH,', '),pcall(function()local aK=string.split(aG,',')table.foreach(aK,function(aL,
aM)if not tonumber(aM)then return nil end end)return Color3.fromHSV(unpack(aK))end)if aL and aM then L:set(aM)az:set(({
ax(L):ToHSV()})[1])aA:set(({ax(L):ToHSV()})[2])aB:set(({ax(L):ToHSV()})[3])else aF.Text=aK end end,[aq]={l(1,16),ap
'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=ay(function()return UDim2.fromOffset(math.clamp(ax(S),36,
110),2)end,40,1),[aq]={m(0,1)}}}}}}}}}end as(C):onChange(function()if not ax(C)and typeof(aC)=='Instance'then aC:
Destroy()end end)ap'Frame'{Interactable=au(function()if not ax(C)then return false end return ax(N)end),Visible=au(
function()if ax(u.string)~=''and not string.find(ax(A):lower(),ax(u.string):lower())or not ax(H)then return false end
return true end),Parent=z,Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,BackgroundColor3=ai.background2,[aq]={m(6),
ap'Frame'{ZIndex=3,Visible=au(function()if not ax(C)then return true end return false end),BackgroundTransparency=ay(
function()return ax(N)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={m(6)
,ap'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=O},ap'TextLabel'{FontFace=c(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=O,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=D,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,[aq]={k(0,5)}}}},ap'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[aq
]={j(n.LayoutOrder,o.Horizontal,p.Left,q.Bottom,UDim.new(0,3)),ap'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.
background2,BackgroundTransparency=O,[aq]={k(9,8),m(6),j(n.LayoutOrder,o.Horizontal,p.Left,q.Top),ap'TextLabel'{FontFace
=c('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=
true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=A,TextTransparency=O,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}},ap'TextButton'{Interactable=au(function()if not ax(C)then return false end return
ax(N)end),Size=UDim2.new(0,100,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=O,[at'Activated']=function()
if typeof(ax(x.module))=='Instance'then ax(x.module):Destroy()end aC,aD=ac(ab.Parent.module)(aE())x:update('module',aC)
end,[aq]={k(0,8),m(6),j(n.LayoutOrder,o.Horizontal,p.Right,q.Center,UDim.new(0,5)),ap'Frame'{Size=UDim2.new(1,-29,0,36),
BackgroundTransparency=1,[aq]={j(n.LayoutOrder,o.Horizontal,p.Right,q.Center,UDim.new(0,4)),ap'TextBox'{Interactable=au(
function()if not ax(C)then return false end return ax(N)end),Name=d(8),BackgroundTransparency=1,Size=UDim2.new(1,0,0,16)
,PlaceholderText='Hex',PlaceholderColor3=ai.text2,TextColor3=ai.text,TextTransparency=O,Text=au(function()return'#'..ax(
L):ToHex()end),TextScaled=true,FontFace=c('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.
TextXAlignment.Right,[at'Changed']=function(aF)local aG=ax(P)if aF=='TextBounds'and aG and aG.TextBounds then Q:set(aG.
TextBounds.X)end end,[at'FocusLost']=function()local aF=ax(P)local aG=aF.Text:gsub('[^%w#]','')if not string.find(aG,'#'
)then aG='#'..aG end if string.len(aG)~=7 then aF.Text='#'..ax(L):ToHex()else local aH,aI=pcall(function()return Color3.
fromHex(aG)end)if aH then L:set(aI)else aF.Text='#'..ax(L):ToHex()end end end,[av]=P,[aq]={l(1,16),ap'Frame'{AnchorPoint
=Vector2.new(1,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=ay(function()if ax(N)then return 0.5 end return 1
end,40,1),Position=UDim2.fromScale(1,1),Size=ay(function()return UDim2.fromOffset(math.clamp(ax(Q),0,98),2)end,40,1),[aq
]={m(0,1)}}}}}},ap'ImageLabel'{Size=UDim2.fromOffset(24,24),Image=aj.paint,ImageColor3=L,BackgroundTransparency=1,
ImageTransparency=ay(function()return not ax(N)and 1 or ax(M)end,40,1),[aq]={m(6)}}}}}}}}e.add(am.Heartbeat:Connect(
function()if ax(W)then local aF=ax(V)local aG=an:GetMouseLocation()-aF.AbsolutePosition-Vector2.new(0,ax(w.number))aG=
Vector2.new(math.clamp(aG.X,0,aF.AbsoluteSize.X),math.clamp(aG.Y,0,aF.AbsoluteSize.Y))aA:set(aG.X/aF.AbsoluteSize.X)aB:
set((aF.AbsoluteSize.Y-aG.Y)/aF.AbsoluteSize.Y)L:set(Color3.fromHSV(ax(az),ax(aA),ax(aB)))end if ax(Y)then local aF=ax(X
)local aG=an:GetMouseLocation()-aF.AbsolutePosition-Vector2.new(0,ax(w.number))aG=Vector2.new(math.clamp(aG.X,0,aF.
AbsoluteSize.X),0)az:set((aF.AbsoluteSize.X-aG.X)/aF.AbsoluteSize.X)L:set(Color3.fromHSV(ax(az),ax(aA),ax(aB)))end if
ax(_)then local aF=ax(Z)local aG=an:GetMouseLocation()-aF.AbsolutePosition-Vector2.new(0,ax(w.number))aG=Vector2.new(
math.clamp(aG.X,0,aF.AbsoluteSize.X),0)M:set(aG.X/aF.AbsoluteSize.X)end end))if ax(v.boolean)and not ax(F)then as(K.file
):onChange(function()local aF,aG,aH=ax(K.file),true,true if aF.color~=nil then local aI=string.split(aF.color:gsub(' ',
''),',')table.foreach(aI,function(aJ,aK)aI[aJ]=tonumber(aK)end)L:set(Color3.new(unpack(aI)))aG=false end if aF.
transparency~=nil then M:set(tonumber(aF.transparency))aH=false end if aG then L:set(ax(E))end if aH then M:set(ax(G))
end az:set(({ax(L):ToHSV()})[1])aA:set(({ax(L):ToHSV()})[2])aB:set(({ax(L):ToHSV()})[3])end)if K.private then L:set(ax(E
))M:set(ax(G))end else L:set(ax(E))M:set(ax(G))end az:set(({ax(L):ToHSV()})[1])aA:set(({ax(L):ToHSV()})[2])aB:set(({ax(L
):ToHSV()})[3])local aF={}function aF.SetName(aG,aH)local aI,aJ=b({SetName=aH},{SetName=''})assert(aI,table.concat(aJ,
'\n'))A:set(aH)end function aF.SetColor(aG,aH)local aI,aJ=b({SetColor=aH},{SetColor=Color3.new()})assert(aI,table.
concat(aJ,'\n'))L:set(aH)az:set(({ax(L):ToHSV()})[1])aA:set(({ax(L):ToHSV()})[2])aB:set(({ax(L):ToHSV()})[3])end
function aF.SetTransparency(aG,aH)local aI,aJ=b({SetTransparency=aH},{SetTransparency=0})assert(aI,table.concat(aJ,'\n')
)M:set(aH)end function aF.Enable(aG)C:set(true)end function aF.Disable(aG)C:set(false)end function aF.Visible(aG)H:set(
true)end function aF.Invisible(aG)H:set(false)end return aF end end)()end,[15]=function()local aa,ab,ac=a(15)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.
themeSystem,ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,aq,ar,as,at=
ao.get,ao.animate,ah.find'selectedTab',ah.add(af),af.Parent local au=am(ap(ar.string)==ap(as.tab).uid)an(ar.string):
onChange(function()au:set(ap(ar.string)==ap(as.tab).uid)end)local av=aq(function()return ap(au)and 0 or 1 end,40,1)ak
'Frame'{Parent=at,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=av}}}end end)()
end,[16]=function()local aa,ab,ac=a(16)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,ar,as,at=
al.New,al.Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.
animate,at.typecheck,at.customFont,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH=ay.UIListLayout,ay.UIPadding,ay
.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name='',DisabledText=
'',FLAG='',Visible=false,IsEnabled=false,Callback=function()end,Items={},Multiselect=true,Regex=function()end,
IgnoreConfig=true,Alphabetical=true,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.
Visible and''or'Visible',af.IsEnabled and''or'IsEnabled',af.Multiselect and''or'Multiselect',af.Regex and''or'Regex',af.
IgnoreConfig and''or'IgnoreConfig',af.Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})assert(aG,
table.concat(aH,'\n'))aG,aH=aw(af,{Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aG,table.
concat(aH,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string','The Regex function must always return a string')
end local aI,aJ,aK,aL,aM,b,c,d,e,i,j,k,l,m,n,o,p=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),
af.Parent,af.Name,af.Callback,ao{},af.Multiselect or ao(false),af.Default,af.Visible or ao(true),af.IgnoreConfig or ao(
false),af.IsEnabled or ao(true),af.Alphabetical or ao(false),af.AlwaysOpen or ao(false),af.DisabledText or ao
'Component Disabled',af.Regex or ao(function(aI)return aI end)local q,r=(af.FLAG or ao(aL.uid))if au(q)~=''then r=ak.
register(au(q),{items=ao{},item=ao'',multiselect=au(e)},'dropdown',au(q)==aL.uid)r.user.Value=au(e)and au(r.status.items
)or au(r.status.item)end local s,t,u,v,w,x=ao(),ao(false),ao(au(e)and{}or''),ao{},{},ao(false)ap(r.status.items):
onChange(function()if#au(r.status.items)==#au(d)then x:set(true)else x:set(false)end local y={}for z,A in au(r.status.
items)do table.insert(y,au(p)(A))end task.wait()task.spawn(au(c),y)u:set(au(r.status.items))end)ap(r.status.item):
onChange(function()task.wait()task.spawn(au(c),au(p)(au(r.status.item)))u:set(au(p)(au(r.status.item)))end)local y=ao(
au(aI.string)==au(aL.tab).uid)ap(aI.string):onChange(function()y:set(au(aI.string)==au(aL.tab).uid)end)local z=av(
function()return au(y)and 0 or 1 end,40,1)am'Frame'{Parent=aM,Visible=ar(function()if au(aK.string)~=''and not string.
find(au(b):lower(),au(aK.string):lower())or not au(j)then return false end return true end),Size=av(function()if au(t)
then return UDim2.new(1,0,0,76+(au(e)and(36)or 6)+math.clamp((#au(d)*34),34,136))end return UDim2.new(1,0,0,36)end,40,1)
,BackgroundColor3=ai.background2,BackgroundTransparency=z,ClipsDescendants=true,[an]={aB(6),az(aC.LayoutOrder,aD.
Vertical,aE.Left,aF.Top,UDim.new(0,4)),am'TextButton'{Interactable=ar(function()if not au(l)then return false end return
au(y)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[aq'Activated']=function()if au(n)then return end t:set(not
au(t))end,[an]={am'Frame'{ZIndex=2,Visible=ar(function()if not au(l)then return true end return false end),
BackgroundTransparency=av(function()return au(y)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2
.fromScale(1,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.
new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=z},am'TextLabel'{
FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.
disabledText,TextTransparency=z,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ar(
function()return au(o)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aA(0,5)}}}},am'Frame'{Size=UDim2.
fromScale(1,1),BackgroundTransparency=1,[an]={aA(8),am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=
UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(e)then return au(b)..' '..tostring(#au(r.status.items))..'/'..
tostring(#au(d))end if typeof(au(u))=='table'then return au(b)end if w[au(u)]then return`{au(b)}: {w[au(u)]}`end return`{
au(b)}: {au(u)}`end),TextTransparency=z,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am'ImageLabel'{Size=UDim2
.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=ar(
function()return au(e)and aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.text2,ImageTransparency=z}}}}},am
'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,[an]={aA(0,6),am'TextBox'{Size=UDim2.fromScale(1,1),
BackgroundColor3=ai.background,BackgroundTransparency=z,FontFace=ax('Montserrat',Enum.FontWeight.Bold),TextXAlignment=
Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',TextColor3=ai.text,
TextTransparency=z,[as]=s,[aq'Changed']=function(A)local B=au(s)if A=='Text'and B and B.Text then local C=B.Text for D,E
in au(v)do if string.find(au(p)(E.Name):lower(),C:lower())or C==''then E.Visible=true else E.Visible=false end end end
end,[an]={am'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},aB(4),aA(6,6,6,6)}}}},am'Frame'{Size=UDim2.new(1,0,0,32
),BackgroundTransparency=1,Visible=e,[an]={aA(6,6,0,6),am'TextButton'{Interactable=e,Size=UDim2.new(1,0,0,24),
BackgroundTransparency=z,BackgroundColor3=ai.background,[aq'Activated']=function()local A={}if not au(x)then for B,C in
au(d)do C=typeof(C)=='table'and C.Value or C table.insert(A,au(p)(C))end end r.status.items:set(A)end,[an]={aB(4),aA(8),
am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if
au(x)then return'Deselect All'end return'Select All'end),TextTransparency=z,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=ar(function()return UDim2.new(1,-6,0,math.clamp((#au(d)*34),34,136))
end),BackgroundTransparency=1,ScrollBarThickness=ar(function()return#au(d)>4 and 6 or 0 end),ScrollBarImageColor3=ai.
scrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aA(6,ar(function()return#au(d)>4
and UDim.new(0,12)or UDim.new(0,0)end),0,6),az(au(m)and aC.Name or aC.LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(
0,6)),v}}}}ap(d):onChange(function()local A={}for B,C in au(d)do local D,E,F,G=(ao(false))if typeof(C)=='table'then
local H,I=aw(C,{DisplayValue='',Value='',Image=''},{C.Image and''or'Image',C.DisplayValue and''or'DisplayValue'})assert(
H,table.concat(I,'\n'))E=C.Value F=C.Image or nil G=C.DisplayValue or nil else local H,I=aw({Item=C},{Item=''})assert(H,
table.concat(I,'\n'))E=C end local H=au(p)(E)if G then w[E]=G end ap(r.status.items):onChange(function()if table.find(
au(r.status.items),H)then D:set(true)else D:set(false)end end)ap(r.status.item):onChange(function()if au(r.status.item)
==H then D:set(true)else D:set(false)end end)local I=am'TextButton'{Name=`{G~=nil and G or E}`,Size=UDim2.new(1,0,0,28),
BackgroundTransparency=z,BackgroundColor3=ai.background,[aq'Activated']=function()if au(e)then local I=au(r.status.items
)D:set(not au(D))if au(D)then table.insert(I,H)else table.remove(I,table.find(I,H))end r.status.items:set(I)else r.
status.item:set(H)if au(n)then return end t:set(false)end end,[an]={aB(4),aA(8),az(aC.LayoutOrder,aD.Horizontal,aE.Left,
aF.Center,UDim.new(0,6)),am'Frame'{Visible=ar(function()return au(e)and true or false end),Size=UDim2.fromOffset(20,20),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=z,BackgroundColor3=av(function()
return au(D)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,
ImageTransparency=av(function()if not au(y)then return 1 end if au(D)then return 0 end return 1 end,40,1),ImageColor3=ai
.selectedTab}}},am'ImageLabel'{Visible=ar(function()return F and true or false end),Size=UDim2.fromOffset(18,18),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=F,ImageTransparency=z,
ImageColor3=ai.text2},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=ar(function()return au(e)and
UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=G or E,TextTransparency=z,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true}}}table.insert(A,I)end v:set(A)end)d:set(au(af.Items))if au(n)then t:set(true)end if
au(aJ.boolean)and not au(k)then ap(r.file):onChange(function()local A,B=au(r.file),true if A~=nil then B=false end if
au(e)then r.status.items:set(A)else r.status.item:set(A)end if B then if au(e)then if i and#au(i)>0 then r.status.items:
set(au(i))end else if i then r.status.item:set(au(i))end end end end)if r.private then if au(e)then if i and#au(i)>0
then r.status.items:set(au(i))end else if i then for A,B in au(d)do if typeof(B)=='table'and B.Value==au(i)then r.status
.item:set(au(i))elseif B==au(i)then r.status.item:set(au(i))end end end end end else if au(e)then if i and#au(i)>0 then
r.status.items:set(au(i))end else if i then r.status.item:set(au(i))end end end local A={}function A.SetName(B,C)local D
,E=aw({SetName=C},{SetName=''})assert(D,table.concat(E,'\n'))b:set(C)end function A.SetItems(B,C)local D,E=aw({SetItems=
C},{SetItems={}})assert(D,table.concat(E,'\n'))d:set(C)local F,G={},false for H,I in au(d)do local J if typeof(I)==
'table'then J=I.Value else J=I end local K=au(p)(J)if au(e)then if typeof(au(u))=='table'and table.find(au(u),K)then
table.insert(F,K)G=true end else if au(u)==K then G=true r.status.item:set(K)break end end end if G then if au(e)then r.
status.items:set(F)end else if au(e)then r.status.items:set{}else r.status.item:set''end end end function A.SelectItem(B
,C)assert(not au(e),':SelectItem requires Multiselect to be false')local D,E=aw({SelectItem=C},{SelectItem=''})assert(D,
table.concat(E,'\n'))local F=false for G,H in au(d)do local I=H if typeof(H)=='table'then I=H.Value end local J=au(p)(C)
if au(p)(I)==J then F=true break end end assert(F,":SelectItem couldn't find "..C)r.status.item:set(C)end function A.
SelectItems(B,C)assert(au(e),':SelectItems requires Multiselect to be true')local D,E=aw({SelectItems=C},{SelectItems={}
})assert(D,table.concat(E,'\n'))for F,G in C do local H=false for I,J in au(d)do local K=typeof(J)=='table'and au(p)(J.
Value)or au(p)(J)if G==K then H=true break end end if H then C[F]=au(p)(G)else table.remove(C,F)end end r.status.items:
set(C)end function A.Enable(B)l:set(true)end function A.Disable(B)l:set(false)end function A.Visible(B)j:set(true)end
function A.Invisible(B)j:set(false)end return A end end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.
themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an
.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au
.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,b
=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(af,{Name='',DisabledText='',FLAG='',Visible=false,
IsEnabled=false,Callback=function()end,Bind=Enum.KeyCode.Q,IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.
FLAG and''or'FLAG',af.Visible and''or'Visible',af.IsEnabled and''or'IsEnabled',af.Bind and''or'Bind',af.IgnoreConfig and
''or'IgnoreConfig'})assert(aM,table.concat(b,'\n'))local c,d,e,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w=ah.find'selectedTab',ah.
find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'isMobile',ah.find'instanceName',ah.find'isListening',
ah.find'bindData',ah.add(af),af.Parent,af.Name,af.Callback,af.Bind,af.Visible or aq(true),af.IsEnabled or aq(true),af.
DisabledText or aq'Component Disabled',af.IgnoreConfig or aq(false),aq()local function x(y:EnumItem,z:string)local A,B=
av(d.binds),av(m.bindData)if table.find(A,y)then aL(('Key %s is already in use. %s'):format(y.Name,z))else table.insert(
A,y)if av(w)then table.remove(A,table.find(A,av(w)))B[av(w).Name]=nil end w:set(y)B[av(w).Name]={bind=av(w),name=av(p)}m
:update('bindData',B)d:update('binds',A)end end local y,z=(af.FLAG or aq(n.uid))if av(y)~=''then z=ak.register(av(y),{
coordinate=aq(Vector2.new(0,0)),keycode=aq(nil),mobile=av(j.boolean)},'keybind',av(y)==n.uid)z.user.Value=av(j.boolean)
and av(z.status.coordinate)or av(z.status.keycode)end ar(z.status.keycode):onChange(function()if av(w)and av(w).Name==
av(z.status.keycode)then return end local A,B=pcall(function()return Enum.KeyCode[av(z.status.keycode)]end)if A then x(B
,'RAHHH')end end)ar(w):onChange(function()z.status.keycode:set(av(w).Name)end)local A=aq(av(c.string)==av(n.tab).uid)ar(
c.string):onChange(function()A:set(av(c.string)==av(n.tab).uid)end)local B,C=aw(function()return av(A)and 0 or 1 end,40,
1),aq(false)local D=am.InputBegan:Connect(function(D,E)if av(j.boolean)then return end if av(C)then if D.KeyCode and D.
KeyCode~=Enum.KeyCode.Unknown then x(D.KeyCode,'From input box')end C:set(false)task.wait()l:update('boolean',false)else
if D.KeyCode and D.KeyCode==av(w)and not E and not av(l.boolean)and av(t)then task.spawn(av(q))end end end)ay.add(D)
local E=aq(false)local function F(G)for H,I in Enum.KeyCode do if I.Name and I.Name==G then return I end end return nil
end local G,H H=ao'TextButton'{Visible=at(function()if not av(t)then return av(t)end return av(E)end),Parent=aA.get(av(k
.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,
Text=p,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if G then G:Disconnect(
)G=nil z.status.coordinate:set(H.AbsolutePosition)else task.spawn(av(q))end end,[ap]={aD(4),aE(16),aF(0,16),ao
'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),
BackgroundTransparency=1,Image=av(j.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=o,Visible=at(function()if av(i.string)~=''and not string.find(av(p):lower(),av(
i.string):lower())or not av(s)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[
ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(t)then return true end return false end),BackgroundTransparency=
aw(function()return av(A)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={
aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=B},ao'TextLabel'{FontFace=az(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=B,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()
return av(u)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=at(function()if not av(t)then return false end return av(A)end),Size=UDim2.new(0.225,0,1,0
),BackgroundColor3=ai.background2,BackgroundTransparency=B,[as'Activated']=function()if av(j.boolean)then E:set(true)G=
aB(H,15)return end C:set(true)l:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.
Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(j.boolean)
and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=B},ao'TextLabel'{Visible=not av(j.boolean),Size=UDim2
.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=B,Text=at(function()return av(C)and'Listening'or av(w)
and av(w).Name or'Waiting'end)},ao'TextLabel'{Visible=av(j.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return av(E)and'Move Bind'or'Place Bind'end),TextTransparency=B}}},ao'TextButton'{Visible=E,
Interactable=at(function()if not av(t)then return false end return av(A)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=B,[as'Activated']=function()E:set(false)H.Position=UDim2.
fromScale(0.5,0.5)z.status.coordinate:set(H.AbsolutePosition)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=
ai.red,ImageTransparency=B}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(E)and-42 or-3,0,36)end),
BackgroundColor3=ai.background2,BackgroundTransparency=B,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=p,TextTransparency=B,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(e.boolean)and not av(v)then ar(z.file):onChange(function()local I,J
=av(z.file),true if I.keycode~=nil then z.status.keycode:set(I.keycode)J=false end if J then if r then z.status.keycode:
set(av(r).Name)end end end)if z.private then if r then z.status.keycode:set(av(r).Name)end end else if r then z.status.
keycode:set(av(r).Name)end end local I={}function I.SetName(J,K)local L,M=ax({SetName=K},{SetName=''})assert(L,table.
concat(M,'\n'))p:set(K)end function I.SetBind(J,K:EnumItem)local L,M=ax({SetBind=K},{SetBind=Enum.keyCode.C})assert(L,
table.concat(M,'\n'))x(K,'At :SetBind')end function I.Enable(J)t:set(true)end function I.Disable(J)t:set(false)end
function I.Visible(J)s:set(true)end function I.Invisible(J)s:set(false)end return I end end)()end,[18]=function()local
aa,ab,ac=a(18)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,
ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Computed,ak
.Observer,ak.OnEvent,ac(ae.simpleElements)local as,at,au,av,aw,ax,ay,az,aA=ar.UICorner,ar.UIPadding,ar.
UITextSizeConstraint,ar.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,
ac(ae.utilities)local aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM=aA.get,aA.animate,aA.getStringBounds,aA.customFont,ah.find
'selectedTab',ah.find'searchText',ah.find'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an'Active Keybinds',an''
local b=an(aB(aF.string)==aB(aJ.tab).uid)ap(aF.string):onChange(function()b:set(aB(aF.string)==aB(aJ.tab).uid)end)local
c,d=aC(function()return aB(b)and 0 or 1 end,40,1),an(0)task.spawn(function()d:set(aD(aB(aM),{Font=aE('Montserrat',Enum.
FontWeight.Medium),Size=16,Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end)aB(aK).Changed:Connect(function(e)if e:lower(
)=='absolutesize'then d:set(aD(aB(aM),{Font=aE('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aB(aK).
AbsoluteSize.X)}).Y)end end)ap(aM):onChange(function()d:set(aD(aB(aM),{Font=aE('Montserrat',Enum.FontWeight.Bold),Size=
16,Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end)local function e(i)local j={}table.foreach(i,function(k,l)j[k]=l.Name
end)return table.concat(j,', ')end local i,j,k=(an'Active Keybinds')k,j=ac(ab.Parent.module){Name=i,Children={}}
local function l(m)local n,o={av(aw.LayoutOrder,ax.Vertical,ay.Center,az.Top,UDim.new(0,5))},aB(aI.bindData)for p,q in
aB(aH.binds)do local r=o[q.Name]table.insert(n,al'TextLabel'{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=ai.text,FontFace=aE('Montserrat',Enum.FontWeight.Regular),TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,Text=ao(function()if r.boolean then return`[{r.bind.Name}] {r.name} (<i>{string.upper(tostring(aB(r.boolean)))}</i>)`
end return`[{r.bind.Name}] {r.name}`end)})end j(n)end al'TextButton'{Visible=ao(function()if aB(aG.string)~=''and not
string.find(aB(aL):lower(),aB(aG.string):lower())and not string.find(aB(aM):lower(),aB(aG.string):lower())then return
false end return true end),BackgroundColor3=ai.background2,Parent=aK,BackgroundTransparency=c,Size=ao(function()return
UDim2.new(1,0,0,36+aB(d))end),AutomaticSize=Enum.AutomaticSize.Y,[aq'Activated']=function()if typeof(k)=='Instance'then
k:Destroy()k=nil end k,j=ac(ab.Parent.module){Name=i,Children={}}l(aB(aH.binds))end,[am]={as(6),at(6),al'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.text2,ImageTransparency=c
},al'TextLabel'{Name='Title',RichText=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.fromOffset(25,0),
BackgroundTransparency=1,TextTransparency=c,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Top,TextScaled=true,TextSize=18,FontFace=aE('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aL,[am]={au(1,18)
}},al'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,25),BackgroundTransparency=1,
TextTransparency=c,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=16,FontFace=
aE('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,Text=aM,Size=ao(function()return UDim2.new(1,-4,0,aB(d))end)
}}}ap(aH.binds):onChange(function()l(aB(aH.binds))end)l(aB(aH.binds))aM:set(e(aB(aH.binds)))ap(aH.binds):onChange(
function()aM:set(e(aB(aH.binds)))end)end end)()end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local
ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,
al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as=ap.UICorner,ap.
UIPadding,ac(ae.utilities)local at,au,av,aw=as.get,as.typecheck,as.animate,as.customFont local ax,ay=au(af,{Text='',
Visible=false},{af.Visible and''or'Visible'})assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,aD,aE=ah.find
'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Text,af.Visible or am(true)local aF=am(at(az.string)==at(aB.
tab).uid)ao(az.string):onChange(function()aF:set(at(az.string)==at(aB.tab).uid)end)local aG=av(function()return at(aF)
and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if at(aA.string)~=''and not string.find(at(aD):lower(),at(aA.string):
lower())or not at(aE)then return false end return true end),Size=UDim2.new(1,0,0,36),Parent=aC,BackgroundTransparency=aG
,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),
RichText=true,TextScaled=true,BackgroundTransparency=1,TextTransparency=aG,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0
,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()
return at(aD)end),[al]={ak'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=18}}}}}local aH={}function aH.SetText(aI,aJ)
local aK,aL=au({SetText=aJ},{SetText=''})assert(aK,table.concat(aL,'\n'))aD:set(aJ)end function aH.Visible(aI)aE:set(
true)end function aH.Invisible(aI)aE:set(false)end return aH end end)()end,[20]=function()local aa,ab,ac=a(20)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed
,ac(ae.utilities)local as,at,au,av,aw,ax,ay,az=ar.get,ar.animate,ar.typecheck,ar.customFont,ar.drag,ar.references,ar.
connections,ac(ae.simpleElements)local aA,aB,aC,aD,aE,aF,aG,aH,aI=az.UIListLayout,az.UIPadding,az.UICorner,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,au(af,{Name={},Children={}},{})assert(aH,
table.concat(aI,'\n'))local aJ,aK,aL,aM=ah.find'instanceName',ah.find'absoluteOffset',af.Name,an(af.Children)local b,c,d
=ax.get(as(aJ.name)),(an(false))d=al'TextButton'{Parent=b,Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10+
as(aK.number)),BackgroundTransparency=1,[ap'MouseButton1Down']=function()c:set(true)end,[am]={al'Frame'{Position=UDim2.
new(0.5,-120,0,0),Size=UDim2.fromOffset(240,0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={
aC(4),aB(8),al'TextButton'{AnchorPoint=Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),
BackgroundColor3=ai.selectedTab,[ap'Activated']=function()d:Destroy()end,[am]={aC(6),al'ImageLabel'{AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,
ImageColor3=ai.red,ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,[am]={aA(aD.LayoutOrder,aE.Vertical,aF.Center,aG.Top,UDim.new(0,8)),al'Frame'{Size=at(function()return
as(c)and UDim2.new(0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=at(
function()return as(c)and 0 or 0.5 end,40,1),[am]={aC(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=av(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=aL,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true},al'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=
Enum.AutomaticSize.Y,[am]=aM}}}}}}}}}local e,i=aw(d,15)local j=i:Connect(function()c:set(false)end)ay.add(e)ay.add(j)d.
Destroying:Once(function()e:Disconnect()j:Disconnect()end)return d,function(...)aM:set(...)end end end)()end,[21]=
function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,
ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.
simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UICorner,au.UIPadding,au.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title='',Body='',Duration=1,Image='',ImageColor=
Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'
})assert(aC,table.concat(aD,'\n'))local aE,aF,aG,aH,aI,aJ,aK,aL,aM,b,c=am(af.Title),am(af.Body),am(af.Duration),am(af.
Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250)
local d=am(ar(ap(aF),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=ap(c)-8-(aH and 32 or 0)}))local e=am(
20+math.clamp(ap(d).Y+4+10+(#ap(aJ)>0 and 26 or 0),#ap(aJ)>0 and 56 or 30,9e9))local function i(j,k)local l=1 for m=1,j
do l=l*10 end local m=tostring(math.round(k*l)/l)local n=string.split(m,'.')if#n==1 then local o=''for p=1,j do o=o..'0'
end m=m..'.'..o end return m end local j,k={}for l,m in ap(aJ)do local n,o=at({Button=m},{Button={}})assert(n,table.
concat(o,'\n'))n,o=at(m,{Name='',Callback=function()end})assert(n,table.concat(o,'\n'))local p,q=m.Name,m.Callback local
r=aj'TextButton'{Size=UDim2.new(1/#ap(aJ),-2,1,-4),TextSize=14,Text=p,FontFace=as('Montserrat',Enum.FontWeight.Bold),
BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(q)aL:set(false)task.wait(
0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)k:Destroy()end,[al]={av(4)}}table.insert(j,r)end k
=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(c),ap(aK)and ap(e)+5
or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(aM)end),Interactable=aL,
AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.fromOffset(ap(c),ap(e)),[
ak'Activated']=function()aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)k:
Destroy()end},aj'Frame'{AnchorPoint=Vector2.new(0,1),BackgroundColor3=ah.background,Size=UDim2.fromOffset(ap(c),ap(e)),
Position=aq(function()return UDim2.fromScale(ap(aL)and 0 or 1.2,1)end,30,1),[al]={aw(0,4),ax(ay.LayoutOrder,az.
Horizontal,aA.Left,aB.Center,UDim.new(0,4)),av(4),aj'Frame'{Visible=ap(aH)~=''and true or false,Size=UDim2.new(0,24,1,0)
,BackgroundTransparency=1,[al]={aj'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,Image=aH,ImageColor3=aI}}},aj'Frame'{Size=UDim2.new(1,ap(aH)~=''and-28
or 0,1,0),BackgroundTransparency=1,[al]={aw(2,0),ax(ay.LayoutOrder,az.Vertical,aA.Left,aB.Top),aj'TextLabel'{Size=UDim2.
new(1,0,0,16),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Bold),TextXAlignment=Enum.TextXAlignment
.Left,TextSize=16,RichText=true,TextColor3=ah.text,Text=aE},aj'TextLabel'{Size=UDim2.new(1,0,0,1),AutomaticSize=Enum.
AutomaticSize.Y,Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,FontFace=as('Montserrat',Enum.FontWeight.Medium
),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,RichText=
true,TextColor3=ah.text2,Text=aF},aj'Frame'{Visible=an(function()return#ap(aJ)>0 and true or false end),Size=UDim2.new(1
,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,UDim.new(0,2)),j}},aj
'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=b,TextColor3=ah.text,TextSize
=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()aL:set(true)end)
task.spawn(function()repeat task.wait()until ap(aL)local n,o=(tick())repeat o=tick()-n b:set(i(1,math.clamp(o,0,ap(aG)))
)task.wait()until o>ap(aG)end)task.spawn(function()aK:set(true)repeat task.wait()until ap(aL)task.wait(ap(aG))task.wait(
0.2)aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)k:Destroy()end)end end
)()end,[22]=function()local aa,ab,ac=a(22)local ad return(function(...)local ae=ab.Parent.Parent return function(af)
local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.
Value,aj.Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as,at=ap.UICorner,ap.UIPadding,ap.UITextSizeConstraint,
ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.getStringBounds,at.customFont,at.typecheck local az,aA=ay(af,{
Title='',Visible=false,Body=''},{af.Visible and''or'Visible'})assert(az,table.concat(aA,'\n'))local aB,aC,aD,aE,aF,aG,aH
=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Title,af.Body,af.Visible or am(true)local aI=am(au(aB.
string)==au(aD.tab).uid)ao(aB.string):onChange(function()aI:set(au(aB.string)==au(aD.tab).uid)end)local aJ,aK=av(
function()return au(aI)and 0 or 1 end,40,1),am(0)task.spawn(function()aK:set(aw(au(aG),{Font=ax('Montserrat',Enum.
FontWeight.Medium),Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)au(aE).Changed:Connect(function(aL)if aL:
lower()=='absolutesize'then aK:set(aw(au(aG),{Font=ax('Montserrat',Enum.FontWeight.Medium),Size=12,Width=math.round(au(
aE).AbsoluteSize.X)}).Y)end end)ao(aG):onChange(function()aK:set(aw(au(aG),{Font=ax('Montserrat',Enum.FontWeight.Bold),
Size=12,Width=math.round(au(aE).AbsoluteSize.X)}).Y)end)ak'Frame'{Visible=an(function()if au(aC.string)~=''and not
string.find(au(aF):lower(),au(aC.string):lower())and not string.find(au(aG):lower(),au(aC.string):lower())or not au(aH)
then return false end return true end),BackgroundColor3=ai.background2,Parent=aE,BackgroundTransparency=aJ,Size=an(
function()return UDim2.new(1,0,0,36+au(aK))end),AutomaticSize=Enum.AutomaticSize.Y,[al]={aq(6),ar(6),ak'TextLabel'{Name=
'Title',RichText=true,Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextTransparency=aJ,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=ax('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,Text=aF,[al]={as(1,18)}},ak'TextLabel'{Name='Body',TextWrapped=true,RichText=true,
Position=UDim2.fromOffset(4,20),BackgroundTransparency=1,TextTransparency=aJ,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,FontFace=ax('Montserrat',Enum.FontWeight.Medium),TextColor3=ai.text2,
Text=aG,Size=an(function()return UDim2.new(1,-4,0,au(aK))end)}}}local aL={}function aL.SetBody(aM,b)local c,d=ay({
SetBody=b},{SetBody=''})assert(c,table.concat(d,'\n'))aG:set(b)end function aL.SetTitle(aM,b)local c,d=ay({SetTitle=b},{
SetTitle=''})assert(c,table.concat(d,'\n'))aF:set(b)end function aL.Visible(aM)aH:set(true)end function aL.Invisible(aM)
aH:set(false)end return aL end end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag
.services local am,an,ao=al.UserInputService,al.RunService,ag.Fusion local ap,aq,ar,as,at,au,av,aw=ao.New,ao.Children,ao
.Value,ao.Observer,ao.OnEvent,ao.Computed,ao.Ref,ac(ae.utilities)local ax,ay,az,aA,aB=aw.get,aw.animate,aw.typecheck,aw.
customFont,ac(ae.simpleElements)local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB.UIListLayout,aB.UIPadding,aB.UICorner,Enum.SortOrder
,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,az(af,{Name='',DisabledText='',FLAG='',IsEnabled=
false,Default=0,Callback=function()end,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0,Visible=false,IgnoreConfig=true
},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.Default and''or
'Default',af.Min and''or'Min',af.Max and''or'Max',af.Visible and''or'Visible',af.DisplayAsPercent and''or
'DisplayAsPercent',af.DecimalPlace and''or'DecimalPlace',af.IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.concat(
aK,'\n'))local aL,aM,b,c,d,e,i,j,k,l,m,n,o,p,q=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af
.Parent,af.Name,af.Callback,af.Max,af.Min,af.DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IsEnabled or ar(
true),af.DisabledText or ar'Component Disabled',af.IgnoreConfig or ar(false),af.Visible or ar(true)local r=ax(af.Default
)and ar(math.clamp(ax(af.Default),ax(k),ax(j)))if not ax(r)then r=ar(ax(k))end local s,t=(af.FLAG or ar(c.uid))if ax(s)
~=''then t=ak.register(ax(s),{percentageOf=ar(ax(k))},'slider',ax(s)==c.uid)t.user.Value=ax(t.status.percentageOf)end
local u=ar(ax(aL.string)==ax(c.tab).uid)as(aL.string):onChange(function()u:set(ax(aL.string)==ax(c.tab).uid)end)local v=
ay(function()return ax(u)and 0 or 1 end,40,1)local function w(x,y,z,A,B)return(1-((x-y)/(z-y)))*A+((x-y)/(z-y))*B end
local function x(y)if ax(m)==0 then return math.floor(y)end return tonumber(string.format('%.'..ax(m)..'f',y))end local
y=ar(0)as(t.status.percentageOf):onChange(function()y:set(w(ax(t.status.percentageOf),ax(k),ax(j),0,1))if not ax(n)then
return end task.spawn(ax(i),ax(t.status.percentageOf))end)local z,A,B,C=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(
function(D)if(D.UserInputType==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch)and ax(C)
then C:set(false)end end)ap'Frame'{Parent=d,Visible=au(function()if ax(b.string)~=''and not string.find(ax(e):lower(),
ax(b.string):lower())or not ax(q)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.
background2,BackgroundTransparency=ay(function()if ax(u)then return 0 end return 1 end,40,1),[aq]={aE(6),ap'Frame'{
ZIndex=2,Visible=au(function()if not ax(n)then return true end return false end),BackgroundTransparency=ay(function()
return ax(u)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={aE(6),ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=v},ap'TextLabel'{FontFace=aA(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=v,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()
return ax(o)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={aC(aF.LayoutOrder,aG.Horizontal,aH.Left,aI.Center,UDim.new(0,6)
),aD(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=v,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=e,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aG.
Horizontal,aH.Left,aI.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),
aC(aF.LayoutOrder,aG.Vertical,aH.Right,aI.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aA('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=v,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(function()if ax(l)then return
tostring(x(ax(y)*100))..'%'end return ax(t.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(D)local E=ax(B)if D=='AbsoluteSize'and E and E.
AbsoluteSize then A:set(E.AbsoluteSize.X)end end,[at'FocusLost']=function()local D=ax(B)if tonumber(D.Text)then t.status
.percentageOf:set(math.clamp(tonumber(D.Text),ax(k),ax(j)))else if ax(l)then D.Text=tostring(x(ax(y)*100))..'%'end D.
Text=ax(t.status.percentageOf)end end,[av]=B,[aq]={aD(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(u)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(A),2)end,40,1),[aq]={aE(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(n)then return false
end return ax(u)end),Size=UDim2.new(0.8,-5,0.5,0),BackgroundTransparency=1,[at'MouseButton1Down']=function()C:set(true)
end,[at'TouchLongPress']=function()C:set(true)end,[at'InputBegan']=function(D)if D.UserInputType==Enum.UserInputType.
MouseButton1 or D.UserInputType==Enum.UserInputType.Touch and ax(z)then local E,F=am:GetMouseLocation().X,ax(z).Size.X.
Offset local G=E-(ax(z).AbsolutePosition.X+F)while ax(C)and task.wait()do local H=am:GetMouseLocation().X local I=math.
clamp(F+(H-E)+G,0,ax(z).AbsoluteSize.X)t.status.percentageOf:set(x(w(I,0,ax(z).AbsoluteSize.X,ax(k),ax(j))))an.
RenderStepped:Wait()end end end,[av]=z,[aq]={aD(0,6),ap'Frame'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0
,0.5),Size=UDim2.new(1,0,0,4),BackgroundColor3=ai.background,BackgroundTransparency=v,[aq]={aE(0,1)}},ap'Frame'{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=ai.text,BackgroundTransparency=v,Size=
ay(function()return UDim2.new(ax(y),0,0,4)end,40,1),[aq]={aE(0,1),ap'ImageLabel'{Image=aj.circle,BackgroundTransparency=
1,ImageColor3=ai.selectedTab,ImageTransparency=v,Size=UDim2.fromOffset(18,18),Position=UDim2.new(1,0,0.5,0),AnchorPoint=
Vector2.new(0.5,0.5),[aq]={ap'Frame'{Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.
fromOffset(2,8),BackgroundColor3=ai.text,BackgroundTransparency=ay(function()if ax(u)then return 0.8 end return 1 end,40
,1)}}}}}}}}}}}}}if ax(aM.boolean)and not ax(p)then as(t.file):onChange(function()local D,E=ax(t.file),true if D~=nil
then t.status.percentageOf:set(D)E=false end if E then t.status.percentageOf:set(ax(r))end end)if t.private then t.
status.percentageOf:set(ax(r))end else t.status.percentageOf:set(ax(r))end local D={}function D.SetName(E,F)local G,H=
az({SetName=F},{SetName=''})assert(G,table.concat(H,'\n'))e:set(F)end function D.SetValue(E,F)local G,H=az({SetValue=F},
{SetValue=0})assert(G,table.concat(H,'\n'))t.status.percentageOf:set(math.clamp(F,ax(k),ax(j)))end function D.Enable(E)n
:set(true)end function D.Disable(E)n:set(false)end function D.Visible(E)q:set(true)end function D.Invisible(E)q:set(
false)end return D end end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae=ab.Parent.
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
true)aE:update('string',aG.uid)end return aG end end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(
...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=
ai.New,ai.Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj
'ScrollingFrame'{ZIndex=al(function()return(as(at.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=
UDim2.new(1,0,1,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center
,ar.Top,UDim.new(0,4))}}end end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae=ab.Parent
.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.
Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.
utilities)local au,av,aw,ax,ay=at.get,at.animate,at.customFont,at.typecheck,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE
,aF,aG,aH,aI=ay.UIPadding,ay.UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum
.HorizontalAlignment,Enum.FillDirection,ax(af,{Name='',PlaceHolderText='',DisabledText='',ClearTextOnFocus=false,
OnlyNumbers=true,OnLeave=true,Visible=false,Default='',FLAG='',IsEnabled=false,Callback=function()end,IgnoreConfig=true}
,{af.PlaceHolderText and''or'PlaceHolderText',af.IsEnabled and''or'IsEnabled',af.ClearTextOnFocus and''or
'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or'OnLeave',af.Default and''or'Default',af.FLAG
and''or'FLAG',af.Visible and''or'Visible',af.DisabledText and''or'DisabledText',af.IgnoreConfig and''or'IgnoreConfig',af
.IgnoreConfig and''or'IgnoreConfig'})assert(aH,table.concat(aI,'\n'))local aJ,aK,aL,aM,b,c,d,e,i,j,k,l,m,n,o,p,q=ah.find
'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Callback,af.IsEnabled or ao(true),
af.DisabledText or ao'Component Disabled',af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.
ClearTextOnFocus or ao(false),af.IgnoreConfig or ao(false),af.IgnoreConfig or ao(false),af.PlaceHolderText or ao'',af.
Visible or ao(true)local r,s=(af.FLAG or ao(aM.uid))if au(r)~=''then s=ak.register(au(r),{correctText=ao''},'textbox',
au(r)==aM.uid)s.user.Value=au(s.status.correctText)end local t=ao(au(aJ.string)==au(aM.tab).uid)aq(aJ.string):onChange(
function()t:set(au(aJ.string)==au(aM.tab).uid)end)local u,v,w,x,y,z,A=av(function()return au(t)and 0 or 1 end,40,1),ao()
,ao(false),ao'',ao(au(s.status.correctText)),ao'',ao(false)aq(x):onChange(function()if au(j)then if tonumber(au(x))or
au(x)==''then y:set(au(x))end else y:set(au(x))end local B=au(v)B.Text=au(y)if au(l)then return end if au(j)then if(
tonumber(au(x))or au(x)=='')and au(z)~=au(x)then task.spawn(au(d),au(x))s.status.correctText:set(au(x))z:set(au(x))end
else if au(z)==au(x)then return end task.spawn(au(d),au(x))s.status.correctText:set(au(x))z:set(au(x))end end)aq(w):
onChange(function()if au(l)and not au(w)then if au(j)then if(tonumber(au(x))or au(x)=='')and au(z)~=au(x)then task.
spawn(au(d),au(x))s.status.correctText:set(au(x))z:set(au(x))end else if au(z)==au(x)then return end task.spawn(au(d),
au(x))s.status.correctText:set(au(x))z:set(au(x))end end end)local B,C=ao(),ao(0)am'Frame'{Parent=b,Visible=ap(function(
)if au(aL.string)~=''and not string.find(au(c):lower(),au(aL.string):lower())or not au(q)then return false end return
true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,Visible=ap(function()if not au(e)
then return true end return false end),BackgroundTransparency=av(function()return au(t)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aA(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24)
,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=u},am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=u,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=ap(function()return au(i)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,
[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aC(aD.LayoutOrder,aG.Horizontal,aF.
Left,aE.Center,UDim.new(0,3)),am'TextLabel'{Size=UDim2.fromScale(0,1),BackgroundColor3=ai.background2,
BackgroundTransparency=u,TextSize=18,Text=c,AutomaticSize=Enum.AutomaticSize.X,TextTransparency=u,TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,TextColor3=ai.text,FontFace=aw('Montserrat',Enum.FontWeight.Bold),[as'Changed']=
function(D)if D=='AbsoluteSize'and au(B)~=nil then C:set(au(B).AbsoluteSize.X)end end,[ar]=B,[an]={aA(6),az(0,6)}},am
'TextButton'{Interactable=ap(function()if not au(e)then return false end return au(t)end),Size=ap(function()if au(B)then
return UDim2.new(1,-au(C)-3,1)end return UDim2.fromScale(0.35,1)end),BackgroundColor3=ai.background2,
BackgroundTransparency=u,[as'Activated']=function()local D=au(v)if D then D:CaptureFocus()end end,[an]={aA(6),az(0,6),
aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,5)),am'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,ImageTransparency=u},am'TextBox'{Interactable=ap(function()
if not au(e)then return false end return au(t)end),ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),
BackgroundTransparency=1,PlaceholderText=p,PlaceholderColor3=ai.text2,TextColor3=ai.text,TextSize=16,TextXAlignment=Enum
.TextXAlignment.Left,FontFace=aw('Montserrat',Enum.FontWeight.Bold),Text=y,TextTransparency=u,ClearTextOnFocus=m,[ar]=v,
[as'Changed']=function(D)local E=au(v)if E.TextBounds.X>E.AbsoluteSize.X then A:set(true)end if E and E.Text and D==
'Text'then x:set(E.Text)end end,[as'Focused']=function()w:set(true)end,[as'FocusLost']=function()w:set(false)end,[an]={
am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[an]={am'UIGradient'{Rotation=0,Color=av(function()return
ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,
40,1),Transparency=av(function()if not au(t)then return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1,1)}end if au(A)then if au(w)then return NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.1,1),NumberSequenceKeypoint.new(1,1)}else return
NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end
end return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if au(
aK.boolean)and not au(o)then aq(s.file):onChange(function()local D,E=au(s.file),true if D~=nil then if au(l)then w:set(
true)end x:set(D)if au(l)then w:set(false)end E=false end if E then if au(l)then w:set(true)end x:set(au(k))if au(l)then
w:set(false)end end end)if s.private then if au(l)then w:set(true)end x:set(au(k))if au(l)then w:set(false)end end else
if au(l)then w:set(true)end x:set(au(k))if au(l)then w:set(false)end end local D={}function D.SetName(E,F)local G,H=ax({
SetName=F},{SetName=''})assert(G,table.concat(H,'\n'))c:set(F)end function D.SetInput(E,F)local G,H=ax({SetInput=F},{
SetInput=au(j)and 1 or''})assert(G,table.concat(H,'\n'))x:set(F)end function D.Enable(E)e:set(true)end function D.
Disable(E)e:set(false)end function D.Visible(E)q:set(true)end function D.Invisible(E)q:set(false)end return D end end)()
end,[27]=function()local aa,ab,ac=a(27)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an=al.
UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(
ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references,au.
drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,b=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.
UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(
af,{Name='',DisabledText='',FLAG='',IsEnabled=false,Default=false,Visible=false,Callback=function()end,LinkKeybind=true,
IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.FLAG and''or'FLAG',af.IsEnabled and''or'IsEnabled',af.
Default and''or'Default',af.Visible and''or'Visible',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or
'IgnoreConfig',af.IgnoreConfig and''or'IgnoreConfig'})assert(aM,table.concat(b,'\n'))aM,b=ax(af,{Bind=Enum.KeyCode.E},{
af.LinkKeybind and af.Bind and''or'Bind'})assert(aM,table.concat(b,'\n'))local c,d,e,i,j,k,l,m,o,p,q,r,s,t,u,v,w,x,y,z=
ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find
'isMobile',ah.find'isListening',ah.find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.Callback,af.Default
or aq(false),af.IsEnabled or aq(true),af.Visible or aq(true),af.Bind,af.IgnoreConfig or aq(false),af.DisabledText or aq
'Component Disabled',af.LinkKeybind or aq(false)local A,B=(af.FLAG or aq(p.uid))if av(A)~=''then B=ak.register(av(A),{
boolean=aq(false),keycode=aq(nil)},'toggle',av(A)==p.uid)B.user.Value=av(B.status.boolean)end local C=aq()local function
D(E:EnumItem,F:string)local G,H=av(d.binds),av(m.bindData)if table.find(G,E)then aL(('Key %s is already in use. %s'):
format(E.Name,F))else table.insert(G,E)if av(C)then table.remove(G,table.find(G,av(C)))H[av(C).Name]=nil end C:set(E)H[
av(C).Name]={bind=av(C),name=av(r),boolean=B.status.boolean}m:update('bindData',H)d:update('binds',G)end end ar(B.status
.boolean):onChange(function()if av(u)then task.spawn(av(s),av(B.status.boolean))end end)ar(B.status.keycode):onChange(
function()local E,F=pcall(function()return Enum.KeyCode[av(B.status.keycode)]end)if E then D(F,'RAHHH')end end)table.
insert(o.list,B.status.boolean)local E=aq(av(c.string)==av(p.tab).uid)ar(c.string):onChange(function()E:set(av(c.string)
==av(p.tab).uid)end)local F,G=aw(function()return av(E)and 0 or 1 end,40,1),aq(false)local H=am.InputBegan:Connect(
function(H,I)if av(k.boolean)then return end if av(G)then if H.KeyCode and H.KeyCode~=Enum.KeyCode.Unknown then D(H.
KeyCode,'From input box')end G:set(false)task.wait()l:update('boolean',false)else if H.KeyCode and H.KeyCode==av(C)and
not I and not av(l.boolean)and av(u)then B.status.boolean:set(not av(B.status.boolean))end end end)ay.add(H)local I,J=(
aq(false))local K=ao'TextButton'{Visible=at(function()if not av(u)then return av(u)end return av(I)end),Parent=aA.get(
av(j.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=
true,Text=r,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.
mobileButtonBackground,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if J then J:Disconnect(
)J=nil else B.status.boolean:set(not av(B.status.boolean))end end,[ap]={aD(4),aE(16),aF(0,16),ao'ImageLabel'{ZIndex=0,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1
,Image=av(k.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{
Parent=q,Visible=at(function()if av(i.string)~=''and not string.find(av(r):lower(),av(i.string):lower())or not av(v)then
return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(
function()if not av(u)then return true end return false end),BackgroundTransparency=aw(function()return av(E)and 0.2 or
1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=F},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=F,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()return av(y)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={
aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)),ao'TextButton'{Interactable=at(function()if not av(u)
then return false end return av(E)end),Size=at(function()return av(z)and UDim2.new(0.775,av(I)and-42 or-3,0,36)or UDim2.
new(1,0,0,36)end),BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=function()if not av(u)then
return end B.status.boolean:set(not av(B.status.boolean))end,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'Frame'{Size=
UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=F,
BackgroundColor3=aw(function()return av(B.status.boolean)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aE(6),
ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(function()if not av(E)then return 1 end if av(B.status.
boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.
FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=r,TextTransparency=F,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},ao'TextButton'{Visible=I,Interactable=at(function()if not av(u)then return false end return av(E)end)
,Size=UDim2.fromOffset(36,36),BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=function()I:set(
false)K.Position=UDim2.fromScale(0.5,0.5)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=F}}},ao'TextButton'{Visible=z,Interactable=at(function()if not av(u)then return false end return av(E)
end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=F,[as'Activated']=function()if
av(k.boolean)then I:set(true)J=aB(K,15)return end G:set(true)l:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.
LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=av(k.boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=F},ao
'TextLabel'{Visible=not av(k.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=F,Text=
at(function()return av(G)and'Listening'or av(C)and av(C).Name or'Waiting'end)},ao'TextLabel'{Visible=av(k.boolean),Size=
UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(I)and'Move Bind'or'Place Bind'
end),TextTransparency=F}}}}}}}if av(e.boolean)and not av(x)then ar(B.file):onChange(function()local L,M,N=av(B.file),
true,true if L.boolean~=nil then B.status.boolean:set(L.boolean)M=false end if L.keycode~=nil then B.status.keycode:set(
L.keycode)N=false end if M then B.status.boolean:set(av(t))end if N then if w then B.status.keycode:set(av(w).Name)end
end end)if B.private then B.status.boolean:set(av(t))if w then B.status.keycode:set(av(w).Name)end end else B.status.
boolean:set(av(t))if w then B.status.keycode:set(av(w).Name)end end local L={}function L.SetName(M,N)local O,P=ax({
SetName=N},{SetName=''})assert(O,table.concat(P,'\n'))r:set(N)end function L.SetValue(M,N:boolean)local O,P=ax({SetValue
=N},{SetValue=true})assert(O,table.concat(P,'\n'))B.status.boolean:set(N)end function L.SetBind(M,N:EnumItem)assert(av(z
),'Requires LinkKeybind')local O,P=ax({SetBind=N},{SetBind=Enum.keyCode.C})assert(O,table.concat(P,'\n'))D(N,
'At :SetBind')end function L.Enable(M)u:set(true)end function L.Disable(M)u:set(false)end function L.Visible(M)v:set(
true)end function L.Invisible(M)v:set(false)end return L end end)()end,[28]=function()local aa,ab,ac=a(28)local ad
return(function(...)local ae,af,ag=ab.Parent.Parent,'',{}table.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab
.Parent.notification),ac(ae.utilities).references local al,am=ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList'
,Title=af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get'red'}end)table.insert(ag,function(ah)af=ah end)return ag
end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae=ab.Parent.Parent return function(af,
ag)local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,
ah.Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.
simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.
SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aF,aG,aH,aI,aJ,aK,aL,
aM,b,c,d,e,i=aE.get,aE.references,aE.drag,aE.customFont,aE.animate,aE.connections,ac(ab.Parent.Parent.components.warn)[1
],aq(),aq(),aq(),aq(),aq(),aq()aG.add(e,d,c,b,aM,i)local j,k,l,m,o,p,q,r,s,t,u,v,w,x,y,z=am.find'absoluteOffset',am.find
'instanceName',am.find'selectedTab',am.find'searchText',am.find'currentBinds',am.find'isVisible',am.find'isMobile',am.
find'isListening',am.find'bindData',am.find'destroyFunc'.func,aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(
w):onChange(function()if aF(w)then x:set(not aF(x))task.wait(0.3)y:set(not aF(y))task.wait(0.3)z:set(not aF(z))else z:
set(not aF(z))task.wait(0.3)y:set(not aF(y))task.wait(0.3)x:set(not aF(x))end end)at(y):onChange(function()u:set(aF(y)
and 212 or 750)end)at(z):onChange(function()v:set(aF(z)and 74 or 500)end)local A,B,C=aq(false),aq(),aq(false)
local function D(E:EnumItem,F:string)local G,H=aF(o.binds),aF(s.bindData)if table.find(G,E)then aL((
'Key %s is already in use. %s'):format(E.Name,F))else table.insert(G,E)if aF(B)then table.remove(G,table.find(G,aF(B)))H
[aF(B).Name]=nil end B:set(E)C:set(true)H[aF(B).Name]={bind=aF(B),name='Toggle Interface'}s:update('bindData',H)o:
update('binds',G)end end if not aF(q.boolean)then D(af.HideBind,'init')end local E=aq''at(l.string):onChange(function()
local F=aF(l.string)local G=am.find(F)E:set(aF(G.Name):upper())end)local F,G,H=(aq(af.Icon or''))local I=ao'ScreenGui'{
Name=aF(k.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[ar]=e,[ap]={ao'Frame'{Name=
'screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},ao'Frame'{Name='container',Visible=p.boolean,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aF(j.number)),Size=aJ(function()return UDim2.fromOffset(
aF(u),aF(v))end,30,1),BackgroundColor3=ak.background,[ar]=aM,[ap]={ax(6),az(16),aw(aA.LayoutOrder,aB.Horizontal,aC.Right
,aD.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=aJ(function()return UDim2.new(0,math.
clamp(aF(u)-32-180-16,212,9e9),aF(x)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=true,[ap]={ao
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
,ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2,[au'Activated']=function()local I=aF(i)if I
then I:CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao
'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=al.search,ImageColor3=ak.text2},ao'TextBox'{
Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aI('Montserrat',Enum.FontWeight.Bold),
PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(I)local J=aF(i)if I~='Text'and J and J.Text then return end
m:update('string',J.Text)end,[ar]=i}}}}},ao'Frame'{Name='tabFrameList',Size=UDim2.new(1,0,1,-60),BackgroundTransparency=
1,[ar]=c}}}}},ao'Frame'{Size=aJ(function()return aF(z)and UDim2.new(0,180,0,44)or UDim2.new(0,180,1,0)end,30,1),
BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder,aB.Vertical,aC.Center,aD.Top,UDim.
new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Center,aD
.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()if aF(q.boolean)then C:set(true)H=aH(G,15)return end A:set(true)r:update('boolean',true)end,[ap]={ax(6),az(6),
aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),
BackgroundTransparency=1,Image=aF(q.boolean)and al.finger or al.command,ImageColor3=ak.text2,ImageTransparency=0},ao
'TextLabel'{Visible=not aF(q.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aI('Montserrat',Enum.
FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return
aF(A)and'Listening'or aF(B)and aF(B).Name or'Waiting'end)},ao'TextLabel'{Visible=aF(q.boolean),Size=UDim2.new(1,-25,0,16
),BackgroundTransparency=1,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(C)and'Move Bind'or'Place Bind'end)}}},ao
'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()w:set(not aF(w))end,
[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,
30),BackgroundTransparency=1,Image=as(function()return aF(w)and al.minimize or al.maximize end),ImageColor3=ak.text2,
ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()if not aF(C)then ac(ae.components.notification){Parent=d,Title='Darius Interface',Body=`You must {aF(q.boolean
)and'place your bind'or'bind to a key'} before hiding the UI!`,Duration=5,Image=al.alert,ImageColor=ak.get'red'}return
end p:update('boolean',not aF(p.boolean))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,
ImageTransparency=0}}}}},ao'ScrollingFrame'{Name='tabButtonList',Size=aJ(function()return aF(z)and UDim2.new(1,0,0,0)or
UDim2.new(1,0,1,-90)end,30,1),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=true,[ar]=b,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top
,UDim.new(0,6)),az(0,10)}},ao'TextButton'{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=
function()aF(t)()end,[ap]={ax(4),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao'ImageLabel'{
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao
'TextLabel'{Size=UDim2.new(1,-28,1),FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,
Text='Destroy Interface',BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,
Size=UDim2.new(0,2,1,-20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[ar]=d,[
ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Right,aD.Bottom)}}}}if I.screenSize.AbsoluteSize.X<aF(u)then u:set(I.screenSize.
AbsoluteSize.X*0.9)end if I.screenSize.AbsoluteSize.Y<aF(v)then v:set(I.screenSize.AbsoluteSize.Y*0.9)end G=ao
'TextButton'{Visible=as(function()return(aF(C)and aF(q.boolean))end),Interactable=as(function()return(aF(C)and aF(q.
boolean))end),Parent=aG.get(aF(k.name)),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),TextScaled=true,Text='Toggle UI',FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.
mobileButtonText,BackgroundColor3=ak.mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au
'Activated']=function()if H then H:Disconnect()H=nil else p:update('boolean',not aF(p.boolean))end end,[ap]={az(4),ax(16
),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(32,32),BackgroundTransparency=1,Image=aF(q.boolean)and al.finger or al.command,ImageColor3=ak.
mobileButtonImage,ImageTransparency=0.8}}}local J=aj.InputBegan:Connect(function(J,K)if aF(q.boolean)then return end if
aF(A)then if J.KeyCode and J.KeyCode~=Enum.KeyCode.Unknown then D(J.KeyCode,'From input box')end A:set(false)task.wait()
r:update('boolean',false)else if J.KeyCode and J.KeyCode==aF(B)and not K and not aF(r.boolean)then p:update('boolean',
not aF(p.boolean))end end end)aK.add(J)local K=aH(aG.get'container',15)aK.add(aG.get'container':GetPropertyChangedSignal
'Position':Connect(function()local L=aG.get'container'local M=L.AbsolutePosition+Vector2.new(aF(u)/2,aF(v)/2)if(M.X-I.
screenSize.AbsoluteSize.X)/aF(u)>0.435 then K:Disconnect()L.Position=UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.
Offset)K=aH(aG.get'container',15)end if-((M.X-I.screenSize.AbsoluteSize.X)/aF(u)+1)>0.8 then K:Disconnect()L.Position=
UDim2.new(0.5,0,L.Position.Y.Scale,L.Position.Y.Offset)K=aH(aG.get'container',15)end if(M.Y-(I.screenSize.AbsoluteSize.Y
+aF(j.number)))/aF(v)>0.32 then K:Disconnect()L.Position=UDim2.new(L.Position.X.Scale,L.Position.X.Offset,0.5,aF(j.
number))K=aH(aG.get'container',15)end if-((M.Y-(I.screenSize.AbsoluteSize.Y+aF(j.number)))/aF(v)+1)>0.935 then K:
Disconnect()L.Position=UDim2.new(L.Position.X.Scale,L.Position.X.Offset,0.5,aF(j.number))K=aH(aG.get'container',15)end
end))end end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(function(...)return setmetatable({},{__index=
function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[32]=
function()local aa,ab,ac=a(32)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(
af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.
Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,AspectType=ag,DominantAxis=ah}end end)()end,[33]=function()
local aa,ab,ac=a(33)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag
or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}end end)()end,[34]=function()local aa,ab,ac=a(34)local ad
return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af,ag,ah,ai,aj)return ae.New
'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,FillDirection=ag or Enum.FillDirection.Vertical,
HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=
aj or UDim.new(0,0)}end end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(...)local ae=ac(ab.Parent.
Parent.Bundles.Fusion)return function(...)local af={...}if#af==1 then return ae.New'UIPadding'{PaddingTop=typeof(...)==
'number'and UDim.new(0,...)or...,PaddingRight=typeof(...)=='number'and UDim.new(0,...)or...,PaddingBottom=typeof(...)==
'number'and UDim.new(0,...)or...,PaddingLeft=typeof(...)=='number'and UDim.new(0,...)or...}elseif#af==2 then return ae.
New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and
UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingLeft=typeof(af[2])==
'number'and UDim.new(0,af[2])or af[2]}elseif#af==3 then return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and
UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])
=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}else return ae.
New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and
UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[4])==
'number'and UDim.new(0,af[4])or af[4]}end end end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)
local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number?,ag:number?)return ae.New'UITextSizeConstraint'{
MinTextSize=af,MaxTextSize=ag}end end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)return
setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end
end})end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[39]=function()
local aa,ab,ac=a(39)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.
add(ah)table.insert(ae,ah)end function af.deleteConnections()for ah,ai in ae do if typeof(ai)=='function'then ai()else
ai:Disconnect()end ae[ah]=nil end end return af end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(
...)local ae={Inter='rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.
FontWeight?,ah:Enum.FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal
if ae[af]then return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[41]=function()local aa,ab,ac=a(41
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
return ae end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)return function(ae,af)local ag,ah=
ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae
local function ap(aq,ar,as)return aq+(ar-aq)*as end local aq=Instance.new'BindableEvent'local function ar(as)if not(ao)
then return end if not(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,as*ah),ao.Y.
Scale,ap(ak.Position.Y.Offset,an.Y.Offset,as*ah))return end local at=(am-ai:GetMouseLocation())local au,av=(ao.X.Offset-
at.X),(ao.Y.Offset-at.Y)an=UDim2.new(ao.X.Scale,au,ao.Y.Scale,av)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.
Offset,au,as*ah),ao.Y.Scale,ap(ak.Position.Y.Offset,av,as*ah))end ak.InputBegan:Connect(function(as)if as.UserInputType
==Enum.UserInputType.MouseButton1 or as.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:
GetMouseLocation()as.Changed:Connect(function()if as.UserInputState==Enum.UserInputState.End then aq:Fire()al=false end
end)end end)local as=aj.Heartbeat:Connect(ar)return as,aq.Event end end)()end,[43]=function()local aa,ab,ac=a(43)local
ad return(function(...)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return
ae end end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(...)return function(ae:string,af)ae=ae or''
local ag=Instance.new'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.
Parent.Parent.Bundles.services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[45]=function()local aa,ab,ac=
a(45)local ad return(function(...)local ae=string.split(
[[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function af(ag)if ag>0 then return af(ag-1)
..ae[math.random(1,#ae)]else return''end end return af end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(
function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af.add(...)
for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if typeof(ah(aj))=='Instance'then if not
ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end)else if not ae[ah(
aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,' REF was already added')end end end end function af.get(ai)if
ae[ai]then return ae[ai]end end function af.remove(ai)if ae[ai]then ae[ai]=nil else warn(ai,
"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=nil if typeof(aj)=='Instance'then aj
:Destroy()end end end return af end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function(...)local ae=ac(ab
.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end,[48]=
function()local aa,ab,ac=a(48)local ad return(function(...)return function(ae:table,af:table,ag:table?):any ag=ag or{}
local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))and not table.find(ag,aj)then ah=
false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah,ai end end)()end},{{1,2,{
'Darius'},{{29,1,{'layouts'},{{30,2,{'main'}}}},{11,1,{'components'},{{15,2,{'divider'}},{19,2,{'label'}},{21,2,{
'notification'}},{20,2,{'module'}},{24,2,{'tabButton'}},{13,2,{'buttonGroup'}},{16,2,{'dropdown'}},{22,2,{'paragraph'}},
{23,2,{'slider'}},{27,2,{'toggle'}},{12,2,{'button'}},{14,2,{'colorpicker'}},{28,2,{'warn'}},{17,2,{'keybind'}},{25,2,{
'tabFrame'}},{18,2,{'keybindList'}},{26,2,{'textbox'}}}},{2,2,{'Bundles'},{{7,2,{'lucide'}},{8,2,{'services'}},{4,2,{
'data'}},{9,2,{'themeSystem'},{{10,2,{'default'}}}},{6,2,{'icons'}},{3,2,{'Fusion'}},{5,2,{'flags'}}}},{37,2,{
'utilities'},{{48,2,{'typecheck'}},{40,2,{'customFont'}},{43,2,{'get'}},{47,2,{'tween'}},{45,2,{'randomString'}},{42,2,{
'drag'}},{44,2,{'getStringBounds'}},{41,2,{'customFunctions'}},{39,2,{'connections'}},{46,2,{'references'}},{38,2,{
'animate'}}}},{31,2,{'simpleElements'},{{32,2,{'UIAspectRatioConstraint'}},{36,2,{'UITextSizeConstraint'}},{34,2,{
'UIListLayout'}},{35,2,{'UIPadding'}},{33,2,{'UICorner'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,
table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay,az,aA=aj.insert,aj.
remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)=='Lune'then local
aB,aC=ap(ao,'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,aG,aH,aI,aJ,aK=aB or
function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},
{},{},{},{},{}local aL,aM={GetFullName={{},function(aL)local aM,b=aL.Name,aL.Parent while b do aM=b.Name..'.'..aM b=b.
Parent end return aM end},GetChildren={{},function(aL)local aM={}for b in ai,aK[aL]do au(aM,b)end return aM end},
GetDescendants={{},function(aL)local aM={}for b in ai,aK[aL]do au(aM,b)for c,d in ai,b:GetDescendants()do au(aM,d)end
end return aM end},FindFirstChild={{'string','boolean?'},function(aL,aM,b)local c=aK[aL]for d in ai,c do if d.Name==aM
then return d end end if b then for e in ai,c do return e:FindFirstChild(aM,true)end end end},FindFirstAncestor={{
'string'},function(aL,aM)local b=aL.Parent while b do if b.Name==aM then return b end b=b.Parent end end},WaitForChild={
{'string','number?'},function(aL,aM)return aL:FindFirstChild(aM)end}},{}for b,c in ai,aL do local d,e,i=c[1],c[2],{}for
j,k in ai,d do local l,m=az(k,'^([^%?]+)(%??)')i[j]={l,m}end aM[b]=function(l,...)if not aK[l]then ah(
"Expected ':' not '.' calling member function "..b,2)end local m={...}for o,p in ai,i do local q=m[o]local r,s,t=an(q),p
[1],p[2]if q==nil and not t then ah('Argument '..q..' missing or nil',3)end if s~='any'and r~=s and not(r=='nil'and t)
then ah('Argument '..o..' expects type "'..s..'", got "'..r..'"',2)end end return e(l,...)end end local function d(e,i,j
)local k,l=(ag({},{__mode='k'}))local function m(o)ah(o..' is not a valid (virtual) member of '..e..' "'..i..'"',3)end
local function o(p)ah('Unable to assign (virtual) property '..p..'. Property is read only',3)end local p,q={},{}q.
__metatable=false q.__index=function(r,s)if s=='ClassName'then return e elseif s=='Name'then return i elseif s=='Parent'
then return j elseif e=='StringValue'and s=='Value'then return l else local t=aM[s]if t then return t end end for t in
ai,k do if t.Name==s then return t end end m(s)end q.__newindex=function(r,s,t)if s=='ClassName'then o(s)elseif s==
'Name'then i=t elseif s=='Parent'then if t==p then return end if j~=nil then aK[j][p]=nil end j=t if t~=nil then aK[t][p
]=true end elseif e=='StringValue'and s=='Value'then l=t else m(s)end end q.__tostring=function()return i end ag(p,q)aK[
p]=k if j~=nil then aK[j][p]=true end return p end local function e(i,j)local k,l,m,o=i[1],i[2],i[3],i[4]local p=aD[l]
local q=m and av(m,1)or p local r=d(p,q,j)aE[k]=r if m then for s,t in ai,m do r[s]=t end end if o then for s,t in ai,o
do e(t,r)end end return r end local i=d('Folder','['..ad..']')for j,k in ai,ab do e(k,i)end for l,m in ai,aa do local o=
aE[l]aF[o]=m aG[o]=l local p=o.ClassName if p=='LocalScript'or p=='Script'then au(aI,o)end end local function o(p)local
q,r=p.ClassName,aH[p]if r and q=='ModuleScript'then return ak(r)end local s=aF[p]local function t(u)u=aq(u)local v,w,x=p
:GetFullName(),az(u,'[^:]+:(%d+): (.+)')if not w or not at then return v..':*: '..(x or u)end w=ar(w)local y=aG[p]local
z=at[y]local A=w-z+1 if A<0 then A='?'end return v..':'..A..': '..x end if q=='LocalScript'or q=='Script'then local u,v=
ap(s)if not u then ah(t(v),0)end else local u={ap(s)}local v=av(u,1)if not v then local w=av(u,1)ah(t(w),0)end aH[p]=u
return ak(u)end end function a(p)local q=aE[p]local function r(s,...)local t={ap(s,...)}local u=av(t,1)if not u then ah(
t[1],3)end return ak(t)end local s=aw(ag({},{__index=aJ,__newindex=function(s,t,u)aJ[t]=u end,__len=function()return#aJ
end,__iter=function()return ai,aJ end}))local t,u=aw{version=ac,envname=ad,shared=s,script=am,require=ao},q
local function v(w,...)local x,y,z=an(w),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if x=='table'and aK[w]then if w.ClassName~='ModuleScript'then ah(y,2)elseif w==q
then ah(z,2)end return o(w)elseif x=='string'and ay(w,1,1)~='@'then if#w==0 then ah(
'Attempted to call require with empty string',2)end local A=q if ay(w,1,1)=='/'then A=i elseif ay(w,1,2)=='./'then w=ay(
w,3)end local B for C in aA(w,'([^/]*)/?')do local D=C if C=='..'then D='Parent'end if D~=''then local E=A:
FindFirstChild(D)if not E then local F=A.Parent if F then E=F:FindFirstChild(D)end end if E then A=E elseif C~=B and C~=
'init'and C~='init.server'and C~='init.client'then ah('Virtual script path "'..w..'" not found',2)end end B=C end if A.
ClassName~='ModuleScript'then ah(y,2)elseif A==q then ah(z,2)end return o(A)end return r(ao,w,...)end return t,u,v end
for p,q in ai,aI do aC(o,q)end return o(i:GetChildren()[1])