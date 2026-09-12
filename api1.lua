local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()

local MyLibrary = {
    Themes = {
        Main = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 8, 12)),
                ColorSequenceKeypoint.new(0.35, Color3.fromRGB(18, 8, 28)),
                ColorSequenceKeypoint.new(0.70, Color3.fromRGB(28, 5, 45)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 3, 20)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(10, 10, 16),
            ["Color Stroke"]     = Color3.fromRGB(120, 40, 220),
            ["Color Theme"]      = Color3.fromRGB(150, 60, 255),
            ["Color Text"]       = Color3.fromRGB(245, 240, 255),
            ["Color Dark Text"]  = Color3.fromRGB(140, 120, 180),
            ["Color Accent"]     = Color3.fromRGB(200, 100, 255),
            ["Color Glow"]       = Color3.fromRGB(100, 20, 180),
            ["Color Success"]    = Color3.fromRGB(80, 220, 140),
            ["Color Warning"]    = Color3.fromRGB(255, 180, 40),
            ["Color Danger"]     = Color3.fromRGB(255, 60, 80),
        },
        Crimson = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 6, 6)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(22, 6, 6)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(35, 8, 8)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 4, 4)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(10, 8, 8),
            ["Color Stroke"]     = Color3.fromRGB(200, 30, 50),
            ["Color Theme"]      = Color3.fromRGB(220, 40, 60),
            ["Color Text"]       = Color3.fromRGB(255, 240, 240),
            ["Color Dark Text"]  = Color3.fromRGB(160, 110, 110),
            ["Color Accent"]     = Color3.fromRGB(255, 80, 100),
            ["Color Glow"]       = Color3.fromRGB(180, 20, 40),
            ["Color Success"]    = Color3.fromRGB(80, 220, 140),
            ["Color Warning"]    = Color3.fromRGB(255, 180, 40),
            ["Color Danger"]     = Color3.fromRGB(255, 60, 80),
        },
        Ocean = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(4, 10, 20)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(6, 18, 35)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(8, 25, 50)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(5, 12, 25)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(6, 12, 22),
            ["Color Stroke"]     = Color3.fromRGB(30, 140, 255),
            ["Color Theme"]      = Color3.fromRGB(40, 160, 255),
            ["Color Text"]       = Color3.fromRGB(220, 240, 255),
            ["Color Dark Text"]  = Color3.fromRGB(100, 150, 200),
            ["Color Accent"]     = Color3.fromRGB(80, 200, 255),
            ["Color Glow"]       = Color3.fromRGB(20, 80, 180),
            ["Color Success"]    = Color3.fromRGB(80, 220, 140),
            ["Color Warning"]    = Color3.fromRGB(255, 180, 40),
            ["Color Danger"]     = Color3.fromRGB(255, 60, 80),
        },
        Gold = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 10, 4)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(22, 18, 6)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(30, 24, 8)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 12, 4)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(14, 12, 6),
            ["Color Stroke"]     = Color3.fromRGB(200, 160, 40),
            ["Color Theme"]      = Color3.fromRGB(220, 180, 50),
            ["Color Text"]       = Color3.fromRGB(255, 245, 210),
            ["Color Dark Text"]  = Color3.fromRGB(160, 140, 80),
            ["Color Accent"]     = Color3.fromRGB(255, 210, 80),
            ["Color Glow"]       = Color3.fromRGB(160, 120, 20),
            ["Color Success"]    = Color3.fromRGB(80, 220, 140),
            ["Color Warning"]    = Color3.fromRGB(255, 180, 40),
            ["Color Danger"]     = Color3.fromRGB(255, 60, 80),
        },
    },

    Info = { Version = "2.0.0 VIP" },
    Save = {
        UISize  = { 620, 420 },
        TabSize = 170,
        Theme   = "Main",
    },
    Settings    = {},
    Connection  = {},
    Instances   = {},
    Elements    = {},
    Options     = {},
    Flags       = {},
    Tabs        = {},
    Icons = (function()
        return {
            ["accessibility"]="rbxassetid://10709751939",["activity"]="rbxassetid://10709752035",
            ["airvent"]="rbxassetid://10709752131",["airplay"]="rbxassetid://10709752254",
            ["alarmcheck"]="rbxassetid://10709752405",["alarmclock"]="rbxassetid://10709752630",
            ["alarmclockoff"]="rbxassetid://10709752508",["alarmminus"]="rbxassetid://10709752732",
            ["alarmplus"]="rbxassetid://10709752825",["album"]="rbxassetid://10709752906",
            ["alertcircle"]="rbxassetid://10709752996",["alertoctagon"]="rbxassetid://10709753064",
            ["alerttriangle"]="rbxassetid://10709753149",["anchor"]="rbxassetid://10709761530",
            ["arrowdown"]="rbxassetid://10709767827",["arrowleft"]="rbxassetid://10709768114",
            ["arrowright"]="rbxassetid://10709768347",["arrowup"]="rbxassetid://10709768939",
            ["award"]="rbxassetid://10709769406",["bell"]="rbxassetid://10709775704",
            ["bellring"]="rbxassetid://10709775560",["bot"]="rbxassetid://10709782230",
            ["calendar"]="rbxassetid://10709789505",["camera"]="rbxassetid://10709789686",
            ["check"]="rbxassetid://10709790644",["checkcircle"]="rbxassetid://10709790387",
            ["chevrondown"]="rbxassetid://10709790948",["chevronleft"]="rbxassetid://10709791281",
            ["chevronright"]="rbxassetid://10709791437",["chevronup"]="rbxassetid://10709791523",
            ["clock"]="rbxassetid://10709805144",["code"]="rbxassetid://10709810463",
            ["cog"]="rbxassetid://10709810948",["coins"]="rbxassetid://10709811110",
            ["crown"]="rbxassetid://10709818626",["database"]="rbxassetid://10709818996",
            ["diamond"]="rbxassetid://10709819149",["download"]="rbxassetid://10723344270",
            ["edit"]="rbxassetid://10734883598",["eye"]="rbxassetid://10723346959",
            ["eyeoff"]="rbxassetid://10723346871",["file"]="rbxassetid://10723374641",
            ["flag"]="rbxassetid://10723375890",["flame"]="rbxassetid://10723376114",
            ["folder"]="rbxassetid://10723387563",["gem"]="rbxassetid://10723396000",
            ["ghost"]="rbxassetid://10723396107",["gift"]="rbxassetid://10723396402",
            ["globe"]="rbxassetid://10723404337",["heart"]="rbxassetid://10723406885",
            ["home"]="rbxassetid://10723407389",["info"]="rbxassetid://10723415903",
            ["key"]="rbxassetid://10723416652",["layers"]="rbxassetid://10723424505",
            ["lightbulb"]="rbxassetid://10723425852",["lock"]="rbxassetid://10723434711",
            ["mail"]="rbxassetid://10734885430",["map"]="rbxassetid://10734886202",
            ["medal"]="rbxassetid://10734887072",["mic"]="rbxassetid://10734888864",
            ["minus"]="rbxassetid://10734896206",["moon"]="rbxassetid://10734897102",
            ["music"]="rbxassetid://10734905958",["package"]="rbxassetid://10734909540",
            ["pencil"]="rbxassetid://10734919691",["phone"]="rbxassetid://10734921524",
            ["plus"]="rbxassetid://10734924532",["power"]="rbxassetid://10734930466",
            ["rocket"]="rbxassetid://10734934585",["save"]="rbxassetid://10734941499",
            ["search"]="rbxassetid://10734943674",["settings"]="rbxassetid://10734950309",
            ["shield"]="rbxassetid://10734951847",["shieldcheck"]="rbxassetid://10734951367",
            ["star"]="rbxassetid://10734966248",["sun"]="rbxassetid://10734974297",
            ["sword"]="rbxassetid://10734975486",["swords"]="rbxassetid://10734975692",
            ["target"]="rbxassetid://10734977012",["terminal"]="rbxassetid://10734982144",
            ["trash"]="rbxassetid://10747362393",["trophy"]="rbxassetid://10747363809",
            ["unlock"]="rbxassetid://10747366027",["upload"]="rbxassetid://10747366434",
            ["user"]="rbxassetid://10747373176",["users"]="rbxassetid://10747373426",
            ["verified"]="rbxassetid://10747374131",["video"]="rbxassetid://10747374938",
            ["volume"]="rbxassetid://10747376008",["wallet"]="rbxassetid://10747376205",
            ["wifi"]="rbxassetid://10747382504",["x"]="rbxassetid://10747384394",
            ["xcircle"]="rbxassetid://10747383819",["zoomin"]="rbxassetid://10747384552",
            ["zoomout"]="rbxassetid://10747384679",
        }
    end)(),
}

-- ═══════════════════════════════════════════════
--              CORE SETUP
-- ═══════════════════════════════════════════════
local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale      = ViewportSize.Y / 450
local Settings     = MyLibrary.Settings
local Flags        = MyLibrary.Flags

local SetProps, SetChildren, InsertTheme, Create do
    InsertTheme = function(inst, Type)
        table.insert(MyLibrary.Instances, { Instance = inst, Type = Type })
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
            for prop, value in pairs(props) do inst[prop] = value end
        end
        return inst
    end
    Create = function(...)
        local args = { ... }
        if type(args) ~= "table" then return end
        local new = Instance.new(args[1])
        local Children = {}
        if type(args[2]) == "table" then
            SetProps(new, args[2])
            SetChildren(new, args[3])
            Children = args[3] or {}
        elseif typeof(args[2]) == "Instance" then
            new.Parent = args[2]
            SetProps(new, args[3])
            SetChildren(new, args[4])
            Children = args[4] or {}
        end
        return new
    end

    local function Save(file)
        if readfile and isfile and isfile(file) then
            local ok, decode = pcall(function()
                return HttpService:JSONDecode(readfile(file))
            end)
            if ok and type(decode) == "table" then
                if decode.UISize  then MyLibrary.Save.UISize  = decode.UISize  end
                if decode.TabSize then MyLibrary.Save.TabSize = decode.TabSize end
                if decode.Theme   then MyLibrary.Save.Theme   = decode.Theme   end
            end
        end
    end
    pcall(Save, "redz_vip_library.json")
end

-- ═══════════════════════════════════════════════
--              UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════
local Funcs = {}
function Funcs:InsertCallback(tab, func)
    if type(func) == "function" then table.insert(tab, func) end
    return func
end
function Funcs:FireCallback(tab, ...)
    for _, v in ipairs(tab) do
        if type(v) == "function" then task.spawn(v, ...) end
    end
end
function Funcs:ToggleVisible(Obj, Bool)
    Obj.Visible = Bool ~= nil and Bool or not Obj.Visible
end
function Funcs:GetCallback(Configs, index)
    local func = Configs[index] or Configs.Callback or function() end
    if type(func) == "table" then
        return { function(Value) func[1][func[2]] = Value end }
    end
    return { func }
end
function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
    local Connected = { Function = func, Connected = true }
    function Connected:Disconnect()
        if self.Connected then
            local idx = table.find(ConnectedFuncs, self.Function)
            if idx then table.remove(ConnectedFuncs, idx) end
            self.Connected = false
        end
    end
    function Connected:Fire(...)
        if self.Connected then task.spawn(self.Function, ...) end
    end
    return Connected
end

-- ═══════════════════════════════════════════════
--              CONNECTION SYSTEM
-- ═══════════════════════════════════════════════
local Connections, Connection = {}, MyLibrary.Connection
do
    local function NewConnectionList(List)
        for _, CoName in ipairs(List) do
            local ConnectedFuncs, Connect = {}, {}
            Connection[CoName]  = Connect
            Connections[CoName] = ConnectedFuncs
            Connect.Name = CoName
            function Connect:Connect(func)
                if type(func) == "function" then
                    table.insert(ConnectedFuncs, func)
                    return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
                end
            end
            function Connect:Once(func)
                if type(func) == "function" then
                    local Connected
                    local _NFunc; _NFunc = function(...)
                        task.spawn(func, ...)
                        Connected:Disconnect()
                    end
                    Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
                    return Connected
                end
            end
        end
    end
    function Connection:FireConnection(CoName, ...)
        local conn = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
        if conn then
            for _, Func in pairs(conn) do task.spawn(Func, ...) end
        end
    end
    NewConnectionList({ "FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded" })
