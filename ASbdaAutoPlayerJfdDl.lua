local timer = 0
local tab = {}

function tab:PlaceTower(x,y,z, Tower, InTime, Wave)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime and workspace.Waves:FindFirstChild("Wave").Value == Wave
game:GetService("Workspace").Placed:InvokeServer(Vector3.new(x,y,z),1,Tower,workspace.Map.Grass)
end

function tab:UpgradeTower(TowerNum, InTime, Wave)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime and workspace.Waves:FindFirstChild("Wave").Value == Wave
game:GetService("Workspace").UpgradeTower:InvokeServer(TowerNum)
end

function tab:SellTower(TowerNum, InTime, Wave)
repeat wait() until workspace:FindFirstChild("Map")
repeat wait() until timer >= InTime and workspace.Waves:FindFirstChild("Wave").Value == Wave
game:GetService("Workspace").SellTower:InvokeServer(TowerNum)
end

repeat wait() until workspace:FindFirstChild("Map")
spawn(function() 
  while wait(1) do 
    timer = timer + 1 
    rconsoleprint(timer.."\n") 
  end 
end)

return tab
