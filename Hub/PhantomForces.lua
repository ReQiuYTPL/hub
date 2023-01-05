print("Loading PhantomForces...")

while not game:GetService("Players").LocalPlayer do
    Wait(1)
end

print("PhantomForces Loaded!")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local workspace = game:GetService("Workspace")

local NoFallDamagePF = false
local transparency = 0.5
local color = Color3.fromRGB(255,0,0)

local PhantomForces = _G.Window:CreateTab("PhantomForces", 12020275062)
local PhantomForcesSection = PhantomForces:CreateSection("PhantomForces")

PhantomForces:CreateToggle({
    Name = "No Fall Damage",
    CurrentValue = false,
    Flag = "PhantomForces-nofall",
    Callback = function(state)
        NoFallDamagePF = state
    end,
})

local highlights = nil
highlights = Instance.new('Folder', game:service'CoreGui')
highlights.Name = "No Son Chetos"

PhantomForces:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "PhantomForces-esp",
    Callback = function(state)
        ESP = state
        if ESP then
            for k,v in pairs(game.Workspace.Players:GetChildren()) do
                for k2,v2 in pairs(v:GetChildren()) do
                    if v2:IsA'Model' and v2.Name == 'Player' then
                        if not sameteam(v2) then
                            local highlight = Instance.new('Highlight', highlights)
                            highlight.Adornee = v2
                            highlight.FillColor = color
                            highlight.FillTransparency = transparency

                            highlight.Adornee.Changed:Connect(function()
                                if not highlight.Adornee or not highlight.Adornee.Parent then
                                    highlight:Destroy()
                                end
                            end)
                        end
                    end
                end
            end
        else
            highlights:Destroy()
            highlights = Instance.new('Folder', game:service'CoreGui')
            highlights.Name = "No Son Chetos"
        end
    end,
})

PhantomForces:CreateSlider({
    Name = "ESP Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Transparency",
    CurrentValue = 0.5,
    Flag = "PhantomForces-transparency",
    Callback = function(Value)
        transparency = Value
        for k,v in pairs(highlights:GetChildren()) do
            v.FillTransparency = color
        end
    end,
})

PhantomForces:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255,0,0),
    Flag = "PhantomForces-color",
    Callback = function(Value)
        color = Value
        for k,v in pairs(highlights:GetChildren()) do
            v.FillColor = color
        end
    end
})

game.Workspace.Players.DescendantAdded:Connect(function(v)
    if ESP then
        if v:IsA'Model' and v.Name == 'Player' then
            if not sameteam(v) then
                local highlight = Instance.new('Highlight', highlights)
                highlight.Adornee = v
                highlight.FillColor = color
                highlight.FillTransparency = transparency

                highlight.Adornee.Changed:Connect(function()
                    if not highlight.Adornee or not highlight.Adornee.Parent then
                        highlight:Destroy()
                    end
                end)
            end
        end
    end
end)

local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall
mt.__namecall = function(self,...)
    local args = {...}
    if NoFallDamagePF and args[1] == "falldamage" then
        return
    end
    return namecall(self,...)
end

local teams = {
    ["Ghosts"] = "Bright orange",
    ["Phantoms"] = "Bright blue"
}

function sameteam(player)
    local team = tostring(game.Players.LocalPlayer.Team)
    local playerTeam = teams[team]
    return (player.Parent.Name~=nil and player.Parent.Name==playerTeam) or false
end

_G.Library:LoadConfiguration()