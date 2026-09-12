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
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 4, 4)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(14, 6, 6)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 2, 2)),
            }),
            ["Color Hub 2"]      = Color3.fromRGB(12, 5, 5),
            ["Color Stroke"]     = Color3.fromRGB(180, 20, 30),
            ["Color Theme"]      = Color3.fromRGB(200, 30, 40),
            ["Color Text"]       = Color3.fromRGB(255, 240, 240),
            ["Color Dark Text"]  = Color3.fromRGB(150, 100, 100),
            ["Color Accent"]     = Color3.fromRGB(220, 50, 60),
            ["Color Glow"]       = Color3.fromRGB(150, 10, 20),
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
            ["user"]="rbxassetid://10747373176",
            ["home"]="rbxassetid://10723407389",
            ["settings"]="rbxassetid://10734950309",
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
end

-- ═══════════════════════════════════════════════
--              SCREEN GUI & UTILS
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
            TweenService:Create(inst, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = Position}):Play()
        end
        inst.MouseButton1Down:Connect(function() InputOn = true end)
        inst.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
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

local Theme = MyLibrary.Themes[MyLibrary.Save.Theme]

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

-- ═══════════════════════════════════════════════
--              MAKE WINDOW
-- ═══════════════════════════════════════════════
function MyLibrary:MakeWindow(Configs)
    local WTitle    = Configs[1] or Configs.Name    or Configs.Title    or "Niri hub"
    local WMiniText = Configs[2] or Configs.Sub     or ""

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
    
    -- Main Gradient Background
    Create("UIGradient", MainFrame, {
        Color = Theme["Color Hub 1"],
        Rotation = 45,
    })

    -- ═══════════════════════════════════════════════
    -- SIDEBAR (Frame Normal)
    -- ═══════════════════════════════════════════════
    local Sidebar = Create("Frame", MainFrame, {
        Size = UDim2.new(0, MyLibrary.Save.TabSize, 1, 0),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
    })
    Make("Corner", Sidebar, UDim.new(0, 10))

    -- ═══════════════════════════════════════════════
    -- PROFILE FRAME (ZIndex = 5, Fixo no topo)
    -- ═══════════════════════════════════════════════
    local ProfileFrame = Create("Frame", Sidebar, {
        Size = UDim2.new(1, 0, 0, 65),
        BackgroundColor3 = Theme["Color Hub 2"],
        BorderSizePixel = 0,
        ZIndex = 5,
    })
    Make("Corner", ProfileFrame, UDim.new(0, 10))
    
    -- Linha de separação abaixo do perfil para dar profundidade
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
        BackgroundColor3 = Theme["Color Hub 1"].Keypoints[1].Value,
        ZIndex = 5,
    })
    Make("Corner", AvatarImg, UDim.new(1, 0))

    Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 20),
        Position = UDim2.new(0, 60, 0, 15),
        Text = WTitle,
        TextColor3 = Theme["Color Text"],
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 5,
    })
    Create("TextLabel", ProfileFrame, {
        Size = UDim2.new(1, -65, 0, 15),
        Position = UDim2.new(0, 60, 0, 35),
        Text = "@" .. Player.Name,
        TextColor3 = Theme["Color Dark Text"],
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        ZIndex = 5,
    })

    -- ═══════════════════════════════════════════════
    -- SCROLLING FRAME (ZIndex = 1, ClipDescendants = true, Size 1,0, 1,0)
    -- ═══════════════════════════════════════════════
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

    Create("UIPadding", TabContainer, {
        PaddingTop = UDim.new(0, 70), -- UIPadding com PaddingTop de 70
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
    })

    local TabListLayout = Create("UIListLayout", TabContainer, {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
    })

    -- Área de Conteúdo das Abas
    local ContentContainer = Create("Frame", MainFrame, {
        Size = UDim2.new(1, -(MyLibrary.Save.TabSize + 10), 1, -20),
        Position = UDim2.new(0, MyLibrary.Save.TabSize + 5, 0, 10),
        BackgroundTransparency = 1,
    })

    local WindowObj = {}
    
    function WindowObj:MakeTab(TabConfigs)
        local TTitle = TabConfigs.Name or TabConfigs.Title or "Tab"
        local TIcon  = TabConfigs.Icon or "home"
        
        -- Botão da Aba no TabContainer
        local TabButton = Create("TextButton", TabContainer, {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Theme["Color Hub 1"].Keypoints[2].Value,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 1,
        })
        Make("Corner", TabButton, UDim.new(0, 6))
        
        local TabIcon = Create("ImageLabel", TabButton, {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 10, 0.5, -8),
            Image = MyLibrary:GetIcon(TIcon),
            ImageColor3 = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            ZIndex = 1,
        })
        
        local TabText = Create("TextLabel", TabButton, {
            Size = UDim2.new(1, -36, 1, 0),
            Position = UDim2.new(0, 32, 0, 0),
            Text = TTitle,
            TextColor3 = Theme["Color Dark Text"],
            Font = Enum.Font.GothamMedium,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            ZIndex = 1,
        })

        -- Conteúdo da Aba
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
                    child.BackgroundColor3 = Theme["Color Hub 1"].Keypoints[2].Value
                    child:FindFirstChildOfClass("ImageLabel").ImageColor3 = Theme["Color Dark Text"]
                    child:FindFirstChildOfClass("TextLabel").TextColor3 = Theme["Color Dark Text"]
                end
            end
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Theme["Color Theme"]
            TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)

        return {
            Container = TabContent,
            Button = TabButton
        }
    end

    return WindowObj
end

-- Exemplo de Inicialização do Painel (Opcional)
local Window = MyLibrary:MakeWindow({Name = "Niri hub"})
local Tab1 = Window:MakeTab({Name = "Main", Icon = "home"})
local Tab2 = Window:MakeTab({Name = "Settings", Icon = "settings"})

-- Forçando o clique na primeira aba para ativá-la
task.delay(0.1, function()
    local firstTab = MainFrame:FindFirstChild("TextButton", true)
    if firstTab then
        for _, conn in pairs(getconnections(firstTab.MouseButton1Click)) do
            conn:Fire()
        end
    end
end)
