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
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 15)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(120, 0, 0)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(200, 20, 20))
            }),
            ["Color Hub 2"] = Color3.fromRGB(15, 15, 15),
            ["Color Stroke"] = Color3.fromRGB(200, 20, 20),
            ["Color Theme"] = Color3.fromRGB(200, 20, 20),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(160, 160, 160)
        },
    },
    Info = { Version = "1.1.0 VIP" },
    Save = {
        UISize = {620, 420},
        TabSize = 170,
        Theme = "Main"
    },
    Settings = {},
    Connection = {},
    Instances = {},
    Elements = {},
    Options = {},
    Flags = {},
    Tabs = {},
    Icons = (function()
        return {
            ["accessibility"] = "rbxassetid://10709751939",
            ["activity"] = "rbxassetid://10709752035",
            ["airvent"] = "rbxassetid://10709752131",
            ["airplay"] = "rbxassetid://10709752254",
            ["alarmcheck"] = "rbxassetid://10709752405",
            ["alarmclock"] = "rbxassetid://10709752630",
            ["alarmclockoff"] = "rbxassetid://10709752508",
            ["alarmminus"] = "rbxassetid://10709752732",
            ["alarmplus"] = "rbxassetid://10709752825",
            ["album"] = "rbxassetid://10709752906",
            ["alertcircle"] = "rbxassetid://10709752996",
            ["alertoctagon"] = "rbxassetid://10709753064",
            ["alerttriangle"] = "rbxassetid://10709753149",
            ["anchor"] = "rbxassetid://10709761530",
            ["angry"] = "rbxassetid://10709761629",
            ["annoyed"] = "rbxassetid://10709761722",
            ["aperture"] = "rbxassetid://10709761813",
            ["apple"] = "rbxassetid://10709761889",
            ["archive"] = "rbxassetid://10709762233",
            ["arrowdown"] = "rbxassetid://10709767827",
            ["arrowleft"] = "rbxassetid://10709768114",
            ["arrowright"] = "rbxassetid://10709768347",
            ["arrowup"] = "rbxassetid://10709768939",
            ["award"] = "rbxassetid://10709769406",
            ["bell"] = "rbxassetid://10709775704",
            ["bellring"] = "rbxassetid://10709775560",
            ["bot"] = "rbxassetid://10709782230",
            ["calendar"] = "rbxassetid://10709789505",
            ["camera"] = "rbxassetid://10709789686",
            ["check"] = "rbxassetid://10709790644",
            ["checkcircle"] = "rbxassetid://10709790387",
            ["chevrondown"] = "rbxassetid://10709790948",
            ["chevronleft"] = "rbxassetid://10709791281",
            ["chevronright"] = "rbxassetid://10709791437",
            ["chevronup"] = "rbxassetid://10709791523",
            ["clock"] = "rbxassetid://10709805144",
            ["code"] = "rbxassetid://10709810463",
            ["cog"] = "rbxassetid://10709810948",
            ["coins"] = "rbxassetid://10709811110",
            ["crown"] = "rbxassetid://10709818626",
            ["database"] = "rbxassetid://10709818996",
            ["diamond"] = "rbxassetid://10709819149",
            ["download"] = "rbxassetid://10723344270",
            ["edit"] = "rbxassetid://10734883598",
            ["eye"] = "rbxassetid://10723346959",
            ["eyeoff"] = "rbxassetid://10723346871",
            ["file"] = "rbxassetid://10723374641",
            ["flag"] = "rbxassetid://10723375890",
            ["flame"] = "rbxassetid://10723376114",
            ["folder"] = "rbxassetid://10723387563",
            ["gem"] = "rbxassetid://10723396000",
            ["ghost"] = "rbxassetid://10723396107",
            ["gift"] = "rbxassetid://10723396402",
            ["globe"] = "rbxassetid://10723404337",
            ["heart"] = "rbxassetid://10723406885",
            ["home"] = "rbxassetid://10723407389",
            ["info"] = "rbxassetid://10723415903",
            ["key"] = "rbxassetid://10723416652",
            ["layers"] = "rbxassetid://10723424505",
            ["lightbulb"] = "rbxassetid://10723425852",
            ["lock"] = "rbxassetid://10723434711",
            ["mail"] = "rbxassetid://10734885430",
            ["map"] = "rbxassetid://10734886202",
            ["medal"] = "rbxassetid://10734887072",
            ["mic"] = "rbxassetid://10734888864",
            ["minus"] = "rbxassetid://10734896206",
            ["moon"] = "rbxassetid://10734897102",
            ["music"] = "rbxassetid://10734905958",
            ["package"] = "rbxassetid://10734909540",
            ["pencil"] = "rbxassetid://10734919691",
            ["phone"] = "rbxassetid://10734921524",
            ["plus"] = "rbxassetid://10734924532",
            ["power"] = "rbxassetid://10734930466",
            ["rocket"] = "rbxassetid://10734934585",
            ["save"] = "rbxassetid://10734941499",
            ["search"] = "rbxassetid://10734943674",
            ["settings"] = "rbxassetid://10734950309",
            ["shield"] = "rbxassetid://10734951847",
            ["shieldcheck"] = "rbxassetid://10734951367",
            ["star"] = "rbxassetid://10734966248",
            ["sun"] = "rbxassetid://10734974297",
            ["sword"] = "rbxassetid://10734975486",
            ["swords"] = "rbxassetid://10734975692",
            ["target"] = "rbxassetid://10734977012",
            ["terminal"] = "rbxassetid://10734982144",
            ["trash"] = "rbxassetid://10747362393",
            ["trophy"] = "rbxassetid://10747363809",
            ["unlock"] = "rbxassetid://10747366027",
            ["upload"] = "rbxassetid://10747366434",
            ["user"] = "rbxassetid://10747373176",
            ["users"] = "rbxassetid://10747373426",
            ["verified"] = "rbxassetid://10747374131",
            ["video"] = "rbxassetid://10747374938",
            ["volume"] = "rbxassetid://10747376008",
            ["wallet"] = "rbxassetid://10747376205",
            ["wifi"] = "rbxassetid://10747382504",
            ["x"] = "rbxassetid://10747384394",
            ["xcircle"] = "rbxassetid://10747383819",
            ["zoomin"] = "rbxassetid://10747384552",
            ["zoomout"] = "rbxassetid://10747384679",
            ["bomb"] = "rbxassetid://10709781460",
            ["bug"] = "rbxassetid://10709782845",
            ["coffee"] = "rbxassetid://10709810814",
            ["compass"] = "rbxassetid://10709811445",
            ["gamepad"] = "rbxassetid://10723395457",
            ["gauge"] = "rbxassetid://10723395708",
            ["hammer"] = "rbxassetid://10723405360",
            ["headphones"] = "rbxassetid://10723406165",
            ["joystick"] = "rbxassetid://10723416527",
            ["paintbrush"] = "rbxassetid://10734910187",
            ["pizza"] = "rbxassetid://10734922774",
            ["plane"] = "rbxassetid://10734922971",
            ["printer"] = "rbxassetid://10734930632",
            ["skull"] = "rbxassetid://10734962068",
            ["smile"] = "rbxassetid://10734964441",
            ["snowflake"] = "rbxassetid://10734964600",
            ["thumbsup"] = "rbxassetid://10734983629",
            ["timer"] = "rbxassetid://10734984606",
            ["train"] = "rbxassetid://10747362105",
            ["truck"] = "rbxassetid://10747364031",
            ["tv"] = "rbxassetid://10747364593",
            ["umbrella"] = "rbxassetid://10747364971",
            ["wand"] = "rbxassetid://10747376565",
            ["watch"] = "rbxassetid://10747376722",
            ["wind"] = "rbxassetid://10747382750",
            ["wrench"] = "rbxassetid://10747383470",
            ["zap"] = "rbxassetid://10723345749",
        }
    end)()
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450
local Settings = MyLibrary.Settings
local Flags = MyLibrary.Flags

