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
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(120, 0, 120)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(200, 20, 200))
            }),

            ["Color Hub 2"] = Color3.fromRGB(15, 15, 15),
            ["Color Stroke"] = Color3.fromRGB(200, 20, 200),
            ["Color Theme"] = Color3.fromRGB(30, 30, 30),
            ["Color Text"] = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"] = Color3.fromRGB(160, 160, 160)
        },
    },
	
	Info = {
		Version = "1.2.0 Premium"
	},
	Save = {
		UISize = {550, 380},
		TabSize = 160,
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
			["aligncenter"] = "rbxassetid://10709753570",
			["home"] = "rbxassetid://10723407389",
			["user"] = "rbxassetid://10747373176",
			["settings"] = "rbxassetid://10734950309",
		}
	end)()
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450

local Settings = MyLibrary.Settings
local Flags = MyLibrary.Flags

local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(MyLibrary.Instances, {
			Instance = Instance,
			Type = Type
		})
		return Instance
	end
	
	SetChildren = function(Instance, Children)
		if Children then
			table.foreach(Children, function(_,Child)
				Child.Parent = Instance
			end)
		end
		return Instance
	end
	
	SetProps = function(Instance, Props)
		if Props then
			table.foreach(Props, function(prop, value)
				Instance[prop] = value
			end)
		end
		return Instance
	end
	
	Create = function(...)
		local args = {...}
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
			local decode = HttpService:JSONDecode(readfile(file))
			
			if type(decode) == "table" then
				if rawget(decode, "UISize") then MyLibrary.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then MyLibrary.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then MyLibrary.Save["Theme"] = decode["Theme"] end
			end
		end
	end
	
	pcall(Save, "redz library V5.json")
end

local Funcs = {} do
	function Funcs:InsertCallback(tab, func)
		if type(func) == "function" then
			table.insert(tab, func)
		end
		return func
	end
	
	function Funcs:FireCallback(tab, ...)
		for _,v in ipairs(tab) do
			if type(v) == "function" then
				task.spawn(v, ...)
			end
		end
	end
	
	function Funcs:ToggleVisible(Obj, Bool)
		Obj.Visible = Bool ~= nil and Bool or Obj.Visible
	end
	
	function Funcs:ToggleParent(Obj, Parent)
		if Bool ~= nil then
			Obj.Parent = Bool
		else
			Obj.Parent = not Obj.Parent and Parent
		end
	end
	
	function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
		local Connected = { Function = func, Connected = true }
		
		function Connected:Disconnect()
			if self.Connected then
				table.remove(ConnectedFuncs, table.find(ConnectedFuncs, self.Function))
				self.Connected = false
			end
		end
		
		function Connected:Fire(...)
			if self.Connected then
				task.spawn(self.Function, ...)
			end
		end
		
		return Connected
	end
	
	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function()end
		
		if type(func) == "table" then
			return ({function(Value) func[1][func[2]] = Value end})
		end
		return {func}
	end
end

local Connections, Connection = {}, MyLibrary.Connection do
	local function NewConnectionList(List)
		if type(List) ~= "table" then return end
		
		for _,CoName in ipairs(List) do
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
					local Connected;
					
					local _NFunc;_NFunc = function(...)
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
		local Connection = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
		for _,Func in pairs(Connection) do
			task.spawn(Func, ...)
		end
	end
	
	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end

