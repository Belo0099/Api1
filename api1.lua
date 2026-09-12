local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- ── Safe filesystem helpers ───────────────────────────
local function safeReadFile(path)
    if type(readfile) == "function" and type(isfile) == "function" then
        local ok, result = pcall(isfile, path)
        if ok and result then
            local ok2, data = pcall(readfile, path)
            if ok2 then return data end
        end
    end
    return nil
end

local function safeWriteFile(path, data)
    if type(writefile) == "function" then
        pcall(writefile, path, data)
    end
end

local function safeSetClipboard(text)
    if type(setclipboard) == "function" then
        pcall(setclipboard, text)
    elseif type(toclipboard) == "function" then
        pcall(toclipboard, text)
    end
end

local MyLibrary = {
    Themes = {
        Main = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 15)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(120, 0, 0)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(200, 20, 20))
            }),
            ["Color Hub 2"]      = Color3.fromRGB(15, 15, 15),
            ["Color Stroke"]     = Color3.fromRGB(200, 20, 20),
            ["Color Theme"]      = Color3.fromRGB(200, 20, 20),
            ["Color Text"]       = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"]  = Color3.fromRGB(160, 160, 160),
        },
    },
    Info       = { Version = "1.1.0 VIP" },
    Save       = { UISize = {620, 420}, TabSize = 170, Theme = "Main" },
    Settings   = {},
    Connection = {},
    Instances  = {},
    Elements   = {},
    Options    = {},
    Flags      = {},
    Tabs       = {},
    Icons = (function()
        return {
            ["accessibility"]="rbxassetid://10709751939",["activity"]="rbxassetid://10709752035",
            ["airvent"]="rbxassetid://10709752131",["airplay"]="rbxassetid://10709752254",
            ["alarmcheck"]="rbxassetid://10709752405",["alarmclock"]="rbxassetid://10709752630",
            ["alarmclockoff"]="rbxassetid://10709752508",["alarmminus"]="rbxassetid://10709752732",
            ["alarmplus"]="rbxassetid://10709752825",["album"]="rbxassetid://10709752906",
            ["alertcircle"]="rbxassetid://10709752996",["alertoctagon"]="rbxassetid://10709753064",
            ["alerttriangle"]="rbxassetid://10709753149",["anchor"]="rbxassetid://10709761530",
            ["angry"]="rbxassetid://10709761629",["annoyed"]="rbxassetid://10709761722",
            ["aperture"]="rbxassetid://10709761813",["apple"]="rbxassetid://10709761889",
            ["archive"]="rbxassetid://10709762233",["arrowdown"]="rbxassetid://10709767827",
            ["arrowleft"]="rbxassetid://10709768114",["arrowright"]="rbxassetid://10709768347",
            ["arrowup"]="rbxassetid://10709768939",["award"]="rbxassetid://10709769406",
            ["bell"]="rbxassetid://10709775704",["bellring"]="rbxassetid://10709775560",
            ["bot"]="rbxassetid://10709782230",["calendar"]="rbxassetid://10709789505",
            ["camera"]="rbxassetid://10709789686",["check"]="rbxassetid://10709790644",
            ["checkcircle"]="rbxassetid://10709790387",["chevrondown"]="rbxassetid://10709790948",
            ["chevronleft"]="rbxassetid://10709791281",["chevronright"]="rbxassetid://10709791437",
            ["chevronup"]="rbxassetid://10709791523",["clock"]="rbxassetid://10709805144",
            ["code"]="rbxassetid://10709810463",["cog"]="rbxassetid://10709810948",
            ["coins"]="rbxassetid://10709811110",["crown"]="rbxassetid://10709818626",
            ["database"]="rbxassetid://10709818996",["diamond"]="rbxassetid://10709819149",
            ["download"]="rbxassetid://10723344270",["edit"]="rbxassetid://10734883598",
            ["eye"]="rbxassetid://10723346959",["eyeoff"]="rbxassetid://10723346871",
            ["file"]="rbxassetid://10723374641",["flag"]="rbxassetid://10723375890",
            ["flame"]="rbxassetid://10723376114",["folder"]="rbxassetid://10723387563",
            ["gem"]="rbxassetid://10723396000",["ghost"]="rbxassetid://10723396107",
            ["gift"]="rbxassetid://10723396402",["globe"]="rbxassetid://10723404337",
            ["heart"]="rbxassetid://10723406885",["home"]="rbxassetid://10723407389",
            ["info"]="rbxassetid://10723415903",["key"]="rbxassetid://10723416652",
            ["layers"]="rbxassetid://10723424505",["lightbulb"]="rbxassetid://10723425852",
            ["lock"]="rbxassetid://10723434711",["mail"]="rbxassetid://10734885430",
            ["map"]="rbxassetid://10734886202",["medal"]="rbxassetid://10734887072",
            ["mic"]="rbxassetid://10734888864",["minus"]="rbxassetid://10734896206",
            ["moon"]="rbxassetid://10734897102",["music"]="rbxassetid://10734905958",
            ["package"]="rbxassetid://10734909540",["pencil"]="rbxassetid://10734919691",
            ["phone"]="rbxassetid://10734921524",["plus"]="rbxassetid://10734924532",
            ["power"]="rbxassetid://10734930466",["rocket"]="rbxassetid://10734934585",
            ["save"]="rbxassetid://10734941499",["search"]="rbxassetid://10734943674",
            ["settings"]="rbxassetid://10734950309",["shield"]="rbxassetid://10734951847",
            ["shieldcheck"]="rbxassetid://10734951367",["star"]="rbxassetid://10734966248",
            ["sun"]="rbxassetid://10734974297",["sword"]="rbxassetid://10734975486",
            ["swords"]="rbxassetid://10734975692",["target"]="rbxassetid://10734977012",
            ["terminal"]="rbxassetid://10734982144",["trash"]="rbxassetid://10747362393",
            ["trophy"]="rbxassetid://10747363809",["unlock"]="rbxassetid://10747366027",
            ["upload"]="rbxassetid://10747366434",["user"]="rbxassetid://10747373176",
            ["users"]="rbxassetid://10747373426",["verified"]="rbxassetid://10747374131",
            ["video"]="rbxassetid://10747374938",["volume"]="rbxassetid://10747376008",
            ["wallet"]="rbxassetid://10747376205",["wifi"]="rbxassetid://10747382504",
            ["x"]="rbxassetid://10747384394",["xcircle"]="rbxassetid://10747383819",
            ["zoomin"]="rbxassetid://10747384552",["zoomout"]="rbxassetid://10747384679",
            ["bomb"]="rbxassetid://10709781460",["bug"]="rbxassetid://10709782845",
            ["coffee"]="rbxassetid://10709810814",["compass"]="rbxassetid://10709811445",
            ["gamepad"]="rbxassetid://10723395457",["gauge"]="rbxassetid://10723395708",
            ["hammer"]="rbxassetid://10723405360",["headphones"]="rbxassetid://10723406165",
            ["joystick"]="rbxassetid://10723416527",["paintbrush"]="rbxassetid://10734910187",
            ["pizza"]="rbxassetid://10734922774",["plane"]="rbxassetid://10734922971",
            ["printer"]="rbxassetid://10734930632",["skull"]="rbxassetid://10734962068",
            ["smile"]="rbxassetid://10734964441",["snowflake"]="rbxassetid://10734964600",
            ["thumbsup"]="rbxassetid://10734983629",["timer"]="rbxassetid://10734984606",
            ["train"]="rbxassetid://10747362105",["truck"]="rbxassetid://10747364031",
            ["tv"]="rbxassetid://10747364593",["umbrella"]="rbxassetid://10747364971",
            ["wand"]="rbxassetid://10747376565",["watch"]="rbxassetid://10747376722",
            ["wind"]="rbxassetid://10747382750",["wrench"]="rbxassetid://10747383470",
            ["zap"]="rbxassetid://10723345749",
        }
    end)(),
}

