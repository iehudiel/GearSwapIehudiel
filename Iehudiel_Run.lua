--require("no_interruptions")
-- NOTE: I do not play run, so this will not be maintained for 'active' use. 
-- It is added to the repository to allow people to have a baseline to build from,
-- and make sure it is up-to-date with the library API.


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
    -- Table of entries
    rune_timers = T{}
    -- entry = rune, index, expires
    
    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('Normal', 'AM3')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDT2','HP')
	state.MagicalDefenseMode:options('Hybrid','Meva')
    state.IdleMode:options('Regen', 'Refresh')
	
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind !f12 gs c reset DefenseMode')
	send_command('bind PAGEDOWN input //send @all follow Crowned')
	send_command('bind END input //send @all gs c unfol')
	send_command('bind DELETE input //hp all Castle Zvahl Keep S')
	
	select_default_macro_book()

end


function init_gear_sets()
    sets.enmity = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body="Emet Harness +1",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck="Moonlight Necklace",
        waist="Sulla Belt",
        left_ear="Cryptic Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Begrudging Ring",
        right_ring="Petrov Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {body="Runeist Coat +1",})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},})
    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body={ name="Futhark Coat", augments={'Enhances "Elemental Sforzo" effect',}},})
    sets.precast.JA['Lunge'] = {
        sub="Refined Grip +1",
        ammo="Pemphredo Tathlum",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Agwu's Pigaches",
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = {hands="Runeist Mitons +2"}
    sets.precast.JA['Rayke'] = {feet="Futhark Bottes"}
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.enmity, {hands="Futhark Mitons"})
    sets.precast.JA['Embolden'] = {}
	sets.precast.JA['Holy Circle'] = sets.enmity
	sets.precast.JA['Sentinel'] = sets.enmity
    sets.precast.JA['Vivacious Pulse'] = {
        main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Rune. Trousers +1",
        feet="Nyame Sollerets",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Altruistic Cape",
    }
    sets.precast.JA['One For All'] = {
        ammo="Staunch Tathlum",
        head="Agwu's Cap",
        body="Emet Harness +1",
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Sulla Belt",
        left_ear="Halasz Earring",
        right_ear="Cryptic Earring",
        left_ring="Begrudging Ring",
        right_ring="Petrov Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
    sets.precast.FC = {
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Rune. Bandeau +2",
        body="Erilaz Surcoat +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
        legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
        feet="Nyame Sollerets",
        neck="Unmoving Collar +1",
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Kishar Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +1",head="Erilaz Galea +2",
    })
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


	-- Weaponskill sets
	sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head={ name="Herculean Helm", augments={'Accuracy+12 Attack+12','Weapon skill damage +5%','STR+6','Attack+5',}},
        body={ name="Lustr. Harness +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
        hands="Meg. Gloves +2",
        legs={ name="Herculean Trousers", augments={'Accuracy+13','Weapon skill damage +5%','STR+2',}},
        feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
        neck="Futhark Torque +2",
        waist="Prosilio Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Karieyh Ring +1",
        back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
	
    sets.precast.WS['Resolution'] = {
        
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Meg. Chausses +2",
        feet="Nyame Sollerets",
        neck="Asperity Necklace",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','Latent effect: "Refresh"+1',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back="Ogma's Cape",
    }
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, 
        {
            ammo="Honed Tathlum", 
            body="Dread Jupon", 
            hands="Umuthi Gloves", 
            back="Evasionist's Cape", 
            legs="Manibozho Legs"
    })

    sets.precast.WS['Dimidiation'] = {
        sub="Utu Grip",
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Meg. Chausses +2",
        feet="Nyame Sollerets",
        neck="Asperity Necklace",
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','Latent effect: "Refresh"+1',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back="Ogma's Cape",
    }

	sets.precast.WS['Ground Strike'] = {
        ammo="Yamarang",
        head="Aya. Zucchetto +2",
        body="Runeist Coat +1",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Meg. Chausses +2",
        feet="Runeist's Boots +1",
        neck="Combatant's Torque",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Digni. Earring",
        left_ring="Regal Ring",
        right_ring="Chirich Ring +1",
        back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

	sets.precast.WS['Shockwave'] = {
        ammo="Pemphredo Tathlum",
        head="Volte Cap",
        body="Ayanmo Corazza +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Volte Hose",
        feet="Volte Boots",
        neck="Sanctity Necklace",
        waist="Chaac Belt",
        left_ear="Gwati Earring",
        right_ear="Digni. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

	sets.precast.WS['Decimation'] = {
        ammo="Yamarang",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Meg. Chausses +2",
        feet={ name="Herculean Boots", augments={'Accuracy+12 Attack+12','"Triple Atk."+3','Accuracy+5','Attack+8',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    }

	sets.precast.WS['Armor Break'] = {
        ammo="Yamarang",
        head="Aya. Zucchetto +2",
        body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Aya. Cosciales +2",
        feet="Volte Boots",
        neck="Sanctity Necklace",
        waist="Luminary Sash",
        left_ear="Gwati Earring",
        right_ear="Digni. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'].Normal, 
        {ammo="Honed Tathlum", head="Whirlpool Mask", hands="Buremte Gloves", back="Evasionist's Cape", waist="Thunder Belt"})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {hands="Umuthi Gloves"})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'].Normal, {})
	
	


	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
        body="Runeist Coat +1",
        hands="Turms Mittens +1",
        legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
        feet="Turms Leggings +1",
        neck={ name="Futhark Torque +2", augments={'Path: A',}},
        waist="Audumbla Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Moonbeam Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
	sets.midcast['Temper'] = {
        ammo="Staunch Tathlum",
        head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
        body="Erilaz Surcoat +2",
        hands="Runeist Mitons +2",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Nyame Sollerets",
        neck="Enhancing Torque",
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.midcast['Phalanx'] = {
        ammo="Staunch Tathlum",
        head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
        body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
        hands={ name="Taeon Gloves", augments={'Spell interruption rate down -10%','Phalanx +3',}},
        legs={ name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Genmei Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.midcast['Regen'] = {
        ammo="Staunch Tathlum",
        head="Rune. Bandeau +2",
        body="Runeist Coat +1",
        hands="Turms Mittens +1",
        legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
        feet="Turms Leggings +1",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Genmei Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    sets.midcast['Stoneskin'] = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
        body="Runeist Coat +1",
        hands="Turms Mittens +1",
        legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
        feet="Turms Leggings +1",
        neck="Loricate Torque +1",
        waist="Audumbla Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Moonbeam Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    sets.midcast.Cure = {neck="Colossus's Torque", hands="Buremte Gloves", ring1="Ephedra Ring", feet="Futhark Boots +1"}
	sets.midcast['Flash'] = sets.enmity
	sets.midcast['Foil'] = sets.enmity
	sets.midcast['Sheep Song'] = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck="Moonlight Necklace",
        waist="Sulla Belt",
        left_ear="Halasz Earring",
        right_ear="Cryptic Earring",
        left_ring="Begrudging Ring",
        right_ring="Evanescence Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
	}
	sets.midcast['Soporific'] = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck="Moonlight Necklace",
        waist="Sulla Belt",
        left_ear="Halasz Earring",
        right_ear="Cryptic Earring",
        left_ring="Begrudging Ring",
        right_ring="Evanescence Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
	
	sets.midcast['Stun'] = {
        ammo="Aqreaqa Bomblet",
        head="Volte Cap",
        body="Emet Harness +1",
        hands="Kurys Gloves",
        legs="Volte Hose",
        feet="Volte Boots",
        neck="Futhark Torque +2",
        waist="Chaac Belt",
        left_ear="Cryptic Earring",
        right_ear="Tuisto Earring",
        left_ring={name="Moonlight Ring", bag="wardrobe3"},
        right_ring={name="Moonlight Ring", bag="wardrobe4"},
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	sets.midcast['Poisonga'] = {
    ammo="Aqreaqa Bomblet",
    head="Volte Cap",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Volte Hose",
    feet="Volte Boots",
    neck="Futhark Torque +2",
    waist="Chaac Belt",
    left_ear="Cryptic Earring",
    right_ear="Tuisto Earring",
    left_ring={name="Moonlight Ring", bag="wardrobe3"},
    right_ring={name="Moonlight Ring", bag="wardrobe4"},
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
}

	sets.midcast['Banishga'] = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
        hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck="Moonlight Necklace",
        waist="Sulla Belt",
        left_ear="Halasz Earring",
        right_ear="Cryptic Earring",
        left_ring="Begrudging Ring",
        right_ring="Evanescence Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
	
	sets.midcast['Refresh'] = {
        head="Erilaz Galea +2",
        body="Runeist Coat +1",
    }

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body="Adamantite Armor",
        hands="Erilaz Gauntlets +2",
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring="Gurebu's Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    
           
	sets.defense.PDT = {
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
        body="Runeist Coat +1",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Turms Leggings +1",
        neck={ name="Futhark Torque +2", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Erilaz Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	sets.defense.PDT2 = {
        main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body="Erilaz Surcoat +2",
        hands="Erilaz Gauntlets +2",
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	sets.defense.HP = {
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
        body="Runeist Coat +1",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Turms Leggings +1",
        neck={ name="Futhark Torque +2", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Odnowa Earring +1",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	sets.defense.Hybrid = {
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Turms Mittens +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    }

	sets.defense.Meva =  {
        main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
        sub="Refined Grip +1",
        ammo="Staunch Tathlum",
        head="Nyame Helm",
        body="Erilaz Surcoat +2",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Erilaz Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
        left_ring="Gurebu's Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

	sets.Kiting = {
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Skadi's Jambeaux +1"
    }
	
	sets.sallet = {head="Frenzy Sallet"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
        ammo="Staunch Tathlum",
        head="Erilaz Galea +2",
        body="Adamantite Armor",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +2",
        feet="Turms Leggings +1",
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }
    
	sets.engaged.AM3 = {        
        sub="Utu Grip",
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Nyame Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="Eri. Leg Guards +2",
        feet="Nyame Sollerets",
        neck="Anu Torque",
        waist="Kentarch Belt",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Moonlight Ring",
        right_ring="Niqmaddu Ring",
        back="Ogma's Cape",
    }
	

end

------------------------------------------------------------------
-- Action events
------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        local obi = get_obi(get_rune_obi_element())
        if obi then
            equip({waist=obi})
        end
    end
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs:get(1) == 'rad'
		then send_command('input //temps buy radialens')
		add_to_chat(158,'Buying radialens')
	end
	if commandArgs:get(1) == 'super'
		then send_command('input //temps buy "Super Revitalizer"')
		add_to_chat(158,'Buying revit')
	end
	if commandArgs:get(1) == 'unfol'
		then send_command('setkey numpad7 down;wait 0.1;setkey numpad7 up')
		add_to_chat(158,'Unfollowing')
	end
	if commandArgs:get(1) == 'exit'
		then send_command('input /item "Veridical conflux shard" <me>')
		add_to_chat(158,'Exiting HTBF')
	end
	if commandArgs:get(1) == 'htmb'
		then send_command('input //htmb')
		add_to_chat(158,'Buying KI')
	end
	if commandArgs:get(1) == 'revit'
		then send_command('input /item "Revitalizer" <me>')
		add_to_chat(158,'Using Revitalizer')
	end
	if commandArgs:get(1) == 'compass'
		then send_command('input /item "Maze Compass" <me>')
		add_to_chat(158,'Exiting Maze')
	end
	if commandArgs:get(1) == 'ambu'  
        then send_command('input /ja "Tenebrae" <me>; wait 6; input /ja "Tenebrae" <me>; wait 6; input /ja "Tenebrae" <me>; wait 2; input /ja "Embolden" <me>; wait 2; input /ma "Crusade" <me>; wait 5; input /ma "Aquaveil" <me>; wait 6; input /ma "Ice Spikes" <me>; wait 5; input /ma "Temper" <me>; wait 5; input /ma "Phalanx" <me>')
		add_to_chat(158,'Ambu buffs')
	end
	if commandArgs:get(1) == 'cait'  
        then send_command('input /ja "Tenebrae" <me>; wait 6; input /ja "Tenebrae" <me>; wait 6; input /ja "Tenebrae" <me>; wait 2; input /ma "Crusade" <me>; wait 5; input /ma "Aquaveil" <me>; wait 6; input /ma "Phalanx" <me>; wait 5; input /ma "Ice Spikes" <me>; wait 5; input /ja "Embolden" <me>; wait 2; input /ma "Temper" <me>')
		add_to_chat(158,'Cait Sith buffs')
	end
	if commandArgs:get(1) == 'holla'
        then send_command('input /equip ring2 "Dim. Ring (Holla)"; wait 11; input /item "Dim. Ring (Holla)" <me>')
        add_to_chat(158,'Dimensional Ring being used.')		
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(2, 15)
	elseif player.sub_job == 'SAM' then
		set_macro_page(2, 15)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 15)
	elseif player.sub_job == 'PLD' then
		set_macro_page(2, 15)	
	else
		set_macro_page(2, 15)
	end
end

function job_buff_change(buff, gain)

	
	if (buff == "sleep" and gain) and player.hp > 100 and player.status == "Engaged" then 
                equip(sets.sallet)
				else
				send_command('input //gs c update')
                if buffactive.stoneskin then
                    send_command('cancel Stoneskin') 
                end
    end
end

function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']
    
    local found_rune_element
    
    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end
    
    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end


------------------------------------------------------------------
-- Timer manipulation
------------------------------------------------------------------



-- Get the command string to create a custom timer for the provided entry.
function create_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    local duration = entry.expires - os.time()
    return 'timers c ' .. timer_name .. ' ' .. tostring(duration) .. ' down'
end

-- Get the command string to delete a custom timer for the provided entry.
function delete_timer(entry)
    local timer_name = '"Rune: ' .. entry.rune .. '-' .. tostring(entry.index) .. '"'
    return 'timers d ' .. timer_name .. ''
end

-- Reset all timers
function reset_timers()
    local cmd_queue = ''
    for index,entry in pairs(rune_timers) do
        cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
    end
    rune_timers:clear()
    send_command(cmd_queue)
end

-- Get a count of the number of runes of a given type
function rune_count(rune)
    local count = 0
    local current_time = os.time()
    for _,entry in pairs(rune_timers) do
        if entry.rune == rune and entry.expires > current_time then
            count = count + 1
        end
    end
    return count
end

-- Remove the oldest rune(s) from the table, until we're below the max_runes limit.
-- If given a value n, remove n runes from the table.
function trim(n)
    local cmd_queue = ''

    local to_remove = n or (rune_timers:length() - max_runes)

    while to_remove > 0 and rune_timers:length() > 0 do
        local oldest
        for index,entry in pairs(rune_timers) do
            if oldest == nil or entry.expires < rune_timers[oldest].expires then
                oldest = index
            end
        end
        
        cmd_queue = cmd_queue .. prune(rune_timers[oldest].rune)
        to_remove = to_remove - 1
    end
    
    return cmd_queue
end

-- Drop the index of all runes of a given type.
-- If the index drops to 0, it is removed from the table.
function prune(rune)
    local cmd_queue = ''
    
    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            cmd_queue = cmd_queue .. delete_timer(entry) .. ';wait 0.05;'
            entry.index = entry.index - 1
        end
    end

    for index,entry in pairs(rune_timers) do
        if entry.rune == rune then
            if entry.index == 0 then
                rune_timers[index] = nil
            else
                cmd_queue = cmd_queue .. create_timer(entry) .. ';wait 0.05;'
            end
        end
    end
    
    return cmd_queue
end

