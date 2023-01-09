print("Loading AdoptMe...")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local workspace = game:GetService("Workspace")
local FakeHWID = game:GetService("RbxAnalyticsService"):GetClientId()

repeat
    wait()
    if Player.PlayerGui:WaitForChild("NewsApp").EnclosingFrame.Visible then
        firesignal(Player.PlayerGui:WaitForChild("NewsApp").EnclosingFrame.MainFrame.Contents.PlayButton.MouseButton1Click)
    end
    wait(1)
    if Player.PlayerGui.DialogApp.Dialog.RoleChooserDialog.Visible then
        firesignal(Player.PlayerGui.DialogApp.Dialog.RoleChooserDialog.ChooseParent.MouseButton1Click)
    end
until Player.Character and workspace.Camera.CameraSubject == Player.Character:WaitForChild("Humanoid")

print("AdoptMe loaded!")

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sign = math.sign
local sinh = math.sinh
local sqrt = math.sqrt

local MainAccount = nil
local passwordAPI = nil
local autofarm = false
local autoNeon = false
local isVIP = false
-- local gingerBreadFarm = false
local autoFarmButton = nil
local autoNeonButton = nil
-- local gingerButton = nil
local cargado = false
local allloaded = false
local PetID
local Pet
local AilmentFurnitues = {}

local getconstants = getconstants or debug.getconstants
local getgc = getgc or get_gc_objects or debug.getgc
local getreg = getreg or getregistry or debug.getregistry
local get_thread_context = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local get_thread_identity = get_thread_context
local set_thread_context = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
local set_thread_identity = set_thread_context
local getupvalue = getupvalue or debug.getupvalue
local getconstant = getconstant or debug.getconstant

local AdoptMe = _G.Window:CreateTab("AdoptMe", 12019584411)
local AutoFarmSection = AdoptMe:CreateSection("AutoFarm")

txt = isfile("ReQiuHub.txt")
if not txt then
    writefile("ReQiuHub.txt", "{}")
    txt = true
end

