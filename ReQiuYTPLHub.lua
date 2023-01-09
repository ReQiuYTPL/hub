repeat wait() until game:IsLoaded()
repeat wait(0.1) print("Cargando juego...") until (game.PlaceId ~= 0 and game.PlaceId ~= nil)
wait(1)

print("Game: "..game.PlaceId)

_G.Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

_G.Window = _G.Library:CreateWindow({
   Name = "ReQiuYTPL Hub",
   LoadingTitle = "Loading ReQiuYTPL Hub...",
   LoadingSubtitle = "by ReQiuYTPL",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ReQiuYTPL Hub", -- Create a custom folder for your hub/game
      FileName = "Game-"..game.PlaceId
   },
--    Discord = {
--       Enabled = true,
--       Invite = "rR42njFhEz", -- The Discord invite code, do not include discord.gg/
--       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
--    },
--    KeySystem = true, -- Set this to true to use our key system
--    KeySettings = {
--       Title = "Sirius Hub",
--       Subtitle = "Key System",
--       Note = "Join the discord (discord.gg/sirius)",
--       FileName = "SiriusKey",
--       SaveKey = true,
--       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
--       Key = "Hello"
--    }
})

-- VARIABLES
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local workspace = game:GetService("Workspace")
local ESP = false
local SilentAimSnipers = false
local AimLockArsenal = false
local InfiniteAmmoSnipers = false
local NoFallDamagePF = false
local SAFOV = 350
local SilentAimPF = false
local path = false
local VisibleFovPF = false
local VisibleFovSnipers = false
local SilentAimCounterBlox = false
local antiAfkButton = nil
local botonGUI = Enum.KeyCode.RightControl
local camera = workspace.CurrentCamera
local usernameAPI = nil
local mouse = Player:GetMouse()
local allloaded = false
local antiafk = false
local limiter = false
local autoMinimize = false
local noclip = false

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Main = _G.Window:CreateTab("Main", 12019566576)
local MainSection = Main:CreateSection("Main")
-- local Settings = _G.Window:CreateTab("Settings", 12019584168)
-- local SettingsSection = Settings:CreateSection("Settings")

local Table = {6152116144, 185655149}
local Set = setfpscap
local focused = true
Main:CreateToggle({
    Name = "CPU Limiter",
    CurrentValue = false,
    Flag = "limiter",
    Callback = function(state)
        if allloaded then
            limiter = state
            if state then
                local UGS = UserSettings():GetService'UserGameSettings'
                settings().Rendering.QualityLevel = 1
                RunService:Set3dRenderingEnabled(false)
                if table.find(Table, game.PlaceId) then
                    Set(30)
                else
                    Set(5)
                end
            end
        end
    end,
})
Main:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "antiafk",
    Callback = function(state)
        if allloaded then
		    antiafk = state
        end
    end,
})
Main:CreateToggle({
    Name = "Auto Hide",
    CurrentValue = false,
    Flag = "autohide",
    Callback = function(state)
        if state then
            game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.RightShift,false,game)
        end
    end,
})
Main:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip",
    Callback = function(state)
        noclip = state
        while noclip do
            Wait(0.1)
            for i, v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") or v:IsA("Part") then
                    v.CanCollide = false
                end
            end
        end
    end,
})
UIS.WindowFocusReleased:Connect(function()
    if limiter then
        RunService:Set3dRenderingEnabled(false)
        if table.find(Table, game.PlaceId) then
            Set(30)
        else
            Set(5)
        end
    end
end)

UIS.WindowFocused:Connect(function()
    if limiter then
        RunService:Set3dRenderingEnabled(true)
        Set(60)
    end
end)

Main:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 15,
    Callback = function(Value)
        if allloaded then
		    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

Main:CreateSlider({
    Name = "JumpPower",
    Range = {0, 500},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 50,
    Callback = function(Value)
        if allloaded then
		    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end,
})

Main:CreateToggle({
    Name = "Rainbow Path",
    CurrentValue = false,
    Callback = function(state)
        if allloaded then
            path = state
            while path do
                local part = Instance.new("Part")
                part.Size = Vector3.new(10, 0.5, 10)
                local r = math.random(1,255)
                local g = math.random(1,255)
                local b = math.random(1,255)
                part.Color = Color3.fromRGB(r, g, b)
                part.Transparency = 0.25
                part.Material = Enum.Material.Neon
                part.Parent = game.Workspace
                part.Anchored = true
                part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-3.59,0))
                game.Debris:AddItem(part, 5)
                Wait(0.1)
            end
        end
    end,
})