local SetProps, SetChildren, InsertTheme, Create do
    InsertTheme = function(Instance, Type)
        table.insert(MyLibrary.Instances, { Instance = Instance, Type = Type })
        return Instance
    end
    SetChildren = function(Instance, Children)
        if Children then
            for _, Child in ipairs(Children) do
                Child.Parent = Instance
            end
        end
        return Instance
    end
    SetProps = function(Instance, Props)
        if Props then
            for prop, value in pairs(Props) do
                Instance[prop] = value
            end
        end
        return Instance
    end
    Create = function(...)
        local args = {...}
        if type(args) ~= "table" then return end
        local new = Instance.new(args[1])
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
    local function Save(file)
        if readfile and isfile and isfile(file) then
            local ok, decode = pcall(function()
                return HttpService:JSONDecode(readfile(file))
            end)
            if ok and type(decode) == "table" then
                if rawget(decode, "UISize") then MyLibrary.Save["UISize"] = decode["UISize"] end
                if rawget(decode, "TabSize") then MyLibrary.Save["TabSize"] = decode["TabSize"] end
            end
        end
    end
    pcall(Save, "redz_library.json")
end

local Funcs = {}
do
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
    function Funcs:ToggleParent(Obj, Bool, Parent)
        if Bool ~= nil then
            Obj.Parent = Bool and Parent or nil
        else
            Obj.Parent = Obj.Parent and nil or Parent
        end
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
    function Funcs:GetCallback(Configs, index)
        local func = Configs[index] or Configs.Callback or function() end
        if type(func) == "table" then
            return {function(Value) func[1][func[2]] = Value end}
        end
        return {func}
    end
end

local Connections, Connection = {}, MyLibrary.Connection
do
    local function NewConnectionList(List)
        if type(List) ~= "table" then return end
        for _, CoName in ipairs(List) do
            local ConnectedFuncs, Connect = {}, {}
            Connection[CoName] = Connect
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
                    local _NFunc
                    _NFunc = function(...)
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
    NewConnectionList({"FlagsChanged","ThemeChanged","FileSaved","ThemeChanging","OptionAdded"})
end

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
            db = true
            task.wait(0.1)
            db = false
            local ok, Encoded = pcall(function() return HttpService:JSONEncode(Flags) end)
            if ok then
                local s = pcall(writefile, ScriptFile, Encoded)
                if s then Connection:FireConnection("FileSaved","Script-Flags",ScriptFile,Encoded) end
            end
        end
    end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {
    Name = "redz_Library_VIP",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, {
    Create("UIScale", { Scale = UIScale, Name = "Scale" })
})

do
    local existing = CoreGui:FindFirstChild("redz_Library_VIP")
    if existing and existing ~= ScreenGui then existing:Destroy() end
end

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

-- FIX PRINCIPAL: usar nome diferente para evitar conflito com TweenInfo global
local function CreateTween(Configs)
    local Inst     = Configs[1] or Configs.Instance
    local Prop     = Configs[2] or Configs.Prop
    local NewVal   = Configs[3] or Configs.NewVal
    local Time     = Configs[4] or Configs.Time or 0.5
    local TWait    = Configs[5] or Configs.wait or false
    local twInfo   = TweenInfo.new(Time, Enum.EasingStyle.Quint)
    local Tween    = TweenService:Create(Inst, twInfo, {[Prop] = NewVal})
    Tween:Play()
    if TWait then Tween.Completed:Wait() end
    return Tween
end

local function MakeDrag(inst)
    task.spawn(function()
        SetProps(inst, { Active = true, AutoButtonColor = false })
        local DragStart, StartPos, InputOn
        local function Update(Input)
            local delta = Input.Position - DragStart
            local Position = UDim2.new(
                StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale,
                StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale
            )
            CreateTween({inst, "Position", Position, 0.25})
        end
        inst.MouseButton1Down:Connect(function() InputOn = true end)
        inst.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then
                StartPos  = inst.Position
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

local function VerifyTheme(t)
    for name in pairs(MyLibrary.Themes) do
        if name == t then return true end
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
    if inst:IsA("Frame") then return "BackgroundColor3"
    elseif inst:IsA("ImageLabel") then return "ImageColor3"
    elseif inst:IsA("TextLabel") then return "TextColor3"
    elseif inst:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
    elseif inst:IsA("UIStroke") then return "Color"
    end
    return ""
end

local AddEle, Make
do
    AddEle = function(Name, Func) MyLibrary.Elements[Name] = Func end
    Make   = function(Ele, inst, props, ...)
        return MyLibrary.Elements[Ele](inst, props, ...)
    end
end

AddEle("Corner", function(parent, CornerRadius)
    return Create("UICorner", parent, { CornerRadius = CornerRadius or UDim.new(0, 7) })
end)

AddEle("Stroke", function(parent, props, ...)
    local args = {...}
    return InsertTheme(SetProps(Create("UIStroke", parent, {
        Color = args[1] or Theme["Color Stroke"],
        Thickness = args[2] or 1,
        ApplyStrokeMode = "Border"
    }), props), "Stroke")
end)

AddEle("Button", function(parent, props, ...)
    local args = {...}
    local New = InsertTheme(SetProps(Create("TextButton", parent, {
        Text = "",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme["Color Hub 2"],
        AutoButtonColor = false
    }), props), "Frame")
    New.MouseEnter:Connect(function() New.BackgroundTransparency = 0.4 end)
    New.MouseLeave:Connect(function() New.BackgroundTransparency = 0 end)
    if args[1] then New.Activated:Connect(args[1]) end
    return New
end)

AddEle("Gradient", function(parent, props)
    return InsertTheme(SetProps(Create("UIGradient", parent, {
        Color = Theme["Color Hub 1"]
    }), props), "Gradient")
end)

local function ButtonFrame(Container, Title, Description, HolderSize)
    local TitleL = InsertTheme(Create("TextLabel", {
        Font = Enum.Font.FredokaOne,
        TextColor3 = Theme["Color Text"],
        Size = UDim2.new(1, -20),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.new(0, 0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = "",
        RichText = true
    }), "Text")

    local DescL = InsertTheme(Create("TextLabel", {
        Font = Enum.Font.Gotham,
        TextColor3 = Theme["Color Dark Text"],
        Size = UDim2.new(1, -20),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.new(0, 12, 0, 15),
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextSize = 8,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = "",
        RichText = true
    }), "DarkText")

    local Frame = Make("Button", Container, {
        Size = UDim2.new(1, 0, 0, 25),
        AutomaticSize = Enum.AutomaticSize.Y,
        Name = "Option"
    })
    Make("Corner", Frame, UDim.new(0, 6))

    local LabelHolder = Create("Frame", Frame, {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size = HolderSize,
        Position = UDim2.new(0, 10, 0),
        AnchorPoint = Vector2.new(0, 0)
    }, {
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 2)
        }),
        Create("UIPadding", {
            PaddingBottom = UDim.new(0, 5),
            PaddingTop = UDim.new(0, 5)
        }),
        TitleL,
        DescL,
    })

    local Label = {}
    function Label:SetTitle(NewTitle)
        if type(NewTitle) == "string" and #NewTitle:gsub(" ","") > 0 then
            TitleL.Text = NewTitle
        end
    end
    function Label:SetDesc(NewDesc)
        if type(NewDesc) == "string" and #NewDesc:gsub(" ","") > 0 then
            DescL.Visible = true
            DescL.Text = NewDesc
            LabelHolder.Position   = UDim2.new(0, 10, 0)
            LabelHolder.AnchorPoint = Vector2.new(0, 0)
        else
            DescL.Visible = false
            DescL.Text = ""
            LabelHolder.Position   = UDim2.new(0, 10, 0.5)
            LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
        end
    end
    Label:SetTitle(Title)
    Label:SetDesc(Description)
    return Frame, Label
