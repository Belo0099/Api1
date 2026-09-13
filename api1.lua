-- ╔══════════════════════════════════════════════════════════════════╗
-- ║           ASTRAX HUB  •  VIP PREMIUM EDITION  •  v2.5          ║
-- ║               Edição Definitiva (Unificada & Otimizada)          ║
-- ╚══════════════════════════════════════════════════════════════════╝

local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService   = game:GetService("UserInputService")
local TweenService       = game:GetService("TweenService")
local HttpService        = game:GetService("HttpService")
local RunService         = game:GetService("RunService")
local CoreGui            = game:GetService("CoreGui")
local Players            = game:GetService("Players")
local Player             = Players.LocalPlayer

local MyLibrary = {
    Themes = {
        Main = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 10, 12)),
                ColorSequenceKeypoint.new(0.55, Color3.fromRGB(100, 0,  0)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(210, 15, 15)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(12, 12, 14),
            ["Color Panel"]      = Color3.fromRGB(18, 18, 21),
            ["Color Stroke"]     = Color3.fromRGB(210, 15, 15),
            ["Color Theme"]      = Color3.fromRGB(210, 15, 15),
            ["Color ThemeHover"] = Color3.fromRGB(240, 40, 40),
            ["Color Text"]       = Color3.fromRGB(245, 245, 245),
            ["Color Dark Text"]  = Color3.fromRGB(140, 140, 150),
            ["Color Separator"]  = Color3.fromRGB(40, 40, 48),
            ["Color Toggle Off"] = Color3.fromRGB(45, 45, 55),
            ["Color Card"]       = Color3.fromRGB(22, 22, 26),
        },
    },

    Info       = { Version = "2.5.0 VIP" },
    Save       = { UISize = {640, 430}, TabSize = 175, Theme = "Main" },
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
            ["alerttriangle"]="rbxassetid://10709753149",["aligncenter"]="rbxassetid://10709753570",
            ["anchor"]="rbxassetid://10709761530",["angry"]="rbxassetid://10709761629",
            ["aperture"]="rbxassetid://10709761813",["archive"]="rbxassetid://10709762233",
            ["arrowdown"]="rbxassetid://10709767827",["arrowleft"]="rbxassetid://10709768114",
            ["arrowright"]="rbxassetid://10709768347",["arrowup"]="rbxassetid://10709768939",
            ["award"]="rbxassetid://10709769406",["axe"]="rbxassetid://10709769508",
            ["baby"]="rbxassetid://10709769732",["backpack"]="rbxassetid://10709769841",
            ["banknote"]="rbxassetid://10709770178",["bell"]="rbxassetid://10709775704",
            ["belloff"]="rbxassetid://10709775320",["bike"]="rbxassetid://10709775894",
            ["bomb"]="rbxassetid://10709781460",["bone"]="rbxassetid://10709781605",
            ["book"]="rbxassetid://10709781824",["bookmark"]="rbxassetid://10709782154",
            ["bot"]="rbxassetid://10709782230",["box"]="rbxassetid://10709782497",
            ["bug"]="rbxassetid://10709782845",["building"]="rbxassetid://10709783051",
            ["calendar"]="rbxassetid://10709789505",["camera"]="rbxassetid://10709789686",
            ["car"]="rbxassetid://10709789810",["check"]="rbxassetid://10709790644",
            ["checkcircle"]="rbxassetid://10709790387",["chevrondown"]="rbxassetid://10709790948",
            ["chevronleft"]="rbxassetid://10709791281",["chevronright"]="rbxassetid://10709791437",
            ["chevronup"]="rbxassetid://10709791523",["clock"]="rbxassetid://10709805144",
            ["cloud"]="rbxassetid://10709806740",["code"]="rbxassetid://10709810463",
            ["cog"]="rbxassetid://10709810948",["coins"]="rbxassetid://10709811110",
            ["command"]="rbxassetid://10709811365",["compass"]="rbxassetid://10709811445",
            ["copy"]="rbxassetid://10709812159",["cpu"]="rbxassetid://10709813383",
            ["crosshair"]="rbxassetid://10709818534",["crown"]="rbxassetid://10709818626",
            ["database"]="rbxassetid://10709818996",["diamond"]="rbxassetid://10709819149",
            ["download"]="rbxassetid://10723344270",["droplet"]="rbxassetid://10723344432",
            ["edit"]="rbxassetid://10734883598",["edit2"]="rbxassetid://10723344885",
            ["eye"]="rbxassetid://10723346959",["eyeoff"]="rbxassetid://10723346871",
            ["feather"]="rbxassetid://10723354671",["file"]="rbxassetid://10723374641",
            ["filter"]="rbxassetid://10723375128",["flag"]="rbxassetid://10723375890",
            ["flame"]="rbxassetid://10723376114",["folder"]="rbxassetid://10723387563",
            ["gamepad"]="rbxassetid://10723395457",["gamepad2"]="rbxassetid://10723395215",
            ["gem"]="rbxassetid://10723396000",["ghost"]="rbxassetid://10723396107",
            ["gift"]="rbxassetid://10723396402",["globe"]="rbxassetid://10723404337",
            ["hammer"]="rbxassetid://10723405360",["hand"]="rbxassetid://10723405649",
            ["harddrive"]="rbxassetid://10723405749",["heart"]="rbxassetid://10723406885",
            ["helpcircle"]="rbxassetid://10723406988",["home"]="rbxassetid://10723407389",
            ["info"]="rbxassetid://10723415903",["key"]="rbxassetid://10723416652",
            ["keyboard"]="rbxassetid://10723416765",["laptop"]="rbxassetid://10723423881",
            ["layers"]="rbxassetid://10723424505",["leaf"]="rbxassetid://10723425539",
            ["lightbulb"]="rbxassetid://10723425852",["link"]="rbxassetid://10723426722",
            ["list"]="rbxassetid://10723433811",["lock"]="rbxassetid://10723434711",
            ["login"]="rbxassetid://10723434830",["logout"]="rbxassetid://10723434906",
            ["mail"]="rbxassetid://10734885430",["map"]="rbxassetid://10734886202",
            ["menu"]="rbxassetid://10734887784",["mic"]="rbxassetid://10734888864",
            ["minus"]="rbxassetid://10734896206",["monitor"]="rbxassetid://10734896881",
            ["moon"]="rbxassetid://10734897102",["mouse"]="rbxassetid://10734898592",
            ["move"]="rbxassetid://10734900011",["music"]="rbxassetid://10734905958",
            ["network"]="rbxassetid://10734906975",["package"]="rbxassetid://10734909540",
            ["pencil"]="rbxassetid://10734919691",["phone"]="rbxassetid://10734921524",
            ["pin"]="rbxassetid://10734922324",["play"]="rbxassetid://10734923549",
            ["plus"]="rbxassetid://10734924532",["power"]="rbxassetid://10734930466",
            ["printer"]="rbxassetid://10734930632",["puzzle"]="rbxassetid://10734930886",
            ["rocket"]="rbxassetid://10734934585",["save"]="rbxassetid://10734941499",
            ["scan"]="rbxassetid://10734942565",["search"]="rbxassetid://10734943674",
            ["send"]="rbxassetid://10734943902",["settings"]="rbxassetid://10734950309",
            ["settings2"]="rbxassetid://10734950020",["share"]="rbxassetid://10734950813",
            ["shield"]="rbxassetid://10734951847",["shieldcheck"]="rbxassetid://10734951367",
            ["shieldoff"]="rbxassetid://10734951684",["shieldalert"]="rbxassetid://10734951173",
            ["shuffle"]="rbxassetid://10734953451",["signal"]="rbxassetid://10734961133",
            ["skull"]="rbxassetid://10734962068",["sliders"]="rbxassetid://10734963400",
            ["smartphone"]="rbxassetid://10734963940",["smile"]="rbxassetid://10734964441",
            ["star"]="rbxassetid://10734966248",["sun"]="rbxassetid://10734974297",
            ["sword"]="rbxassetid://10734975486",["swords"]="rbxassetid://10734975692",
            ["target"]="rbxassetid://10734977012",["terminal"]="rbxassetid://10734982144",
            ["thumbsup"]="rbxassetid://10734983629",["timer"]="rbxassetid://10734984606",
            ["toggleleft"]="rbxassetid://10734984834",["toggleright"]="rbxassetid://10734985040",
            ["trash"]="rbxassetid://10747362393",["trash2"]="rbxassetid://10747362241",
            ["trophy"]="rbxassetid://10747363809",["truck"]="rbxassetid://10747364031",
            ["tv"]="rbxassetid://10747364593",["umbrella"]="rbxassetid://10747364971",
            ["unlock"]="rbxassetid://10747366027",["upload"]="rbxassetid://10747366434",
            ["user"]="rbxassetid://10747373176",["usercheck"]="rbxassetid://10747371901",
            ["users"]="rbxassetid://10747373426",["video"]="rbxassetid://10747374938",
            ["volume"]="rbxassetid://10747376008",["wallet"]="rbxassetid://10747376205",
            ["wand"]="rbxassetid://10747376565",["wifi"]="rbxassetid://10747382504",
            ["wifioff"]="rbxassetid://10747382268",["wind"]="rbxassetid://10747382750",
            ["wrench"]="rbxassetid://10747383470",["x"]="rbxassetid://10747384394",
            ["xcircle"]="rbxassetid://10747383819",["zoomin"]="rbxassetid://10747384552",
            ["zoomout"]="rbxassetid://10747384679",
            ["shieldclose"]="rbxassetid://10734951535",
            ["siren"]="rbxassetid://10734961284",
            ["delete"]="rbxassetid://10709819059",
            ["ban"]="rbxassetid://10709798100",
            ["tool"]="rbxassetid://10734975486",
        }
    end)(),
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale      = ViewportSize.Y / 450
local Settings     = MyLibrary.Settings
local Flags        = MyLibrary.Flags