local Loader = require(ReplicatedStorage:WaitForChild("Fsys")).load
local ClientData = Loader("ClientData")
local a
a = {
    ["sleepy"] = function(c)
        while c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments do
            spawn(function()
                game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
                wait(1)
                local SueloTemporal = Instance.new("Part", workspace)
                SueloTemporal.Name = "SueloTemporal"
                SueloTemporal.Size = Vector3.new(100, 0, 100)
                SueloTemporal.Anchored = true
                SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
                wait(1)
                GoToHome()
                wait(1)
                Player.Character.HumanoidRootPart.CFrame =
                    workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):FindFirstChildWhichIsA(
                    "Model"
                ).Doors.MainDoor.WorkingParts.TouchToEnter.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
                local funitureName = AilmentFurnitues["generic_crib"]:sub(#Player.name+13)
                ReplicatedStorage.API["HousingAPI/ActivateFurniture"]:InvokeServer(
                    Player,
                    --AilmentFurnitues["generic_crib"],
                    funitureName,
                    "UseBlock",
                    {["cframe"] = Player.Character:FindFirstChild("HumanoidRootPart").CFrame},
                    Pet
                )
                SueloTemporal:Destroy()
            end)
            wait(30)
            if not autofarm then
                break
            end
        end
        wait(1)
        while wait() do
            ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
            Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
            if Pet then
                if Pet.Parent then
                    break
                end
            end
        end
    end,
    ["hungry"] = function(c)
        if autofarm then
            ReplicatedStorage.API["ShopAPI/BuyItem"]:InvokeServer("food", "apple", {})
            wait(1)
            local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
            local Apple
            for i, v in pairs(Foods) do
                if v.id == "apple" then
                    Apple = v.unique
                    break
                end
            end
            if not Apple then
                return
            end

            ReplicatedStorage.API["PetObjectAPI/CreatePetObject"]:InvokeServer(
                "__Enum_PetObjectCreatorType_2",
                {["unique_id"] = Apple}
            )
            wait(2)
            ReplicatedStorage.API["PetAPI/ConsumeFoodItem"]:FireServer(Apple)
        end 
    end,
    ["thirsty"] = function(c)
        if autofarm then
            ReplicatedStorage.API["ShopAPI/BuyItem"]:InvokeServer("food", "tea", {})
            local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
            local Tea
            for i, v in pairs(Foods) do
                if v.id == "tea" then
                    Tea = v.unique
                    break
                end
            end
            if not Tea then
                return
            end

            ReplicatedStorage.API["PetObjectAPI/CreatePetObject"]:InvokeServer(
                "__Enum_PetObjectCreatorType_2",
                {["unique_id"] = Tea}
            )
            wait(2)
        ReplicatedStorage.API["PetAPI/ConsumeFoodItem"]:FireServer(Tea)
    end end ,
    ["dirty"] = function(c)
        while c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments do
            spawn(function()
                game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
                wait(1)
                local SueloTemporal = Instance.new("Part", workspace)
                SueloTemporal.Name = "SueloTemporal"
                SueloTemporal.Size = Vector3.new(100, 0, 100)
                SueloTemporal.Anchored = true
                SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
                wait(1)
                GoToHome()
                wait(1)
                Player.Character.HumanoidRootPart.CFrame =
                    workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):FindFirstChildWhichIsA(
                    "Model"
                ).Doors.MainDoor.WorkingParts.TouchToEnter.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
                wait(1)
                local funitureName = AilmentFurnitues["generic_shower"]:sub(#Player.name+13)
                ReplicatedStorage.API["HousingAPI/ActivateFurniture"]:InvokeServer(
                    Player,
                    funitureName,
                    --AilmentFurnitues["generic_shower"],
                    "UseBlock",
                    {["cframe"] = Player.Character.HumanoidRootPart.CFrame},
                    Pet
                )
                SueloTemporal:Destroy()
            end)
            wait(30)
            if not autofarm then
                break
            end
        end
        wait(1)
        while wait() do
            ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
            Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
            if Pet then
                if Pet.Parent then
                    break
                end
            end
        end
    end,
    ["pizza_party"] = function(c)
        game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
        wait(1)
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore('PizzaShop')
        wait(5)
        Player.Character.HumanoidRootPart.CFrame = workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
        wait(1)
        repeat
            wait(10)
            -- GoToStore('PizzaShop')
            Player.Character.HumanoidRootPart.CFrame = workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
            if not autofarm then
                break
            end
        until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        SueloTemporal:Destroy()
    end,
    ["salon"] = function(c)
        game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
        wait(1)
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore("Salon")
        wait(5)
        Player.Character.HumanoidRootPart.CFrame = workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
        wait(1)
        repeat
            wait(10)
            -- GoToStore("Salon")
            Player.Character.HumanoidRootPart.CFrame = workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
            if not autofarm then
                break
            end
        until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments 
        SueloTemporal:Destroy()
    end,
    ["sick"] = function(c)
        repeat
            wait()
            ReplicatedStorage.API["MonitorAPI/HealWithDoctor"]:FireServer()
            if not autofarm then
                break
            end
        until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments 
    end,
    ["adoption_party"] = function(c)
        game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
        wait(1)
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore("Nursery")
        wait(1)
        repeat
            wait(10)
            if not autofarm then
                break
            end
        until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments 
        SueloTemporal:Destroy()
    end,
    ["school"] = function(c)
        game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
        wait(1)
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore("School")
        wait(5)
        Player.Character.HumanoidRootPart.CFrame = workspace.Interiors.School.BuyIndicators["teachers_apple"].CFrame * CFrame.new(0,5,0)
        wait(1)
        repeat
            wait(10)
            Player.Character.HumanoidRootPart.CFrame = workspace.Interiors.School.BuyIndicators["teachers_apple"].CFrame * CFrame.new(0,5,0)
            if not autofarm then
                break
            end
        until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        SueloTemporal:Destroy()
    end,
    ["hot_spring"] = function(c)
        if autofarm then
            game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
            wait(1)
            local SueloTemporal = Instance.new("Part", workspace)
            SueloTemporal.Name = "SueloTemporal"
            SueloTemporal.Size = Vector3.new(100, 0, 100)
            SueloTemporal.Anchored = true
            SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
            wait(1)
            GoToMainMap()
            wait(5)
            --[[while true do
                wait(1)
                if Workspace:WaitForChild("StaticMap") then
                    print("1")
                    if Workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring") then
                        print("2")
                        if Workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring"):WaitForChild("HotSpringOrigin") then
                            print("3")
                            if Workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring"):WaitForChild("HotSpringOrigin").position then
                                print("4")
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring"):WaitForChild("HotSpringOrigin").Position)
                                break
                            end
                        end
                    end
                end
            end
            wait(1)--]]
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring"):WaitForChild("HotSpringOrigin").Position)
            wait(1)
            repeat
                wait(10)
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("HotSpring"):WaitForChild("HotSpringOrigin").Position)
                if not autofarm then
                    break
                end
            until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
            SueloTemporal:Destroy()
        end 
    end,
    ["camping"] = function(c)
        if autofarm then
            game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
            wait(1)
            local SueloTemporal = Instance.new("Part", workspace)
            SueloTemporal.Name = "SueloTemporal"
            SueloTemporal.Size = Vector3.new(100, 0, 100)
            SueloTemporal.Anchored = true
            SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
            wait(1)
            GoToMainMap()
            wait(5)
            --[[while true do
                wait(1)
                if Workspace:WaitForChild("StaticMap") then
                    print("1")
                    if Workspace:WaitForChild("StaticMap"):WaitForChild("Campsite") then
                        print("2")
                        if Workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin") then
                            print("3")
                            if Workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").position then
                                print("4")
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position + Vector3.new(0, 5, 0))
                                break
                            end
                        end
                    end
                end
            end--]]
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position + Vector3.new(0, 5, 0))
            wait(1)
            repeat
                wait(10)
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position + Vector3.new(0, 5, 0))
                if not autofarm then
                    break
                end
            until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
            SueloTemporal:Destroy()
        end 
    end,
    ["bored"] = function(c)
        if autofarm then
            game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
            wait(1)
            local SueloTemporal = Instance.new("Part", workspace)
            SueloTemporal.Name = "SueloTemporal"
            SueloTemporal.Size = Vector3.new(100, 0, 100)
            SueloTemporal.Anchored = true
            SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
            wait(1)
            GoToMainMap()
            wait(5)
            --[[while true do
                wait(1)
                if Workspace:WaitForChild("StaticMap") then
                    print("1")
                    if Workspace:WaitForChild("StaticMap"):WaitForChild("Park") then
                        print("2")
                        if Workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget") then
                            print("3")
                            if Workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget").position then
                                print("4")
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget").Position + Vector3.new(0, 5, 0))
                                break
                            end
                        end
                    end
                end
            end
            wait(1)--]]
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget").Position + Vector3.new(0, 5, 0))
            wait(1)
            repeat
                wait(10)
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget").Position + Vector3.new(0, 5, 0))
                if not autofarm then
                    break
                end
            until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
            SueloTemporal:Destroy()
        end 
    end
}
spawn(function() 
    while true do
        if autofarm and cargado then
            wait(10)
            local Ailment = Player.PlayerGui.AilmentsMonitorApp.Ailments:FindFirstChildWhichIsA("Frame")
            if Ailment then
                local Name = Ailment.Name
                if a[Name] then
                    a[Name](Ailment)
                    ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
                    Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
                    wait(5)
                end
            end
            if Pet then
                if Pet.Parent ~= workspace.Pets then
                    ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
                    Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
                end
            else
                ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
                Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
            end
        end
        Wait(1)
    end
end)

