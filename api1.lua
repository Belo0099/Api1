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
    if inst:IsA("Frame")         then return "BackgroundColor3"
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
        Color               = args[1] or Theme["Color Stroke"],
        Thickness           = args[2] or 1.2,
        ApplyStrokeMode = "Border",
        Transparency        = 0.3,
    }), props), "Stroke")
end)

AddEle("Button", function(parent, props, ...)
    local args = { ... }
    local New = InsertTheme(SetProps(Create("TextButton", parent, {
        Text                    = "",
        Size                    = UDim2.fromScale(1, 1),
        BackgroundColor3        = Theme["Color Hub 2"],
        AutoButtonColor         = false,
        BorderSizePixel         = 0,
    }), props), "Frame")

    New.MouseEnter:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0.3, 0.2 })
    end)
    New.MouseLeave:Connect(function()
        CreateTween({ New, "BackgroundTransparency", 0, 0.2 })
    end)
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
--              NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════
local NotifHolder = Create("Frame", ScreenGui, {
    Size                    = UDim2.new(0, 300, 1, 0),
    Position                = UDim2.new(1, -310, 0, 0),
    BackgroundTransparency = 1,
    Name                    = "NotifHolder",
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
        Size                    = UDim2.new(1, 0, 0, 0),
        BackgroundColor3        = Color3.fromRGB(12, 10, 20),
        ClipsDescendants        = true,
        AutomaticSize           = Enum.AutomaticSize.None,
    })
    Make("Corner", Card, UDim.new(0, 10))

    local AccentBar = Create("Frame", Card, {
        Size                   = UDim2.new(0, 3, 1, -16),
        Position               = UDim2.new(0, 8, 0, 8),
        BackgroundColor3 = accentColor,
    })
    Make("Corner", AccentBar, UDim.new(0.5, 0))

    Create("ImageLabel", Card, {
        Size                    = UDim2.new(0, 18, 0, 18),
        Position                = UDim2.new(0, 20, 0, 10),
        Image                   = icon,
        ImageColor3             = accentColor,
        BackgroundTransparency = 1,
    })

    Create("TextLabel", Card, {
        Size                    = UDim2.new(1, -45, 0, 20),
        Position                = UDim2.new(0, 44, 0, 6),
        Text                    = NTitle,
        TextColor3              = Theme["Color Text"],
        Font                    = Enum.Font.GothamBold,
        TextSize                = 11,
        TextXAlignment          = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
    })

    Create("TextLabel", Card, {
        Size                    = UDim2.new(1, -48, 0, 0),
        Position                = UDim2.new(0, 44, 0, 26),
        AutomaticSize           = Enum.AutomaticSize.Y,
        Text                    = NDesc,
        TextColor3              = Theme["Color Dark Text"],
        Font                    = Enum.Font.Gotham,
        TextSize                = 9,
        TextXAlignment          = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextWrapped             = true,
    })

    local ProgressBG = Create("Frame", Card, {
        Size                   = UDim2.new(1, -16, 0, 2),
        Position               = UDim2.new(0, 8, 1, -8),
        BackgroundColor3 = Color3.fromRGB(30, 25, 45),
        AnchorPoint            = Vector2.new(0, 1),
    })
    Make("Corner", ProgressBG, UDim.new(0.5, 0))

    local ProgressBar = Create("Frame", ProgressBG, {
        Size                   = UDim2.fromScale(1, 1),
        BackgroundColor3 = accentColor,
    })
    Make("Corner", ProgressBar, UDim.new(0.5, 0))

    local Stroke = Create("UIStroke", Card, {
        Color                   = accentColor,
        Thickness               = 1,
        Transparency            = 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })

    CreateTween({ Card, "Size", UDim2.new(1, 0, 0, 70), 0.35 })
    CreateTween({ Stroke, "Transparency", 0.3, 0.4 })

    TweenService:Create(ProgressBar, TweenInfo.new(NDur, Enum.EasingStyle.Linear), {
        Size = UDim2.fromScale(0, 1),
    }):Play()

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
        Font                    = Enum.Font.GothamBold,
        TextColor3              = Theme["Color Text"],
        Size                    = UDim2.new(1, -20),
        AutomaticSize           = Enum.AutomaticSize.Y,
        Position                = UDim2.new(0, 0, 0.5),
        AnchorPoint             = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextTruncate            = Enum.TextTruncate.AtEnd,
        TextSize                = 11,
        TextXAlignment          = Enum.TextXAlignment.Left,
        Text                    = "",
        RichText                = true,
    }), "Text")

    local DescL = InsertTheme(Create("TextLabel", {
        Font                    = Enum.Font.Gotham,
        TextColor3              = Theme["Color Dark Text"],
        Size                    = UDim2.new(1, -20),
        AutomaticSize           = Enum.AutomaticSize.Y,
        Position                = UDim2.new(0, 12, 0, 15),
        BackgroundTransparency = 1,
        TextWrapped             = true,
        TextSize                = 9,
        TextXAlignment          = Enum.TextXAlignment.Left,
        Text                    = "",
        RichText                = true,
    }), "DarkText")

    local Frame = Make("Button", Container, {
        Size           = UDim2.new(1, 0, 0, 28),
        AutomaticSize= Enum.AutomaticSize.Y,
        Name           = "Option",
        BorderSizePixel = 0,
    })
    Make("Corner", Frame, UDim.new(0, 8))

    local FrameStroke = Create("UIStroke", Frame, {
        Color                   = Theme["Color Stroke"],
        Thickness               = 0.8,
        Transparency            = 0.7,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
    Frame.MouseEnter:Connect(function()
        CreateTween({ FrameStroke, "Transparency", 0.3, 0.2 })
    end)
    Frame.MouseLeave:Connect(function()
        CreateTween({ FrameStroke, "Transparency", 0.7, 0.2 })
    end)

    local LabelHolder = Create("Frame", Frame, {
        AutomaticSize           = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size                    = HolderSize,
        Position                = UDim2.new(0, 10, 0),
        AnchorPoint             = Vector2.new(0, 0),
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

    local MainFrame = Create("Frame", ScreenGui, {
        Size = UDim2.new(0, MyLibrary.Save.UISize[1], 0, MyLibrary.Save.UISize[2]),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(15, 5, 5),
        BorderSizePixel = 0,
        ClipsDescendants = true,
    })
    Make("Corner", MainFrame, UDim.new(0, 10))
    MakeDrag(MainFrame)
    
    Make("Gradient", MainFrame, {
        Rotation = 45,
    })

    local Sidebar = Create("Frame", MainFrame, {
        Size = UDim2.new(0, MyLibrary.Save.TabSize, 1, 0),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
    })
    InsertTheme(Sidebar, "Frame")
    Make("Corner", Sidebar, UDim.new(0, 10))

    local ProfileFrame = Create("Frame", Sidebar, {
        Size = UDim2.new(1, 0, 0, 65),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
        ZIndex = 5,
    })
    InsertTheme(ProfileFrame, "Frame")
    Make("Corner", ProfileFrame, UDim.new(0, 10))
    
    Create("Frame", ProfileFrame, {
        Size = UDim2.new(1, -20, 0, 1),
        Position = UDim2.new(0, 10, 1, -1),
        BackgroundColor3 = Theme["Color Stroke"],
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        ZIndex = 5,
    })

    local AvatarImg = Create("ImageLabel", ProfileFrame, {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 12, 0, 12),
        Image = "rbxthumb://type=AvatarHeadShot&id="..Player.UserId.."&w=420&h=420",
        BackgroundColor3 = Color3.fromRGB(15, 15, 20),
        ZIndex = 5,
    })
    Make("Corner", AvatarImg, UDim.new(1, 0))

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 20),
        Position = UDim2.new(0, 60, 0, 15),
        Text = WTitle,
        TextColor3 = Theme["Color Text"],
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 5,
    }), "Text")

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 15),
        Position = UDim2.new(0, 60, 0, 35),
        Text = "@" .. Player.Name,
        TextColor3 = Theme["Color Dark Text"],
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 5,
    }), "DarkText")

    local TabContainer = Create("ScrollingFrame", Sidebar, {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme["Color Theme"],
        ZIndex = 1,
        ClipDescendants = true,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    })
    InsertTheme(TabContainer, "ScrollBar")

    Create("UIPadding", TabContainer, {
        PaddingTop = UDim.new(0, 70),
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
    })

    Create("UIListLayout", TabContainer, {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    local ContentContainer = Create("Frame", MainFrame, {
        Size = UDim2.new(1, -(MyLibrary.Save.TabSize + 10), 1, -20),
        Position = UDim2.new(0, MyLibrary.Save.TabSize + 5, 0, 10),
        BackgroundTransparency = 1,
    })

    local WindowObj = {}
    
    function WindowObj:MakeTab(TabConfigs)
        local TTitle = TabConfigs.Name or TabConfigs.Title or "Tab"
        local TIcon  = TabConfigs.Icon or "home"
        
        local TabButton = Create("TextButton", TabContainer, {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Theme["Color Hub 2"],
            Text = "",
            AutoButtonColor = false,
            ZIndex = 1,
        })
        InsertTheme(TabButton, "Frame")
        Make("Corner", TabButton, UDim.new(0, 6))
        
        local TabIcon = Create("ImageLabel", TabButton, {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 10, 0.5, -8),
            Image = MyLibrary:GetIcon(TIcon),
            ImageColor3 = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            ZIndex = 1,
        })
        InsertTheme(TabIcon, "DarkText")
        
        local TabText = InsertTheme(Create("TextLabel", TabButton, {
            Size = UDim2.new(1, -36, 1, 0),
            Position = UDim2.new(0, 32, 0, 0),
            Text = TTitle,
            TextColor3 = Theme["Color Dark Text"],
            Font = Enum.Font.GothamMedium,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            ZIndex = 1,
        }), "DarkText")

        local TabContent = Create("ScrollingFrame", ContentContainer, {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = Theme["Color Theme"],
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
        })
        InsertTheme(TabContent, "ScrollBar")
        
        Create("UIPadding", TabContent, {
            PaddingTop = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 10),
        })

        Create("UIListLayout", TabContent, {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        })

        TabButton.MouseButton1Click:Connect(function()
            for _, child in ipairs(ContentContainer:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            for _, child in ipairs(TabContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = Theme["Color Hub 2"]
                    local img = child:FindFirstChildOfClass("ImageLabel")
                    local txt = child:FindFirstChildOfClass("TextLabel")
                    if img then img.ImageColor3 = Theme["Color Dark Text"] end
                    if txt then txt.TextColor3 = Theme["Color Dark Text"] end
                end
            end
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Theme["Color Theme"]
            TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)

        local TabObj = {}

        function TabObj:AddButton(Configs)
            local BTitle = Configs.Name or Configs.Title or "Button"
            local BDesc  = Configs.Desc or Configs.Description or ""
            local Callback = Funcs:GetCallback(Configs, 1)[1]

            local Frame, Label = ButtonFrame(TabContent, BTitle, BDesc, UDim2.new(1, -24, 1, 0))
            
            Frame.MouseButton1Click:Connect(function()
                pcall(Callback)
            end)

            return Label
        end

        function TabObj:AddToggle(Configs)
            local TTitle = Configs.Name or Configs.Title or "Toggle"
            local TDesc  = Configs.Desc or Configs.Description or ""
            local Default = Configs.Default or false
            local Flag = Configs.Flag
            local Callback = Funcs:GetCallback(Configs, 1)[1]

            if Flag then
                if CheckFlag(Flag) then
                    Default = GetFlag(Flag)
                else
                    SetFlag(Flag, Default)
                end
            end

            local Frame, Label = ButtonFrame(TabContent, TTitle, TDesc, UDim2.new(1, -60, 1, 0))

            local ToggleBG = Create("Frame", Frame, {
                Size = UDim2.new(0, 36, 0, 18),
                Position = UDim2.new(1, -12, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Default and Theme["Color Theme"] or Color3.fromRGB(30, 25, 40),
            })
            Make("Corner", ToggleBG, UDim.new(1, 0))
            if Default then InsertTheme(ToggleBG, "Theme") end

            local ToggleCircle = Create("Frame", ToggleBG, {
                Size = UDim2.new(0, 14, 0, 14),
                Position = Default and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            })
            Make("Corner", ToggleCircle, UDim.new(1, 0))

            local Value = Default

            local function SetState(State)
                Value = State
                if Flag then SetFlag(Flag, Value) end
                CreateTween({ ToggleBG, "BackgroundColor3", Value and Theme["Color Theme"] or Color3.fromRGB(30, 25, 40), 0.2 })
                CreateTween({ ToggleCircle, "Position", Value and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0), 0.2 })
                task.spawn(Callback, Value)
            end

            Frame.MouseButton1Click:Connect(function()
                SetState(not Value)
            end)

            return {
                Set = SetState,
                Value = function() return Value end
            }
        end

        return TabObj
    end

    task.delay(0.1, function()
        local firstTab = TabContainer:FindFirstChildOfClass("TextButton")
        if firstTab then
            for _, conn in pairs(getconnections(firstTab.MouseButton1Click)) do
                conn:Fire()
            end
        end
    end)

    return WindowObj
end

return MyLibrary