local SetProps, SetChildren, InsertTheme, Create

InsertTheme = function(inst, tipo)
    table.insert(MyLibrary.Instances, { Instance = inst, Type = tipo })
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
    local args = { ... }
    local new  = Instance.new(args[1])
    if type(args[2]) == "table" then
        SetProps(new, args[2])
        SetChildren(new, args[3])
    elseif typeof(args[2]) == "Instance" then
        new.Parent = args[2]
        SetProps(new, args[3])
        SetChildren(new, args[4])
    end
    return new
end

local function TryLoad(file)
    if readfile and isfile and isfile(file) then
        local ok, data = pcall(function() return HttpService:JSONDecode(readfile(file)) end)
        if ok and type(data) == "table" then
            if data.UISize  then MyLibrary.Save.UISize  = data.UISize  end
            if data.TabSize then MyLibrary.Save.TabSize = data.TabSize end
            if data.Theme   then MyLibrary.Save.Theme   = data.Theme   end
        end
    end
end
pcall(TryLoad, "astrax_hub_v2.json")

local Funcs = {}
function Funcs:InsertCallback(tab, func)
    if type(func) == "function" then table.insert(tab, func) end
    return func
end
function Funcs:FireCallback(tab, ...)
    for _, v in ipairs(tab) do if type(v) == "function" then task.spawn(v, ...) end end
end
function Funcs:ToggleVisible(obj, bool)
    obj.Visible = bool ~= nil and bool or not obj.Visible
end
function Funcs:GetConnectionFunctions(connectedFuncs, func)
    local c = { Function = func, Connected = true }
    function c:Disconnect()
        if self.Connected then
            table.remove(connectedFuncs, table.find(connectedFuncs, self.Function))
            self.Connected = false
        end
    end
    function c:Fire(...)
        if self.Connected then task.spawn(self.Function, ...) end
    end
    return c
end
function Funcs:GetCallback(configs, index)
    local func = configs[index] or configs.Callback or function() end
    if type(func) == "table" then
        return { function(v) func[1][func[2]] = v end }
    end
    return { func }
end

local Connections, Connection = {}, MyLibrary.Connection
local function NewConnectionList(list)
    for _, name in ipairs(list) do
        local fns, c = {}, {}
        Connection[name]  = c
        Connections[name] = fns
        c.Name = name
        function c:Connect(func)
            if type(func) == "function" then
                table.insert(fns, func)
                return Funcs:GetConnectionFunctions(fns, func)
            end
        end
        function c:Once(func)
            if type(func) == "function" then
                local conn
                local wrap = function(...)
                    task.spawn(func, ...)
                    conn:Disconnect()
                end
                conn = Funcs:GetConnectionFunctions(fns, wrap)
                table.insert(fns, wrap)
                return conn
            end
        end
    end
end
function Connection:FireConnection(name, ...)
    local fns = type(name) == "string" and Connections[name] or Connections[name.Name]
    if fns then for _, f in pairs(fns) do task.spawn(f, ...) end end
end
NewConnectionList({ "FlagsChanged","ThemeChanged","FileSaved","ThemeChanging","OptionAdded" })

local GetFlag, SetFlag, CheckFlag
CheckFlag = function(n) return type(n)=="string" and Flags[n]~=nil end
GetFlag   = function(n) return type(n)=="string" and Flags[n] end
SetFlag   = function(flag, val)
    if flag and (val ~= Flags[flag] or type(val)=="table") then
        Flags[flag] = val
        Connection:FireConnection("FlagsChanged", flag, val)
    end
end

local db
Connection.FlagsChanged:Connect(function(flag, val)
    local sf = Settings.ScriptFile
    if not db and sf and writefile then
        db = true; task.wait(0.1); db = false
        local ok, enc = pcall(function() return HttpService:JSONEncode(Flags) end)
        if ok then pcall(writefile, sf, enc) end
    end
end)

local ScreenGui = Create("ScreenGui", CoreGui, {
    Name             = "AstraxHub_V2",
    ResetOnSpawn     = false,
    ZIndexBehavior   = Enum.ZIndexBehavior.Sibling,
}, {
    Create("UIScale", { Scale = UIScale, Name = "Scale" })
})
do
    local old = CoreGui:FindFirstChild(ScreenGui.Name)
    if old and old ~= ScreenGui then old:Destroy() end
end

local function GetStr(v) return type(v)=="function" and v() or v end
local function SaveJson(file, data)
    if writefile then pcall(writefile, file, HttpService:JSONEncode(data)) end
end

local function VerifyTheme(t)
    for n in pairs(MyLibrary.Themes) do if n==t then return true end end
end

local function Tween(inst, prop, newVal, time, waitDone)
    local tw = TweenService:Create(inst,
        TweenInfo.new(time or 0.35, Enum.EasingStyle.Quint),
        { [prop] = newVal })
    tw:Play()
    if waitDone then tw.Completed:Wait() end
    return tw
end

local function MakeDrag(inst)
    task.spawn(function()
        local dragStart, startPos, on
        local function upd(input)
            local d  = input.Position - dragStart
            local np = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X/UIScale,
                                  startPos.Y.Scale, startPos.Y.Offset + d.Y/UIScale)
            Tween(inst, "Position", np, 0.25)
        end
        local mb1 = Enum.UserInputType.MouseButton1
        if inst:IsA("GuiButton") then
            inst.MouseButton1Down:Connect(function() on = true end)
        end
        inst.InputBegan:Connect(function(inp)
            if inp.UserInputType == mb1 or inp.UserInputType == Enum.UserInputType.Touch then
                startPos = inst.Position
                dragStart = inp.Position
                while UserInputService:IsMouseButtonPressed(mb1) do
                    RunService.Heartbeat:Wait()
                    if on or not inst:IsA("GuiButton") then upd(inp) end
                end
                on = false
            end
        end)
        if inst:IsA("GuiButton") then
            pcall(function() inst.AutoButtonColor = false end)
        end
    end)
    return inst
end

local function ConnectSave(inst, func)
    inst.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait() end
            func()
        end
    end)
end

local Theme = MyLibrary.Themes[MyLibrary.Save.Theme]

local function AddEle(name, fn) MyLibrary.Elements[name] = fn end
local function Make(ele, inst, props, ...)
    return MyLibrary.Elements[ele](inst, props, ...)
end

AddEle("Corner", function(parent, radius)
    return Create("UICorner", parent, { CornerRadius = radius or UDim.new(0, 8) })
end)

AddEle("Stroke", function(parent, props, color, thickness)
    return InsertTheme(SetProps(Create("UIStroke", parent, {
        Color          = color     or Theme["Color Stroke"],
        Thickness      = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }), props), "Stroke")
end)

AddEle("Gradient", function(parent, props)
    return InsertTheme(SetProps(Create("UIGradient", parent, {
        Color = Theme["Color Hub 1"],
    }), props), "Gradient")
end)

AddEle("Button", function(parent, props, callback)
    local btn = InsertTheme(SetProps(Create("TextButton", parent, {
        Text                = "",
        Size                = UDim2.fromScale(1, 1),
        BackgroundColor3    = Theme["Color Card"],
        AutoButtonColor     = false,
        BorderSizePixel     = 0,
    }), props), "Card")

    btn.MouseEnter:Connect(function()
        Tween(btn, "BackgroundColor3", Theme["Color Panel"], 0.15)
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, "BackgroundColor3", Theme["Color Card"], 0.15)
    end)
    btn.MouseButton1Down:Connect(function()
        Tween(btn, "BackgroundColor3", Theme["Color Stroke"], 0.08)
    end)
    btn.MouseButton1Up:Connect(function()
        Tween(btn, "BackgroundColor3", Theme["Color Card"], 0.15)
    end)
    if callback then btn.Activated:Connect(callback) end
    return btn
end)