--[[local Stores = {
    "CoffeeShop",
    "Supermarket",
    "PizzaShop",
    "ToyShop",
    "Obbies",
    "Neighborhood",
    "CampingShop",
    "AutoShop",
    "Nursery",
    "Cave",
    "IceCream",
    "PotionShop",
    "SkyCastle",
    "Hospital",
    "HatShop",
    "PetShop",
    "School",
    "BabyShop",
    "HotSpringHouse",
    "SafetyHub",
    "DebugInterior",
    "VIP",
    "Salon",
    "SpleefMinigame",
    "SimonSaysMinigame",
    "WinterCastle"
}--]]
local getgc = getgc or get_gc_objects or debug.getgc
local Location
for i, v in pairs(getgc()) do
    if type(v) == "function" then
        if getfenv(v).script == ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM then
            if table.find(getconstants(v), "LocationAPI/SetLocation") then
                Location = v
                break
            end
        end
    end
end
wait(0.5)
local function SetLocation(a, b, c)
    local k = get_thread_identity()
    set_thread_identity(2)
    Location(a, b, c)
    set_thread_identity(k)
end

function Home()
    if workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model") then
        return workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model").Name
    else
        return false
    end
end

function Store()
    if workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if
            (workspace.Interiors:FindFirstChildWhichIsA("Model").Name ~= "MainMap") and
                (workspace.Interiors:FindFirstChildWhichIsA("Model").Name ~= "Neighborhood")
            then
            return workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

