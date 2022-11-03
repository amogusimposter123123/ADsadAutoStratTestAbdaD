local timer = 0
local tab = {}

function tab:PlaceTower(posx,posy,posz,tower,tim)
repeat task.wait() until workspace:FindFirstChild("Map")
repeat task.wait() until timer >= tim
game:GetService("Workspace").Placed:InvokeServer(Vector3.new(posx,posy,posz),1,tower,workspace.Map:FindFirstChild("Grass"))
end

repeat wait() until workspace:FindFirstChild("Map")
spawn(function() while wait(1) do timer = timer + 1 print(timer) end end)

return tab