end

function MyLibrary:GetIcon(index)
    if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then return index end
    local firstMatch = nil
    index = string.lower(index):gsub("lucide",""):gsub("-","")
    for Name, Icon in pairs(self.Icons) do
        local n = Name:gsub("lucide",""):gsub("-","")
        if n == index then return Icon end
        if not firstMatch and n:find(index, 1, true) then firstMatch = Icon end
    end
    return firstMatch or index
end

function MyLibrary:SetTheme(NewTheme)
    if not VerifyTheme(NewTheme) then return end
    MyLibrary.Save.Theme = NewTheme
    SaveJson("redz_library.json", MyLibrary.Save)
    Theme = MyLibrary.Themes[NewTheme]
    Connection:FireConnection("ThemeChanged", NewTheme)
    for _, Val in ipairs(MyLibrary.Instances) do
        pcall(function()
            if Val.Type == "Gradient" then Val.Instance.Color = Theme["Color Hub 1"]
            elseif Val.Type == "Frame" then Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
            elseif Val.Type == "Stroke" then Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
            elseif Val.Type == "Theme" then Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
            elseif Val.Type == "Text" then Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
            elseif Val.Type == "DarkText" then Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
            elseif Val.Type == "ScrollBar" then Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
            end
        end)
    end
end

function MyLibrary:SetScale(NewScale)
    NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
    UIScale = NewScale
    ScreenGui.Scale.Scale = NewScale
end