function MainMap()
    if workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if workspace.Interiors:FindFirstChildWhichIsA("Model").Name == "MainMap" or workspace.Interiors:FindFirstChildWhichIsA("Model").Name == "MainMap/Default" then
            return workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

function Neighborhood()
    if workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if workspace.Interiors:FindFirstChildWhichIsA("Model").Name == "Neighborhood" then
            return workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

function GoToStore(Name)
    if Store() == Name then
        return true
    end
    SetLocation(Name, "MainDoor", {})
    while Store() ~= Name do
        wait()
    end
    if Home() then
        return true
    end
    return false
end

function GoToHome()
    SetLocation("housing", "MainDoor", {["house_owner"] = Player})
    while not Home() do
        wait(1)
    end
    if Home() then
        return true
    end
    return false
end

function GoToNeighborhood()
    SetLocation("Neighborhood", "MainDoor", {})
    while not Neighborhood() do
        wait()
    end
    if Neighborhood() then
        return true
    end
    return false
end

function GoToMainMap()
    SetLocation("MainMap", "Neighborhood/MainDoor", {})
    while not MainMap() do
        wait()
    end
    if MainMap() then
        return true
    end
    return false
end

function Type(Name)
    game:GetService("ReplicatedStorage").API:FindFirstChild("AdoptAPI/HoldBaby"):FireServer(Pet)
    wait(1)
    local SueloTemporal = Instance.new("Part", workspace)
    SueloTemporal.Name = "SueloTemporal"
    SueloTemporal.Size = Vector3.new(100, 0, 100)
    SueloTemporal.Anchored = true
    SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
    wait(1)
    GoToHome()
    wait(1)
    Player.Character.HumanoidRootPart.CFrame =
        workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):FindFirstChildWhichIsA(
        "Model"
    ).Doors.MainDoor.WorkingParts.TouchToEnter.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
    wait(1)
    for i, v in pairs(workspace.HouseInteriors.furniture:GetChildren()) do
        if v:FindFirstChildWhichIsA("Model") then
            if v:FindFirstChildWhichIsA("Model"):FindFirstChild("UseBlocks") then
                local Furniture = v:FindFirstChildWhichIsA("Model")
                if Furniture.UseBlocks:FindFirstChild("UseBlock") then
                    if Furniture.UseBlocks:FindFirstChild("UseBlock"):FindFirstChild("Configuration") then
                        if
                            Furniture.UseBlocks:FindFirstChild("UseBlock"):FindFirstChild("Configuration"):FindFirstChild(
                                "use_id"
                            )
                            then
                            if
                                Furniture.UseBlocks:FindFirstChild("UseBlock"):FindFirstChild("Configuration"):FindFirstChild(
                                    "use_id"
                                ).Value == Name
                                then
                                    SueloTemporal:Destroy()
                                    return v.Name
                            end
                        end
                    end
                end
            end
        end
    end
    SueloTemporal:Destroy()
    return false
end

function ChangeWalkspeed(speed)
    if Player and Player.Character then
        while not Player.Character:FindFirstChildWhichIsA("Humanoid") do Wait(1) end
        Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = speed
    end
end