local function ButtonFrame(parent, title, desc, holderSize)
    local TitleL = InsertTheme(Create("TextLabel", {
        Font               = Enum.Font.GothamBold,
        TextColor3         = Theme["Color Text"],
        Size               = UDim2.new(1, 0, 0, 0),
        AutomaticSize      = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        TextTruncate       = Enum.TextTruncate.AtEnd,
        TextSize           = 11,
        TextXAlignment     = Enum.TextXAlignment.Left,
        Text               = "",
        RichText           = true,
    }), "Text")

    local DescL = InsertTheme(Create("TextLabel", {
        Font               = Enum.Font.Gotham,
        TextColor3         = Theme["Color Dark Text"],
        Size               = UDim2.new(1, 0, 0, 0),
        AutomaticSize      = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        TextWrapped        = true,
        TextSize           = 9,
        TextXAlignment     = Enum.TextXAlignment.Left,
        Text               = "",
        RichText           = true,
        Visible            = false,
    }), "DarkText")

    local frame = Make("Button", parent, {
        Size          = UDim2.new(1, 0, 0, 32),
        AutomaticSize = Enum.AutomaticSize.Y,
        Name          = "Option",
    })
    Make("Corner", frame, UDim.new(0, 7))
    Make("Stroke", frame, nil, Theme["Color Separator"], 0.6)

    local lh = Create("Frame", frame, {
        AutomaticSize      = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size               = holderSize,
        Position           = UDim2.new(0, 10, 0.5, 0),
        AnchorPoint        = Vector2.new(0, 0.5),
    }, {
        Create("UIListLayout", {
            SortOrder         = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding           = UDim.new(0, 2),
        }),
        Create("UIPadding", {
            PaddingTop    = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
        }),
        TitleL, DescL,
    })

    local Label = {}
    function Label:SetTitle(t)
        if type(t)=="string" and #t:gsub(" ","")>0 then TitleL.Text = t end
    end
    function Label:SetDesc(d)
        if type(d)=="string" and #d:gsub(" ","")>0 then
            DescL.Text    = d
            DescL.Visible = true
            lh.Position   = UDim2.new(0, 10, 0, 0)
            lh.AnchorPoint = Vector2.new(0, 0)
        else
            DescL.Visible = false
            DescL.Text    = ""
            lh.Position   = UDim2.new(0, 10, 0.5, 0)
            lh.AnchorPoint = Vector2.new(0, 0.5)
        end
    end
    Label:SetTitle(title)
    Label:SetDesc(desc)
    return frame, Label
end

local function GetColorProp(inst)
    if inst:IsA("Frame")              then return "BackgroundColor3"
    elseif inst:IsA("ImageLabel")     then return "ImageColor3"
    elseif inst:IsA("TextLabel")      then return "TextColor3"
    elseif inst:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
    elseif inst:IsA("UIStroke")       then return "Color"
    end
    return ""
end

function MyLibrary:GetIcon(idx)
    if type(idx)~="string" or idx:find("rbxassetid://") or #idx==0 then return idx end
    idx = string.lower(idx):gsub("lucide",""):gsub("-","")
    local first
    for name, icon in pairs(self.Icons) do
        local n = name:gsub("lucide",""):gsub("-","")
        if n == idx then return icon end
        if not first and n:find(idx,1,true) then first = icon end
    end
    return first or idx
end

function MyLibrary:SetTheme(newTheme)
    if not VerifyTheme(newTheme) then return end
    MyLibrary.Save.Theme = newTheme
    SaveJson("astrax_hub_v2.json", MyLibrary.Save)
    Theme = MyLibrary.Themes[newTheme]
    Connection:FireConnection("ThemeChanged", newTheme)
    for _, v in ipairs(MyLibrary.Instances) do
        local inst, t = v.Instance, v.Type
        local prop = GetColorProp(inst)
        if     t=="Gradient"  then inst.Color = Theme["Color Hub 1"]
        elseif t=="Frame"     then inst.BackgroundColor3 = Theme["Color Hub 2"]
        elseif t=="Card"      then inst.BackgroundColor3 = Theme["Color Card"]
        elseif t=="Panel"     then inst.BackgroundColor3 = Theme["Color Panel"]
        elseif t=="Stroke"    then inst[prop] = Theme["Color Stroke"]
        elseif t=="Theme"     then inst[prop] = Theme["Color Theme"]
        elseif t=="Text"      then inst[prop] = Theme["Color Text"]
        elseif t=="DarkText"  then inst[prop] = Theme["Color Dark Text"]
        elseif t=="ScrollBar" then inst[prop] = Theme["Color Theme"]
        end
    end
end

function MyLibrary:SetScale(newScale)
    local s = ViewportSize.Y / math.clamp(newScale, 300, 2000)
    UIScale = s
    ScreenGui.Scale.Scale = s
end

