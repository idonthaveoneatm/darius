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
af)end end})end)()end,function()local aa,ab,ac=a(3)local ad return(function(...)local ae=ac(ab.Parent.Parent.utilities)
local af,ag,ah=(ae.customFunctions)if af.getthreadidentity()<5 then ah=af.getthreadidentity()af.setthreadidentity(5)end
ag=ac(game:GetObjects'rbxassetid://110500042647914'[1])af.setthreadidentity(ah)return ag end)()end,function()local aa,ab
,ac=a(4)local ad return(function(...)local ae,af=ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Fusion)local
ag,ah,ai=af.Value,{},{}type uid=string type tag=string function ai.update(aj:string,ak:string,al:string)if ak~='uid'and
ai.find(aj)and ai.find(aj)[ak]then local am=ai.find(aj)am[ak]:set(al)elseif not ai.find(aj)then error(
"couldn't find uid: "..aj)elseif ak=='uid'or ak=='__tag'then error('cannot edit property '..ak)elseif not ai.find(aj)[ak
]then else error'how?'end end function ai.find(aj:uid|tag):table local ak for al=1,#ah do if ah[al].uid==aj or ah[al].
__tag==aj then ak=ah[al]end end if not ak then warn('no data found by identifier: '..tostring(aj))return ak end return
ak end function ai.delete(aj:string)local ak=ai.find(aj)local al,am=table.find(ah,ak),{}for an=1,#ah do if an~=al then
table.insert(am,ah[an])end end ah=am am=nil end function ai.add(aj:table,ak:string,al:boolean):table al=al or false if
not al then for am,an in aj do aj[am]=ag(an)end end aj.__tag=ak or nil aj.uid=ae(16)setmetatable(aj,{__index={update=
function(am,an,ao)ai.update(am.uid,an,ao)end,delete=function()ai.delete(aj.uid)end}})table.insert(ah,aj)return ai.find(
aj.uid)end return ai end)()end,function()local aa,ab,ac=a(5)local ad return(function(...)local ae,af,ag=ac(ab.Parent).
data,ac(ab.Parent.Parent.utilities).get,ac(ab.Parent).services local ah,ai=ag.HttpService,ac(ab.Parent).Fusion local aj,
ak,al=ai.Observer,ai.Value,ac(ab.Parent.Parent.utilities)local am,an,ao,ap,aq,ar,as,at,b=al.connections,al.
customFunctions,al.randomString,{},ae.add({list={}},'flags'),{},{},{},{}local c,d,e={toggle=function(c)local d=c.status.
boolean am.add(aj(d):onChange(function()local e=af(d)c.user.Value=e c.bindableEvent:Fire(e)end))end,dropdown=function(c)
local d=c.status.multiselect and c.status.items or c.status.item am.add(aj(d):onChange(function()local e=af(d)c.user.
Value=e c.bindableEvent:Fire(e)end))end,keybind=function(c)local d=c.status.mobile and c.status.coordinate or c.status.
keycode am.add(aj(d):onChange(function()local e=af(d)c.user.Value=e c.bindableEvent:Fire(e)end))end,slider=function(c)
local d=c.status.percentageOf am.add(aj(d):onChange(function()local e=af(d)c.user.Value=e c.bindableEvent:Fire(e)end))
end,textbox=function(c)local d=c.status.correctText am.add(aj(d):onChange(function()local e=af(d)c.user.Value=e c.
bindableEvent:Fire(e)end))end,colorpicker=function(c)local d,e=c.status.color,c.status.transparency am.add(aj(d):
onChange(function()c.user.Value={af(d),af(e)}c.bindableEvent:Fire(unpack(c.user.Value))end))am.add(aj(e):onChange(
function()c.user.Value={af(d),af(e)}c.bindableEvent:Fire(unpack(c.user.Value))end))end},{toggle=function(c)local d={}if
c.boolean then d.boolean=af(c.boolean)end if c.keycode then d.keycode=af(c.keycode)end if af(c.coordinate)then d.
coordinate={X=af(c.coordinate).X,Y=af(c.coordinate).Y}end return d end,dropdown=function(c)return c.multiselect and af(c
.items)or af(c.item)end,keybind=function(c)local d={}if c.keycode then d.keycode=af(c.keycode)end if af(c.coordinate)
then d.coordinate={X=af(c.coordinate).X,Y=af(c.coordinate).Y}end return d end,slider=function(c)return af(c.percentageOf
)end,textbox=function(c)return af(c.correctText)end,colorpicker=function(c)return{color=af(c.color):ToHex(),transparency
=af(c.transparency)}end},{}ap.currentConfig={}ap.path=''function ap.preregister(f)local g,h=ai.New'BindableEvent'{},{}
function h.Connect(i,j)assert(typeof(j)=='function','Connect only takes functions')am.add(g.Event:Connect(j))end local i
i={name=f,status={},type='unknown',preregistered=true,bindableEvent=g,file=ak{},user={Value=nil,OnChange=setmetatable(h,
{__newindex=function(j,k,l)return nil end})}}as[f]=i local j=af(aq.list)j[i.name]=i aq:update('list',j)return i end
function ap.register(f,g,h,i)assert(not table.find(ar,f),'Flags must all be unique!')table.insert(ar,f)local j,k=ai.New
'BindableEvent'{},{}function k.Connect(l,m)assert(typeof(m)=='function','Connect')am.add(j.Event:Connect(m))end local l
if not as[f]then local m=(ai.New'BindableEvent'{})l={name=f,status=g,type=h,private=i,preregistered=false,bindableEvent=
j,file=m.Event,fileEvent=m,user={Value=nil,OnChange=setmetatable(k,{__newindex=function()return nil end})}}c[l.type](l)
local n=af(aq.list)n[l.name]=l aq:update('list',n)else l=as[f]l.type=h l.preregistered=false l.status=g l.private=i c[l.
type](l)as[l.name]=nil end return l end function ap.find(f)for g,h in e do if h.uid==f then return h,g end end return
false end function ap.create(f,g,h,i)h=h or false if g=='original'and h then return end local j={}j.name=f j.uid=g or
ao(5)j.flagValues={}if h then j.flagValues=i else for k,l in af(aq.list)do if l.private then continue end if l.type==
'unknown'then continue end j.flagValues[l.name]=d[l.type](l.status)end end table.insert(e,j)an.writefile(`{ap.path}/{j.
uid}.json`,ah:JSONEncode(j))task.spawn(function()for k,l in at do task.spawn(l)end end)return g end function ap.init()
for f,g in an.listfiles(ap.path)do local h=ah:JSONDecode(an.readfile(g))ap.create(h.name,h.uid,true,h.flagValues)end end
function ap.load(f)for g,h in f do local i=af(aq.list)[g]if not i then continue end i.fileEvent:Fire(h)end end function
ap.set(f)local g=ap.find(f)if not g then return end ap.currentConfig=g ap.load(g.flagValues)task.spawn(function()for h,i
in at do task.spawn(i,f)end end)end function ap.save(f)local g=ap.find(f)for h,i in af(aq.list)do if i.private then
continue end if i.type=='unknown'then continue end g.flagValues[i.name]=d[i.type](i.status)end an.writefile(`{ap.path}/{
g.uid}.json`,ah:JSONEncode(g))end function ap.delete(f)local g,h=ap.find(f)if g then if an.isfile(`{ap.path}/{g.uid}.json`
)then an.delfile(`{ap.path}/{g.uid}.json`)table.remove(e,h)end end end function ap.export()return ah:JSONEncode(ap.
currentConfig)end function ap.getConfigs()return e end function ap.getConfig()return ap.currentConfig end function ap.
onCreate(f)table.insert(at,f)end function ap.onSelect(f)table.insert(b,f)end return ap end)()end,function()local aa,ab,
ac=a(6)local ad return(function(...)return{lock='rbxassetid://10723434711',maximize='rbxassetid://15556636376',minimize=
'rbxassetid://15556637715',close='rbxassetid://10747384394',circle='rbxassetid://18804307590',normalDropdown=
'rbxassetid://10723433811',multiDropdown='rbxassetid://10734884548',fingerprint='rbxassetid://10723375250',check=
'rbxassetid://10709790644',command='rbxassetid://10723416765',input='rbxassetid://10734982297',search=
'rbxassetid://10734943674',finger='rbxassetid://10734929723',alert='rbxassetid://10709752996',paint=
'rbxassetid://10734910187',cog='rbxassetid://10709810948'}end)()end,function()local aa,ab,ac=a(7)local ad return(
function(...)local ae=ac(ab.Parent.Parent.utilities)local af,ag,ah=(ae.customFunctions)if af.getthreadidentity()<5 then
ah=af.getthreadidentity()af.setthreadidentity(5)end ag=loadstring(game:GetObjects'rbxassetid://85554466048193'[1].Source
)()af.setthreadidentity(ah)return ag end)()end,function()local aa,ab,ac=a(8)local ad return(function(...)local ae=ac(ab.
Parent.Parent.utilities.customFunctions)local af,ag=ae.cloneref,{}ag=setmetatable(ag,{__index=function(ah,ai)return af(
game:GetService(ai))end})return ag end)()end,function()local aa,ab,ac=a(9)local ad return(function(...)local ae,af={},
ac(ab.Parent.services)local ag,ah,ai,aj=af.HttpService,ac(ab.Parent.data),ac(ab.Parent.Fusion),ac(ab.default)local ak,al
,am,an,ao,ap,aq,ar,as=ai.Value,ai.Observer,ac(ab.Parent.Parent.utilities.get),ac(ab.Parent.Parent.utilities.animate),ac(
ab.Parent.Parent.components.warn),ac(ab.Parent.Parent.utilities.randomString),ac(ab.Parent.Parent.utilities.
customFunctions),{},{}local at,b,c=ak{},ak{},''al(at):onChange(function()task.wait()for d,e in ipairs(ar)do task.spawn(e
)end end)local d,e,f={},{},{}table.foreach(aj,function(g)table.insert(f,g)end)ae.path=''function ae.find(g)for h,i in d
do if i.uid==g then return true,i end end return false end function ae.create(g,h,i,j,k)j=j or false if i=='original'and
j then return end for l,m in f do if h[m]==nil then h[m]=aj[m]end if typeof(h[m])~='Color3'then ao(m..
" isn't type Color3")end end for n,o in h do if not table.find(f,n)then ao('Incorrect value removed "'..tostring(n)..'"'
)h[n]=nil end end if k and j then table.insert(e,i)end if k and not j then for p,q in e do local r=ae.find(q)if r.name==
g then return q.uid end end end i=i or ap(5)table.insert(d,{name=g,uid=i,fromSet=k or false,palette=h})local p={}p.name=
g p.uid=i p.fromSet=k p.palette={}for q,r in h do p.palette[q]=r:ToHex()end aq.writefile(`{ae.path}/{i}.json`,ag:
JSONEncode(p))task.spawn(function()for s,t in as do task.spawn(t)end end)return i end function ae.delete(g)local h={ae.
find(g)}if not h[1]then return false,'no theme found'end local i=table.find(d,h[2])ae.set(c)table.remove(d,i)aq.delfile(
`{ae.path}/{h[2].uid}.json`)end function ae.edit(g,h)local i=am(at)i[g]=h at:set(i)end function ae.editTheme(g:string,h:
string,i:any)local j={ae.find(g)}if not j[1]then return false end local k=j[2]k[h]=i local o={}o.name=k.name o.uid=g o.
fromSet=k.fromSet o.palette={}for p,q in k.palette do o.palette[p]=q:ToHex()end aq.writefile(`{ae.path}/{g}.json`,ag:
JSONEncode(o))return true end function ae.set(g)local h,i,j={ae.find(g)}if h[1]then i,j=h[2],h[2].palette else return
false,'no theme found'end local k={}table.foreach(j,function(o,p)k[o]=p end)at:set(k)b:set(i)return true,
'successfully set new theme'end function ae.export()local g,h=am(b),{}h.name=g.name h.uid=g.uid h.fromSet=g.fromSet h.
palette={}for i,j in g.palette do h.palette[i]=j:ToHex()end return ag:JSONEncode(h)end function ae.save(g)local h={ae.
find(g)}if h[1]then local i,j=h[2],{}j.name=i.name j.uid=i.uid j.fromSet=i.fromSet j.palette={}for k,o in i.palette do j
.palette[k]=o:ToHex()end i.palette=am(at)aq.writefile(`{ae.path}/{g}.json`,ag:JSONEncode(j))ae.set(g)return true else
return false end end function ae.get(g)local h=am(at)if h[g]then return h[g]else error(g.." isn't a theme element")end
end for g,h in f do ae[h]=an(function()return am(at)[h]end,40,1)end function ae.init()c=ae.create('darius',aj,'original'
)ae.set(c)for i,j in aq.listfiles(ae.path)do local k=ag:JSONDecode(aq.readfile(j))table.foreach(k.palette,function(o,p)
local q=Color3.fromHex(`#{p}`)k.palette[o]=q end)ae.create(k.name,k.palette,k.uid,true,k.fromSet)end end function ae.
onChange(i)table.insert(ar,i)end function ae.onCreate(i)table.insert(as,i)end function ae.getTheme()return am(b)end
function ae.getThemes()return d end function ae.getColors()return am(at)end return ae end)()end,function()local aa,ab,ac
=a(10)local ad return(function(...)return{background=Color3.fromHex'#2C2F33',background2=Color3.fromHex'#222427',text=
Color3.fromHex'#DCE1E5',text2=Color3.fromHex'#737C8A',selectedTab=Color3.fromHex'#1A1A1B',scrollBar=Color3.fromHex
'#DCE1E5',colorpickerBar=Color3.fromHex'#DCE1E5',notificationButton=Color3.fromHex'#222427',mobileButtonBackground=
Color3.fromHex'#DCE1E5',mobileButtonText=Color3.fromHex'#2C2F33',mobileButtonImage=Color3.fromHex'#2C2F33',
disabledBackground=Color3.fromHex'#2A2C31',disabledText=Color3.fromHex'#D6DCE0',toggled=Color3.fromHex'#DCE1E5',red=
Color3.fromRGB(255,105,97),orange=Color3.fromHex'#ff9b61'}end)()end,[12]=function()local aa,ab,ac=a(12)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed
,ac(ae.utilities)local as,at,b,c,d=ar.get,ar.animate,ar.typecheck,ar.customFont,ac(ae.simpleElements)local e,f,g,h=d.
UIPadding,d.UICorner,b(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{af.
DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible'})assert(g,table.concat(h,
'\n'))local i,j,k,o,p,q,r,s,t=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af.Name,af.Visible or an(
true),af.IsEnabled or an(true),af.DisabledText or an'Component Disabled',af.Callback local u=an(as(i.string)==as(k.tab).
uid)ao(i.string):onChange(function()u:set(as(i.string)==as(k.tab).uid)end)local v=at(function()return as(u)and 0 or 1
end,40,1)al'TextButton'{Interactable=aq(function()if not as(r)then return false end return as(u)end),Visible=aq(function
()if as(j.string)~=''and not string.find(as(p):lower(),as(j.string):lower())or not as(q)then return false end return
true end),Parent=o,Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.background2,BackgroundTransparency=v,[ap'Activated']=
function()if not as(r)then return end task.spawn(as(t))end,[am]={f(6),al'Frame'{ZIndex=2,Visible=aq(function()if not as(
r)then return true end return false end),BackgroundTransparency=at(function()return as(u)and 0.2 or 1 end,40,1),
BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={f(6),al'ImageLabel'{Size=UDim2.fromOffset(24,24),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.
disabledText,ImageTransparency=v},al'TextLabel'{FontFace=c('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,
Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=v,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,29,0.5,0),Text=s,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[am]={e(0,5)}}}},al'Frame'{
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am]={e(0,8),al'TextLabel'{FontFace=c('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,
0.5),Position=UDim2.new(0,0,0.5,0),Text=p,TextTransparency=v,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=ai.text2,ImageTransparency=v}}}}}local w={}function w.SetName(
x,y)local z,A=b({SetName=y},{SetName=''})assert(z,table.concat(A,'\n'))p:set(y)end function w.SetCallback(x,y)local z,A=
b({SetCallback=y},{SetCallback=function()end})assert(z,table.concat(A,'\n'))t:set(y)end function w.Fire(x)task.spawn(as(
t))end function w.Enable(x)r:set(true)end function w.Disable(x)r:set(false)end function w.Visible(x)q:set(true)end
function w.Invisible(x)q:set(false)end return w end end)()end,[13]=function()local aa,ab,ac=a(13)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed
,ac(ae.utilities)local as,at,b,c,d=ar.get,ar.animate,ar.typecheck,ar.customFont,ac(ae.simpleElements)local e,f,g,h,i,j,k
,o,p,q,r=d.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,d.UIPadding,d.
UICorner,af.Parent,af.tab,an(0),an(true)local s=al'Frame'{Visible=r,Parent=o,Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,[am]={e(f.LayoutOrder,g.Horizontal,h.Left,i.Center,UDim.new(0,3))}}local t,u=an(s.AbsoluteSize)
,{}function u.Button(v,w)local x,y=b(w,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end},{w
.IsEnabled and''or'IsEnabled',w.Visible and''or'Visible',w.DisabledText and''or'DisabledText'})assert(x,table.concat(y,
'\n'))local z,A,B,C,D,E,F,G=ah.find'selectedTab',ah.find'searchText',ah.add(w),w.Name,w.Callback,w.IsEnabled or an(true)
,w.DisabledText or an'Component Disabled',w.Visible or an(true)local H=an(as(z.string)==as(p).uid)ao(z.string):onChange(
function()H:set(as(z.string)==as(p).uid)end)local I=at(function()return as(H)and 0 or 1 end,40,1)al'TextButton'{
Interactable=aq(function()if not as(E)then return false end return as(H)end),Visible=aq(function()if as(A.string)~=''and
not string.find(as(C):lower(),as(A.string):lower())or not as(G)then return false end return true end),Size=aq(function()
return UDim2.new(1/as(q)-(as(q)-1==0 and 0 or((((as(q)-1)*3)/as(q))/as(t).X)),0,0,36)end),Parent=s,BackgroundColor3=ai.
background2,BackgroundTransparency=I,[ap'Activated']=function()if not as(E)then return end task.spawn(as(D))end,[am]={k(
6),al'Frame'{ZIndex=2,Visible=aq(function()if not as(E)then return true end return false end),BackgroundTransparency=at(
function()return as(H)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[am]={k(6)
,al'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=I},al'TextLabel'{FontFace=c(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=I,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=F,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true,[am]={j(0,5)}}}},al'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[am
]={j(0,8),al'TextLabel'{FontFace=c('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-32,0,18),BackgroundTransparency=
1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=C,
TextTransparency=I,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al'ImageLabel'{Size=UDim2.fromOffset(16,16),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Image=aj.fingerprint,ImageColor3=
ai.text2,ImageTransparency=at(function()return as(H)and 0.5 or 1 end,40,1)}}}}}if as(G)then q:set(as(q)+1)end ao(G):
onChange(function()if as(G)then q:set(as(q)+1)else q:set(as(q)-1)end end)local J={}function J.SetName(K,L)local M,N=b({
SetName=L},{SetName=''})assert(M,table.concat(N,'\n'))C:set(L)end function J.SetCallback(K,L)local M,N=b({SetCallback=L}
,{SetCallback=function()end})assert(M,table.concat(N,'\n'))D:set(L)end function J.Fire(K)task.spawn(as(D))end function J
.Enable(K)E:set(true)end function J.Disable(K)E:set(false)end function J.Visible(K)G:set(true)end function J.Invisible(K
)G:set(false)end return J end function u.Visible(v)r:set(true)end function u.Invisible(v)r:set(false)end return u end
end)()end,[14]=function()local aa,ab,ac=a(14)local ad return(function(...)local ae=ab.Parent.Parent return function(af)
local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an,ao=al.
RunService,al.UserInputService,ag.Fusion local ap,aq,ar,as,at,b,c,d=ao.New,ao.Children,ao.Value,ao.Observer,ao.OnEvent,
ao.Computed,ao.Ref,ac(ae.utilities)local e,f,g,h,i,j,k=d.get,d.animate,d.typecheck,d.customFont,d.randomString,d.
connections,ac(ae.simpleElements)local o,p,q,r,s,t,u,v,w,x=k.UIListLayout,k.UIPadding,k.UITextSizeConstraint,k.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,g(af,{Name='',DisabledText='',
IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Color=Color3.new(),Transparency=0,HideTransparency=true,
IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af
.FLAG and''or'FLAG',af.Color and''or'Color',af.Transparency and''or'Transparency',af.HideTransparency and''or
'HideTransparency',af.IgnoreConfig and''or'IgnoreConfig'})assert(w,table.concat(x,'\n'))local y,z,A,B,C,D,E,F,G,H,I,J,K,
L,M,N=ah.find'selectedTab',ah.find'searchText',ah.find'useConfig',ah.find'absoluteOffset',ah.find'currentPicker',ah.add(
af),af.Parent,af.Name,af.DisabledText or ar'Component Disabled',af.IsEnabled or ar(true),af.Visible or ar(true),af.
Callback,af.Color or ar(Color3.new(1)),af.IgnoreConfig or ar(false),af.Transparency or ar(0),af.HideTransparency or ar(
false)local O,P=(af.FLAG or ar(D.uid))if e(O)~=''then P=ak.register(e(O),{color=ar(Color3.new(1)),transparency=ar(0)},
'colorpicker',e(O)==D.uid)P.user.Value={e(P.status.color),e(P.status.transparency)}end local Q,R=P.status.color,P.status
.transparency as(Q):onChange(function()if e(H)then task.spawn(e(J),e(Q),e(R))end end)as(R):onChange(function()if e(H)
then task.spawn(e(J),e(Q),e(R))end end)local S=ar(e(y.string)==e(D.tab).uid)as(y.string):onChange(function()S:set(e(y.
string)==e(D.tab).uid)end)local T,U,V,W,X,Y,Z,_,au,av,aw,ax,ay,az,aA,aB,aC,aD=f(function()return e(S)and 0 or 1 end,40,1
),ar(),ar(0),ar(),ar(0),ar(),ar(0),ar(),ar(false),ar(),ar(false),ar(),ar(false),ar(0),ar(0),(ar(0))local function aE()
return{Name=F,Children={o(s.LayoutOrder,t.Vertical,u.Center,v.Top,UDim.new(0,5)),ap'TextButton'{Size=UDim2.fromOffset(
224,224),[c]=_,[at'InputBegan']=function(aF)if aF.UserInputType~=Enum.UserInputType.MouseButton1 then return end au:set(
true)local aG aG=aF.Changed:Connect(function()if aF.UserInputState==Enum.UserInputState.End or aF.UserInputState.Cancel
then au:set(false)aG:Disconnect()end end)end,[aq]={ap'UIGradient'{Color=b(function()return ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(e(az),1,1))}end)},ap
'Frame'{Size=UDim2.fromScale(1,1),[aq]={ap'UIGradient'{Rotation=270,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))},Transparency=b(function()return
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}end)}}},ap'ImageLabel'{ZIndex=2,
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromOffset(10,10),ImageColor3=b(
function()return Color3.fromHSV(0,0,1-e(aB))end),Position=b(function()return UDim2.fromScale(e(aA),1-e(aB))end),[aq]={ap
'ImageLabel'{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Image=aj.circle,Size=UDim2.fromScale(0.9
,0.9),ImageColor3=b(function()return Color3.fromHSV(e(az),1,1)end),Position=UDim2.fromScale(0.5,0.5)}}}}},ap'TextButton'
{Size=UDim2.new(1,0,0,24),[at'InputBegan']=function(aF)if aF.UserInputType~=Enum.UserInputType.MouseButton1 then return
end aw:set(true)local aG aG=aF.Changed:Connect(function()if aF.UserInputState==Enum.UserInputState.End or aF.
UserInputState.Cancel then aw:set(false)aG:Disconnect()end end)end,[c]=av,[aq]={ap'UIGradient'{Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.
colorpickerBar,Size=UDim2.new(0,2,1,0),Position=b(function()return UDim2.fromScale(1-e(az),0.5)end)}}},ap'ImageButton'{
Visible=not e(N),ZIndex=2,Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Image='rbxassetid://15612242981',ScaleType=
Enum.ScaleType.Crop,[at'InputBegan']=function(aF)if aF.UserInputType~=Enum.UserInputType.MouseButton1 then return end ay
:set(true)local aG aG=aF.Changed:Connect(function()if aF.UserInputState==Enum.UserInputState.End or aF.UserInputState.
Cancel then ay:set(false)aG:Disconnect()end end)end,[c]=ax,[aq]={ap'Frame'{Size=UDim2.fromScale(1,1),[aq]={ap
'UIGradient'{Color=b(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,e(Q)),ColorSequenceKeypoint.new(1,e(
Q))}end),Transparency=b(function()return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1
,1)}end)}}},ap'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=ai.colorpickerBar,Size=UDim2.new(0,2,1,0),Position
=b(function()return UDim2.fromScale(e(R),0.5)end)}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[aq]={
o(s.LayoutOrder,t.Horizontal,u.Left,v.Center,UDim.new(0,4)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.
AutomaticSize.X,Text='RGB:',TextColor3=ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=h('Montserrat',Enum.
FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Right},ap'TextBox'{Name=i(8),BackgroundTransparency=1,Size=UDim2.
new(0,42,0,16),PlaceholderText='RGB',PlaceholderColor3=ai.text2,AutomaticSize=Enum.AutomaticSize.X,TextColor3=ai.text,
Text=b(function()local aF={e(Q).R,e(Q).G,e(Q).B}for aG,aH in aF do aF[aG]=math.floor(math.clamp(aH*255,0,255))end return
table.concat(aF,', ')end),TextScaled=true,FontFace=h('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,
TextXAlignment=Enum.TextXAlignment.Right,[c]=Y,[at'Changed']=function(aF)local aG=e(Y)if aF=='TextBounds'and aG and aG.
TextBounds then Z:set(aG.TextBounds.X)end end,[at'FocusLost']=function()local aF=e(Y)local aG,aH=aF.Text:gsub(' ',''),{
e(Q).R,e(Q).G,e(Q).B}for aI,aJ in aH do aH[aI]=math.floor(math.clamp(aJ*255,0,255))end local aK,aL,aM=table.concat(aH,
', '),pcall(function()local aK=string.split(aG,',')table.foreach(aK,function(aL,aM)if not tonumber(aM)then return nil
end aK[aL]=math.clamp(aM,0,255)end)return Color3.fromRGB(aK[1],aK[2],aK[3])end)if aL and aM then Q:set(aM)az:set(({e(Q):
ToHSV()})[1])aA:set(({e(Q):ToHSV()})[2])aB:set(({e(Q):ToHSV()})[3])else aF.Text=aK end end,[aq]={q(1,16),ap
'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(42,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=f(function()return UDim2.fromOffset(math.clamp(e(Z),0,110),
2)end,40,1),[aq]={r(0,1)}}}}}}},ap'Frame'{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[aq]={o(s.LayoutOrder,t.
Horizontal,u.Left,v.Center,UDim.new(0,5)),{ap'TextLabel'{Size=UDim2.new(0,0,0,16),AutomaticSize=Enum.AutomaticSize.X,
Text='HSV:',TextColor3=ai.text2,BackgroundTransparency=1,TextSize=16,FontFace=h('Montserrat',Enum.FontWeight.Bold),
TextXAlignment=Enum.TextXAlignment.Right},ap'TextBox'{Name=i(8),BackgroundTransparency=1,Size=UDim2.new(0,36,0,16),
AutomaticSize=Enum.AutomaticSize.X,PlaceholderText='HSV',PlaceholderColor3=ai.text2,TextColor3=ai.text,Text=b(function()
local aF={e(Q):ToHSV()}for aG,aH in aF do aF[aG]=math.floor(aH*100)/100 end return table.concat(aF,', ')end),TextScaled=
true,FontFace=h('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[c]=W,
[at'Changed']=function(aF)local aG=e(W)if aF=='TextBounds'and aG and aG.TextBounds then X:set(aG.TextBounds.X)end end,[
at'FocusLost']=function()local aF=e(W)local aG,aH=aF.Text:gsub(' ',''),{e(Q):ToHSV()}for aI,aJ in aH do aH[aI]=math.
floor(aJ*100)/100 end local aK,aL,aM=table.concat(aH,', '),pcall(function()local aK=string.split(aG,',')table.foreach(aK
,function(aL,aM)if not tonumber(aM)then return nil end end)return Color3.fromHSV(unpack(aK))end)if aL and aM then Q:set(
aM)az:set(({e(Q):ToHSV()})[1])aA:set(({e(Q):ToHSV()})[2])aB:set(({e(Q):ToHSV()})[3])else aF.Text=aK end end,[aq]={q(1,16
),ap'UISizeConstraint'{MaxSize=Vector2.new(110,16),MinSize=Vector2.new(36,16)},ap'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=ai.text2,Position=UDim2.fromScale(1,1),Size=f(function()return UDim2.fromOffset(math.clamp(e(X),36,110)
,2)end,40,1),[aq]={r(0,1)}}}}}}}}}end as(H):onChange(function()if not e(H)and typeof(aC)=='Instance'then aC:Destroy()end
end)ap'Frame'{Interactable=b(function()if not e(H)then return false end return e(S)end),Visible=b(function()if e(z.
string)~=''and not string.find(e(F):lower(),e(z.string):lower())or not e(I)then return false end return true end),Parent
=E,Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,BackgroundColor3=ai.background2,[aq]={r(6),ap'Frame'{ZIndex=3,
Visible=b(function()if not e(H)then return true end return false end),BackgroundTransparency=f(function()return e(S)and
0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={r(6),ap'ImageLabel'{Size=UDim2
.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=T},ap'TextLabel'{FontFace=h('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=T,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=G,TextXAlignment=Enum.TextXAlignment.Left,RichText=
true,[aq]={p(0,5)}}}},ap'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[aq]={o(s.LayoutOrder,t.Horizontal,u.
Left,v.Bottom,UDim.new(0,3)),ap'Frame'{Size=UDim2.new(1,-103,1,0),BackgroundColor3=ai.background2,BackgroundTransparency
=T,[aq]={p(9,8),r(6),o(s.LayoutOrder,t.Horizontal,u.Left,v.Top),ap'TextLabel'{FontFace=h('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5
),Position=UDim2.new(0,0,0.5,0),Text=F,TextTransparency=T,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}},ap
'TextButton'{Interactable=b(function()if not e(H)then return false end return e(S)end),Size=UDim2.new(0,100,0,36),
BackgroundColor3=ai.background2,BackgroundTransparency=T,[at'Activated']=function()if typeof(e(C.module))=='Instance'
then e(C.module):Destroy()end aC,aD=ac(ab.Parent.module)(aE())C:update('module',aC)end,[aq]={p(0,8),r(6),o(s.LayoutOrder
,t.Horizontal,u.Right,v.Center,UDim.new(0,5)),ap'Frame'{Size=UDim2.new(1,-29,0,36),BackgroundTransparency=1,[aq]={o(s.
LayoutOrder,t.Horizontal,u.Right,v.Center,UDim.new(0,4)),ap'TextBox'{Interactable=b(function()if not e(H)then return
false end return e(S)end),Name=i(8),BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),PlaceholderText='Hex',
PlaceholderColor3=ai.text2,TextColor3=ai.text,TextTransparency=T,Text=b(function()return'#'..e(Q):ToHex()end),TextScaled
=true,FontFace=h('Montserrat',Enum.FontWeight.Bold),ClearTextOnFocus=true,TextXAlignment=Enum.TextXAlignment.Right,[at
'Changed']=function(aF)local aG=e(U)if aF=='TextBounds'and aG and aG.TextBounds then V:set(aG.TextBounds.X)end end,[at
'FocusLost']=function()local aF=e(U)local aG=aF.Text:gsub('[^%w#]','')if not string.find(aG,'#')then aG='#'..aG end if
string.len(aG)~=7 then aF.Text='#'..e(Q):ToHex()else local aH,aI=pcall(function()return Color3.fromHex(aG)end)if aH then
Q:set(aI)else aF.Text='#'..e(Q):ToHex()end end end,[c]=U,[aq]={q(1,16),ap'Frame'{AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3=ai.text2,BackgroundTransparency=f(function()if e(S)then return 0.5 end return 1 end,40,1),Position=
UDim2.fromScale(1,1),Size=f(function()return UDim2.fromOffset(math.clamp(e(V),0,98),2)end,40,1),[aq]={r(0,1)}}}}}},ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),Image=aj.paint,ImageColor3=Q,BackgroundTransparency=1,ImageTransparency=f(
function()return not e(S)and 1 or e(R)end,40,1),[aq]={r(6)}}}}}}}}j.add(am.Heartbeat:Connect(function()if e(au)then
local aF=e(_)local aG=an:GetMouseLocation()-aF.AbsolutePosition-Vector2.new(0,e(B.number))aG=Vector2.new(math.clamp(aG.X
,0,aF.AbsoluteSize.X),math.clamp(aG.Y,0,aF.AbsoluteSize.Y))aA:set(aG.X/aF.AbsoluteSize.X)aB:set((aF.AbsoluteSize.Y-aG.Y)
/aF.AbsoluteSize.Y)Q:set(Color3.fromHSV(e(az),e(aA),e(aB)))end if e(aw)then local aF=e(av)local aG=an:GetMouseLocation()
-aF.AbsolutePosition-Vector2.new(0,e(B.number))aG=Vector2.new(math.clamp(aG.X,0,aF.AbsoluteSize.X),0)az:set((aF.
AbsoluteSize.X-aG.X)/aF.AbsoluteSize.X)Q:set(Color3.fromHSV(e(az),e(aA),e(aB)))end if e(ay)then local aF=e(ax)local aG=
an:GetMouseLocation()-aF.AbsolutePosition-Vector2.new(0,e(B.number))aG=Vector2.new(math.clamp(aG.X,0,aF.AbsoluteSize.X),
0)R:set(aG.X/aF.AbsoluteSize.X)end end))if e(A.boolean)and not e(L)then P.file:Connect(function(aF)local aG,aH=true,true
if aF.color~=nil then if string.find(aF.color,',')then local aI=string.split(aF.color:gsub(' ',''),',')table.foreach(aI,
function(aJ,aK)aI[aJ]=tonumber(aK)end)Q:set(Color3.new(unpack(aI)))else Q:set(Color3.fromHex(`#{aF.color}`))end aG=false
end if aF.transparency~=nil then R:set(tonumber(aF.transparency))aH=false end if aG then Q:set(e(K))end if aH then R:
set(e(M))end az:set(({e(Q):ToHSV()})[1])aA:set(({e(Q):ToHSV()})[2])aB:set(({e(Q):ToHSV()})[3])end)if P.private then Q:
set(e(K))R:set(e(M))end else Q:set(e(K))R:set(e(M))end az:set(({e(Q):ToHSV()})[1])aA:set(({e(Q):ToHSV()})[2])aB:set(({e(
Q):ToHSV()})[3])local aF={}function aF.SetName(aG,aH)local aI,aJ=g({SetName=aH},{SetName=''})assert(aI,table.concat(aJ,
'\n'))F:set(aH)end function aF.SetColor(aG,aH)local aI,aJ=g({SetColor=aH},{SetColor=Color3.new()})assert(aI,table.
concat(aJ,'\n'))Q:set(aH)az:set(({e(Q):ToHSV()})[1])aA:set(({e(Q):ToHSV()})[2])aB:set(({e(Q):ToHSV()})[3])end function
aF.SetTransparency(aG,aH)local aI,aJ=g({SetTransparency=aH},{SetTransparency=0})assert(aI,table.concat(aJ,'\n'))R:set(aH
)end function aF.Enable(aG)H:set(true)end function aF.Disable(aG)H:set(false)end function aF.Visible(aG)I:set(true)end
function aF.Invisible(aG)I:set(false)end return aF end end)()end,[15]=function()local aa,ab,ac=a(15)local ad return(
function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,
ag.Fusion local ak,al,am,an,ao=aj.New,aj.Children,aj.Value,aj.Observer,ac(ae.utilities)local ap,aq,ar,as,at=ao.get,ao.
animate,ah.find'selectedTab',ah.add(af),af.Parent local au=am(ap(ar.string)==ap(as.tab).uid)an(ar.string):onChange(
function()au:set(ap(ar.string)==ap(as.tab).uid)end)local av=aq(function()return ap(au)and 0 or 1 end,40,1)ak'Frame'{
Parent=at,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,[al]={ak'Frame'{Size=UDim2.new(1,0,0,2),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=ai.text2,BackgroundTransparency=av}}}end end)()end,[16]=
function()local aa,ab,ac=a(16)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,ar,as,at=al.New,al.
Children,al.Value,al.Observer,al.OnEvent,al.Computed,al.Ref,ac(ae.utilities)local au,av,aw,ax,ay=at.get,at.animate,at.
typecheck,at.customFont,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH=ay.UIListLayout,ay.UIPadding,ay.UICorner,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,aw(af,{Name='',DisabledText='',
IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Items={},Multiselect=true,Regex=function()end,IgnoreConfig=
true,Alphabetical=true,AlwaysOpen=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.
Visible and''or'Visible',af.FLAG and''or'FLAG',af.Multiselect and''or'Multiselect',af.Regex and''or'Regex',af.
IgnoreConfig and''or'IgnoreConfig',af.Alphabetical and''or'Alphabetical',af.AlwaysOpen and''or'AlwaysOpen'})assert(aG,
table.concat(aH,'\n'))aG,aH=aw(af,{Default=af.Multiselect and{}or''},{af.Default and''or'Default'})assert(aG,table.
concat(aH,'\n'))if af.Regex then assert(typeof(af.Regex'')=='string','The Regex function must always return a string')
end local aI,aJ,aK,aL,aM,b,c,d,e,f,g,h,i,j,k,o,p=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),
af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible or ao(true),af.Callback,
ao{},af.Multiselect or ao(false),af.Default,af.IgnoreConfig or ao(false),af.Alphabetical or ao(false),af.AlwaysOpen or
ao(false),af.Regex or ao(function(aI)return aI end)local q,r=(af.FLAG or ao(aL.uid))if au(q)~=''then r=ak.register(au(q)
,{items=ao{},item=ao'',multiselect=au(h)},'dropdown',au(q)==aL.uid)r.user.Value=au(h)and au(r.status.items)or au(r.
status.item)end local s,t,u,v,w,x,y,z=r.status.items,r.status.item,ao(),ao(false),ao(au(h)and{}or''),ao{},ao{},ao(false)
ap(s):onChange(function()if#au(s)==#au(g)then z:set(true)else z:set(false)end local A={}for B,C in au(s)do table.insert(
A,au(p)(C))end task.wait()task.spawn(au(f),A)w:set(au(s))end)ap(t):onChange(function()task.wait()task.spawn(au(f),au(p)(
au(t)))w:set(au(p)(au(t)))end)local A=ao(au(aI.string)==au(aL.tab).uid)ap(aI.string):onChange(function()A:set(au(aI.
string)==au(aL.tab).uid)end)local B=av(function()return au(A)and 0 or 1 end,40,1)am'Frame'{Parent=aM,Visible=ar(function
()if au(aK.string)~=''and not string.find(au(b):lower(),au(aK.string):lower())or not au(e)then return false end return
true end),Size=av(function()if au(v)then return UDim2.new(1,0,0,76+(au(h)and(42)or 6)+math.clamp((#au(g)*34),34,136))end
return UDim2.new(1,0,0,36)end,40,1),BackgroundColor3=ai.background2,BackgroundTransparency=B,ClipsDescendants=true,[an]=
{aB(6),az(aC.LayoutOrder,aD.Vertical,aE.Left,aF.Top,UDim.new(0,4)),am'TextButton'{Interactable=ar(function()if not au(d)
then return false end return au(A)end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[aq'Activated']=function()if
au(o)then return end v:set(not au(v))end,[an]={am'Frame'{ZIndex=2,Visible=ar(function()if not au(d)then return true end
return false end),BackgroundTransparency=av(function()return au(A)and 0.2 or 1 end,40,1),BackgroundColor3=ai.
disabledBackground,Size=UDim2.fromScale(1,1),[an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,
ImageTransparency=B},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.
new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=B,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,29,0.5,0),Text=ar(function()return au(c)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[an]={aA(
0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={aA(8),am'TextLabel'{FontFace=ax('Montserrat'
,Enum.FontWeight.Bold),Size=UDim2.new(1,-39,0,18),BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if au(h)then return au(b)..' '..tostring(
#au(s))..'/'..tostring(#au(g))end if typeof(au(w))=='table'then return au(b)end if au(y)[au(w)]then return`{au(b)}: {au(
y)[au(w)]}`end return`{au(b)}: {au(w)}`end),TextTransparency=B,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},am
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=1,Image=ar(function()return au(h)and aj.multiDropdown or aj.normalDropdown end),ImageColor3=ai.
text2,ImageTransparency=B}}}}},am'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,[an]={aA(0,6),am'TextBox'{
Size=UDim2.fromScale(1,1),BackgroundColor3=ai.background,BackgroundTransparency=B,FontFace=ax('Montserrat',Enum.
FontWeight.Bold),TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,PlaceholderText='Search',
TextColor3=ai.text,TextTransparency=B,[as]=u,[aq'Changed']=function(C)local D=au(u)if C=='Text'and D and D.Text then
local E=D.Text for F,G in au(x)do if string.find(au(p)(G.Name):lower(),E:lower())or E==''then G.Visible=true else G.
Visible=false end end end end,[an]={am'UITextSizeConstraint'{MinTextSize=0,MaxTextSize=16},aB(4),aA(6,6,6,6)}}}},am
'Frame'{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,Visible=h,[an]={aA(6,6,0,6),am'TextButton'{Interactable=h,Size
=UDim2.new(1,0,0,24),BackgroundTransparency=B,BackgroundColor3=ai.background,[aq'Activated']=function()local C={}if not
au(z)then for D,E in au(g)do E=typeof(E)=='table'and E.Value or E table.insert(C,au(p)(E))end end s:set(C)end,[an]={aB(4
),aA(8),am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,
TextColor3=ai.text2,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=ar(function()if
au(z)then return'Deselect All'end return'Select All'end),TextTransparency=B,TextXAlignment=Enum.TextXAlignment.Left,
RichText=true}}}}},am'ScrollingFrame'{ZIndex=3,Size=ar(function()return UDim2.new(1,-6,0,math.clamp((#au(g)*34),34,136))
end),BackgroundTransparency=1,ScrollBarThickness=ar(function()return#au(g)>4 and 6 or 0 end),ScrollBarImageColor3=ai.
scrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[an]={aA(6,ar(function()return#au(g)>4
and UDim.new(0,12)or UDim.new(0,0)end),0,6),az(au(k)and aC.Name or aC.LayoutOrder,aD.Vertical,aE.Center,aF.Top,UDim.new(
0,6)),x}}}}ap(g):onChange(function()local C={}for D,E in au(g)do local F,G,H,I=(ao(false))if typeof(E)=='table'then
local J,K=aw(E,{DisplayValue='',Value='',Image=''},{E.Image and''or'Image',E.DisplayValue and''or'DisplayValue'})assert(
J,table.concat(K,'\n'))G=E.Value H=E.Image or nil I=E.DisplayValue or nil else local J,K=aw({Item=E},{Item=''})assert(J,
table.concat(K,'\n'))G=E end local J=au(p)(G)if I then local K=au(y)K[G]=I y:set(K)end ap(s):onChange(function()if table
.find(au(s),J)then F:set(true)else F:set(false)end end)ap(t):onChange(function()if au(t)==J then F:set(true)else F:set(
false)end end)local K=am'TextButton'{Name=`{I~=nil and I or G}`,Size=UDim2.new(1,0,0,28),BackgroundTransparency=B,
BackgroundColor3=ai.background,[aq'Activated']=function()if au(h)then local K=au(s)F:set(not au(F))if au(F)then table.
insert(K,J)else table.remove(K,table.find(K,J))end s:set(K)else t:set(J)if au(o)then return end v:set(false)end end,[an]
={aB(4),aA(8),az(aC.LayoutOrder,aD.Horizontal,aE.Left,aF.Center,UDim.new(0,6)),am'Frame'{Visible=ar(function()return au(
h)and true or false end),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),
BackgroundTransparency=B,BackgroundColor3=av(function()return au(F)and ai.get'toggled'or ai.get'selectedTab'end,40,1),[
an]={aB(6),am'ImageLabel'{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,Image=aj.check,ImageTransparency=av(function()if not au(A)then return 1 end if au(F)then return
0 end return 1 end,40,1),ImageColor3=ai.selectedTab}}},am'ImageLabel'{Visible=ar(function()return H and true or false
end),Size=UDim2.fromOffset(18,18),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,
Image=H,ImageTransparency=B,ImageColor3=ai.text2},am'TextLabel'{FontFace=ax('Montserrat',Enum.FontWeight.Bold),Size=ar(
function()return au(h)and UDim2.new(1,-48,0,16)or UDim2.new(1,-24,0,16)end),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=I or G,TextTransparency=B,
TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}table.insert(C,K)end x:set(C)end)g:set(au(af.Items))if au(o)then
v:set(true)end if au(aJ.boolean)and not au(j)then r.file:Connect(function(C)local D=true if C~=nil then D=false end if
au(h)then s:set(C)else t:set(C)end if D then if au(h)then if i and#au(i)>0 then s:set(au(i))end else if i then t:set(au(
i))end end end end)if r.private then if au(h)then if i and#au(i)>0 then s:set(au(i))end else if i then for C,D in au(g)
do if typeof(D)=='table'and D.Value==au(i)then t:set(au(i))elseif D==au(i)then t:set(au(i))end end end end end else if
au(h)then if i and#au(i)>0 then s:set(au(i))end else if i then t:set(au(i))end end end local C={}function C.SetName(D,E)
local F,G=aw({SetName=E},{SetName=''})assert(F,table.concat(G,'\n'))b:set(E)end function C.SetItems(D,E)local F,G=aw({
SetItems=E},{SetItems={}})assert(F,table.concat(G,'\n'))g:set(E)local H,I={},false for J,K in au(g)do local L if typeof(
K)=='table'then L=K.Value else L=K end local M=au(p)(L)if au(h)then if typeof(au(w))=='table'and table.find(au(w),M)then
table.insert(H,M)I=true end else if au(w)==M then I=true t:set(M)break end end end if I then if au(h)then s:set(H)end
else if au(h)then s:set{}else t:set''end end end function C.SelectItem(D,E)assert(not au(h),
':SelectItem requires Multiselect to be false')local F,G=aw({SelectItem=E},{SelectItem=''})assert(F,table.concat(G,'\n')
)local H=false for I,J in au(g)do local K=J if typeof(J)=='table'then K=J.Value end local L=au(p)(E)if au(p)(K)==L then
H=true break end end assert(H,":SelectItem couldn't find "..E)t:set(E)end function C.SelectItems(D,E)assert(au(h),
':SelectItems requires Multiselect to be true')local F,G=aw({SelectItems=E},{SelectItems={}})assert(F,table.concat(G,
'\n'))for H,I in E do local J=false for K,L in au(g)do local M=typeof(L)=='table'and au(p)(L.Value)or au(p)(L)if I==M
then J=true break end end if J then E[H]=au(p)(I)else table.remove(E,H)end end s:set(E)end function C.Enable(D)d:set(
true)end function C.Disable(D)d:set(false)end function C.Visible(D)e:set(true)end function C.Invisible(D)e:set(false)end
return C end end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.services local am,an
=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an.Children,an.Value,an.Observer,an.OnEvent,an.Computed
,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au.typecheck,au.connections,au.customFont,au.references
,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,b=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.
UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(
af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',Bind=Enum.KeyCode.Q,
IgnoreConfig=true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af
.FLAG and''or'FLAG',af.Bind and''or'Bind',af.IgnoreConfig and''or'IgnoreConfig'})assert(aM,table.concat(b,'\n'))local c,
d,e,f,g,h,i,j,k,o,p,q,r,s,t,u,v=ah.find'selectedTab',ah.find'currentBinds',ah.find'useConfig',ah.find'searchText',ah.
find'isMobile',ah.find'instanceName',ah.find'isListening',ah.find'bindData',ah.add(af),af.Parent,af.Name,af.DisabledText
or aq'Component Disabled',af.IsEnabled or aq(true),af.Visible or aq(true),af.Callback,af.Bind,af.IgnoreConfig or aq(
false)local w,x=(af.FLAG or aq(k.uid))if av(w)~=''then x=ak.register(av(w),{coordinate=aq(nil),keycode=aq(nil),mobile=
av(g.boolean)},'keybind',av(w)==k.uid)x.user.Value=av(g.boolean)and av(x.status.coordinate)or av(x.status.keycode)end
local y=aq()local function z(A:EnumItem,B:string)local C,D=av(d.binds),av(j.bindData)if table.find(C,A)then aL((
'Key %s is already in use. %s'):format(A.Name,B))else table.insert(C,A)if av(y)then table.remove(C,table.find(C,av(y)))D
[av(y).Name]=nil end y:set(A)D[av(y).Name]={bind=av(y),name=av(p)}j:update('bindData',D)d:update('binds',C)x.status.
keycode:set(av(y).Name)end end local A=aq(av(c.string)==av(k.tab).uid)ar(c.string):onChange(function()A:set(av(c.string)
==av(k.tab).uid)end)local B,C=aw(function()return av(A)and 0 or 1 end,40,1),aq(false)local D=am.InputBegan:Connect(
function(D,E)if av(g.boolean)then return end if av(C)then if D.KeyCode and D.KeyCode~=Enum.KeyCode.Unknown then z(D.
KeyCode,'From input box')end C:set(false)task.wait()i:update('boolean',false)else if D.KeyCode and D.KeyCode==av(y)and
not E and not av(i.boolean)and av(r)then task.spawn(av(t))end end end)ay.add(D)local E,F,G=(aq(false))G=ao'TextButton'{
Visible=at(function()if not av(r)then return av(r)end return av(E)end),Parent=aA.get(av(h.name)),Size=UDim2.fromOffset(
60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=p,FontFace=az(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground,
BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if F then F:Disconnect()F=nil x.status.
coordinate:set(G.AbsolutePosition)else task.spawn(av(t))end end,[ap]={aD(4),aE(16),aF(0,16),ao'ImageLabel'{ZIndex=0,
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1
,Image=av(g.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,ImageTransparency=0.8}}}ao'Frame'{
Parent=o,Visible=at(function()if av(f.string)~=''and not string.find(av(p):lower(),av(f.string):lower())or not av(s)then
return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[ap]={ao'Frame'{ZIndex=2,Visible=at(
function()if not av(r)then return true end return false end),BackgroundTransparency=aw(function()return av(A)and 0.2 or
1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.
fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.lock,
ImageColor3=ai.disabledText,ImageTransparency=B},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=B,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()return av(q)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={
aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)),ao'TextButton'{Interactable=at(function()if not av(r)
then return false end return av(A)end),Size=UDim2.new(0.225,0,1,0),BackgroundColor3=ai.background2,
BackgroundTransparency=B,[as'Activated']=function()if av(g.boolean)then E:set(true)F=aB(G,15)return end C:set(true)i:
update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,5)),ao
'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(g.boolean)and aj.finger or aj.
command,ImageColor3=ai.text2,ImageTransparency=B},ao'TextLabel'{Visible=not av(g.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=B,Text=at(function()return av(C)and'Listening'or av(y)and av(
y).Name or'Waiting'end)},ao'TextLabel'{Visible=av(g.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.
text2,Text=at(function()return av(E)and'Move Bind'or'Place Bind'end),TextTransparency=B}}},ao'TextButton'{Visible=E,
Interactable=at(function()if not av(r)then return false end return av(A)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=B,[as'Activated']=function()E:set(false)G.Position=UDim2.
fromScale(0.5,0.5)x.status.coordinate:set(G.AbsolutePosition)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=
ai.red,ImageTransparency=B}}},ao'Frame'{Size=at(function()return UDim2.new(0.775,av(E)and-42 or-3,0,36)end),
BackgroundColor3=ai.background2,BackgroundTransparency=B,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'TextLabel'{
FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),BackgroundTransparency=1,TextColor3=ai.text,
TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),Text=p,TextTransparency=B,TextXAlignment=
Enum.TextXAlignment.Left,RichText=true}}}}}}}}}if av(e.boolean)and not av(v)then x.file:Connect(function(H)local I=true
if H.keycode~=nil then if av(y)and av(y).Name==H.keycode then return end local J,K=pcall(function()return Enum.KeyCode[H
.keycode]end)if J then z(K,'File1')end I=false end if I then if u then x.status.keycode:set(av(u).Name)end end if av(g.
boolean)and H.coordinate then G.Position=UDim2.fromOffset(H.coordinate.X+30,H.coordinate.Y+30)E:set(true)end end)if x.
private then if u then x.status.keycode:set(av(u).Name)end end else if u then x.status.keycode:set(av(u).Name)end end
local H={}function H.SetName(I,J)local K,L=ax({SetName=J},{SetName=''})assert(K,table.concat(L,'\n'))p:set(J)end
function H.SetBind(I,J:EnumItem)local K,L=ax({SetBind=J},{SetBind=Enum.keyCode.C})assert(K,table.concat(L,'\n'))z(J,
'At :SetBind')end function H.Enable(I)r:set(true)end function H.Disable(I)r:set(false)end function H.Visible(I)s:set(
true)end function H.Invisible(I)s:set(false)end return H end end)()end,[18]=function()local aa,ab,ac=a(18)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.
themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,ar=ak.New,ak.Children,ak.Value,ak.Computed,ak.Observer,ak.OnEvent
,ac(ae.simpleElements)local as,at,au,av,aw,ax,ay,az,aA=ar.UICorner,ar.UIPadding,ar.UITextSizeConstraint,ar.UIListLayout,
Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities)local aB,aC,aD,aE,aF,
aG,aH,aI,aJ,aK,aL,aM=aA.get,aA.animate,aA.getStringBounds,aA.customFont,ah.find'selectedTab',ah.find'searchText',ah.find
'currentBinds',ah.find'bindData',ah.add(af),af.Parent,an'Active Keybinds',an''local b=an(aB(aF.string)==aB(aJ.tab).uid)
ap(aF.string):onChange(function()b:set(aB(aF.string)==aB(aJ.tab).uid)end)local c,d=aC(function()return aB(b)and 0 or 1
end,40,1),an(0)task.spawn(function()d:set(aD(aB(aM),{Font=aE('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.
round(aB(aK).AbsoluteSize.X)}).Y)end)aB(aK).Changed:Connect(function(e)if e:lower()=='absolutesize'then d:set(aD(aB(aM),
{Font=aE('Montserrat',Enum.FontWeight.Medium),Size=16,Width=math.round(aB(aK).AbsoluteSize.X)}).Y)end end)ap(aM):
onChange(function()d:set(aD(aB(aM),{Font=aE('Montserrat',Enum.FontWeight.Bold),Size=16,Width=math.round(aB(aK).
AbsoluteSize.X)}).Y)end)local function e(f)local g={}table.foreach(f,function(h,i)g[h]=i.Name end)return table.concat(g,
', ')end local f,g,h=(an'Active Keybinds')h,g=ac(ab.Parent.module){Name=f,Children={}}local function i(j)local k,o={av(
aw.LayoutOrder,ax.Vertical,ay.Center,az.Top,UDim.new(0,5))},aB(aI.bindData)for p,q in aB(aH.binds)do local r=o[q.Name]
table.insert(k,al'TextLabel'{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,TextColor3=ai.text,FontFace=aE(
'Montserrat',Enum.FontWeight.Regular),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,Text=ao(function()if r.
boolean then return`[{r.bind.Name}] {r.name} (<i>{string.upper(tostring(aB(r.boolean)))}</i>)`end return`[{r.bind.Name}] {
r.name}`end)})end g(k)end al'TextButton'{Visible=ao(function()if aB(aG.string)~=''and not string.find(aB(aL):lower(),aB(
aG.string):lower())and not string.find(aB(aM):lower(),aB(aG.string):lower())then return false end return true end),
BackgroundColor3=ai.background2,Parent=aK,BackgroundTransparency=c,Size=ao(function()return UDim2.new(1,0,0,36+aB(d))end
),AutomaticSize=Enum.AutomaticSize.Y,[aq'Activated']=function()if typeof(h)=='Instance'then h:Destroy()h=nil end h,g=ac(
ab.Parent.module){Name=f,Children={}}i(aB(aH.binds))end,[am]={as(6),at(6),al'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(
20,20),BackgroundTransparency=1,Image=aj.command,ImageColor3=ai.text2,ImageTransparency=c},al'TextLabel'{Name='Title',
RichText=true,Size=UDim2.new(1,-25,0,18),Position=UDim2.fromOffset(25,0),BackgroundTransparency=1,TextTransparency=c,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,TextSize=18,FontFace=aE(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text,Text=aL,[am]={au(1,18)}},al'TextLabel'{Name='Body',TextWrapped=
true,RichText=true,Position=UDim2.fromOffset(4,25),BackgroundTransparency=1,TextTransparency=c,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=16,FontFace=aE('Montserrat',Enum.FontWeight.Medium),
TextColor3=ai.text2,Text=aM,Size=ao(function()return UDim2.new(1,-4,0,aB(d))end)}}}ap(aH.binds):onChange(function()i(aB(
aH.binds))end)i(aB(aH.binds))aM:set(e(aB(aH.binds)))ap(aH.binds):onChange(function()aM:set(e(aB(aH.binds)))end)end end)(
)end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local
ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.Value,aj.
Computed,aj.Observer,ac(ae.simpleElements)local aq,ar,as=ap.UICorner,ap.UIPadding,ac(ae.utilities)local at,au,av,aw=as.
get,as.typecheck,as.animate,as.customFont local ax,ay=au(af,{Text='',Visible=false},{af.Visible and''or'Visible'})
assert(ax,table.concat(ay,'\n'))local az,aA,aB,aC,aD,aE=ah.find'selectedTab',ah.find'searchText',ah.add(af),af.Parent,af
.Text,af.Visible or am(true)local aF=am(at(az.string)==at(aB.tab).uid)ao(az.string):onChange(function()aF:set(at(az.
string)==at(aB.tab).uid)end)local aG=av(function()return at(aF)and 0 or 1 end,40,1)ak'Frame'{Visible=an(function()if at(
aA.string)~=''and not string.find(at(aD):lower(),at(aA.string):lower())or not at(aE)then return false end return true
end),Size=UDim2.new(1,0,0,36),Parent=aC,BackgroundTransparency=aG,BackgroundColor3=ai.background2,[al]={aq(6),ar(0,8),ak
'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),RichText=true,TextScaled=true,BackgroundTransparency=1,
TextTransparency=aG,Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),TextXAlignment
=Enum.TextXAlignment.Left,TextColor3=ai.text,Text=an(function()return at(aD)end),[al]={ak'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=18}}}}}local aH={}function aH.SetText(aI,aJ)local aK,aL=au({SetText=aJ},{SetText=''})assert(aK
,table.concat(aL,'\n'))aD:set(aJ)end function aH.Visible(aI)aE:set(true)end function aH.Invisible(aI)aE:set(false)end
return aH end end)()end,[20]=function()local aa,ab,ac=a(20)local ad return(function(...)local ae=ab.Parent.Parent return
function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak=ag.data,ag.themeSystem,ag.icons,ag.Fusion local al,am,an,ao,ap,aq,
ar=ak.New,ak.Children,ak.Value,ak.Observer,ak.OnEvent,ak.Computed,ac(ae.utilities)local as,at,au,av,aw,ax,ay,az=ar.get,
ar.animate,ar.typecheck,ar.customFont,ar.drag,ar.references,ar.connections,ac(ae.simpleElements)local aA,aB,aC,aD,aE,aF,
aG,aH,aI=az.UIListLayout,az.UIPadding,az.UICorner,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,au(af,{Name={},Children={}},{})assert(aH,table.concat(aI,'\n'))local aJ,aK,aL,aM=ah.find'instanceName'
,ah.find'absoluteOffset',af.Name,an(af.Children)local b,c,d=ax.get(as(aJ.name)),(an(false))d=al'TextButton'{Parent=b,
Size=UDim2.fromOffset(240,11),Position=UDim2.fromOffset(10,10+as(aK.number)),BackgroundTransparency=1,[ap
'MouseButton1Down']=function()c:set(true)end,[am]={al'Frame'{Position=UDim2.new(0.5,-120,0,0),Size=UDim2.fromOffset(240,
0),BackgroundColor3=ai.background2,AutomaticSize=Enum.AutomaticSize.Y,[am]={aC(4),aB(8),al'TextButton'{AnchorPoint=
Vector2.new(1,0),Position=UDim2.fromScale(1,0),Size=UDim2.fromOffset(32,32),BackgroundColor3=ai.selectedTab,[ap
'Activated']=function()d:Destroy()end,[am]={aC(6),al'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,
ImageTransparency=0}}},al'Frame'{BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,[am
]={aA(aD.LayoutOrder,aE.Vertical,aF.Center,aG.Top,UDim.new(0,8)),al'Frame'{Size=at(function()return as(c)and UDim2.new(
0.4,0,0,6)or UDim2.new(0.25,0,0,6)end,40,1),BackgroundColor3=ai.text2,BackgroundTransparency=at(function()return as(c)
and 0 or 0.5 end,40,1),[am]={aC(6)}},al'Frame'{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]={al'TextLabel'{Size=UDim2.new(1,-40,0,18),BackgroundTransparency=1,FontFace=av('Montserrat',Enum.
FontWeight.Bold),TextColor3=ai.text,TextScaled=true,Text=aL,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},al
'Frame'{Size=UDim2.new(1,0,0,0),Position=UDim2.fromOffset(0,26),BackgroundTransparency=1,AutomaticSize=Enum.
AutomaticSize.Y,[am]=aM}}}}}}}}}local e,f=aw(d,15)local g=f:Connect(function()c:set(false)end)ay.add(e)ay.add(g)d.
Destroying:Once(function()e:Disconnect()g:Disconnect()end)return d,function(...)aM:set(...)end end end)()end,[21]=
function()local aa,ab,ac=a(21)local ad return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.
Bundles)local ah,ai=ag.themeSystem,ag.Fusion local aj,ak,al,am,an,ao=ai.New,ai.OnEvent,ai.Children,ai.Value,ai.Computed,
ac(ae.utilities)local ap,aq,ar,as,at,au=ao.get,ao.animate,ao.getStringBounds,ao.customFont,ao.typecheck,ac(ae.
simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UICorner,au.UIPadding,au.UIListLayout,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,at(af,{Title='',Body='',Duration=1,Image='',ImageColor=
Color3.fromRGB(0,0,0),Buttons={}},{af.Image and''or'Image',af.ImageColor and''or'ImageColor',af.Buttons and''or'Buttons'
})assert(aC,table.concat(aD,'\n'))local aE,aF,aG,aH,aI,aJ,aK,aL,aM,b,c=am(af.Title),am(af.Body),am(af.Duration),am(af.
Image or''),af.ImageColor and am(af.ImageColor)or ah.text,am(af.Buttons or{}),am(false),am(false),am(false),am'',am(250)
local d=am(ar(ap(aF),{Size=14,Font=as('Montserrat',Enum.FontWeight.Medium),Width=ap(c)-8-(aH and 32 or 0)}))local e=am(
20+math.clamp(ap(d).Y+4+10+(#ap(aJ)>0 and 26 or 0),#ap(aJ)>0 and 56 or 30,9e9))local function f(g,h)local i=1 for j=1,g
do i=i*10 end local j=tostring(math.round(h*i)/i)local k=string.split(j,'.')if#k==1 then local o=''for p=1,g do o=o..'0'
end j=j..'.'..o end return j end local g,h={}for i,j in ap(aJ)do local k,o=at({Button=j},{Button={}})assert(k,table.
concat(o,'\n'))k,o=at(j,{Name='',Callback=function()end})assert(k,table.concat(o,'\n'))local p,q=j.Name,j.Callback local
r=aj'TextButton'{Size=UDim2.new(1/#ap(aJ),-2,1,-4),TextSize=14,Text=p,FontFace=as('Montserrat',Enum.FontWeight.Bold),
BackgroundColor3=ah.notificationButton,TextColor3=ah.text,[ak'Activated']=function()task.spawn(q)aL:set(false)task.wait(
0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)h:Destroy()end,[al]={av(4)}}table.insert(g,r)end h
=aj'Frame'{Parent=af.Parent,BackgroundTransparency=1,Size=aq(function()return UDim2.fromOffset(ap(c),ap(aK)and ap(e)+5
or 0)end,30,1),ClipsDescendants=true,[al]={aj'TextButton'{Visible=an(function()return not ap(aM)end),Interactable=aL,
AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundTransparency=1,Size=UDim2.fromOffset(ap(c),ap(e)),[
ak'Activated']=function()aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)h:
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
,0,0,26),BackgroundTransparency=1,[al]={ax(ay.LayoutOrder,az.Horizontal,aA.Center,aB.Center,UDim.new(0,2)),g}},aj
'TextLabel'{Size=UDim2.new(1,0,0,10),FontFace=as('Montserrat',Enum.FontWeight.Medium),Text=b,TextColor3=ah.text,TextSize
=10,BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right}}}}}}}task.delay(0.4,function()aL:set(true)end)
task.spawn(function()repeat task.wait()until ap(aL)local k,o=(tick())repeat o=tick()-k b:set(f(1,math.clamp(o,0,ap(aG)))
)task.wait()until o>ap(aG)end)task.spawn(function()aK:set(true)repeat task.wait()until ap(aL)task.wait(ap(aG))task.wait(
0.2)aL:set(false)task.wait(0.4)aK:set(false)task.delay(0.3,function()aM:set(true)end)task.wait(2)h:Destroy()end)end end
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
,Enum.FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,az(af,{Name='',DisabledText='',IsEnabled=false,
Visible=false,Callback=function()end,FLAG='',Default=0,Min=0,Max=0,DisplayAsPercent=false,DecimalPlace=0,IgnoreConfig=
true},{af.DisabledText and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or
'FLAG',af.Default and''or'Default',af.Min and''or'Min',af.Max and''or'Max',af.DisplayAsPercent and''or'DisplayAsPercent'
,af.DecimalPlace and''or'DecimalPlace',af.IgnoreConfig and''or'IgnoreConfig'})assert(aJ,table.concat(aK,'\n'))local aL,
aM,b,c,d,e,f,g,h,i,j,k,o,p,q=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah.add(af),af.Parent,af.Name,af
.DisabledText or ar'Component Disabled',af.IsEnabled or ar(true),af.Visible or ar(true),af.Callback,af.Max,af.Min,af.
DisplayAsPercent or ar(false),af.DecimalPlace or ar(0),af.IgnoreConfig or ar(false)local r=ax(af.Default)and ar(math.
clamp(ax(af.Default),ax(k),ax(j)))if not ax(r)then r=ar(ax(k))end local s=(af.FLAG and ax(af.FLAG)~='')and ax(af.FLAG)or
c.uid local t=ak.register(s,{percentageOf=ar(ax(k))},'slider',s==c.uid)t.user.Value=ax(t.status.percentageOf)local u=ar(
ax(aL.string)==ax(c.tab).uid)as(aL.string):onChange(function()u:set(ax(aL.string)==ax(c.tab).uid)end)local v=ay(function
()return ax(u)and 0 or 1 end,40,1)local function w(x,y,z,A,B)return(1-((x-y)/(z-y)))*A+((x-y)/(z-y))*B end
local function x(y)if ax(p)==0 then return math.floor(y)end return tonumber(string.format('%.'..ax(p)..'f',y))end local
y=ar(0)as(t.status.percentageOf):onChange(function()y:set(w(ax(t.status.percentageOf),ax(k),ax(j),0,1))if not ax(g)then
return end task.spawn(ax(i),ax(t.status.percentageOf))end)local z,A,B,C=ar(),ar(10),ar(),ar(false)am.InputEnded:Connect(
function(D)if(D.UserInputType==Enum.UserInputType.MouseButton1 or D.UserInputType==Enum.UserInputType.Touch)and ax(C)
then C:set(false)end end)ap'Frame'{Parent=d,Visible=au(function()if ax(b.string)~=''and not string.find(ax(e):lower(),
ax(b.string):lower())or not ax(h)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundColor3=ai.
background2,BackgroundTransparency=ay(function()if ax(u)then return 0 end return 1 end,40,1),[aq]={aE(6),ap'Frame'{
ZIndex=2,Visible=au(function()if not ax(g)then return true end return false end),BackgroundTransparency=ay(function()
return ax(u)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[aq]={aE(6),ap
'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=v},ap'TextLabel'{FontFace=aA(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=v,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=au(function()
return ax(f)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[aq]={aD(0,5)}}}},ap'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[aq]={aC(aF.LayoutOrder,aG.Horizontal,aH.Left,aI.Center,UDim.new(0,6)
),aD(0,8),ap'TextLabel'{FontFace=aA('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(0.5,-6,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextTransparency=v,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,0,0.5,0),Text=e,TextXAlignment=Enum.TextXAlignment.Left,RichText=true},ap'Frame'{Size=UDim2.new(0.5,0,1,0),
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,[aq]={aC(aF.LayoutOrder,aG.
Horizontal,aH.Left,aI.Center,UDim.new(0,10)),ap'Frame'{Size=UDim2.new(0.2,-5,1,0),BackgroundTransparency=1,[aq]={aE(4),
aC(aF.LayoutOrder,aG.Vertical,aH.Right,aI.Center,UDim.new(0,1)),ap'TextBox'{FontFace=aA('Montserrat',Enum.FontWeight.
Bold),Size=UDim2.new(0,0,0,14),BackgroundTransparency=1,TextColor3=ai.text2,TextTransparency=v,TextScaled=true,
ClearTextOnFocus=true,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Text=au(function()if ax(o)then return
tostring(x(ax(y)*100))..'%'end return ax(t.status.percentageOf)or''end),TextXAlignment=Enum.TextXAlignment.Right,
RichText=true,AutomaticSize=Enum.AutomaticSize.X,[at'Changed']=function(D)local E=ax(B)if D=='AbsoluteSize'and E and E.
AbsoluteSize then A:set(E.AbsoluteSize.X)end end,[at'FocusLost']=function()local D=ax(B)if tonumber(D.Text)then t.status
.percentageOf:set(math.clamp(tonumber(D.Text),ax(k),ax(j)))else if ax(o)then D.Text=tostring(x(ax(y)*100))..'%'end D.
Text=ax(t.status.percentageOf)end end,[av]=B,[aq]={aD(0,5,0,5)}},ap'Frame'{BackgroundColor3=ai.text2,
BackgroundTransparency=ay(function()if ax(u)then return 0.5 end return 1 end,40,1),Size=ay(function()return UDim2.
fromOffset(ax(A),2)end,40,1),[aq]={aE(0,1)}}}},ap'TextButton'{Interactable=au(function()if not ax(g)then return false
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
,1)}}}}}}}}}}}}}if ax(aM.boolean)and not ax(q)then t.file:Connect(function(D)local E=true if D~=nil then t.status.
percentageOf:set(D)E=false end if E then t.status.percentageOf:set(ax(r))end end)if t.private then t.status.percentageOf
:set(ax(r))end else t.status.percentageOf:set(ax(r))end local D={}function D.SetName(E,F)local G,H=az({SetName=F},{
SetName=''})assert(G,table.concat(H,'\n'))e:set(F)end function D.SetValue(E,F)local G,H=az({SetValue=F},{SetValue=0})
assert(G,table.concat(H,'\n'))t.status.percentageOf:set(math.clamp(F,ax(k),ax(j)))end function D.Enable(E)g:set(true)end
function D.Disable(E)g:set(false)end function D.Visible(E)h:set(true)end function D.Invisible(E)h:set(false)end return D
end end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai,aj=ag.data,ag.themeSystem,ag.Fusion local ak,al,am,an,ao,ap=aj.New,aj.Children,aj.
Value,aj.Observer,aj.OnEvent,ac(ae.utilities)local aq,ar,as,at,au=ap.get,ap.animate,ap.typecheck,ap.customFont,ac(ae.
simpleElements)local av,aw,ax,ay,az,aA,aB,aC,aD=au.UIListLayout,au.UIPadding,au.UICorner,Enum.SortOrder,Enum.
FillDirection,Enum.HorizontalAlignment,Enum.VerticalAlignment,as(af,{Name='',Image=''},{af.Image and''or'Image'})assert(
aC,table.concat(aD,'\n'))local aE,aF,aG,aH,aI,aJ,aK=ah.find'selectedTab',ah.find'isFirst',ah.add(af),af.Parent,af.Name,(
am(false))if af.Image then aK=af.Image aJ:set(true)end local aL=am(false)an(aE.string):onChange(function()local aM=aq(aE
.string)aL:set(aM==aG.uid)end)ak'TextButton'{Name=aG.uid,Parent=aH,Size=UDim2.new(1,0,0,36),BackgroundColor3=ar(function
()return aq(aL)and ai.get'selectedTab'or ai.get'background2'end,40,1),[ao'Activated']=function()aE:update('string',aG.
uid)end,[al]={ax(4),aw(6),av(ay.LayoutOrder,az.Horizontal,aA.Left,aB.Center,UDim.new(0,4)),ak'ImageLabel'{Visible=aJ,
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),ImageColor3=ai.text2,Image=aK,ImageTransparency=ar(function()
return aq(aL)and 0 or 0.6 end,40,1)},ak'TextLabel'{Size=aq(aJ)and UDim2.new(1,-28,1)or UDim2.fromScale(1,1),FontFace=at(
'Montserrat',Enum.FontWeight.Bold),TextColor3=ai.text2,TextScaled=true,Text=aI,BackgroundTransparency=1,TextXAlignment=
Enum.TextXAlignment.Left,TextTransparency=ar(function()return aq(aL)and 0 or 0.6 end,40,1),[al]={ak
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}}}}if not aq(aF.boolean)then aF:update('boolean',true)aE:update(
'string',aG.uid)end return aG end end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.
Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai=ag.data,ag.Fusion local aj,ak,al,am=ai.New,ai.
Children,ai.Computed,ac(ae.simpleElements)local an,ao,ap,aq,ar,as,at=am.UIListLayout,Enum.SortOrder,Enum.FillDirection,
Enum.HorizontalAlignment,Enum.VerticalAlignment,ac(ae.utilities).get,ah.find'selectedTab'return aj'ScrollingFrame'{
ZIndex=al(function()return(as(at.string)==af.uid)and 1 or 0 end),Name=af.uid,Parent=af.Parent,Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,CanvasSize=UDim2.new(1,0,1,0),[ak]={an(ao.LayoutOrder,ap.Vertical,aq.Center,ar.Top,UDim.new(0,4))}}
end end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae=ab.Parent.Parent return function(
af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.themeSystem,ag.icons,ag.flags,ag.Fusion local am,an,ao,ap,aq,
ar,as,at=al.New,al.Children,al.Value,al.Computed,al.Observer,al.Ref,al.OnEvent,ac(ae.utilities)local au,av,aw,ax,ay=at.
get,at.animate,at.customFont,at.typecheck,ac(ae.simpleElements)local az,aA,aB,aC,aD,aE,aF,aG,aH,aI=ay.UIPadding,ay.
UICorner,ay.UITextSizeConstraint,ay.UIListLayout,Enum.SortOrder,Enum.VerticalAlignment,Enum.HorizontalAlignment,Enum.
FillDirection,ax(af,{Name='',DisabledText='',IsEnabled=false,Visible=false,Callback=function()end,FLAG='',
PlaceHolderText='',ClearTextOnFocus=false,OnlyNumbers=true,OnLeave=true,Default='',IgnoreConfig=true},{af.DisabledText
and''or'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.PlaceHolderText and''or
'PlaceHolderText',af.ClearTextOnFocus and''or'ClearTextOnFocus',af.OnlyNumbers and''or'OnlyNumbers',af.OnLeave and''or
'OnLeave',af.Default and''or'Default',af.FLAG and''or'FLAG',af.IgnoreConfig and''or'IgnoreConfig'})assert(aH,table.
concat(aI,'\n'))local aJ,aK,aL,aM,b,c,d,e,f,g,h,i,j,k,o,p=ah.find'selectedTab',ah.find'useConfig',ah.find'searchText',ah
.add(af),af.Parent,af.Name,af.DisabledText or ao'Component Disabled',af.IsEnabled or ao(true),af.Visible or ao(true),af.
Callback,af.OnlyNumbers or ao(false),af.Default or ao'',af.OnLeave or ao(false),af.ClearTextOnFocus or ao(false),af.
IgnoreConfig or ao(false),af.PlaceHolderText or ao''local q,r=(af.FLAG or ao(aM.uid))if au(q)~=''then r=ak.register(au(q
),{correctText=ao''},'textbox',au(q)==aM.uid)r.user.Value=au(r.status.correctText)end local s=ao(au(aJ.string)==au(aM.
tab).uid)aq(aJ.string):onChange(function()s:set(au(aJ.string)==au(aM.tab).uid)end)local t,u,v,w,x,y,z=av(function()
return au(s)and 0 or 1 end,40,1),ao(),ao(false),ao'',ao(au(r.status.correctText)),ao'',ao(false)aq(w):onChange(function(
)if au(h)then if tonumber(au(w))or au(w)==''then x:set(au(w))end else x:set(au(w))end local A=au(u)A.Text=au(x)if au(j)
then return end if au(h)then if(tonumber(au(w))or au(w)=='')and au(y)~=au(w)then task.spawn(au(g),au(w))r.status.
correctText:set(au(w))y:set(au(w))end else if au(y)==au(w)then return end task.spawn(au(g),au(w))r.status.correctText:
set(au(w))y:set(au(w))end end)aq(v):onChange(function()if au(j)and not au(v)then if au(h)then if(tonumber(au(w))or au(w)
=='')and au(y)~=au(w)then task.spawn(au(g),au(w))r.status.correctText:set(au(w))y:set(au(w))end else if au(y)==au(w)then
return end task.spawn(au(g),au(w))r.status.correctText:set(au(w))y:set(au(w))end end end)local A,B=ao(),ao(0)am'Frame'{
Parent=b,Visible=ap(function()if au(aL.string)~=''and not string.find(au(c):lower(),au(aL.string):lower())or not au(f)
then return false end return true end),BackgroundTransparency=1,Size=UDim2.new(1,0,0,36),[an]={am'Frame'{ZIndex=2,
Visible=ap(function()if not au(e)then return true end return false end),BackgroundTransparency=av(function()return au(s)
and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[an]={aA(6),am'ImageLabel'{Size=
UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,Image=aj.
lock,ImageColor3=ai.disabledText,ImageTransparency=t},am'TextLabel'{FontFace=aw('Montserrat',Enum.FontWeight.Bold),
BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,TextTransparency=t,TextScaled=true,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=ap(function()return au(d)end),TextXAlignment=Enum.
TextXAlignment.Left,RichText=true,[an]={az(0,5)}}}},am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[an]={
aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,3)),am'TextLabel'{Size=UDim2.fromScale(0,1),
BackgroundColor3=ai.background2,BackgroundTransparency=t,TextSize=18,Text=c,AutomaticSize=Enum.AutomaticSize.X,
TextTransparency=t,TextXAlignment=Enum.TextXAlignment.Left,RichText=true,TextColor3=ai.text,FontFace=aw('Montserrat',
Enum.FontWeight.Bold),[as'Changed']=function(C)if C=='AbsoluteSize'and au(A)~=nil then B:set(au(A).AbsoluteSize.X)end
end,[ar]=A,[an]={aA(6),az(0,6)}},am'TextButton'{Interactable=ap(function()if not au(e)then return false end return au(s)
end),Size=ap(function()if au(A)then return UDim2.new(1,-au(B)-3,1)end return UDim2.fromScale(0.35,1)end),
BackgroundColor3=ai.background2,BackgroundTransparency=t,[as'Activated']=function()local C=au(u)if C then C:
CaptureFocus()end end,[an]={aA(6),az(0,6),aC(aD.LayoutOrder,aG.Horizontal,aF.Left,aE.Center,UDim.new(0,5)),am
'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aj.input,ImageColor3=ai.text2,
ImageTransparency=t},am'TextBox'{Interactable=ap(function()if not au(e)then return false end return au(s)end),
ClipsDescendants=true,Size=UDim2.new(1,-25,1,0),BackgroundTransparency=1,PlaceholderText=p,PlaceholderColor3=ai.text2,
TextColor3=ai.text,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,FontFace=aw('Montserrat',Enum.FontWeight.Bold),
Text=x,TextTransparency=t,ClearTextOnFocus=k,[ar]=u,[as'Changed']=function(C)local D=au(u)if D.TextBounds.X>D.
AbsoluteSize.X then z:set(true)end if D and D.Text and C=='Text'then w:set(D.Text)end end,[as'Focused']=function()v:set(
true)end,[as'FocusLost']=function()v:set(false)end,[an]={am'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=0,[
an]={am'UIGradient'{Rotation=0,Color=av(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,ai.get
'background2'),ColorSequenceKeypoint.new(1,ai.get'background2')}end,40,1),Transparency=av(function()if not au(s)then
return NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,1),NumberSequenceKeypoint.new(1
,1)}end if au(z)then if au(v)then return NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(
0.1,1),NumberSequenceKeypoint.new(1,1)}else return NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.9,1),NumberSequenceKeypoint.new(1,0)}end end return NumberSequence.new{
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)}end,40,1)}}}}}}}}}}}if au(aK.boolean)and not au(o)then r
.file:Connect(function(C)local D=true if C~=nil then if au(j)then v:set(true)end w:set(C)if au(j)then v:set(false)end D=
false end if D then if au(j)then v:set(true)end w:set(au(i))if au(j)then v:set(false)end end end)if r.private then if
au(j)then v:set(true)end w:set(au(i))if au(j)then v:set(false)end end else if au(j)then v:set(true)end w:set(au(i))if
au(j)then v:set(false)end end local C={}function C.SetName(D,E)local F,G=ax({SetName=E},{SetName=''})assert(F,table.
concat(G,'\n'))c:set(E)end function C.SetInput(D,E)local F,G=ax({SetInput=E},{SetInput=au(h)and 1 or''})assert(F,table.
concat(G,'\n'))w:set(E)end function C.Enable(D)e:set(true)end function C.Disable(D)e:set(false)end function C.Visible(D)
f:set(true)end function C.Invisible(D)f:set(false)end return C end end)()end,[27]=function()local aa,ab,ac=a(27)local ad
return(function(...)local ae=ab.Parent.Parent return function(af)local ag=ac(ae.Bundles)local ah,ai,aj,ak,al=ag.data,ag.
themeSystem,ag.icons,ag.flags,ag.services local am,an=al.UserInputService,ag.Fusion local ao,ap,aq,ar,as,at,au=an.New,an
.Children,an.Value,an.Observer,an.OnEvent,an.Computed,ac(ae.utilities)local av,aw,ax,ay,az,aA,aB,aC=au.get,au.animate,au
.typecheck,au.connections,au.customFont,au.references,au.drag,ac(ae.simpleElements)local aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,b
=aC.UIPadding,aC.UICorner,aC.UITextSizeConstraint,aC.UIListLayout,Enum.SortOrder,Enum.FillDirection,Enum.
HorizontalAlignment,Enum.VerticalAlignment,ac(ab.Parent.warn)[1],ax(af,{Name='',DisabledText='',IsEnabled=false,Visible=
false,Callback=function()end,FLAG='',Default=false,LinkKeybind=true,IgnoreConfig=true},{af.DisabledText and''or
'DisabledText',af.IsEnabled and''or'IsEnabled',af.Visible and''or'Visible',af.FLAG and''or'FLAG',af.Default and''or
'Default',af.LinkKeybind and''or'LinkKeybind',af.IgnoreConfig and''or'IgnoreConfig',af.IgnoreConfig and''or
'IgnoreConfig'})assert(aM,table.concat(b,'\n'))aM,b=ax(af,{Bind=Enum.KeyCode.E},{af.LinkKeybind and af.Bind and''or
'Bind'})assert(aM,table.concat(b,'\n'))local c,d,e,f,g,h,i,j,k,o,p,q,r,s,t,u,v,w,x,y=ah.find'selectedTab',ah.find
'currentBinds',ah.find'useConfig',ah.find'searchText',ah.find'instanceName',ah.find'isMobile',ah.find'isListening',ah.
find'bindData',ah.find'toggles',ah.add(af),af.Parent,af.Name,af.DisabledText or aq'Component Disabled',af.IsEnabled or
aq(true),af.Visible or aq(true),af.Callback,af.Default or aq(false),af.Bind,af.IgnoreConfig or aq(false),af.LinkKeybind
or aq(false)local z,A=(af.FLAG or aq(o.uid))if av(z)~=''then A=ak.register(av(z),{boolean=aq(false),keycode=aq(nil),
coordinate=aq(nil)},'toggle',av(z)==o.uid)A.user.Value=av(A.status.boolean)end local B=aq()local function C(D:EnumItem,E
:string)local F,G=av(d.binds),av(j.bindData)if table.find(F,D)then aL(('Key %s is already in use. %s'):format(D.Name,E))
else table.insert(F,D)if av(B)then table.remove(F,table.find(F,av(B)))G[av(B).Name]=nil end B:set(D)G[av(B).Name]={bind=
av(B),name=av(q),boolean=A.status.boolean}j:update('bindData',G)d:update('binds',F)A.status.keycode:set(av(B).Name)end
end ar(A.status.boolean):onChange(function()if av(s)then task.spawn(av(u),av(A.status.boolean))end end)table.insert(k.
list,A.status.boolean)local D=aq(av(c.string)==av(o.tab).uid)ar(c.string):onChange(function()D:set(av(c.string)==av(o.
tab).uid)end)local E,F=aw(function()return av(D)and 0 or 1 end,40,1),aq(false)local G=am.InputBegan:Connect(function(G,H
)if av(h.boolean)then return end if av(F)then if G.KeyCode and G.KeyCode~=Enum.KeyCode.Unknown then C(G.KeyCode,
'From input box')end F:set(false)task.wait()i:update('boolean',false)else if G.KeyCode and G.KeyCode==av(B)and not H and
not av(i.boolean)and av(s)then A.status.boolean:set(not av(A.status.boolean))end end end)ay.add(G)local H,I,J=(aq(false)
)J=ao'TextButton'{Visible=at(function()if not av(s)then return av(s)end return av(H)end),Parent=aA.get(av(g.name)),Size=
UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=q,
FontFace=az('Montserrat',Enum.FontWeight.Bold),TextColor3=ai.mobileButtonText,BackgroundColor3=ai.mobileButtonBackground
,BackgroundTransparency=0.5,TextTransparency=0.1,[as'Activated']=function()if I then I:Disconnect()I=nil A.status.
coordinate:set(J.AbsolutePosition)else A.status.boolean:set(not av(A.status.boolean))end end,[ap]={aD(4),aE(16),aF(0,16)
,ao'ImageLabel'{ZIndex=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32)
,BackgroundTransparency=1,Image=av(h.boolean)and aj.finger or aj.command,ImageColor3=ai.mobileButtonImage,
ImageTransparency=0.8}}}ao'Frame'{Parent=p,Visible=at(function()if av(f.string)~=''and not string.find(av(q):lower(),av(
f.string):lower())or not av(t)then return false end return true end),Size=UDim2.new(1,0,0,36),BackgroundTransparency=1,[
ap]={ao'Frame'{ZIndex=2,Visible=at(function()if not av(s)then return true end return false end),BackgroundTransparency=
aw(function()return av(D)and 0.2 or 1 end,40,1),BackgroundColor3=ai.disabledBackground,Size=UDim2.fromScale(1,1),[ap]={
aE(6),ao'ImageLabel'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,5,0.5,0),
BackgroundTransparency=1,Image=aj.lock,ImageColor3=ai.disabledText,ImageTransparency=E},ao'TextLabel'{FontFace=az(
'Montserrat',Enum.FontWeight.Bold),BackgroundTransparency=1,Size=UDim2.new(1,-24,0,18),TextColor3=ai.disabledText,
TextTransparency=E,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,29,0.5,0),Text=at(function()
return av(r)end),TextXAlignment=Enum.TextXAlignment.Left,RichText=true,[ap]={aD(0,5)}}}},ao'Frame'{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),[ap]={aG(aH.LayoutOrder,aI.Horizontal,aJ.Left,aK.Center,UDim.new(0,3)
),ao'TextButton'{Interactable=at(function()if not av(s)then return false end return av(D)end),Size=at(function()return
av(y)and UDim2.new(0.775,av(H)and-42 or-3,0,36)or UDim2.new(1,0,0,36)end),BackgroundColor3=ai.background2,
BackgroundTransparency=E,[as'Activated']=function()if not av(s)then return end A.status.boolean:set(not av(A.status.
boolean))end,[ap]={aE(6),ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aD(8),aG(aH.LayoutOrder,aI.
Horizontal,aJ.Left,aK.Center,UDim.new(0,10)),ao'Frame'{Size=UDim2.fromOffset(24,24),AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=E,BackgroundColor3=aw(function()return av(A.status.boolean)and ai.
get'toggled'or ai.get'selectedTab'end,40,1),[ap]={aE(6),ao'ImageLabel'{Size=UDim2.fromScale(0.65,0.65),AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Image=aj.check,ImageTransparency=aw(
function()if not av(D)then return 1 end if av(A.status.boolean)then return 0 end return 1 end,40,1),ImageColor3=ai.
selectedTab}}},ao'TextLabel'{FontFace=az('Montserrat',Enum.FontWeight.Bold),Size=UDim2.new(1,-24,0,18),
BackgroundTransparency=1,TextColor3=ai.text,TextScaled=true,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0)
,Text=q,TextTransparency=E,TextXAlignment=Enum.TextXAlignment.Left,RichText=true}}}}},ao'TextButton'{Visible=H,
Interactable=at(function()if not av(s)then return false end return av(D)end),Size=UDim2.fromOffset(36,36),
BackgroundColor3=ai.background2,BackgroundTransparency=E,[as'Activated']=function()H:set(false)J.Position=UDim2.
fromScale(0.5,0.5)end,[ap]={aE(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=aj.close,ImageColor3=ai.red,ImageTransparency=E}}},ao
'TextButton'{Visible=y,Interactable=at(function()if not av(s)then return false end return av(D)end),Size=UDim2.new(0.225
,0,1,0),BackgroundColor3=ai.background2,BackgroundTransparency=E,[as'Activated']=function()if av(h.boolean)then H:set(
true)I=aB(J,15)return end F:set(true)i:update('boolean',true)end,[ap]={aE(6),aD(6),aG(aH.LayoutOrder,aI.Horizontal,aJ.
Left,aK.Center,UDim.new(0,5)),ao'ImageLabel'{ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=av(h.
boolean)and aj.finger or aj.command,ImageColor3=ai.text2,ImageTransparency=E},ao'TextLabel'{Visible=not av(h.boolean),
Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ai.text2,TextTransparency=E,Text=at(function()return av(F)and
'Listening'or av(B)and av(B).Name or'Waiting'end)},ao'TextLabel'{Visible=av(h.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=az('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ai.text2,Text=at(function()return av(H)and'Move Bind'or'Place Bind'end),
TextTransparency=E}}}}}}}if av(e.boolean)and not av(x)then A.file:Connect(function(K)local L,M=true,true if K.boolean~=
nil then A.status.boolean:set(K.boolean)L=false end if K.keycode~=nil then if av(B)and av(B).Name==K.keycode then return
end local N,O=pcall(function()return Enum.KeyCode[K.keycode]end)if N then C(O,'File1')end M=false end if L then A.status
.boolean:set(av(v))end if M then if w then A.status.keycode:set(av(w).Name)end end if av(h.boolean)and K.coordinate then
J.Position=UDim2.fromOffset(K.coordinate.X+30,K.coordinate.Y+30)H:set(true)end end)if A.private then A.status.boolean:
set(av(v))if w then A.status.keycode:set(av(w).Name)end end else A.status.boolean:set(av(v))if w then A.status.keycode:
set(av(w).Name)end end local K={}function K.SetName(L,M)local N,O=ax({SetName=M},{SetName=''})assert(N,table.concat(O,
'\n'))q:set(M)end function K.SetValue(L,M:boolean)local N,O=ax({SetValue=M},{SetValue=true})assert(N,table.concat(O,'\n'
))A.status.boolean:set(M)end function K.SetBind(L,M:EnumItem)assert(av(y),'Requires LinkKeybind')local N,O=ax({SetBind=M
},{SetBind=Enum.keyCode.C})assert(N,table.concat(O,'\n'))C(M,'At :SetBind')end function K.Enable(L)s:set(true)end
function K.Disable(L)s:set(false)end function K.Visible(L)t:set(true)end function K.Invisible(L)t:set(false)end return K
end end)()end,[28]=function()local aa,ab,ac=a(28)local ad return(function(...)local ae,af,ag=ab.Parent.Parent,'',{}table
.insert(ag,function(ah)local ai,aj,ak=ac(ae.Bundles),ac(ab.Parent.notification),ac(ae.utilities).references local al,am=
ai.icons,ai.themeSystem aj{Parent=ak.get'notificationList',Title=af,Body=ah,Duration=3,Image=al.alert,ImageColor=am.get
'red'}end)table.insert(ag,function(ah)af=ah end)return ag end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(
function(...)local ae=ab.Parent.Parent return function(af,ag)local ah=ac(ae.Bundles)local ai=ah.services local aj,ak,al,
am,an=ai.UserInputService,ah.themeSystem,ah.icons,ah.data,ah.Fusion local ao,ap,aq,ar,as,at,au,av=an.New,an.Children,an.
Value,an.Ref,an.Computed,an.Observer,an.OnEvent,ac(ae.simpleElements)local aw,ax,ay,az,aA,aB,aC,aD,aE=av.UIListLayout,av
.UICorner,av.UITextSizeConstraint,av.UIPadding,Enum.SortOrder,Enum.FillDirection,Enum.HorizontalAlignment,Enum.
VerticalAlignment,ac(ae.utilities)local aF,aG,aH,aI,aJ,aK,aL,aM,b,c,d,e,f=aE.get,aE.references,aE.drag,aE.customFont,aE.
animate,aE.connections,ac(ab.Parent.Parent.components.warn)[1],aq(),aq(),aq(),aq(),aq(),aq()aG.add(e,d,c,b,aM,f)local g,
h,i,j,k,o,p,q,r,s,t,u,v,w,x,y=am.find'absoluteOffset',am.find'instanceName',am.find'selectedTab',am.find'searchText',am.
find'currentBinds',am.find'isVisible',am.find'isMobile',am.find'isListening',am.find'bindData',am.find'destroyFunc'.func
,aq(750),aq(500),aq(false),aq(false),aq(false),aq(false)at(v):onChange(function()if aF(v)then w:set(not aF(w))task.wait(
0.3)x:set(not aF(x))task.wait(0.3)y:set(not aF(y))else y:set(not aF(y))task.wait(0.3)x:set(not aF(x))task.wait(0.3)w:
set(not aF(w))end end)at(x):onChange(function()t:set(aF(x)and 212 or 750)end)at(y):onChange(function()u:set(aF(y)and 74
or 500)end)local z,A,B=aq(false),aq(),aq(false)local function C(D:EnumItem,E:string)local F,G=aF(k.binds),aF(r.bindData)
if table.find(F,D)then aL(('Key %s is already in use. %s'):format(D.Name,E))else table.insert(F,D)if aF(A)then table.
remove(F,table.find(F,aF(A)))G[aF(A).Name]=nil end A:set(D)B:set(true)G[aF(A).Name]={bind=aF(A),name='Toggle Interface'}
r:update('bindData',G)k:update('binds',F)end end if not aF(p.boolean)then C(af.HideBind,'init')end local D=aq''at(i.
string):onChange(function()local E=aF(i.string)local F=am.find(E)D:set(aF(F.Name):upper())end)local E,F,G=(aq(af.Icon or
''))local H=ao'ScreenGui'{Name=aF(h.name),Parent=af.Parent or ai.CoreGui,ResetOnSpawn=false,IgnoreGuiInset=true,[ar]=e,[
ap]={ao'Frame'{Name='screenSize',Size=UDim2.fromScale(1,1),BackgroundTransparency=1},ao'Frame'{Name='container',Visible=
o.boolean,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,aF(g.number)),Size=aJ(function()return UDim2.
fromOffset(aF(t),aF(u))end,30,1),BackgroundColor3=ak.background,[ar]=aM,[ap]={ax(6),az(16),aw(aA.LayoutOrder,aB.
Horizontal,aC.Right,aD.Top,UDim.new(0,16)),ao'Frame'{ZIndex=2,AnchorPoint=Vector2.new(0,0.5),Size=aJ(function()return
UDim2.new(0,math.clamp(aF(t)-32-180-16,212,9e9),aF(w)and 0 or 1,0)end,30,1),BackgroundTransparency=1,ClipsDescendants=
true,[ap]={ao'TextLabel'{Size=UDim2.new(1,-1,0,70),Position=UDim2.fromOffset(0,10),BackgroundTransparency=1,Text=D,
TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Bottom,FontFace=aI('Montserrat',Enum.
FontWeight.ExtraBold),TextColor3=ak.text,TextTransparency=0.95,TextScaled=true,[ap]={ao'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=70}}},ao'Frame'{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.
Vertical,aC.Left,aD.Top,UDim.new(0,16)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.
LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,10)),ao'Frame'{Size=UDim2.new(0.65,0,1,0),BackgroundTransparency=1,[
ap]={aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Top,UDim.new(0,5)),ao'ImageLabel'{Visible=as(function()if aF(E)~=''then
return true end return false end),Size=UDim2.fromOffset(44,44),BackgroundTransparency=1,Image=E,ImageColor3=ak.text2},ao
'Frame'{Size=as(function()if aF(E)~=''then return UDim2.new(1,-49,1,0)end return UDim2.new(1,0,1,0)end),
BackgroundTransparency=1,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,4)),ao'TextLabel'{Size=UDim2.new(
1,0,0.6,0),Text=af.Title,TextColor3=ak.text,FontFace=aI('Montserrat',Enum.FontWeight.ExtraBold),TextScaled=true,
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left},ao'TextLabel'{Size=UDim2.new(1,0,0.4,-4),Text=af.
Description,TextColor3=ak.text2,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left}}}}},ao'TextButton'{Size=UDim2.new(0.35,-10,1,0),BackgroundColor3=ak.background2
,[au'Activated']=function()local H=aF(f)if H then H:CaptureFocus()end end,[ap]={az(0,4),ax(6),aw(aA.LayoutOrder,aB.
Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'ImageLabel'{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image
=al.search,ImageColor3=ak.text2},ao'TextBox'{Size=UDim2.new(1,-32,0,16),TextColor3=ak.text2,TextSize=16,FontFace=aI(
'Montserrat',Enum.FontWeight.Bold),PlaceholderText='Search',PlaceholderColor3=ak.text2,BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextScaled=true,ClearTextOnFocus=true,[au'Changed']=function(H)local I=aF(f)if H
~='Text'and I and I.Text then return end j:update('string',I.Text)end,[ar]=f}}}}},ao'Frame'{Name='tabFrameList',Size=
UDim2.new(1,0,1,-60),BackgroundTransparency=1,[ar]=c}}}}},ao'Frame'{Size=aJ(function()return aF(y)and UDim2.new(0,180,0,
44)or UDim2.new(0,180,1,0)end,30,1),BackgroundColor3=ak.background2,ClipsDescendants=true,[ap]={ax(6),aw(aA.LayoutOrder,
aB.Vertical,aC.Center,aD.Top,UDim.new(0,8)),ao'Frame'{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,[ap]={aw(aA.
LayoutOrder,aB.Horizontal,aC.Center,aD.Center,UDim.new(0,4)),ao'TextButton'{Size=UDim2.new(1,-84,0,32),BackgroundColor3=
ak.selectedTab,[au'Activated']=function()if aF(p.boolean)then B:set(true)G=aH(F,15)return end z:set(true)q:update(
'boolean',true)end,[ap]={ax(6),az(6),aw(aA.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,5)),ao'ImageLabel'{
ZIndex=0,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Image=aF(p.boolean)and al.finger or al.command,
ImageColor3=ak.text2,ImageTransparency=0},ao'TextLabel'{Visible=not aF(p.boolean),Size=UDim2.new(1,-25,0,16),
BackgroundTransparency=1,FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.
TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()return aF(z)and'Listening'or aF(A)and aF(A).Name or'Waiting'
end)},ao'TextLabel'{Visible=aF(p.boolean),Size=UDim2.new(1,-25,0,16),BackgroundTransparency=1,FontFace=aI('Montserrat',
Enum.FontWeight.Bold),TextScaled=true,TextXAlignment=Enum.TextXAlignment.Center,TextColor3=ak.text2,Text=as(function()
return aF(B)and'Move Bind'or'Place Bind'end)}}},ao'TextButton'{Size=UDim2.fromOffset(32,32),BackgroundColor3=ak.
selectedTab,[au'Activated']=function()v:set(not aF(v))end,[ap]={ax(6),ao'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Image=as(function()return aF(v)
and al.minimize or al.maximize end),ImageColor3=ak.text2,ImageTransparency=0}}},ao'TextButton'{Size=UDim2.fromOffset(32,
32),BackgroundColor3=ak.selectedTab,[au'Activated']=function()if not aF(B)then ac(ae.components.notification){Parent=d,
Title='Darius Interface',Body=`You must {aF(p.boolean)and'place your bind'or'bind to a key'} before hiding the UI!`,
Duration=5,Image=al.alert,ImageColor=ak.get'red'}return end o:update('boolean',not aF(o.boolean))end,[ap]={ax(6),ao
'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,Image=al.close,ImageColor3=ak.orange,ImageTransparency=0}}}}},ao'ScrollingFrame'{Name=
'tabButtonList',Size=aJ(function()return aF(y)and UDim2.new(1,0,0,0)or UDim2.new(1,0,1,-90)end,30,1),
BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=true,[ar]=b,[ap]={aw(aA.LayoutOrder,aB.Vertical,aC.Left,aD.Top,UDim.new(0,6)),az(0,10)}},ao'TextButton'
{Size=UDim2.new(1,-10,0,24),BackgroundColor3=ak.selectedTab,[au'Activated']=function()aF(s)()end,[ap]={ax(4),az(6),aw(aA
.LayoutOrder,aB.Horizontal,aC.Left,aD.Center,UDim.new(0,4)),ao'ImageLabel'{BackgroundTransparency=1,Size=UDim2.
fromOffset(24,24),ImageColor3=ak.red,Image=al.close,ImageTransparency=0.3},ao'TextLabel'{Size=UDim2.new(1,-28,1),
FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.red,TextScaled=true,Text='Destroy Interface',
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.3,[ap]={ao'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=16}}}}}}}}},ao'Frame'{Name='notificationList',BackgroundTransparency=1,Size=UDim2.new(0,2,1,-
20),Position=UDim2.new(1,-5,0.5,0),AnchorPoint=Vector2.new(1,0.5),ClipsDescendants=false,[ar]=d,[ap]={aw(aA.LayoutOrder,
aB.Vertical,aC.Right,aD.Bottom)}}}}if H.screenSize.AbsoluteSize.X<aF(t)then t:set(H.screenSize.AbsoluteSize.X*0.9)end if
H.screenSize.AbsoluteSize.Y<aF(u)then u:set(H.screenSize.AbsoluteSize.Y*0.9)end F=ao'TextButton'{Visible=as(function()
return(aF(B)and aF(p.boolean))end),Interactable=as(function()return(aF(B)and aF(p.boolean))end),Parent=aG.get(aF(h.name)
),Size=UDim2.fromOffset(60,60),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),TextScaled=true,Text=
'Toggle UI',FontFace=aI('Montserrat',Enum.FontWeight.Bold),TextColor3=ak.mobileButtonText,BackgroundColor3=ak.
mobileButtonBackground,BackgroundTransparency=0.6,TextTransparency=0.1,[au'Activated']=function()if G then G:Disconnect(
)G=nil else o:update('boolean',not aF(o.boolean))end end,[ap]={az(4),ax(16),ay(0,16),ao'ImageLabel'{ZIndex=0,AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(32,32),BackgroundTransparency=1,Image=aF(p
.boolean)and al.finger or al.command,ImageColor3=ak.mobileButtonImage,ImageTransparency=0.8}}}local I=aj.InputBegan:
Connect(function(I,J)if aF(p.boolean)then return end if aF(z)then if I.KeyCode and I.KeyCode~=Enum.KeyCode.Unknown then
C(I.KeyCode,'From input box')end z:set(false)task.wait()q:update('boolean',false)else if I.KeyCode and I.KeyCode==aF(A)
and not J and not aF(q.boolean)then o:update('boolean',not aF(o.boolean))end end end)aK.add(I)local J=aH(aG.get
'container',15)aK.add(aG.get'container':GetPropertyChangedSignal'Position':Connect(function()local K=aG.get'container'
local L=K.AbsolutePosition+Vector2.new(aF(t)/2,aF(u)/2)if(L.X-H.screenSize.AbsoluteSize.X)/aF(t)>0.435 then J:
Disconnect()K.Position=UDim2.new(0.5,0,K.Position.Y.Scale,K.Position.Y.Offset)J=aH(aG.get'container',15)end if-((L.X-H.
screenSize.AbsoluteSize.X)/aF(t)+1)>0.8 then J:Disconnect()K.Position=UDim2.new(0.5,0,K.Position.Y.Scale,K.Position.Y.
Offset)J=aH(aG.get'container',15)end if(L.Y-(H.screenSize.AbsoluteSize.Y+aF(g.number)))/aF(u)>0.32 then J:Disconnect()K.
Position=UDim2.new(K.Position.X.Scale,K.Position.X.Offset,0.5,aF(g.number))J=aH(aG.get'container',15)end if-((L.Y-(H.
screenSize.AbsoluteSize.Y+aF(g.number)))/aF(u)+1)>0.935 then J:Disconnect()K.Position=UDim2.new(K.Position.X.Scale,K.
Position.X.Offset,0.5,aF(g.number))J=aH(aG.get'container',15)end end))end end)()end,[31]=function()local aa,ab,ac=a(31)
local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:FindFirstChild(af)then return ac(ab[af
])else error('no utility: '..af)end end})end)()end,[32]=function()local aa,ab,ac=a(32)local ad return(function(...)local
ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(af:number,ag:Enum.AspectType,ah:Enum.DominantAxis)ag=ag or Enum.
AspectType.FitWithinMaxSize ah=ah or Enum.DominantAxis.Height return ae.New'UIAspectRatioConstraint'{AspectRatio=af,
AspectType=ag,DominantAxis=ah}end end)()end,[33]=function()local aa,ab,ac=a(33)local ad return(function(...)local ae=ac(
ab.Parent.Parent.Bundles.Fusion)return function(af,ag)ag=ag or 0 return ae.New'UICorner'{CornerRadius=UDim.new(ag,af)}
end end)()end,[34]=function()local aa,ab,ac=a(34)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.
Fusion)return function(af,ag,ah,ai,aj)return ae.New'UIListLayout'{SortOrder=af or Enum.SortOrder.LayoutOrder,
FillDirection=ag or Enum.FillDirection.Vertical,HorizontalAlignment=ah or Enum.HorizontalAlignment.Center,
VerticalAlignment=ai or Enum.VerticalAlignment.Center,Padding=aj or UDim.new(0,0)}end end)()end,[35]=function()local aa,
ab,ac=a(35)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return function(...)local af={...}if
#af==1 then return ae.New'UIPadding'{PaddingTop=typeof(...)=='number'and UDim.new(0,...)or...,PaddingRight=typeof(...)==
'number'and UDim.new(0,...)or...,PaddingBottom=typeof(...)=='number'and UDim.new(0,...)or...,PaddingLeft=typeof(...)==
'number'and UDim.new(0,...)or...}elseif#af==2 then return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.
new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[1])==
'number'and UDim.new(0,af[1])or af[1],PaddingLeft=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}elseif#af==3 then
return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])==
'number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=
typeof(af[2])=='number'and UDim.new(0,af[2])or af[2]}else return ae.New'UIPadding'{PaddingTop=typeof(af[1])=='number'and
UDim.new(0,af[1])or af[1],PaddingRight=typeof(af[2])=='number'and UDim.new(0,af[2])or af[2],PaddingBottom=typeof(af[3])
=='number'and UDim.new(0,af[3])or af[3],PaddingLeft=typeof(af[4])=='number'and UDim.new(0,af[4])or af[4]}end end end)()
end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)return
function(af:number?,ag:number?)return ae.New'UITextSizeConstraint'{MinTextSize=af,MaxTextSize=ag}end end)()end,[37]=
function()local aa,ab,ac=a(37)local ad return(function(...)return setmetatable({},{__index=function(ae,af)if ab:
FindFirstChild(af)then return ac(ab[af])else error('no utility: '..af)end end})end)()end,[38]=function()local aa,ab,ac=
a(38)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return
function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[39]=function()local aa,ab,ac=a(39)local ad return(function(...)
local ae,af,ag={},{},ac(ab.Parent.Parent.Bundles.services)function af.add(ah)table.insert(ae,ah)end function af.
deleteConnections()for ah,ai in ae do if typeof(ai)=='function'then ai()else ai:Disconnect()end ae[ah]=nil end end
return af end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)local ae={Inter=
'rbxassetid://12187365364',Montserrat='rbxassetid://11702779517'}return function(af:string,ag:Enum.FontWeight?,ah:Enum.
FontStyle?)assert(af,'font required')ag=ag or Enum.FontWeight.Regular ah=ah or Enum.FontStyle.Normal if ae[af]then
return Font.new(ae[af],ag,ah)else error('no font:',af)end end end)()end,[41]=function()local aa,ab,ac=a(41)local ad
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
function ae.getthreadidentity()if getthreadidentity then return getthreadidentity()else return 5 end end function ae.
setthreadidentity(ag:number)if setthreadidentity then return setthreadidentity(ag)else return 5 end end return ae end)()
end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.
Parent.Bundles.services),af or 10 local ai,aj,ak,al,am,an,ao=ag.UserInputService,ag.RunService,ae local function ap(aq,
ar,as)return aq+(ar-aq)*as end local aq=Instance.new'BindableEvent'local function ar(as)if not(ao)then return end if not
(al)and(an)then ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,an.X.Offset,as*ah),ao.Y.Scale,ap(ak.Position.Y.
Offset,an.Y.Offset,as*ah))return end local at=(am-ai:GetMouseLocation())local au,av=(ao.X.Offset-at.X),(ao.Y.Offset-at.Y
)an=UDim2.new(ao.X.Scale,au,ao.Y.Scale,av)ak.Position=UDim2.new(ao.X.Scale,ap(ak.Position.X.Offset,au,as*ah),ao.Y.Scale,
ap(ak.Position.Y.Offset,av,as*ah))end ak.InputBegan:Connect(function(as)if as.UserInputType==Enum.UserInputType.
MouseButton1 or as.UserInputType==Enum.UserInputType.Touch then al=true ao=ak.Position am=ai:GetMouseLocation()as.
Changed:Connect(function()if as.UserInputState==Enum.UserInputState.End then aq:Fire()al=false end end)end end)local as=
aj.Heartbeat:Connect(ar)return as,aq.Event end end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(...
)return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[44]=
function()local aa,ab,ac=a(44)local ad return(function(...)return function(ae:string,af)ae=ae or''local ag=Instance.new
'GetTextBoundsParams'ag.Text=ae ag.Font=af.Font ag.Size=af.Size ag.Width=af.Width local ah=ac(ab.Parent.Parent.Bundles.
services).TextService return ah:GetTextBoundsAsync(ag)end end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(
function(...)local ae=string.split([[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890]],'')local function
af(ag)if ag>0 then return af(ag-1)..ae[math.random(1,#ae)]else return''end end return af end)()end,[46]=function()local
aa,ab,ac=a(46)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.Parent.Parent.Bundles.Fusion).Observer,ac(ab.
Parent.get)function af.add(...)for ai,aj in{...}do if typeof(ah(aj))~='Instance'then ag(aj):onChange(function()if
typeof(ah(aj))=='Instance'then if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end)else if not ae[ah(aj).Name]then ae[ah(aj).Name]=ah(aj)else warn(ah(aj).Name,
' REF was already added')end end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if
ae[ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=
nil if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[47]=function()local aa,ab,ac=a(47)local
ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.
Tween(af(ag),ah)end end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)return function(ae:table,
af:table,ag:table?):any ag=ag or{}local ah,ai=true,{}for aj,ak in af do if(ae[aj]==nil or typeof(ae[aj])~=typeof(ak))and
not table.find(ag,aj)then ah=false table.insert(ai,`{aj} expected: {typeof(ak)} got: {typeof(ae[aj])}`)end end return ah
,ai end end)()end},{{1,2,{'Darius'},{{29,1,{'layouts'},{{30,2,{'main'}}}},{2,2,{'Bundles'},{{3,2,{'Fusion'}},{6,2,{
'icons'}},{8,2,{'services'}},{5,2,{'flags'}},{9,2,{'themeSystem'},{{10,2,{'default'}}}},{4,2,{'data'}},{7,2,{'lucide'}}}
},{37,2,{'utilities'},{{42,2,{'drag'}},{38,2,{'animate'}},{40,2,{'customFont'}},{41,2,{'customFunctions'}},{46,2,{
'references'}},{47,2,{'tween'}},{48,2,{'typecheck'}},{39,2,{'connections'}},{44,2,{'getStringBounds'}},{45,2,{
'randomString'}},{43,2,{'get'}}}},{31,2,{'simpleElements'},{{34,2,{'UIListLayout'}},{32,2,{'UIAspectRatioConstraint'}},{
33,2,{'UICorner'}},{35,2,{'UIPadding'}},{36,2,{'UITextSizeConstraint'}}}},{11,1,{'components'},{{14,2,{'colorpicker'}},{
25,2,{'tabFrame'}},{13,2,{'buttonGroup'}},{22,2,{'paragraph'}},{12,2,{'button'}},{20,2,{'module'}},{21,2,{'notification'
}},{24,2,{'tabButton'}},{17,2,{'keybind'}},{26,2,{'textbox'}},{27,2,{'toggle'}},{28,2,{'warn'}},{16,2,{'dropdown'}},{18,
2,{'keybindList'}},{15,2,{'divider'}},{19,2,{'label'}},{23,2,{'slider'}}}}}}},'0.4.1','WaxRuntime',string,task,
setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay
,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,ae.gmatch if as and ay(as,1,4)
=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,
aG,aH,aI,aJ,aK=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]=
'StringValue'},{},{},{},{},{},{},{}local aL,aM={GetFullName={{},function(aL)local aM,b=aL.Name,aL.Parent while b do aM=b
.Name..'.'..aM b=b.Parent end return aM end},GetChildren={{},function(aL)local aM={}for b in ai,aK[aL]do au(aM,b)end
return aM end},GetDescendants={{},function(aL)local aM={}for b in ai,aK[aL]do au(aM,b)for c,d in ai,b:GetDescendants()do
au(aM,d)end end return aM end},FindFirstChild={{'string','boolean?'},function(aL,aM,b)local c=aK[aL]for d in ai,c do if
d.Name==aM then return d end end if b then for e in ai,c do return e:FindFirstChild(aM,true)end end end},
FindFirstAncestor={{'string'},function(aL,aM)local b=aL.Parent while b do if b.Name==aM then return b end b=b.Parent end
end},WaitForChild={{'string','number?'},function(aL,aM)return aL:FindFirstChild(aM)end}},{}for b,c in ai,aL do local d,e
,f=c[1],c[2],{}for g,h in ai,d do local i,j=az(h,'^([^%?]+)(%??)')f[g]={i,j}end aM[b]=function(i,...)if not aK[i]then
ah("Expected ':' not '.' calling member function "..b,2)end local j={...}for k,o in ai,f do local p=j[k]local q,r,s=an(p
),o[1],o[2]if p==nil and not s then ah('Argument '..p..' missing or nil',3)end if r~='any'and q~=r and not(q=='nil'and s
)then ah('Argument '..k..' expects type "'..r..'", got "'..q..'"',2)end end return e(i,...)end end local function d(e,f,
g)local h,i=(ag({},{__mode='k'}))local function j(k)ah(k..' is not a valid (virtual) member of '..e..' "'..f..'"',3)end
local function k(o)ah('Unable to assign (virtual) property '..o..'. Property is read only',3)end local o,p={},{}p.
__metatable=false p.__index=function(q,r)if r=='ClassName'then return e elseif r=='Name'then return f elseif r=='Parent'
then return g elseif e=='StringValue'and r=='Value'then return i else local s=aM[r]if s then return s end end for s in
ai,h do if s.Name==r then return s end end j(r)end p.__newindex=function(q,r,s)if r=='ClassName'then k(r)elseif r==
'Name'then f=s elseif r=='Parent'then if s==o then return end if g~=nil then aK[g][o]=nil end g=s if s~=nil then aK[s][o
]=true end elseif e=='StringValue'and r=='Value'then i=s else j(r)end end p.__tostring=function()return f end ag(o,p)aK[
o]=h if g~=nil then aK[g][o]=true end return o end local function e(f,g)local h,i,j,k=f[1],f[2],f[3],f[4]local o=aD[i]
local p=j and av(j,1)or o local q=d(o,p,g)aE[h]=q if j then for r,s in ai,j do q[r]=s end end if k then for r,s in ai,k
do e(s,q)end end return q end local f=d('Folder','['..ad..']')for g,h in ai,ab do e(h,f)end for i,j in ai,aa do local k=
aE[i]aF[k]=j aG[k]=i local o=k.ClassName if o=='LocalScript'or o=='Script'then au(aI,k)end end local function k(o)local
p,q=o.ClassName,aH[o]if q and p=='ModuleScript'then return ak(q)end local r=aF[o]local function s(t)t=aq(t)local u,v,w=o
:GetFullName(),az(t,'[^:]+:(%d+): (.+)')if not v or not at then return u..':*: '..(w or t)end v=ar(v)local x=aG[o]local
y=at[x]local z=v-y+1 if z<0 then z='?'end return u..':'..z..': '..w end if p=='LocalScript'or p=='Script'then local t,u=
ap(r)if not t then ah(s(u),0)end else local t={ap(r)}local u=av(t,1)if not u then local v=av(t,1)ah(s(v),0)end aH[o]=t
return ak(t)end end function a(o)local p=aE[o]local function q(r,...)local s={ap(r,...)}local t=av(s,1)if not t then ah(
s[1],3)end return ak(s)end local r=aw(ag({},{__index=aJ,__newindex=function(r,s,t)aJ[s]=t end,__len=function()return#aJ
end,__iter=function()return ai,aJ end}))local s,t=aw{version=ac,envname=ad,shared=r,script=am,require=ao},p
local function u(v,...)local w,x,y=an(v),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if w=='table'and aK[v]then if v.ClassName~='ModuleScript'then ah(x,2)elseif v==p
then ah(y,2)end return k(v)elseif w=='string'and ay(v,1,1)~='@'then if#v==0 then ah(
'Attempted to call require with empty string',2)end local z=p if ay(v,1,1)=='/'then z=f elseif ay(v,1,2)=='./'then v=ay(
v,3)end local A for B in aA(v,'([^/]*)/?')do local C=B if B=='..'then C='Parent'end if C~=''then local D=z:
FindFirstChild(C)if not D then local E=z.Parent if E then D=E:FindFirstChild(C)end end if D then z=D elseif B~=A and B~=
'init'and B~='init.server'and B~='init.client'then ah('Virtual script path "'..v..'" not found',2)end end A=B end if z.
ClassName~='ModuleScript'then ah(x,2)elseif z==p then ah(y,2)end return k(z)end return q(ao,v,...)end return s,t,u end
for o,p in ai,aI do aC(k,p)end return k(f:GetChildren()[1])