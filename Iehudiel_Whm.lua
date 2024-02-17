include('organizer-lib')
function get_sets()
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	canceled = false
	DC = false
	Main = 'OFF' -- Set Default Main Weapon ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	Kiting = 'OFF' -- Set Default Sublimation Kiting ON or OFF Here --
	ElementalStaff = 'OFF' -- Set Default Precast Elemental Staff ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book(1) -- Change Default Macro Book At The End --
		Sublimation_benchmark = 30
		Sublimation = 1
		
	Regen = {'Regen','Regen II','Regen III','Regen IV',}
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"} -- Curaga Degradation --
	Na_Spells = S{"Paralyna","Silena","Poisona","Blindna","Viruna","Stona","Erase"} -- For Yagrush --
	sc_map = {SC1 = "LightArts", SC2 = "Celerity", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {
		main="Daybreak",
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		body="Ebers Bliaut +2",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Bunzi's Sabots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Ethereal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
	}
	-- Idle Sets --

	sets.Idle.Refresh = {
		main="Mpaca's Staff",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Ebers Bliaut +2",
		hands="Inyan. Dastanas +2",
		legs="Assid. Pants +1",
		feet="Inyan. Crackows +2",
		neck="Sibyl Scarf",
		waist="Fucho-no-Obi",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Ethereal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
	}
	sets.Idle.Movement = {
		main="Daybreak",
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		body="Ebers Bliaut +2",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Crier's Gaiters",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Gurebu's Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape",
	}
	sets.Resting = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body="Ebers Bliaut +2",
		hands={ name="Chironic Gloves", augments={'STR+12','Accuracy+8','"Refresh"+1',}},
		legs="Assid. Pants +1",
		feet="Bunzi's Sabots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Ethereal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','Latent effect: "Refresh"+1',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
	}

	-- PDT Set --
	sets.PDT = {
			}

	-- Sublimation Set --
	sets.Sublimation = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body="Ebers Bliaut +2",
		hands={ name="Chironic Gloves", augments={'STR+12','Accuracy+8','"Refresh"+1',}},
		legs="Assid. Pants +1",
		feet="Crier's Gaiters",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Ethereal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','Latent effect: "Refresh"+1',}},
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
	}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
		main={ name="Gada", augments={'"Fast Cast"+4','Mag. Acc.+22','"Mag.Atk.Bns."+19','DMG:+5',}},
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Ebers Cap +2",
		body="Inyanga Jubbah +2",
		hands={ name="Kaykaus Cuffs", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
		legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		feet="Regal Pumps +1",
		neck="Nodens Gorget",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Perimede Cape",
	}

	-- Elemental Staves --
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Light = {main='Arka I'}

	sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{head="Umuthi Hat",hands="Carapacho cuffs",waist="Siegel Sash"})
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,
		{waist="Siegel Sash"}
	)
	sets.Precast['Healing Magic'] = {set_combine(sets.Precast.FastCast,
		{legs="Ebers Pant. +2"}
	)}

	-- Cure Precast Set --
	sets.Precast.Cure = sets.Precast['Healing Magic']

	-- Midcast Base Set --
	sets.Midcast = {
		main={ name="Gada", augments={'"Fast Cast"+4','Mag. Acc.+22','"Mag.Atk.Bns."+19','DMG:+5',}},
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Bunzi's Hat",
		body="Inyanga Jubbah +2",
		hands={ name="Kaykaus Cuffs", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
		legs="Bunzi's Pants",
		feet="Regal Pumps +1",
		neck="Nodens Gorget",
		waist="Rumination Sash",
		left_ear="Halasz Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Solemnity Cape",
	}

	-- Haste Set --
	sets.Midcast.Haste = { main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+8','"Mag.Atk.Bns."+19','DMG:+1',}},
		sub="Ammurapi Shield",
    ammo="Incantor Stone",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
	waist="Embla Sash",
	}
	
	-- Cure Set --
	sets.Midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Ebers Bliaut +2",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +2",
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Nodens Gorget",
		waist="Rumination Sash",
		left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		right_ear="Mendi. Earring",
		left_ring="Naji's Loop",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+10 /Mag. Dmg.+10','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	-- Cure Enmity Set --
	sets.Midcast.Cure.Enmity = set_combine(sets.Midcast.Cure, {})

	-- Curaga Set --
	sets.Midcast.Curaga =  {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Theo. Bliaut +3",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +2",
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Nodens Gorget",
		waist="Rumination Sash",
		left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		right_ear="Mendi. Earring",
		left_ring="Naji's Loop",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+10 /Mag. Dmg.+10','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	-- Curaga Enmity Set --
	sets.Midcast.Curaga.Enmity = set_combine(sets.Midcast.Curaga,{})

	sets.Midcast['Enhancing Magic'] = {
		main={ name="Gada", augments={'"Fast Cast"+4','Mag. Acc.+22','"Mag.Atk.Bns."+19','DMG:+5',}},
		sub="Culminus",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Cure" spellcasting time -5%','Enh. Mag. eff. dur. +9',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Acc.+22','"Cure" spellcasting time -3%','Enh. Mag. eff. dur. +9',}},
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Enhancing Torque",
		waist="Embla Sash",
		left_ear="Halasz Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
	}

	-- Barspells Set --
	sets.Midcast.Bar = {
		main="Beneficus",
		sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +2",
		body="Ebers Bliaut +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Telchine Braconi", augments={'Mag. Acc.+22','"Cure" spellcasting time -3%','Enh. Mag. eff. dur. +9',}},
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Enhancing Torque",
		waist="Embla Sash",
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
	}

	-- Regen Set --
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +2",
		body={ name="Telchine Chas.", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Cure" spellcasting time -5%','Enh. Mag. eff. dur. +9',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Acc.+22','"Cure" spellcasting time -3%','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
		neck="Enhancing Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Mendi. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
	}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = {set_combine(sets.Midcast.Haste,{
		waist="Carrier's Sash",
		neck="Nodens Gorget"}
	)}

	-- Na Set --
	sets.Midcast.Na = {
		main={ name="Gada", augments={'"Fast Cast"+4','Mag. Acc.+22','"Mag.Atk.Bns."+19','DMG:+5',}},
		head="Ebers Cap +2",		
		legs="Ebers Pant. +2",
	}

	-- Cursna Set --
	sets.Midcast.Cursna = {
		main={ name="Gada", augments={'"Fast Cast"+4','Mag. Acc.+22','"Mag.Atk.Bns."+19','DMG:+5',}},
		sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +2",
		body="Ebers Bliaut +2",
		hands={ name="Fanatic Gloves", augments={'MP+30','Healing magic skill +5','"Conserve MP"+4',}},
		legs="Ebers Pant. +2",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Malison Medallion",
		waist="Rumination Sash",
		left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		right_ear={ name="Ebers Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+10 /Mag. Dmg.+10','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	sets.Midcast['Divine Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Digni. Earring",
		body="Inyanga Jubbah +2",
		hands="Fanatic Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Aurist's Cape +1",
		waist="Luminary Sash",
		legs="Chironic Hose",
	}

	sets.Midcast['Enfeebling Magic'] = {
		main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body="Theo. Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+20','Pet: Mag. Acc.+22','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
		feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
		neck="Imbodla Necklace",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+10 /Mag. Dmg.+10','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	sets.Midcast['Dark Magic'] = set_combine(sets.Midcast['Enfeebling Magic'],{
			Neck="erra pendant"})

	sets.Midcast.Impact = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Clr. Briault +2"}
	sets.JA.Martyr = {hands="Clr. Mitts +2"}
	sets.JA.Devotion = {head="Clr. Cap +2"}

	-- Divine Caress Set --
	sets['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- Lock Main Weapon --
	sets.MainWeapon = {			
			sub="sors shield"}

	-- WS Base Set --
	sets.WS = {}
	sets.WS['Hexa Strike'] = {waist="Fotia Belt"}
	sets.WS['Mystic Boon'] = {}
	sets.WS.Dagan = {}
end



function precast(spell,action)
	if canceled then
		return
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Stoneskin" then
				equip(sets.Precast[spell.english])
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and not Na_Spells:contains(spell.english) and ElementalStaff == 'ON' then
		equip(sets.Precast[spell.element])
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if Na_Spells:contains(spell.english) then
			equipSet = equipSet.Na
			add_to_chat(158, '************* ['..spell.name..'] ************')
			if DC then
				equipSet = set_combine(equipSet,sets['Divine Caress'])
			end
		elseif string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') then
				if Enmity == 'ON' then
					equipSet = equipSet.Cure.Enmity
				else
					equipSet = equipSet.Cure
				end
			elseif string.find(spell.english,'Cura') then
				if Enmity == 'ON' then
					equipSet = equipSet.Curaga.Enmity
				else
					equipSet = equipSet.Curaga
				end
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{main="Chatoyant staff",back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english == "Protectra V" then
			equipSet = set_combine(equipSet,{feet="Piety duckbills"})
		elseif spell.english == "Shellra V" then
			equipSet = set_combine(equipSet,{legs="Piety Pantaloons"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Bar') then
			equipSet = equipSet.Bar
		elseif string.find(spell.english,'Regen') then
			equipSet = equipSet.Regen
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{hands="Clr. Mitts +2",ring1="Fenian Ring"})
		elseif string.find(spell.english,'Reraise') then
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end 
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end 
	equip(equipSet)
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function aftercast(spell,action)
	if canceled then
		canceled = false
		return
	else
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif (spell.english == "Repose" or spell.english == "Sleep II") then -- Repose & Sleep II Countdown --
				send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif (spell.english == "Sleep" or spell.english == "Sleepga") then -- Sleep & Sleepga Countdown --
				send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Banish III" then -- Banish III Countdown --
				send_command('wait 35;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
			end
		end
		status_change(player.status)
	end
end

function AutoSublimation() 
     if player.sub_job == 'SCH' then
        if buffactive['Sublimation: Complete'] then
                if player.mpp < Sublimation_benchmark then  
                    if Sublimation == 1 then
                        windower.send_command('@wait 4;input /ja "Sublimation" <me>')
                        add_to_chat(039,'Sublimation Completed: MP Emergency')
                    end
                elseif player.mpp < 75 then
                    if Sublimation == 1 then
                        windower.send_command('@wait 4;input /ja "Sublimation" <me>')
                        add_to_chat(159,'Sublimation Completed: MP Mid Range')
                    end
                end
        elseif not buffactive['Sublimation: Complete'] and not buffactive['Sublimation: Activated'] then
            if Sublimation == 1 then
            windower.send_command('@wait 4;input /ja "Sublimation" <me>')
            end
        end
end
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function status_change(new,action)
	if new == 'Idle' then
			AutoSublimation()
		end	
	if buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	else if buffactive ["Sublimation: Complete"] then
		equip(sets.Idle[IdleArray[IdleIndex]])
		end
end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down AM3.png;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'divine caress' then
		DC = gain
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Follow Toggle --
		send_command('input /ta Bokura;input /lockon;wait .3;setkey numpad8 down;wait .3;setkey numpad7 down;wait .3;setkey numpad7 up;wait .3;setkey numpad8 up')
	elseif command == 'C3' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Main Weapon Toggle --
		if Main == 'ON' then
			Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'B10' then -- Sublimation Toggle --
		if Sublimation == 1 then
			Sublimation = 0
			add_to_chat(8,'Auto Sublimation: [Off]')
		else
			Sublimation = 1
			add_to_chat(158,'Auto Sublimation: [ON]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: '..tostring(player.tp))
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
		return originalCost*.9
	elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
		return originalCost*1.1
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'SCH' then
		set_macro_page(3, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 18)
	elseif player.sub_job == 'DNC' then
		set_macro_page(10, 18)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 18)
	else
		set_macro_page(1, 18)
	end
end
organizer_items = {
	
	Sushi="Remedy",
	
}
include('organizer-lib')