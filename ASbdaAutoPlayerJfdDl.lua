local timer = 0
local Grass = nil
local tab = {}

function tab:PlaceTower(x,y,z, Tower, InTime)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime
game:GetService("Workspace").Placed:InvokeServer(Vector3.new(x,y,z),1,Tower,Grass)
end

function tab:UpgradeTower(TowerNum, InTime)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime
repeat wait() until workspace.Towers.TowerNum:FindFirstChild("Tower")
game:GetService("Workspace").UpgradeTower:InvokeServer(TowerNum)
end

function tab:SellTower(TowerNum, InTime, Wave)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime and workspace.Waves:FindFirstChild("Wave").Value == Wave
game:GetService("Workspace").SellTower:InvokeServer(TowerNum)
end

repeat wait() until workspace:FindFirstChild("Map")

while wait(1) do 
timer = timer + 1 
--rconsoleprint(timer.."\n") 
end

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
