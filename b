local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = "Archon // Elemental Battlegrounds",
    Center = true,
    AutoShow = true,
    TabPadding = 0
})

-- UI SETUP SECTOR

local Tabs = {
    Main = Window:AddTab('Modules'),
    ['UI Settings'] = Window:AddTab('Settings'),
}

ThemeManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Tabs['UI Settings'])
ThemeManager:SetFolder('Archon')

local MenuGroup = Tabs['UI Settings']:AddRightGroupbox('Miscellaneous')
local CreditsGroup = Tabs['UI Settings']:AddRightGroupbox('Credits')

CreditsGroup:AddLabel("Achronath")
CreditsGroup:AddLabel("- Scripting")
CreditsGroup:AddLabel("Linoria Developers")
CreditsGroup:AddLabel("- UI Library")
MenuGroup:AddButton('Un-Execute Archon', function() Library:Unload() end)

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder('Archon')
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- AUTOFARMS SECTOR

local Autofarm = Tabs.Main:AddLeftGroupbox('Autofarm')

Autofarm:AddToggle('collectshards', {
    Text = 'Collect Shards',
    Default = false, 
    Tooltip = 'Collects all available shards while enabled.'
})

Autofarm:AddToggle('collectdiamonds', {
    Text = 'Collect Diamonds',
    Default = false, 
    Tooltip = 'Collects all available diamonds while enabled.'
})

Autofarm:AddToggle('farmlevels', {
    Text = 'Farm Levels',
    Default = false, 
    Tooltip = 'Levels you up while enabled.'
})

Autofarm:AddDropdown('farmmode', {
    Values = {"Passive","Coordinated"},
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Autofarm Mode',
    Tooltip = 'The mode for autofarming.\n\nPassive - for use while AFK.\nCoordinated - for use while actively playing.', -- Information shown when you hover over the dropdown
})

Autofarm:AddDropdown('farmmethod', {
    Values = {"CFrame","Tween"},
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Autofarm Method',
    Tooltip = 'The movement or collection method for autofarming.\n\nCFrame - instant repositioning. [RECOMMENDED]\nTween - identical to CFrame but bypasses most anti-cheats.', -- Information shown when you hover over the dropdown
})

-- ESP SECTOR

local Visuals = Tabs.Main:AddRightGroupbox('Visuals')

Visuals:AddToggle('esptoggle', {
    Text = 'Player ESP',
    Default = false, 
    Tooltip = 'Toggles Player ESP on or off.'
})

Visuals:AddToggle('objectesptoggle', {
    Text = 'Object ESP',
    Default = false, 
    Tooltip = 'Toggles Object ESP on or off.'
})

-- CLIENT SECTOR 

local Client = Tabs.Main:AddRightGroupbox('Client')

Client:AddToggle('stuntoggle', {
	Text = "No Stun",
	Default = false,
	Tooltip = "Bypasses stun while enabled."
})

Client:AddToggle('lowhealthtoggle', {
	Text = "Auto Safezone",
	Default = false,
	Tooltip = "Safely sends you to a safezone at specified health threshold."
})

local DepBox = Client:AddDependencyBox()
DepBox:AddSlider('thresholdslider', { Text = 'Health', Default = 250, Min = 1, Max = 1000, Rounding = 0 });
DepBox:SetupDependencies({
    { Toggles.lowhealthtoggle, true } -- We can also pass `false` if we only want our features to show when the toggle is off!
});

local HealthBox = 

Client:AddToggle('blindtoggle', {
	Text = "Anti Blind",
	Default = false,
	Tooltip = "Bypasses any blinding while enabled."
})

Client:AddToggle('infjump', {
	Text = "Infinite Jump",
	Default = false,
	Tooltip = "Lets you jump as many times as you want."
})

Client:AddToggle('speedhack', {
	Text = "Speed Bypass",
	Default = false,
	Tooltip = "Set your own movement speed."
})

local DepBox = Client:AddDependencyBox()
DepBox:AddSlider('DepboxSlider', { Text = 'Speed', Default = 2, Min = 1, Max = 5, Rounding = 1 });
DepBox:SetupDependencies({
    { Toggles.speedhack, true } -- We can also pass `false` if we only want our features to show when the toggle is off!
});

Client:AddToggle('flight', {
	Text = "Fly",
	Default = false,
	Tooltip = "Advanced bypassed flight."
})

local FlyBox = Client:AddDependencyBox()
FlyBox:AddSlider('FlyBoxSlider', { Text = 'Speed', Default = 1, Min = 1, Max = 8, Rounding = 1 });
FlyBox:SetupDependencies({
    { Toggles.flight, true } -- We can also pass `false` if we only want our features to show when the toggle is off!
});

-- SPELLS SECTOR 

local Spells = Tabs.Main:AddRightGroupbox("Spells")

Spells:AddDropdown('spelldropdown', {
    Values = {"Grass Blast","Water Blast","Fire Blast"},
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected
    Tooltip = "The spell to be casted.\n\nCan be any spell in the game, even ones not owned."
})

Spells:AddLabel('Cast Key'):AddKeyPicker('spellkeybind', { 
	Default = "G",
	NoUI = true,
})

-- PLAYERS SECTOR 

local Players = Tabs.Main:AddLeftGroupbox("Targets")

Players:AddDropdown('targetdropdown', {
    SpecialType = 'Player',
    Text = 'Player',
    Tooltip = 'Sets the targeted player.', -- Information shown when you hover over the dropdown
})

