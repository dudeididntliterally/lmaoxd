local prefix = ':'
game.StarterGui:SetCore("SendNotification", {
Title = "TOE Admin Loaded",
Text = "Your Prefix is "..prefix.." Have fun!",
Duration = 10
})
wait(0.1)
local split = ' '

game.Players.LocalPlayer.Chatted:Connect(function(msg)
if msg:match(prefix.."halos on") then
_G.halos = true
while _G.halos == true do
wait()
game:GetService("ReplicatedStorage").Configuration.Effects.Remote.haloAction:FireServer("Blue Halo")
wait()
game:GetService("ReplicatedStorage").Configuration.Effects.Remote.haloAction:FireServer("Teal Halo")
wait()
game:GetService("ReplicatedStorage").Configuration.Effects.Remote.haloAction:FireServer("Purple Halo")
wait()
game:GetService("ReplicatedStorage").Configuration.Effects.Remote.haloAction:FireServer("Pink Halo")
end
elseif msg:match(prefix .. "halos off") then
_G.halos = false
elseif msg:match(prefix .. "no tp") or msg:match(prefix .. "noteleport") or msg:match(prefix .. "autowin") then
for _,v in pairs(game:GetService("Workspace"):WaitForChild("tower"):WaitForChild("sections"):WaitForChild("finish"):WaitForChild("FinishGlow"):GetDescendants()) do
if v:IsA("TouchTransmitter") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0)
wait()
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 1)
end
end
elseif msg:match(prefix .. "top") or msg:match(prefix .. "goto top") or msg:match(prefix .. "tp to top") then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(game:GetService("Workspace"):WaitForChild("tower"):WaitForChild("sections"):WaitForChild("finish"):WaitForChild("FinishGlow").Position)
elseif msg:match(prefix .. "buygod") or msg:match(prefix .. "invincibility") then
local args = {
    [1] = {
        ["Name"] = "invincibility"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("mutatorEvent"):FireServer(unpack(args))
elseif msg:match(prefix .. "prefix ") then
prefix = (msg:sub(9))
wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Alert!";
    Text = "Your new prefix is "..prefix,
    Duration = 5
})
elseif msg:match(prefix .. "nobunny") then
game:GetService("ReplicatedStorage"):WaitForChild("bunny").Value = false
elseif msg:match(prefix .. "cmds") then
print[[
Tower FL Commands--->
        --(start every command with the prefix)--
        
        halos on -- toggles Halos ON
        halos off -- toggles Halos OFF
        no tp / noteleport / autowin --wins without teleporting/teleport
        top / goto top / tp to top -- wins with teleporting/teleport
        rejoin / rj -- rejoins
        speedcoil / coil1 -- buys coil 1
        gravcoil / coil2 -- buys coil 2
        fusioncoil / coil3 -- buys coil 3
        umbrella -- buys umbrella
        trampoline -- buys trampoline
        buygod / invincibility -- buys Godmode for everybody
        nobunny -- disables bunny jump
        prefix -- changes prefix
        ]]
end
end)
