repeat task.wait() until game:IsLoaded() and Nexus

if not Nexus.IsConnected then Nexus.Connected:Wait() end

Nexus:CreateButton('moonbearbox', 'Moon Bear Box', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('moonbearbox', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("gifts","lny_2023_moon_bear_box",{})
end)

Nexus:CreateButton('moonrabbit', 'Moon Rabbit', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('moonrabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","lny_2023_moon_rabbit",{})
end)

Nexus:CreateButton('waterrabbit', 'Water Rabbit', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('waterrabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","lny_2023_water_rabbit",{})
end)

Nexus:CreateButton('amamirabbit', 'Amami Rabbit', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('amamirabbit', function()
    game.ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","lny_2023_amami_rabbit",{})
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