game:GetService("Players").LocalPlayer.Idled:connect(function()
    if antiafk then
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
end)

spawn(function()
    Wait(10)
    local Discord = _G.Window:CreateTab("Discord", 12106760494)
    local DiscordSection = Discord:CreateSection("Discord")
    Discord:CreateButton({
        Name = "Discord",
        Callback = function()
            if request then
                request({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = HttpService:JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = HttpService:GenerateGUID(false),
                        args = {code = "rR42njFhEz"}
                    })
                })
            end      
        end,
    })
end)

-- local FPSSection = Main:NewSection("FPS Games")
-- FPSSection:NewToggle("ESP", "ESP", function(state)
--     ESP = state
--     if (game.PlaceId == 292439477) == true then
--         for i,v in pairs(workspace.Players:GetDescendants()) do
--             addtoplayer(v)
--         end
--     end
-- end)

-- function NotBehindWall(target)
--     local plr = game:GetService("Players").LocalPlayer
--     local ray = Ray.new(plr.Character.Head.Position, (target.Position - plr.Character.Head.Position).Unit * 300)
--     local part, position = game.GetService("Workspace"):FindPartOnRayOnlyWithIgnoreList(ray, {plr.Character}, false, true)
--     if part then
--         local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
--         if not humanoid then
--             humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
--         end
--         if humanoid and target and humanoid.Parent == target.Parent then
--             local pos, visible = camera:WorldToScreenPoint(target.Position)
--             if visible then
--                 return true
--             end 
--         end
--     end
-- end

--                           PHANTOM FORCES                                 --

-- function getroot(player)
--     if (player == nil) then return end
--     if (rootshit[player]) then return rootshit[player] end

--     local char
--     if (player:IsA("Player")) then
--         char = getcharacter(player)
--     else
--         char = player
--     end

--     if (char ~= nil) then
--         return (findFirstChild(char, "Torso") or char.PrimaryPart)
--     end

--     return
-- end

-- getcharacter = function(player)
--     if player == LocalPlayer then
--         return char.rootpart and char.rootpart.Parent
--     end

--     for i,v in pairs(debug.getupvalue(replication.getplayerhit, 1)) do
--         if v == player then
--             return i
--         end
--     end
-- end

-- function isalive(_1, _2)
--     if _1 == nil then return end
--     local Char, RootPart
--     if _2 ~= nil then
--         Char, RootPart = _1,_2
--     else
--         Char = getcharacter(_1)
--         RootPart = Char and (Char:FindFirstChild("Torso") or Char.PrimaryPart)
--     end

--     if Char and RootPart then
--         local Human = findFirstChildOfClass(Char, "Humanoid")
--         if RootPart and Human then
--             if Human.Health > 0 then
--                 return true
--             end
--         elseif RootPart and isDescendantOf(Char, game) then
--             return true
--         end
--     end

--     return false
-- end

-- function getDistanceFromMouse(position)
--     local mouse = Player:GetMouse()
--     local screenpos, vis = worldToViewportPoint(currentcamera, position)
--     if vis and screenpos.Z > 0 then
--         return (v2new(mouse.X, mouse.Y) - v2new(screenpos.X, screenpos.Y)).Magnitude
--     end
--     return math.huge
-- end

-- function sameteam(player, p1)
--     local p0 = p1 or Player
--     return (player.Team~=nil and player.Team==p0.Team) and player.Neutral == false or false
-- end

-- function getClosestMouseTarget(settings)
--     local closest, temp = nil, settings.fov or math.huge
--     local plr

--     local mychar = getcharacter(Player)
--     local myroot = getroot(mychar)

--     for i,v in pairs(getPlayers(players)) do
--         if (Player ~= v and (settings.ignoreteam==true and sameteam(v)==false or settings.ignoreteam == false)) then
--             local character = getcharacter(v)
--             if character then
--                 local part = findFirstChild(character, settings.name or "Torso") or findFirstChild(character, "Torso") or character.PrimaryPart
--                 if part and part:IsA("BasePart") then
--                     local legal = true