end

-- ═══════════════════════════════════════════════
--              FLAG SYSTEM
-- ═══════════════════════════════════════════════
local GetFlag, SetFlag, CheckFlag
do
    CheckFlag = function(Name) return type(Name) == "string" and Flags[Name] ~= nil end
    GetFlag   = function(Name) return type(Name) == "string" and Flags[Name] end
    SetFlag   = function(Flag, Value)
        if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
            Flags[Flag] = Value
            Connection:FireConnection("FlagsChanged", Flag, Value)
        end
    end

    local db
    Connection.FlagsChanged:Connect(function(Flag, Value)
        local ScriptFile = Settings.ScriptFile
        if not db and ScriptFile and writefile then
            db = true; task.wait(0.1); db = false
            local ok, Encoded = pcall(function() return HttpService:JSONEncode(Flags) end)
            if ok then
                local s = pcall(writefile, ScriptFile, Encoded)
                if s then Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded) end
            end
        end
    end)
end

-- ═══════════════════════════════════════════════
--              SCREEN GUI
-- ═══════════════════════════════════════════════
local ScreenGui = Create("ScreenGui", CoreGui, {
    Name            = "VIP_Library_V2",
    ResetOnSpawn    = false,
    ZIndexBehavior  = Enum.ZIndexBehavior.Sibling,
}, {
    Create("UIScale", { Scale = UIScale, Name = "Scale" }),
})

do
    local existing = CoreGui:FindFirstChild(ScreenGui.Name)
    if existing and existing ~= ScreenGui then existing:Destroy() end
end

-- ═══════════════════════════════════════════════
--              HELPER FUNCTIONS
-- ═══════════════════════════════════════════════
local function GetStr(val)
    return type(val) == "function" and val() or val
end

local function ConnectSave(inst, func)
    inst.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then
            while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                task.wait()
            end
        end
        func()
    end)
end

local function CreateTween(Configs)
    local Inst      = Configs[1] or Configs.Instance
    local Prop      = Configs[2] or Configs.Prop
    local NewVal    = Configs[3] or Configs.NewVal
    local Time      = Configs[4] or Configs.Time or 0.5
    local TweenWait = Configs[5] or Configs.wait or false
    local Info      = TweenInfo.new(Time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local Tween     = TweenService:Create(Inst, Info, { [Prop] = NewVal })
    Tween:Play()
    if TweenWait then Tween.Completed:Wait() end
    return Tween
end

local function MakeDrag(inst)
    task.spawn(function()
        SetProps(inst, { Active = true, AutoButtonColor = false })
        local DragStart, StartPos, InputOn
        local function Update(Input)
            local delta    = Input.Position - DragStart
            local Position = UDim2.new(
                StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale,
                StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale
            )
            CreateTween({ inst, "Position", Position, 0.25 })
        end
        inst.MouseButton1Down:Connect(function() InputOn = true end)
        inst.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then
                StartPos = inst.Position
                DragStart = Input.Position
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    RunService.Heartbeat:Wait()
                    if InputOn then Update(Input) end
                end
                InputOn = false
            end
        end)
    end)
    return inst
end

local function VerifyTheme(Theme)
    for name in pairs(MyLibrary.Themes) do
        if name == Theme then return true end
    end
end

local function SaveJson(FileName, save)
    if writefile then
        local ok, json = pcall(function() return HttpService:JSONEncode(save) end)
        if ok then writefile(FileName, json) end
    end
end

local Theme = MyLibrary.Themes[MyLibrary.Save.Theme]

local function GetColor(inst)
    if inst:IsA("Frame")          then return "BackgroundColor3"
    elseif inst:IsA("ImageLabel") then return "ImageColor3"
    elseif inst:IsA("TextLabel")  then return "TextColor3"
    elseif inst:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
    elseif inst:IsA("UIStroke")   then return "Color"
    end
    return ""
end

-- ═══════════════════════════════════════════════
--              ELEMENT FACTORY
-- ═══════════════════════════════════════════════
local AddEle, Make
do
    local Elements = MyLibrary.Elements
    AddEle = function(Name, Func) Elements[Name] = Func end
    Make   = function(Ele, inst, props, ...)
        return Elements[Ele](inst, props, ...)
    end
end

AddEle("Corner", function(parent, CornerRadius)
    return Create("UICorner", parent, {
        CornerRadius = CornerRadius or UDim.new(0, 8),
    })
end)

AddEle("Stroke", function(parent, props, ...)
    local args = { ... }
    return InsertTheme(SetProps(Create("UIStroke", parent, {
        Color           = args[1] or Theme["Color Stroke"],
        Thickness       = args[2] or 1.2,
        ApplyStrokeMode = "Border",
        Transparency    = 0.3,
    }), props), "Stroke")
end)

AddEle("Button", function(parent, props, ...)
    local args = { ... }
    local New = InsertTheme(SetProps(Create("TextButton", parent, {
        Text                = "",
        Size                = UDim2.fromScale(1, 1),
        BackgroundColor3    = Theme["Color Hub 2"],
        AutoButtonColor     = false,
        BorderSizePixel     = 0,
    }), props), "Frame")

    -- Hover glow effect
    New.MouseEnter:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0.3, 0.2 })
    end)
    New.MouseLeave:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0, 0.2 })
    end)
    -- Press effect
    New.MouseButton1Down:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0.55, 0.1 })
    end)
    New.MouseButton1Up:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0.3, 0.15 })
    end)

    if args[1] then New.Activated:Connect(args[1]) end
    return New
end)

AddEle("Gradient", function(parent, props, ...)
    return InsertTheme(SetProps(Create("UIGradient", parent, {
        Color = Theme["Color Hub 1"],
    }), props), "Gradient")
end)

-- ═══════════════════════════════════════════════
--              NOTIFICATION SYSTEM (NEW)
-- ═══════════════════════════════════════════════
local NotifHolder = Create("Frame", ScreenGui, {
    Size                = UDim2.new(0, 300, 1, 0),
    Position            = UDim2.new(1, -310, 0, 0),
    BackgroundTransparency = 1,
    Name                = "NotifHolder",
}, {
    Create("UIListLayout", {
        SortOrder           = Enum.SortOrder.LayoutOrder,
        VerticalAlignment   = Enum.VerticalAlignment.Bottom,
        Padding             = UDim.new(0, 6),
    }),
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 12),
        PaddingRight  = UDim.new(0, 10),
    }),
})

local function SendNotification(Configs)
    local NTitle   = Configs.Title   or "Notification"
    local NDesc    = Configs.Text    or Configs.Desc or ""
    local NDur     = Configs.Duration or 4
    local NType    = Configs.Type    or "info"

    local typeColors = {
        info    = Theme["Color Theme"],
        success = Theme["Color Success"] or Color3.fromRGB(80,220,140),
        warning = Theme["Color Warning"] or Color3.fromRGB(255,180,40),
        danger  = Theme["Color Danger"]  or Color3.fromRGB(255,60,80),
    }
    local accentColor = typeColors[NType] or Theme["Color Theme"]

    local typeIcons = {
        info    = "rbxassetid://10723415903",
        success = "rbxassetid://10709790387",
        warning = "rbxassetid://10709753149",
        danger  = "rbxassetid://10747383819",
    }
    local icon = typeIcons[NType] or typeIcons.info

    local Card = Create("Frame", NotifHolder, {
        Size                = UDim2.new(1, 0, 0, 0),
        BackgroundColor3    = Color3.fromRGB(12, 10, 20),
        ClipsDescendants    = true,
        AutomaticSize       = Enum.AutomaticSize.None,
    })
    Make("Corner", Card, UDim.new(0, 10))

    -- Left accent bar
    local AccentBar = Create("Frame", Card, {
        Size             = UDim2.new(0, 3, 1, -16),
        Position         = UDim2.new(0, 8, 0, 8),
        BackgroundColor3 = accentColor,
    })
    Make("Corner", AccentBar, UDim.new(0.5, 0))

    -- Icon
    Create("ImageLabel", Card, {
        Size                = UDim2.new(0, 18, 0, 18),
        Position            = UDim2.new(0, 20, 0, 10),
        Image               = icon,
        ImageColor3         = accentColor,
        BackgroundTransparency = 1,
    })

    -- Title
    Create("TextLabel", Card, {
        Size                = UDim2.new(1, -45, 0, 20),
        Position            = UDim2.new(0, 44, 0, 6),
        Text                = NTitle,
        TextColor3          = Theme["Color Text"],
        Font                = Enum.Font.GothamBold,
        TextSize            = 11,
        TextXAlignment      = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
    })

    -- Desc
    Create("TextLabel", Card, {
        Size                = UDim2.new(1, -48, 0, 0),
        Position            = UDim2.new(0, 44, 0, 26),
        AutomaticSize       = Enum.AutomaticSize.Y,
        Text                = NDesc,
        TextColor3          = Theme["Color Dark Text"],
        Font                = Enum.Font.Gotham,
        TextSize            = 9,
        TextXAlignment      = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextWrapped         = true,
    })

    -- Progress bar
    local ProgressBG = Create("Frame", Card, {
        Size             = UDim2.new(1, -16, 0, 2),
        Position         = UDim2.new(0, 8, 1, -8),
        BackgroundColor3 = Color3.fromRGB(30, 25, 45),
        AnchorPoint      = Vector2.new(0, 1),
    })
    Make("Corner", ProgressBG, UDim.new(0.5, 0))

    local ProgressBar = Create("Frame", ProgressBG, {
        Size             = UDim2.fromScale(1, 1),
        BackgroundColor3 = accentColor,
    })
    Make("Corner", ProgressBar, UDim.new(0.5, 0))

    -- Stroke
    local Stroke = Create("UIStroke", Card, {
        Color           = accentColor,
        Thickness       = 1,
        Transparency    = 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })

    -- Animate in
    CreateTween({ Card, "Size", UDim2.new(1, 0, 0, 70), 0.35 })
    CreateTween({ Stroke, "Transparency", 0.3, 0.4 })

    -- Progress drain
    TweenService:Create(ProgressBar, TweenInfo.new(NDur, Enum.EasingStyle.Linear), {
        Size = UDim2.fromScale(0, 1),
    }):Play()

    -- Animate out
    task.delay(NDur, function()
        CreateTween({ Card, "Size", UDim2.new(1, 0, 0, 0), 0.3, true })
        Card:Destroy()
    end)

    return Card
end

MyLibrary.Notify = SendNotification