-- ══════════════════════════════════════════════════════
local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale      = ViewportSize.Y / 450
local Settings     = MyLibrary.Settings
local Flags        = MyLibrary.Flags

-- ── helpers ──────────────────────────────────────────
local SetProps, SetChildren, InsertTheme, Create

InsertTheme = function(inst, Type)
    table.insert(MyLibrary.Instances, {Instance = inst, Type = Type})
    return inst
end

SetChildren = function(inst, children)
    if children then
        for _, child in ipairs(children) do child.Parent = inst end
    end
    return inst
end

SetProps = function(inst, props)
    if props then
        for k, v in pairs(props) do inst[k] = v end
    end
    return inst
end

Create = function(...)
    local args = {...}
    local new  = Instance.new(args[1])
    if type(args[2]) == "table" then
        SetProps(new, args[2]); SetChildren(new, args[3])
    elseif typeof(args[2]) == "Instance" then
        new.Parent = args[2]; SetProps(new, args[3]); SetChildren(new, args[4])
    end
    return new
end

-- load saved sizes
do
    local data = safeReadFile("redz_library.json")
    if data then
        local ok, f = pcall(HttpService.JSONDecode, HttpService, data)
        if ok and type(f) == "table" then
            if f.UISize  then MyLibrary.Save.UISize  = f.UISize  end
            if f.TabSize then MyLibrary.Save.TabSize = f.TabSize end
        end
    end
end

-- ── Funcs ────────────────────────────────────────────
local Funcs = {}
function Funcs:InsertCallback(t, fn) if type(fn)=="function" then table.insert(t,fn) end; return fn end
function Funcs:FireCallback(t, ...)  for _,v in ipairs(t) do if type(v)=="function" then task.spawn(v,...) end end end
function Funcs:ToggleVisible(o, b)  o.Visible = b~=nil and b or not o.Visible end
function Funcs:ToggleParent(o, b, p) o.Parent = (b~=nil) and (b and p or nil) or (o.Parent and nil or p) end
function Funcs:GetConnectionFunctions(cf, fn)
    local c = {Function=fn, Connected=true}
    function c:Disconnect() if self.Connected then local i=table.find(cf,self.Function); if i then table.remove(cf,i) end; self.Connected=false end end
    function c:Fire(...) if self.Connected then task.spawn(self.Function,...) end end
    return c
end
function Funcs:GetCallback(cfg, idx)
    local fn = cfg[idx] or cfg.Callback or function() end
    if type(fn)=="table" then return {function(v) fn[1][fn[2]]=v end} end
    return {fn}
end

-- ── Connections ───────────────────────────────────────
local Connections, Connection = {}, MyLibrary.Connection
do
    local function NewList(list)
        for _, name in ipairs(list) do
            local cf, c = {}, {}
            Connection[name]=c; Connections[name]=cf; c.Name=name
            function c:Connect(fn) if type(fn)=="function" then table.insert(cf,fn); return Funcs:GetConnectionFunctions(cf,fn) end end
            function c:Once(fn)
                if type(fn)=="function" then
                    local conn; local wrap; wrap=function(...) task.spawn(fn,...); conn:Disconnect() end
                    conn=Funcs:GetConnectionFunctions(cf,wrap); table.insert(cf,wrap); return conn
                end
            end
        end
    end
    function Connection:FireConnection(name, ...)
        local cf = type(name)=="string" and Connections[name] or Connections[name.Name]
        if cf then for _,fn in pairs(cf) do task.spawn(fn,...) end end
    end
    NewList({"FlagsChanged","ThemeChanged","FileSaved","ThemeChanging","OptionAdded"})
end

-- ── Flags ─────────────────────────────────────────────
local GetFlag, SetFlag, CheckFlag
CheckFlag = function(n) return type(n)=="string" and Flags[n]~=nil end
GetFlag   = function(n) return type(n)=="string" and Flags[n] end
SetFlag   = function(flag, val)
    if flag and (val~=Flags[flag] or type(val)=="table") then
        Flags[flag]=val; Connection:FireConnection("FlagsChanged",flag,val)
    end
end
do
    local db
    Connection.FlagsChanged:Connect(function()
        local sf = Settings.ScriptFile
        if not db and sf then
            db=true; task.wait(0.1); db=false
            local ok,enc = pcall(HttpService.JSONEncode, HttpService, Flags)
            if ok then safeWriteFile(sf, enc) end
        end
    end)
end

-- ── ScreenGui ─────────────────────────────────────────
local ScreenGui

-- Tenta CoreGui primeiro, cai para PlayerGui se falhar
local ok_sg, err_sg = pcall(function()
    ScreenGui = Create("ScreenGui", CoreGui, {
        Name="redz_Library_VIP", ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    },{
        Create("UIScale",{Scale=UIScale,Name="Scale"}),
    })
end)

if not ok_sg then
    ScreenGui = Create("ScreenGui", Player.PlayerGui, {
        Name="redz_Library_VIP", ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    },{
        Create("UIScale",{Scale=UIScale,Name="Scale"}),
    })
end

-- Remove instância duplicada se existir
pcall(function()
    local ex = CoreGui:FindFirstChild("redz_Library_VIP")
    if ex and ex~=ScreenGui then ex:Destroy() end
end)

-- ── Tween / Drag ──────────────────────────────────────
local function CT(cfg)
    local inst  = cfg[1] or cfg.Instance
    local prop  = cfg[2] or cfg.Prop
    local val   = cfg[3] or cfg.NewVal
    local time  = cfg[4] or cfg.Time or 0.4
    local wait  = cfg[5] or cfg.wait or false
    local tw = TweenService:Create(inst, TweenInfo.new(time, Enum.EasingStyle.Quint), {[prop]=val})
    tw:Play(); if wait then tw.Completed:Wait() end; return tw
end

local function MakeDrag(inst)
    task.spawn(function()
        inst.Active=true
        local ds,sp,on
        inst.MouseButton1Down:Connect(function() on=true end)
        inst.InputBegan:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1
            or inp.UserInputType==Enum.UserInputType.Touch then
                sp=inst.Position; ds=inp.Position
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    RunService.Heartbeat:Wait()
                    if on then
                        local d=inp.Position-ds
                        CT({inst,"Position",UDim2.new(sp.X.Scale,sp.X.Offset+d.X/UIScale,sp.Y.Scale,sp.Y.Offset+d.Y/UIScale),0.18})
                    end
                end
                on=false
            end
        end)
    end)
    return inst
end

local function SaveJson(fn, data)
    local ok,j = pcall(HttpService.JSONEncode, HttpService, data)
    if ok then safeWriteFile(fn, j) end
end

local function VerifyTheme(t) for n in pairs(MyLibrary.Themes) do if n==t then return true end end end

local Theme = MyLibrary.Themes[MyLibrary.Save.Theme]

local function GetColor(inst)
    if inst:IsA("Frame") then return "BackgroundColor3"
    elseif inst:IsA("ImageLabel") then return "ImageColor3"
    elseif inst:IsA("TextLabel") then return "TextColor3"
    elseif inst:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
    elseif inst:IsA("UIStroke") then return "Color" end
    return ""
end

-- ── Elements ──────────────────────────────────────────
local function AddEle(n,fn) MyLibrary.Elements[n]=fn end
local function Make(n,inst,props,...) return MyLibrary.Elements[n](inst,props,...) end

AddEle("Corner",function(p,r) return Create("UICorner",p,{CornerRadius=r or UDim.new(0,7)}) end)

AddEle("Stroke",function(p,props,...)
    local a={...}
    return InsertTheme(SetProps(Create("UIStroke",p,{
        Color=a[1] or Theme["Color Stroke"], Thickness=a[2] or 1, ApplyStrokeMode="Border"
    }),props),"Stroke")
end)

