repeat task.wait() until game:IsLoaded() and Nexus

if not Nexus.IsConnected then Nexus.Connected:Wait() end

Nexus:CreateButton('moonbearbox', 'Feesh', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('moonbearbox', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("gifts","meme_2023_feesh",{})
end)

Nexus:CreateButton('moonrabbit', 'Frog Spawn', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('moonrabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","meme_2023_frogspawn",{})
end)

Nexus:CreateButton('waterrabbit', 'Japan Egg', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('waterrabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","japan_2022_egg",{})
end)

Nexus:CreateButton('amamirabbit', 'Cracked Egg', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('amamirabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","cracked_egg",{})
end)

Nexus:CreateTextBox('cuenta', 'Cuenta', { 100, 20 }, { 10, 10, 10, 10 })

Nexus:CreateButton('dartodo', 'Dar todo', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('dartodo', function()
    local MainAccount = Nexus:GetText('cuenta')
    local Pets = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()[game.Players.LocalPlayer.Name].inventory.pets or {}
    for k,v in pairs(Pets) do
        game:GetService("ReplicatedStorage").API:FindFirstChild("TradeAPI/GiveItem"):InvokeServer(game:GetService("Players")[MainAccount], v['unique'])
    end
end)