--                     local distance = getDistanceFromMouse(part.CFrame.Position)
--                     if temp <= distance then
--                         legal = false
--                     end

--                     if legal and settings.checkifalive then
--                         local isalive = isalive(character, part)
--                         if not isalive then
--                             legal = false
--                         end
--                     end

--                     if legal and settings.ignorewalls == false then
--                         if not isvisible(character, part, (settings.maxobscuringparts or 0)) then
--                             legal = false
--                         end
--                     end

--                     if legal and myroot and settings.maxdist then
--                         if settings.maxdist < (myroot.Position - part.Position).Magnitude then
--                             legal = false
--                         end
--                     end

--                     if legal then
--                         temp = distance
--                         closest = part
--                         plr = v
--                     end
--                 end
--             end
--         end
--     end
--     return closest, temp, plr
-- end

-- local insert = table.insert
-- local newd = Drawing.new

-- local drawn = {}
-- function clearDrawn()
--     for i,v in pairs(drawn) do
--         pcall(function() v:Remove() end)
--         drawn[i] = nil
--     end
--     drawn = {}
-- end

-- function newdrawing(class, props)
--     local new = newd(class)
--     for i,v in pairs(props) do
--         new[i] = v
--     end
--     insert(drawn, new)
--     return new
-- end

-- local circle = newdrawing("Circle", {
--     Position = Vector2.new(mouse.X, mouse.Y+36),
--     Radius = SAFOV,
--     Color = Color3.fromRGB(240,240,240),
--     Thickness = 1,
--     Filled = false,
--     Transparency = 0,
--     NumSides = 12,
--     Visible = true;
-- })

--                           PHANTOM FORCES                                 --

-- function ClosestPlayerToMouseArsenal()
--     local dist = math.huge
--     local target = nil
--     for k,v in pairs(game:GetService("Players"):GetPlayers()) do
--         if v~= Player and v.Character and v.Character:FindFirstChild("Head") and v.TeamColor ~= Player.TeamColor then
--             local distance = (v.Character.Head.Position - Player.Character.Head.Position).magnitude
--             if distance < dist then
--                 --if NotBehindWall(v.Character.Head) then
--                     dist = distance
--                     target = v
--                 --end
--             end
--         end
--     end
--     return target
-- end

-- function ClosestPlayerToMouse()
--     local dist = math.huge
--     local target = nil
--     for k,v in pairs(game:GetService("Players"):GetPlayers()) do
--         if v~= game:GetService("Players").LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
--             local screenpoint = camera:WorldToScreenPoint(v.Character.Head.Position)
--             local check = (Vector2.new(mouse.X, mouse.Y)-Vector2.new(screenpoint.X, screenpoint.Y)).magnitude
--             if check < dist and SAFOV > check then
--                 dist = check
--                 target = v
--             end
--         end
--     end
--     return target
-- end

-- local AimLock = false
-- UIS.InputBegan:Connect(function(inp)
--     if inp.KeyCode == Enum.KeyCode.LeftAlt then
--         if AimLockArsenal then
--             AimLock = true
--             while wait() do
--                 camera.CFrame = CFrame.new(camera.CFrame.Position,ClosestPlayerToMouseArsenal().Character.Head.Position)
--                 if AimLock == false then return end
--             end
--         end
--     end
-- end)

-- UIS.InputEnded:Connect(function(inp)
--     if inp.KeyCode == Enum.KeyCode.LeftAlt then
--         if AimLockArsenal then
--             AimLock = false
--         end
--     end
-- end)