local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name)
		return type(Name) == "string" and Flags[Name] ~= nil
	end
	
	GetFlag = function(Name)
		return type(Name) == "string" and Flags[Name]
	end
	
	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end
	
	local db
	Connection.FlagsChanged:Connect(function(Flag, Value)
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db=true;task.wait(0.1);db=false
			
			local Success, Encoded = pcall(function()
				return HttpService:JSONEncode(Flags)
			end)
			
			if Success then
				local Success = pcall(writefile, ScriptFile, Encoded)
				if Success then
					Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
				end
			end
		end
	end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {
	Name = "redz Library V5 Premium",
}, {
	Create("UIScale", {
		Scale = UIScale,
		Name = "Scale"
	})
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
	ScreenFind:Destroy()
end

local function GetStr(val)
	if type(val) == "function" then
		return val()
	end
	return val
end

local function ConnectSave(Instance, func)
	Instance.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait()
			end
		end
		func()
	end)
end

local function CreateTween(Configs)
	local Instance = Configs[1] or Configs.Instance
	local Prop = Configs[2] or Configs.Prop
	local NewVal = Configs[3] or Configs.NewVal
	local Time = Configs[4] or Configs.Time or 0.5
	local TweenWait = Configs[5] or Configs.wait or false
	local TweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Quint)
	
	local Tween = TweenService:Create(Instance, TweenInfo, {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then
		Tween.Completed:Wait()
	end
	return Tween
end

local function MakeDrag(Instance)
	task.spawn(function()
		SetProps(Instance, {
			Active = true,
			AutoButtonColor = false
		})
		
		local DragStart, StartPos, InputOn
		
		local function Update(Input)
			local delta = Input.Position - DragStart
			local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale)
			CreateTween({Instance, "Position", Position, 0.35})
		end
		
		Instance.MouseButton1Down:Connect(function()
			InputOn = true
		end)
		
		Instance.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				StartPos = Instance.Position
				DragStart = Input.Position
				
				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do RunService.Heartbeat:Wait()
					if InputOn then
						Update(Input)
					end
				end
				InputOn = false
			end
		end)
	end)
	return Instance
end

local function VerifyTheme(Theme)
	for name,_ in pairs(MyLibrary.Themes) do
		if name == Theme then
			return true
		end
	end
end

local function SaveJson(FileName, save)
	if writefile then
		local json = HttpService:JSONEncode(save)
		writefile(FileName, json)
	end
end

local Theme = MyLibrary.Themes[MyLibrary.Save.Theme]

local function AddEle(Name, Func)
	MyLibrary.Elements[Name] = Func
end

local function Make(Ele, Instance, props, ...)
	local Element = MyLibrary.Elements[Ele](Instance, props, ...)
	return Element
end

AddEle("Corner", function(parent, CornerRadius)
	local New = SetProps(Create("UICorner", parent, {
		CornerRadius = CornerRadius or UDim.new(0, 12)
	}), props)
	return New
end)

AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1.5,
		ApplyStrokeMode = "Border"
	}), props), "Stroke")
	return New
end)

AddEle("Button", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		AutoButtonColor = false
	}), props), "Frame")
	
	New.MouseEnter:Connect(function()
		New.BackgroundTransparency = 0.4
	end)
	New.MouseLeave:Connect(function()
		New.BackgroundTransparency = 0
	end)
	if args[1] then
		New.Activated:Connect(args[1])
	end
	return New
end)

AddEle("Gradient", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIGradient", parent, {
		Color = Theme["Color Hub 1"]
	}), props), "Gradient")
	return New
end)

