getgenv().timer = 0
local tab = {}

function tab:PlaceTower(posx,posy,posz,tower,timee)
repeat task.wait() until workspace:FindFirstChild("Map")
repeat task.wait() until getgenv().timer == timee
game:GetService("Workspace").Placed:InvokeServer(Vector3.new(posx,posy,posz),1,tower,workspace.Map:FindFirstChild("Grass"))
return getgenv().timer
end

repeat task.wait() until workspace:FindFirstChild("Map")
while wait(1) do timer = timer + 1 print(timer) end

return tab