-- local mt = getrawmetatable(game)
-- setreadonly(mt, false)
-- local namecall = mt.__namecall
-- mt.__namecall = function(self,...)
--     local args = {...}
--     if tostring(self) == "WeaponHit" and SilentAimSnipers then
--         local JugadorMasCercanoALaMira = ClosestPlayerToMouse()
--         if JugadorMasCercanoALaMira then
--             args[2]["part"] = JugadorMasCercanoALaMira.Character.Head
--             args[2]["p"] = JugadorMasCercanoALaMira.Character.Head.Position
--             args[2]["h"] = JugadorMasCercanoALaMira.Character.Humanoid
--             args[2]["maxDist"] = 1000000.0
--             args[2]["m"] = Enum.Material.Plastic
--             args[2]["pid"] = 1
--             return self.FireServer(self,unpack(args))
--         end
--     end
--     if NoFallDamagePF and args[1] == "falldamage" then
--         return
--     end
--     if SilentAimPF and args[1] == "CFrame" then
--         local barrel = gamelogic and gamelogic.currentgun and gamelogic.currentgun.barrel
--         local sight = gamelogic and gamelogic.currentgun and gamelogic.currentgun.aimsightdata and gamelogic.currentgun.aimsightdata[1] and gamelogic.currentgun.aimsightdata[1].sightpart
--         if barrel and (self == barrel or self == sight) then
--             local Head, dist, plr = getClosestMouseTarget({
--                 ignoreteam = true,
--                 ignorewalls = false,
--                 maxobscuringparts = 0,
--                 name = 'Head',
--                 fov = SAFOV,
--                 maxdist = 3000,
--                 checkifalive = false
--             })

--             if Head then
--                 local bulletspeed = gamelogic.currentgun.data and gamelogic.currentgun.data.bulletspeed or dist * 10
--                 local t = (bulletspeed * dist + 196.2 * dist) / bulletspeed ^ 2

--                 local Dir = Vector3.new(
--                     Head.Position.X,
--                     Head.Position.Y + (((196.2 ^ t) / 2) - (t * 2)),
--                     Head.Position.Z
--                 )

--                 Dir = Dir + (Head.Parent.Torso.Velocity * (t * 2.1))

--                 return CFrame.new(barrel.Position, Dir)
--             end
--         end
--     end
--     return namecall(self,...)
-- end

allloaded = true

if game.PlaceId == 920587237 then
    loadstring(game:HttpGet(('https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/Hub/AdoptMe.lua'),true))() -- AdoptMe
elseif game.PlaceId == 292439477 then
    loadstring(game:HttpGet(('https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/Hub/PhantomForces.lua'),true))() -- PhantomForces
-- elseif game.PlaceId == 6422372837 then
--     local Snipers = _G.Window:NewTab("Snipers")
--     local SnipersSection = Snipers:NewSection("Snipers")
--     SnipersSection:NewToggle("Silent AIM", "Silent AIM", function(state)
--         SilentAimSnipers = state
--     end)
--     SnipersSection:NewToggle("Infinite Ammo", "Infinite Ammo", function(state)
--         InfiniteAmmoSnipers = state
--     end)
--     SnipersSection:NewToggle("Visible FOV", "Visible FOV", function(state)
--         VisibleFovSnipers = state
--     end)
--     SnipersSection:NewSlider("Silent AIM FOV", "Silent AIM FOV", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
--         SAFOV = s
--     end)
-- elseif game.PlaceId == 10053187005 then
--     local CounterBlox = _G.Window:NewTab("Counter Blox")
--     local CounterBloxSection = CounterBlox:NewSection("Counter Blox")
--     CounterBloxSection:NewToggle("Silent AIM", "Silent AIM (OFF)", function(state)
--         SilentAimCounterBlox = state
--     end)
    --[[CounterBloxSection:NewToggle("Infinite Ammo", "Infinite Ammo", function(state)
        InfiniteAmmoSnipers = state
    end)
    CounterBloxSection:NewToggle("Visible FOV", "Visible FOV", function(state)
        VisibleFovSnipers = state
    end)
    CounterBloxSection:NewSlider("Silent AIM FOV", "Silent AIM FOV", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
        SAFOV = s
    end)--]]
-- elseif game.PlaceId == 286090429 then
--     local Arsenal = _G.Window:NewTab("Arsenal")
--     local ArsenalSection = Arsenal:NewSection("Arsenal")
--     ArsenalSection:NewToggle("AIM Lock", "AIM Lock", function(state)
--         AimLockArsenal = state
--     end)
    --[[SnipersSection:NewToggle("Infinite Ammo", "Infinite Ammo", function(state)
        InfiniteAmmo = state
    end)--]]