AddEle("Button",function(p,props,...)
    local a={...}
    local n=InsertTheme(SetProps(Create("TextButton",p,{
        Text="",Size=UDim2.fromScale(1,1),BackgroundColor3=Theme["Color Hub 2"],AutoButtonColor=false
    }),props),"Frame")
    n.MouseEnter:Connect(function() n.BackgroundTransparency=0.4 end)
    n.MouseLeave:Connect(function() n.BackgroundTransparency=0   end)
    if a[1] then n.Activated:Connect(a[1]) end
    return n
end)

AddEle("Gradient",function(p,props)
    return InsertTheme(SetProps(Create("UIGradient",p,{Color=Theme["Color Hub 1"]}),props),"Gradient")
end)

-- ── ButtonFrame ───────────────────────────────────────
local function ButtonFrame(container, title, desc, holderSize)
    local TL = InsertTheme(Create("TextLabel",{
        Font=Enum.Font.FredokaOne, TextColor3=Theme["Color Text"],
        Size=UDim2.new(1,-20), AutomaticSize=Enum.AutomaticSize.Y,
        Position=UDim2.new(0,0,0.5), AnchorPoint=Vector2.new(0,0.5),
        BackgroundTransparency=1, TextTruncate=Enum.TextTruncate.AtEnd,
        TextSize=10, TextXAlignment=Enum.TextXAlignment.Left, Text="", RichText=true,
    }),"Text")
    local DL = InsertTheme(Create("TextLabel",{
        Font=Enum.Font.Gotham, TextColor3=Theme["Color Dark Text"],
        Size=UDim2.new(1,-20), AutomaticSize=Enum.AutomaticSize.Y,
        Position=UDim2.new(0,12,0,15), BackgroundTransparency=1,
        TextWrapped=true, TextSize=8, TextXAlignment=Enum.TextXAlignment.Left, Text="", RichText=true,
    }),"DarkText")

    local frame = Make("Button", container, {
        Size=UDim2.new(1,0,0,25), AutomaticSize=Enum.AutomaticSize.Y, Name="Option"
    })
    Make("Corner", frame, UDim.new(0,6))

    local lh = Create("Frame", frame, {
        AutomaticSize=Enum.AutomaticSize.Y, BackgroundTransparency=1,
        Size=holderSize, Position=UDim2.new(0,10,0), AnchorPoint=Vector2.new(0,0),
    },{
        Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,2)}),
        Create("UIPadding",{PaddingBottom=UDim.new(0,5),PaddingTop=UDim.new(0,5)}),
        TL, DL,
    })

    local Label={}
    function Label:SetTitle(t) if type(t)=="string" and #t:gsub(" ","")>0 then TL.Text=t end end
    function Label:SetDesc(d)
        if type(d)=="string" and #d:gsub(" ","")>0 then
            DL.Visible=true; DL.Text=d; lh.Position=UDim2.new(0,10,0); lh.AnchorPoint=Vector2.new(0,0)
        else
            DL.Visible=false; DL.Text=""; lh.Position=UDim2.new(0,10,0.5); lh.AnchorPoint=Vector2.new(0,0.5)
        end
    end
    Label:SetTitle(title); Label:SetDesc(desc)
    return frame, Label
end

-- ── Library methods ───────────────────────────────────
function MyLibrary:GetIcon(idx)
    if type(idx)~="string" or idx:find("rbxassetid://") or #idx==0 then return idx end
    local first; idx=idx:lower():gsub("lucide",""):gsub("-","")
    for n,ic in pairs(self.Icons) do
        n=n:gsub("lucide",""):gsub("-","")
        if n==idx then return ic end
        if not first and n:find(idx,1,true) then first=ic end
    end
    return first or idx
end

function MyLibrary:SetTheme(nt)
    if not VerifyTheme(nt) then return end
    MyLibrary.Save.Theme=nt; SaveJson("redz_library.json",MyLibrary.Save)
    Theme=MyLibrary.Themes[nt]; Connection:FireConnection("ThemeChanged",nt)
    for _,v in ipairs(MyLibrary.Instances) do
        pcall(function()
            if     v.Type=="Gradient"  then v.Instance.Color               = Theme["Color Hub 1"]
            elseif v.Type=="Frame"     then v.Instance.BackgroundColor3    = Theme["Color Hub 2"]
            elseif v.Type=="Stroke"    then v.Instance[GetColor(v.Instance)]= Theme["Color Stroke"]
            elseif v.Type=="Theme"     then v.Instance[GetColor(v.Instance)]= Theme["Color Theme"]
            elseif v.Type=="Text"      then v.Instance[GetColor(v.Instance)]= Theme["Color Text"]
            elseif v.Type=="DarkText"  then v.Instance[GetColor(v.Instance)]= Theme["Color Dark Text"]
            elseif v.Type=="ScrollBar" then v.Instance[GetColor(v.Instance)]= Theme["Color Theme"]
            end
        end)
    end
end

function MyLibrary:SetScale(s)
    s=ViewportSize.Y/math.clamp(s,300,2000); UIScale=s
    local scaleInst = ScreenGui:FindFirstChild("Scale")
    if scaleInst then scaleInst.Scale=s end
end