function QueTradeEs(fase)
    print("Fase: "..fase)
    print("Esperando para que se active")
    while not game:GetService("Workspace").Interiors.TradeLicenseZone[fase].Base.SurfaceGui.Enabled do print("Esperando...") Wait(1) end
    print("Activado!")
    Wait(1)
    print("Mirando si es trust")
    local tradeActual = game:GetService("Workspace").Interiors.TradeLicenseZone[fase].Base.SurfaceGui.Frame.ConfirmationFrame
    local si = game:GetService("Workspace").Interiors.TradeLicenseZone[fase].Button2.CFrame
    local no = game:GetService("Workspace").Interiors.TradeLicenseZone[fase].Button1.CFrame
    local siono = nil
    if tradeActual.PartnerOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate") and tradeActual.PartnerOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate").Image == "rbxassetid://3409443710" then
       siono = true
    elseif tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate") and tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate").Image == "rbxassetid://3409443710" then
        siono = false
    elseif tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate") and tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate").Image == "rbxassetid://3181728194" then
        siono = false
    elseif tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate") and tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate").Image == "rbxassetid://4470748644" then
        siono = true
    elseif tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate") and tradeActual.MyOffer.Slots.Slot1:FindFirstChild("ItemImageTemplate").Image == "rbxassetid://3181727351" then
        siono = true
    end
    Wait(1)
    print(siono)
    while game:GetService("Workspace").Interiors.TradeLicenseZone[fase].Base.SurfaceGui.Enabled do
        print("Tepeando")
        if siono ~= nil then
            if siono then
                Player.Character.HumanoidRootPart.CFrame = si
            else
                Player.Character.HumanoidRootPart.CFrame = no
            end
        end
        Wait(1)
    end
end

function autofarmtoggle(state)
    local Loader = require(ReplicatedStorage:WaitForChild("Fsys")).load
    local ClientData = Loader("ClientData")
    autofarm = state
    while not Player.PlayerScripts:WaitForChild("PlayerModule") do Wait(1) end
    --Player.Character.HumanoidRootPart.Anchored = state
    spawn(function()
        if not autofarm then
            Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
            ChangeWalkspeed(16)
        end
        if autofarm then
            ChangeWalkspeed(0)
            print("Mirando por pets que no sean full grown")
            cambiarPet()
            -- ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
            -- Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
            wait(1)
            AilmentFurnitues["generic_crib"] = nil
            while not AilmentFurnitues["generic_crib"] do
                wait()
                AilmentFurnitues["generic_crib"] = Type("generic_crib")
                AilmentFurnitues["generic_shower"] = Type("generic_shower")
            end
            cargado = true
            while autofarm do
                wait(30)
                local Inventory = ClientData.get("inventory") or {}
                local Pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets or {}
                print("Mirando inventario de pets...")
                if Pets[tostring(PetID)] then
                    print("Edad de la pet: "..Pets[(PetID)]["properties"]["age"])
                    if Pets[(PetID)]["properties"]["age"] < 6 then
                    else
                        print("Mirando por pets que no sean full grown")
                        cambiarPet()
                    end
                else
                    print("Mirando por pets que no sean full grown")
                    cambiarPet()
                end
            end
        end
    end)
    spawn(function()
        while autofarm do
            Wait(5)
            for k,v in pairs(game.Players:GetChildren()) do
                if v.Character and MainAccount and v.Name and game.Players.LocalPlayer.Name and v.Name ~= MainAccount and v.Name ~= game.Players.LocalPlayer.Name then
                    v.Character:Destroy()
                end
            end
        end
    end)
end

function cambiarPet()
    local Loader = require(ReplicatedStorage:WaitForChild("Fsys")).load
    local ClientData = Loader("ClientData")
    local Inventory = ClientData.get("inventory") or {}
    local Pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets or {}
    local cambiada = false
    local mayorEdad = nil
    for i, v in pairs(Pets) do
        if v["properties"]["age"] < 6 and v.properties.neon then
            if mayorEdad == nil or v["properties"]["age"] > mayorEdad["properties"]["age"] then
                mayorEdad = v
                cambiada = true
            end
        end
        PetID = v.unique
    end
    if mayorEdad ~= nil then
        PetID = mayorEdad.unique
        print("He cambiado la pet!")
    end
    if not cambiada then
        mayorEdad = nil
        for i, v in pairs(Pets) do
            if v["properties"]["age"] < 6 then
                -- if mayorEdad == nil then mayorEdad = 0 end
                if mayorEdad == nil or v["properties"]["age"] > mayorEdad["properties"]["age"] then
                    mayorEdad = v
                    cambiada = true
                end
            end
            PetID = v.unique
        end
        if mayorEdad ~= nil then
            PetID = mayorEdad.unique
            print("He cambiado la pet!")
        end
    end
    if cambiada == true then
        ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
        Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
    end