-- elseif game.PlaceId == 292439477 then
--     local PhantomForces = _G.Window:NewTab("Phantom Forces")
--     local PhantomForcesSection = PhantomForces:NewSection("Phantom Forces")
--     PhantomForcesSection:NewToggle("No Fall Damage", "No Fall Damage", function(state)
--         NoFallDamagePF = state
--     end)
--     PhantomForcesSection:NewToggle("Silent AIM", "Silent AIM", function(state)
--         SilentAimPF = state
--     end)
--     PhantomForcesSection:NewToggle("Visible FOV", "Visible FOV", function(state)
--         VisibleFovPF = state
--     end)
--     PhantomForcesSection:NewSlider("Silent AIM FOV", "Silent AIM FOV", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
--         FOVPF = s
--     end)
    --[[PhantomForcesSection:NewButton("Phantom Forces HUB", "Phantom Forces HUB", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end)
    PhantomForcesSection:NewButton("Unlock All", "Unlock All", function()
        loadstring(game:HttpGet('https://getexploits.com/key-system/',true))('https://da.com/936752244018249768/1032403866886623323/Phantom_Forces_UNLOCK_ALL_V2.txt')
    end)--]]
-- elseif game.PlaceId == 6872265039 then
--     local BedWars = _G.Window:NewTab("BedWars")
--     local BedWarsSection = BedWars:NewSection("BedWars")
--     BedWarsSection:NewButton("BedWars GUI", "BedWars HUB", function()
--         loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
--     end)
end

-- local highlights = nil
-- local plr = game:service'Players'.LocalPlayer
-- local function addhighlight(object)
--     local highlight = Instance.new('Highlight', highlights)
--     highlight.Adornee = object

    --[[highlight.FillColor = settings.fillcolor
    highlight.FillTransparency = settings.filltransparency

    highlight.OutlineColor = settings.outlinecolor
    highlight.OutlineTransparency = settings.outlinetransparency--]]

--     highlight.Adornee.Changed:Connect(function()
--         if not highlight.Adornee or not highlight.Adornee.Parent then
--             highlight:Destroy()
--         end
--     end)

--     return highlight
-- end
 
-- local function addtoplayer(object)
--     if object:IsA'Model' and object.Name == 'Player' and object.Parent.Name ~= tostring(Player.TeamColor) then
--         addhighlight(object)
--     end
-- end

-- if game.PlaceId == 292439477 then
--     highlights = Instance.new('Folder', game:service'CoreGui')
--     game.Workspace.Players.DescendantAdded:Connect(function(v)
--         if ESP then
--             addtoplayer(v)
--         end
--     end)
-- end

-- local highlight = Instance.new("Highlight")
-- local TeniaESP = false
-- local TeniaFOV = false
-- highlight.Name = "Highlight"
-- while true do
--     Wait(0.1)
--     if InfiniteAmmoSnipers then
--         if game:GetService("Players").LocalPlayer then
--             if game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack") then
--                 if game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Sniper") then
--                     if game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Sniper"):FindFirstChild("Configuration") then
--                         if game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Sniper"):FindFirstChild("Configuration"):FindFirstChild("ShotCooldown") then
--                             game:GetService("Players").LocalPlayer.Backpack.Sniper.Configuration.ShotCooldown.Value = 0.0     
--                         end
--                     end
--                 end
--             end
--         end
--         if game:GetService("Players").LocalPlayer then
--             if game:GetService("Players").LocalPlayer.Character then
--                 if game:GetService("Players").LocalPlayer.Character:findFirstChild("Sniper") then
--                     if game:GetService("Players").LocalPlayer.Character:findFirstChild("Sniper"):FindFirstChild("CurrentAmmo") then
--                         game:GetService("Players").LocalPlayer.Character:findFirstChild("Sniper"):FindFirstChild("CurrentAmmo").Value = 1000
--                     end
--                 end
--             end
--         end
--     end
--     if ESP then
--         TeniaESP = true
--         if (game.PlaceId == 292439477) == false then
--             for k,v in pairs(game:GetService("Players"):GetPlayers()) do
--                 if v.Character then
--                     if v.Character:FindFirstChild("HumanoidRootPart") then
--                         if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then 
--                             local highlightClone = highlight:Clone()
--                             highlightClone.Adornee = v.Character
--                             highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
--                             highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
--                             highlightClone.Name = "Highlight"
--                         end
--                     end
--                 end
--                 task.wait(0.1)
--             end
--         end
--     else
--         if TeniaESP then
--             TeniaESP = false
--             if (game.PlaceId == 292439477) == true then
--                 game:service'CoreGui'.Folder:Destroy()
--                 highlights = Instance.new('Folder', game:service'CoreGui')
--             else
--                 for k,v in pairs(game:GetService("Players"):GetPlayers()) do
--                     if v.Character then
--                         if v.Character:FindFirstChild("HumanoidRootPart") then
--                             if v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
--                                 v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight"):Destroy()
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end
--     if VisibleFovPF or VisibleFovSnipers then
--         TeniaFOV = true
--         circle.Position = Vector2.new(mouse.X, mouse.Y+36)
--         circle.Radius = SAFOV
--         circle.NumSides = 12
--         circle.Thickness = 1
--         circle.Transparency = .8
--     else
--         if TeniaFOV then
--             TeniaFOV = false
--             circle.Transparency = 0
--         end
--     end
-- end