-- ══════════════════════════════════════════════════════
--  MakeWindow
-- ══════════════════════════════════════════════════════
function MyLibrary:MakeWindow(Configs)
    local WTitle    = Configs[1] or Configs.Name    or Configs.Title    or "VIP Panel"
    local WSubTitle = Configs[2] or Configs.SubTitle or "Premium Edition"
    Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false

    -- load flags
    if Settings.ScriptFile then
        local data = safeReadFile(Settings.ScriptFile)
        if data then
            local ok,r = pcall(HttpService.JSONDecode, HttpService, data)
            if ok and type(r)=="table" then Flags=r end
        end
    end

    local SW, SH = unpack(MyLibrary.Save.UISize)
    local TW     = MyLibrary.Save.TabSize

    -- ── MAIN FRAME ────────────────────────────────────
    local MainFrame = InsertTheme(Create("Frame", ScreenGui, {
        Size     = UDim2.fromOffset(SW, SH),
        Position = UDim2.new(0.5,-SW/2, 0.5,-SH/2),
        BackgroundColor3 = Color3.fromRGB(14,14,14),
        BorderSizePixel  = 0,
        ClipsDescendants = true,
        Name = "Hub",
    }),"Frame")
    Make("Corner", MainFrame, UDim.new(0,10))
    Make("Gradient", MainFrame, {Rotation=45})

    -- drag
    do
        local ds,sp,on=nil,nil,false
        MainFrame.InputBegan:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1
            or inp.UserInputType==Enum.UserInputType.Touch then
                sp=MainFrame.Position; ds=inp.Position; on=true
            end
        end)
        MainFrame.InputEnded:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1
            or inp.UserInputType==Enum.UserInputType.Touch then on=false end
        end)
        RunService.Heartbeat:Connect(function()
            if on and ds then
                local ok2, mp = pcall(function() return UserInputService:GetMouseLocation() end)
                if ok2 and mp then
                    local d = mp - Vector2.new(ds.X, ds.Y)
                    MainFrame.Position = UDim2.new(0, sp.X.Offset+d.X/UIScale,
                                                   0, sp.Y.Offset+d.Y/UIScale)
                end
            end
        end)
    end

    local DropdownHolder = Create("Folder", ScreenGui, {Name="Dropdown"})

    -- ── TOP BAR ───────────────────────────────────────
    local TopBar = Create("Frame", MainFrame, {
        Size=UDim2.new(1,0,0,30), BackgroundTransparency=1, Name="TopBar", ZIndex=10,
    })

    InsertTheme(Create("TextLabel", TopBar, {
        Position=UDim2.new(0,15,0.5), AnchorPoint=Vector2.new(0,0.5),
        AutomaticSize=Enum.AutomaticSize.XY, Text=WTitle,
        TextXAlignment=Enum.TextXAlignment.Left, TextSize=12,
        TextColor3=Theme["Color Text"], BackgroundTransparency=1,
        Font=Enum.Font.BuilderSansBold, Name="Title", ZIndex=10,
    }),"Text")

    InsertTheme(Create("TextLabel", TopBar, {
        Position=UDim2.new(0,15,1,-2), AnchorPoint=Vector2.new(0,1),
        AutomaticSize=Enum.AutomaticSize.XY, Text=WSubTitle,
        TextXAlignment=Enum.TextXAlignment.Left, TextSize=9,
        TextColor3=Theme["Color Dark Text"], BackgroundTransparency=1,
        Font=Enum.Font.Gotham, Name="SubTitle", ZIndex=10,
    }),"DarkText")

    local CloseBtn = Create("ImageButton", TopBar, {
        Size=UDim2.new(0,14,0,14), Position=UDim2.new(1,-12,0.5),
        AnchorPoint=Vector2.new(1,0.5), BackgroundTransparency=1,
        Image="rbxassetid://10747384394", AutoButtonColor=false,
        Name="Close", ZIndex=10,
    })

    local MinBtn = Create("ImageButton", TopBar, {
        Size=UDim2.new(0,14,0,14), Position=UDim2.new(1,-34,0.5),
        AnchorPoint=Vector2.new(1,0.5), BackgroundTransparency=1,
        Image="rbxassetid://10734896206", AutoButtonColor=false,
        Name="Minimize", ZIndex=10,
    })

    Create("Frame", MainFrame, {
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,0,30),
        BackgroundColor3=Theme["Color Stroke"], BackgroundTransparency=0.5,
        BorderSizePixel=0, ZIndex=5,
    })

    -- ── SIDEBAR ───────────────────────────────────────
    local Sidebar = InsertTheme(Create("Frame", MainFrame, {
        Size=UDim2.new(0,TW,1,-31), Position=UDim2.new(0,0,0,31),
        BackgroundColor3=Theme["Color Hub 2"], BorderSizePixel=0,
        Name="Sidebar", ZIndex=2, ClipsDescendants=false,
    }),"Frame")
    Make("Corner", Sidebar, UDim.new(0,8))

    local ProfileFrame = InsertTheme(Create("Frame", Sidebar, {
        Size=UDim2.new(1,0,0,66), Position=UDim2.new(0,0,0,6),
        BackgroundColor3=Theme["Color Hub 2"], BorderSizePixel=0, ZIndex=3,
    }),"Frame")

    local AvatarImg = Create("ImageLabel", ProfileFrame, {
        Size=UDim2.new(0,40,0,40), Position=UDim2.new(0,10,0,8),
        Image="rbxthumb://type=AvatarHeadShot&id="..Player.UserId.."&w=420&h=420",
        BackgroundColor3=Color3.fromRGB(20,20,20), ZIndex=4,
    })
    Make("Corner", AvatarImg, UDim.new(1,0))

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size=UDim2.new(1,-65,0,18), Position=UDim2.new(0,58,0,10),
        Text=WTitle, TextColor3=Theme["Color Text"], Font=Enum.Font.GothamBold,
        TextSize=12, TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1, ZIndex=4, TextTruncate=Enum.TextTruncate.AtEnd,
    }),"Text")

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size=UDim2.new(1,-65,0,14), Position=UDim2.new(0,58,0,30),
        Text="@"..Player.Name, TextColor3=Theme["Color Dark Text"],
        Font=Enum.Font.Gotham, TextSize=10, TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1, ZIndex=4,
    }),"DarkText")

    Create("Frame", Sidebar, {
        Size=UDim2.new(1,-16,0,1), Position=UDim2.new(0,8,0,78),
        BackgroundColor3=Theme["Color Stroke"], BackgroundTransparency=0.4,
        BorderSizePixel=0, ZIndex=3,
    })

    local TabContainer = InsertTheme(Create("ScrollingFrame", Sidebar, {
        Size=UDim2.new(1,0,1,-88), Position=UDim2.new(0,0,0,88),
        BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=2, ScrollBarImageColor3=Theme["Color Theme"],
        CanvasSize=UDim2.new(), AutomaticCanvasSize=Enum.AutomaticSize.Y, ZIndex=2,
    }),"ScrollBar")
    Create("UIPadding", TabContainer, {
        PaddingTop=UDim.new(0,8), PaddingBottom=UDim.new(0,8),
        PaddingLeft=UDim.new(0,8), PaddingRight=UDim.new(0,8),
    })
    Create("UIListLayout", TabContainer, {
        SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,5),
    })

    -- ── CONTENT ───────────────────────────────────────
    local ContentContainer = Create("Frame", MainFrame, {
        Size=UDim2.new(1,-(TW+8),1,-36),
        Position=UDim2.new(0,TW+6,0,34),
        BackgroundTransparency=1, Name="Content",
    })

    -- ── RESIZE handles ────────────────────────────────
    local RH1 = MakeDrag(Create("ImageButton", MainFrame, {
        Size=UDim2.new(0,24,0,24), Position=UDim2.fromOffset(SW,SH),
        AnchorPoint=Vector2.new(1,1), BackgroundTransparency=1,
        AutoButtonColor=false, Name="ResizeMain",
    }))
    local RH2 = MakeDrag(Create("ImageButton", MainFrame, {
        Size=UDim2.new(0,16,1,-40), Position=UDim2.new(0,TW,1,0),
        AnchorPoint=Vector2.new(0.5,1), BackgroundTransparency=1,
        AutoButtonColor=false, Name="ResizeTab",
    }))

    local function ApplyResize()
        local p1,p2 = RH1.Position, RH2.Position
        local nw = math.clamp(p1.X.Offset, 420, 1100)
        local nh = math.clamp(p1.Y.Offset, 200, 600)
        local tw2= math.clamp(p2.X.Offset, 130, 260)
        RH1.Position = UDim2.fromOffset(nw,nh)
        RH2.Position = UDim2.new(0,tw2,1,0)
        MainFrame.Size           = UDim2.fromOffset(nw,nh)
        Sidebar.Size             = UDim2.new(0,tw2,1,-31)
        ContentContainer.Size    = UDim2.new(1,-(tw2+8),1,-36)
        ContentContainer.Position= UDim2.new(0,tw2+6,0,34)
    end
    RH1:GetPropertyChangedSignal("Position"):Connect(ApplyResize)
    RH2:GetPropertyChangedSignal("Position"):Connect(ApplyResize)

    -- ── Close / Minimize ──────────────────────────────
    local minimized = false
    local savedSize = UDim2.fromOffset(SW,SH)

    CloseBtn.Activated:Connect(function()
        MainFrame.Visible = false
    end)

    MinBtn.Activated:Connect(function()
        if minimized then
            MinBtn.Image = "rbxassetid://10734896206"
            CT({MainFrame,"Size",savedSize,0.25,true})
            minimized = false
        else
            savedSize = MainFrame.Size
            MinBtn.Image = "rbxassetid://10734924532"
            CT({MainFrame,"Size",UDim2.fromOffset(MainFrame.AbsoluteSize.X,30),0.25,true})
            minimized = true
        end
    end)

    -- ── Window object ─────────────────────────────────
    local Window   = {}
    local FirstTab = false
    local ContainerList = {}

    function Window:Minimize() MainFrame.Visible = not MainFrame.Visible end

    function Window:Dialog(cfg)
        if MainFrame:FindFirstChild("__Dialog") then return end
        local DTitle   = cfg[1] or cfg.Title   or "Dialog"
        local DText    = cfg[2] or cfg.Text    or ""
        local DOptions = cfg[3] or cfg.Options or {}

        local overlay = InsertTheme(Create("Frame", MainFrame, {
            Size=UDim2.fromScale(1,1), BackgroundColor3=Color3.fromRGB(0,0,0),
            BackgroundTransparency=0.5, Active=true, Name="__Dialog", ZIndex=20,
        }),"Stroke")
        Make("Corner", overlay, UDim.new(0,10))

        local box = Create("Frame", overlay, {
            Size=UDim2.fromOffset(260,150), Position=UDim2.fromScale(0.5,0.5),
            AnchorPoint=Vector2.new(0.5,0.5), BackgroundColor3=Color3.fromRGB(18,18,18), ZIndex=21,
        })
        Make("Corner", box, UDim.new(0,8))
        Make("Gradient", box, {Rotation=270})

        InsertTheme(Create("TextLabel", box, {
            Size=UDim2.new(1,-20,0,20), Position=UDim2.fromOffset(12,8),
            Text=DTitle, Font=Enum.Font.GothamBold, TextSize=14,
            TextColor3=Theme["Color Text"], BackgroundTransparency=1,
            TextXAlignment=Enum.TextXAlignment.Left, ZIndex=22,
        }),"Text")
        InsertTheme(Create("TextLabel", box, {
            Size=UDim2.new(1,-20,0,50), Position=UDim2.fromOffset(12,30),
            Text=DText, Font=Enum.Font.Gotham, TextSize=11, TextWrapped=true,
            TextColor3=Theme["Color Dark Text"], BackgroundTransparency=1,
            TextXAlignment=Enum.TextXAlignment.Left, ZIndex=22,
        }),"DarkText")

        local BtnHolder = Create("Frame", box, {
            Size=UDim2.new(1,-20,0,32), Position=UDim2.new(0,10,1,-42),
            BackgroundTransparency=1, ZIndex=22,
        },{
            Create("UIListLayout",{
                FillDirection=Enum.FillDirection.Horizontal,
                HorizontalAlignment=Enum.HorizontalAlignment.Center,
                Padding=UDim.new(0,8),
            }),
        })

        local D={}
        function D:Button(bcfg)
            local bn = bcfg[1] or bcfg.Name or ""
            local bc = bcfg[2] or bcfg.Callback or function() end
            local b  = Make("Button", BtnHolder, {
                Size=UDim2.new(0,100,1,0), AutoButtonColor=false,
            })
            Make("Corner",b,UDim.new(0,6))
            SetProps(b,{Text=bn,Font=Enum.Font.GothamBold,TextSize=12,
                TextColor3=Theme["Color Text"]})
            b.Activated:Connect(function() D:Close(); task.spawn(bc) end)
        end
        function D:Close() overlay:Destroy() end

        for _,btn in ipairs(DOptions) do D:Button(btn) end
        return D
    end

    function Window:SelectTab(sel)
        if type(sel)=="number" then
            if MyLibrary.Tabs[sel] then MyLibrary.Tabs[sel].func:Enable() end
        else
            for _,t in pairs(MyLibrary.Tabs) do
                if t.Cont==sel.Cont then t.func:Enable() end
            end
        end
    end

    -- ── MakeTab ───────────────────────────────────────
    function Window:MakeTab(paste, cfg)
        if type(paste)=="table" then cfg=paste end
        local TName = cfg[1] or cfg.Title or cfg.Name or "Tab"
        local TIcon = cfg[2] or cfg.Icon  or ""
        TIcon = MyLibrary:GetIcon(TIcon)
        if not TIcon or not TIcon:find("rbxassetid://") or #TIcon:gsub("rbxassetid://","")<4 then
            TIcon=false
        end

        local tabBtn = Make("Button", TabContainer, {Size=UDim2.new(1,0,0,30)})
        Make("Corner", tabBtn, UDim.new(0,6))

        local tabIcon = InsertTheme(Create("ImageLabel", tabBtn, {
            Size=UDim2.new(0,14,0,14), Position=UDim2.new(0,8,0.5,-7),
            Image=TIcon or "", ImageColor3=Theme["Color Dark Text"],
            BackgroundTransparency=1, ZIndex=2,
        }),"DarkText")

        local tabLabel = InsertTheme(Create("TextLabel", tabBtn, {
            Size=UDim2.new(1,TIcon and -28 or -14,1,0),
            Position=UDim2.fromOffset(TIcon and 28 or 14,0),
            BackgroundTransparency=1, Font=Enum.Font.GothamMedium,
            Text=TName, TextColor3=Theme["Color Dark Text"],
            TextSize=11, TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=2,
        }),"DarkText")

        local tabBar = InsertTheme(Create("Frame", tabBtn, {
            Size=UDim2.new(0,3,0,4), Position=UDim2.new(0,1,0.5),
            AnchorPoint=Vector2.new(0,0.5), BackgroundColor3=Theme["Color Theme"],
            BackgroundTransparency=1, ZIndex=2,
        }),"Theme")
        Make("Corner", tabBar, UDim.new(0.5,0))

        local Container = InsertTheme(Create("ScrollingFrame", nil, {
            Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, BorderSizePixel=0,
            ScrollBarThickness=2, ScrollBarImageTransparency=0.2,
            ScrollBarImageColor3=Theme["Color Theme"],
            AutomaticCanvasSize=Enum.AutomaticSize.Y,
            ScrollingDirection=Enum.ScrollingDirection.Y,
            CanvasSize=UDim2.new(), Name="Container_"..TName,
        },{
            Create("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
                PaddingTop=UDim.new(0,8),PaddingBottom=UDim.new(0,8)}),
            Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)}),
        }),"ScrollBar")

        table.insert(ContainerList, Container)
        if not FirstTab then Container.Parent=ContentContainer end

        local function activate()
            if Container.Parent==ContentContainer then return end
            for _,f in pairs(ContainerList) do if f~=Container then f.Parent=nil end end
            Container.Parent=ContentContainer

            for _,ch in ipairs(TabContainer:GetChildren()) do
                if ch:IsA("TextButton") then
                    CT({ch,"BackgroundColor3",Theme["Color Hub 2"],0.2})
                    local img=ch:FindFirstChildOfClass("ImageLabel")
                    local txt=ch:FindFirstChildOfClass("TextLabel")
                    local bar=ch:FindFirstChildOfClass("Frame")
                    if img then CT({img,"ImageColor3",Theme["Color Dark Text"],0.2}) end
                    if txt then CT({txt,"TextColor3",Theme["Color Dark Text"],0.2}) end
                    if bar then
                        CT({bar,"Size",UDim2.new(0,3,0,4),0.2})
                        CT({bar,"BackgroundTransparency",1,0.2})
                    end
                end
            end
            for _,t in pairs(MyLibrary.Tabs) do if t.Cont~=Container then t.func:Disable() end end

            CT({tabBtn,"BackgroundColor3",Color3.fromRGB(30,10,10),0.2})
            CT({tabIcon,"ImageColor3",Theme["Color Theme"],0.2})
            CT({tabLabel,"TextColor3",Color3.fromRGB(255,255,255),0.2})
            CT({tabBar,"Size",UDim2.new(0,3,0,14),0.2})
            CT({tabBar,"BackgroundTransparency",0,0.2})
        end

        tabBtn.Activated:Connect(activate)
        FirstTab=true

        local Tab={}
        table.insert(MyLibrary.Tabs,{TabInfo={Name=TName,Icon=TIcon},func=Tab,Cont=Container})
        Tab.Cont=Container

        function Tab:Disable() Container.Parent=nil end
        function Tab:Enable()  activate() end
        function Tab:Visible(b) Funcs:ToggleVisible(tabBtn,b); Funcs:ToggleParent(Container,b,ContentContainer) end
        function Tab:Destroy()  tabBtn:Destroy(); Container:Destroy() end

        function Tab:AddSection(c)
            local sn=type(c)=="string" and c or c[1] or c.Name or c.Title or "Section"
            local sf=Create("Frame",Container,{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Name="Option"})
            local sl=InsertTheme(Create("TextLabel",sf,{
                Font=Enum.Font.BuilderSansExtraBold, Text=sn, TextColor3=Theme["Color Text"],
                Size=UDim2.new(1,-25,1,0), Position=UDim2.new(0,5),
                BackgroundTransparency=1, TextTruncate=Enum.TextTruncate.AtEnd,
                TextSize=11, TextXAlignment=Enum.TextXAlignment.Left,
            }),"Text")
            local S={}
            function S:Visible(b) if b==nil then sf.Visible=not sf.Visible else sf.Visible=b end end
            function S:Destroy() sf:Destroy() end
            function S:Set(v) if v then sl.Text=type(v)=="function" and v() or v end end
            return S
        end

        function Tab:AddParagraph(c)
            local pn=c[1] or c.Title or "Paragraph"
            local pd=c[2] or c.Text  or ""
            local fr,lf=ButtonFrame(Container,pn,pd,UDim2.new(1,-20))
            local P={}
            function P:Visible(...) Funcs:ToggleVisible(fr,...) end
            function P:Destroy() fr:Destroy() end
            function P:SetTitle(v) lf:SetTitle(type(v)=="function" and v() or v) end
            function P:SetDesc(v)  lf:SetDesc(type(v)=="function" and v() or v) end
            function P:Set(v1,v2)
                if v1 and v2 then P:SetTitle(v1); P:SetDesc(v2)
                elseif v1 then P:SetDesc(v1) end
            end
            return P
        end

        function Tab:AddButton(c)
            local bn=c[1] or c.Name or c.Title or "Button"
            local bd=c.Desc or c.Description or ""
            local cb=Funcs:GetCallback(c,2)
            local fb,lf=ButtonFrame(Container,bn,bd,UDim2.new(1,-20))
            Create("ImageLabel",fb,{Size=UDim2.new(0,14,0,14),Position=UDim2.new(1,-10,0.5),
                AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=1,Image="rbxassetid://10734973999"})
            fb.Activated:Connect(function() Funcs:FireCallback(cb) end)
            local B={}
            function B:Visible(...) Funcs:ToggleVisible(fb,...) end
            function B:Destroy() fb:Destroy() end
            function B:Callback(...) Funcs:InsertCallback(cb,...) end
            function B:Set(v1,v2)
                if type(v1)=="string" and type(v2)=="string" then lf:SetTitle(v1); lf:SetDesc(v2)
                elseif type(v1)=="string" then lf:SetTitle(v1)
                elseif type(v1)=="function" then cb={v1} end
            end
            return B
        end

        function Tab:AddToggle(c)
            local tn=c[1] or c.Name or c.Title or "Toggle"
            local td=c.Desc or c.Description or ""
            local cb=Funcs:GetCallback(c,3)
            local flag=c[4] or c.Flag or false
            local def =c[2] or c.Default or false
            if CheckFlag(flag) then def=GetFlag(flag) end

            local btn,lf=ButtonFrame(Container,tn,td,UDim2.new(1,-38))
            local th=InsertTheme(Create("Frame",btn,{
                Size=UDim2.new(0,35,0,18),Position=UDim2.new(1,-10,0.5),
                AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"],
            }),"Stroke")
            Make("Corner",th,UDim.new(0.5,0))
            local ts=Create("Frame",th,{BackgroundTransparency=1,
                Size=UDim2.new(0.8,0,0.8,0),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5)})
            local dot=InsertTheme(Create("Frame",ts,{
                Size=UDim2.new(0,12,0,12),Position=UDim2.new(0,0,0.5),
                AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Theme["Color Theme"],
            }),"Theme")
            Make("Corner",dot,UDim.new(0.5,0))

            local busy=false
            local function setTog(v)
                if busy then return end; busy=true; def=v
                SetFlag(flag,def); Funcs:FireCallback(cb,def)
                if def then
                    CT({dot,"Position",UDim2.new(1,0,0.5),0.22})
                    CT({dot,"AnchorPoint",Vector2.new(1,0.5),0.22})
                    CT({dot,"BackgroundTransparency",0,0.22})
                else
                    CT({dot,"Position",UDim2.new(0,0,0.5),0.22})
                    CT({dot,"AnchorPoint",Vector2.new(0,0.5),0.22})
                    CT({dot,"BackgroundTransparency",0.8,0.22})
                end
                busy=false
            end
            task.spawn(setTog,def)
            btn.Activated:Connect(function() setTog(not def) end)

            local T={}
            function T:Visible(...) Funcs:ToggleVisible(btn,...) end
            function T:Destroy() btn:Destroy() end
            function T:Callback(...) Funcs:InsertCallback(cb,...)() end
            function T:Set(v1,v2)
                if type(v1)=="string" and type(v2)=="string" then lf:SetTitle(v1);lf:SetDesc(v2)
                elseif type(v1)=="string" then lf:SetTitle(v1)
                elseif type(v1)=="boolean" then task.spawn(setTog,v1)
                elseif type(v1)=="function" then cb={v1} end
            end
            return T
        end

        function Tab:AddSlider(c)
            local sn  = c[1] or c.Name or c.Title or "Slider"
            local sd  = c.Desc or c.Description or ""
            local minV= c[2] or c.MinValue or c.Min or 0
            local maxV= c[3] or c.MaxValue or c.Max or 100
            local inc = c[4] or c.Increase or 1
            local cb  = Funcs:GetCallback(c,6)
            local flag= c[7] or c.Flag or false
            local def = c[5] or c.Default or minV
            if CheckFlag(flag) then def=GetFlag(flag) end

            local btn,lf=ButtonFrame(Container,sn,sd,UDim2.new(1,-180))
            local sh=Create("TextButton",btn,{
                Size=UDim2.new(0.45,0,1),Position=UDim2.new(1),
                AnchorPoint=Vector2.new(1,0),AutoButtonColor=false,Text="",BackgroundTransparency=1,
            })
            local bar=InsertTheme(Create("Frame",sh,{
                BackgroundColor3=Theme["Color Stroke"],
                Size=UDim2.new(1,-20,0,6),Position=UDim2.new(0.5,0,0.5),AnchorPoint=Vector2.new(0.5,0.5),
            }),"Stroke"); Make("Corner",bar)
            local ind=InsertTheme(Create("Frame",bar,{
                BackgroundColor3=Theme["Color Theme"],Size=UDim2.fromScale(0,1),BorderSizePixel=0,
            }),"Theme"); Make("Corner",ind)
            local knob=Create("Frame",bar,{
                Size=UDim2.new(0,6,0,12),BackgroundColor3=Color3.fromRGB(220,220,220),
                Position=UDim2.fromScale(0,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=0.2,
            }); Make("Corner",knob)
            local lv=InsertTheme(Create("TextLabel",sh,{
                Size=UDim2.new(0,30,0,14),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(0,0,0.5),
                BackgroundTransparency=1,TextColor3=Theme["Color Text"],
                Font=Enum.Font.FredokaOne,TextSize=12,Text=tostring(def),
            }),"Text")
            local uisc=Create("UIScale",lv)

            local function upd()
                local pct=knob.Position.X.Scale
                ind.Size=UDim2.fromScale(pct,1)
                local nv=math.floor(pct*(maxV-minV)+minV)
                local num=math.floor(nv*inc*100)/100
                def=num; lv.Text=tostring(num)
                Funcs:FireCallback(cb,def)
            end
            local function ctrlPos()
                -- Compatível com Solara: usa AbsolutePosition do bar
                local ok2, mx = pcall(function()
                    return UserInputService:GetMouseLocation().X
                end)
                if not ok2 then
                    mx = Player:GetMouse().X
                end
                local pct=math.clamp((mx-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
                knob.Position=UDim2.fromScale(pct,0.5)
            end
            sh.MouseButton1Down:Connect(function()
                Container.ScrollingEnabled=false
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    task.wait(); ctrlPos()
                end
                Container.ScrollingEnabled=true; SetFlag(flag,def)
            end)
            knob:GetPropertyChangedSignal("Position"):Connect(upd)
            lv:GetPropertyChangedSignal("Text"):Connect(function()
                uisc.Scale=0.8; CT({uisc,"Scale",1,0.15})
            end)
            local function setSlider(v)
                if type(v)~="number" then return end
                local pct=math.clamp((v-minV)/(maxV-minV),0,1)
                SetFlag(flag,v); CT({knob,"Position",UDim2.fromScale(pct,0.5),0.22,true})
            end
            setSlider(def); upd()

            local S={}
            function S:Set(v1,v2)
                if type(v1)=="string" and type(v2)=="string" then lf:SetTitle(v1);lf:SetDesc(v2)
                elseif type(v1)=="string" then lf:SetTitle(v1)
                elseif type(v1)=="number" then setSlider(v1)
                elseif type(v1)=="function" then cb={v1} end
            end
            function S:Visible(...) Funcs:ToggleVisible(btn,...) end
            function S:Destroy() btn:Destroy() end
            return S
        end

        function Tab:AddDropdown(c)
            local dn  = c[1] or c.Name or c.Title or "Dropdown"
            local dd  = c.Desc or c.Description or ""
            local opts= c[2] or c.Options or {}
            local opd = c[3] or c.Default or {}
            local flag= c[5] or c.Flag or false
            local multi=c.MultiSelect or false
            local cb  = Funcs:GetCallback(c,4)

            local btn,lf=ButtonFrame(Container,dn,dd,UDim2.new(1,-180))
            local sf=InsertTheme(Create("Frame",btn,{
                Size=UDim2.new(0,150,0,18),Position=UDim2.new(1,-10,0.5),
                AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"],
            }),"Stroke"); Make("Corner",sf,UDim.new(0,4))
            local al=InsertTheme(Create("TextLabel",sf,{
                Size=UDim2.new(0.85,0,0.85,0),AnchorPoint=Vector2.new(0.5,0.5),
                Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,
                Font=Enum.Font.GothamBold,TextScaled=true,
                TextColor3=Theme["Color Text"],Text="...",
            }),"Text")
            local arrow=Create("ImageLabel",sf,{
                Size=UDim2.new(0,15,0,15),Position=UDim2.new(0,-5,0.5),
                AnchorPoint=Vector2.new(1,0.5),Image="rbxassetid://10709791523",BackgroundTransparency=1,
            })
            local ncf=Create("TextButton",DropdownHolder,{
                Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false,Text="",
            })
            local df=Create("Frame",ncf,{
                Size=UDim2.new(0,152,0,0),BackgroundTransparency=0.05,
                BackgroundColor3=Color3.fromRGB(18,18,18),
                AnchorPoint=Vector2.new(0,1),ClipsDescendants=true,Active=true,
            })
            Make("Corner",df); Make("Stroke",df); Make("Gradient",df,{Rotation=60})
            local scf=InsertTheme(Create("ScrollingFrame",df,{
                ScrollBarImageColor3=Theme["Color Theme"],Size=UDim2.new(1,0,1,0),
                ScrollBarThickness=2,BackgroundTransparency=1,BorderSizePixel=0,
                CanvasSize=UDim2.new(),ScrollingDirection=Enum.ScrollingDirection.Y,
                AutomaticCanvasSize=Enum.AutomaticSize.Y,Active=true,
            },{
                Create("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),
                    PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,4)}),
                Create("UIListLayout",{Padding=UDim.new(0,3)}),
            }),"ScrollBar")

            local scrollSz=5; local dw=false
            local function calcPos()
                local fp=sf.AbsolutePosition; local ss=ScreenGui.AbsoluteSize
                local cx=math.clamp(fp.X/UIScale,0,ss.X/UIScale-152)
                local cy=math.clamp(fp.Y/UIScale,0,ss.Y/UIScale)
                local ap=fp.Y>ss.Y/1.4 and 1 or scrollSz>80 and 0.5 or 0
                df.AnchorPoint=Vector2.new(0,ap)
                CT({df,"Position",UDim2.fromOffset(cx,cy),0.1})
            end
            local function calcSz()
                local n=0
                for _,f in pairs(scf:GetChildren()) do if f:IsA("TextButton") then n+=1 end end
                scrollSz=(math.clamp(n,0,10)*24)+10
                if ncf.Visible then CT({df,"Size",UDim2.fromOffset(152,scrollSz),0.15}) end
            end
            local function disable()
                dw=true; ncf.Visible=false
                CT({df,"Size",UDim2.new(0,152,0,0),0.15,true})
                CT({arrow,"ImageColor3",Color3.fromRGB(255,255,255),0.15})
                arrow.Image="rbxassetid://10709791523"; dw=false
            end
            local function toggle()
                if dw then return end; dw=true
                if ncf.Visible then
                    CT({df,"Size",UDim2.new(0,152,0,0),0.15,true})
                    CT({arrow,"ImageColor3",Color3.fromRGB(255,255,255),0.15})
                    arrow.Image="rbxassetid://10709791523"; ncf.Visible=false
                else
                    ncf.Visible=true; arrow.Image="rbxassetid://10709790948"
                    CT({arrow,"ImageColor3",Theme["Color Theme"],0.15})
                    CT({df,"Size",UDim2.fromOffset(152,scrollSz),0.15,true})
                end
                dw=false
            end

            local Options={}
            local default2=type(opd)~="table" and {opd} or opd
            local Selected=multi and {} or (CheckFlag(flag) and GetFlag(flag) or default2[1])
            if multi then
                for i,v in pairs(CheckFlag(flag) and GetFlag(flag) or default2) do
                    if type(i)=="string" and (opts[i] or table.find(opts,i)) then Selected[i]=v
                    elseif opts[v] then Selected[v]=true end
                end
            end

            local function cbSel()
                SetFlag(flag, multi and Selected or tostring(Selected))
                Funcs:FireCallback(cb, Selected)
            end
            local function updLabel()
                if multi then
                    local l={}; for i,v in pairs(Selected) do if v then table.insert(l,i) end end
                    al.Text=#l>0 and table.concat(l,", ") or "..."
                else al.Text=tostring(Selected or "...") end
            end
            local function updSel()
                for _,v in pairs(Options) do
                    local slt=multi and v.Stats or (v.Value==Selected)
                    CT({v.nodes[2],"BackgroundTransparency",slt and 0 or 1,0.2})
                    CT({v.nodes[2],"Size",slt and UDim2.fromOffset(4,14) or UDim2.fromOffset(4,4),0.2})
                    CT({v.nodes[3],"TextTransparency",slt and 0 or 0.4,0.2})
                end
                updLabel()
            end

            local function addOpt(idx,val)
                local nm=tostring(type(idx)=="string" and idx or val)
                if Options[nm] then return end
                Options[nm]={index=idx,Value=val,Name=nm,Stats=multi and (Selected[nm] or false) or false}
                if multi then Selected[nm]=Options[nm].Stats end
                local ob=Make("Button",scf,{Name="Option",Size=UDim2.new(1,0,0,21)})
                Make("Corner",ob,UDim.new(0,4))
                local isel=InsertTheme(Create("Frame",ob,{
                    Position=UDim2.new(0,1,0.5),Size=UDim2.new(0,4,0,4),
                    BackgroundColor3=Theme["Color Theme"],BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5),
                }),"Theme"); Make("Corner",isel,UDim.new(0.5,0))
                local onm=InsertTheme(Create("TextLabel",ob,{
                    Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,10),Text=nm,
                    TextColor3=Theme["Color Text"],Font=Enum.Font.FredokaOne,
                    TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextTransparency=0.4,
                }),"Text")
                ob.Activated:Connect(function()
                    if multi then Options[nm].Stats=not Options[nm].Stats; Selected[nm]=Options[nm].Stats
                    else Selected=val end
                    cbSel(); updSel()
                end)
                Options[nm].nodes={ob,isel,onm}
                calcSz()
            end

            local function remOpt(idx,val)
                local nm=tostring(type(idx)=="string" and idx or val)
                if Options[nm] then
                    if multi then Selected[nm]=nil else Selected=nil end
                    Options[nm].nodes[1]:Destroy(); table.clear(Options[nm]); Options[nm]=nil
                end
            end

            for i,v in pairs(opts) do addOpt(i,v) end
            cbSel(); updSel()

            btn.Activated:Connect(toggle)
            ncf.MouseButton1Down:Connect(disable)
            ncf.MouseButton1Click:Connect(disable)
            MainFrame:GetPropertyChangedSignal("Visible"):Connect(disable)
            sf:GetPropertyChangedSignal("AbsolutePosition"):Connect(calcPos)
            scf.ChildAdded:Connect(calcSz); scf.ChildRemoved:Connect(calcSz)
            calcPos(); calcSz()

            local D={}
            function D:Visible(...) Funcs:ToggleVisible(btn,...) end
            function D:Destroy() btn:Destroy() end
            function D:Add(...) local a={...}; for _,nm in ipairs(type(a[1])=="table" and a[1] or a) do addOpt(nm,nm) end end
            function D:Remove(o) for i,v in pairs(Options) do if v.Name==o or i==o then remOpt(i,v.Value) end end end
            function D:Set(v1,cl)
                if type(v1)=="table" then
                    if cl then for i,v in pairs(Options) do remOpt(i,v.Value) end end
                    for i,v in pairs(v1) do addOpt(i,v) end; cbSel(); updSel()
                elseif type(v1)=="function" then cb={v1} end
            end
            return D
        end

        function Tab:AddTextBox(c)
            local tn=c[1] or c.Name or c.Title or "TextBox"
            local td=c.Desc or c.Description or ""
            local ph=c[5] or c.PlaceholderText or "Input..."
            local cl=c[3] or c.ClearText or false
            local cb=Funcs:GetCallback(c,4)

            local btn,lf=ButtonFrame(Container,tn,td,UDim2.new(1,-38))
            local sf2=InsertTheme(Create("Frame",btn,{
                Size=UDim2.new(0,150,0,18),Position=UDim2.new(1,-10,0.5),
                AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"],
            }),"Stroke"); Make("Corner",sf2,UDim.new(0,4))
            local tbi=InsertTheme(Create("TextBox",sf2,{
                Size=UDim2.new(0.85,0,0.85,0),AnchorPoint=Vector2.new(0.5,0.5),
                Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,
                Font=Enum.Font.GothamBold,TextScaled=true,
                TextColor3=Theme["Color Text"],ClearTextOnFocus=cl,
                PlaceholderText=ph,Text="",
            }),"Text")
            local pen=Create("ImageLabel",sf2,{
                Size=UDim2.new(0,12,0,12),Position=UDim2.new(0,-5,0.5),
                AnchorPoint=Vector2.new(1,0.5),Image="rbxassetid://15637081879",BackgroundTransparency=1,
            })
            local TBObj={}
            local function inp()
                local t=tbi.Text
                if #t:gsub(" ","")>0 then
                    if TBObj.OnChanging then
                        local ok3, result = pcall(TBObj.OnChanging, t)
                        if ok3 and result then t = result end
                    end
                    Funcs:FireCallback(cb,t); tbi.Text=t
                end
            end
            tbi.FocusLost:Connect(inp); inp()
            tbi.FocusLost:Connect(function() CT({pen,"ImageColor3",Color3.fromRGB(255,255,255),0.2}) end)
            tbi.Focused:Connect(function() CT({pen,"ImageColor3",Theme["Color Theme"],0.2}) end)
            TBObj.OnChanging=false
            function TBObj:Visible(...) Funcs:ToggleVisible(btn,...) end
            function TBObj:Destroy() btn:Destroy() end
            return TBObj
        end

        function Tab:AddDiscordInvite(c)
            local title =c[1] or c.Name or c.Title or "Discord"
            local desc  =c.Desc or c.Description or ""
            local logo  =c[2] or c.Logo   or ""
            local invite=c[3] or c.Invite or ""

            local ih=Create("Frame",Container,{Size=UDim2.new(1,0,0,80),Name="Option",BackgroundTransparency=1})
            Create("TextLabel",ih,{Size=UDim2.new(1,0,0,15),Position=UDim2.new(0,5),
                TextColor3=Color3.fromRGB(40,150,255),Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,TextSize=10,Text=invite})
            local fh=InsertTheme(Create("Frame",ih,{Size=UDim2.new(1,0,0,65),
                AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1),
                BackgroundColor3=Theme["Color Hub 2"]}),"Frame"); Make("Corner",fh)
            local il=Create("ImageLabel",fh,{Size=UDim2.new(0,30,0,30),Position=UDim2.new(0,7,0,7),
                Image=logo,BackgroundTransparency=1})
            Make("Corner",il,UDim.new(0,4)); Make("Stroke",il)
            InsertTheme(Create("TextLabel",fh,{Size=UDim2.new(1,-52,0,15),Position=UDim2.new(0,44,0,7),
                Font=Enum.Font.GothamBold,TextColor3=Theme["Color Text"],TextXAlignment=Enum.TextXAlignment.Left,
                BackgroundTransparency=1,TextSize=10,Text=title}),"Text")
            InsertTheme(Create("TextLabel",fh,{Size=UDim2.new(1,-52,0,0),Position=UDim2.new(0,44,0,22),
                TextWrapped=true,AutomaticSize=Enum.AutomaticSize.Y,Font=Enum.Font.Gotham,
                TextColor3=Theme["Color Dark Text"],TextXAlignment=Enum.TextXAlignment.Left,
                BackgroundTransparency=1,TextSize=8,Text=desc}),"DarkText")
            local jb=Create("TextButton",fh,{Size=UDim2.new(1,-14,0,16),AnchorPoint=Vector2.new(0.5,1),
                Position=UDim2.new(0.5,0,1,-7),Text="Join Server",Font=Enum.Font.GothamBold,TextSize=12,
                TextColor3=Color3.fromRGB(220,220,220),BackgroundColor3=Color3.fromRGB(50,150,50)})
            Make("Corner",jb,UDim.new(0,5))
            local cd=false
            jb.Activated:Connect(function()
                safeSetClipboard(invite)
                if cd then return end; cd=true
                SetProps(jb,{Text="Copied!",BackgroundColor3=Color3.fromRGB(80,80,80),TextColor3=Color3.fromRGB(150,150,150)})
                task.wait(3)
                SetProps(jb,{Text="Join Server",BackgroundColor3=Color3.fromRGB(50,150,50),TextColor3=Color3.fromRGB(220,220,220)})
                cd=false
            end)
            local DI={}
            function DI:Destroy() ih:Destroy() end
            function DI:Visible(...) Funcs:ToggleVisible(ih,...) end
            return DI
        end

        return Tab
    end -- MakeTab

    task.delay(0.12, function()
        if #MyLibrary.Tabs > 0 then MyLibrary.Tabs[1].func:Enable() end
    end)

    return Window
end -- MakeWindow

return MyLibrary
