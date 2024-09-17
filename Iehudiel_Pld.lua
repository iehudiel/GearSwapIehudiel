--[[
                                                                       
88888888ba               88                       88  88               
88      "8b              88                       88  ""               
88      ,8P              88                       88                   
88aaaaaa8P'  ,adPPYYba,  88  ,adPPYYba,   ,adPPYb,88  88  8b,dPPYba,   
88""""""'    ""     `Y8  88  ""     `Y8  a8"    `Y88  88  88P'   `"8a  
88           ,adPPPPP88  88  ,adPPPPP88  8b       88  88  88       88  
88           88,    ,88  88  88,    ,88  "8a,   ,d88  88  88       88  
88           `"8bbdP"Y8  88  `"8bbdP"Y8   `"8bbdP"Y8  88  88       88  ]]
                                                                       
                                                                       

windower.add_to_chat(123,[[PLD Lua Author: Kiddeath #7894 (Discord)]])
windower.add_to_chat(160,[[Feel free to DM me if you have any questions or suggestions for this file.]])

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	playermoving  = M(false, "moving")
	include('Mote-TreasureHunter')
end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--================================================--

function user_setup()
    state.OffenseMode:options('Normal','Acc','Tanking','Hybrid')
    state.IdleMode:options('Normal','Tanking')
	state.ShieldMode = M('Aegis', 'Duban')
	state.DoomMode = M('OFF', 'Doom')
	state.HPMode = M('None', 'HighHP')
	state.WeaponLockMode = M('Unlocked','Locked')
	state.WeaponskillMode:options('Normal', 'HighHP')
	state.ReraiseMode = M('None','Reraise')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	
	
		
	send_command('bind f7 gs c cycle ShieldMode')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c set IdleMode Tanking;gs c set OffenseMode Tanking')
	send_command('bind f12 gs c cycle WeaponLockMode')
	--CRTR+ binds
	send_command('bind ^f7 gs c cycle TreasureMode')
	send_command('bind ^f9 gs c cycle ReraiseMode')
	send_command('bind ^f10 gs c cycle HPMode')
	send_command('bind ^f11 gs c set IdleMode Normal;gs c set OffenseMode Normal')
	send_command('bind ^f12 gs c cycle ZoneRing')
	select_default_macro_book()
	
end

function user_unload()

		send_command('unbind ^f7')
        send_command('unbind ^f9')
        send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
		send_command('unbind !f11')
        send_command('unbind !f12')
 
		send_command('unbind f7')
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
		
		
end

function init_gear_sets()

	sets.Enmity = {
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonlight Necklace",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		
	sets.Aegis = {
		main={ name="Burtgang", augments={'Path: A',}},
		sub="Aegis"
	}
	
	sets.Priwen = {sub="Priwen"}
	
	sets.Ochain = {
		main={ name="Burtgang", augments={'Path: A',}},
		sub="Ochain"
	}
		
	sets.EnmityMax =  { 
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonlight Necklace",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}

--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

	--[[If you want your default shield to be Ochain, go to the top of this file 
	in the user_setup() section and where it has state.ShieldMode = M('Aegis', 'Ochain'), 
	change it to  state.ShieldMode = M('Ochain', 'Aegis') and change the Shield here to Ochain]]
	
	sets.defaultSwordAndShield = {}

	sets.Reraise = {body="Twilight Mail",head="Twilight Helm"}
	
	sets.idle = { 
		main={ name="Burtgang", augments={'Path: A',}},
		sub="Aegis",
		ammo="Staunch Tathlum",
		head="Chev. Armet +3",
		body="Sakpata's Plate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		--legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +3",
		feet="Rev. Leggings +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Moonlight Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		
	sets.idle.Tanking = {
		main={ name="Burtgang", augments={'Path: A',}},
		sub="Aegis",
		ammo="Staunch Tathlum",
		head="Chev. Armet +3",
		body="Sakpata's Plate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		--legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +3",
    	feet="Rev. Leggings +3",
		neck="Diemer Gorget",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Moonlight Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		
	sets.idle.HighHP = {
		ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",
		body="Sakpata's Plate",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +3",
		feet="Sakpata's Leggings",
		neck="Loricate Torque +1",
		--waist="Carrier's Sash",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Moonlight Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Accuracy+10','Enmity+10','Damage taken-5%',}},
	}
		
	--[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]
	
	sets.idle.MDT = {
		sub="Aegis",
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Chev. Cuisses +3",
		feet="Sakpata's Leggings",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Gurebu's Ring",
		right_ring="Defending Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		--not relevant unless your idleset uses a body that does not have DT or MDT
		
	sets.latent_refresh = {
		main="Malignance Sword",
	}
		
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

    sets.engaged = { 
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Ginsen",
		head="Hjarrandi Helm",
		body="Sakpata's Plate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Diemer Gorget",
		waist="Kentarch Belt",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Petrov Ring",
		left_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	
    sets.TreasureHunter = {
		ammo="Staunch Tathlum +1",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handschuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonbeam Necklace",
		waist="Sulla Belt",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+4','Enmity+10',}},
	}
		
    
    --[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]
	--Put your best DT/HP body here
	sets.engaged.MDT = {
		body="Sakpata's Plate",
	}
	
	
	sets.engaged.Tanking = {
		ammo="Staunch Tathlum",
		head="Hjarrandi Helm",
    	body="Sakpata's Plate",
    	hands="Sakpata's Gauntlets",
    	legs="Sakpata's Cuisses",
    	feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    	neck="Loricate Torque +1",
    	waist="Kentarch Belt",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    	left_ring="Moonlight Ring",
		right_ring="Defending Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		
	--[[sets.engaged.HighHP = {
		ammo="Staunch Tathlum",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Moonlight Ring",
		right_ring="Defending Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}]]

	sets.engaged.HighHP = {
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Moonlight Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	
    sets.engaged.repulse = {back="Philidor Mantle"}

	sets.Adoulin = {body="Councilor's Garb",}
	
	sets.MoveSpeed = {
		main={ name="Burtgang", augments={'Path: A',}},
		sub="Aegis",
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Sakpata's Leggings",
		neck="Warder's Charm +1",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Moonlight Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	
	sets.Doom = {waist="Gishdubar Sash"}
	
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--

	sets.precast.WS = {
		ammo="Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Sulev. Leggings +2",
		neck="Asperity Necklace",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		

    sets.precast.WS['Savage Blade'] = {
		ammo="Crepuscular Pebble",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Sulev. Leggings +2",
		neck="Asperity Necklace",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	

    sets.precast.WS['Chant Du Cygne'] = {
		ammo="Amar Cluster",
		head="Hjarrandi Helm",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Odyssean Gauntlets", augments={'Weapon skill damage +2%','Accuracy+2','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		legs={ name="Valor. Hose", augments={'Weapon skill damage +3%','STR+9','Attack+7',}},
		feet="Sulev. Leggings +2",
		neck="Asperity Necklace",
		waist="Kentarch Belt",
		left_ear="Digni. Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
		
		
	sets.precast.WS['Sanguine Blade'] = {
		ammo="Amar Cluster",
		head="Hjarrandi Helm",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Odyssean Gauntlets", augments={'Weapon skill damage +2%','Accuracy+2','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		legs={ name="Valor. Hose", augments={'Weapon skill damage +3%','STR+9','Attack+7',}},
		feet="Sulev. Leggings +2",
		neck="Asperity Necklace",
		waist="Kentarch Belt",
		left_ear="Digni. Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	
	
	sets.precast.WS['Circle Blade'] = {
		ammo="Amar Cluster",
		head="Hjarrandi Helm",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Odyssean Gauntlets", augments={'Weapon skill damage +2%','Accuracy+2','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		legs={ name="Valor. Hose", augments={'Weapon skill damage +3%','STR+9','Attack+7',}},
		feet="Sulev. Leggings +2",
		neck="Asperity Necklace",
		waist="Kentarch Belt",
		left_ear="Digni. Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	

	sets.precast.WS['Atonement'] = {
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head={ name="Loess Barbuta +1", augments={'Path: A',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar +1",
		waist="Creed Baudrier",
		left_ear="Ishvara Earring",
		right_ear="Thrud Earring",
		left_ring="Vocane Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	
	sets.precast.WS.HighHP = set_combine(sets.precast.WS, {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",
	})
	
	sets.precast.WS['Savage Blade'].HighHP = set_combine(sets.precast.WS['Savage Blade'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})
	
	--[[sets.precast.WS['Savage Blade'].HighHP = set_combine(sets.precast.WS['Savage Blade'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})
	
	
	sets.precast.WS['Chant Du Cygne'].HighHP = set_combine(sets.precast.WS['Chant Du Cygne'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})	
	
	
	sets.precast.WS['Atonement'].HighHP = set_combine(sets.precast.WS['Atonement'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})
	
	
	sets.precast.WS['Sanguine Blade'].HighHP = set_combine(sets.precast.WS['Sanguine Blade'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})
	
	
	sets.precast.WS['Circle Blade'].HighHP = set_combine(sets.precast.WS['Circle Blade'], {
		ammo="Brigantia Pebble",
		head="Loess Barbuta",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonlight Cape",})
	]]
--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--

	-- Precast sets to enhance JAs
    
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity, {legs={ name="Cab. Breeches +1", augments={'Enhances "Invincible" effect',}},})
    sets.precast.JA['Shield Bash'] = {
		sub="Aegis",
		hands={ name="Cab. Gauntlets +2", augments={'Enhances "Chivalry" effect',}},
	}
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {feet="Rev. Leggings +3",})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity, {feet="Caballarius Leggings"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity, {head="Caballarius Coronet"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity, {body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}}})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {feet="Chev. Sabatons +2",})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Reverence Coronet +2"})
	sets.precast.JA['Palisade'] = sets.Enmity
	sets.precast.JA['Cover'] = set_combine(sets.Enmity, {
		head="Rev. Coronet +1",
		body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}}
	})
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Animated Flourish'] = sets.Enmity
		
	--[[ Fast cast sets for spells,  FC.Inspired is called when you have Fast Cast buff active from Inspiration, You can use this to get a
	Hybrid set that has more DT and HP while still capping Fast Cast depending on how many merits you have invested in it]]
	
	--Recommended: Reverence Surcoat +3; High HP, Fast Cast +10%	
    sets.precast.FC = { 
		ammo="Staunch Tathlum",
		head="Chev. Armet +3",
		body="Rev. Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+6',}},
		feet="Chev. Sabatons +2",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	}
		
	--Recommended: Reverence Surcoat +3; High HP, Fast Cast +10%	
	sets.precast.HighHP = {
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Rev. Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+6',}},
		feet="Chev. Sabatons +2",
		neck="Moonlight Necklace",
		waist="Rumination Sash",
		left_ear="Etiolation Earring",
		right_ear="Halasz Earring",
		left_ring="Kishar Ring",
		right_ring="Defending Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",})
	
	sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {neck="Magoraga beads",})
	
	sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})

--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--


    sets.midcast.FastRecast = {}
    
	sets.midcast.Enhance = {
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Adamantite Armor",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +3",
		feet="Rev. Leggings +3",
		neck="Enhancing Torque",
		waist="Cascade Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	}
		
    --Reccomended: Best Phalanx+ Gear, irrespective of SIRD (for Dark Matter Aug'd Phalanx gear)
	--If you do not have Dark Matter Phalanx+, just put your normal Phalanx gear here.
	
	sets.midcast['Phalanx'] = {
		main="Sakpata's Sword",
    	sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}}, 
		ammo="Staunch Tathlum",
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
		body={ name="Yorium Cuirass", augments={'Phalanx +3',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Sakpata's Cuisses",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Enhancing Torque",
		waist="Cascade Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Weard Mantle", augments={'VIT+4','DEX+2','Enmity+3','Phalanx +5',}},
	}
    
	

	
	--Reccomended: Yorium gear with +3 Phalanx and Spell Interruption Rate -10% per slot, pad out other slots with DT and HP
	--If you do not have Dark Matter Phalanx gear, make sure you put your Phalanx set in the set above this.
	
	sets.SIRD_Phalanx = {
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Sakpata's Plate",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+6',}},
		feet={ name="Odyssean Greaves", augments={'AGI+6','Rng.Acc.+12 Rng.Atk.+12','"Treasure Hunter"+1','Accuracy+14 Attack+14',}},
		neck="Moonlight Necklace",
		waist="Rumination Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Halasz Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Weard Mantle", augments={'VIT+4','DEX+2','Enmity+3','Phalanx +5',}},
	}
	
	sets.SIRD2 = {		
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Adamantite Armor",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+6',}},
		feet={ name="Odyssean Greaves", augments={'AGI+6','Rng.Acc.+12 Rng.Atk.+12','"Treasure Hunter"+1','Accuracy+14 Attack+14',}},
		neck="Moonlight Necklace",
		waist="Rumination Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Halasz Earring",
		left_ring="Moonlight Ring",
		right_ring="Defending Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','VIT+10','Enmity+10','Damage taken-5%',}},
	}
	--This set is called for Reprisal and Cocoon
	
	sets.midcast.Cure = { 
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Adamantite Armor",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Sakpata's Cuisses",
		feet="Rev. Leggings +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		left_ring="Stikini Ring +1",
		right_ring="Sirona's Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	}

	--sets.midcast.Cure = { 
	--	main={ name="Burtgang", augments={'Path: A',}},
	--	ammo="Staunch Tathlum",
	--	head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	--	body="Rev. Surcoat +3",
	--	hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	--	legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+6',}},
	--	feet={ name="Odyssean Greaves", augments={'AGI+6','Rng.Acc.+12 Rng.Atk.+12','"Treasure Hunter"+1','Accuracy+14 Attack+14',}},
	--	neck="Moonlight Necklace",
	--	waist="Rumination Sash",
	--	left_ear="Etiolation Earring",
	--	right_ear="Nourish. Earring +1",
	--	left_ring="Moonlight Ring",
	--	right_ring="Sirona's Ring",
	--	back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	--}
		
	sets.midcast.Cure.HighHP = {
		main={ name="Burtgang", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Adamantite Armor",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Sakpata's Cuisses",
		feet="Rev. Leggings +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		left_ring="Stikini Ring +1",
		right_ring="Sirona's Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+12','Accuracy+9 Attack+9','STR+5','"Fast Cast"+10','Damage taken-2%',}},
	}
	
	sets.midcast['Refresh'] = 
		set_combine(sets.midcast.Enhance, {
			waist="Gishdubar Sash"})

		
	sets.midcast.Cocoon = sets.SIRD2
		
	sets.midcast.OmenLowHP = {}
		
	end
	


--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--======================================================================--



mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                playermoving.value = true
                send_command('gs c update')
				if world.area:contains("Adoulin") then
                send_command('gs equip sets.Adoulin')
				else
                send_command('gs equip sets.MoveSpeed')
                end

                moving = true

            elseif dist < 1 and moving then
                playermoving.value = false
                send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)

--==================================================================--
--   _____                          _     _                         --
--  |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
--  | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
--  |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
--  |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--==================================================================--

function job_aftercast(spell, action, spellMap, eventArgs)

	if state.DoomMode.value == 'Doom' then
		--send_command('input /party IS STILL DOOMED! <scall15>') --[[Uncomment this if you want this to happen after actions]]
	end

end

function job_precast(spell, action, spellMap, eventArgs)


	
end

function job_post_precast(spell, action, spellMap, eventArgs)

	
	if (buffactive['invincible'] or buffactive['sentinel'] or buffactive['palisade'] 
		or buffactive['reprisal']) and (spell.english == 'Holy Circle' or spell.english == 'Sentinel' 
		or spell.english == 'Rampart' or spell.english == 'Divine Emblem' or spell.english == 'Cover' 
		or spell.english == 'Palisade' or spell.english == 'Provoke' or spell.english == 'Animated Flourish') then
			equip(sets.Enmity)
	end
	
	if state.HPMode.value == 'HighHP' and spell.action_type == 'Magic' then
		equip(sets.precast.HighHP)

	end
	
	if spell.type:lower() == 'weaponskill' and state.HPMode.value == 'HighHP' then
		equip(sets.precast.WS.HighHP)
	end

end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

	
	if spell.english == 'Phalanx' then
		equip(sets.midcast['Phalanx'])
	end
	
	if spell.english == 'Phalanx' and not buffactive['phalanx']  then 
		equip(set_combine(sets.midcast['Phalanx'], sets.SIRD_Phalanx))
	end
	
	if spell.english == 'Reprisal' and not buffactive['reprisal'] then 
		equip(set_combine(sets.midcast['Reprisal'], sets.SIRD2))
	end
	
	if state.HPMode.value == 'HighHP' and spell.skill == 'Magic' then 
		equip(sets.idle.HighHP)
	end
	
	if (buffactive['invincible'] or buffactive['sentinel'] or buffactive['palisade'] 
		or buffactive['reprisal']) and (spell.english == 'Jettatura' or spell.english == 'Geist Wall' 
		or spell.english == 'Soporific' or spell.english == 'Blank Gaze' or spell.english == 'Sheep Song' 
		or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere' or spell.english == 'Stun' 
		or spell.english == 'Awful Eye'or spell.english == 'Grand Slam') then
			equip(sets.EnmityMax)
	end
	
	if state.HPMode.value == 'HighHP' and spell.english:startswith('Cure') then
		equip(sets.midcast.Cure.HighHP)
	end
	
	if state ~= nil and state.ReraiseMode.value == 'Reraise' and spell.skill == 'Magic' then
		equip(sets.Reraise)
	end
	
end

windower.register_event('zone change', function()

	send_command('gs c set ZoneRing None')
	
end)

function job_midcast(spell, action, spellMap, eventArgs)


	if spell.english == 'Flash' or spell.english == 'Invincible' then
		equip(sets.Enmity)
	elseif spell.english == 'Jettatura' or spell.english == 'Geist Wall' or spell.english == 'Soporific' or spell.english == 'Blank Gaze' 
	or spell.english == 'Sheep Song' or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere'
	or spell.english == 'Stun' or spell.english == 'Awful Eye'or spell.english == 'Grand Slam' then
		equip(sets.EnmityMax)
	end
	
	
	if spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhance)
	end
	
	if state.ReraiseMode.value == 'Reraise' and spell.skill == 'Enhancing Magic' then
		equip(set_combine(sets.midcast.Enhance, sets.Reraise))
	end

	
	if spell.english == 'Pollen' then
		equip(sets.midcast.OmenLowHP)
	end

	
end

function customize_idle_set(idleSet)

    if buffactive['Doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
	end
	
	if not buffactive['Shell'] and state.IdleMode.value == 'Tanking' then
		if not (world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
		idleSet = set_combine(idleSet, sets.idle.MDT)
		end
	end

	
	if state.ShieldMode.value == 'Aegis' then
			idleSet = set_combine(idleSet, {main="burtgang", sub="Aegis"})
		elseif state.ShieldMode.value == 'Duban' then
			idleSet = set_combine(idleSet, {main="burtgang", sub="Duban"})
	end
	
	if state.ShieldMode.value == 'Duban' and buffactive['reprisal'] then
		idleSet = set_combine(idleSet, {sub="Priwen"})
	end
	
	if state.ZoneRing.value == 'Warp' then
		idleSet = set_combine(idleSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Mea)"})	
		return idleSet
	end
	
	if state.ReraiseMode.value == 'Reraise' then
		idleSet = set_combine(idleSet, sets.Reraise)
	end
	
	if state.HPMode.value == 'HighHP' then
		idleSet = sets.idle.HighHP
	end
	
    return idleSet
	
end

function job_buff_change(buff, gain)

		
		if (buff and gain) or (buff and not gain) then
			send_command('gs c update')
		end

		if buff == "doom" and gain then
				send_command('gs c set DoomMode Doom')
			elseif buff == "doom" and not gain then
				send_command('gs c set DoomMode OFF')
		end
		
		if buff == 'Shell' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			send_command()
			end
		end
		
		if buff == 'Defense Boost' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			windower.add_to_chat(122,'*_*)    COCOON   HAS WORN OFF    (*_*')
			--send_command('input /party Cocoon DOWN: Defense Bonus Off <call21>')
			end
		end
		
		if buff == 'Phalanx' and not gain then
			windower.add_to_chat(122,'*_*)    PHALANX   HAS WORN OFF    (*_*')
		end	
	
end

function job_state_change(stateField, newValue, oldValue)

	send_command('gs c update')

	if state.WeaponLockMode.value == newValue and newValue == 'Locked' then
		disable('main','sub','range')
	elseif state.WeaponLockMode.value == newValue and newValue == 'Unlocked' then
		enable('main','sub','range')
	end
	
	if state.DoomMode.value == 'Doom' then
		send_command("input /party I'm DOOOOOMED, HAAAAAALP!")
	elseif state.DoomMode.value ==  newValue and newValue == 'OFF' then
		send_command('input /party Doom is off! :D ')
	end
	
	if state.ShieldMode.value == newValue and newValue == 'Aegis' then
		send_command('gs enable main sub range;wait 0.1;gs disable main sub range')
	elseif state.ShieldMode.value == newValue and newValue == 'Duban' then
		send_command('gs enable main sub range;wait 0.1;gs disable main sub range')
	end

end

function customize_melee_set(meleeSet)
	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if not buffactive['Shell'] and state.ShieldMode.value ~= 'Aegis' and (state.OffenseMode.value == 'Hybrid' or state.OffenseMode.value == 'Normal') then
		meleeSet = set_combine(meleeSet, sets.engaged.MDT)
	end
	
	if state.ShieldMode.value == 'Aegis' then
			meleeSet = set_combine(meleeSet, sets.Aegis)
		elseif state.ShieldMode.value == 'Duban' then
			meleeSet = set_combine(meleeSet, sets.Duban)
	end
	
	if state.ShieldMode.value == 'Duban' and buffactive['reprisal'] then
		meleeSet = set_combine(meleeSet, sets.Priwen)
	end
	
	if state.ZoneRing.value == 'Warp' then
		meleeSet = set_combine(meleeSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Mea)"})	
		return meleeSet
	end
	
	if state.HPMode.value == 'HighHP' then
		meleeSet = sets.engaged.HighHP
	end
	
	if state.ReraiseMode.value == 'Reraise' then
		meleeSet = set_combine(meleeSet, sets.Reraise)
	end
	
    return meleeSet
	 
end
 
	
--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'RUN' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 3)
    else
        set_macro_page(2, 1) --War/Etc
    end
end


function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end

