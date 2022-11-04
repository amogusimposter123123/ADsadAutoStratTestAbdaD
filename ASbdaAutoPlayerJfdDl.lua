repeat wait() until workspace:FindFirstChild("Map")
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
local timer = 0
local Grass = nil
local tab = {}

function tab:PlaceTower(x,y,z, Tower, InTime, Cost)
repeat wait() until timer >= InTime
repeat wait() until game:GetService("Players").LocalPlayer.Information.Cash.Value > Cost or game:GetService("Players").LocalPlayer.Information.Cash.Value >= Cost
game:GetService("Workspace").Placed:InvokeServer(Vector3.new(x,y,z),1,Tower,Grass)
end

function tab:UpgradeTower(TowerNum, InTime, Cost)
repeat wait() until timer >= InTime
repeat wait() until game:GetService("Players").LocalPlayer.Information.Cash.Value > Cost or game:GetService("Players").LocalPlayer.Information.Cash.Value >= Cost
game:GetService("Workspace").UpgradeTower:InvokeServer(TowerNum)
end

function tab:SellTower(TowerNum, InTime)
repeat wait() until timer >= InTime
game:GetService("Workspace").SellTower:InvokeServer(TowerNum)
end

function tab:CommanderAbility(TowerNum, InTime)
repeat wait() until timer >= InTime
repeat wait() until game:GetService("Workspace").Towers:FindFirstChild(TowerNum).Tower.UP1.Value >= 2
game:GetService("Workspace").CallToArms:InvokeServer(TowerNum)
end

repeat wait() until game:GetService("Workspace"):FindFirstChild("Map")

spawn(function()
while wait(1) do
if workspace:FindFirstChild("Map") then
timer = timer + 1 
rconsoleprint(timer.."\n") 
        end
    end
end)
spawn(function()
wait(2)
if workspace:FindFirstChild("Map") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)+Vector3.new(0,5,0)
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
end)
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if string.find(v.Name, "Grass") and not v:FindFirstChild("Team") then
    v.Name = " "
elseif string.find(v.Name, "Grass") and not v:FindFirstChild("Team").Value == game:GetService("Players").LocalPlayer.TeamColor then
    v.Name = " "
    end
end
wait(0.1)
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v.Name == "Grass" and v:FindFirstChild("Team") then
Grass = v
    end
end
return tab