-- ═══════════════════════════════════════════════
--              BUTTON FRAME BUILDER
-- ═══════════════════════════════════════════════
local function ButtonFrame(Container, Title, Description, HolderSize)
    local TitleL = InsertTheme(Create("TextLabel", {
        Font                = Enum.Font.GothamBold,
        TextColor3          = Theme["Color Text"],
        Size                = UDim2.new(1, -20),
        AutomaticSize       = Enum.AutomaticSize.Y,
        Position            = UDim2.new(0, 0, 0.5),
        AnchorPoint         = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextTruncate        = Enum.TextTruncate.AtEnd,
        TextSize            = 11,
        TextXAlignment      = Enum.TextXAlignment.Left,
        Text                = "",
        RichText            = true,
    }), "Text")

    local DescL = InsertTheme(Create("TextLabel", {
        Font                = Enum.Font.Gotham,
        TextColor3          = Theme["Color Dark Text"],
        Size                = UDim2.new(1, -20),
        AutomaticSize       = Enum.AutomaticSize.Y,
        Position            = UDim2.new(0, 12, 0, 15),
        BackgroundTransparency = 1,
        TextWrapped         = true,
        TextSize            = 9,
        TextXAlignment      = Enum.TextXAlignment.Left,
        Text                = "",
        RichText            = true,
    }), "DarkText")

    local Frame = Make("Button", Container, {
        Size         = UDim2.new(1, 0, 0, 28),
        AutomaticSize= Enum.AutomaticSize.Y,
        Name         = "Option",
        BorderSizePixel = 0,
    })
    Make("Corner", Frame, UDim.new(0, 8))

    -- Subtle inner glow stroke
    local FrameStroke = Create("UIStroke", Frame, {
        Color           = Theme["Color Stroke"],
        Thickness       = 0.8,
        Transparency    = 0.7,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
    Frame.MouseEnter:Connect(function()
        CreateTween({ FrameStroke, "Transparency", 0.3, 0.2 })
    end)
    Frame.MouseLeave:Connect(function()
        CreateTween({ FrameStroke, "Transparency", 0.7, 0.2 })
    end)

    local LabelHolder = Create("Frame", Frame, {
        AutomaticSize       = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size                = HolderSize,
        Position            = UDim2.new(0, 10, 0),
        AnchorPoint         = Vector2.new(0, 0),
    }, {
        Create("UIListLayout", {
            SortOrder           = Enum.SortOrder.LayoutOrder,
            VerticalAlignment   = Enum.VerticalAlignment.Center,
            Padding             = UDim.new(0, 2),
        }),
        Create("UIPadding", {
            PaddingBottom = UDim.new(0, 6),
            PaddingTop    = UDim.new(0, 6),
        }),
        TitleL,
        DescL,
    })

    local Label = {}
    function Label:SetTitle(NewTitle)
        if type(NewTitle) == "string" and #NewTitle:gsub(" ", "") > 0 then
            TitleL.Text = NewTitle
        end
    end
    function Label:SetDesc(NewDesc)
        if type(NewDesc) == "string" and #NewDesc:gsub(" ", "") > 0 then
            DescL.Visible = true
            DescL.Text    = NewDesc
            LabelHolder.Position   = UDim2.new(0, 10, 0)
            LabelHolder.AnchorPoint = Vector2.new(0, 0)
        else
            DescL.Visible = false
            DescL.Text    = ""
            LabelHolder.Position   = UDim2.new(0, 10, 0.5)
            LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
        end
    end
    Label:SetTitle(Title)
    Label:SetDesc(Description)
    return Frame, Label
end

-- ═══════════════════════════════════════════════
--              LIBRARY METHODS
-- ═══════════════════════════════════════════════
function MyLibrary:GetIcon(index)
    if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
        return index
    end
    local firstMatch = nil
    index = string.lower(index):gsub("lucide", ""):gsub("-", "")
    for Name, Icon in pairs(self.Icons) do
        Name = Name:gsub("lucide", ""):gsub("-", "")
        if Name == index then return Icon end
        if not firstMatch and Name:find(index, 1, true) then
            firstMatch = Icon
        end
    end
    return firstMatch or index
end

function MyLibrary:SetTheme(NewTheme)
    if not VerifyTheme(NewTheme) then return end
    MyLibrary.Save.Theme = NewTheme
    SaveJson("redz_vip_library.json", MyLibrary.Save)
    Theme = MyLibrary.Themes[NewTheme]
    Connection:FireConnection("ThemeChanged", NewTheme)
    for _, Val in ipairs(MyLibrary.Instances) do
        local ok = pcall(function()
            if Val.Type == "Gradient" then
                Val.Instance.Color = Theme["Color Hub 1"]
            elseif Val.Type == "Frame" then
                Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
            elseif Val.Type == "Stroke" then
                Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
            elseif Val.Type == "Theme" then
                Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
            elseif Val.Type == "Text" then
                Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
            elseif Val.Type == "DarkText" then
                Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
            elseif Val.Type == "ScrollBar" then
                Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
            end
        end)
    end
end

function MyLibrary:SetScale(NewScale)
    NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
    UIScale  = NewScale
    ScreenGui.Scale.Scale = NewScale
end

-- ═══════════════════════════════════════════════
--              MAKE WINDOW
-- ═══════════════════════════════════════════════
function MyLibrary:MakeWindow(Configs)
    local WTitle    = Configs[1] or Configs.Name    or Configs.Title    or "VIP Panel"
    local WMiniText = Configs[2] or Configs.SubTitle or "Premium Edition"
    local WIcon     = Configs.Icon or ""
    Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false

    -- Load saved flags
    local function LoadFile()
        local File = Settings.ScriptFile
        if type(File) ~= "string" then return end
        if not readfile or not isfile then return end
        local ok, r = pcall(isfile, File)
        if ok and r then
            local ok2, _Flags = pcall(readfile, File)
            if ok2 and type(_Flags) == "string" then
                local ok3, decoded = pcall(function()
                    return HttpService:JSONDecode(_Flags)
                end)
                Flags = ok3 and decoded or {}
            end
        end
    end
    LoadFile()

    local UISizeX, UISizeY = unpack(MyLibrary.Save.UISize)

    -- ────────────────────────────────────────────
    --  MAIN FRAME
    -- ────────────────────────────────────────────
    local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
        Size                = UDim2.fromOffset(UISizeX, UISizeY),
        Position            = UDim2.new(0.5, -UISizeX / 2, 0.5, -UISizeY / 2),
        BackgroundTransparency = 0.04,
        BackgroundColor3    = Color3.fromRGB(8, 6, 14),
        AutoButtonColor     = false,
        Name                = "VIPHub",
        ClipsDescendants    = false,
    }), "Main")

    Make("Gradient", MainFrame, { Rotation = 135 })
    Make("Corner", MainFrame, UDim.new(0, 14))
    MakeDrag(MainFrame)

    -- Outer glow stroke
    local OuterStroke = Create("UIStroke", MainFrame, {
        Color           = Theme["Color Stroke"],
        Thickness       = 1.5,
        Transparency    = 0.2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })

    -- Subtle outer shadow frame
    local ShadowFrame = Create("Frame", ScreenGui, {
        Size             = UDim2.new(0, UISizeX + 30, 0, UISizeY + 30),
        Position         = UDim2.new(0.5, -(UISizeX + 30) / 2, 0.5, -(UISizeY + 30) / 2),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.55,
        BorderSizePixel  = 0,
        ZIndex           = MainFrame.ZIndex - 1,
        Name             = "Shadow",
    })
    Make("Corner", ShadowFrame, UDim.new(0, 18))

    -- Animate MainFrame entrance
    MainFrame.Size = UDim2.fromOffset(UISizeX * 0.85, UISizeY * 0.85)
    MainFrame.BackgroundTransparency = 1
    CreateTween({ MainFrame, "Size", UDim2.fromOffset(UISizeX, UISizeY), 0.45 })
    CreateTween({ MainFrame, "BackgroundTransparency", 0.04, 0.45 })

    local Components   = Create("Folder", MainFrame, { Name = "Components" })
    local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })

    -- ────────────────────────────────────────────
    --  TOP BAR (enhanced)
    -- ────────────────────────────────────────────
    local TopBar = Create("Frame", Components, {
        Size                = UDim2.new(1, 0, 0, 34),
        BackgroundColor3    = Color3.fromRGB(6, 4, 12),
        BackgroundTransparency = 0.1,
        Name                = "Top Bar",
        ZIndex              = 5,
    })
    Make("Corner", MainFrame, UDim.new(0, 14))

    -- Top bar bottom separator line
    local Separator = Create("Frame", TopBar, {
        Size             = UDim2.new(1, -20, 0, 1),
        Position         = UDim2.new(0, 10, 1, 0),
        AnchorPoint      = Vector2.new(0, 1),
        BackgroundColor3 = Theme["Color Stroke"],
        BackgroundTransparency = 0.6,
        BorderSizePixel  = 0,
    })

    -- Window icon (optional)
    local WIconImg = Create("ImageLabel", TopBar, {
        Size                = UDim2.new(0, 16, 0, 16),
        Position            = UDim2.new(0, 12, 0.5),
        AnchorPoint         = Vector2.new(0, 0.5),
        Image               = MyLibrary:GetIcon(WIcon) or "",
        ImageColor3         = Theme["Color Theme"],
        BackgroundTransparency = 1,
        Visible             = WIcon ~= "" and WIcon ~= nil,
    })

    local TitleOffset = (WIcon ~= "" and WIcon ~= nil) and 35 or 14

    local Title = InsertTheme(Create("TextLabel", TopBar, {
        Position            = UDim2.new(0, TitleOffset, 0.5),
        AnchorPoint         = Vector2.new(0, 0.5),
        AutomaticSize       = Enum.AutomaticSize.X,
        Text                = WTitle,
        TextXAlignment      = Enum.TextXAlignment.Left,
        TextSize            = 13,
        TextColor3          = Theme["Color Text"],
        BackgroundTransparency = 1,
        Font                = Enum.Font.GothamBold,
        Name                = "Title",
        ZIndex              = 6,
    }, {
        InsertTheme(Create("TextLabel", {
            Size                = UDim2.fromScale(0, 1),
            AutomaticSize       = Enum.AutomaticSize.X,
            AnchorPoint         = Vector2.new(0, 1),
            Position            = UDim2.new(1, 6, 0.95),
            Text                = WMiniText,
            TextColor3          = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            TextXAlignment      = Enum.TextXAlignment.Left,
            TextYAlignment      = Enum.TextYAlignment.Bottom,
            TextSize            = 8,
            Font                = Enum.Font.Gotham,
            Name                = "SubTitle",
            ZIndex              = 6,
        }), "DarkText"),
    }), "Text")

    -- Live clock in topbar
    local ClockLabel = Create("TextLabel", TopBar, {
        Size                = UDim2.new(0, 80, 1, 0),
        Position            = UDim2.new(0.5, -40, 0),
        BackgroundTransparency = 1,
        TextColor3          = Theme["Color Dark Text"],
        Font                = Enum.Font.GothamBold,
        TextSize            = 9,
        Text                = "",
        ZIndex              = 6,
    })
    task.spawn(function()
        while ClockLabel and ClockLabel.Parent do
            local t    = os.date("*t")
            ClockLabel.Text = ("%02d:%02d:%02d"):format(t.hour, t.min, t.sec)
            task.wait(1)
        end
    end)

    -- ────────────────────────────────────────────
    --  TAB SCROLL (left sidebar enhanced)
    -- ────────────────────────────────────────────
    local TabScrollBG = Create("Frame", Components, {
        Size                = UDim2.new(0, MyLibrary.Save.TabSize, 1, -TopBar.Size.Y.Offset),
        Position            = UDim2.new(0, 0, 1, 0),
        AnchorPoint         = Vector2.new(0, 1),
        BackgroundColor3    = Color3.fromRGB(5, 4, 10),
        BackgroundTransparency = 0.15,
        Name                = "TabScrollBG",
        ClipsDescendants    = true,
    })
    Make("Corner", TabScrollBG, UDim.new(0, 10))

    -- Vertical right separator
    local VLine = Create("Frame", TabScrollBG, {
        Size             = UDim2.new(0, 1, 1, -20),
        Position         = UDim2.new(1, 0, 0.5),
        AnchorPoint      = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Stroke"],
        BackgroundTransparency = 0.55,
        BorderSizePixel  = 0,
    })

    local MainScroll = InsertTheme(Create("ScrollingFrame", TabScrollBG, {
        Size                    = UDim2.new(1, 0, 1, 0),
        ScrollBarImageColor3    = Theme["Color Theme"],
        BackgroundTransparency  = 1,
        ScrollBarThickness      = 2,
        ScrollBarImageTransparency = 0.3,
        CanvasSize              = UDim2.new(),
        AutomaticCanvasSize     = Enum.AutomaticSize.Y,
        ScrollingDirection      = Enum.ScrollingDirection.Y,
        BorderSizePixel         = 0,
        Name                    = "Tab Scroll",
    }, {
        Create("UIPadding", {
            PaddingLeft   = UDim.new(0, 8),
            PaddingRight  = UDim.new(0, 8),
            PaddingTop    = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
        }),
        Create("UIListLayout", { Padding = UDim.new(0, 4) }),
    }), "ScrollBar")

    local Containers = Create("Frame", Components, {
        Size                = UDim2.new(1, -TabScrollBG.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
        AnchorPoint         = Vector2.new(1, 1),
        Position            = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants    = true,
        Name                = "Containers",
    })

    -- ────────────────────────────────────────────
    --  RESIZE CONTROLS
    -- ────────────────────────────────────────────
    local ControlSize1 = MakeDrag(Create("ImageButton", MainFrame, {
        Size                = UDim2.new(0, 30, 0, 30),
        Position            = MainFrame.Size,
        Active              = true,
        AnchorPoint         = Vector2.new(0.8, 0.8),
        BackgroundTransparency = 1,
        Name                = "Control Hub Size",
    }))
    local ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
        Size                = UDim2.new(0, 16, 1, -30),
        Position            = UDim2.new(0, TabScrollBG.Size.X.Offset, 1, 0),
        AnchorPoint         = Vector2.new(0.5, 1),
        Active              = true,
        BackgroundTransparency = 1,
        Name                = "Control Tab Size",
    }))

    local function ControlSize()
        local Pos1 = ControlSize1.Position
        local Pos2 = ControlSize2.Position
        ControlSize1.Position = UDim2.fromOffset(
            math.clamp(Pos1.X.Offset, 480, 1200),
            math.clamp(Pos1.Y.Offset, 260, 700)
        )
        ControlSize2.Position = UDim2.new(
            0, math.clamp(Pos2.X.Offset, 130, 280), 1, 0
        )
        TabScrollBG.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
        Containers.Size  = UDim2.new(1, -TabScrollBG.Size.X.Offset, 1, -TopBar.Size.Y.Offset)
        MainFrame.Size   = ControlSize1.Position
        ShadowFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset + 30, 0, MainFrame.Size.Y.Offset + 30)
        ShadowFrame.Position = UDim2.new(
            0.5, -(MainFrame.Size.X.Offset + 30) / 2,
            0.5, -(MainFrame.Size.Y.Offset + 30) / 2
        )
    end

    ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)

    ConnectSave(ControlSize1, function()
        if not _Minimized then
            MyLibrary.Save.UISize = { MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset }
            SaveJson("redz_vip_library.json", MyLibrary.Save)
        end
    end)
    ConnectSave(ControlSize2, function()
        MyLibrary.Save.TabSize = TabScrollBG.Size.X.Offset
        SaveJson("redz_vip_library.json", MyLibrary.Save)
    end)

    -- ────────────────────────────────────────────
    --  TOP BAR BUTTONS (enhanced)
    -- ────────────────────────────────────────────
    local ButtonsFolder = Create("Folder", TopBar, { Name = "Buttons" })

    local function MakeTopBtn(icon, posX, color, name)
        local btn = Create("ImageButton", ButtonsFolder, {
            Size                = UDim2.new(0, 16, 0, 16),
            Position            = UDim2.new(1, posX, 0.5),
            AnchorPoint         = Vector2.new(1, 0.5),
            BackgroundTransparency = 1,
            Image               = icon,
            ImageColor3         = color or Theme["Color Dark Text"],
            AutoButtonColor     = false,
            Name                = name,
            ZIndex              = 7,
        })
        btn.MouseEnter:Connect(function()
            CreateTween({ btn, "ImageColor3", color or Theme["Color Text"], 0.2 })
            CreateTween({ btn, "Size", UDim2.new(0, 18, 0, 18), 0.15 })
        end)
        btn.MouseLeave:Connect(function()
            CreateTween({ btn, "ImageColor3", color or Theme["Color Dark Text"], 0.2 })
            CreateTween({ btn, "Size", UDim2.new(0, 16, 0, 16), 0.15 })
        end)
        return btn
    end

    local CloseButton    = MakeTopBtn("rbxassetid://10747384394", -10,  Color3.fromRGB(255, 70, 70),   "Close")
    local MinimizeButton = MakeTopBtn("rbxassetid://10734896206", -35,  Color3.fromRGB(255, 200, 50),  "Minimize")
    local PinButton      = MakeTopBtn("rbxassetid://10734922324", -60,  Color3.fromRGB(80, 200, 255),  "Pin")

    local _Minimized, SaveSize, WaitClick
    local Window, FirstTab = {}, false

    -- ────────────────────────────────────────────
    --  WINDOW METHODS
    -- ────────────────────────────────────────────
    function Window:CloseBtn()
        Window:Dialog({
            Title = "⚠️  Close Panel",
            Text  = "Are you sure you want to close the panel?",
            Options = {
                { "Confirm ✔", function() ScreenGui:Destroy() end },
                { "Cancel" },
            },
        })
    end

    function Window:MinimizeBtn()
        if WaitClick then return end
        WaitClick = true
        if _Minimized then
            CreateTween({ MainFrame, "Size", SaveSize, 0.3, true })
            ControlSize1.Visible = true
            ControlSize2.Visible = true
            _Minimized = false
        else
            SaveSize = MainFrame.Size
            ControlSize1.Visible = false
            ControlSize2.Visible = false
            CreateTween({ MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 34), 0.3, true })
            _Minimized = true
        end
        WaitClick = false
    end

    function Window:Minimize()
        MainFrame.Visible = not MainFrame.Visible
        ShadowFrame.Visible = MainFrame.Visible
    end

    function Window:Set(Val1, Val2)
        if type(Val1) == "string" and type(Val2) == "string" then
            Title.Text = Val1
            Title.SubTitle.Text = Val2
        elseif type(Val1) == "string" then
            Title.Text = Val1
        end
    end

    function Window:Notify(Configs)
        return SendNotification(Configs)
    end

    function Window:Dialog(Configs)
        if MainFrame:FindFirstChild("Dialog") then return end
        if _Minimized then Window:MinimizeBtn() end

        local DTitle   = Configs[1] or Configs.Title   or "Dialog"
        local DText    = Configs[2] or Configs.Text    or "This is a Dialog"
        local DOptions = Configs[3] or Configs.Options or {}

        local Screen = InsertTheme(Create("Frame", MainFrame, {
            BackgroundTransparency = 0.4,
            Active                 = true,
            BackgroundColor3       = Color3.fromRGB(0, 0, 0),
            Size                   = UDim2.fromScale(1, 1),
            Name                   = "Dialog",
            ZIndex                 = 20,
        }), "Stroke")
        Make("Corner", MainFrame, UDim.new(0, 14))

        local Frame = Create("Frame", Screen, {
            Active       = true,
            Size         = UDim2.fromOffset(270 * 1.1, 160 * 1.1),
            Position     = UDim2.fromScale(0.5, 0.5),
            AnchorPoint  = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(10, 8, 18),
            ZIndex       = 21,
        })
        Make("Gradient", Frame, { Rotation = 270 })
        Make("Corner", Frame, UDim.new(0, 12))

        local DialogStroke = Create("UIStroke", Frame, {
            Color           = Theme["Color Stroke"],
            Thickness       = 1.2,
            Transparency    = 0.2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })

        -- Accent top bar
        local AccentLine = Create("Frame", Frame, {
            Size             = UDim2.new(1, 0, 0, 2),
            BackgroundColor3 = Theme["Color Theme"],
            BorderSizePixel  = 0,
            ZIndex           = 22,
        })
        Make("Corner", AccentLine, UDim.new(0, 12))

        InsertTheme(Create("TextLabel", Frame, {
            Font                = Enum.Font.GothamBold,
            Size                = UDim2.new(1, -20, 0, 24),
            Text                = DTitle,
            TextXAlignment      = Enum.TextXAlignment.Left,
            TextColor3          = Theme["Color Text"],
            TextSize            = 14,
            Position            = UDim2.fromOffset(15, 10),
            BackgroundTransparency = 1,
            ZIndex              = 22,
        }), "Text")

        InsertTheme(Create("TextLabel", Frame, {
            Font                = Enum.Font.Gotham,
            Size                = UDim2.new(1, -30, 0, 0),
            AutomaticSize       = Enum.AutomaticSize.Y,
            Text                = DText,
            TextXAlignment      = Enum.TextXAlignment.Left,
            TextColor3          = Theme["Color Dark Text"],
            TextSize            = 11,
            Position            = UDim2.fromOffset(15, 36),
            BackgroundTransparency = 1,
            TextWrapped         = true,
            ZIndex              = 22,
        }), "DarkText")

        local ButtonsHolder = Create("Frame", Frame, {
            Size                = UDim2.fromScale(1, 0.3),
            Position            = UDim2.fromScale(0, 1),
            AnchorPoint         = Vector2.new(0, 1),
            BackgroundTransparency = 1,
            ZIndex              = 22,
        }, {
            Create("UIListLayout", {
                Padding             = UDim.new(0, 8),
                VerticalAlignment   = Enum.VerticalAlignment.Center,
                FillDirection       = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            }),
        })

        -- Animate
        Frame.Size = UDim2.fromOffset(270 * 1.1 * 0.8, 160 * 1.1 * 0.8)
        CreateTween({ Frame, "Size", UDim2.fromOffset(270, 160), 0.3 })
        CreateTween({ Screen, "BackgroundTransparency", 0.4, 0.2 })

        local ButtonCount, Dialog = 1, {}
        function Dialog:Button(BConfigs)
            local BName     = BConfigs[1] or BConfigs.Name or ""
            local BCallback = BConfigs[2] or BConfigs.Callback or function() end
            ButtonCount = ButtonCount + 1

            local Btn = Make("Button", ButtonsHolder)
            Make("Corner", Btn, UDim.new(0, 8))
            SetProps(Btn, {
                Text      = BName,
                Font      = Enum.Font.GothamBold,
                TextColor3= Theme["Color Text"],
                TextSize  = 11,
                ZIndex    = 23,
            })
            Create("UIStroke", Btn, {
                Color           = Theme["Color Stroke"],
                Thickness       = 1,
                Transparency    = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            for _, B in pairs(ButtonsHolder:GetChildren()) do
                if B:IsA("TextButton") then
                    B.Size = UDim2.new(
                        1 / ButtonCount, -(((ButtonCount - 1) * 10) / ButtonCount), 0, 30
                    )
                end
            end
            Btn.Activated:Connect(Dialog.Close)
            Btn.Activated:Connect(BCallback)
        end
        function Dialog:Close()
            CreateTween({ Frame,  "Size", UDim2.fromOffset(270 * 1.1, 160 * 1.1), 0.25 })
            CreateTween({ Screen, "BackgroundTransparency", 1, 0.2, true })
            Screen:Destroy()
        end
        for _, Btn in ipairs(DOptions) do Dialog:Button(Btn) end
        return Dialog
    end

    function Window:SelectTab(TabSelect)
        if type(TabSelect) == "number" then
            MyLibrary.Tabs[TabSelect].func:Enable()
        else
            for _, Tab in pairs(MyLibrary.Tabs) do
                if Tab.Cont == TabSelect.Cont then Tab.func:Enable() end
            end
        end
    end

    function Window:AddMinimizeButton(BConfigs)
        local Button = MakeDrag(Create("ImageButton", ScreenGui, {
            Size                = UDim2.fromOffset(40, 40),
            Position            = UDim2.fromScale(0.04, 0.92),
            BackgroundColor3    = Theme["Color Hub 2"],
            AutoButtonColor     = false,
        }))
        Make("Corner", Button, UDim.new(0.5, 0))
        Make("Stroke", Button)
        if BConfigs and BConfigs.Button then SetProps(Button, BConfigs.Button) end
        Button.Activated:Connect(function() Window:Minimize() end)
        return { Button = Button }
    end

    -- ────────────────────────────────────────────
    --  MAKE TAB
    -- ────────────────────────────────────────────
    local ContainerList = {}
    function Window:MakeTab(paste, Configs)
        if type(paste) == "table" then Configs = paste end
        local TName  = Configs[1] or Configs.Title or "Tab"
        local TIcon  = Configs[2] or Configs.Icon  or ""
        TIcon = MyLibrary:GetIcon(TIcon)
        if not TIcon or not TIcon:find("rbxassetid://") or #TIcon:gsub("rbxassetid://","") < 6 then
            TIcon = false
        end

        -- Tab button
        local TabSelect = Make("Button", MainScroll, {
            Size = UDim2.new(1, 0, 0, 28),
        })
        Make("Corner", TabSelect, UDim.new(0, 8))

        local TabStroke = Create("UIStroke", TabSelect, {
            Color           = Theme["Color Stroke"],
            Thickness       = 0.8,
            Transparency    = 0.85,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })

        -- Active indicator pill
        local Selected = InsertTheme(Create("Frame", TabSelect, {
            Size             = FirstTab and UDim2.new(0, 3, 0, 4) or UDim2.new(0, 3, 0, 14),
            Position         = UDim2.new(0, 2, 0.5),
            AnchorPoint      = Vector2.new(0, 0.5),
            BackgroundColor3 = Theme["Color Theme"],
            BackgroundTransparency = FirstTab and 1 or 0,
        }), "Theme")
        Make("Corner", Selected, UDim.new(0.5, 0))

        -- Icon
        local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
            Position            = UDim2.new(0, 10, 0.5),
            Size                = UDim2.new(0, 14, 0, 14),
            AnchorPoint         = Vector2.new(0, 0.5),
            Image               = TIcon or "",
            BackgroundTransparency = 1,
            ImageTransparency   = FirstTab and 0.5 or 0,
            ImageColor3         = FirstTab and Theme["Color Dark Text"] or Theme["Color Theme"],
        }), "Text")

        -- Label
        local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
            Size                = UDim2.new(1, TIcon and -30 or -18, 1),
            Position            = UDim2.fromOffset(TIcon and 30 or 16),
            BackgroundTransparency = 1,
            Font                = Enum.Font.GothamBold,
            Text                = TName,
            TextColor3          = FirstTab and Theme["Color Dark Text"] or Theme["Color Text"],
            TextSize            = 10,
            TextXAlignment      = Enum.TextXAlignment.Left,
            TextTransparency    = FirstTab and 0.4 or 0,
            TextTruncate        = Enum.TextTruncate.AtEnd,
        }), "Text")

        -- Container
        local Container = InsertTheme(Create("ScrollingFrame", {
            Size                    = UDim2.fromScale(1, 1),
            Position                = UDim2.new(0, 0, 1),
            AnchorPoint             = Vector2.new(0, 1),
            ScrollBarThickness      = 2,
            BackgroundTransparency  = 1,
            ScrollBarImageTransparency = 0.3,
            ScrollBarImageColor3    = Theme["Color Theme"],
            AutomaticCanvasSize     = Enum.AutomaticSize.Y,
            ScrollingDirection      = Enum.ScrollingDirection.Y,
            BorderSizePixel         = 0,
            CanvasSize              = UDim2.new(),
            Name                    = ("Container_%i_%s"):format(#ContainerList + 1, TName),
        }, {
            Create("UIPadding", {
                PaddingLeft   = UDim.new(0, 10),
                PaddingRight  = UDim.new(0, 10),
                PaddingTop    = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
            }),
            Create("UIListLayout", { Padding = UDim.new(0, 5) }),
        }), "ScrollBar")

        table.insert(ContainerList, Container)
        if not FirstTab then Container.Parent = Containers end

        local function Tabs()
            if Container.Parent then return end
            for _, Frame in pairs(ContainerList) do
                if Frame:IsA("ScrollingFrame") and Frame ~= Container then
                    Frame.Parent = nil
                end
            end
            Container.Parent = Containers
            Container.Size   = UDim2.new(1, 0, 1, 100)
            for _, Tab in ipairs(MyLibrary.Tabs) do
                if Tab.Cont ~= Container then Tab.func:Disable() end
            end
            CreateTween({ Container,  "Size",             UDim2.fromScale(1, 1), 0.3 })
            CreateTween({ LabelTitle, "TextTransparency", 0,                     0.3 })
            CreateTween({ LabelTitle, "TextColor3",       Theme["Color Text"],   0.3 })
            CreateTween({ LabelIcon,  "ImageTransparency",0,                     0.3 })
            CreateTween({ LabelIcon,  "ImageColor3",      Theme["Color Theme"],  0.3 })
            CreateTween({ Selected,   "Size",             UDim2.new(0,3,0,14),   0.3 })
            CreateTween({ Selected,   "BackgroundTransparency", 0,               0.3 })
            CreateTween({ TabStroke,  "Transparency",     0.4,                   0.2 })
            CreateTween({ TabSelect,  "BackgroundTransparency", 0.15,            0.2 })
        end
        TabSelect.Activated:Connect(Tabs)
        FirstTab = true

        local Tab = {}
        table.insert(MyLibrary.Tabs, {
            TabInfo = { Name = TName, Icon = TIcon },
            func    = Tab,
            Cont    = Container,
        })
        Tab.Cont = Container

        function Tab:Disable()
            Container.Parent = nil
            CreateTween({ LabelTitle, "TextTransparency",       0.5,                      0.3 })
            CreateTween({ LabelTitle, "TextColor3",             Theme["Color Dark Text"],  0.3 })
            CreateTween({ LabelIcon,  "ImageTransparency",      0.5,                      0.3 })
            CreateTween({ LabelIcon,  "ImageColor3",            Theme["Color Dark Text"],  0.3 })
            CreateTween({ Selected,   "Size",                   UDim2.new(0, 3, 0, 4),    0.3 })
            CreateTween({ Selected,   "BackgroundTransparency", 1,                        0.3 })
            CreateTween({ TabStroke,  "Transparency",           0.85,                     0.2 })
            CreateTween({ TabSelect,  "BackgroundTransparency", 0,                        0.2 })
        end
        function Tab:Enable() Tabs() end
        function Tab:Visible(Bool) Funcs:ToggleVisible(TabSelect, Bool) end
        function Tab:Destroy() TabSelect:Destroy(); Container:Destroy() end

        -- ────────────────────────────────────────────
        --  TAB ELEMENTS
        -- ────────────────────────────────────────────
        function Tab:AddSection(Configs)
            local SName = type(Configs) == "string" and Configs
                or Configs[1] or Configs.Name or Configs.Title or "Section"

            local SFrame = Create("Frame", Container, {
                Size                = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                Name                = "Option",
            })

            -- Decorative left line
            local SLine = Create("Frame", SFrame, {
                Size             = UDim2.new(0, 2, 0, 14),
                Position         = UDim2.new(0, 3, 0.5),
                AnchorPoint      = Vector2.new(0, 0.5),
                BackgroundColor3 = Theme["Color Theme"],
            })
            Make("Corner", SLine, UDim.new(0.5, 0))

            InsertTheme(Create("TextLabel", SFrame, {
                Font                = Enum.Font.GothamBold,
                Text                = string.upper(SName),
                TextColor3          = Theme["Color Theme"],
                Size                = UDim2.new(1, -25, 1),
                Position            = UDim2.new(0, 12, 0),
                BackgroundTransparency = 1,
                TextTruncate        = Enum.TextTruncate.AtEnd,
                TextSize            = 9,
                TextXAlignment      = Enum.TextXAlignment.Left,
                TextTransparency    = 0.1,
            }), "Theme")

            -- Full-width separator below
            Create("Frame", SFrame, {
                Size             = UDim2.new(1, -10, 0, 1),
                Position         = UDim2.new(0, 5, 1, 0),
                AnchorPoint      = Vector2.new(0, 1),
                BackgroundColor3 = Theme["Color Stroke"],
                BackgroundTransparency = 0.65,
                BorderSizePixel  = 0,
            })

            local Section = {}
            table.insert(MyLibrary.Options, { type = "Section", Name = SName, func = Section })
            function Section:Visible(Bool)
                SFrame.Visible = Bool == nil and not SFrame.Visible or Bool
            end
            function Section:Destroy() SFrame:Destroy() end
            function Section:Set(New)
                if New then
                    SFrame:FindFirstChildWhichIsA("TextLabel").Text = string.upper(GetStr(New))
                end
            end
            return Section
        end

        function Tab:AddParagraph(Configs)
            local PName = Configs[1] or Configs.Title or "Paragraph"
            local PDesc = Configs[2] or Configs.Text  or ""
            local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -20))

            -- Info icon
            Create("ImageLabel", Frame, {
                Size                = UDim2.new(0, 12, 0, 12),
                Position            = UDim2.new(1, -10, 0.5),
                AnchorPoint         = Vector2.new(1, 0.5),
                Image               = "rbxassetid://10723415903",
                ImageColor3         = Theme["Color Theme"],
                BackgroundTransparency = 1,
            })

            local Paragraph = {}
            function Paragraph:Visible(...)     Funcs:ToggleVisible(Frame, ...) end
            function Paragraph:Destroy()        Frame:Destroy() end
            function Paragraph:SetTitle(Val)    LabelFunc:SetTitle(GetStr(Val)) end
            function Paragraph:SetDesc(Val)     LabelFunc:SetDesc(GetStr(Val)) end
            function Paragraph:Set(Val1, Val2)
                if Val1 and Val2 then
                    LabelFunc:SetTitle(GetStr(Val1))
                    LabelFunc:SetDesc(GetStr(Val2))
                elseif Val1 then
                    LabelFunc:SetDesc(GetStr(Val1))
                end
            end
            return Paragraph
        end

        function Tab:AddButton(Configs)
            local BName  = Configs[1] or Configs.Name or Configs.Title or "Button"
            local BDesc  = Configs.Desc or Configs.Description or ""
            local Callback = Funcs:GetCallback(Configs, 2)

            local FButton, LabelFunc = ButtonFrame(Container, BName, BDesc, UDim2.new(1, -50))

            -- Arrow icon
            local ArrowIcon = Create("ImageLabel", FButton, {
                Size                = UDim2.new(0, 14, 0, 14),
                Position            = UDim2.new(1, -12, 0.5),
                AnchorPoint         = Vector2.new(1, 0.5),
                Image               = "rbxassetid://10709791437",
                ImageColor3         = Theme["Color Theme"],
                BackgroundTransparency = 1,
            })

            -- Click ripple effect
            FButton.Activated:Connect(function()
                CreateTween({ ArrowIcon, "ImageColor3", Theme["Color Accent"] or Theme["Color Text"], 0.1 })
                task.delay(0.2, function()
                    CreateTween({ ArrowIcon, "ImageColor3", Theme["Color Theme"], 0.2 })
                end)
                Funcs:FireCallback(Callback)
            end)

            local Button = {}
            function Button:Visible(...)  Funcs:ToggleVisible(FButton, ...) end
            function Button:Destroy()     FButton:Destroy() end
            function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
            function Button:Set(Val1, Val2)
                if type(Val1) == "string" and type(Val2) == "string" then
                    LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
                elseif type(Val1) == "string" then
                    LabelFunc:SetTitle(Val1)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Button
        end

        function Tab:AddToggle(Configs)
            local TName    = Configs[1] or Configs.Name or Configs.Title or "Toggle"
            local TDesc    = Configs.Desc or Configs.Description or ""
            local Callback = Funcs:GetCallback(Configs, 3)
            local Flag     = Configs[4] or Configs.Flag or false
            local Default  = Configs[2] or Configs.Default or false
            if CheckFlag(Flag) then Default = GetFlag(Flag) end

            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -55))

            -- Toggle track
            local ToggleHolder = InsertTheme(Create("Frame", Button, {
                Size             = UDim2.new(0, 38, 0, 20),
                Position         = UDim2.new(1, -12, 0.5),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", ToggleHolder, UDim.new(0.5, 0))

            -- Track stroke
            local TrackStroke = Create("UIStroke", ToggleHolder, {
                Color           = Theme["Color Stroke"],
                Thickness       = 1,
                Transparency    = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            -- Thumb
            local Thumb = InsertTheme(Create("Frame", ToggleHolder, {
                Size             = UDim2.new(0, 14, 0, 14),
                Position         = UDim2.new(0, 3, 0.5),
                AnchorPoint      = Vector2.new(0, 0.5),
                BackgroundColor3 = Theme["Color Dark Text"],
            }), "Theme")
            Make("Corner", Thumb, UDim.new(0.5, 0))

            local WaitClick
            local function SetToggle(Val)
                if WaitClick then return end
                WaitClick, Default = true, Val
                SetFlag(Flag, Default)
                Funcs:FireCallback(Callback, Default)
                if Default then
                    CreateTween({ Thumb, "Position",         UDim2.new(1, -17, 0.5), 0.25 })
                    CreateTween({ Thumb, "AnchorPoint",      Vector2.new(0, 0.5),    0.25 })
                    CreateTween({ Thumb, "BackgroundColor3", Theme["Color Theme"],    0.25 })
                    CreateTween({ ToggleHolder, "BackgroundColor3", Color3.fromRGB(
                        math.floor(Theme["Color Theme"].R * 80),
                        math.floor(Theme["Color Theme"].G * 80),
                        math.floor(Theme["Color Theme"].B * 80)
                    ), 0.25 })
                    CreateTween({ TrackStroke, "Transparency", 0.1, 0.25 })
                else
                    CreateTween({ Thumb, "Position",         UDim2.new(0, 3, 0.5),       0.25 })
                    CreateTween({ Thumb, "AnchorPoint",      Vector2.new(0, 0.5),         0.25 })
                    CreateTween({ Thumb, "BackgroundColor3", Theme["Color Dark Text"],     0.25 })
                    CreateTween({ ToggleHolder, "BackgroundColor3", Theme["Color Stroke"], 0.25 })
                    CreateTween({ TrackStroke, "Transparency", 0.5, 0.25 })
                end
                WaitClick = false
            end
            task.spawn(SetToggle, Default)

            Button.Activated:Connect(function()
                SetToggle(not Default)
            end)

            local Toggle = {}
            function Toggle:Visible(...)  Funcs:ToggleVisible(Button, ...) end
            function Toggle:Destroy()     Button:Destroy() end
            function Toggle:Callback(...) Funcs:InsertCallback(Callback, ...)() end
            function Toggle:Set(Val1, Val2)
                if type(Val1) == "string" and type(Val2) == "string" then
                    LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
                elseif type(Val1) == "string" then
                    LabelFunc:SetTitle(Val1)
                elseif type(Val1) == "boolean" then
                    task.spawn(SetToggle, Val1)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Toggle
        end

        function Tab:AddSlider(Configs)
            local SName    = Configs[1] or Configs.Name or Configs.Title or "Slider"
            local SDesc    = Configs.Desc or Configs.Description or ""
            local Min      = (Configs[2] or Configs.MinValue or Configs.Min or 0)
            local Max      = (Configs[3] or Configs.MaxValue or Configs.Max or 100)
            local Increase = Configs[4] or Configs.Increase or 1
            local Callback = Funcs:GetCallback(Configs, 6)
            local Flag     = Configs[7] or Configs.Flag or false
            local Default  = Configs[5] or Configs.Default or Min
            if CheckFlag(Flag) then Default = GetFlag(Flag) end

            local MinN, MaxN = Min / Increase, Max / Increase

            local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -180))

            local SliderHolder = Create("TextButton", Button, {
                Size                = UDim2.new(0.45, 0, 1),
                Position            = UDim2.new(1),
                AnchorPoint         = Vector2.new(1, 0),
                AutoButtonColor     = false,
                Text                = "",
                BackgroundTransparency = 1,
            })

            -- Value label
            local LabelVal = InsertTheme(Create("TextLabel", SliderHolder, {
                Size                = UDim2.new(0, 30, 0, 14),
                AnchorPoint         = Vector2.new(1, 0.5),
                Position            = UDim2.new(0, 0, 0.5),
                BackgroundTransparency = 1,
                TextColor3          = Theme["Color Theme"],
                Font                = Enum.Font.GothamBold,
                TextSize            = 11,
            }), "Theme")

            -- Track
            local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
                BackgroundColor3 = Color3.fromRGB(25, 20, 40),
                Size             = UDim2.new(1, -42, 0, 5),
                Position         = UDim2.new(0, 38, 0.5),
                AnchorPoint      = Vector2.new(0, 0.5),
            }), "Stroke")
            Make("Corner", SliderBar)

            -- Fill
            local Indicator = InsertTheme(Create("Frame", SliderBar, {
                BackgroundColor3 = Theme["Color Theme"],
                Size             = UDim2.fromScale(0, 1),
                BorderSizePixel  = 0,
            }), "Theme")
            Make("Corner", Indicator)

            -- Thumb
            local SliderThumb = Create("Frame", SliderBar, {
                Size             = UDim2.new(0, 14, 0, 14),
                Position         = UDim2.new(0, 0, 0.5),
                AnchorPoint      = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(240, 235, 255),
            })
            Make("Corner", SliderThumb, UDim.new(0.5, 0))
            Create("UIStroke", SliderThumb, {
                Color       = Theme["Color Theme"],
                Thickness   = 1.5,
                Transparency = 0.2,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            local BaseRef = Create("Frame", SliderBar, {
                Position    = UDim2.new(0, 0, 0.5),
                Visible     = false,
            })

            local function UpdateLabel(val)
                local num = math.floor((val * Increase) * 100) / 100
                Default, LabelVal.Text = num, tostring(num)
                Funcs:FireCallback(Callback, Default)
            end

            local function ControlPos()
                local mx = Player:GetMouse()
                local ap = mx.X - BaseRef.AbsolutePosition.X
                local sc = ap / SliderBar.AbsoluteSize.X
                SliderThumb.Position = UDim2.new(math.clamp(sc, 0, 1), 0, 0.5, 0)
            end

            local function UpdateValues()
                Indicator.Size = UDim2.fromScale(SliderThumb.Position.X.Scale, 1)
                local sp  = SliderThumb.Position.X.Scale
                local val = math.floor(((sp * MaxN) / MaxN) * (MaxN - MinN) + MinN)
                UpdateLabel(val)
            end

            SliderHolder.MouseButton1Down:Connect(function()
                Container.ScrollingEnabled = false
                CreateTween({ SliderThumb, "Size", UDim2.new(0, 16, 0, 16), 0.1 })
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    task.wait(); ControlPos()
                end
                CreateTween({ SliderThumb, "Size", UDim2.new(0, 14, 0, 14), 0.1 })
                Container.ScrollingEnabled = true
                SetFlag(Flag, Default)
            end)

            local function SetSlider(NewValue)
                if type(NewValue) ~= "number" then return end
                local sp = (NewValue - Min) / (Max - Min)
                SetFlag(Flag, NewValue)
                CreateTween({ SliderThumb, "Position", UDim2.fromScale(math.clamp(sp, 0, 1), 0.5), 0.3, true })
            end
            SetSlider(Default)
            SliderThumb:GetPropertyChangedSignal("Position"):Connect(UpdateValues)
            UpdateValues()

            local Slider = {}
            function Slider:Set(Val1, Val2)
                if Val1 and Val2 then
                    LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
                elseif type(Val1) == "string" then
                    LabelFunc:SetTitle(Val1)
                elseif type(Val1) == "function" then
                    Callback = Val1
                elseif type(Val1) == "number" then
                    SetSlider(Val1)
                end
            end
            function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(tonumber(Default)) end
            function Slider:Visible(...)  Funcs:ToggleVisible(Button, ...) end
            function Slider:Destroy()     Button:Destroy() end
            return Slider
        end

        function Tab:AddDropdown(Configs)
            local DName        = Configs[1] or Configs.Name  or Configs.Title or "Dropdown"
            local DDesc        = Configs.Desc or Configs.Description or ""
            local DOptions     = Configs[2] or Configs.Options or {}
            local OpDefault    = Configs[3] or Configs.Default or {}
            local Flag         = Configs[5] or Configs.Flag or false
            local DMultiSelect = Configs.MultiSelect or false
            local Callback     = Funcs:GetCallback(Configs, 4)

            local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -180))

            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size             = UDim2.new(0, 150, 0, 20),
                Position         = UDim2.new(1, -12, 0.5),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 6))

            local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
                Size                = UDim2.new(0.8, 0, 0.85, 0),
                AnchorPoint         = Vector2.new(0.5, 0.5),
                Position            = UDim2.new(0.5, 0, 0.5),
                BackgroundTransparency = 1,
                Font                = Enum.Font.GothamBold,
                TextScaled          = true,
                TextColor3          = Theme["Color Text"],
                Text                = "...",
            }), "Text")

            local Arrow = Create("ImageLabel", SelectedFrame, {
                Size                = UDim2.new(0, 14, 0, 14),
                Position            = UDim2.new(0, -4, 0.5),
                AnchorPoint         = Vector2.new(1, 0.5),
                Image               = "rbxassetid://10709791523",
                BackgroundTransparency = 1,
                ImageColor3         = Theme["Color Theme"],
            })

            local NoClickFrame = Create("TextButton", DropdownHolder, {
                Name                = "AntiClick",
                Size                = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Visible             = false,
                Text                = "",
            })

            local DropFrame = Create("Frame", NoClickFrame, {
                Size                = UDim2.fromOffset(154, 0),
                BackgroundTransparency = 0.08,
                BackgroundColor3    = Color3.fromRGB(10, 8, 20),
                AnchorPoint         = Vector2.new(0, 1),
                Name                = "DropdownFrame",
                ClipsDescendants    = true,
                Active              = true,
            })
            Make("Corner", DropFrame, UDim.new(0, 8))
            Make("Stroke", DropFrame)
            Make("Gradient", DropFrame, { Rotation = 60 })

            local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
                ScrollBarImageColor3= Theme["Color Theme"],
                Size                = UDim2.fromScale(1, 1),
                ScrollBarThickness  = 2,
                BackgroundTransparency = 1,
                BorderSizePixel     = 0,
                CanvasSize          = UDim2.new(),
                ScrollingDirection  = Enum.ScrollingDirection.Y,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                Active              = true,
            }, {
                Create("UIPadding", {
                    PaddingLeft   = UDim.new(0, 6),
                    PaddingRight  = UDim.new(0, 6),
                    PaddingTop    = UDim.new(0, 5),
                    PaddingBottom = UDim.new(0, 5),
                }),
                Create("UIListLayout", { Padding = UDim.new(0, 3) }),
            }), "ScrollBar")

            local ScrollSize, WaitClick = 5
            local function Disable()
                WaitClick = true
                CreateTween({ Arrow,    "Rotation",    0,                                    0.2 })
                CreateTween({ DropFrame,"Size",        UDim2.fromOffset(154, 0),             0.2, true })
                CreateTween({ Arrow,    "ImageColor3", Theme["Color Theme"],                 0.2 })
                Arrow.Image        = "rbxassetid://10709791523"
                NoClickFrame.Visible = false
                WaitClick = false
            end

            local function GetFrameSize() return UDim2.fromOffset(154, ScrollSize) end

            local function CalculateSize()
                local Count = 0
                for _, F in pairs(ScrollFrame:GetChildren()) do
                    if (F:IsA("Frame") or F.Name == "Option") then Count += 1 end
                end
                ScrollSize = (math.clamp(Count, 0, 10) * 26) + 10
                if NoClickFrame.Visible then
                    CreateTween({ DropFrame, "Size", GetFrameSize(), 0.2 })
                end
            end

            local function Minimize()
                if WaitClick then return end
                WaitClick = true
                if NoClickFrame.Visible then
                    Arrow.Image = "rbxassetid://10709791523"
                    CreateTween({ Arrow,    "Rotation", 0,                  0.2 })
                    CreateTween({ DropFrame,"Size",     UDim2.fromOffset(154, 0), 0.2, true })
                    NoClickFrame.Visible = false
                else
                    NoClickFrame.Visible = true
                    Arrow.Image = "rbxassetid://10709790948"
                    CreateTween({ Arrow,    "Rotation", 180,               0.2 })
                    CreateTween({ DropFrame,"Size",     GetFrameSize(),    0.2, true })
                end
                WaitClick = false
            end

            local function CalculatePos()
                local FPos   = SelectedFrame.AbsolutePosition
                local SSize  = ScreenGui.AbsoluteSize
                local ClampX = math.clamp(FPos.X / UIScale, 0, SSize.X / UIScale - DropFrame.Size.X.Offset)
                local ClampY = math.clamp(FPos.Y / UIScale, 0, SSize.Y / UIScale)
                local AP     = FPos.Y > SSize.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
                DropFrame.AnchorPoint = Vector2.new(0, AP)
                CreateTween({ DropFrame, "Position", UDim2.fromOffset(ClampX, ClampY), 0.1 })
            end

            local AddNewOptions, GetOptions, AddOption, RemoveOption, Selected
            do
                local DefaultT   = type(OpDefault) ~= "table" and { OpDefault } or OpDefault
                local MultiSelect = DMultiSelect
                local Options    = {}
                Selected = MultiSelect and {} or (CheckFlag(Flag) and GetFlag(Flag) or DefaultT[1])

                if MultiSelect then
                    for idx, Val in pairs(CheckFlag(Flag) and GetFlag(Flag) or DefaultT) do
                        if type(idx) == "string" and (DOptions[idx] or table.find(DOptions, idx)) then
                            Selected[idx] = Val
                        elseif DOptions[Val] then
                            Selected[Val] = true
                        end
                    end
                end

                local function CallbackSelected()
                    SetFlag(Flag, MultiSelect and Selected or tostring(Selected))
                    Funcs:FireCallback(Callback, Selected)
                end
                local function UpdateLabel()
                    if MultiSelect then
                        local list = {}
                        for k, v in pairs(Selected) do if v then table.insert(list, k) end end
                        ActiveLabel.Text = #list > 0 and table.concat(list, ", ") or "..."
                    else
                        ActiveLabel.Text = tostring(Selected or "...")
                    end
                end
                local function UpdateSelected()
                    if MultiSelect then
                        for _, v in pairs(Options) do
                            local nodes, Stats = v.nodes, v.Stats
                            CreateTween({ nodes[2], "BackgroundTransparency", Stats and 0 or 0.8,            0.3 })
                            CreateTween({ nodes[2], "Size", Stats and UDim2.fromOffset(4,13) or UDim2.fromOffset(4,4), 0.3 })
                            CreateTween({ nodes[3], "TextTransparency", Stats and 0 or 0.5, 0.3 })
                        end
                    else
                        for _, v in pairs(Options) do
                            local Slt   = v.Value == Selected
                            local nodes = v.nodes
                            CreateTween({ nodes[2], "BackgroundTransparency", Slt and 0 or 0.9, 0.3 })
                            CreateTween({ nodes[2], "Size", Slt and UDim2.fromOffset(4,14) or UDim2.fromOffset(4,4), 0.3 })
                            CreateTween({ nodes[3], "TextTransparency", Slt and 0 or 0.5, 0.3 })
                            CreateTween({ nodes[3], "TextColor3", Slt and Theme["Color Theme"] or Theme["Color Text"], 0.3 })
                        end
                    end
                    UpdateLabel()
                end
                local function Select(Option)
                    if MultiSelect then
                        Option.Stats    = not Option.Stats
                        Option.LastCB   = tick()
                        Selected[Option.Name] = Option.Stats
                        CallbackSelected()
                    else
                        Option.LastCB = tick()
                        Selected      = Option.Value
                        CallbackSelected()
                    end
                    UpdateSelected()
                end

                AddOption = function(index, Value)
                    local Name = tostring(type(index) == "string" and index or Value)
                    if Options[Name] then return end
                    Options[Name] = { index = index, Value = Value, Name = Name, Stats = false, LastCB = 0 }
                    if MultiSelect then
                        local Stats = Selected[Name]
                        Selected[Name]       = Stats or false
                        Options[Name].Stats  = Stats
                    end

                    local Btn = Make("Button", ScrollFrame, {
                        Name        = "Option",
                        Size        = UDim2.new(1, 0, 0, 24),
                    })
                    Make("Corner", Btn, UDim.new(0, 6))

                    local IsSelected = InsertTheme(Create("Frame", Btn, {
                        Position            = UDim2.new(0, 2, 0.5),
                        Size                = UDim2.new(0, 4, 0, 4),
                        BackgroundColor3    = Theme["Color Theme"],
                        BackgroundTransparency = 0.9,
                        AnchorPoint         = Vector2.new(0, 0.5),
                    }), "Theme")
                    Make("Corner", IsSelected, UDim.new(0.5, 0))

                    local OptionLabel = InsertTheme(Create("TextLabel", Btn, {
                        Size                = UDim2.new(1, -14, 1),
                        Position            = UDim2.new(0, 12),
                        Text                = Name,
                        TextColor3          = Theme["Color Text"],
                        Font                = Enum.Font.GothamBold,
                        TextXAlignment      = Enum.TextXAlignment.Left,
                        BackgroundTransparency = 1,
                        TextTransparency    = 0.4,
                        TextSize            = 10,
                    }), "Text")

                    Btn.Activated:Connect(function() Select(Options[Name]) end)
                    Options[Name].nodes = { Btn, IsSelected, OptionLabel }
                end

                RemoveOption = function(index, Value)
                    local Name = tostring(type(index) == "string" and index or Value)
                    if Options[Name] then
                        if MultiSelect then Selected[Name] = nil else Selected = nil end
                        Options[Name].nodes[1]:Destroy()
                        table.clear(Options[Name])
                        Options[Name] = nil
                    end
                end

                GetOptions = function() return Options end

                AddNewOptions = function(List, Clear)
                    if Clear then table.foreach(Options, RemoveOption) end
                    table.foreach(List, AddOption)
                    CallbackSelected()
                    UpdateSelected()
                end

                table.foreach(DOptions, AddOption)
                CallbackSelected()
                UpdateSelected()
            end

            Button.Activated:Connect(Minimize)
            NoClickFrame.MouseButton1Down:Connect(Disable)
            NoClickFrame.MouseButton1Click:Connect(Disable)
            MainFrame:GetPropertyChangedSignal("Visible"):Connect(Disable)
            SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalculatePos)
            Button.Activated:Connect(CalculateSize)
            ScrollFrame.ChildAdded:Connect(CalculateSize)
            ScrollFrame.ChildRemoved:Connect(CalculateSize)
            CalculatePos(); CalculateSize()

            local Dropdown = {}
            function Dropdown:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function Dropdown:Destroy()    Button:Destroy() end
            function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(Selected) end
            function Dropdown:Add(...)
                local NewOptions = { ... }
                if type(NewOptions[1]) == "table" then
                    table.foreach(NewOptions[1], function(_, Name) AddOption(Name) end)
                else
                    table.foreach(NewOptions, function(_, Name) AddOption(Name) end)
                end
            end
            function Dropdown:Remove(Option)
                for index, Value in pairs(GetOptions()) do
                    if (type(Option) == "number" and index == Option)
                    or Value.Name == Option then
                        RemoveOption(index, Value.Value)
                    end
                end
            end
            function Dropdown:Set(Val1, Clear)
                if type(Val1) == "table" then
                    AddNewOptions(Val1, not Clear)
                elseif type(Val1) == "function" then
                    Callback = Val1
                end
            end
            return Dropdown
        end

        function Tab:AddTextBox(Configs)
            local TName         = Configs[1] or Configs.Name  or Configs.Title or "Text Box"
            local TDesc         = Configs.Desc or Configs.Description or ""
            local TDefault      = Configs[2] or Configs.Default or ""
            local TPlaceholder  = Configs[5] or Configs.PlaceholderText or "Type here..."
            local TClearText    = Configs[3] or Configs.ClearText or false
            local Callback      = Funcs:GetCallback(Configs, 4)

            if type(TDefault) ~= "string" or #TDefault:gsub(" ", "") < 1 then
                TDefault = false
            end

            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -55))

            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size             = UDim2.new(0, 150, 0, 22),
                Position         = UDim2.new(1, -12, 0.5),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 6))

            local FrameStroke2 = Create("UIStroke", SelectedFrame, {
                Color           = Theme["Color Stroke"],
                Thickness       = 1,
                Transparency    = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
                Size                = UDim2.new(0.82, 0, 0.85, 0),
                AnchorPoint         = Vector2.new(0.5, 0.5),
                Position            = UDim2.new(0.5, 0, 0.5),
                BackgroundTransparency = 1,
                Font                = Enum.Font.GothamBold,
                TextScaled          = true,
                TextColor3          = Theme["Color Text"],
                ClearTextOnFocus    = TClearText,
                PlaceholderText     = TPlaceholder,
                PlaceholderColor3   = Theme["Color Dark Text"],
                Text                = "",
            }), "Text")

            local Pencil = Create("ImageLabel", SelectedFrame, {
                Size                = UDim2.new(0, 11, 0, 11),
                Position            = UDim2.new(0, -4, 0.5),
                AnchorPoint         = Vector2.new(1, 0.5),
                Image               = "rbxassetid://15637081879",
                BackgroundTransparency = 1,
                ImageColor3         = Theme["Color Dark Text"],
            })

            local TextBox = {}
            local function Input()
                local Text = TextBoxInput.Text
                if #Text:gsub(" ", "") > 0 then
                    if TextBox.OnChanging then Text = TextBox.OnChanging(Text) or Text end
                    Funcs:FireCallback(Callback, Text)
                    TextBoxInput.Text = Text
                end
            end

            TextBoxInput.FocusLost:Connect(Input)
            TextBoxInput.FocusLost:Connect(function()
                CreateTween({ Pencil,       "ImageColor3",  Theme["Color Dark Text"], 0.2 })
                CreateTween({ FrameStroke2, "Transparency", 0.5,                      0.2 })
            end)
            TextBoxInput.Focused:Connect(function()
                CreateTween({ Pencil,       "ImageColor3",  Theme["Color Theme"], 0.2 })
                CreateTween({ FrameStroke2, "Transparency", 0.1,                  0.2 })
            end)
            Input()

            TextBox.OnChanging = false
            function TextBox:Visible(...)  Funcs:ToggleVisible(Button, ...) end
            function TextBox:Destroy()     Button:Destroy() end
            function TextBox:Set(Val)
                if type(Val) == "string" then TextBoxInput.Text = Val end
            end
            return TextBox
        end

        function Tab:AddDiscordInvite(Configs)
            local DTitle  = Configs[1] or Configs.Name  or Configs.Title or "Discord"
            local DDesc   = Configs.Desc or Configs.Description or ""
            local Logo    = Configs[2] or Configs.Logo   or ""
            local Invite  = Configs[3] or Configs.Invite or ""

            local InviteHolder = Create("Frame", Container, {
                Size                = UDim2.new(1, 0, 0, 88),
                Name                = "Option",
                BackgroundTransparency = 1,
            })

            local FrameHolder = InsertTheme(Create("Frame", InviteHolder, {
                Size             = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(30, 33, 36),
            }), "Frame")
            Make("Corner", FrameHolder, UDim.new(0, 10))

            -- Discord branding stripe
            local DiscordStripe = Create("Frame", FrameHolder, {
                Size             = UDim2.new(0, 4, 1, -16),
                Position         = UDim2.new(0, 8, 0, 8),
                BackgroundColor3 = Color3.fromRGB(88, 101, 242),
            })
            Make("Corner", DiscordStripe, UDim.new(0.5, 0))

            local ImageLabel = Create("ImageLabel", FrameHolder, {
                Size                = UDim2.new(0, 36, 0, 36),
                Position            = UDim2.new(0, 22, 0, 10),
                Image               = Logo,
                BackgroundColor3    = Color3.fromRGB(30, 33, 36),
                BackgroundTransparency = 0.3,
            })
            Make("Corner", ImageLabel, UDim.new(0, 6))
            Make("Stroke", ImageLabel, nil, Color3.fromRGB(88, 101, 242), 1.2)

            Create("TextLabel", FrameHolder, {
                Size                = UDim2.new(1, -70, 0, 16),
                Position            = UDim2.new(0, 64, 0, 10),
                Font                = Enum.Font.GothamBold,
                TextColor3          = Color3.fromRGB(255, 255, 255),
                TextXAlignment      = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextSize            = 11,
                Text                = DTitle,
            })

            Create("TextLabel", FrameHolder, {
                Size                = UDim2.new(1, -70, 0, 0),
                Position            = UDim2.new(0, 64, 0, 28),
                AutomaticSize       = Enum.AutomaticSize.Y,
                TextWrapped         = true,
                Font                = Enum.Font.Gotham,
                TextColor3          = Color3.fromRGB(185, 187, 190),
                TextXAlignment      = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextSize            = 9,
                Text                = DDesc,
            })

            local JoinButton = Create("TextButton", FrameHolder, {
                Size             = UDim2.new(1, -20, 0, 20),
                AnchorPoint      = Vector2.new(0.5, 1),
                Position         = UDim2.new(0.5, 0, 1, -8),
                Text             = "Join Server",
                Font             = Enum.Font.GothamBold,
                TextSize         = 11,
                TextColor3       = Color3.fromRGB(255, 255, 255),
                BackgroundColor3 = Color3.fromRGB(88, 101, 242),
                AutoButtonColor  = false,
            })
            Make("Corner", JoinButton, UDim.new(0, 6))

            JoinButton.MouseEnter:Connect(function()
                CreateTween({ JoinButton, "BackgroundColor3", Color3.fromRGB(71, 82, 196), 0.2 })
            end)
            JoinButton.MouseLeave:Connect(function()
                CreateTween({ JoinButton, "BackgroundColor3", Color3.fromRGB(88, 101, 242), 0.2 })
            end)

            local ClickDelay
            JoinButton.Activated:Connect(function()
                setclipboard(Invite)
                if ClickDelay then return end
                ClickDelay = true
                SetProps(JoinButton, {
                    Text             = "✔ Copied!",
                    BackgroundColor3 = Color3.fromRGB(59, 165, 93),
                })
                task.wait(3)
                SetProps(JoinButton, {
                    Text             = "Join Server",
                    BackgroundColor3 = Color3.fromRGB(88, 101, 242),
                })
                ClickDelay = false
            end)

            local DiscordInvite = {}
            function DiscordInvite:Destroy()   InviteHolder:Destroy() end
            function DiscordInvite:Visible(...) Funcs:ToggleVisible(InviteHolder, ...) end
            return DiscordInvite
        end

        -- ── KEYBIND (NEW) ──────────────────────────────
        function Tab:AddKeybind(Configs)
            local KName    = Configs[1] or Configs.Name  or Configs.Title or "Keybind"
            local KDesc    = Configs.Desc or Configs.Description or ""
            local KDefault = Configs[2] or Configs.Default or Enum.KeyCode.Unknown
            local Flag     = Configs[3] or Configs.Flag  or false
            local Callback = Funcs:GetCallback(Configs, 4)

            local Button, LabelFunc = ButtonFrame(Container, KName, KDesc, UDim2.new(1, -120))

            local KeyFrame = InsertTheme(Create("Frame", Button, {
                Size             = UDim2.new(0, 90, 0, 22),
                Position         = UDim2.new(1, -12, 0.5),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", KeyFrame, UDim.new(0, 6))
            Create("UIStroke", KeyFrame, {
                Color           = Theme["Color Stroke"],
                Thickness       = 1,
                Transparency    = 0.4,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            local KeyLabel = InsertTheme(Create("TextLabel", KeyFrame, {
                Size                = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Font                = Enum.Font.GothamBold,
                TextColor3          = Theme["Color Theme"],
                TextSize            = 10,
                Text                = tostring(KDefault.Name),
            }), "Theme")

            local Listening   = false
            local CurrentKey  = KDefault

            Button.Activated:Connect(function()
                if Listening then return end
                Listening = true
                KeyLabel.Text      = "..."
                KeyLabel.TextColor3 = Theme["Color Warning"] or Color3.fromRGB(255, 180, 40)

                local conn; conn = UserInputService.InputBegan:Connect(function(Input, Processed)
                    if Processed then return end
                    if Input.UserInputType == Enum.UserInputType.Keyboard then
                        CurrentKey = Input.KeyCode
                        SetFlag(Flag, tostring(CurrentKey.Name))
                        Funcs:FireCallback(Callback, CurrentKey)
                        KeyLabel.Text       = tostring(CurrentKey.Name)
                        KeyLabel.TextColor3 = Theme["Color Theme"]
                        Listening = false
                        conn:Disconnect()
                    end
                end)
            end)

            -- Fire when key is pressed during gameplay
            UserInputService.InputBegan:Connect(function(Input, Processed)
                if not Processed and not Listening
                and Input.UserInputType == Enum.UserInputType.Keyboard
                and Input.KeyCode == CurrentKey then
                    Funcs:FireCallback(Callback, CurrentKey)
                end
            end)

            local Keybind = {}
            function Keybind:Visible(...)  Funcs:ToggleVisible(Button, ...) end
            function Keybind:Destroy()     Button:Destroy() end
            function Keybind:Set(Val)
                if typeof(Val) == "EnumItem" then
                    CurrentKey          = Val
                    KeyLabel.Text       = tostring(Val.Name)
                    SetFlag(Flag, tostring(Val.Name))
                end
            end
            return Keybind
        end

        -- ── COLOR PICKER (NEW) ─────────────────────────
        function Tab:AddColorPicker(Configs)
            local CName    = Configs[1] or Configs.Name  or Configs.Title or "Color"
            local CDesc    = Configs.Desc or Configs.Description or ""
            local CDefault = Configs[2] or Configs.Default or Color3.fromRGB(255, 255, 255)
            local Flag     = Configs[3] or Configs.Flag  or false
            local Callback = Funcs:GetCallback(Configs, 4)

            local Button, LabelFunc = ButtonFrame(Container, CName, CDesc, UDim2.new(1, -55))

            local Preview = Create("Frame", Button, {
                Size             = UDim2.new(0, 28, 0, 20),
                Position         = UDim2.new(1, -12, 0.5),
                AnchorPoint      = Vector2.new(1, 0.5),
                BackgroundColor3 = CDefault,
            })
            Make("Corner", Preview, UDim.new(0, 5))
            Create("UIStroke", Preview, {
                Color           = Theme["Color Stroke"],
                Thickness       = 1,
                Transparency    = 0.3,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            })

            local CurrentColor = CDefault
            SetFlag(Flag, CurrentColor)
            Funcs:FireCallback(Callback, CurrentColor)

            -- Simple HUE strip picker popup
            local NoClick = Create("TextButton", DropdownHolder, {
                Size                = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Visible             = false,
                Text                = "",
            })
            local PickerFrame = Create("Frame", NoClick, {
                Size                = UDim2.fromOffset(160, 90),
                BackgroundColor3    = Color3.fromRGB(10, 8, 20),
                ClipsDescendants    = true,
                AnchorPoint         = Vector2.new(0, 1),
            })
            Make("Corner", PickerFrame, UDim.new(0, 8))
            Make("Stroke", PickerFrame)
            Make("Gradient", PickerFrame, { Rotation = 60 })

            -- Hue bar
            local HueBar = Create("Frame", PickerFrame, {
                Size             = UDim2.new(1, -16, 0, 14),
                Position         = UDim2.new(0, 8, 0, 8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            })
            Make("Corner", HueBar, UDim.new(0, 5))
            Create("UIGradient", HueBar, {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0,    Color3.fromRGB(255,0,0)),
                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255,255,0)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,255,0)),
                    ColorSequenceKeypoint.new(0.5,  Color3.fromRGB(0,255,255)),
                    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0,0,255)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255,0,255)),
                    ColorSequenceKeypoint.new(1,    Color3.fromRGB(255,0,0)),
                }),
            })

            -- Saturation / Value square
            local SVSquare = Create("Frame", PickerFrame, {
                Size             = UDim2.new(1, -16, 0, 45),
                Position         = UDim2.new(0, 8, 0, 28),
                BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            })
            Make("Corner", SVSquare, UDim.new(0, 5))
            Create("UIGradient", SVSquare, {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255)),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1),
                }),
            })

            -- Close button
            local PickerClose = Create("TextButton", PickerFrame, {
                Size                = UDim2.new(1, -16, 0, 16),
                Position            = UDim2.new(0, 8, 1, -22),
                AnchorPoint         = Vector2.new(0, 0),
                Text                = "Apply",
                Font                = Enum.Font.GothamBold,
                TextSize            = 10,
                TextColor3          = Theme["Color Text"],
                BackgroundColor3    = Theme["Color Theme"],
                AutoButtonColor     = false,
            })
            Make("Corner", PickerClose, UDim.new(0, 5))

            local H, S, V = Color3.toHSV(CDefault)

            local function ApplyColor()
                CurrentColor       = Color3.fromHSV(H, S, V)
                Preview.BackgroundColor3 = CurrentColor
                SetFlag(Flag, CurrentColor)
                Funcs:FireCallback(Callback, CurrentColor)
            end

            -- Hue drag
            HueBar.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        task.wait()
                        local rel = (Player:GetMouse().X - HueBar.AbsolutePosition.X) / HueBar.AbsoluteSize.X
                        H = math.clamp(rel, 0, 1)
                        SVSquare.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
                        ApplyColor()
                    end
                end
            end)

            -- SV drag
            SVSquare.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        task.wait()
                        local mx  = Player:GetMouse()
                        local rx  = (mx.X - SVSquare.AbsolutePosition.X) / SVSquare.AbsoluteSize.X
                        local ry  = (mx.Y - SVSquare.AbsolutePosition.Y) / SVSquare.AbsoluteSize.Y
                        S = math.clamp(rx, 0, 1)
                        V = 1 - math.clamp(ry, 0, 1)
                        ApplyColor()
                    end
                end
            end)

            local PickerOpen = false
            Button.Activated:Connect(function()
                PickerOpen = not PickerOpen
                if PickerOpen then
                    local FPos   = Preview.AbsolutePosition
                    local SSize  = ScreenGui.AbsoluteSize
                    local ClampX = math.clamp(FPos.X / UIScale, 0, SSize.X / UIScale - 170)
                    local ClampY = math.clamp(FPos.Y / UIScale, 0, SSize.Y / UIScale)
                    PickerFrame.Position  = UDim2.fromOffset(ClampX, ClampY)
                    PickerFrame.Size      = UDim2.fromOffset(0, 0)
                    NoClick.Visible       = true
                    CreateTween({ PickerFrame, "Size", UDim2.fromOffset(160, 90), 0.25 })
                else
                    CreateTween({ PickerFrame, "Size", UDim2.fromOffset(0, 0), 0.2, true })
                    NoClick.Visible = false
                end
            end)

            NoClick.MouseButton1Click:Connect(function()
                PickerOpen = false
                CreateTween({ PickerFrame, "Size", UDim2.fromOffset(0, 0), 0.2, true })
                NoClick.Visible = false
            end)
            PickerClose.Activated:Connect(function()
                PickerOpen = false
                CreateTween({ PickerFrame, "Size", UDim2.fromOffset(0, 0), 0.2, true })
                NoClick.Visible = false
            end)

            local ColorPicker = {}
            function ColorPicker:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function ColorPicker:Destroy()    Button:Destroy() end
            function ColorPicker:Set(Val)
                if typeof(Val) == "Color3" then
                    H, S, V = Color3.toHSV(Val)
                    ApplyColor()
                end
            end
            function ColorPicker:Get() return CurrentColor end
            return ColorPicker
        end

        return Tab
    end

    -- Wire topbar buttons
    CloseButton.Activated:Connect(function()    Window:CloseBtn()    end)
    MinimizeButton.Activated:Connect(function() Window:MinimizeBtn() end)

    -- Animate stroke pulse
    task.spawn(function()
        while MainFrame and MainFrame.Parent do
            CreateTween({ OuterStroke, "Transparency", 0.05, 1.2 })
            task.wait(1.2)
            CreateTween({ OuterStroke, "Transparency", 0.45, 1.2 })
            task.wait(1.2)
        end
    end)

    return Window
end

return MyLibrary
