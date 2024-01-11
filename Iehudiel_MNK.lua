function get_sets()
	send_command("bind f9 gs c toggle TP set")
	send_command("bind f10 gs c toggle Idle set")
	send_command("bind ^f9 gs c equip TP set")
	send_command("bind ^f10 gs c equip DT set")
	
	function file_unload()
		send_command("unbind ^f9")
		send_command("unbind ^f10")
		send_command("unbind ^f11")
		send_command("unbind ^f12")
		send_command("unbind ^`")

		send_command("unbind !f9")
		send_command("unbind !f10")
		send_command("unbind !f11")
		send_command("unbind !f12")

		send_command("unbind f9")
		send_command("unbind f10")
		send_command("unbind f11")
		send_command("unbind f12")
	end

	--Idle Sets--
	sets.Idle = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Bhikku Hose +2",
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.Idle.index = {"Standard", "DT"}
	Idle_ind = 1

	sets.Idle.Standard = {
		ammo ="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		neck = "Sanctity Necklace",
		ear1 = "Eabani Earring",
		ear2 = "Infused Earring",
		body = "Ashera Harness",
		hands="Malignance Gloves",
		ring1 = "Defending ring",
		ring2 = "Shneddick Ring",
		back = "Moonbeam Cape",
		waist = "Moobow Belt",
		legs="Malignance Tights",
		feet = "Nyame Sollerets"
	}

	sets.Idle.DT = {
		ammo = "Staunch Tathlum +1",
		head="Malignance Chapeau",
		neck = "Loricate Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Infused Earring",
		body = "Ashera Harness",
		hands="Malignance Gloves",
		ring1 = "Defending ring",
		ring2 = "Shneddick Ring",
		back = "Moonbeam Cape",
		waist = "Moobow Belt",
		legs="Malignance Tights",
		feet = "Malignance Boots"
	}
	--TP Sets--
	sets.TP = {}

	sets.TP.index = {"Standard","Hybrid"}
	--1=Standard, 2==Hybrid --

	TP_ind = 1
	sets.TP.Standard = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Bhikku Hose +2",
		-- legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.TP.Hybrid ={
		ammo="Amar Cluster",
		head={ name="Rao Kabuto +1", augments={'VIT+12','Attack+25','"Counter"+4',}},
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		legs="Anch. Hose +2",
		feet={ name="Hes. Gaiters +3", augments={'Enhances "Mantra" effect',}},
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Cryptic Earring",
		right_ear={ name="Bhikku Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	--Weaponskill Sets--
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Ken. Hakama +1",
		feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	-- Victory Smithe
	sets.WS.VS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Bhikku Cyclas +2",
		hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Niqmaddu Ring",
		right_ring="Mummu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.WS.SS = {
		ammo="Knobkierrie",
		head="Ken. Jinpachi +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
		feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Mache Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.WS.AF = set_combine(sets.WS, {		
	})

	sets.WS.RF = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Ken. Hakama +1",
		feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.WS.HF = {
		ammo="Knobkierrie",
		head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Ken. Hakama +1",
		feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.WS.TK = {
		ammo="Knobkierrie",
		head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
		legs="Ken. Hakama +1",
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}
	
	sets.WS.Cata = {		
		ammo = "Knobkierrie",
		head="Pixie Hairpin +1",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Archon Ring",
		back = {name = "Segomo's Mantle", augments = {"STR+20", "Accuracy+20 Attack+20", "Weapon skill damage +10%"}}
		}
		
	sets.WS.EC = {		
		ammo = "Knobkierrie",
		head="Nyame Helm",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Regal Ring",
		back = {name = "Segomo's Mantle", augments = {"STR+20", "Accuracy+20 Attack+20", "Weapon skill damage +10%"}}
		}

	--Ninja Magic Sets--
	sets.NINMagic = {}

	sets.NINMagic.Nuke = {
		head = {name = "Herculean Helm",augments = {'Mag. Acc.+20 "Mag.Atk.Bns."+20', '"Dbl.Atk."+2', "Mag. Acc.+12", '"Mag.Atk.Bns."+4'}},
		neck = "Sanctity Necklace",
		ear2 = "Friomisi earring",
		ear1 = "Hecate's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Shiva Ring",
		ring2 = "Acumen Ring",
		waist = "Eschan Stone",
		back = "Gunslinger's Cape",
		legs = "Herculean Trousers",
		feet = {name = "Herculean Boots", augments = {'Mag. Acc.+15 "Mag.Atk.Bns."+15', "VIT+10", '"Mag.Atk.Bns."+12'}}
	}

	sets.NINMagic.Utsusemi = {
		head = {name = "Herculean Helm", augments = {"Accuracy+19 Attack+19", "Damage taken-3%", "AGI+3", "Accuracy+2"}},
		neck = "Loricate Torque",
		ar1 = "Brutal Earring",
		ear2 = "Cessance Earring",
		body = "Ashera Harness",
		hands = "Regimens Mittens",
		ring1 = "Chirich Ring +1",
		ring2 = "Niqmaddu Ring",
		back = "Moonbeam Cape",
		waist = "Carrier's Sash",
		legs = "Herculean Trousers",
		Feet = "Nyame Sollerets",
	}

	--Utility Sets--
	sets.Utility = {}

	sets.Utility.Sleeping = {neck = "Opo-Opo Necklace"}

	sets.Utility.Weather = {waist = "Hachirin-no-obi", back = "Twilight Cape"}

	sets.Utility.MB = {
		head = "Herculean Helm",
		body = "Amalric Doublet",
		ear1 = "Static Earring",
		ring1 = "Locus Ring",
		ring2 = "Mujin Band"
	}

	sets.Utility.Stoneskin = {
		head = "Haruspex hat",
		neck = "Stone Gorget",
		ear1 = "Loquac. earring",
		ear2 = "Earthcry earring",
		body = "Assim. jubbah +1",
		hands = "Stone Mufflers",
		ring1 = "Rahab ring",
		back = "Fi follet cape +1",
		waist = "Siegel sash",
		legs = "Haven hose",
		Feet = "Nyame Sollerets",
	}

	sets.Utility.Phalanx = {
		head = "Haruspex hat",
		neck = "Colossus's torque",
		ear1 = "Loquac. earring",
		ear2 = "Augment. earring",
		body = "Assim. jubbah +1",
		hands = "Ayao's gages",
		ring1 = "Rahab ring",
		back = "Fi follet cape +1",
		waist = "Pythia sash +1",
		legs = "Portent pants",
		Feet = "Nyame Sollerets",
	}

	sets.Utility.Steps = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		body = "Mpaca's Doublet",
		hands = "Rawhide Gloves",
		legs == "Samnuha Tights",
		feet="Nyame Sollerets",
		neck = "Subtlety Spec.",
		waist = "Chaac Belt",
		left_ear = "Brutal Earring",
		right_ear = "Dignitary's Earring",
		left_ring = "Yacuruna Ring",
		right_ring = "Epona's Ring",
		back = "Visucius's Mantle"
	}

	sets.Utility.Doomed = {waist = "Gishdubar Sash", ring1 = "Eshmun's Ring"}

	--Job Ability Sets--

	sets.JA = {}

	sets.JA.Footwork = { feet ="Shukuyu Sune-Ate"}

	sets.JA.Counterstance = {
		main={ name="Godhands", augments={'Path: A',}},
		ammo="Staunch Tathlum",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		legs="Anch. Hose +2",
		feet={ name="Hes. Gaiters +3", augments={'Enhances "Mantra" effect',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Cryptic Earring",
		right_ear={ name="Bhikku Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	sets.JA.ChiBlast = {
		head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
	}
	
	sets.JA.Chakra = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Genmei Kabuto" },
		body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
		hands="Tuisto Earring",
		legs="Hiza. Hizayoroi +2",
		feet="Shukuyu Sune-Ate",
		neck="Unmoving Collar +1",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Cryptic Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Petrov Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}

	--Precast Sets--
	sets.precast = {}

	sets.precast.FC = {}

	sets.precast.FC.Standard =  {
		ammo="Staunch Tathlum",
		head={ name="Rao Kabuto +1", augments={'VIT+12','Attack+25','"Counter"+4',}},
		body="Ken. Samue +1",
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Ryuo Hakama", augments={'HP+50','"Store TP"+4','"Subtle Blow"+7',}},
		feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
		neck="Unmoving Collar +1",
		waist="Rumination Sash",
		left_ear="Sherida Earring",
		right_ear="Etiolation Earring",
		left_ring="Rahab Ring",
		right_ring="Lebeche Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+10 Attack+10','STR+6','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}},
	}
end

function precast(spell)
	if spell.action_type =="Magic" then
		equip(sets.precast.FC.Standard)
	elseif spell.english == "Footwork" then
		equip(sets.JA.Footwork)
	elseif spell.english == "Counterstance" then
		equip(sets.JA.Counterstance)
	elseif spell.english == "Chi Blast" then
		equip(sets.JA.ChiBlast)
	elseif spell.english == "Victory Smite" then
		equip(sets.WS.VS)
		if buffactive["Impetus"] then
			equip({Body = "Bhikku Cyclas +2", right_ear ="Brutal Earring"})
		end
	elseif spell.english == "Chakra" then
		equip(sets.JA.Chakra)
	elseif spell.english == "Shijin Spiral" then
		equip(sets.WS.SS)
	elseif spell.english == "Asuran Fists" then
		equip(sets.WS.AF)
	elseif spell.english == "Raging Fists" then
		equip(sets.WS.RF)
	elseif spell.english == "Howling Fist" then
		equip(sets.WS.HF)
	elseif spell.english == "Tornado Kick" or spell.english == "Dragon Kick" then
		equip(sets.WS.TK)
	elseif spell.english == "Box Step" then
		equip(sets.Utility.Steps)
	elseif spell.english == "Cataclysm" then
		equip(sets.WS.Cata)
	elseif spell.english == "Earth Crusher" then
		equip(sets.WS.EC)
	elseif spell.type == "WeaponSkill" then
		equip(sets.WS.HF)
	end
end

function midcast(spell, act)
	if spell.english == "Utsusemi: Ichi" then
		equip(sets.NINMagic.Utsusemi)
		if buffactive["Copy Image (3)"] then
			send_command("@wait 0.3; input //cancel Copy Image*")
		end
		if buffactive["Copy Image (2)"] then
			send_command("@wait 0.3; input //cancel Copy Image*")
		end
		if buffactive["Copy Image (1)"] then
			send_command("@wait 0.3; input //cancel Copy Image*")
		end
		if buffactive["Copy Image"] then
			send_command("@wait 0.3; input //cancel Copy Image*")
		end
	end
	if spell.english == "Utsusemi: Ni" or spell.english == "Utsusemi: San" then
		equip(sets.NINMagic.Utsusemi)
	end
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive["Impetus"] then
			equip({Body = "Bhikku Cyclas +2"})
		end
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
	if buffactive["doom"] or buffactive["curse"] then
		equip(sets.Utility.Doomed)
	end
	if buffactive["terror"] or buffactive["stun"] or buffactive["sleep"] then
		equip(sets.TP.DT)
	end
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive["Impetus"] then
			equip({Body = "Bhikku Cyclas +2"})
		end
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function self_command(command)
	if command == "toggle TP set" then
		TP_ind = TP_ind + 1
		if TP_ind > #sets.TP.index then
			TP_ind = 1
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == "toggle Idle set" then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == "equip TP set" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command =="equip DT set" then
		equip (sets.TP.DT)
	elseif command == "equip Idle set" then
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