end

for i, v in pairs(debug.getupvalue(require(ReplicatedStorage.Fsys).load("RouterClient").init, 4)) do
    v.Name = i
end

-- gingerButton = AdoptMe:CreateToggle({
--     Name = "Ginger Bread Farm",
--     CurrentValue = false,
--     Flag = "AdoptMe-gingerfarm",
--     Callback = function(state)
--         gingerBreadFarm = state
--         spawn(function()
--             while gingerBreadFarm do
--                 wait(10)
--                 for i,v in pairs(ReplicatedStorage.Resources.IceSkating.GingerbreadMarkers:GetChildren()) do
--                     if v:IsA("BasePart") then
--                         wait(0.3)
--                         ReplicatedStorage.API:FindFirstChild("WinterEventAPI/PickUpGingerbread"):InvokeServer(v.Name)
--                     end 
--                 end 
--                 ReplicatedStorage.API:FindFirstChild("WinterEventAPI/RedeemPendingGingerbread"):FireServer()
--             end
--         end)
--     end,
-- })

autoFarmButton = AdoptMe:CreateToggle({
    Name = "Pet AutoFarm",
    CurrentValue = false,
    Flag = "AdoptMe-petfarm",
    Callback = function(state)
        autofarmtoggle(state)
    end,
})

autoNeonButton = AdoptMe:CreateToggle({
    Name = "Auto Neon",
    CurrentValue = false,
    Flag = "AdoptMe-autoneon",
    Callback = function(state)
        autoNeon = state
        spawn(function()
            while autoNeon do
                local Pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets or {}
                local tabla = {}
                local tablaN = {}
                local hizoAlgunFusion = false
                local TablaDePets = {}
                for i, v in pairs(Pets) do
                    if usernameAPI ~= nil then
                        if syn then
                            local pet = {
                                name = v['id'],
                                age = v['properties']['age'],
                                neon = v['properties']['neon'],
                                mega = v['properties']['mega_neon'],
                                r = v['properties']['rideable'],
                                f = v['properties']['flyable'],
                            }
                            table.insert(TablaDePets, pet)
                        end
                    end
                    if v.properties.age == 6 and not v.properties.neon and not v.properties.mega_neon then
                        if not tabla[v["id"]] then
                            tabla[v["id"]] = {}
                        end
                        table.insert(tabla[v["id"]], v["unique"])
                    end
                    if v.properties.age == 6 and v.properties.neon and not v.properties.mega_neon then
                        if not tablaN[v["id"]] then
                            tablaN[v["id"]] = {}
                        end
                        table.insert(tablaN[v["id"]], v["unique"])
                    end
                end
                if isVIP and usernameAPI ~= nil then
                    if syn then
                        local Response = syn.request({
                            Url = "http://141.144.230.49/ponerInventariov2",
                            Body = HttpService:JSONEncode({
                                ["hwid"] = FakeHWID,
                                ['inv'] = TablaDePets,
                                ['password'] = passwordAPI
                            }),
                            Method = "POST"
                        })

                        local respuesta = syn.request({
                            Url = "http://141.144.230.49/estoyActivo/"..FakeHWID.."/"..Player.name.."/"..passwordAPI,
                            Method = "GET"
                        })
                        for k,v in pairs(HttpService:JSONDecode(respuesta.Body)) do
                            ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets",v,{})
                            Wait(0.1)
                        end
                    end
                end
                for i,v in pairs(tabla) do
                    local pedsParaHacer = {}
                    local cuenta = 0
                    for i2,v2 in pairs(v) do
                        cuenta = cuenta + 1
                        table.insert(pedsParaHacer, v2)
                        if cuenta == 4 then
                            ReplicatedStorage.API:FindFirstChild("PetAPI/DoNeonFusion"):InvokeServer(pedsParaHacer)
                            hizoAlgunFusion = true
                            wait(0.5)
                            cuenta = 0
                            pedsParaHacer = {}
                        end
                    end
                    wait(1)
                end
                for i,v in pairs(tablaN) do
                    local pedsParaHacer = {}
                    local cuenta = 0
                    for i2,v2 in pairs(v) do
                        cuenta = cuenta + 1
                        table.insert(pedsParaHacer, v2)
                        if cuenta == 4 then
                            ReplicatedStorage.API:FindFirstChild("PetAPI/DoNeonFusion"):InvokeServer(pedsParaHacer)
                            hizoAlgunFusion = true
                            wait(0.5)
                            cuenta = 0
                            pedsParaHacer = {}
                        end
                    end
                    wait(1)
                end
                if hizoAlgunFusion and autofarm then
                    cambiarPet()
                end
                wait(120)
            end
        end)
    end,
})

