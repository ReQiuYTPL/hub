repeat task.wait() until game:IsLoaded() and Nexus

if not Nexus.IsConnected then Nexus.Connected:Wait() end

Nexus:CreateButton('highland', 'Highland Cow', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('highland', function()
    ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","jan_refresh_2023_bloodhound",{})
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