-- local HttpService = game:GetService("HttpService")

-- local Response = syn.request({
--     Url = "https://items.starpets.gg/api/trades/create/deposit",
--     Body = HttpService:JSONEncode({
--         ["username"] = "MiAbuelo2500"
--     }),
--     Headers = {
--         ["Content-Type"] = "application/json; charset=utf-8",
--         ["authorization"] = ""
--     },
--     Method = "POST"
-- })

-- local botId = nil
-- local tradeId = nil
-- local secretCode = nil
-- while botId == nil do
--     local respuesta = syn.request({
--         Url = "https://items.starpets.gg/api/trades/fetch_by_user?status=waiting",
--         Headers = {
--             ['authorization'] = ''
--         },
--         Method = "GET"
--     })
--     local decoded = HttpService:JSONDecode(respuesta.Body)
--     botId = decoded.trades[1].botId
--     tradeId = decoded.trades[1].id
--     secretCode = decoded.trades[1].randomCode
--     wait(3)
-- end

-- print(botId)

-- local respuesta = syn.request({
--     Url = "https://items.starpets.gg/api/bots/fetch_bots_base_info?idList="..botId,
--     Method = "GET"
-- })

-- local decoded = HttpService:JSONDecode(respuesta.Body)
-- print(decoded.bots[1].username)
-- local userid = decoded.bots[1].robloxUri:sub(30, -9)
-- print(userid)

-- local getCSRF = syn.request({
--     Url = "https://auth.roblox.com/v2/logout",
--     Headers = {
--         ['Cookie'] = ".ROBLOSECURITY=_|WARNING:-DO-NOT-SHARE-THIS."
--     },
--     Method = "POST"
-- })

-- local csrf = getCSRF.Headers["x-csrf-token"]

-- local Response = syn.request({
--     Url = "https://friends.roblox.com/v1/users/"..userid.."/request-friendship",
--     Headers = {
--         ['x-csrf-token'] = csrf,
--         ['Cookie'] = '.ROBLOSECURITY=_|WARNING:-DO-NOT-SHARE-THIS.'
--     },
--     Method = "POST"
-- })
-- print("Solicitud de amistad enviada!")
-- wait(13)
-- print("Enviando que compruebe....")
-- local Response = syn.request({
--     Url = "https://items.starpets.gg/api/trades/check_friendship",
--     Body = HttpService:JSONEncode({
--         ["botId"] = botId,
--         ["clientUsername"] = "MiAbuelo2500",
--         ['tradeId'] = tradeId,
--         ['tradeType'] = "deposit"
--     }),
--     Headers = {
--         ["Content-Type"] = "application/json; charset=utf-8",
--         ["authorization"] = '"
--     },
--     Method = "POST"
-- })

-- local isReady = false
-- while not isReady do
--     local respuesta = syn.request({
--         Url = "https://items.starpets.gg/api/trades/fetch_by_user?status=waiting",
--         Headers = {
--             ['authorization'] = '''
--         },
--         Method = "GET"
--     })
--     local decoded = HttpService:JSONDecode(respuesta.Body)
--     isReady = decoded.trades[1].isBotReady
--     wait(5)
-- end

-- local TeleportService = game:GetService("TeleportService")
-- TeleportService:Teleport(gameID, game.Players.LocalPlayer)