local OtherSection = AdoptMe:CreateSection("Other")

AdoptMe:CreateButton({
    Name = "Buy Highland Cow",
    Callback = function()
        ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets","scottish_2023_highland_cow",{})
    end,
})

AdoptMe:CreateButton({
    Name = "Teleport Cave",
    Callback = function()
        _G.Library:Notify({
            Title = "Teleporting to the Cave!",
            Content = "Teleporting...",
            Duration = 2.0,
            Image = 4483362458,
        })
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore("Cave")
        wait(1)
        local distance = (Player.Character.HumanoidRootPart.Position - Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.Position).Magnitude
        repeat
            Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
            distance = (Player.Character.HumanoidRootPart.Position - Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.Position).Magnitude
            print(distance)
        until distance < 10
        SueloTemporal:Destroy()
    end,
})

AdoptMe:CreateButton({
    Name = "Hacer Trade License ;)",
    Callback = function()
        _G.Library:Notify({
            Title = "Trade License has begin",
            Content = "Please wait until the license quiz complete",
            Duration = 2.0,
            Image = 4483362458,
        })
        game:GetService("ReplicatedStorage").API:FindFirstChild("SettingsAPI/SetBooleanFlag"):FireServer("has_talked_to_trade_quest_npc", true)
        local SueloTemporal = Instance.new("Part", workspace)
        SueloTemporal.Name = "SueloTemporal"
        SueloTemporal.Size = Vector3.new(100, 0, 100)
        SueloTemporal.Anchored = true
        SueloTemporal.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0,-5,0))
        wait(1)
        GoToStore("TradeLicenseZone")
        wait(1)
        local distance = (Player.Character.HumanoidRootPart.Position - Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.Position).Magnitude
        repeat
            Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -6))
            distance = (Player.Character.HumanoidRootPart.Position - Workspace.Interiors:FindFirstChildWhichIsA('Model').PrimaryPart.Position).Magnitude
            print(distance)
        until distance < 10
        SueloTemporal:Destroy()
        game:GetService("ReplicatedStorage").API:FindFirstChild("TradeAPI/BeginQuiz"):FireServer()
        QueTradeEs("Gate1")
        QueTradeEs("Gate2")
        QueTradeEs("Gate3")
        Wait(1)
        game:GetService("ReplicatedStorage").API:FindFirstChild("TradeAPI/EndQuiz"):FireServer()
    end,
})

AdoptMe:CreateToggle({
    Name = "Pet MFR",
    CurrentValue = false,
    Callback = function(state)
        local clientData = require(game.ReplicatedStorage.ClientModules.Core.ClientData)
        local playerData = clientData.get_data()[tostring(Player)]
        for i,v in pairs(playerData.inventory.pets) do
            v.properties.rideable = state
            v.properties.flyable = state
            v.properties.mega_neon = state
        end
    end,
})

local PremiumSection = AdoptMe:CreateSection("Premium")

-- local Input = AdoptMe:CreateInput({
--     Name = "Username API",
--     PlaceholderText = "Username API",
--     RemoveTextAfterFocusLost = false,
--     Callback = function(Text)
--         usernameAPI = Text
--     end,
-- })

AdoptMe:CreateButton({
    Name = "Get ID",
    Callback = function()
        setclipboard(FakeHWID)
    end,
})

local Input = AdoptMe:CreateInput({
    Name = "Password API",
    PlaceholderText = "Password API",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        passwordAPI = Text
        if syn then
            syn.request({
                Url = "http://141.144.230.49/ponerContra/"..FakeHWID.."/"..passwordAPI,
                Method = "GET"
            })
        end
    end,
})

local Input = AdoptMe:CreateInput({
    Name = "MainAccount Username",
    PlaceholderText = "MainAccount Username",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        MainAccount = Text
    end,
})

