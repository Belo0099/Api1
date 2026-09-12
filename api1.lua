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
			["aligncenterhorizontal"] = "rbxassetid://10709753272",
			["aligncentervertical"] = "rbxassetid://10709753421",
			["alignendhorizontal"] = "rbxassetid://10709753692",
			["alignendvertical"] = "rbxassetid://10709753808",
			["alignhorizontaldistributecenter"] = "rbxassetid://10747779791",
			["alignhorizontaldistributeend"] = "rbxassetid://10747784534",
			["alignhorizontaldistributestart"] = "rbxassetid://10709754118",
			["alignhorizontaljustifycenter"] = "rbxassetid://10709754204",
			["alignhorizontaljustifyend"] = "rbxassetid://10709754317",
			["alignhorizontaljustifystart"] = "rbxassetid://10709754436",
			["alignhorizontalspacearound"] = "rbxassetid://10709754590",
			["alignhorizontalspacebetween"] = "rbxassetid://10709754749",
			["alignjustify"] = "rbxassetid://10709759610",
			["alignleft"] = "rbxassetid://10709759764",
			["alignright"] = "rbxassetid://10709759895",
			["alignstarthorizontal"] = "rbxassetid://10709760051",
			["alignstartvertical"] = "rbxassetid://10709760244",
			["alignverticaldistributecenter"] = "rbxassetid://10709760351",
			["alignverticaldistributeend"] = "rbxassetid://10709760434",
			["alignverticaldistributestart"] = "rbxassetid://10709760612",
			["alignverticaljustifycenter"] = "rbxassetid://10709760814",
			["alignverticaljustifyend"] = "rbxassetid://10709761003",
			["alignverticaljustifystart"] = "rbxassetid://10709761176",
			["alignverticalspacearound"] = "rbxassetid://10709761324",
			["alignverticalspacebetween"] = "rbxassetid://10709761434",
			["anchor"] = "rbxassetid://10709761530",
			["angry"] = "rbxassetid://10709761629",
			["annoyed"] = "rbxassetid://10709761722",
			["aperture"] = "rbxassetid://10709761813",
			["apple"] = "rbxassetid://10709761889",
			["archive"] = "rbxassetid://10709762233",
			["archiverestore"] = "rbxassetid://10709762058",
			["armchair"] = "rbxassetid://10709762327",
			["arrowbigdown"] = "rbxassetid://10747796644",
			["arrowbigleft"] = "rbxassetid://10709762574",
			["arrowbigright"] = "rbxassetid://10709762727",
			["arrowbigup"] = "rbxassetid://10709762879",
			["arrowdown"] = "rbxassetid://10709767827",
			["arrowdowncircle"] = "rbxassetid://10709763034",
			["arrowdownleft"] = "rbxassetid://10709767656",
			["arrowdownright"] = "rbxassetid://10709767750",
			["arrowleft"] = "rbxassetid://10709768114",
			["arrowleftcircle"] = "rbxassetid://10709767936",
			["arrowleftright"] = "rbxassetid://10709768019",
			["arrowright"] = "rbxassetid://10709768347",
			["arrowrightcircle"] = "rbxassetid://10709768226",
			["arrowup"] = "rbxassetid://10709768939",
			["arrowupcircle"] = "rbxassetid://10709768432",
			["arrowupdown"] = "rbxassetid://10709768538",
			["arrowupleft"] = "rbxassetid://10709768661",
			["arrowupright"] = "rbxassetid://10709768787",
			["asterisk"] = "rbxassetid://10709769095",
			["atsign"] = "rbxassetid://10709769286",
			["award"] = "rbxassetid://10709769406",
			["axe"] = "rbxassetid://10709769508",
			["axis3d"] = "rbxassetid://10709769598",
			["baby"] = "rbxassetid://10709769732",
			["backpack"] = "rbxassetid://10709769841",
			["baggageclaim"] = "rbxassetid://10709769935",
			["banana"] = "rbxassetid://10709770005",
			["banknote"] = "rbxassetid://10709770178",
			["barchart"] = "rbxassetid://10709773755",
			["barchart2"] = "rbxassetid://10709770317",
			["barchart3"] = "rbxassetid://10709770431",
			["barchart4"] = "rbxassetid://10709770560",
			["barcharthorizontal"] = "rbxassetid://10709773669",
			["barcode"] = "rbxassetid://10747360675",
			["baseline"] = "rbxassetid://10709773863",
			["bath"] = "rbxassetid://10709773963",
			["battery"] = "rbxassetid://10709774640",
			["batterycharging"] = "rbxassetid://10709774068",
			["batteryfull"] = "rbxassetid://10709774206",
			["batterylow"] = "rbxassetid://10709774370",
			["batterymedium"] = "rbxassetid://10709774513",
			["beaker"] = "rbxassetid://10709774756",
			["bed"] = "rbxassetid://10709775036",
			["beddouble"] = "rbxassetid://10709774864",
			["bedsingle"] = "rbxassetid://10709774968",
			["beer"] = "rbxassetid://10709775167",
			["bell"] = "rbxassetid://10709775704",
			["bellminus"] = "rbxassetid://10709775241",
			["belloff"] = "rbxassetid://10709775320",
			["bellplus"] = "rbxassetid://10709775448",
			["bellring"] = "rbxassetid://10709775560",
			["bike"] = "rbxassetid://10709775894",
			["binary"] = "rbxassetid://10709776050",
			["bitcoin"] = "rbxassetid://10709776126",
			["bluetooth"] = "rbxassetid://10709776655",
			["bluetoothconnected"] = "rbxassetid://10709776240",
			["bluetoothoff"] = "rbxassetid://10709776344",
			["bluetoothsearching"] = "rbxassetid://10709776501",
			["bold"] = "rbxassetid://10747813908",
			["bomb"] = "rbxassetid://10709781460",
			["bone"] = "rbxassetid://10709781605",
			["book"] = "rbxassetid://10709781824",
			["bookopen"] = "rbxassetid://10709781717",
			["bookmark"] = "rbxassetid://10709782154",
			["bookmarkminus"] = "rbxassetid://10709781919",
			["bookmarkplus"] = "rbxassetid://10709782044",
			["bot"] = "rbxassetid://10709782230",
			["box"] = "rbxassetid://10709782497",
			["boxselect"] = "rbxassetid://10709782342",
			["boxes"] = "rbxassetid://10709782582",
			["briefcase"] = "rbxassetid://10709782662",
			["brush"] = "rbxassetid://10709782758",
			["bug"] = "rbxassetid://10709782845",
			["building"] = "rbxassetid://10709783051",
			["building2"] = "rbxassetid://10709782939",
			["bus"] = "rbxassetid://10709783137",
			["cake"] = "rbxassetid://10709783217",
			["calculator"] = "rbxassetid://10709783311",
			["calendar"] = "rbxassetid://10709789505",
			["calendarcheck"] = "rbxassetid://10709783474",
			["calendarcheck2"] = "rbxassetid://10709783392",
			["calendarclock"] = "rbxassetid://10709783577",
			["calendardays"] = "rbxassetid://10709783673",
			["calendarheart"] = "rbxassetid://10709783835",
			["calendarminus"] = "rbxassetid://10709783959",
			["calendaroff"] = "rbxassetid://10709788784",
			["calendarplus"] = "rbxassetid://10709788937",
			["calendarrange"] = "rbxassetid://10709789053",
			["calendarsearch"] = "rbxassetid://10709789200",
			["calendarx"] = "rbxassetid://10709789407",
			["calendarx2"] = "rbxassetid://10709789329",
			["camera"] = "rbxassetid://10709789686",
			["cameraoff"] = "rbxassetid://10747822677",
			["car"] = "rbxassetid://10709789810",
			["carrot"] = "rbxassetid://10709789960",
			["cast"] = "rbxassetid://10709790097",
			["charge"] = "rbxassetid://10709790202",
			["check"] = "rbxassetid://10709790644",
			["checkcircle"] = "rbxassetid://10709790387",
			["checkcircle2"] = "rbxassetid://10709790298",
			["checksquare"] = "rbxassetid://10709790537",
			["chefhat"] = "rbxassetid://10709790757",
			["cherry"] = "rbxassetid://10709790875",
			["chevrondown"] = "rbxassetid://10709790948",
			["chevronfirst"] = "rbxassetid://10709791015",
			["chevronlast"] = "rbxassetid://10709791130",
			["chevronleft"] = "rbxassetid://10709791281",
			["chevronright"] = "rbxassetid://10709791437",
			["chevronup"] = "rbxassetid://10709791523",
			["chevronsdown"] = "rbxassetid://10709796864",
			["chevronsdownup"] = "rbxassetid://10709791632",
			["chevronsleft"] = "rbxassetid://10709797151",
			["chevronsleftright"] = "rbxassetid://10709797006",
			["chevronsright"] = "rbxassetid://10709797382",
			["chevronsrightleft"] = "rbxassetid://10709797274",
			["chevronsup"] = "rbxassetid://10709797622",
			["chevronsupdown"] = "rbxassetid://10709797508",
			["chrome"] = "rbxassetid://10709797725",
			["circle"] = "rbxassetid://10709798174",
			["circledot"] = "rbxassetid://10709797837",
			["circleellipsis"] = "rbxassetid://10709797985",
			["circleslashed"] = "rbxassetid://10709798100",
			["citrus"] = "rbxassetid://10709798276",
			["clapperboard"] = "rbxassetid://10709798350",
			["clipboard"] = "rbxassetid://10709799288",
			["clipboardcheck"] = "rbxassetid://10709798443",
			["clipboardcopy"] = "rbxassetid://10709798574",
			["clipboardedit"] = "rbxassetid://10709798682",
			["clipboardlist"] = "rbxassetid://10709798792",
			["clipboardsignature"] = "rbxassetid://10709798890",
			["clipboardtype"] = "rbxassetid://10709798999",
			["clipboardx"] = "rbxassetid://10709799124",
			["clock"] = "rbxassetid://10709805144",
			["clock1"] = "rbxassetid://10709799535",
			["clock10"] = "rbxassetid://10709799718",
			["clock11"] = "rbxassetid://10709799818",
			["clock12"] = "rbxassetid://10709799962",
			["clock2"] = "rbxassetid://10709803876",
			["clock3"] = "rbxassetid://10709803989",
			["clock4"] = "rbxassetid://10709804164",
			["clock5"] = "rbxassetid://10709804291",
			["clock6"] = "rbxassetid://10709804435",
			["clock7"] = "rbxassetid://10709804599",
			["clock8"] = "rbxassetid://10709804784",
			["clock9"] = "rbxassetid://10709804996",
			["cloud"] = "rbxassetid://10709806740",
			["cloudcog"] = "rbxassetid://10709805262",
			["clouddrizzle"] = "rbxassetid://10709805371",
			["cloudfog"] = "rbxassetid://10709805477",
			["cloudhail"] = "rbxassetid://10709805596",
			["cloudlightning"] = "rbxassetid://10709805727",
			["cloudmoon"] = "rbxassetid://10709805942",
			["cloudmoonrain"] = "rbxassetid://10709805838",
			["cloudoff"] = "rbxassetid://10709806060",
			["cloudrain"] = "rbxassetid://10709806277",
			["cloudrainwind"] = "rbxassetid://10709806166",
			["cloudsnow"] = "rbxassetid://10709806374",
			["cloudsun"] = "rbxassetid://10709806631",
			["cloudsunrain"] = "rbxassetid://10709806475",
			["cloudy"] = "rbxassetid://10709806859",
			["clover"] = "rbxassetid://10709806995",
			["code"] = "rbxassetid://10709810463",
			["code2"] = "rbxassetid://10709807111",
			["codepen"] = "rbxassetid://10709810534",
			["codesandbox"] = "rbxassetid://10709810676",
			["coffee"] = "rbxassetid://10709810814",
			["cog"] = "rbxassetid://10709810948",
			["coins"] = "rbxassetid://10709811110",
			["columns"] = "rbxassetid://10709811261",
			["command"] = "rbxassetid://10709811365",
			["compass"] = "rbxassetid://10709811445",
			["component"] = "rbxassetid://10709811595",
			["conciergebell"] = "rbxassetid://10709811706",
			["connection"] = "rbxassetid://10747361219",
			["contact"] = "rbxassetid://10709811834",
			["contrast"] = "rbxassetid://10709811939",
			["cookie"] = "rbxassetid://10709812067",
			["copy"] = "rbxassetid://10709812159",
			["copyleft"] = "rbxassetid://10709812251",
			["copyright"] = "rbxassetid://10709812311",
			["cornerdownleft"] = "rbxassetid://10709812396",
			["cornerdownright"] = "rbxassetid://10709812485",
			["cornerleftdown"] = "rbxassetid://10709812632",
			["cornerleftup"] = "rbxassetid://10709812784",
			["cornerrightdown"] = "rbxassetid://10709812939",
			["cornerrightup"] = "rbxassetid://10709813094",
			["cornerupleft"] = "rbxassetid://10709813185",
			["cornerupright"] = "rbxassetid://10709813281",
			["cpu"] = "rbxassetid://10709813383",
			["croissant"] = "rbxassetid://10709818125",
			["crop"] = "rbxassetid://10709818245",
			["cross"] = "rbxassetid://10709818399",
			["crosshair"] = "rbxassetid://10709818534",
			["crown"] = "rbxassetid://10709818626",
			["cupsoda"] = "rbxassetid://10709818763",
			["curlybraces"] = "rbxassetid://10709818847",
			["currency"] = "rbxassetid://10709818931",
			["database"] = "rbxassetid://10709818996",
			["delete"] = "rbxassetid://10709819059",
			["diamond"] = "rbxassetid://10709819149",
			["dice1"] = "rbxassetid://10709819266",
			["dice2"] = "rbxassetid://10709819361",
			["dice3"] = "rbxassetid://10709819508",
			["dice4"] = "rbxassetid://10709819670",
			["dice5"] = "rbxassetid://10709819801",
			["dice6"] = "rbxassetid://10709819896",
			["dices"] = "rbxassetid://10723343321",
			["diff"] = "rbxassetid://10723343416",
			["disc"] = "rbxassetid://10723343537",
			["divide"] = "rbxassetid://10723343805",
			["dividecircle"] = "rbxassetid://10723343636",
			["dividesquare"] = "rbxassetid://10723343737",
			["dollarsign"] = "rbxassetid://10723343958",
			["download"] = "rbxassetid://10723344270",
			["downloadcloud"] = "rbxassetid://10723344088",
			["droplet"] = "rbxassetid://10723344432",
			["droplets"] = "rbxassetid://10734883356",
			["drumstick"] = "rbxassetid://10723344737",
			["edit"] = "rbxassetid://10734883598",
			["edit2"] = "rbxassetid://10723344885",
			["edit3"] = "rbxassetid://10723345088",
			["egg"] = "rbxassetid://10723345518",
			["eggfried"] = "rbxassetid://10723345347",
			["electricity"] = "rbxassetid://10723345749",
			["electricityoff"] = "rbxassetid://10723345643",
			["equal"] = "rbxassetid://10723345990",
			["equalnot"] = "rbxassetid://10723345866",
			["eraser"] = "rbxassetid://10723346158",
			["euro"] = "rbxassetid://10723346372",
			["expand"] = "rbxassetid://10723346553",
			["externallink"] = "rbxassetid://10723346684",
			["eye"] = "rbxassetid://10723346959",
			["eyeoff"] = "rbxassetid://10723346871",
			["factory"] = "rbxassetid://10723347051",
			["fan"] = "rbxassetid://10723354359",
			["fastforward"] = "rbxassetid://10723354521",
			["feather"] = "rbxassetid://10723354671",
			["figma"] = "rbxassetid://10723354801",
			["file"] = "rbxassetid://10723374641",
			["filearchive"] = "rbxassetid://10723354921",
			["fileaudio"] = "rbxassetid://10723355148",
			["fileaudio2"] = "rbxassetid://10723355026",
			["fileaxis3d"] = "rbxassetid://10723355272",
			["filebadge"] = "rbxassetid://10723355622",
			["filebadge2"] = "rbxassetid://10723355451",
			["filebarchart"] = "rbxassetid://10723355887",
			["filebarchart2"] = "rbxassetid://10723355746",
			["filebox"] = "rbxassetid://10723355989",
			["filecheck"] = "rbxassetid://10723356210",
			["filecheck2"] = "rbxassetid://10723356100",
			["fileclock"] = "rbxassetid://10723356329",
			["filecode"] = "rbxassetid://10723356507",
			["filecog"] = "rbxassetid://10723356830",
			["filecog2"] = "rbxassetid://10723356676",
			["filediff"] = "rbxassetid://10723357039",
			["filedigit"] = "rbxassetid://10723357151",
			["filedown"] = "rbxassetid://10723357322",
			["fileedit"] = "rbxassetid://10723357495",
			["fileheart"] = "rbxassetid://10723357637",
			["fileimage"] = "rbxassetid://10723357790",
			["fileinput"] = "rbxassetid://10723357933",
			["filejson"] = "rbxassetid://10723364435",
			["filejson2"] = "rbxassetid://10723364361",
			["filekey"] = "rbxassetid://10723364605",
			["filekey2"] = "rbxassetid://10723364515",
			["filelinechart"] = "rbxassetid://10723364725",
			["filelock"] = "rbxassetid://10723364957",
			["filelock2"] = "rbxassetid://10723364861",
			["fileminus"] = "rbxassetid://10723365254",
			["fileminus2"] = "rbxassetid://10723365086",
			["fileoutput"] = "rbxassetid://10723365457",
			["filepiechart"] = "rbxassetid://10723365598",
			["fileplus"] = "rbxassetid://10723365877",
			["fileplus2"] = "rbxassetid://10723365766",
			["filequestion"] = "rbxassetid://10723365987",
			["filescan"] = "rbxassetid://10723366167",
			["filesearch"] = "rbxassetid://10723366550",
			["filesearch2"] = "rbxassetid://10723366340",
			["filesignature"] = "rbxassetid://10723366741",
			["filespreadsheet"] = "rbxassetid://10723366962",
			["filesymlink"] = "rbxassetid://10723367098",
			["fileterminal"] = "rbxassetid://10723367244",
			["filetext"] = "rbxassetid://10723367380",
			["filetype"] = "rbxassetid://10723367606",
			["filetype2"] = "rbxassetid://10723367509",
			["fileup"] = "rbxassetid://10723367734",
			["filevideo"] = "rbxassetid://10723373884",
			["filevideo2"] = "rbxassetid://10723367834",
			["filevolume"] = "rbxassetid://10723374172",
			["filevolume2"] = "rbxassetid://10723374030",
			["filewarning"] = "rbxassetid://10723374276",
			["filex"] = "rbxassetid://10723374544",
			["filex2"] = "rbxassetid://10723374378",
			["files"] = "rbxassetid://10723374759",
			["film"] = "rbxassetid://10723374981",
			["filter"] = "rbxassetid://10723375128",
			["fingerprint"] = "rbxassetid://10723375250",
			["flag"] = "rbxassetid://10723375890",
			["flagoff"] = "rbxassetid://10723375443",
			["flagtriangleleft"] = "rbxassetid://10723375608",
			["flagtriangleright"] = "rbxassetid://10723375727",
			["flame"] = "rbxassetid://10723376114",
			["flashlight"] = "rbxassetid://10723376471",
			["flashlightoff"] = "rbxassetid://10723376365",
			["flaskconical"] = "rbxassetid://10734883986",
			["flaskround"] = "rbxassetid://10723376614",
			["fliphorizontal"] = "rbxassetid://10723376884",
			["fliphorizontal2"] = "rbxassetid://10723376745",
			["flipvertical"] = "rbxassetid://10723377138",
			["flipvertical2"] = "rbxassetid://10723377026",
			["flower"] = "rbxassetid://10747830374",
			["flower2"] = "rbxassetid://10723377305",
			["focus"] = "rbxassetid://10723377537",
			["folder"] = "rbxassetid://10723387563",
			["folderarchive"] = "rbxassetid://10723384478",
			["foldercheck"] = "rbxassetid://10723384605",
			["folderclock"] = "rbxassetid://10723384731",
			["folderclosed"] = "rbxassetid://10723384893",
			["foldercog"] = "rbxassetid://10723385213",
			["foldercog2"] = "rbxassetid://10723385036",
			["folderdown"] = "rbxassetid://10723385338",
			["folderedit"] = "rbxassetid://10723385445",
			["folderheart"] = "rbxassetid://10723385545",
			["folderinput"] = "rbxassetid://10723385721",
			["folderkey"] = "rbxassetid://10723385848",
			["folderlock"] = "rbxassetid://10723386005",
			["folderminus"] = "rbxassetid://10723386127",
			["folderopen"] = "rbxassetid://10723386277",
			["folderoutput"] = "rbxassetid://10723386386",
			["folderplus"] = "rbxassetid://10723386531",
			["foldersearch"] = "rbxassetid://10723386787",
			["foldersearch2"] = "rbxassetid://10723386674",
			["foldersymlink"] = "rbxassetid://10723386930",
			["foldertree"] = "rbxassetid://10723387085",
			["folderup"] = "rbxassetid://10723387265",
			["folderx"] = "rbxassetid://10723387448",
			["folders"] = "rbxassetid://10723387721",
			["forminput"] = "rbxassetid://10723387841",
			["forward"] = "rbxassetid://10723388016",
			["frame"] = "rbxassetid://10723394389",
			["framer"] = "rbxassetid://10723394565",
			["frown"] = "rbxassetid://10723394681",
			["fuel"] = "rbxassetid://10723394846",
			["functionsquare"] = "rbxassetid://10723395041",
			["gamepad"] = "rbxassetid://10723395457",
			["gamepad2"] = "rbxassetid://10723395215",
			["gauge"] = "rbxassetid://10723395708",
			["gavel"] = "rbxassetid://10723395896",
			["gem"] = "rbxassetid://10723396000",
			["ghost"] = "rbxassetid://10723396107",
			["gift"] = "rbxassetid://10723396402",
			["giftcard"] = "rbxassetid://10723396225",
			["gitbranch"] = "rbxassetid://10723396676",
			["gitbranchplus"] = "rbxassetid://10723396542",
			["gitcommit"] = "rbxassetid://10723396812",
			["gitcompare"] = "rbxassetid://10723396954",
			["gitfork"] = "rbxassetid://10723397049",
			["gitmerge"] = "rbxassetid://10723397165",
			["gitpullrequest"] = "rbxassetid://10723397431",
			["gitpullrequestclosed"] = "rbxassetid://10723397268",
			["gitpullrequestdraft"] = "rbxassetid://10734884302",
			["glass"] = "rbxassetid://10723397788",
			["glass2"] = "rbxassetid://10723397529",
			["glasswater"] = "rbxassetid://10723397678",
			["glasses"] = "rbxassetid://10723397895",
			["globe"] = "rbxassetid://10723404337",
			["globe2"] = "rbxassetid://10723398002",
			["grab"] = "rbxassetid://10723404472",
			["graduationcap"] = "rbxassetid://10723404691",
			["grape"] = "rbxassetid://10723404822",
			["grid"] = "rbxassetid://10723404936",
			["griphorizontal"] = "rbxassetid://10723405089",
			["gripvertical"] = "rbxassetid://10723405236",
			["hammer"] = "rbxassetid://10723405360",
			["hand"] = "rbxassetid://10723405649",
			["handmetal"] = "rbxassetid://10723405508",
			["harddrive"] = "rbxassetid://10723405749",
			["hardhat"] = "rbxassetid://10723405859",
			["hash"] = "rbxassetid://10723405975",
			["haze"] = "rbxassetid://10723406078",
			["headphones"] = "rbxassetid://10723406165",
			["heart"] = "rbxassetid://10723406885",
			["heartcrack"] = "rbxassetid://10723406299",
			["hearthandshake"] = "rbxassetid://10723406480",
			["heartoff"] = "rbxassetid://10723406662",
			["heartpulse"] = "rbxassetid://10723406795",
			["helpcircle"] = "rbxassetid://10723406988",
			["hexagon"] = "rbxassetid://10723407092",
			["highlighter"] = "rbxassetid://10723407192",
			["history"] = "rbxassetid://10723407335",
			["home"] = "rbxassetid://10723407389",
			["hourglass"] = "rbxassetid://10723407498",
			["icecream"] = "rbxassetid://10723414308",
			["image"] = "rbxassetid://10723415040",
			["imageminus"] = "rbxassetid://10723414487",
			["imageoff"] = "rbxassetid://10723414677",
			["imageplus"] = "rbxassetid://10723414827",
			["import"] = "rbxassetid://10723415205",
			["inbox"] = "rbxassetid://10723415335",
			["indent"] = "rbxassetid://10723415494",
			["indianrupee"] = "rbxassetid://10723415642",
			["infinity"] = "rbxassetid://10723415766",
			["info"] = "rbxassetid://10723415903",
			["inspect"] = "rbxassetid://10723416057",
			["italic"] = "rbxassetid://10723416195",
			["japaneseyen"] = "rbxassetid://10723416363",
			["joystick"] = "rbxassetid://10723416527",
			["key"] = "rbxassetid://10723416652",
			["keyboard"] = "rbxassetid://10723416765",
			["lamp"] = "rbxassetid://10723417513",
			["lampceiling"] = "rbxassetid://10723416922",
			["lampdesk"] = "rbxassetid://10723417016",
			["lampfloor"] = "rbxassetid://10723417131",
			["lampwalldown"] = "rbxassetid://10723417240",
			["lampwallup"] = "rbxassetid://10723417356",
			["landmark"] = "rbxassetid://10723417608",
			["languages"] = "rbxassetid://10723417703",
			["laptop"] = "rbxassetid://10723423881",
			["laptop2"] = "rbxassetid://10723417797",
			["lasso"] = "rbxassetid://10723424235",
			["lassoselect"] = "rbxassetid://10723424058",
			["laugh"] = "rbxassetid://10723424372",
			["layers"] = "rbxassetid://10723424505",
			["layout"] = "rbxassetid://10723425376",
			["layoutdashboard"] = "rbxassetid://10723424646",
			["layoutgrid"] = "rbxassetid://10723424838",
			["layoutlist"] = "rbxassetid://10723424963",
			["layouttemplate"] = "rbxassetid://10723425187",
			["leaf"] = "rbxassetid://10723425539",
			["library"] = "rbxassetid://10723425615",
			["lifebuoy"] = "rbxassetid://10723425685",
			["lightbulb"] = "rbxassetid://10723425852",
			["lightbulboff"] = "rbxassetid://10723425762",
			["linechart"] = "rbxassetid://10723426393",
			["link"] = "rbxassetid://10723426722",
			["link2"] = "rbxassetid://10723426595",
			["link2off"] = "rbxassetid://10723426513",
			["list"] = "rbxassetid://10723433811",
			["listchecks"] = "rbxassetid://10734884548",
			["listend"] = "rbxassetid://10723426886",
			["listminus"] = "rbxassetid://10723426986",
			["listmusic"] = "rbxassetid://10723427081",
			["listordered"] = "rbxassetid://10723427199",
			["listplus"] = "rbxassetid://10723427334",
			["liststart"] = "rbxassetid://10723427494",
			["listvideo"] = "rbxassetid://10723427619",
			["listx"] = "rbxassetid://10723433655",
			["loader"] = "rbxassetid://10723434070",
			["loader2"] = "rbxassetid://10723433935",
			["locate"] = "rbxassetid://10723434557",
			["locatefixed"] = "rbxassetid://10723434236",
			["locateoff"] = "rbxassetid://10723434379",
			["lock"] = "rbxassetid://10723434711",
			["login"] = "rbxassetid://10723434830",
			["logout"] = "rbxassetid://10723434906",
			["luggage"] = "rbxassetid://10723434993",
			["magnet"] = "rbxassetid://10723435069",
			["mail"] = "rbxassetid://10734885430",
			["mailcheck"] = "rbxassetid://10723435182",
			["mailminus"] = "rbxassetid://10723435261",
			["mailopen"] = "rbxassetid://10723435342",
			["mailplus"] = "rbxassetid://10723435443",
			["mailquestion"] = "rbxassetid://10723435515",
			["mailsearch"] = "rbxassetid://10734884739",
			["mailwarning"] = "rbxassetid://10734885015",
			["mailx"] = "rbxassetid://10734885247",
			["mails"] = "rbxassetid://10734885614",
			["map"] = "rbxassetid://10734886202",
			["mappin"] = "rbxassetid://10734886004",
			["mappinoff"] = "rbxassetid://10734885803",
			["maximize"] = "rbxassetid://10734886735",
			["maximize2"] = "rbxassetid://10734886496",
			["medal"] = "rbxassetid://10734887072",
			["megaphone"] = "rbxassetid://10734887454",
			["megaphoneoff"] = "rbxassetid://10734887311",
			["meh"] = "rbxassetid://10734887603",
			["menu"] = "rbxassetid://10734887784",
			["messagecircle"] = "rbxassetid://10734888000",
			["messagesquare"] = "rbxassetid://10734888228",
			["mic"] = "rbxassetid://10734888864",
			["mic2"] = "rbxassetid://10734888430",
			["micoff"] = "rbxassetid://10734888646",
			["microscope"] = "rbxassetid://10734889106",
			["microwave"] = "rbxassetid://10734895076",
			["milestone"] = "rbxassetid://10734895310",
			["minimize"] = "rbxassetid://10734895698",
			["minimize2"] = "rbxassetid://10734895530",
			["minus"] = "rbxassetid://10734896206",
			["minuscircle"] = "rbxassetid://10734895856",
			["minussquare"] = "rbxassetid://10734896029",
			["monitor"] = "rbxassetid://10734896881",
			["monitoroff"] = "rbxassetid://10734896360",
			["monitorspeaker"] = "rbxassetid://10734896512",
			["moon"] = "rbxassetid://10734897102",
			["morehorizontal"] = "rbxassetid://10734897250",
			["morevertical"] = "rbxassetid://10734897387",
			["mountain"] = "rbxassetid://10734897956",
			["mountainsnow"] = "rbxassetid://10734897665",
			["mouse"] = "rbxassetid://10734898592",
			["mousepointer"] = "rbxassetid://10734898476",
			["mousepointer2"] = "rbxassetid://10734898194",
			["mousepointerclick"] = "rbxassetid://10734898355",
			["move"] = "rbxassetid://10734900011",
			["move3d"] = "rbxassetid://10734898756",
			["movediagonal"] = "rbxassetid://10734899164",
			["movediagonal2"] = "rbxassetid://10734898934",
			["movehorizontal"] = "rbxassetid://10734899414",
			["movevertical"] = "rbxassetid://10734899821",
			["music"] = "rbxassetid://10734905958",
			["music2"] = "rbxassetid://10734900215",
			["music3"] = "rbxassetid://10734905665",
			["music4"] = "rbxassetid://10734905823",
			["navigation"] = "rbxassetid://10734906744",
			["navigation2"] = "rbxassetid://10734906332",
			["navigation2off"] = "rbxassetid://10734906144",
			["navigationoff"] = "rbxassetid://10734906580",
			["network"] = "rbxassetid://10734906975",
			["newspaper"] = "rbxassetid://10734907168",
			["octagon"] = "rbxassetid://10734907361",
			["option"] = "rbxassetid://10734907649",
			["outdent"] = "rbxassetid://10734907933",
			["package"] = "rbxassetid://10734909540",
			["package2"] = "rbxassetid://10734908151",
			["packagecheck"] = "rbxassetid://10734908384",
			["packageminus"] = "rbxassetid://10734908626",
			["packageopen"] = "rbxassetid://10734908793",
			["packageplus"] = "rbxassetid://10734909016",
			["packagesearch"] = "rbxassetid://10734909196",
			["packagex"] = "rbxassetid://10734909375",
			["paintbucket"] = "rbxassetid://10734909847",
			["paintbrush"] = "rbxassetid://10734910187",
			["paintbrush2"] = "rbxassetid://10734910030",
			["palette"] = "rbxassetid://10734910430",
			["palmtree"] = "rbxassetid://10734910680",
			["paperclip"] = "rbxassetid://10734910927",
			["partypopper"] = "rbxassetid://10734918735",
			["pause"] = "rbxassetid://10734919336",
			["pausecircle"] = "rbxassetid://10735024209",
			["pauseoctagon"] = "rbxassetid://10734919143",
			["pentool"] = "rbxassetid://10734919503",
			["pencil"] = "rbxassetid://10734919691",
			["percent"] = "rbxassetid://10734919919",
			["personstanding"] = "rbxassetid://10734920149",
			["phone"] = "rbxassetid://10734921524",
			["phonecall"] = "rbxassetid://10734920305",
			["phoneforwarded"] = "rbxassetid://10734920508",
			["phoneincoming"] = "rbxassetid://10734920694",
			["phonemissed"] = "rbxassetid://10734920845",
			["phoneoff"] = "rbxassetid://10734921077",
			["phoneoutgoing"] = "rbxassetid://10734921288",
			["piechart"] = "rbxassetid://10734921727",
			["piggybank"] = "rbxassetid://10734921935",
			["pin"] = "rbxassetid://10734922324",
			["pinoff"] = "rbxassetid://10734922180",
			["pipette"] = "rbxassetid://10734922497",
			["pizza"] = "rbxassetid://10734922774",
			["plane"] = "rbxassetid://10734922971",
			["play"] = "rbxassetid://10734923549",
			["playcircle"] = "rbxassetid://10734923214",
			["plus"] = "rbxassetid://10734924532",
			["pluscircle"] = "rbxassetid://10734923868",
			["plussquare"] = "rbxassetid://10734924219",
			["podcast"] = "rbxassetid://10734929553",
			["pointer"] = "rbxassetid://10734929723",
			["poundsterling"] = "rbxassetid://10734929981",
			["power"] = "rbxassetid://10734930466",
			["poweroff"] = "rbxassetid://10734930257",
			["printer"] = "rbxassetid://10734930632",
			["puzzle"] = "rbxassetid://10734930886",
			["quote"] = "rbxassetid://10734931234",
			["radio"] = "rbxassetid://10734931596",
			["radioreceiver"] = "rbxassetid://10734931402",
			["rectanglehorizontal"] = "rbxassetid://10734931777",
			["rectanglevertical"] = "rbxassetid://10734932081",
			["recycle"] = "rbxassetid://10734932295",
			["redo"] = "rbxassetid://10734932822",
			["redo2"] = "rbxassetid://10734932586",
			["refreshccw"] = "rbxassetid://10734933056",
			["refreshcw"] = "rbxassetid://10734933222",
			["refrigerator"] = "rbxassetid://10734933465",
			["regex"] = "rbxassetid://10734933655",
			["repeat"] = "rbxassetid://10734933966",
			["repeat1"] = "rbxassetid://10734933826",
			["reply"] = "rbxassetid://10734934252",
			["replyall"] = "rbxassetid://10734934132",
			["rewind"] = "rbxassetid://10734934347",
			["rocket"] = "rbxassetid://10734934585",
			["rockingchair"] = "rbxassetid://10734939942",
			["rotate3d"] = "rbxassetid://10734940107",
			["rotateccw"] = "rbxassetid://10734940376",
			["rotatecw"] = "rbxassetid://10734940654",
			["rss"] = "rbxassetid://10734940825",
			["ruler"] = "rbxassetid://10734941018",
			["russianruble"] = "rbxassetid://10734941199",
			["sailboat"] = "rbxassetid://10734941354",
			["save"] = "rbxassetid://10734941499",
			["scale"] = "rbxassetid://10734941912",
			["scale3d"] = "rbxassetid://10734941739",
			["scaling"] = "rbxassetid://10734942072",
			["scan"] = "rbxassetid://10734942565",
			["scanface"] = "rbxassetid://10734942198",
			["scanline"] = "rbxassetid://10734942351",
			["scissors"] = "rbxassetid://10734942778",
			["screenshare"] = "rbxassetid://10734943193",
			["screenshareoff"] = "rbxassetid://10734942967",
			["scroll"] = "rbxassetid://10734943448",
			["search"] = "rbxassetid://10734943674",
			["send"] = "rbxassetid://10734943902",
			["separatorhorizontal"] = "rbxassetid://10734944115",
			["separatorvertical"] = "rbxassetid://10734944326",
			["server"] = "rbxassetid://10734949856",
			["servercog"] = "rbxassetid://10734944444",
			["servercrash"] = "rbxassetid://10734944554",
			["serveroff"] = "rbxassetid://10734944668",
			["settings"] = "rbxassetid://10734950309",
			["settings2"] = "rbxassetid://10734950020",
			["share"] = "rbxassetid://10734950813",
			["share2"] = "rbxassetid://10734950553",
			["sheet"] = "rbxassetid://10734951038",
			["shield"] = "rbxassetid://10734951847",
			["shieldalert"] = "rbxassetid://10734951173",
			["shieldcheck"] = "rbxassetid://10734951367",
			["shieldclose"] = "rbxassetid://10734951535",
			["shieldoff"] = "rbxassetid://10734951684",
			["shirt"] = "rbxassetid://10734952036",
			["shoppingbag"] = "rbxassetid://10734952273",
			["shoppingcart"] = "rbxassetid://10734952479",
			["shovel"] = "rbxassetid://10734952773",
			["showerhead"] = "rbxassetid://10734952942",
			["shrink"] = "rbxassetid://10734953073",
			["shrub"] = "rbxassetid://10734953241",
			["shuffle"] = "rbxassetid://10734953451",
			["sidebar"] = "rbxassetid://10734954301",
			["sidebarclose"] = "rbxassetid://10734953715",
			["sidebaropen"] = "rbxassetid://10734954000",
			["sigma"] = "rbxassetid://10734954538",
			["signal"] = "rbxassetid://10734961133",
			["signalhigh"] = "rbxassetid://10734954807",
			["signallow"] = "rbxassetid://10734955080",
			["signalmedium"] = "rbxassetid://10734955336",
			["signalzero"] = "rbxassetid://10734960878",
			["siren"] = "rbxassetid://10734961284",
			["skipback"] = "rbxassetid://10734961526",
			["skipforward"] = "rbxassetid://10734961809",
			["skull"] = "rbxassetid://10734962068",
			["slack"] = "rbxassetid://10734962339",
			["slash"] = "rbxassetid://10734962600",
			["slice"] = "rbxassetid://10734963024",
			["sliders"] = "rbxassetid://10734963400",
			["slidershorizontal"] = "rbxassetid://10734963191",
			["smartphone"] = "rbxassetid://10734963940",
			["smartphonecharging"] = "rbxassetid://10734963671",
			["smile"] = "rbxassetid://10734964441",
			["smileplus"] = "rbxassetid://10734964188",
			["snowflake"] = "rbxassetid://10734964600",
			["sofa"] = "rbxassetid://10734964852",
			["sortasc"] = "rbxassetid://10734965115",
			["sortdesc"] = "rbxassetid://10734965287",
			["speaker"] = "rbxassetid://10734965419",
			["sprout"] = "rbxassetid://10734965572",
			["square"] = "rbxassetid://10734965702",
			["star"] = "rbxassetid://10734966248",
			["starhalf"] = "rbxassetid://10734965897",
			["staroff"] = "rbxassetid://10734966097",
			["stethoscope"] = "rbxassetid://10734966384",
			["sticker"] = "rbxassetid://10734972234",
			["stickynote"] = "rbxassetid://10734972463",
			["stopcircle"] = "rbxassetid://10734972621",
			["stretchhorizontal"] = "rbxassetid://10734972862",
			["stretchvertical"] = "rbxassetid://10734973130",
			["strikethrough"] = "rbxassetid://10734973290",
			["subscript"] = "rbxassetid://10734973457",
			["sun"] = "rbxassetid://10734974297",
			["sundim"] = "rbxassetid://10734973645",
			["sunmedium"] = "rbxassetid://10734973778",
			["sunmoon"] = "rbxassetid://10734973999",
			["sunsnow"] = "rbxassetid://10734974130",
			["sunrise"] = "rbxassetid://10734974522",
			["sunset"] = "rbxassetid://10734974689",
			["superscript"] = "rbxassetid://10734974850",
			["swissfranc"] = "rbxassetid://10734975024",
			["switchcamera"] = "rbxassetid://10734975214",
			["sword"] = "rbxassetid://10734975486",
			["swords"] = "rbxassetid://10734975692",
			["syringe"] = "rbxassetid://10734975932",
			["table"] = "rbxassetid://10734976230",
			["table2"] = "rbxassetid://10734976097",
			["tablet"] = "rbxassetid://10734976394",
			["tag"] = "rbxassetid://10734976528",
			["tags"] = "rbxassetid://10734976739",
			["target"] = "rbxassetid://10734977012",
			["tent"] = "rbxassetid://10734981750",
			["terminal"] = "rbxassetid://10734982144",
			["terminalsquare"] = "rbxassetid://10734981995",
			["textcursor"] = "rbxassetid://10734982395",
			["textcursorinput"] = "rbxassetid://10734982297",
			["thermometer"] = "rbxassetid://10734983134",
			["thermometersnowflake"] = "rbxassetid://10734982571",
			["thermometersun"] = "rbxassetid://10734982771",
			["thumbsdown"] = "rbxassetid://10734983359",
			["thumbsup"] = "rbxassetid://10734983629",
			["ticket"] = "rbxassetid://10734983868",
			["timer"] = "rbxassetid://10734984606",
			["timeroff"] = "rbxassetid://10734984138",
			["timerreset"] = "rbxassetid://10734984355",
			["toggleleft"] = "rbxassetid://10734984834",
			["toggleright"] = "rbxassetid://10734985040",
			["tornado"] = "rbxassetid://10734985247",
			["toybrick"] = "rbxassetid://10747361919",
			["train"] = "rbxassetid://10747362105",
			["trash"] = "rbxassetid://10747362393",
			["trash2"] = "rbxassetid://10747362241",
			["treedeciduous"] = "rbxassetid://10747362534",
			["treepine"] = "rbxassetid://10747362748",
			["trees"] = "rbxassetid://10747363016",
			["trendingdown"] = "rbxassetid://10747363205",
			["trendingup"] = "rbxassetid://10747363465",
			["triangle"] = "rbxassetid://10747363621",
			["trophy"] = "rbxassetid://10747363809",
			["truck"] = "rbxassetid://10747364031",
			["tv"] = "rbxassetid://10747364593",
			["tv2"] = "rbxassetid://10747364302",
			["type"] = "rbxassetid://10747364761",
			["umbrella"] = "rbxassetid://10747364971",
			["underline"] = "rbxassetid://10747365191",
			["undo"] = "rbxassetid://10747365484",
			["undo2"] = "rbxassetid://10747365359",
			["unlink"] = "rbxassetid://10747365771",
			["unlink2"] = "rbxassetid://10747397871",
			["unlock"] = "rbxassetid://10747366027",
			["upload"] = "rbxassetid://10747366434",
			["uploadcloud"] = "rbxassetid://10747366266",
			["usb"] = "rbxassetid://10747366606",
			["user"] = "rbxassetid://10747373176",
			["usercheck"] = "rbxassetid://10747371901",
			["usercog"] = "rbxassetid://10747372167",
			["userminus"] = "rbxassetid://10747372346",
			["userplus"] = "rbxassetid://10747372702",
			["userx"] = "rbxassetid://10747372992",
			["users"] = "rbxassetid://10747373426",
			["utensils"] = "rbxassetid://10747373821",
			["utensilscrossed"] = "rbxassetid://10747373629",
			["venetianmask"] = "rbxassetid://10747374003",
			["verified"] = "rbxassetid://10747374131",
			["vibrate"] = "rbxassetid://10747374489",
			["vibrateoff"] = "rbxassetid://10747374269",
			["video"] = "rbxassetid://10747374938",
			["videooff"] = "rbxassetid://10747374721",
			["view"] = "rbxassetid://10747375132",
			["voicemail"] = "rbxassetid://10747375281",
			["volume"] = "rbxassetid://10747376008",
			["volume1"] = "rbxassetid://10747375450",
			["volume2"] = "rbxassetid://10747375679",
			["volumex"] = "rbxassetid://10747375880",
			["wallet"] = "rbxassetid://10747376205",
			["wand"] = "rbxassetid://10747376565",
			["wand2"] = "rbxassetid://10747376349",
			["watch"] = "rbxassetid://10747376722",
			["waves"] = "rbxassetid://10747376931",
			["webcam"] = "rbxassetid://10747381992",
			["wifi"] = "rbxassetid://10747382504",
			["wifioff"] = "rbxassetid://10747382268",
			["wind"] = "rbxassetid://10747382750",
			["wraptext"] = "rbxassetid://10747383065",
			["wrench"] = "rbxassetid://10747383470",
			["x"] = "rbxassetid://10747384394",
			["xcircle"] = "rbxassetid://10747383819",
			["xoctagon"] = "rbxassetid://10747384037",
			["xsquare"] = "rbxassetid://10747384217",
			["zoomin"] = "rbxassetid://10747384552",
			["zoomout"] = "rbxassetid://10747384679"
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