Players:AddToggle('loopgototarget', {
	Text = "Loop teleport to Target",
	Default = false,
	Tooltip = "Teleports you to the target while enabled."
})

Players:AddToggle('loopattacktarget', {
	Text = "Loop attack Target",
	Default = false,
	Tooltip = "Attacks the target while enabled."
})

-- TRANSPORTATION SECTOR

local Transport = Tabs.Main:AddLeftGroupbox("Teleports")

local TransportButton1 = Transport:AddButton({
    Text = 'Safezone',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1535.9978, 38.5621071, 1003.93378)
    end,
    DoubleClick = false,
    Tooltip = 'Teleports you to a safezone.'
})

local TransportButton2 = Transport:AddButton({
    Text = 'Map Center',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-681.434204, 5.08547068, 894.086365)
    end,
    DoubleClick = false,
    Tooltip = 'Teleports you to the center of the map.'
})

local TransportButton3 = Transport:AddButton({
    Text = 'Mini Arena',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-957.93634, 155.837097, 2022.96448)
    end,
    DoubleClick = false,
    Tooltip = 'Teleports you to a small arena.'
})

local TransportButton4 = Transport:AddButton({
    Text = 'Invis. Sky Part',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-960.859375, 1385.36426, 1127.6073)
    end,
    DoubleClick = false,
    Tooltip = 'Teleports you onto a part in the sky.'
})

-- ACTUAL SCRIPTING PART --

-- FARMS
Toggles.collectshards:OnChanged(function(Value) -- shard autocollection
	if Value == true then
		while true do
		
			local foundshard = false
			if game.Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Shard") then
				local shard = game.Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Shard")
				foundshard = true
				local plr = game.Players.LocalPlayer
				_G.old = plr.Character.HumanoidRootPart.CFrame.Position
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = shard.CFrame
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(shard.CFrame.Position)}):Play()
				end
			end
			
			if Options.farmmode.Value == "Coordinated" and foundshard then
				wait(0.05)
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.old)
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(_G.old)}):Play()
				end
				foundshard = false
			end
			
			if Options.farmmode.Value == "Passive" then
				if foundshard then
					wait(0.05)
				end
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.5338287, 219.486725, 2621.48853)
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(-67.5338287, 219.486725, 2621.48853)}):Play()
				end
			end
			
			if Toggles.collectshards.Value == false then break end
			task.wait()
		end
	end
end)

Toggles.collectdiamonds:OnChanged(function(Value) -- diamond autocollection
	if Value == true then
		while true do
		
			local founddiamond = false
			if game.Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Diamond") then
				local diamond = game.Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Diamond")
				founddiamond = true
				local plr = game.Players.LocalPlayer
				_G.old2 = plr.Character.HumanoidRootPart.CFrame.Position
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = diamond.CFrame
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(diamond.CFrame.Position)}):Play()
				end
			end
			
			if Options.farmmode.Value == "Coordinated" and founddiamond then
				wait(0.05)
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.old2)
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(_G.old2)}):Play()
				end
				founddiamond = false
			end
			
			if Options.farmmode.Value == "Passive" then
				if founddiamond then
					wait(0.05)
				end
				if Options.farmmethod.Value == "CFrame" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.5338287, 219.486725, 2621.48853)
				else
					game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {CFrame = CFrame.new(-67.5338287, 219.486725, 2621.48853)}):Play()
				end
			end
			
			if Toggles.collectdiamonds.Value == false then break end
			task.wait()
		end
	end
end)

Toggles.farmlevels:OnChanged(function(Value) -- level farm
	if Value == true then
		while true do
		
			local player = game.Players.LocalPlayer
			local mouse = player:GetMouse()
			local clientRemote = game.ReplicatedStorage.Remotes.DoClientMagic
			local serverRemote = game.ReplicatedStorage.Remotes.DoMagic
			clientRemote:FireServer("Grass", "Poison Needles") 
			serverRemote:InvokeServer("Grass", "Poison Needles", mouse.Target, mouse.Hit)
			
			if Toggles.farmlevels.Value == false then break end
			task.wait()
		end
	end
end)

Toggles.loopgototarget:OnChanged(function(Value) -- loopgoto target
	if Value == true then
		while true do
			
			if Options.targetdropdown.Value then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Options.targetdropdown.Value].Character.HumanoidRootPart.CFrame
			end
			
			if Toggles.loopgototarget.Value == false then break end
			task.wait()
		end
	end
end)

Toggles.loopattacktarget:OnChanged(function(Value) -- loopgoto target
	if Value == true then
		while true do
			
			if Options.targetdropdown.Value then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Options.targetdropdown.Value].Character.HumanoidRootPart.CFrame
				local plr = game.Players.LocalPlayer
				local mouse = plr:GetMouse()
				local TrueMagic = game.ReplicatedStorage.Remotes.DoMagic
				game.ReplicatedStorage.Remotes.DoClientMagic:FireServer("Wind", "Wind Ascend") 
				TrueMagic:InvokeServer("Wind", "Wind Ascend", mouse.Target, mouse.Hit)
				game.ReplicatedStorage.Remotes.DoClientMagic:FireServer("Nature", "Spiky Shield") 
				TrueMagic:InvokeServer("Nature", "Spiky Shield", mouse.Target, mouse.Hit)
			end
			
			if Toggles.loopattacktarget.Value == false then break end
			task.wait()
		end
	end
end)