AdoptMe:CreateButton({
    Name = "Save Settings",
    Callback = function()
        local settings = {
            -- api = usernameAPI,
            ma = MainAccount,
            pass = passwordAPI
        }
        writefile("ReQiuHub.txt", HttpService:JSONEncode(settings))
        _G.Library:Notify({
            Title = "Settings Saved!",
            Content = "The Settings have been saved correctly!",
            Duration = 3.0,
            Image = 4483362458,
            -- Actions = {
            --     Ignore = {
            --         Name = "Okay!",
            --         Callback = function()

            --         end
            --     },
            -- },
         })
    end,
})

spawn(function()
    while true do
        if MainAccount ~= nil and game.Players.LocalPlayer.Name ~= MainAccount then
            if game:GetService("Players"):FindFirstChild(MainAccount) then
                local Pets = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()[game.Players.LocalPlayer.Name].inventory.pets or {}
                for k,v in pairs(Pets) do
                    if (v['properties']['neon'] and v['properties']['age'] == 6) or (v['properties']['mega_neon']) then
                        game:GetService("ReplicatedStorage").API:FindFirstChild("TradeAPI/GiveItem"):InvokeServer(game:GetService("Players")[MainAccount], v['unique'])
                    end
                end
            end
        end
        Wait(30)
    end
end)

spawn(function()
    wait(5)
    if txt then
        local settings = HttpService:JSONDecode(readfile("ReQiuHub.txt"))
        for k,v in pairs(settings) do
            if k == 'ma' then
                MainAccount = v
            end
            -- if k == 'ma' then
            --     MainAccount = v
            -- elseif k == "api" then
            --     usernameAPI = v
            -- elseif k == "pass" then
            --     passwordAPI = v
            -- end
        end
        -- local respuesta = syn.request({
        --     Url = "http://141.144.230.49/esvip/"..usernameAPI,
        --     Method = "GET"
        -- })
        if syn then
            local respuesta = syn.request({
                Url = "http://141.144.230.49/esvip/"..FakeHWID,
                Method = "GET"
            })
            if respuesta.Body == "True" then
                isVIP = true
                _G.Library:Notify({
                    Title = "You're a VIP User!, Thank you for choosing me!",
                    Content = "Loading VIP Functions...",
                    Duration = 10.0,
                    Image = 4483362458,
                })
            end
        end
    end
end)

-- spawn(function()
--     while true do
--         if usernameAPI ~= nil then
--             if syn then
--                 local Pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets or {}
--                 local TablaDePets = {}
--                 for k,v in pairs(Pets) do
--                     local pet = {
--                         name = v['id'],
--                         age = v['properties']['age'],
--                         neon = v['properties']['neon'],
--                         mega = v['properties']['mega_neon'],
--                         r = v['properties']['rideable'],
--                         f = v['properties']['flyable'],
--                     }
--                     table.insert(TablaDePets, pet)
--                 end
--                 local Response = syn.request({
--                     Url = "http://141.144.230.49/ponerInventariov2",
--                     Body = HttpService:JSONEncode({
--                         ["username"] = Player.name,
--                         ['inv'] = TablaDePets
--                     }),
--                     Method = "POST"
--                 })

--                 local respuesta = syn.request({
--                     Url = "http://141.144.230.49/estoyActivo/"..usernameAPI.."/"..Player.name,
--                     Method = "GET"
--                 })
--                 for k,v in pairs(HttpService:JSONDecode(respuesta.Body)) do
--                     ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets",v,{})
--                     Wait(0.1)
--                 end
--             end
--         end
--         Wait(60)
--     end
-- end)

-- spawn(function()
--     while true do
--         if usernameAPI ~= nil then
--             if syn then
--                 local respuesta = syn.request({
--                     Url = "http://141.144.230.49/estoyActivo/"..usernameAPI.."/"..Player.name,
--                     Method = "GET"
--                 })
--                 for k,v in pairs(HttpService:JSONDecode(respuesta.Body)) do
--                     ReplicatedStorage.API:FindFirstChild("ShopAPI/BuyItem"):InvokeServer("pets",v,{})
--                     Wait(0.1)
--                 end
--             end
--         end
--         Wait(30)
--     end
-- end)

_G.Library:LoadConfiguration()