function MyLibrary:MakeWindow(Configs)
    local WTitle    = Configs[1] or Configs.Name or Configs.Title or "VIP Panel"
    local WMiniText = Configs[2] or Configs.SubTitle or "Premium Edition"
    Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false

    -- Carregar flags salvas
    local function LoadFile()
        local File = Settings.ScriptFile
        if type(File) ~= "string" then return end
        if not readfile or not isfile then return end
        local s, r = pcall(isfile, File)
        if s and r then
            local s2, _Flags = pcall(readfile, File)
            if s2 and type(_Flags) == "string" then
                local s3, r3 = pcall(function() return HttpService:JSONDecode(_Flags) end)
                if s3 then Flags = r3 or {} end
            end
        end
    end
    LoadFile()

    local UISizeX, UISizeY = unpack(MyLibrary.Save.UISize)

    -- ════════════════════════════════
    --  MAIN FRAME
    -- ════════════════════════════════
    local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
        Size     = UDim2.fromOffset(UISizeX, UISizeY),
        Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
        BackgroundTransparency = 0.03,
        Name = "Hub",
        AutoButtonColor = false,
    }), "Main")
    Make("Gradient", MainFrame, { Rotation = 45 })
    MakeDrag(MainFrame)
    local MainCorner = Make("Corner", MainFrame)

    local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })

    -- ════════════════════════════════
    --  TOP BAR (título + botões)
    -- ════════════════════════════════
    local TopBar = Create("Frame", MainFrame, {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Name = "TopBar",
        ZIndex = 10,
    })

    InsertTheme(Create("TextLabel", TopBar, {
        Position = UDim2.new(0, 15, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        Text = WTitle,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = 12,
        TextColor3 = Theme["Color Text"],
        BackgroundTransparency = 1,
        Font = Enum.Font.BuilderSansBold,
        Name = "Title",
        ZIndex = 10,
    }), "Text")

    -- Linha separadora abaixo do TopBar
    Create("Frame", MainFrame, {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 28),
        BackgroundColor3 = Theme["Color Stroke"],
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 5,
    })

    -- Botão Fechar
    local CloseButton = Create("ImageButton", TopBar, {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(1, -10, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10747384394",
        AutoButtonColor = false,
        Name = "Close",
        ZIndex = 10,
    })

    -- Botão Minimizar
    local MinimizeButton = Create("ImageButton", TopBar, {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(1, -35, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734896206",
        AutoButtonColor = false,
        Name = "Minimize",
        ZIndex = 10,
    })

    -- ════════════════════════════════
    --  SIDEBAR
    -- ════════════════════════════════
    local Sidebar = InsertTheme(Create("Frame", MainFrame, {
        Size = UDim2.new(0, MyLibrary.Save.TabSize, 1, -29),
        Position = UDim2.new(0, 0, 0, 29),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
        Name = "Sidebar",
        ZIndex = 2,
    }), "Frame")
    Make("Corner", Sidebar, UDim.new(0, 8))

    -- Perfil (avatar + nome) — 8px abaixo do topo da sidebar
    local ProfileFrame = InsertTheme(Create("Frame", Sidebar, {
        Size = UDim2.new(1, 0, 0, 66),
        Position = UDim2.new(0, 0, 0, 6),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
        ZIndex = 3,
        Name = "Profile",
    }), "Frame")

    local AvatarImg = Create("ImageLabel", ProfileFrame, {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 10, 0, 8),
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=420&h=420",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        ZIndex = 4,
    })
    Make("Corner", AvatarImg, UDim.new(1, 0))

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 18),
        Position = UDim2.new(0, 58, 0, 10),
        Text = WTitle,
        TextColor3 = Theme["Color Text"],
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 4,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }), "Text")

    InsertTheme(Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 14),
        Position = UDim2.new(0, 58, 0, 30),
        Text = "@" .. Player.Name,
        TextColor3 = Theme["Color Dark Text"],
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 4,
    }), "DarkText")

    -- Linha divisória abaixo do perfil
    Create("Frame", Sidebar, {
        Size = UDim2.new(1, -16, 0, 1),
        Position = UDim2.new(0, 8, 0, 78),
        BackgroundColor3 = Theme["Color Stroke"],
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 3,
    })

    -- Tabs scroll (começa após linha)
    local TabContainer = InsertTheme(Create("ScrollingFrame", Sidebar, {
        Size = UDim2.new(1, 0, 1, -88),
        Position = UDim2.new(0, 0, 0, 88),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme["Color Theme"],
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 2,
    }), "ScrollBar")

    Create("UIPadding", TabContainer, {
        PaddingTop    = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
        PaddingLeft   = UDim.new(0, 8),
        PaddingRight  = UDim.new(0, 8),
    })
    Create("UIListLayout", TabContainer, {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0, 5),
    })

    -- ════════════════════════════════
    --  CONTENT (direita)
    -- ════════════════════════════════
    local ContentContainer = Create("Frame", MainFrame, {
        Size     = UDim2.new(1, -(MyLibrary.Save.TabSize + 8), 1, -34),
        Position = UDim2.new(0, MyLibrary.Save.TabSize + 6, 0, 32),
        BackgroundTransparency = 1,
        Name = "Content",
    })

    -- ════════════════════════════════
    --  RESIZE HANDLES
    -- ════════════════════════════════
    local ControlSize1 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.fromOffset(UISizeX, UISizeY),
        Active = true,
        AnchorPoint = Vector2.new(0.8, 0.8),
        BackgroundTransparency = 1,
        Name = "Control Hub Size",
        AutoButtonColor = false,
    }))
    local ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
        Size = UDim2.new(0, 20, 1, -30),
        Position = UDim2.new(0, MyLibrary.Save.TabSize, 1, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        Active = true,
        BackgroundTransparency = 1,
        Name = "Control Tab Size",
        AutoButtonColor = false,
    }))

    local function ControlSize()
        local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
        ControlSize1.Position = UDim2.fromOffset(
            math.clamp(Pos1.X.Offset, 430, 1000),
            math.clamp(Pos1.Y.Offset, 200, 500)
        )
        ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 135, 250), 1, 0)
        local tabW = ControlSize2.Position.X.Offset
        Sidebar.Size           = UDim2.new(0, tabW, 1, -29)
        ContentContainer.Size  = UDim2.new(1, -(tabW + 8), 1, -34)
        ContentContainer.Position = UDim2.new(0, tabW + 6, 0, 32)
        MainFrame.Size         = ControlSize1.Position
    end

    ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)

    local Minimized, SaveSize
    ConnectSave(ControlSize1, function()
        if not Minimized then
            MyLibrary.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
            SaveJson("redz_library.json", MyLibrary.Save)
        end
    end)
    ConnectSave(ControlSize2, function()
        MyLibrary.Save.TabSize = Sidebar.Size.X.Offset
        SaveJson("redz_library.json", MyLibrary.Save)
    end)

    -- ════════════════════════════════
    --  WINDOW OBJECT
    -- ════════════════════════════════
    local Window = {}
    local FirstTab = false
    local WaitClick = false

    function Window:CloseBtn()
        Window:Dialog({
            Title = "Close",
            Text  = "Do you really want to close the UI?",
            Options = {
                {"Confirm", function() ScreenGui:Destroy() end},
                {"Cancel"}
            }
        })
    end

    function Window:MinimizeBtn()
        if WaitClick then return end
        WaitClick = true
        if Minimized then
            MinimizeButton.Image = "rbxassetid://10734896206"
            CreateTween({MainFrame, "Size", SaveSize, 0.25, true})
            ControlSize1.Visible = true
            ControlSize2.Visible = true
            Minimized = false
        else
            MinimizeButton.Image = "rbxassetid://10734924532"
            SaveSize = MainFrame.Size
            ControlSize1.Visible = false
            ControlSize2.Visible = false
            CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 28), 0.25, true})
            Minimized = true
        end
        WaitClick = false
    end

    function Window:Minimize()
        MainFrame.Visible = not MainFrame.Visible
    end

    function Window:Set(Val1, Val2)
        -- atualiza título se necessário
    end

    function Window:Dialog(Configs)
        if MainFrame:FindFirstChild("Dialog") then return end
        if Minimized then Window:MinimizeBtn() end
        local DTitle   = Configs[1] or Configs.Title   or "Dialog"
        local DText    = Configs[2] or Configs.Text    or "This is a Dialog"
        local DOptions = Configs[3] or Configs.Options or {}

        local Frame = Create("Frame", nil, {
            Active      = true,
            Size        = UDim2.fromOffset(270, 162),
            Position    = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            InsertTheme(Create("TextLabel", {
                Font = Enum.Font.GothamBold,
                Size = UDim2.new(1, 0, 0, 20),
                Text = DTitle,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Theme["Color Text"],
                TextSize = 15,
                Position = UDim2.fromOffset(15, 5),
                BackgroundTransparency = 1
            }), "Text"),
            InsertTheme(Create("TextLabel", {
                Font = Enum.Font.GothamMedium,
                Size = UDim2.new(1, -25),
                AutomaticSize = Enum.AutomaticSize.Y,
                Text = DText,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Theme["Color Dark Text"],
                TextSize = 12,
                Position = UDim2.fromOffset(15, 25),
                BackgroundTransparency = 1,
                TextWrapped = true
            }), "DarkText"),
        })
        Make("Gradient", Frame, {Rotation = 270})
        Make("Corner", Frame)

        local ButtonsHolder = Create("Frame", Frame, {
            Size = UDim2.fromScale(1, 0.35),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundTransparency = 1,
        }, {
            Create("UIListLayout", {
                Padding = UDim.new(0, 10),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            })
        })

        local Screen = InsertTheme(Create("Frame", MainFrame, {
            BackgroundTransparency = 0.6,
            Active = true,
            BackgroundColor3 = Theme["Color Stroke"],
            Size = UDim2.new(1, 0, 1, 0),
            Name = "Dialog",
        }), "Stroke")
        MainCorner:Clone().Parent = Screen
        Frame.Parent = Screen

        CreateTween({Screen, "BackgroundTransparency", 0.75, 0.15})

        local ButtonCount = 1
        local Dialog = {}

        function Dialog:Button(BConfigs)
            local BName     = BConfigs[1] or BConfigs.Name or ""
            local BCallback = BConfigs[2] or BConfigs.Callback or function() end
            ButtonCount = ButtonCount + 1
            local Btn = Make("Button", ButtonsHolder)
            Make("Corner", Btn)
            SetProps(Btn, {
                Text = BName,
                Font = Enum.Font.GothamBold,
                TextColor3 = Theme["Color Text"],
                TextSize = 12,
            })
            for _, B in pairs(ButtonsHolder:GetChildren()) do
                if B:IsA("TextButton") then
                    B.Size = UDim2.new(1/ButtonCount, -(((ButtonCount-1)*20)/ButtonCount), 0, 32)
                end
            end
            Btn.Activated:Connect(function() Dialog:Close() end)
            Btn.Activated:Connect(BCallback)
        end

        function Dialog:Close()
            CreateTween({Screen, "BackgroundTransparency", 1, 0.15, true})
            Screen:Destroy()
        end

        for _, Btn in ipairs(DOptions) do Dialog:Button(Btn) end
        return Dialog
    end

    function Window:SelectTab(TabSelect)
        if type(TabSelect) == "number" then
            if MyLibrary.Tabs[TabSelect] then
                MyLibrary.Tabs[TabSelect].func:Enable()
            end
        else
            for _, Tab in pairs(MyLibrary.Tabs) do
                if Tab.Cont == TabSelect.Cont then Tab.func:Enable() end
            end
        end
    end

    -- ════════════════════════════════
    --  MAKE TAB
    -- ════════════════════════════════
    local ContainerList = {}

    function Window:MakeTab(paste, Configs)
        if type(paste) == "table" then Configs = paste end
        local TName = Configs[1] or Configs.Title or Configs.Name or "Tab"
        local TIcon = Configs[2] or Configs.Icon or ""
        TIcon = MyLibrary:GetIcon(TIcon)
        if not TIcon or not TIcon:find("rbxassetid://")
        or #TIcon:gsub("rbxassetid://","") < 6 then
            TIcon = false
        end

        local TabSelect = Make("Button", TabContainer, {
            Size = UDim2.new(1, 0, 0, 30)
        })
        Make("Corner", TabSelect, UDim.new(0, 6))

        local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, 8, 0.5, -7),
            Image = TIcon or "",
            ImageColor3 = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            ZIndex = 2,
        }), "DarkText")

        local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
            Size = UDim2.new(1, TIcon and -28 or -14, 1, 0),
            Position = UDim2.fromOffset(TIcon and 28 or 14, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamMedium,
            Text = TName,
            TextColor3 = Theme["Color Dark Text"],
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 2,
        }), "DarkText")

        local Selected = InsertTheme(Create("Frame", TabSelect, {
            Size = UDim2.new(0, 3, 0, 4),
            Position = UDim2.new(0, 1, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Theme["Color Theme"],
            BackgroundTransparency = 1,
            ZIndex = 2,
        }), "Theme")
        Make("Corner", Selected, UDim.new(0.5, 0))

        local Container = InsertTheme(Create("ScrollingFrame", nil, {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 1.5,
            ScrollBarImageTransparency = 0.2,
            ScrollBarImageColor3 = Theme["Color Theme"],
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            CanvasSize = UDim2.new(),
            Name = ("Container_%i_%s"):format(#ContainerList + 1, TName),
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

        local function ActivateTab()
            if Container.Parent == ContentContainer then return end
            for _, Frame in pairs(ContainerList) do
                if Frame:IsA("ScrollingFrame") and Frame ~= Container then
                    Frame.Parent = nil
                end
            end
            Container.Parent = ContentContainer

            -- Reset todas as tabs
            for _, child in ipairs(TabContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    CreateTween({child, "BackgroundColor3", Theme["Color Hub 2"], 0.2})
                    local img = child:FindFirstChildOfClass("ImageLabel")
                    local txt = child:FindFirstChildOfClass("TextLabel")
                    local sel = child:FindFirstChildOfClass("Frame")
                    if img then CreateTween({img, "ImageColor3", Theme["Color Dark Text"], 0.2}) end
                    if txt then CreateTween({txt, "TextColor3", Theme["Color Dark Text"], 0.2}) end
                    if sel then
                        CreateTween({sel, "Size", UDim2.new(0, 3, 0, 4), 0.2})
                        CreateTween({sel, "BackgroundTransparency", 1, 0.2})
                    end
                end
            end

            for _, Tab in pairs(MyLibrary.Tabs) do
                if Tab.Cont ~= Container then Tab.func:Disable() end
            end

            -- Ativar esta tab
            CreateTween({TabSelect, "BackgroundColor3", Color3.fromRGB(30, 10, 10), 0.2})
            CreateTween({LabelIcon, "ImageColor3", Theme["Color Theme"], 0.2})
            CreateTween({LabelTitle, "TextColor3", Color3.fromRGB(255, 255, 255), 0.2})
            CreateTween({Selected, "Size", UDim2.new(0, 3, 0, 14), 0.2})
            CreateTween({Selected, "BackgroundTransparency", 0, 0.2})
        end

        TabSelect.Activated:Connect(ActivateTab)
        FirstTab = true

        local Tab = {}
        table.insert(MyLibrary.Tabs, {
            TabInfo = {Name = TName, Icon = TIcon},
            func = Tab,
            Cont = Container
        })
        Tab.Cont = Container

        function Tab:Disable()
            Container.Parent = nil
        end
        function Tab:Enable()
            ActivateTab()
        end
        function Tab:Visible(Bool)
            Funcs:ToggleVisible(TabSelect, Bool)
            Funcs:ToggleParent(Container, Bool, ContentContainer)
        end
        function Tab:Destroy()
            TabSelect:Destroy()
            Container:Destroy()
        end

        function Tab:AddSection(Configs)
            local SectionName = type(Configs) == "string" and Configs
                or Configs[1] or Configs.Name or Configs.Title or Configs.Section or "Section"
            local SectionFrame = Create("Frame", Container, {
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Name = "Option",
            })
            local SectionLabel = InsertTheme(Create("TextLabel", SectionFrame, {
                Font = Enum.Font.BuilderSansExtraBold,
                Text = SectionName,
                TextColor3 = Theme["Color Text"],
                Size = UDim2.new(1, -25, 1, 0),
                Position = UDim2.new(0, 5),
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left,
            }), "Text")
            local Section = {}
            table.insert(MyLibrary.Options, {type="Section", Name=SectionName, func=Section})
            function Section:Visible(Bool)
                if Bool == nil then SectionFrame.Visible = not SectionFrame.Visible; return end
                SectionFrame.Visible = Bool
            end
            function Section:Destroy() SectionFrame:Destroy() end
            function Section:Set(New) if New then SectionLabel.Text = GetStr(New) end end
            return Section
        end

        function Tab:AddParagraph(Configs)
            local PName = Configs[1] or Configs.Title or "Paragraph"
            local PDesc = Configs[2] or Configs.Text  or ""
            local Frame, LabelFunc = ButtonFrame(Container, PName, PDesc, UDim2.new(1, -20))
            local Paragraph = {}
            function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
            function Paragraph:Destroy() Frame:Destroy() end
            function Paragraph:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
            function Paragraph:SetDesc(Val)  LabelFunc:SetDesc(GetStr(Val)) end
            function Paragraph:Set(Val1, Val2)
                if Val1 and Val2 then LabelFunc:SetTitle(GetStr(Val1)); LabelFunc:SetDesc(GetStr(Val2))
                elseif Val1 then LabelFunc:SetDesc(GetStr(Val1)) end
            end
            return Paragraph
        end

        function Tab:AddButton(Configs)
            local BName        = Configs[1] or Configs.Name or Configs.Title or "Button"
            local BDescription = Configs.Desc or Configs.Description or ""
            local Callback     = Funcs:GetCallback(Configs, 2)
            local FButton, LabelFunc = ButtonFrame(Container, BName, BDescription, UDim2.new(1, -20))
            Create("ImageLabel", FButton, {
                Size = UDim2.new(0, 14, 0, 14),
                Position = UDim2.new(1, -10, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10734973999",
            })
            FButton.Activated:Connect(function() Funcs:FireCallback(Callback) end)
            local Button = {}
            function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
            function Button:Destroy() FButton:Destroy() end
            function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
            function Button:Set(Val1, Val2)
                if type(Val1)=="string" and type(Val2)=="string" then LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
                elseif type(Val1)=="string" then LabelFunc:SetTitle(Val1)
                elseif type(Val1)=="function" then Callback = {Val1} end
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

            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
            local ToggleHolder = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 35, 0, 18),
                Position = UDim2.new(1, -10, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", ToggleHolder, UDim.new(0.5, 0))

            local Slider = Create("Frame", ToggleHolder, {
                BackgroundTransparency = 1,
                Size = UDim2.new(0.8, 0, 0.8, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
            })
            local ToggleDot = InsertTheme(Create("Frame", Slider, {
                Size = UDim2.new(0, 12, 0, 12),
                Position = UDim2.new(0, 0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Theme["Color Theme"],
            }), "Theme")
            Make("Corner", ToggleDot, UDim.new(0.5, 0))

            local WaitToggle = false
            local function SetToggle(Val)
                if WaitToggle then return end
                WaitToggle = true
                Default = Val
                SetFlag(Flag, Default)
                Funcs:FireCallback(Callback, Default)
                if Default then
                    CreateTween({ToggleDot, "Position", UDim2.new(1, 0, 0.5), 0.25})
                    CreateTween({ToggleDot, "BackgroundTransparency", 0, 0.25})
                    CreateTween({ToggleDot, "AnchorPoint", Vector2.new(1, 0.5), 0.25})
                else
                    CreateTween({ToggleDot, "Position", UDim2.new(0, 0, 0.5), 0.25})
                    CreateTween({ToggleDot, "BackgroundTransparency", 0.8, 0.25})
                    CreateTween({ToggleDot, "AnchorPoint", Vector2.new(0, 0.5), 0.25})
                end
                WaitToggle = false
            end
            task.spawn(SetToggle, Default)
            Button.Activated:Connect(function() SetToggle(not Default) end)

            local ToggleObj = {}
            function ToggleObj:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function ToggleObj:Destroy() Button:Destroy() end
            function ToggleObj:Callback(...) Funcs:InsertCallback(Callback, ...)() end
            function ToggleObj:Set(Val1, Val2)
                if type(Val1)=="string" and type(Val2)=="string" then LabelFunc:SetTitle(Val1); LabelFunc:SetDesc(Val2)
                elseif type(Val1)=="string" then LabelFunc:SetTitle(Val1)
                elseif type(Val1)=="boolean" then
                    if WaitToggle and Val2 then repeat task.wait() until not WaitToggle end
                    task.spawn(SetToggle, Val1)
                elseif type(Val1)=="function" then Callback = {Val1} end
            end
            return ToggleObj
        end

        function Tab:AddDropdown(Configs)
            local DName       = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
            local DDesc       = Configs.Desc or Configs.Description or ""
            local DOptions    = Configs[2] or Configs.Options or {}
            local OpDefault   = Configs[3] or Configs.Default or {}
            local Flag        = Configs[5] or Configs.Flag or false
            local DMulti      = Configs.MultiSelect or false
            local Callback    = Funcs:GetCallback(Configs, 4)

            local Button, LabelFunc = ButtonFrame(Container, DName, DDesc, UDim2.new(1, -180))
            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 150, 0, 18),
                Position = UDim2.new(1, -10, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 4))

            local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
                Size = UDim2.new(0.85, 0, 0.85, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
                Font = Enum.Font.GothamBold,
                TextScaled = true,
                TextColor3 = Theme["Color Text"],
                Text = "...",
            }), "Text")

            local Arrow = Create("ImageLabel", SelectedFrame, {
                Size = UDim2.new(0, 15, 0, 15),
                Position = UDim2.new(0, -5, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Image = "rbxassetid://10709791523",
                BackgroundTransparency = 1,
            })

            local NoClickFrame = Create("TextButton", DropdownHolder, {
                Name = "AntiClick",
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Visible = false,
                Text = "",
            })

            local DropFrame = Create("Frame", NoClickFrame, {
                Size = UDim2.new(0, 152, 0, 0),
                BackgroundTransparency = 0.05,
                BackgroundColor3 = Color3.fromRGB(18, 18, 18),
                AnchorPoint = Vector2.new(0, 1),
                Name = "DropdownFrame",
                ClipsDescendants = true,
                Active = true,
            })
            Make("Corner", DropFrame)
            Make("Stroke", DropFrame)
            Make("Gradient", DropFrame, {Rotation = 60})

            local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
                ScrollBarImageColor3 = Theme["Color Theme"],
                Size = UDim2.new(1, 0, 1, 0),
                ScrollBarThickness = 1.5,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                CanvasSize = UDim2.new(),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                Active = true,
            }, {
                Create("UIPadding", {
                    PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8),
                    PaddingTop  = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5),
                }),
                Create("UIListLayout", { Padding = UDim.new(0, 4) }),
            }), "ScrollBar")

            local ScrollSize = 5
            local DropWait   = false

            local function Disable()
                DropWait = true
                CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
                CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255,255,255), 0.2})
                Arrow.Image = "rbxassetid://10709791523"
                NoClickFrame.Visible = false
                DropWait = false
            end

            local function GetDropSize()
                return UDim2.fromOffset(152, ScrollSize)
            end

            local function CalculateSize()
                local Count = 0
                for _, F in pairs(ScrollFrame:GetChildren()) do
                    if F:IsA("TextButton") then Count += 1 end
                end
                ScrollSize = (math.clamp(Count, 0, 10) * 25) + 10
                if NoClickFrame.Visible then
                    CreateTween({DropFrame, "Size", GetDropSize(), 0.15})
                end
            end

            local function CalculatePos()
                local FramePos  = SelectedFrame.AbsolutePosition
                local ScreenSz  = ScreenGui.AbsoluteSize
                local ClampX    = math.clamp(FramePos.X / UIScale, 0, ScreenSz.X/UIScale - 152)
                local ClampY    = math.clamp(FramePos.Y / UIScale, 0, ScreenSz.Y/UIScale)
                local AP        = FramePos.Y > ScreenSz.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
                DropFrame.AnchorPoint = Vector2.new(0, AP)
                CreateTween({DropFrame, "Position", UDim2.fromOffset(ClampX, ClampY), 0.1})
            end

            local function Minimize()
                if DropWait then return end
                DropWait = true
                if NoClickFrame.Visible then
                    CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255,255,255), 0.2})
                    CreateTween({DropFrame, "Size", UDim2.new(0,152,0,0), 0.2, true})
                    Arrow.Image = "rbxassetid://10709791523"
                    NoClickFrame.Visible = false
                else
                    NoClickFrame.Visible = true
                    Arrow.Image = "rbxassetid://10709790948"
                    CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.2})
                    CreateTween({DropFrame, "Size", GetDropSize(), 0.2, true})
                end
                DropWait = false
            end

            local AddNewOptions, GetOptions, AddOption, RemoveOption
            local Selected
            do
                local Default2  = type(OpDefault) ~= "table" and {OpDefault} or OpDefault
                local MultiSel  = DMulti
                local Options   = {}
                Selected = MultiSel and {} or (CheckFlag(Flag) and GetFlag(Flag) or Default2[1])

                if MultiSel then
                    for index, Value in pairs(CheckFlag(Flag) and GetFlag(Flag) or Default2) do
                        if type(index)=="string" and (DOptions[index] or table.find(DOptions,index)) then
                            Selected[index] = Value
                        elseif DOptions[Value] then
                            Selected[Value] = true
                        end
                    end
                end

                local function CallbackSel()
                    SetFlag(Flag, MultiSel and Selected or tostring(Selected))
                    Funcs:FireCallback(Callback, Selected)
                end
                local function UpdateLabel()
                    if MultiSel then
                        local list = {}
                        for idx, Val in pairs(Selected) do
                            if Val then table.insert(list, idx) end
                        end
                        ActiveLabel.Text = #list > 0 and table.concat(list,", ") or "..."
                    else
                        ActiveLabel.Text = tostring(Selected or "...")
                    end
                end
                local function UpdateSel()
                    if MultiSel then
                        for _, v in pairs(Options) do
                            CreateTween({v.nodes[2],"BackgroundTransparency", v.Stats and 0 or 0.8, 0.25})
                            CreateTween({v.nodes[2],"Size", v.Stats and UDim2.fromOffset(4,12) or UDim2.fromOffset(4,4), 0.25})
                            CreateTween({v.nodes[3],"TextTransparency", v.Stats and 0 or 0.4, 0.25})
                        end
                    else
                        for _, v in pairs(Options) do
                            local Slt = v.Value == Selected
                            CreateTween({v.nodes[2],"BackgroundTransparency", Slt and 0 or 1, 0.25})
                            CreateTween({v.nodes[2],"Size", Slt and UDim2.fromOffset(4,14) or UDim2.fromOffset(4,4), 0.25})
                            CreateTween({v.nodes[3],"TextTransparency", Slt and 0 or 0.4, 0.25})
                        end
                    end
                    UpdateLabel()
                end
                local function Select(Option)
                    if MultiSel then
                        Option.Stats = not Option.Stats
                        Selected[Option.Name] = Option.Stats
                    else
                        Selected = Option.Value
                    end
                    CallbackSel()
                    UpdateSel()
                end

                AddOption = function(index, Value)
                    local Name = tostring(type(index)=="string" and index or Value)
                    if Options[Name] then return end
                    Options[Name] = {index=index, Value=Value, Name=Name, Stats=false}
                    if MultiSel then
                        local st = Selected[Name]
                        Selected[Name] = st or false
                        Options[Name].Stats = st
                    end
                    local Btn = Make("Button", ScrollFrame, {
                        Name = "Option",
                        Size = UDim2.new(1, 0, 0, 21),
                    })
                    Make("Corner", Btn, UDim.new(0, 4))
                    local IsSel = InsertTheme(Create("Frame", Btn, {
                        Position = UDim2.new(0, 1, 0.5),
                        Size = UDim2.new(0, 4, 0, 4),
                        BackgroundColor3 = Theme["Color Theme"],
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0, 0.5),
                    }), "Theme")
                    Make("Corner", IsSel, UDim.new(0.5, 0))
                    local OptLbl = InsertTheme(Create("TextLabel", Btn, {
                        Size = UDim2.new(1, 0, 1, 0),
                        Position = UDim2.new(0, 10),
                        Text = Name,
                        TextColor3 = Theme["Color Text"],
                        Font = Enum.Font.FredokaOne,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        BackgroundTransparency = 1,
                        TextTransparency = 0.4,
                    }), "Text")
                    Btn.Activated:Connect(function() Select(Options[Name]) end)
                    Options[Name].nodes = {Btn, IsSel, OptLbl}
                end

                RemoveOption = function(index, Value)
                    local Name = tostring(type(index)=="string" and index or Value)
                    if Options[Name] then
                        if MultiSel then Selected[Name] = nil else Selected = nil end
                        Options[Name].nodes[1]:Destroy()
                        table.clear(Options[Name])
                        Options[Name] = nil
                    end
                end

                GetOptions = function() return Options end

                AddNewOptions = function(List, Clear)
                    if Clear then
                        for idx, Val in pairs(Options) do RemoveOption(idx, Val.Value) end
                    end
                    for idx, Val in pairs(List) do AddOption(idx, Val) end
                    CallbackSel()
                    UpdateSel()
                end

                for idx, Val in pairs(DOptions) do AddOption(idx, Val) end
                CallbackSel()
                UpdateSel()
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
            function Dropdown:Destroy() Button:Destroy() end
            function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(Selected) end
            function Dropdown:Add(...)
                local NewOpts = {...}
                local list = type(NewOpts[1])=="table" and NewOpts[1] or NewOpts
                for _, Name in ipairs(list) do AddOption(Name, Name) end
            end
            function Dropdown:Remove(Option)
                for index, Value in pairs(GetOptions()) do
                    if (type(Option)=="number" and index==Option) or Value.Name==Option then
                        RemoveOption(index, Value.Value)
                    end
                end
            end
            function Dropdown:Set(Val1, Clear)
                if type(Val1)=="table" then AddNewOptions(Val1, not Clear)
                elseif type(Val1)=="function" then Callback = {Val1} end
            end
            return Dropdown
        end

        function Tab:AddSlider(Configs)
            local SName    = Configs[1] or Configs.Name or Configs.Title or "Slider"
            local SDesc    = Configs.Desc or Configs.Description or ""
            local MinV     = (Configs[2] or Configs.MinValue or Configs.Min or 0)
            local MaxV     = (Configs[3] or Configs.MaxValue or Configs.Max or 100)
            local Increase = Configs[4] or Configs.Increase or 1
            local Callback = Funcs:GetCallback(Configs, 6)
            local Flag     = Configs[7] or Configs.Flag or false
            local Default  = Configs[5] or Configs.Default or MinV
            if CheckFlag(Flag) then Default = GetFlag(Flag) end
            local MinN, MaxN = MinV / Increase, MaxV / Increase

            local Button, LabelFunc = ButtonFrame(Container, SName, SDesc, UDim2.new(1, -180))
            local SliderHolder = Create("TextButton", Button, {
                Size = UDim2.new(0.45, 0, 1),
                Position = UDim2.new(1),
                AnchorPoint = Vector2.new(1, 0),
                AutoButtonColor = false,
                Text = "",
                BackgroundTransparency = 1,
            })
            local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
                BackgroundColor3 = Theme["Color Stroke"],
                Size = UDim2.new(1, -20, 0, 6),
                Position = UDim2.new(0.5, 0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }), "Stroke")
            Make("Corner", SliderBar)
            local Indicator = InsertTheme(Create("Frame", SliderBar, {
                BackgroundColor3 = Theme["Color Theme"],
                Size = UDim2.fromScale(0, 1),
                BorderSizePixel = 0,
            }), "Theme")
            Make("Corner", Indicator)
            local SliderIcon = Create("Frame", SliderBar, {
                Size = UDim2.new(0, 6, 0, 12),
                BackgroundColor3 = Color3.fromRGB(220, 220, 220),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 0.2,
            })
            Make("Corner", SliderIcon)
            local LabelVal = InsertTheme(Create("TextLabel", SliderHolder, {
                Size = UDim2.new(0, 30, 0, 14),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(0, 0, 0.5),
                BackgroundTransparency = 1,
                TextColor3 = Theme["Color Text"],
                Font = Enum.Font.FredokaOne,
                TextSize = 12,
                Text = tostring(Default),
            }), "Text")
            local UIScaleInst = Create("UIScale", LabelVal)

            local function UpdateLabel(NewValue)
                local Number = math.floor(NewValue * Increase * 100) / 100
                Default = Number
                LabelVal.Text = tostring(Number)
                Funcs:FireCallback(Callback, Default)
            end

            local function ControlPos()
                local Mouse = Player:GetMouse()
                local APos  = Mouse.X - SliderBar.AbsolutePosition.X
                local pct   = math.clamp(APos / SliderBar.AbsoluteSize.X, 0, 1)
                SliderIcon.Position = UDim2.fromScale(pct, 0.5)
            end

            local function UpdateValues()
                local pct = SliderIcon.Position.X.Scale
                Indicator.Size = UDim2.fromScale(pct, 1)
                local NewValue = math.floor(pct * (MaxN - MinN) + MinN)
                UpdateLabel(NewValue)
            end

            SliderHolder.MouseButton1Down:Connect(function()
                Container.ScrollingEnabled = false
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    task.wait()
                    ControlPos()
                end
                Container.ScrollingEnabled = true
                SetFlag(Flag, Default)
            end)

            LabelVal:GetPropertyChangedSignal("Text"):Connect(function()
                UIScaleInst.Scale = 0.8
                CreateTween({UIScaleInst, "Scale", 1, 0.15})
            end)

            local function SetSlider(NewValue)
                if type(NewValue) ~= "number" then return end
                local MinR = MinV
                local MaxR = MaxV
                local pct  = math.clamp((NewValue - MinR) / (MaxR - MinR), 0, 1)
                SetFlag(Flag, NewValue)
                CreateTween({SliderIcon, "Position", UDim2.fromScale(pct, 0.5), 0.25, true})
            end
            SetSlider(Default)
            SliderIcon:GetPropertyChangedSignal("Position"):Connect(UpdateValues)
            UpdateValues()

            local Slider = {}
            function Slider:Set(NewVal1, NewVal2)
                if NewVal1 and NewVal2 then LabelFunc:SetTitle(NewVal1); LabelFunc:SetDesc(NewVal2)
                elseif type(NewVal1)=="string" then LabelFunc:SetTitle(NewVal1)
                elseif type(NewVal1)=="function" then Callback = {NewVal1}
                elseif type(NewVal1)=="number" then SetSlider(NewVal1) end
            end
            function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(Default) end
            function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function Slider:Destroy() Button:Destroy() end
            return Slider
        end

        function Tab:AddTextBox(Configs)
            local TName       = Configs[1] or Configs.Name or Configs.Title or "TextBox"
            local TDesc       = Configs.Desc or Configs.Description or ""
            local TDefault    = Configs[2] or Configs.Default or ""
            local TPlaceholder= Configs[5] or Configs.PlaceholderText or "Input..."
            local TClearText  = Configs[3] or Configs.ClearText or false
            local Callback    = Funcs:GetCallback(Configs, 4)
            if type(TDefault)~="string" or #TDefault:gsub(" ","") < 1 then TDefault = false end

            local Button, LabelFunc = ButtonFrame(Container, TName, TDesc, UDim2.new(1, -38))
            local SelectedFrame = InsertTheme(Create("Frame", Button, {
                Size = UDim2.new(0, 150, 0, 18),
                Position = UDim2.new(1, -10, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Theme["Color Stroke"],
            }), "Stroke")
            Make("Corner", SelectedFrame, UDim.new(0, 4))

            local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
                Size = UDim2.new(0.85, 0, 0.85, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
                Font = Enum.Font.GothamBold,
                TextScaled = true,
                TextColor3 = Theme["Color Text"],
                ClearTextOnFocus = TClearText,
                PlaceholderText = TPlaceholder,
                Text = TDefault or "",
            }), "Text")

            local Pencil = Create("ImageLabel", SelectedFrame, {
                Size = UDim2.new(0, 12, 0, 12),
                Position = UDim2.new(0, -5, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Image = "rbxassetid://15637081879",
                BackgroundTransparency = 1,
            })

            local TextBoxObj = {}
            local function Input()
                local Text = TextBoxInput.Text
                if #Text:gsub(" ","") > 0 then
                    if TextBoxObj.OnChanging then Text = TextBoxObj.OnChanging(Text) or Text end
                    Funcs:FireCallback(Callback, Text)
                    TextBoxInput.Text = Text
                end
            end
            TextBoxInput.FocusLost:Connect(Input)
            Input()
            TextBoxInput.FocusLost:Connect(function()
                CreateTween({Pencil, "ImageColor3", Color3.fromRGB(255,255,255), 0.2})
            end)
            TextBoxInput.Focused:Connect(function()
                CreateTween({Pencil, "ImageColor3", Theme["Color Theme"], 0.2})
            end)

            TextBoxObj.OnChanging = false
            function TextBoxObj:Visible(...) Funcs:ToggleVisible(Button, ...) end
            function TextBoxObj:Destroy() Button:Destroy() end
            return TextBoxObj
        end

        function Tab:AddDiscordInvite(Configs)
            local Title  = Configs[1] or Configs.Name or Configs.Title or "Discord"
            local Desc   = Configs.Desc or Configs.Description or ""
            local Logo   = Configs[2] or Configs.Logo or ""
            local Invite = Configs[3] or Configs.Invite or ""

            local InviteHolder = Create("Frame", Container, {
                Size = UDim2.new(1, 0, 0, 80),
                Name = "Option",
                BackgroundTransparency = 1,
            })
            Create("TextLabel", InviteHolder, {
                Size = UDim2.new(1, 0, 0, 15),
                Position = UDim2.new(0, 5),
                TextColor3 = Color3.fromRGB(40, 150, 255),
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextSize = 10,
                Text = Invite,
            })
            local FrameHolder = InsertTheme(Create("Frame", InviteHolder, {
                Size = UDim2.new(1, 0, 0, 65),
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.new(0, 0, 1),
                BackgroundColor3 = Theme["Color Hub 2"],
            }), "Frame")
            Make("Corner", FrameHolder)
            local ImageLabel = Create("ImageLabel", FrameHolder, {
                Size = UDim2.new(0, 30, 0, 30),
                Position = UDim2.new(0, 7, 0, 7),
                Image = Logo,
                BackgroundTransparency = 1,
            })
            Make("Corner", ImageLabel, UDim.new(0, 4))
            Make("Stroke", ImageLabel)
            InsertTheme(Create("TextLabel", FrameHolder, {
                Size = UDim2.new(1, -52, 0, 15),
                Position = UDim2.new(0, 44, 0, 7),
                Font = Enum.Font.GothamBold,
                TextColor3 = Theme["Color Text"],
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextSize = 10,
                Text = Title,
            }), "Text")
            InsertTheme(Create("TextLabel", FrameHolder, {
                Size = UDim2.new(1, -52, 0, 0),
                Position = UDim2.new(0, 44, 0, 22),
                TextWrapped = true,
                AutomaticSize = Enum.AutomaticSize.Y,
                Font = Enum.Font.Gotham,
                TextColor3 = Theme["Color Dark Text"],
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                TextSize = 8,
                Text = Desc,
            }), "DarkText")
            local JoinButton = Create("TextButton", FrameHolder, {
                Size = UDim2.new(1, -14, 0, 16),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -7),
                Text = "Join Server",
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = Color3.fromRGB(220, 220, 220),
                BackgroundColor3 = Color3.fromRGB(50, 150, 50),
            })
            Make("Corner", JoinButton, UDim.new(0, 5))
            local ClickDelay = false
            JoinButton.Activated:Connect(function()
                if not setclipboard then return end
                setclipboard(Invite)
                if ClickDelay then return end
                ClickDelay = true
                SetProps(JoinButton, {
                    Text = "Copied!",
                    BackgroundColor3 = Color3.fromRGB(80,80,80),
                    TextColor3 = Color3.fromRGB(150,150,150),
                })
                task.wait(3)
                SetProps(JoinButton, {
                    Text = "Join Server",
                    BackgroundColor3 = Color3.fromRGB(50,150,50),
                    TextColor3 = Color3.fromRGB(220,220,220),
                })
                ClickDelay = false
            end)
            local DiscordInvite = {}
            function DiscordInvite:Destroy() InviteHolder:Destroy() end
            function DiscordInvite:Visible(...) Funcs:ToggleVisible(InviteHolder, ...) end
            return DiscordInvite
        end

        return Tab
    end

    -- Conectar botões
    CloseButton.Activated:Connect(function() Window:CloseBtn() end)
    MinimizeButton.Activated:Connect(function() Window:MinimizeBtn() end)

    -- Ativar primeira aba automaticamente
    task.delay(0.1, function()
        if #MyLibrary.Tabs > 0 then
            MyLibrary.Tabs[1].func:Enable()
        end
    end)

    return Window
end

return MyLibrary