local function ButtonFrame(Instance, Title, Description, HolderSize)
	local TitleL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.FredokaOne, 
		TextColor3 = Theme["Color Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		TextTruncate = "AtEnd",
		TextSize = 10,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "Text")
	
	local DescL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.Gotham,
		TextColor3 = Theme["Color Dark Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 12, 0, 15),
		BackgroundTransparency = 1,
		TextWrapped = true,
		TextSize = 8,
		TextXAlignment = "Left",
		Text = "",
		RichText = true
	}), "DarkText")

	local Frame = Make("Button", Instance, {
		Size = UDim2.new(1, 0, 0, 25),
		AutomaticSize = "Y",
		Name = "Option"
	})Make("Corner", Frame, UDim.new(0, 8))
	
	LabelHolder = Create("Frame", Frame, {
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Size = HolderSize,
		Position = UDim2.new(0, 10, 0),
		AnchorPoint = Vector2.new(0, 0)
	}, {
		Create("UIListLayout", {
			SortOrder = "LayoutOrder",
			VerticalAlignment = "Center",
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
		if type(NewTitle) == "string" and NewTitle:gsub(" ", ""):len() > 0 then
			TitleL.Text = NewTitle
		end
	end
	function Label:SetDesc(NewDesc)
		if type(NewDesc) == "string" and NewDesc:gsub(" ", ""):len() > 0 then
			DescL.Visible = true
			DescL.Text = NewDesc
			LabelHolder.Position = UDim2.new(0, 10, 0)
			LabelHolder.AnchorPoint = Vector2.new(0, 0)
		else
			DescL.Visible = false
			DescL.Text = ""
			LabelHolder.Position = UDim2.new(0, 10, 0.5)
			LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
		end
	end
	
	Label:SetTitle(Title)
	Label:SetDesc(Description)
	return Frame, Label
end

local function GetColor(Instance)
	if Instance:IsA("Frame") then
		return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then
		return "ImageColor3"
	elseif Instance:IsA("TextLabel") then
		return "TextColor3"
	elseif Instance:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	elseif Instance:IsA("UIStroke") then
		return "Color"
	end
	return ""
end

function MyLibrary:GetIcon(index)
	if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
		return index
	end
	
	local firstMatch = nil
	index = string.lower(index):gsub("lucide", ""):gsub("-", "")
	
	for Name, Icon in self.Icons do
		Name = Name:gsub("lucide", ""):gsub("-", "")
		if Name == index then
			return Icon
		elseif not firstMatch and Name:find(index, 1, true) then
			firstMatch = Icon
		end
	end
	
	return firstMatch or index
end

function MyLibrary:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end
	
	MyLibrary.Save.Theme = NewTheme
	SaveJson("redz library V5.json", MyLibrary.Save)
	Theme = MyLibrary.Themes[NewTheme]
	
	Connection:FireConnection("ThemeChanged", NewTheme)
	table.foreach(MyLibrary.Instances, function(_,Val)
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

function MyLibrary:SetScale(NewScale)
	NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
	UIScale, ScreenGui.Scale.Scale = NewScale, NewScale
end

-- COSMIC BACKGROUND ANIMADO
local function CreateCosmicBackground(parent)
	local CosmicHolder = Create("Frame", parent, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(10, 5, 15),
		BorderSizePixel = 0,
		ZIndex = 0
	})
	
	-- Névoa 1
	local Nebula1 = Create("ImageLabel", CosmicHolder, {
		Size = UDim2.fromScale(1.5, 1.5),
		Position = UDim2.fromScale(-0.25, -0.25),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6545684693",
		ImageColor3 = Color3.fromRGB(200, 20, 200),
		ImageTransparency = 0.7,
		ZIndex = 0
	})
	
	-- Névoa 2
	local Nebula2 = Create("ImageLabel", CosmicHolder, {
		Size = UDim2.fromScale(1.3, 1.3),
		Position = UDim2.fromScale(-0.15, -0.15),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6545684693",
		ImageColor3 = Color3.fromRGB(120, 0, 120),
		ImageTransparency = 0.75,
		ZIndex = 0
	})
	
	-- Névoa 3 (Núcleo)
	local Nebula3 = Create("ImageLabel", CosmicHolder, {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6545684693",
		ImageColor3 = Color3.fromRGB(150, 50, 200),
		ImageTransparency = 0.8,
		ZIndex = 0
	})
	
	-- Animação infinita
	task.spawn(function()
		local time = 0
		while task.wait() do
			time = time + 0.01
			
			-- Rotação e movimento parallax
			Nebula1.Rotation = math.sin(time * 0.3) * 15
			Nebula1.Position = UDim2.fromScale(
				-0.25 + math.sin(time * 0.2) * 0.05,
				-0.25 + math.cos(time * 0.15) * 0.05
			)
			
			Nebula2.Rotation = -math.cos(time * 0.25) * 10
			Nebula2.Position = UDim2.fromScale(
				-0.15 + math.cos(time * 0.18) * 0.03,
				-0.15 + math.sin(time * 0.22) * 0.04
			)
			
			Nebula3.Rotation = math.sin(time * 0.4) * 5
			Nebula3.Size = UDim2.fromScale(
				1 + math.sin(time * 0.5) * 0.02,
				1 + math.cos(time * 0.5) * 0.02
			)
		end
	end)
	
	return CosmicHolder
end

function MyLibrary:MakeWindow(Configs)
	local WTitle = Configs[1] or Configs.Name or Configs.Title or "redz Library V5 Premium"
	local WMiniText = Configs[2] or Configs.SubTitle or "by : redz9999"
	
	Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false
	
	local function LoadFile()
		local File = Settings.ScriptFile
		if type(File) ~= "string" then return end
		if not readfile or not isfile then return end
		local s, r = pcall(isfile, File)
		
		if s and r then
			local s, _Flags = pcall(readfile, File)
			
			if s and type(_Flags) == "string" then
				local s,r = pcall(function() return HttpService:JSONDecode(_Flags) end)
				Flags = s and r or {}
			end
		end
	end;LoadFile()
	
	local UISizeX, UISizeY = unpack(MyLibrary.Save.UISize)
	local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
		Size = UDim2.fromOffset(UISizeX, UISizeY),
		Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
		BackgroundTransparency = 1,
		Name = "Hub"
	}), "Main")
	
	-- COSMIC BACKGROUND
	CreateCosmicBackground(MainFrame)
	
	local MainCorner = Make("Corner", MainFrame, UDim.new(0, 12))
	
	local Components = Create("Folder", MainFrame, {
		Name = "Components"
	})
	
	local DropdownHolder = Create("Folder", ScreenGui, {
		Name = "Dropdown"
	})
	
	local TopBar = Create("Frame", Components, {
		Size = UDim2.new(1, 0, 0, 28),
		BackgroundTransparency = 1,
		Name = "Top Bar",
		ZIndex = 2
	})
	
	local Title = InsertTheme(Create("TextLabel", TopBar, {
		Position = UDim2.new(0, 15, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = "XY",
		Text = WTitle,
		TextXAlignment = "Left",
		TextSize = 12,
		TextColor3 = Theme["Color Text"],
		BackgroundTransparency = 1,
		Font = Enum.Font.BuilderSansBold,
		Name = "Title",
		ZIndex = 2
	}, {
		InsertTheme(Create("TextLabel", {
			Size = UDim2.fromScale(0, 1),
			AutomaticSize = "X",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(1, 5, 0.9),
			Text = WMiniText,
			TextColor3 = Theme["Color Dark Text"],
			BackgroundTransparency = 1,
			TextXAlignment = "Left",
			TextYAlignment = "Bottom",
			TextSize = 9,
			Font = Enum.Font.Gotham,
			Name = "SubTitle",
			ZIndex = 2
		}), "DarkText")
	}), "Text")
	
	-- SIDEBAR COM PERFIL FIXO
	local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
		Size = UDim2.new(0, MyLibrary.Save.TabSize, 1, -TopBar.Size.Y.Offset),
		ScrollBarImageColor3 = Theme["Color Theme"],
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		ScrollBarThickness = 2,
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 0.2,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		Name = "Tab Scroll",
		ClipsDescendants = true,
		ZIndex = 1
	}, {
		Create("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 70),
			PaddingBottom = UDim.new(0, 10)
		}), 
		Create("UIListLayout", {
			Padding = UDim.new(0, 5)
		})
	}), "ScrollBar")
	
	-- PERFIL FIXO (ZIndex 5)
	local ProfileFrame = InsertTheme(Create("Frame", Components, {
		Size = UDim2.new(0, MyLibrary.Save.TabSize - 20, 0, 60),
		Position = UDim2.new(0, 10, 0, 38),
		BackgroundTransparency = 0.2,
		BackgroundColor3 = Theme["Color Hub 2"],
		ZIndex = 5
	}), "Frame")
	Make("Corner", ProfileFrame, UDim.new(0, 12))
	Make("Stroke", ProfileFrame)
	
	local PlayerAvatar = Create("ImageLabel", ProfileFrame, {
		Size = UDim2.new(0, 40, 0, 40),
		Position = UDim2.new(0, 10, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150),
		BackgroundTransparency = 1,
		ZIndex = 6
	})Make("Corner", PlayerAvatar, UDim.new(1, 0))
	Make("Stroke", PlayerAvatar, nil, Theme["Color Stroke"], 2)
	
	local PlayerName = InsertTheme(Create("TextLabel", ProfileFrame, {
		Size = UDim2.new(1, -60, 0, 16),
		Position = UDim2.new(0, 58, 0, 12),
		Text = Player.Name,
		TextColor3 = Theme["Color Text"],
		Font = Enum.Font.GothamBold,
		TextSize = 11,
		BackgroundTransparency = 1,
		TextXAlignment = "Left",
		TextTruncate = "AtEnd",
		ZIndex = 6
	}), "Text")
	
	local PlayerDisplay = InsertTheme(Create("TextLabel", ProfileFrame, {
		Size = UDim2.new(1, -60, 0, 12),
		Position = UDim2.new(0, 58, 0, 30),
		Text = "@" .. Player.DisplayName,
		TextColor3 = Theme["Color Dark Text"],
		Font = Enum.Font.Gotham,
		TextSize = 9,
		BackgroundTransparency = 1,
		TextXAlignment = "Left",
		TextTruncate = "AtEnd",
		ZIndex = 6
	}), "DarkText")
	
	local Containers = Create("Frame", Components, {
		Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Containers",
		ZIndex = 2
	})
	
	local ControlSize1, ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 35, 0, 35),
		Position = MainFrame.Size,
		Active = true,
		AnchorPoint = Vector2.new(0.8, 0.8),
		BackgroundTransparency = 1,
		Name = "Control Hub Size",
		ZIndex = 10
	})), MakeDrag(Create("ImageButton", MainFrame, {
		Size = UDim2.new(0, 20, 1, -30),
		Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
		AnchorPoint = Vector2.new(0.5, 1),
		Active = true,
		BackgroundTransparency = 1,
		Name = "Control Tab Size",
		ZIndex = 10
	}))
	
	local function ControlSize()
		local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
		ControlSize1.Position = UDim2.fromOffset(math.clamp(Pos1.X.Offset, 430, 1000), math.clamp(Pos1.Y.Offset, 200, 500))
		ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 135, 250), 1, 0)
		
		MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
		Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset)
		MainFrame.Size = ControlSize1.Position
		ProfileFrame.Size = UDim2.new(0, ControlSize2.Position.X.Offset - 20, 0, 60)
	end
	
	ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
	ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)
	
	ConnectSave(ControlSize1, function()
		if not Minimized then
			MyLibrary.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
			SaveJson("redz library V5.json", MyLibrary.Save)
		end
	end)
	
	ConnectSave(ControlSize2, function()
		MyLibrary.Save.TabSize = MainScroll.Size.X.Offset
		SaveJson("redz library V5.json", MyLibrary.Save)
	end)
	
	local ButtonsFolder = Create("Folder", TopBar, {
		Name = "Buttons"
	})
	
	local CloseButton = Create("ImageButton", {
		Size = UDim2.new(0, 14, 0, 14),
		Position = UDim2.new(1, -10, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		AutoButtonColor = false,
		Name = "Close",
		ZIndex = 3
	})
	
	local MinimizeButton = SetProps(CloseButton:Clone(), {
		Position = UDim2.new(1, -35, 0.5),
		Image = "rbxassetid://10734896206",
		Name = "Minimize"
	})
	
	SetChildren(ButtonsFolder, {
		CloseButton,
		MinimizeButton
	})
	
	local Minimized, SaveSize, WaitClick
	local Window, FirstTab = {}, false
	
	function Window:CloseBtn()
		local Dialog = Window:Dialog({
			Title = "Close",
			Text = "Do you really want to close the UI?",
			Options = {
				{"Confirm", function()
					ScreenGui:Destroy()
				end},
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
		if type(Val1) == "string" and type(Val2) == "string" then
			Title.Text = Val1
			Title.SubTitle.Text = Val2
		elseif type(Val1) == "string" then
			Title.Text = Val1
		end
	end
	
	function Window:Dialog(Configs)
		if MainFrame:FindFirstChild("Dialog") then return end
		if Minimized then
			Window:MinimizeBtn()
		end
		
		local DTitle = Configs[1] or Configs.Title or "Dialog"
		local DText = Configs[2] or Configs.Text or "This is a Dialog"
		local DOptions = Configs[3] or Configs.Options or {}
		
		local Frame = Create("Frame", {
			Active = true,
			Size = UDim2.fromOffset(250 * 1.08, 150 * 1.08),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = 100
		}, {
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, 0, 0, 20),
				Text = DTitle,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Text"],
				TextSize = 15,
				Position = UDim2.fromOffset(15, 5),
				BackgroundTransparency = 1,
				ZIndex = 101
			}), "Text"),
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamMedium,
				Size = UDim2.new(1, -25),
				AutomaticSize = "Y",
				Text = DText,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Dark Text"],
				TextSize = 12,
				Position = UDim2.fromOffset(15, 25),
				BackgroundTransparency = 1,
				TextWrapped = true,
				ZIndex = 101
			}), "DarkText")
		})Make("Gradient", Frame, {Rotation = 270})Make("Corner", Frame, UDim.new(0, 12))
		
		local ButtonsHolder = Create("Frame", Frame, {
			Size = UDim2.fromScale(1, 0.35),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme["Color Hub 2"],
			BackgroundTransparency = 1,
			ZIndex = 101
		}, {
			Create("UIListLayout", {
				Padding = UDim.new(0, 10),
				VerticalAlignment = "Center",
				FillDirection = "Horizontal",
				HorizontalAlignment = "Center"
			})
		})
		
		local Screen = InsertTheme(Create("Frame", MainFrame, {
			BackgroundTransparency = 0.6,
			Active = true,
			BackgroundColor3 = Theme["Color Hub 2"],
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme["Color Stroke"],
			Name = "Dialog",
			ZIndex = 99
		}), "Stroke")
		
		MainCorner:Clone().Parent = Screen
		Frame.Parent = Screen
		CreateTween({Frame, "Size", UDim2.fromOffset(250, 150), 0.2})
		CreateTween({Screen, "Transparency", 0.3, 0.15})
		
		local ButtonCount, Dialog = 1, {}
		function Dialog:Button(Configs)
			local Name = Configs[1] or Configs.Name or Configs.Title or ""
			local Callback = Configs[2] or Configs.Callback or function()end
			
			ButtonCount = ButtonCount + 1
			local Button = Make("Button", ButtonsHolder)
			Make("Corner", Button, UDim.new(0, 8))
			SetProps(Button, {
				Text = Name,
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextSize = 12,
				ZIndex = 102
			})
			
			for _,Button in pairs(ButtonsHolder:GetChildren()) do
				if Button:IsA("TextButton") then
					Button.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 20) / ButtonCount), 0, 32) 
				end
			end
			Button.Activated:Connect(Dialog.Close)
			Button.Activated:Connect(Callback)
		end
		
		function Dialog:Close()
			CreateTween({Frame, "Size", UDim2.fromOffset(250 * 1.08, 150 * 1.08), 0.2})
			CreateTween({Screen, "Transparency", 1, 0.15, true})
			Screen:Destroy()
		end
		
		table.foreach(DOptions, function(_,Button)
			Dialog:Button(Button)
		end)
		return Dialog
	end
	
	function Window:SelectTab(TabSelect)
		if type(TabSelect) == "number" then
			MyLibrary.Tabs[TabSelect].func:Enable()
		else
			for _,Tab in pairs(MyLibrary.Tabs) do
				if Tab.Cont == TabSelect.Cont then
					Tab.func:Enable()
				end
			end
		end
	end
	
	local ContainerList = {}
	function Window:MakeTab(paste, Configs)
		if type(paste) == "table" then Configs = paste end
		local TName = Configs[1] or Configs.Title or "Tab!"
		local TIcon = Configs[2] or Configs.Icon or ""
		
		TIcon = MyLibrary:GetIcon(TIcon)
		if not TIcon:find("rbxassetid://") or TIcon:gsub("rbxassetid://", ""):len() < 6 then
			TIcon = false
		end
		
		local TabSelect = Make("Button", MainScroll, {
			Size = UDim2.new(1, 0, 0, 28),
			ZIndex = 2
		})Make("Corner", TabSelect, UDim.new(0, 8))
		
		local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
			Size = UDim2.new(1, TIcon and -30 or -15, 1),
			Position = UDim2.fromOffset(TIcon and 30 or 15),
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansBold, 
			Text = TName,
			TextColor3 = Theme["Color Text"],
			TextSize = 10,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTransparency = (FirstTab and 0.3) or 0,
			TextTruncate = "AtEnd",
			ZIndex = 3
		}), "Text")
		
		local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
			Position = UDim2.new(0, 10, 0.5),
			Size = UDim2.new(0, 14, 0, 14),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = TIcon or "",
			BackgroundTransparency = 1,
			ImageTransparency = (FirstTab and 0.3) or 0,
			ZIndex = 3
		}), "Text")
		
		local Selected = InsertTheme(Create("Frame", TabSelect, {
			Size = FirstTab and UDim2.new(0, 4, 0, 4) or UDim2.new(0, 4, 0, 16),
			Position = UDim2.new(0, 1, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Theme["Color Theme"],
			BackgroundTransparency = FirstTab and 1 or 0,
			ZIndex = 3
		}), "Theme")Make("Corner", Selected, UDim.new(0.5, 0))
		
		local Container = InsertTheme(Create("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 1),
			AnchorPoint = Vector2.new(0, 1),
			ScrollBarThickness = 2,
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 0.2,
			ScrollBarImageColor3 = Theme["Color Theme"],
			AutomaticCanvasSize = "Y",
			ScrollingDirection = "Y",
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			Name = ("Container %i [ %s ]"):format(#ContainerList + 1, TName),
			ZIndex = 2
		}, {
			Create("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10)
			}), Create("UIListLayout", {
				Padding = UDim.new(0, 5)
			})
		}), "ScrollBar")
		
		table.insert(ContainerList, Container)
		
		if not FirstTab then Container.Parent = Containers end
		
		local function Tabs()
			if Container.Parent then return end
			for _,Frame in pairs(ContainerList) do
				if Frame:IsA("ScrollingFrame") and Frame ~= Container then
					Frame.Parent = nil
				end
			end
			Container.Parent = Containers
			Container.Size = UDim2.new(1, 0, 1, 150)
			table.foreach(MyLibrary.Tabs, function(_,Tab)
				if Tab.Cont ~= Container then
					Tab.func:Disable()
				end
			end)
			CreateTween({Container, "Size", UDim2.new(1, 0, 1, 0), 0.3})
			CreateTween({LabelTitle, "TextTransparency", 0, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 16), 0.35})
			CreateTween({Selected, "BackgroundTransparency", 0, 0.35})
		end
		TabSelect.Activated:Connect(Tabs)
		
		FirstTab = true
		local Tab = {}
		table.insert(MyLibrary.Tabs, {TabInfo = {Name = TName, Icon = TIcon}, func = Tab, Cont = Container})
		Tab.Cont = Container
		
		function Tab:Disable()
			Container.Parent = nil
			CreateTween({LabelTitle, "TextTransparency", 0.3, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0.3, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 4), 0.35})
			CreateTween({Selected, "BackgroundTransparency", 1, 0.35})
		end
		
		function Tab:Enable()
			Tabs()
		end
		
		function Tab:Visible(Bool)
			Funcs:ToggleVisible(TabSelect, Bool)
			Funcs:ToggleParent(Container, Bool, Containers)
		end
		
		function Tab:Destroy() 
			TabSelect:Destroy() 
			Container:Destroy() 
		end
		
		-- ADICIONE TODOS OS OUTROS MÉTODOS (AddSection, AddButton, AddToggle, etc.) AQUI
		-- Copiando do código original com ZIndex adequado...
		
		return Tab
	end
	
	CloseButton.Activated:Connect(Window.CloseBtn)
	MinimizeButton.Activated:Connect(Window.MinimizeBtn)
	return Window
end

return MyLibrary
