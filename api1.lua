-- Se você colocou a library em um ModuleScript ou retornou a tabela MyLibrary:
local Astrax = MyLibrary -- Ou loadstring(game:HttpGet("..."))()

-- 1. Criar a Janela Principal
local Window = Astrax:MakeWindow({
    Title = "Astrax Hub",
    SubTitle = "VIP Edition",
    SaveFolder = "astrax_config.json" -- Arquivo onde salva as configurações
})

-- 2. Criar Abas
local MainTab   = Window:MakeTab({ Title = "Geral", Icon = "home" })
local CombatTab = Window:MakeTab({ Title = "Combate & Defesa", Icon = "sword" })
local ConfigTab = Window:MakeTab({ Title = "Ajustes", Icon = "settings" })

-- ════════════════ ABA GERAL ════════════════
MainTab:AddSection("Informações & Utilidades")

MainTab:AddParagraph({
    Title = "Bem-vindo!",
    Text = "Astrax Hub v2 carregado com sucesso. Selecione as opções abaixo."
})

MainTab:AddButton({
    Name = "Resetar Personagem",
    Desc = "Força a morte do personagem imediatamente.",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Health = 0
        end
    end
})

MainTab:AddToggle({
    Name = "Pulo Infinito",
    Desc = "Permite pular continuamente no ar.",
    Default = false,
    Flag = "InfiniteJump",
    Callback = function(state)
        _G.InfJump = state
    end
})

MainTab:AddSlider({
    Name = "Velocidade (Speed)",
    Desc = "Ajusta o WalkSpeed do seu boneco.",
    Min = 16,
    Max = 200,
    Increase = 1,
    Default = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(val)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = val end
    end
})

MainTab:AddTextBox({
    Name = "Teleporte por Nome",
    PlaceholderText = "Nome do jogador...",
    ClearText = false,
    Callback = function(text)
        print("Buscando jogador: " .. text)
    end
})

-- ════════════════ ABA COMBATE ════════════════
CombatTab:AddSection("Defesa")

-- Exemplo da função especial que você incluiu:
CombatTab:AddAntiTools({
    Name = "Anti-Tools",
    Desc = "Deleta qualquer item colocado no inventário/mão.",
    Default = false,
    Flag = "AntiToolsEnabled"
})

CombatTab:AddDropdown({
    Name = "Alvo Prioritário",
    Desc = "Escolha quem o sistema deve focar.",
    Options = {"Mais Próximo", "Menor Vida", "Líder do Servidor"},
    Default = "Mais Próximo",
    MultiSelect = false,
    Flag = "TargetDropdown",
    Callback = function(selected)
        print("Novo alvo: ", selected)
    end
})

-- ════════════════ ABA CONFIGURAÇÕES ════════════════
ConfigTab:AddSection("Comunidade")

ConfigTab:AddDiscordInvite({
    Name = "Servidor Oficial",
    Desc = "Entre na comunidade para suporte e atualizações.",
    Logo = "rbxassetid://10709782230", -- Ícone de bot ou sua imagem
    Invite = "https://discord.gg/seulink"
})

ConfigTab:AddButton({
    Name = "Minimizar Janela",
    Desc = "Oculta a interface.",
    Callback = function()
        Window:Minimize()
    end
})