function MyLibrary:MakeWindow(Configs)
    local WTitle    = Configs[1] or Configs.Name    or Configs.Title    or "Astrax Hub"
    local WSubTitle = Configs[2] or Configs.SubTitle or "VIP Premium"
    Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false

    local function LoadFile()
        local f = Settings.ScriptFile
        if type(f)~="string" or not readfile or not isfile then return end
        local ok, r = pcall(isfile, f)
        if ok and r then
            local ok2, raw = pcall(readfile, f)
            if ok2 and type(raw)=="string" then
                local ok3, parsed = pcall(function() return HttpService:JSONDecode(raw) end)
                if ok3 then Flags = parsed end
            end
        end
    end; LoadFile()

    local SX, SY = unpack(MyLibrary.Save.UISize)

    local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
        Size               = UDim2.fromOffset(SX, SY),
        Position           = UDim2.new(0.5, -SX/2, 0.5, -SY/2),
        BackgroundColor3   = Theme["Color Hub 2"],
        BackgroundTransparency = 0,
        AutoButtonColor    = false,
        BorderSizePixel    = 0,
        Name               = "AstraxHub",
        ClipsDescendants   = false,
    }), "Frame")

    Make("Gradient", MainFrame, { Rotation = 135 })
    local MainStroke = Make("Stroke", MainFrame, nil, Theme["Color Stroke"], 1.2)
    local MainCorner = Make("Corner", MainFrame, UDim.new(0, 12))

    local Shadow = Create("Frame", ScreenGui, {
        Size             = UDim2.new(0, SX + 30, 0, SY + 30),
        Position         = UDim2.new(0.5, -(SX+30)/2, 0.5, -(SY+30)/2 + 6),
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.55,
        BorderSizePixel  = 0,
        ZIndex           = 0,
        Name             = "Shadow",
    })
    Make("Corner", Shadow, UDim.new(0, 18))

    MainFrame.BackgroundTransparency = 1
    Shadow.BackgroundTransparency    = 1
    task.spawn(function()
        Tween(MainFrame, "BackgroundTransparency", 0,    0.4)
        Tween(Shadow,    "BackgroundTransparency", 0.55, 0.4)
    end)

    MakeDrag(MainFrame)

    local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdowns" })

    local TabW = MyLibrary.Save.TabSize
    local Sidebar = InsertTheme(Create("Frame", MainFrame, {
        Size             = UDim2.new(0, TabW, 1, 0),
        Position         = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Theme["Color Panel"],
        BorderSizePixel  = 0,
        ClipsDescendants = true,
        ZIndex           = 2,
        Name             = "Sidebar",
    }), "Panel")
    Make("Corner", Sidebar, UDim.new(0, 12))

    local PROFILE_H = 78
    local ProfileFrame = InsertTheme(Create("Frame", Sidebar, {
        Size             = UDim2.new(1, 0, 0, PROFILE_H),
        Position         = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Theme["Color Panel"],
        BorderSizePixel  = 0,
        ClipsDescendants = false,
        ZIndex           = 4,
        Name             = "Profile",
    }), "Panel")
    Make("Corner", ProfileFrame, UDim.new(0, 12))

    local AvatarBorderSize = 44
    local AvatarBorder = InsertTheme(Create("Frame", ProfileFrame, {
        Size             = UDim2.fromOffset(AvatarBorderSize, AvatarBorderSize),
        Position         = UDim2.new(0, 10, 0.5, 0),
        AnchorPoint      = Vector2.new(0, 0.5),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel  = 0,
        ZIndex           = 5,
        Name             = "AvatarBorder",
    }), "Theme")
    Make("Corner", AvatarBorder, UDim.new(1, 0))

    local AvatarImg = Create("ImageLabel", AvatarBorder, {
        Size             = UDim2.new(1, -4, 1, -4),
        Position         = UDim2.new(0, 2, 0, 2),
        Image            = "rbxthumb://type=AvatarHeadShot&id="..Player.UserId.."&w=420&h=420",
        BackgroundColor3 = Color3.fromRGB(10, 10, 12),
        BorderSizePixel  = 0,
        ZIndex           = 6,
        Name             = "Avatar",
    })
    Make("Corner", AvatarImg, UDim.new(1, 0))

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size             = UDim2.new(1, -(AvatarBorderSize + 22), 0, 18),
        Position         = UDim2.new(0, AvatarBorderSize + 18, 0, 14),
        Text             = WTitle,
        TextColor3       = Theme["Color Text"],
        Font             = Enum.Font.GothamBold,
        TextSize         = 13,
        TextXAlignment   = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextTruncate     = Enum.TextTruncate.AtEnd,
        ZIndex           = 5,
    }), "Text")

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size             = UDim2.new(1, -(AvatarBorderSize + 22), 0, 14),
        Position         = UDim2.new(0, AvatarBorderSize + 18, 0, 34),
        Text             = "@"..Player.Name,
        TextColor3       = Theme["Color Dark Text"],
        Font             = Enum.Font.Gotham,
        TextSize         = 10,
        TextXAlignment   = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextTruncate     = Enum.TextTruncate.AtEnd,
        ZIndex           = 5,
    }), "DarkText")

    local VipBadge = Create("Frame", ProfileFrame, {
        Size             = UDim2.fromOffset(32, 13),
        Position         = UDim2.new(0, AvatarBorderSize + 18, 0, 51),
        BackgroundColor3 = Theme["Color Theme"],
        BorderSizePixel  = 0,
        ZIndex           = 5,
    })
    Make("Corner", VipBadge, UDim.new(1, 0))
    Create("TextLabel", VipBadge, {
        Size             = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text             = "VIP",
        TextColor3       = Color3.fromRGB(255,255,255),
        Font             = Enum.Font.GothamBold,
        TextSize         = 8,
        ZIndex           = 6,
    })

    InsertTheme(Create("Frame", Sidebar, {
        Size             = UDim2.new(1, -20, 0, 1),
        Position         = UDim2.new(0, 10, 0, PROFILE_H + 1),
        BackgroundColor3 = Theme["Color Separator"],
        BorderSizePixel  = 0,
        ZIndex           = 3,
        Name             = "ProfileSeparator",
    }), "Stroke")

    local TabContainer = InsertTheme(Create("ScrollingFrame", Sidebar, {
        Size             = UDim2.new(1, 0, 1, -(PROFILE_H + 4)),
        Position         = UDim2.new(0, 0, 0, PROFILE_H + 4),
        BackgroundTransparency = 1,
        BorderSizePixel  = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme["Color Theme"],
        CanvasSize       = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        ZIndex           = 2,
        Name             = "TabContainer",
    }), "ScrollBar")

    Create("UIPadding", TabContainer, {
        PaddingTop    = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
        PaddingLeft   = UDim.new(0, 8),
        PaddingRight  = UDim.new(0, 8),
    })
    Create("UIListLayout", TabContainer, {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0, 4),
    })

    local ContentContainer = Create("Frame", MainFrame, {
        Size             = UDim2.new(1, -(TabW + 8), 1, -40),
        Position         = UDim2.new(0, TabW + 4, 0, 36),
        BackgroundTransparency = 1,
        Name             = "Content",
        ClipsDescendants = true,
    })

    local WIN_BTN_SIZE = 18
    local WIN_BTN_TOP  = 9

    local WinControls = Create("Frame", MainFrame, {
        Size             = UDim2.fromOffset(52, WIN_BTN_SIZE),
        Position         = UDim2.new(1, -8, 0, WIN_BTN_TOP),
        AnchorPoint      = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        ZIndex           = 20,
        Name             = "WindowControls",
    }, {
        Create("UIListLayout", {
            FillDirection       = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment   = Enum.VerticalAlignment.Center,
            Padding             = UDim.new(0, 6),
            SortOrder           = Enum.SortOrder.LayoutOrder,
        })
    })

    local function WinBtn(icon, color, order)
        local btn = Create("ImageButton", WinControls, {
            Size             = UDim2.fromOffset(WIN_BTN_SIZE, WIN_BTN_SIZE),
            BackgroundColor3 = color,
            Image            = icon,
            ImageColor3      = Color3.fromRGB(255,255,255),
            AutoButtonColor  = false,
            BorderSizePixel  = 0,
            ZIndex           = 21,
            LayoutOrder      = order,
        })
        Make("Corner", btn, UDim.new(1, 0))
        btn.MouseEnter:Connect(function()
            Tween(btn, "BackgroundColor3", Color3.fromRGB(
                math.min(color.R*255+40,255),
                math.min(color.G*255+40,255),
                math.min(color.B*255+40,255)), 0.12)
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, "BackgroundColor3", color, 0.12)
        end)
        return btn
    end

    local MinimizeButton = WinBtn("rbxassetid://10734896206", Color3.fromRGB(55, 55, 65), 1)
    local CloseButton    = WinBtn("rbxassetid://10747384394", Color3.fromRGB(190, 20, 20), 2)

    local CtrlSize = MakeDrag(Create("ImageButton", MainFrame, {
        Size             = UDim2.fromOffset(22, 22),
        Position         = UDim2.fromOffset(SX, SY),
        AnchorPoint      = Vector2.new(1, 1),
        BackgroundTransparency = 1,
        Image            = "rbxassetid://10709818534",
        ImageColor3      = Theme["Color Stroke"],
        AutoButtonColor  = false,
        ZIndex           = 15,
        Name             = "ResizeHandle",
    }))
    local CtrlTab = MakeDrag(Create("ImageButton", MainFrame, {
        Size             = UDim2.new(0, 10, 1, -PROFILE_H),
        Position         = UDim2.new(0, TabW, 0, PROFILE_H),
        AnchorPoint      = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        AutoButtonColor  = false,
        ZIndex           = 15,
        Name             = "TabResizeHandle",
    }))

    local function ApplyResize()
        local p1 = CtrlSize.Position
        local p2 = CtrlTab.Position
        local nx  = math.clamp(p1.X.Offset, 440, 1000)
        local ny  = math.clamp(p1.Y.Offset, 210, 520)
        local ntw = math.clamp(p2.X.Offset, 140, 260)

        CtrlSize.Position = UDim2.fromOffset(nx, ny)
        CtrlTab.Position  = UDim2.new(0, ntw, 0, PROFILE_H)

        MainFrame.Size            = UDim2.fromOffset(nx, ny)
        Shadow.Size               = UDim2.fromOffset(nx+30, ny+30)
        Shadow.Position           = UDim2.new(0.5,-(nx+30)/2, 0.5,-(ny+30)/2+6)
        Sidebar.Size              = UDim2.new(0, ntw, 1, 0)
        ContentContainer.Size     = UDim2.new(1, -(ntw+8), 1, -40)
        ContentContainer.Position = UDim2.new(0, ntw+4, 0, 36)
        CtrlTab.Position          = UDim2.new(0, ntw, 0, PROFILE_H)
    end

    CtrlSize:GetPropertyChangedSignal("Position"):Connect(ApplyResize)
    CtrlTab:GetPropertyChangedSignal("Position"):Connect(ApplyResize)

    ConnectSave(CtrlSize, function()
        MyLibrary.Save.UISize  = { MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset }
        SaveJson("astrax_hub_v2.json", MyLibrary.Save)
    end)
    ConnectSave(CtrlTab, function()
        MyLibrary.Save.TabSize = Sidebar.Size.X.Offset
        SaveJson("astrax_hub_v2.json", MyLibrary.Save)
    end)

    local Minimized, SavedSize, WinLock
    local Window, FirstTab = {}, false
    local ContainerList    = {}

    function Window:CloseBtn()
        self:Dialog({
            Title = "⚠  Fechar",
            Text  = "Deseja realmente fechar o Astrax Hub?",
            Options = {
                { "Confirmar", function() ScreenGui:Destroy() Shadow:Destroy() end },
                { "Cancelar"  },
            }
        })
    end

    function Window:MinimizeBtn()
        if WinLock then return end
        WinLock = true
        if Minimized then
            Tween(MainFrame, "Size", SavedSize, 0.28, true)
            CtrlSize.Visible = true
            CtrlTab.Visible  = true
            Shadow.Visible   = true
            Minimized = false
        else
            SavedSize = MainFrame.Size
            CtrlSize.Visible = false
            CtrlTab.Visible  = false
            Tween(MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 36), 0.28, true)
            Shadow.Visible   = false
            Minimized = true
        end
        WinLock = false
    end

    function Window:Minimize()
        MainFrame.Visible = not MainFrame.Visible
        Shadow.Visible    = MainFrame.Visible
    end

    function Window:Dialog(Configs)
        if MainFrame:FindFirstChild("DialogOverlay") then return end
        if Minimized then self:MinimizeBtn() end

        local DTitle   = Configs[1] or Configs.Title   or "Dialog"
        local DText    = Configs[2] or Configs.Text     or ""
        local DOptions = Configs[3] or Configs.Options  or {}

        local Overlay = InsertTheme(Create("Frame", MainFrame, {
            Size             = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0,0,0),
            BackgroundTransparency = 1,
            Active           = true,
            ZIndex           = 50,
            Name             = "DialogOverlay",
        }), "Frame")
        MainCorner:Clone().Parent = Overlay
        Tween(Overlay, "BackgroundTransparency", 0.45, 0.2)

        local Card = Create("Frame", Overlay, {
            Size             = UDim2.fromOffset(270, 140),
            Position         = UDim2.fromScale(0.5, 0.5),
            AnchorPoint      = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme["Color Panel"],
            BorderSizePixel  = 0,
            ZIndex           = 51,
        })
        Make("Corner", Card, UDim.new(0, 10))
        Make("Stroke", Card, nil, Theme["Color Stroke"], 1)
        Make("Gradient", Card, { Rotation = 225 })

        InsertTheme(Create("TextLabel", Card, {
            Size             = UDim2.new(1, -20, 0, 22),
            Position         = UDim2.fromOffset(12, 8),
            Text             = DTitle,
            TextColor3       = Theme["Color Text"],
            Font             = Enum.Font.GothamBold,
            TextSize         = 14,
            TextXAlignment   = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            ZIndex           = 52,
        }), "Text")

        InsertTheme(Create("TextLabel", Card, {
            Size             = UDim2.new(1, -24, 0, 55),
            Position         = UDim2.fromOffset(12, 33),
            Text             = DText,
            TextColor3       = Theme["Color Dark Text"],
            Font             = Enum.Font.Gotham,
            TextSize         = 11,
            TextXAlignment   = Enum.TextXAlignment.Left,
            TextWrapped      = true,
            BackgroundTransparency = 1,
            ZIndex           = 52,
        }), "DarkText")

        local BtnHolder = Create("Frame", Card, {
            Size             = UDim2.new(1, -20, 0, 28),
            Position         = UDim2.new(0, 10, 1, -38),
            BackgroundTransparency = 1,
            ZIndex           = 52,
        }, {
            Create("UIListLayout", {
                FillDirection       = Enum.FillDirection.Horizontal,
                Padding             = UDim.new(0, 8),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment   = Enum.VerticalAlignment.Center,
            })
        })

        Card.Size = UDim2.fromOffset(270 * 1.1, 140 * 1.1)
        Tween(Card, "Size", UDim2.fromOffset(270, 140), 0.22)

        local btnCount, Dialog = 0, {}
        function Dialog:Button(cfg)
            local name     = cfg[1] or cfg.Name or ""
            local callback = cfg[2] or cfg.Callback or function() end
            btnCount = btnCount + 1

            local b = Create("TextButton", BtnHolder, {
                Size             = UDim2.new(1/math.max(btnCount,1), -(4*(math.max(btnCount,1)-1)), 1, 0),
                BackgroundColor3 = Theme["Color Theme"],
                Text             = name,
                Font             = Enum.Font.GothamBold,
                TextSize         = 11,
                TextColor3       = Color3.fromRGB(255,255,255),
                AutoButtonColor  = false,
                BorderSizePixel  = 0,
                ZIndex           = 53,
            })
            Make("Corner", b, UDim.new(0, 6))

            b.MouseEnter:Connect(function()
                Tween(b,"BackgroundColor3", Theme["Color ThemeHover"], 0.12)
            end)
            b.MouseLeave:Connect(function()
                Tween(b,"BackgroundColor3", Theme["Color Theme"], 0.12)
            end)

            for _, ch in ipairs(BtnHolder:GetChildren()) do
                if ch:IsA("TextButton") then
                    ch.Size = UDim2.new(1/btnCount, -(4*(btnCount-1)/btnCount), 1, 0)
                end
            end

            b.Activated:Connect(function() Dialog:Close() end)
            b.Activated:Connect(callback)
        end
        function Dialog:Close()
            Tween(Overlay, "BackgroundTransparency", 1, 0.15)
            Tween(Card,    "Size", UDim2.fromOffset(270*1.1,140*1.1), 0.18)
            task.delay(0.2, function() Overlay:Destroy() end)
        end
        for _, opt in ipairs(DOptions) do Dialog:Button(opt) end
        return Dialog
    end

    function Window:SelectTab(idx)
        if type(idx)=="number" then
            if MyLibrary.Tabs[idx] then MyLibrary.Tabs[idx].func:Enable() end
        else
            for _, t in ipairs(MyLibrary.Tabs) do
                if t.Cont == idx.Cont then t.func:Enable() end
            end
        end
    end

    function Window:AddMinimizeButton(cfg)
        local btn = MakeDrag(Create("ImageButton", ScreenGui, {
            Size             = UDim2.fromOffset(35, 35),
            Position         = cfg.Position or UDim2.fromScale(0.05, 0.05),
            BackgroundTransparency = 1,
            AutoButtonColor  = false,
            ZIndex           = 5,
        }))
        if cfg.Corner then Make("Corner", btn, cfg.Corner) end
        if cfg.Stroke then Make("Stroke", btn, nil, cfg.Stroke.Color, cfg.Stroke.Thickness) end
        if cfg.Button then SetProps(btn, cfg.Button) end
        btn.Activated:Connect(function() self:Minimize() end)
        return { Button = btn }
    end

    function Window:MakeTab(paste, Configs)
        if type(paste)=="table" then Configs = paste end
        local TName = Configs[1] or Configs.Title or "Tab"
        local TIcon = Configs[2] or Configs.Icon  or ""
        TIcon = MyLibrary:GetIcon(TIcon)
        if not TIcon or not TIcon:find("rbxassetid://") or
           #TIcon:gsub("rbxassetid://","") < 6 then TIcon = false end

        local TabBtn = Make("Button", TabContainer, {
            Size       = UDim2.new(1, 0, 0, 34),
            LayoutOrder = #ContainerList + 1,
        })
        Make("Corner", TabBtn, UDim.new(0, 7))

        local TabIcon = InsertTheme(Create("ImageLabel", TabBtn, {
            Size             = UDim2.fromOffset(16, 16),
            Position         = UDim2.new(0, 10, 0.5, -8),
            Image            = TIcon or "",
            ImageColor3      = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            ZIndex           = 2,
        }), "DarkText")

        local TabLabel = InsertTheme(Create("TextLabel", TabBtn, {
            Size             = UDim2.new(1, -34, 1, 0),
            Position         = UDim2.new(0, 32, 0, 0),
            Text             = TName,
            TextColor3       = Theme["Color Dark Text"],
            Font             = Enum.Font.GothamMedium,
            TextSize         = 12,
            TextXAlignment   = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            ZIndex           = 2,
        }), "DarkText")

        local TabIndicator = InsertTheme(Create("Frame", TabBtn, {
            Size             = UDim2.fromOffset(3, 0),
            Position         = UDim2.new(0, 0, 0.5, 0),
            AnchorPoint      = Vector2.new(0, 0.5),
            BackgroundColor3 = Theme["Color Theme"],
            BorderSizePixel  = 0,
            BackgroundTransparency = 1,
            ZIndex           = 3,
        }), "Theme")
        Make("Corner", TabIndicator, UDim.new(0, 3))

        local Container = InsertTheme(Create("ScrollingFrame", {
            Size             = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = Theme["Color Theme"],
            ScrollBarImageTransparency = 0.3,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            CanvasSize       = UDim2.new(),
            Name             = ("Tab_%d_%s"):format(#ContainerList+1, TName),
        }, {
            Create("UIPadding", {
                PaddingLeft   = UDim.new(0, 8),
                PaddingRight  = UDim.new(0, 8),
                PaddingTop    = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
            }),
            Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding   = UDim.new(0, 5),
            }),
        }), "ScrollBar")

        table.insert(ContainerList, Container)
        if not FirstTab then Container.Parent = ContentContainer end
        FirstTab = true

        local function Activate()
            if Container.Parent == ContentContainer then return end
            for _, c in ipairs(ContainerList) do
                if c ~= Container then c.Parent = nil end
            end
            Container.Parent = ContentContainer

            for _, ch in ipairs(TabContainer:GetChildren()) do
                if ch:IsA("TextButton") then
                    Tween(ch, "BackgroundColor3", Theme["Color Card"], 0.18)
                    local ic = ch:FindFirstChildOfClass("ImageLabel")
                    local lb = ch:FindFirstChildOfClass("TextLabel")
                    local ind = ch:FindFirstChild("Indicator") or ch:FindFirstChildWhichIsA("Frame")
                    if ic  then Tween(ic,  "ImageColor3", Theme["Color Dark Text"], 0.18) end
                    if lb  then Tween(lb,  "TextColor3",  Theme["Color Dark Text"], 0.18) end
                    if ind and ind.Name~="Option" then
                        Tween(ind, "BackgroundTransparency", 1, 0.18)
                        Tween(ind, "Size", UDim2.fromOffset(3,0), 0.18)
                    end
                end
            end

            Tween(TabBtn,       "BackgroundColor3", Theme["Color Panel"], 0.18)
            Tween(TabIcon,      "ImageColor3",      Color3.fromRGB(255,255,255), 0.18)
            Tween(TabLabel,     "TextColor3",       Color3.fromRGB(255,255,255), 0.18)
            Tween(TabIndicator, "BackgroundTransparency", 0, 0.18)
            Tween(TabIndicator, "Size", UDim2.fromOffset(3, 20), 0.18)
        end

        TabBtn.Activated:Connect(Activate)

        local Tab = { Cont = Container }
        table.insert(MyLibrary.Tabs, { TabInfo = { Name=TName, Icon=TIcon }, func=Tab, Cont=Container })

        function Tab:Enable()  Activate() end
        function Tab:Disable() Container.Parent = nil end
        function Tab:Visible(b)
            Funcs:ToggleVisible(TabBtn, b)
            if not b then 
                Container.Parent = nil
            else
                Container.Parent = ContentContainer
            end
        end
        function Tab:Destroy() TabBtn:Destroy(); Container:Destroy() end

        function Tab:AddSection(cfg)
            local name = type(cfg)=="string" and cfg or cfg[1] or cfg.Name or cfg.Title or "Section"

            local sf = Create("Frame", Container, {
                Size             = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                Name             = "Option",
            }, {
                Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 1),
                    Position         = UDim2.new(0, 0, 1, -1),
                    BackgroundColor3 = Theme["Color Separator"],
                    BorderSizePixel  = 0,
                }),
            })

            InsertTheme(Create("TextLabel", sf, {
                Font             = Enum.Font.GothamBold,
                Text             = ("  %s"):format(name),
                TextColor3       = Theme["Color Theme"],
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                TextSize         = 10,
                TextXAlignment   = Enum.TextXAlignment.Left,
            }), "Theme")

            local S = {}
            function S:Visible(b) sf.Visible = b~=nil and b or not sf.Visible end
            function S:Destroy()  sf:Destroy() end
            function S:Set(v)     if v then sf:FindFirstChildOfClass("TextLabel").Text = ("  %s"):format(v) end end
            return S
        end

        function Tab:AddParagraph(cfg)
            local pn = cfg[1] or cfg.Title or "Paragraph"
            local pd = cfg[2] or cfg.Text  or ""
            local fr, lf = ButtonFrame(Container, pn, pd, UDim2.new(1, -12))
            local P = {}
            function P:Visible(...)  Funcs:ToggleVisible(fr, ...) end
            function P:Destroy()     fr:Destroy() end
            function P:SetTitle(v)   lf:SetTitle(GetStr(v)) end
            function P:SetDesc(v)    lf:SetDesc(GetStr(v)) end
            function P:Set(v1, v2)
                if v1 and v2 then lf:SetTitle(GetStr(v1)); lf:SetDesc(GetStr(v2))
                elseif v1 then lf:SetDesc(GetStr(v1)) end
            end
            return P
        end

        function Tab:AddButton(cfg)
            local name = cfg[1] or cfg.Name  or cfg.Title or "Button"
            local desc = cfg.Desc or cfg.Description or ""
            local cb   = Funcs:GetCallback(cfg, 2)

            local fb, lf = ButtonFrame(Container, name, desc, UDim2.new(1, -36))

            Create("ImageLabel", fb, {
                Size             = UDim2.fromOffset(12, 12),
                Position         = UDim2.new(1, -10, 0.5, -6),
                Image            = "rbxassetid://10709791437",
                ImageColor3      = Theme["Color Dark Text"],
                BackgroundTransparency = 1,
                ZIndex           = 2,
            })

            fb.Activated:Connect(function() Funcs:FireCallback(cb) end)

            local Btn = {}
            function Btn:Visible(...)  Funcs:ToggleVisible(fb, ...) end
            function Btn:Destroy()     fb:Destroy() end
            function Btn:Callback(...) Funcs:InsertCallback(cb, ...) end
            function Btn:Set(v1, v2)
                if type(v1)=="string" and type(v2)=="string" then lf:SetTitle(v1); lf:SetDesc(v2)
                elseif type(v1)=="string" then lf:SetTitle(v1)
                elseif type(v1)=="function" then cb = {v1} end
            end
            return Btn
        end

        function Tab:AddToggle(cfg)
            local name    = cfg[1] or cfg.Name    or cfg.Title or "Toggle"
            local desc    = cfg.Desc or cfg.Description or ""
            local flag    = cfg[4] or cfg.Flag    or false
            local default = cfg[2] or cfg.Default or false
            local cb      = Funcs:GetCallback(cfg, 3)
            if CheckFlag(flag) then default = GetFlag(flag) end

            local fb, lf = ButtonFrame(Container, name, desc, UDim2.new(1, -58, 0, 0))
            fb.AutomaticSize = Enum.AutomaticSize.Y

            local TRACK_W, TRACK_H = 38, 20
            local KNOB_S           = 14

            local Track = InsertTheme(Create("Frame", fb, {
                Size             = UDim2.fromOffset(TRACK_W, TRACK_H),
                Position         = UDim2.new(1, -12, 0.5, 0),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Toggle Off"],
                BorderSizePixel  = 0,
                ZIndex           = 3,
            }), "Stroke")
            Make("Corner", Track, UDim.new(1, 0))

            local Knob = InsertTheme(Create("Frame", Track, {
                Size             = UDim2.fromOffset(KNOB_S, KNOB_S),
                Position         = UDim2.new(0, 3, 0.5, 0),
                AnchorPoint      = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(200, 200, 210),
                BorderSizePixel  = 0,
                ZIndex           = 4,
            }), "Text")
            Make("Corner", Knob, UDim.new(1, 0))

            local KnobGlow = Create("Frame", Knob, {
                Size             = UDim2.fromScale(1,1),
                BackgroundColor3 = Theme["Color Theme"],
                BackgroundTransparency = 1,
                BorderSizePixel  = 0,
                ZIndex           = 5,
            })
            Make("Corner", KnobGlow, UDim.new(1,0))

            local locked = false
            local current = default

            local function ApplyState(val, instant)
                current = val
                SetFlag(flag, val)
                Funcs:FireCallback(cb, val)

                local t = instant and 0 or 0.22

                if val then
                    Tween(Track, "BackgroundColor3", Theme["Color Theme"], t)
                    Tween(Knob,  "Position", UDim2.new(1, -(KNOB_S+3), 0.5, 0), t)
                    Tween(Knob,  "AnchorPoint", Vector2.new(1, 0.5), t)
                    Tween(KnobGlow, "BackgroundTransparency", 0.6, t)
                    Tween(Knob, "BackgroundColor3", Color3.fromRGB(255,255,255), t)
                else
                    Tween(Track, "BackgroundColor3", Theme["Color Toggle Off"], t)
                    Tween(Knob,  "Position", UDim2.new(0, 3, 0.5, 0), t)
                    Tween(Knob,  "AnchorPoint", Vector2.new(0, 0.5), t)
                    Tween(KnobGlow, "BackgroundTransparency", 1, t)
                    Tween(Knob, "BackgroundColor3", Color3.fromRGB(200,200,210), t)
                end
            end

            ApplyState(default, true)

            fb.Activated:Connect(function()
                if locked then return end
                locked = true
                ApplyState(not current, false)
                locked = false
            end)

            local Tog = {}
            function Tog:Visible(...)  Funcs:ToggleVisible(fb, ...) end
            function Tog:Destroy()     fb:Destroy() end
            function Tog:Callback(...) Funcs:InsertCallback(cb, ...)() end
            function Tog:Set(v1, v2)
                if type(v1)=="string" and type(v2)=="string" then
                    lf:SetTitle(v1); lf:SetDesc(v2)
                elseif type(v1)=="string" then
                    lf:SetTitle(v1)
                elseif type(v1)=="boolean" then
                    if locked and v2 then repeat task.wait() until not locked end
                    task.spawn(ApplyState, v1, false)
                elseif type(v1)=="function" then
                    cb = {v1}
                end
            end
            return Tog
        end

        function Tab:AddDropdown(cfg)
            local name      = cfg[1] or cfg.Name    or cfg.Title or "Dropdown"
            local desc      = cfg.Desc or cfg.Description or ""
            local opts      = cfg[2] or cfg.Options  or {}
            local opDef     = cfg[3] or cfg.Default  or {}
            local flag      = cfg[5] or cfg.Flag     or false
            local multi     = cfg.MultiSelect or false
            local cb        = Funcs:GetCallback(cfg, 4)

            local fb, lf = ButtonFrame(Container, name, desc, UDim2.new(1, -170))

            local SelFrame = InsertTheme(Create("Frame", fb, {
                Size             = UDim2.fromOffset(140, 20),
                Position         = UDim2.new(1, -10, 0.5, 0),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Panel"],
                BorderSizePixel  = 0,
                ZIndex           = 2,
            }), "Panel")
            Make("Corner", SelFrame, UDim.new(0, 5))
            Make("Stroke", SelFrame, nil, Theme["Color Separator"], 0.8)

            local SelLabel = InsertTheme(Create("TextLabel", SelFrame, {
                Size             = UDim2.new(1, -22, 1, 0),
                Position         = UDim2.new(0, 6, 0, 0),
                Text             = "...",
                TextColor3       = Theme["Color Text"],
                Font             = Enum.Font.GothamMedium,
                TextSize         = 10,
                TextXAlignment   = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextTruncate     = Enum.TextTruncate.AtEnd,
                ZIndex           = 3,
            }), "Text")

            local Arrow = Create("ImageLabel", SelFrame, {
                Size             = UDim2.fromOffset(12, 12),
                Position         = UDim2.new(1, -4, 0.5, -6),
                Image            = "rbxassetid://10709791523",
                BackgroundTransparency = 1,
                ZIndex           = 3,
            })

            local ACF = Create("TextButton", DropdownHolder, {
                Size             = UDim2.fromScale(1,1),
                BackgroundTransparency = 1,
                Visible          = false,
                Text             = "",
                ZIndex           = 100,
            })

            local DropFrame = Create("Frame", ACF, {
                Size             = UDim2.fromOffset(142, 0),
                BackgroundColor3 = Theme["Color Panel"],
                ClipsDescendants = true,
                Active           = true,
                ZIndex           = 101,
            })
            Make("Corner", DropFrame, UDim.new(0, 7))
            Make("Stroke", DropFrame, nil, Theme["Color Stroke"], 1)

            local DropScroll = InsertTheme(Create("ScrollingFrame", DropFrame, {
                Size             = UDim2.fromScale(1,1),
                BackgroundTransparency = 1,
                BorderSizePixel  = 0,
                ScrollBarThickness = 2,
                ScrollBarImageColor3 = Theme["Color Theme"],
                CanvasSize       = UDim2.new(),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                ZIndex           = 102,
            }, {
                Create("UIPadding", {
                    PaddingLeft   = UDim.new(0,6),
                    PaddingRight  = UDim.new(0,6),
                    PaddingTop    = UDim.new(0,5),
                    PaddingBottom = UDim.new(0,5),
                }),
                Create("UIListLayout", { Padding = UDim.new(0,3) }),
            }), "ScrollBar")

            local dropOpen, scrollSz = false, 10

            local function CalcPos()
                local ap = SelFrame.AbsolutePosition
                local ss = ScreenGui.AbsoluteSize
                local cx = math.clamp(ap.X/UIScale, 0, ss.X/UIScale - 142)
                local cy = math.clamp(ap.Y/UIScale, 0, ss.Y/UIScale)
                local anchor = ap.Y > ss.Y/1.4 and 1 or 0
                DropFrame.AnchorPoint = Vector2.new(0, anchor)
                DropFrame.Position    = UDim2.fromOffset(cx, cy)
            end

            local function CalcSize()
                local cnt = 0
                for _, c in ipairs(DropScroll:GetChildren()) do
                    if c:IsA("Frame") or c:IsA("TextButton") then cnt += 1 end
                end
                scrollSz = math.clamp(cnt, 0, 8) * 26 + 10
                if dropOpen then
                    Tween(DropFrame, "Size", UDim2.fromOffset(142, scrollSz), 0.18)
                end
            end

            local function CloseDropdown()
                dropOpen = false
                ACF.Visible = false
                Tween(DropFrame, "Size", UDim2.fromOffset(142, 0), 0.18)
                Tween(Arrow, "Rotation", 0, 0.15)
            end

            local function ToggleDropdown()
                CalcPos(); CalcSize()
                if dropOpen then
                    CloseDropdown()
                else
                    dropOpen    = true
                    ACF.Visible = true
                    Tween(DropFrame, "Size", UDim2.fromOffset(142, scrollSz), 0.18)
                    Tween(Arrow, "Rotation", 180, 0.15)
                end
            end

            fb.Activated:Connect(ToggleDropdown)
            ACF.MouseButton1Down:Connect(CloseDropdown)
            ACF.MouseButton1Click:Connect(CloseDropdown)
            SelFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalcPos)
            DropScroll.ChildAdded:Connect(CalcSize)
            DropScroll.ChildRemoved:Connect(CalcSize)

            local Selected = multi and {} or (CheckFlag(flag) and GetFlag(flag) or (type(opDef)=="table" and opDef[1] or opDef))
            local OptionMap = {}

            local function UpdateLabel()
                if multi then
                    local lst = {}
                    for k, v in pairs(Selected) do if v then table.insert(lst, k) end end
                    SelLabel.Text = #lst>0 and table.concat(lst,", ") or "..."
                else
                    SelLabel.Text = tostring(Selected or "...")
                end
            end

            local function AddOption(idx, val)
                local nm = tostring(type(idx)=="string" and idx or val)
                if OptionMap[nm] then return end

                local ob = Create("TextButton", DropScroll, {
                    Size             = UDim2.new(1, 0, 0, 22),
                    BackgroundColor3 = Theme["Color Card"],
                    AutoButtonColor  = false,
                    Text             = "",
                    BorderSizePixel  = 0,
                    ZIndex           = 103,
                    Name             = "Option",
                })
                Make("Corner", ob, UDim.new(0, 5))

                local dot = InsertTheme(Create("Frame", ob, {
                    Size             = UDim2.fromOffset(4, 4),
                    Position         = UDim2.new(0, 5, 0.5, 0),
                    AnchorPoint      = Vector2.new(0, 0.5),
                    BackgroundColor3 = Theme["Color Theme"],
                    BackgroundTransparency = 1,
                    BorderSizePixel  = 0,
                    ZIndex           = 104,
                }), "Theme")
                Make("Corner", dot, UDim.new(1,0))

                local oLabel = InsertTheme(Create("TextLabel", ob, {
                    Size             = UDim2.new(1, -16, 1, 0),
                    Position         = UDim2.new(0, 14, 0, 0),
                    Text             = nm,
                    TextColor3       = Theme["Color Text"],
                    Font             = Enum.Font.GothamMedium,
                    TextSize         = 10,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    TextTransparency = 0.4,
                    ZIndex           = 104,
                }), "Text")

                ob.MouseEnter:Connect(function()
                    Tween(ob, "BackgroundColor3", Theme["Color Panel"], 0.1)
                end)
                ob.MouseLeave:Connect(function()
                    Tween(ob, "BackgroundColor3", Theme["Color Card"], 0.1)
                end)

                OptionMap[nm] = { btn=ob, dot=dot, lbl=oLabel, val=val, active=false }

                local function SelectThis()
                    if multi then
                        OptionMap[nm].active = not OptionMap[nm].active
                        Selected[nm] = OptionMap[nm].active
                    else
                        Selected = val
                    end
                    SetFlag(flag, multi and Selected or tostring(Selected))
                    Funcs:FireCallback(cb, Selected)

                    for _, o in pairs(OptionMap) do
                        local active = multi and o.active or (o.val == Selected)
                        Tween(o.dot, "BackgroundTransparency", active and 0 or 1, 0.2)
                        Tween(o.dot, "Size", active and UDim2.fromOffset(4,14) or UDim2.fromOffset(4,4), 0.2)
                        Tween(o.lbl, "TextTransparency", active and 0 or 0.4, 0.2)
                    end
                    UpdateLabel()
                    if not multi then CloseDropdown() end
                end

                ob.Activated:Connect(SelectThis)
            end

            local function AddOptions(list, clear)
                if clear then
                    for _, o in pairs(OptionMap) do o.btn:Destroy() end
                    table.clear(OptionMap)
                    if multi then Selected = {} else Selected = nil end
                end
                for k, v in pairs(list) do AddOption(k, v) end
                UpdateLabel()
            end

            AddOptions(opts)

            local DD = {}
            function DD:Visible(...)  Funcs:ToggleVisible(fb, ...) end
            function DD:Destroy()     fb:Destroy() end
            function DD:Add(list)     AddOptions(list, false) end
            function DD:Set(v, clear)
                if type(v)=="table" then AddOptions(v, not clear)
                elseif type(v)=="function" then cb = {v} end
            end
            return DD
        end

        -- ── SLIDER COM EFEITO POP & SHAKE (INTEGRADO DO SCRIPT 1) ──
        function Tab:AddSlider(cfg)
            local name     = cfg[1] or cfg.Name     or cfg.Title or "Slider"
            local desc     = cfg.Desc or cfg.Description or ""
            local minV     = (cfg[2] or cfg.Min     or 0)
            local maxV     = (cfg[3] or cfg.Max     or 100)
            local inc      = cfg[4] or cfg.Increase or 1
            local flag     = cfg[7] or cfg.Flag     or false
            local default  = cfg[5] or cfg.Default  or minV
            local cb       = Funcs:GetCallback(cfg, 6)
            if CheckFlag(flag) then default = GetFlag(flag) end

            local fb, lf = ButtonFrame(Container, name, desc, UDim2.new(1, -175))

            local SlideArea = Create("TextButton", fb, {
                Size             = UDim2.new(0.44, 0, 1, 0),
                Position         = UDim2.new(1, -8, 0, 0),
                AnchorPoint      = Vector2.new(1, 0),
                BackgroundTransparency = 1,
                AutoButtonColor  = false,
                Text             = "",
                ZIndex           = 2,
            })

            local ValLabel = InsertTheme(Create("TextLabel", SlideArea, {
                Size             = UDim2.fromOffset(30, 20),
                Position         = UDim2.new(0, 0, 0.5, -10),
                BackgroundTransparency = 1,
                TextColor3       = Theme["Color Theme"],
                Font             = Enum.Font.GothamBold,
                TextSize         = 11,
                ZIndex           = 3,
            }), "Theme")

            local LabelUIScale = Create("UIScale", ValLabel, { Scale = 1 })

            local Track = InsertTheme(Create("Frame", SlideArea, {
                Size             = UDim2.new(1, -38, 0, 5),
                Position         = UDim2.new(0, 36, 0.5, -2),
                BackgroundColor3 = Theme["Color Toggle Off"],
                BorderSizePixel  = 0,
                ZIndex           = 3,
            }), "Stroke")
            Make("Corner", Track, UDim.new(1,0))

            local Fill = InsertTheme(Create("Frame", Track, {
                Size             = UDim2.fromScale(0, 1),
                BackgroundColor3 = Theme["Color Theme"],
                BorderSizePixel  = 0,
                ZIndex           = 4,
            }), "Theme")
            Make("Corner", Fill, UDim.new(1,0))

            local Knob = Create("Frame", Track, {
                Size             = UDim2.fromOffset(12, 12),
                Position         = UDim2.new(0, 0, 0.5, 0),
                AnchorPoint      = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(230,230,240),
                BorderSizePixel  = 0,
                ZIndex           = 5,
            })
            Make("Corner", Knob, UDim.new(1,0))

            -- Dinâmica pop & shake do script 1
            ValLabel:GetPropertyChangedSignal("Text"):Connect(function()
                LabelUIScale.Scale = 0.5
                Tween(LabelUIScale, "Scale", 1.25, 0.08)
                Tween(ValLabel, "Rotation", math.random(-1, 1) * 6, 0.1, true)
                Tween(LabelUIScale, "Scale", 1.0, 0.15)
                Tween(ValLabel, "Rotation", 0, 0.1)
            end)

            local curVal = default
            local function SetValue(v)
                v = math.clamp(math.round(v / inc) * inc, minV, maxV)
                curVal = v
                local pct = (v - minV) / math.max(maxV - minV, 1)
                Tween(Fill, "Size", UDim2.fromScale(pct, 1), 0.1)
                Tween(Knob, "Position", UDim2.new(pct, 0, 0.5, 0), 0.1)
                ValLabel.Text = tostring(v)
                SetFlag(flag, v)
                Funcs:FireCallback(cb, v)
            end

            SetValue(default)

            SlideArea.MouseButton1Down:Connect(function()
                Container.ScrollingEnabled = false
                local m = Player:GetMouse()
                repeat
                    RunService.Heartbeat:Wait()
                    local ax = m.X - Track.AbsolutePosition.X
                    local pct = math.clamp(ax / Track.AbsoluteSize.X, 0, 1)
                    SetValue(minV + pct * (maxV - minV))
                until not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                Container.ScrollingEnabled = true
            end)

            local Sl = {}
            function Sl:Visible(...)  Funcs:ToggleVisible(fb, ...) end
            function Sl:Destroy()     fb:Destroy() end
            function Sl:Callback(...) Funcs:InsertCallback(cb, ...)(curVal) end
            function Sl:Set(v1, v2)
                if type(v1)=="number" then SetValue(v1)
                elseif type(v1)=="string" and type(v2)=="string" then lf:SetTitle(v1); lf:SetDesc(v2)
                elseif type(v1)=="string" then lf:SetTitle(v1)
                elseif type(v1)=="function" then cb = {v1} end
            end
            return Sl
        end

        function Tab:AddTextBox(cfg)
            local name        = cfg[1] or cfg.Name or cfg.Title or "TextBox"
            local desc        = cfg.Desc or cfg.Description or ""
            local default     = cfg[2] or cfg.Default or ""
            local placeholder = cfg[5] or cfg.PlaceholderText or "Digite aqui..."
            local clear       = cfg[3] or cfg.ClearText or false
            local cb          = Funcs:GetCallback(cfg, 4)

            local fb, lf = ButtonFrame(Container, name, desc, UDim2.new(1, -170))

            local InputFrame = InsertTheme(Create("Frame", fb, {
                Size             = UDim2.fromOffset(148, 22),
                Position         = UDim2.new(1, -10, 0.5, 0),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Panel"],
                BorderSizePixel  = 0,
                ZIndex           = 2,
            }), "Panel")
            Make("Corner", InputFrame, UDim.new(0, 5))
            Make("Stroke", InputFrame, nil, Theme["Color Separator"], 0.8)

            local TB = InsertTheme(Create("TextBox", InputFrame, {
                Size             = UDim2.new(1, -18, 1, -4),
                Position         = UDim2.new(0, 8, 0, 2),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamMedium,
                TextSize         = 10,
                TextColor3       = Theme["Color Text"],
                PlaceholderText  = placeholder,
                PlaceholderColor3 = Theme["Color Dark Text"],
                ClearTextOnFocus = clear,
                Text             = type(default)=="string" and default or "",
                ZIndex           = 3,
            }), "Text")

            local PencilIcon = Create("ImageLabel", InputFrame, {
                Size             = UDim2.fromOffset(10, 10),
                Position         = UDim2.new(1, -4, 0.5, -5),
                Image            = "rbxassetid://10734919691",
                ImageColor3      = Theme["Color Dark Text"],
                BackgroundTransparency = 1,
                ZIndex           = 3,
            })

            TB.Focused:Connect(function()
                Tween(InputFrame, "BackgroundColor3", Theme["Color Card"], 0.15)
                Tween(PencilIcon, "ImageColor3", Theme["Color Theme"], 0.15)
            end)
            TB.FocusLost:Connect(function()
                Tween(InputFrame, "BackgroundColor3", Theme["Color Panel"], 0.15)
                Tween(PencilIcon, "ImageColor3", Theme["Color Dark Text"], 0.15)
                local t = TB.Text
                if #t:gsub(" ","") > 0 then Funcs:FireCallback(cb, t) end
            end)

            local TBox = {}
            function TBox:Visible(...)  Funcs:ToggleVisible(fb, ...) end
            function TBox:Destroy()     fb:Destroy() end
            function TBox:Set(v)        if type(v)=="string" then TB.Text = v end end
            return TBox
        end

        -- ── ANTI-TOOLS OTIMIZADO VIA EVENTOS ──
        function Tab:AddAntiTools(cfg)
            local name    = cfg and (cfg[1] or cfg.Name  or cfg.Title) or "Anti Tools"
            local desc    = cfg and (cfg.Desc or cfg.Description) or "Remove ferramentas recebidas"
            local flag    = cfg and (cfg[4] or cfg.Flag)    or false
            local default = cfg and (cfg[2] or cfg.Default) or false
            local cb      = cfg and Funcs:GetCallback(cfg, 3) or { function() end }

            local tog = Tab:AddToggle({ name, default, cb[1], flag, Desc = desc })

            local conns = {}
            local function Clean()
                local bp = Player:FindFirstChildOfClass("Backpack")
                if bp then for _, t in ipairs(bp:GetChildren()) do if t:IsA("Tool") then t:Destroy() end end end
                local char = Player.Character
                if char then for _, t in ipairs(char:GetChildren()) do if t:IsA("Tool") then t:Destroy() end end end
            end

            local function StartListening()
                Clean()
                local bp = Player:FindFirstChildOfClass("Backpack")
                if bp then
                    table.insert(conns, bp.ChildAdded:Connect(function(child)
                        if child:IsA("Tool") then task.defer(function() child:Destroy() end) end
                    end))
                end
                if Player.Character then
                    table.insert(conns, Player.Character.ChildAdded:Connect(function(child)
                        if child:IsA("Tool") then task.defer(function() child:Destroy() end) end
                    end))
                end
            end

            local function StopListening()
                for _, c in ipairs(conns) do c:Disconnect() end
                table.clear(conns)
            end

            Connection.FlagsChanged:Connect(function(f, v)
                if f ~= flag then return end
                if v then
                    StartListening()
                else
                    StopListening()
                end
            end)

            Player.CharacterAdded:Connect(function()
                if GetFlag(flag) then
                    StopListening()
                    task.wait(0.5)
                    StartListening()
                end
            end)

            return tog
        end

        function Tab:AddDiscordInvite(cfg)
            local title  = cfg[1] or cfg.Name   or cfg.Title or "Discord"
            local desc   = cfg.Desc or cfg.Description or ""
            local logo   = cfg[2] or cfg.Logo   or ""
            local invite = cfg[3] or cfg.Invite or ""

            local holder = Create("Frame", Container, {
                Size             = UDim2.new(1, 0, 0, 78),
                BackgroundTransparency = 1,
                Name             = "Option",
            })

            local card = InsertTheme(Create("Frame", holder, {
                Size             = UDim2.new(1, 0, 0, 68),
                Position         = UDim2.new(0, 0, 1, 0),
                AnchorPoint      = Vector2.new(0, 1),
                BackgroundColor3 = Theme["Color Panel"],
                BorderSizePixel  = 0,
            }), "Panel")
            Make("Corner", card, UDim.new(0, 9))
            Make("Stroke", card, nil, Theme["Color Separator"], 0.7)

            local logo_img = Create("ImageLabel", card, {
                Size             = UDim2.fromOffset(34, 34),
                Position         = UDim2.fromOffset(8, 8),
                Image            = logo,
                BackgroundTransparency = 1,
            })
            Make("Corner", logo_img, UDim.new(0, 5))
            Make("Stroke", logo_img, nil, Theme["Color Stroke"], 0.8)

            InsertTheme(Create("TextLabel", card, {
                Size             = UDim2.new(1, -52, 0, 16),
                Position         = UDim2.fromOffset(48, 8),
                Text             = title,
                TextColor3       = Theme["Color Text"],
                Font             = Enum.Font.GothamBold,
                TextSize         = 11,
                TextXAlignment   = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
            }), "Text")

            InsertTheme(Create("TextLabel", card, {
                Size             = UDim2.new(1, -52, 0, 0),
                Position         = UDim2.fromOffset(48, 26),
                Text             = desc,
                TextColor3       = Theme["Color Dark Text"],
                Font             = Enum.Font.Gotham,
                TextSize         = 9,
                TextXAlignment   = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextWrapped      = true,
                AutomaticSize    = Enum.AutomaticSize.Y,
            }), "DarkText")

            Create("TextLabel", holder, {
                Size             = UDim2.new(1, 0, 0, 12),
                Position         = UDim2.new(0, 4, 0, 0),
                Text             = invite,
                TextColor3       = Color3.fromRGB(80, 160, 255),
                Font             = Enum.Font.Gotham,
                TextSize         = 9,
                TextXAlignment   = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
            })

            local joinBtn = Create("TextButton", card, {
                Size             = UDim2.new(1, -16, 0, 18),
                Position         = UDim2.new(0, 8, 1, -26),
                Text             = "Entrar no Servidor",
                Font             = Enum.Font.GothamBold,
                TextSize         = 10,
                TextColor3       = Color3.fromRGB(255,255,255),
                BackgroundColor3 = Color3.fromRGB(30, 130, 230),
                AutoButtonColor  = false,
                BorderSizePixel  = 0,
            })
            Make("Corner", joinBtn, UDim.new(0, 6))

            local delay
            joinBtn.Activated:Connect(function()
                if delay then return end
                if setclipboard then setclipboard(invite) end
                delay = true
                SetProps(joinBtn, {
                    Text             = "✓ Link Copiado!",
                    BackgroundColor3 = Color3.fromRGB(40, 160, 80),
                })
                task.wait(4)
                SetProps(joinBtn, {
                    Text             = "Entrar no Servidor",
                    BackgroundColor3 = Color3.fromRGB(30, 130, 230),
                })
                delay = false
            end)

            local DI = {}
            function DI:Visible(...)  Funcs:ToggleVisible(holder, ...) end
            function DI:Destroy()     holder:Destroy() end
            return DI
        end

        return Tab
    end

    CloseButton.Activated:Connect(function()    Window:CloseBtn()    end)
    MinimizeButton.Activated:Connect(function() Window:MinimizeBtn() end)

    task.defer(function()
        if MyLibrary.Tabs[1] then MyLibrary.Tabs[1].func:Enable() end
    end)

    return Window
end

return MyLibrary
