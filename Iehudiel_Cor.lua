include('organizer-lib')
--Please ensure that all of the bullet fields are filled in properly. Also ensure that all of the annotated gun lines are filled in properly.--
--If you wish for Luzaf Ring mode to default to "on", change Luzaf_ind = 1   to Luzaf_ind = 2 --

--To toggle gearsets:
--Main command: //gs c toggle x set       where x = set name variable. Variables are as follows: --
--Idle sets: Idle, Melee TP sets: MTP, Ranged TP sets: RTP--
--Requiescat sets: Req, Last Stand sets: LastS, Leaden Salute sets: LeadS, Wildfire sets: WF--
--Quick Draw sets: QD, Luzaf Ring Mode: Luzaf--
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
	
end

function user_setup()
    state.Weapons = M{['description']='Current Weapon',
        'Fomalhaut',
        'DeathPenalty',
        'Anarchy +2',
        'Armageddon',
    }
    send_command('bind @e gs c cycle Weapons')
end
 
function user_unload()
    send_command('unbind @e')
end
 
function init_gear_sets()
    sets.DeathPenalty = {
        main={name="Rostam", bag="Wardrobe 3", priority=2},
        range="Death Penalty",
        sub={name="Rostam", bag="Wardrobe 2", priority=1},
    }
    sets.Fomalhaut = {
        main={name="Rostam", bag="Wardrobe 3", priority=2},
        range="Fomalhaut",
        sub={name="Rostam", bag="Wardrobe 2", priority=1},
    }
    sets.Armageddon = {
        main={name="Rostam", bag="Wardrobe 3", priority=2},
        range="Armageddon",
        sub={name="Rostam", bag="Wardrobe 2", priority=1},
    }
    sets['Anarchy +2'] = {
        main={name="Hepatizon Sapara +1", priority=2},
        range="Anarchy +2",
        sub={name="Blurred Knife +1", priority=1},
    }
end
 
function job_precast(spell, action, spellMap, eventArgs)
    equip(sets[state.Weapons.current])
end
function customize_idle_set(idleSet)
    return set_combine(idleSet, sets[state.Weapons.current])
end
 
function customize_melee_set(meleeSet)
    return set_combine(meleeSet, sets[state.Weapons.current])
end



function get_sets()

	send_command('bind f9 gs c toggle MTP set')
	send_command('bind f10 gs c toggle LastS set')
	--send_command('bind numpad3 input //send Ccarter /follow Roline')
    --send_command('bind numpad2 input //send Ccarter /assist Roline; wait 2; input //send Ccarter /attack')
    --send_command('bind numpad1 input //send Ccarter /ws "Rudras Storm" <t>')
    --send_command('bind numpad4 input //send Ccarter /ja "Collaborator" <Roline>')
    --send_command('bind numpad5 input /ja "Samurai Roll" <me>')
    --send_command('bind numpad6 input /ja "Chaos Roll" <me>')
    --send_command('bind numpad7 input /ja "Tacticians Roll" <me>')
    --send_command('bind numpad8 input /ja "Wizards Roll" <me>')
    --send_command('bind numpad+ input /ja "Double-Up" <me>')
    --send_command('bind numpad0 input /ws "Leaden Salute" <t>')
	--send_command('bind numpad9 input /ja "Misers Roll" <me>')
    --send_command('bind numpad. input //ara start')
	--send_command('bind numpad3 input //ara stop')
	--send_command('bind numpad* input /ja "Snake Eye" <me>')
	--send_command('bind PAGEDOWN input /equipset 018')
	--send_command('bind PAGEUP input /equipset 019')
	--send_command('bind end input /equipset 020')
	--send_command('bind home input /equipset 017')
	end
	
  function file_unload()
      
 
    send_command('unbind ^f9')
    send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
       
    send_command('unbind !f9')
    send_command('unbind !f10')
		send_command('unbind !f11')
    send_command('unbind !f12')

    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
		send_command('unbind PAGEDOWN')
		
		send_command('unbind numpad3')
		send_command('unbind numpad2')
		send_command('unbind numpad1')
		send_command('unbind numpad4')
		send_command('unbind numpad+')
		send_command('unbind numpad5')
		send_command('unbind numpad6')
		send_command('unbind numpad7')
		send_command('unbind numpad8')
		send_command('unbind numpad9')
		send_command('unbind numpad0')
		send_command('unbind numpad.')
		send_command('unbind numpad*')
		send_command('unbind numpad-')
	end	
	
		--Idle Sets--
		sets.Idle = {}
		
		sets.Idle.index = {'Standard', 'DT', 'Town'}
		--1=Standard, 2=DT, 3=Town--
		
		Idle_ind = 1
		--Set this number to whichever set you want the game to default to when you load this lua. This goes for each similar line below.   ex. setting this to 2 will cause the game to equip your DT Idle set by default.--
		
		sets.Idle.Standard = {
      head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
      body="Malignance Tabard",
      hands="Malignance Gloves",
      legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
      feet="Malignance Boots",
      neck="Lissome Necklace",
      waist="Reiki Yotai",
      left_ear="Telos Earring",
      right_ear="Cessance Earring",
      left_ring="Karieyh Ring",
      right_ring="Defending Ring",
      back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    sets.Idle.DT = {
      main="Naegling",
      sub="Gleti's Knife",
      range="Fomalhaut",
      ammo="Chrono Bullet",
      head="Nyame Helm",
      body="Malignance Tabard",
      hands="Nyame Gauntlets",
      legs={ name="Nyame Flanchard", augments={'Path: B',}},
      feet="Nyame Sollerets",
      neck={ name="Loricate Torque +1", augments={'Path: A',}},
      waist="Flume Belt +1",
      left_ear="Etiolation Earring",
      right_ear="Genmei Earring",
      left_ring="Defending Ring",
      right_ring="Vocane Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.Idle.Town = {}
							  						  
							  
							  
							  
							  
							  
		--Melee TP Sets--
		sets.MeleeTP = {}
		
		sets.MeleeTP.index = {'Standard', 'Accuracy', 'DT', 'DTAccuracy'}
		--1=Standard, 2=Accuracy, 3=DT, 4=DTAccuracy--
		
		MeleeTP_ind = 1
		
		sets.MeleeTP.Standard = {      
      range="Fomalhaut",
      ammo="Chrono Bullet",
      head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
      body="Malignance Tabard",
      hands="Malignance Gloves",
      legs={ name="Samnuha Tights", augments={'STR+7','"Dbl.Atk."+2','"Triple Atk."+1',}},
      feet="Nyame Sollerets",
      neck="Clotharius Torque",
      waist="Kentarch Belt",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Petrov Ring",
      right_ring="Ilabrat Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
							
						
		sets.MeleeTP.Accuracy = {      
      range="Fomalhaut",
      ammo="Chrono Bullet",
      head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
      body="Malignance Tabard",
      hands="Malignance Gloves",
      legs={ name="Samnuha Tights", augments={'STR+7','"Dbl.Atk."+2','"Triple Atk."+1',}},
      feet="Nyame Sollerets",
      neck="Clotharius Torque",
      waist="Kentarch Belt",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Petrov Ring",
      right_ring="Ilabrat Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
								
		sets.MeleeTP.DT = {
      main="Naegling",
      sub="Gleti's Knife",
      range="Fomalhaut",
      ammo="Chrono Bullet",
      head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
      body="Malignance Tabard",
      hands="Malignance Gloves",
      legs={ name="Nyame Flanchard", augments={'Path: B',}},
      feet="Nyame Sollerets",
      neck={ name="Loricate Torque +1", augments={'Path: A',}},
      waist="Kentarch Belt",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Defending Ring",
      right_ring="Vocane Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
								   
								   
								   
								   
								   
		--Melee WS Sets--
		sets.Requiescat = {}
		
		sets.Requiescat.index = {'Attack','Accuracy'}
		
		Requiescat_ind = 1
		
		sets.Requiescat.Attack = {}
								  
		sets.Requiescat.Accuracy = {}
									
									
									
									  
		sets.SavageBlade = {
      head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
      body={ name="Nyame Mail", augments={'Path: B',}},
      hands="Meg. Gloves +2",
      legs="Nyame Flanchard",
      feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','CHR+9','Attack+5',}},
      neck="Clotharius Torque",
      waist="Eschan Stone",
      left_ear="Telos Earring",
      right_ear="Ishvara Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Regal Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
									  
									  
									  
		--Ranged TP Sets--
		sets.RangedTP = {
      head="Ikenga's Hat",
      body="Laksa. Frac +2",
      hands="Ikenga's Gloves",
      legs="Ikenga's Trousers",
      feet="Meg. Jam. +2",
      neck="Iskur Gorget",
      waist="Kentarch Belt",
      left_ear="Telos Earring",
      right_ear="Crep. Earring",
      left_ring="Dingir Ring",
      right_ring="Crepuscular Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
		sets.RangedTP.index = {'Standard', 'Accuracy'}
		--1=Standard, 2=Accuracy--
		
		RangedTP_ind = 1
		
		sets.RangedTP.Accuracy = {}
								
									  
									  
		sets.Bullets = {}
		
		sets.Bullets.TP = {ammo="Chrono bullet"}
		
		sets.Bullets.QD = {ammo="Animikii Bullet"}
		
		sets.Bullets.WS = {ammo="Adlivun Bullet"}
		
		sets.Bullets.MWS = {ammo="Orichalcum bullet"}
									  
		
									  
									  
									  
									  
		--Ranged WS Sets--
		sets.LastStand = {
      head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
      body="Laksa. Frac +2",
      hands="Meg. Gloves +2",
      legs="Ikenga's Trousers",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Iskur Gorget",
      waist="Eschan Stone",
      left_ear="Telos Earring",
      right_ear="Enervating Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
		sets.LastStand.index = {'Attack','Accuracy'}
		
		LastStand_ind = 1
		
		sets.LastStand.Attack = {
      head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
      body="Laksa. Frac +2",
      hands="Meg. Gloves +2",
      legs="Ikenga's Trousers",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Iskur Gorget",
      waist="Eschan Stone",
      left_ear="Telos Earring",
      right_ear="Enervating Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.Detonator = {
      head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
      body="Laksa. Frac +2",
      hands="Meg. Gloves +2",
      legs="Ikenga's Trousers",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Iskur Gorget",
      waist="Eschan Stone",
      left_ear="Telos Earring",
      right_ear="Enervating Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
		sets.LastStand.Accuracy = {
      head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
      body="Laksa. Frac +2",
      hands="Meg. Gloves +2",
      legs="Ikenga's Trousers",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Iskur Gorget",
      waist="Eschan Stone",
      left_ear="Telos Earring",
      right_ear="Enervating Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
								   
		sets.LeadenSalute = {
      head="Pixie Hairpin +1",
      body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
      hands="Nyame Gauntlets",
      legs="Nyame Flanchard",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Deviant Necklace",
      waist="Eschan Stone",
      left_ear="Hecate's Earring",
      right_ear="Friomisi Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Archon Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
		sets.LeadenSalute.index = {'MagicAttack','MagicAccuracy'}
		
		LeadenSalute_ind = 1
		
		sets.LeadenSalute.MagicAttack = {
      head="Pixie Hairpin +1",
      body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
      hands="Nyame Gauntlets",
      legs="Nyame Flanchard",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Deviant Necklace",
      waist="Eschan Stone",
      left_ear="Hecate's Earring",
      right_ear="Friomisi Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Archon Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
					
		sets.HotShot = {
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'AGI+14','Pet: "Subtle Blow"+1','Weapon skill damage +6%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Arvina Ringlet +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}					
										   
		sets.Wildfire = {ammo="Living Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'AGI+14','Pet: "Subtle Blow"+1','Weapon skill damage +6%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Arvina Ringlet +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
		
		sets.Wildfire.index = {'MagicAttack','MagicAccuracy'}
		
		Wildfire_ind = 1
		
		sets.Wildfire.MagicAttack = {ammo="Living Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'AGI+14','Pet: "Subtle Blow"+1','Weapon skill damage +6%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Arvina Ringlet +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

    sets.Wildfire.MagicAccuracy = {ammo="Living Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'AGI+14','Pet: "Subtle Blow"+1','Weapon skill damage +6%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Arvina Ringlet +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
								   
		--Job Ability Sets--
	sets.JA = {
    main="Naegling",
    sub="Gleti's Knife",
    range={ name="Compensator", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15',}},
    ammo="Chrono Bullet",
    head={ name="Lanun Tricorne +1", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Chasseur's Gants +1",
    legs={ name="Lanun Trews +1", augments={'Enhances "Snake Eye" effect',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Regal Necklace",
    waist="Kentarch Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Barataria Ring",
    right_ring="Luzaf's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
  }
		
		sets.JA.RandomDeal = {
      body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    }
							  
		sets.JA.WildCard = {
      feet="Lanun Bottes +3"
    }
							
		sets.JA.SnakeEye = {legs="Lanun Trews +1"}
							 
		sets.JA.PhantomRoll = {
      main="Rostam",
      range={ name="Compensator", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15',}},
      head={ name="Lanun Tricorne +1", augments={'Enhances "Winning Streak" effect',}},
      body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
      hands="Chasseur's Gants +1",
      legs="Nyame Flanchard",
      feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
      neck="Regal Necklace",
      waist="Flume Belt +1",
      left_ear="Etiolation Earring",
      right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
      left_ring="Barataria Ring",
      right_ring="Luzaf's Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
							   
		sets.JA.TacticianRoll = set_combine(sets.JA.PhantomRoll, {})
								 
							   
		sets.JA.CourserRoll = set_combine(sets.JA.PhantomRoll, {feet="Chass. Bottes +2"})
							   
		sets.JA.BlitzerRoll = set_combine(sets.JA.PhantomRoll, {})
							   
							   
		sets.QuickDraw = {ammo="Living Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'AGI+14','Pet: "Subtle Blow"+1','Weapon skill damage +6%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Arvina Ringlet +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
	
		sets.QuickDraw.index = {'MagicAttack', 'MagicAccuracy'}
		
		QuickDraw_ind = 1
		
		sets.QuickDraw.MagicAttack = {
      head="Nyame Helm",
      body={ name="Samnuha Coat", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+11','"Dual Wield"+2',}},
      hands="Malignance Gloves",
      legs="Nyame Flanchard",
      feet="Chass. Bottes +2",
      neck="Deviant Necklace",
      waist="Eschan Stone",
      left_ear="Hecate's Earring",
      right_ear="Friomisi Earring",
      left_ring="Crepuscular Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
									  
		sets.QuickDraw.MagicAccuracy = {
      head="Nyame Helm",
      body={ name="Samnuha Coat", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+11','"Dual Wield"+2',}},
      hands="Malignance Gloves",
      legs="Nyame Flanchard",
      feet="Chass. Bottes +2",
      neck="Deviant Necklace",
      waist="Eschan Stone",
      left_ear="Hecate's Earring",
      right_ear="Friomisi Earring",
      left_ring="Crepuscular Ring",
      right_ring="Dingir Ring",
      back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
							   
							   
							   
		sets.Luzaf = {ring1="Luzaf's Ring"}
		sets.Luzaf.index = {'Off','On'}
		
		Luzaf_ind = 2
		
		
		sets.Luzaf.Off = {}
		
		sets.Luzaf.On = {ring1="Luzaf's Ring"}
							   
							   
							   
							   
							   
							   
		--Utility Sets--
		sets.Utility = {}
		
		sets.Utility.PDT = {}
						
		sets.Utility.MDT = {}
							
		sets.Utility.FastCast = {
    head={ name="Herculean Helm", augments={'"Fast Cast"+5','STR+2','Mag. Acc.+13','"Mag.Atk.Bns."+2',}},
      body="Dread Jupon",
      hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
      legs="Malignance Tights",
      feet={ name="Carmine Greaves", augments={'HP+60','MP+60','Phys. dmg. taken -3',}},
      neck="Orunmila's Torque",
      waist="Reiki Yotai",
      left_ear="Loquac. Earring",
      right_ear="Etiolation Earring",
      left_ring="Kishar Ring",
      right_ring="Prolix Ring",
      back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
								 
							  
    sets.Utility.Cure = {}
                
    sets.Utility.Snapshot =  {}
							 
									 
							 
	sets.Adoulin = {body="Councilor's Garb",}

  sets.MoveSpeed = {
    main="Naegling",
    sub="Gleti's Knife",
    range="Fomalhaut",
    ammo="Chrono Bullet",
    head="Nyame Helm",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Hermes' Sandals",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back={ name="Camulus's Mantle", augments={'AGI+16','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%','Damage taken-5%',}},
  }
							 
							 
							 
		--Obis--
	sets.Obi = {waist="Anrin Obi",}
		
		
		
		
		
		
		
		
		
		
		--Precast Rules--
		function precast(spell)
			
			if spell.name == "Ranged" then
				equip(sets.Utility.Snapshot)
					if player.equipment.range == "Fomalhaut" then            --GUN NAME NEEDED--
						equip(sets.Bullets.TP)
					end
			end
			
			if spell.action_type == 'Magic' then
				equip(sets.Utility.FastCast)
			end
	
			if spell.english == 'Fire Shot' or spell.english == 'Ice Shot' or spell.english == 'Wind Shot' or spell.english == 'Earth Shot' or spell.english == 'Thunder Shot' or spell.english == 'Water Shot' then
				equip(sets.QuickDraw[sets.QuickDraw.index[QuickDraw_ind]])
					if spell.element == world.weather_element or spell_element == world.day_element then
						equip(sets.Obi[spell.element])
					end
					if player.equipment.range == "Fomalhaut" then            --GUN NAME NEEDED-- 
						equip(sets.Bullets.QD)
					end
			end
			
			if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
				equip(sets.QuickDraw.MagicAccuracy)
					if player.equipment.range == "Fomalhaut" then            --GUN NAME NEEDED-- 
						equip(sets.Bullets.QD)
					end
			end
	
			if spell.english == 'Random Deal' then
				equip(sets.JA.RandomDeal)
			end
	
			if spell.english == 'Wild Card' then
				equip(sets.JA.WildCard)
			end
	
			if spell.english == 'Snake Eye' then
				equip(sets.JA.SnakeEye)
			end
	
			if spell.english == 'Fold' then
				equip(sets.JA.Fold)
			end
			
			if spell.english == "Corsair's Roll" or spell.english == "Ninja's Roll" or spell.english == "Hunter's Roll" or spell.english == "Chaos Roll" or spell.english == "Magus's Roll" or spell.english == "Healer's Roll" or spell.english == "Drachen Roll" or spell.english == "Choral Roll" or spell.english == "Monk's Roll" or spell.english == "Beast Roll" or spell.english == "Samurai Roll" or spell.english == "Evoker's Roll" or spell.english == "Rogue's Roll" or spell.english == "Warlock's Roll" or spell.english == "Fighter's Roll" or spell.english == "Puppet Roll" or spell.english == "Gallant's Roll" or spell.english == "Wizard's Roll" or spell.english == "Dancer's Roll" or spell.english == "Scholar's Roll" or spell.english == "Bolter's Roll" or spell.english == "Allies' Roll" or spell.english == "Miser's Roll" or spell.english == "Caster's Roll" or spell.english == "Companion's Roll" or spell.english == "Avenger's Roll" then
				equip(sets.JA.PhantomRoll)
			end
			
			if spell.english == "Tactician's Roll" then
				equip(sets.JA.TacticianRoll)
			end
			
			if spell.english == "Courser's Roll" then
				equip(sets.JA.CourserRoll)
			end
			
			if spell.english == "Blitzer's Roll" then
				equip(sets.JA.BlitzerRoll)
			end
			
			if spell.english == "Hot Shot" then
				equip(sets.HotShot)
			end
			
			if spell.english == "Detonator" then
				equip(sets.Detonator)
			end
			
			if spell.english == 'Requiescat' then
				equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
			end
			
			if spell.english == 'Evisceration' then
				equip(sets.Evisceration[sets.Evisceration.index[Evisceration_ind]])
			end
			
			if spell.english == 'Savage Blade' then
				equip(sets.SavageBlade)
			end
			
			if spell.english == 'Last Stand' then
				equip(sets.LastStand[sets.LastStand.index[LastStand_ind]])
					if player.equipment.range == "Doomsday" then            --GUN NAME NEEDED--
						equip(sets.Bullets.WS)
					end
			end
			
			if spell.english == 'Leaden Salute' then
				equip(sets.LeadenSalute[sets.LeadenSalute.index[LeadenSalute_ind]])
					if spell.element == world.weather_element or spell_element == world.day_element then
						equip(set_combine(sets.LeadenSalute[sets.LeadenSalute.index[LeadenSalute_ind]], sets.Obi))
					end
			end
			
			if spell.english == 'Wildfire' then
				equip(sets.Wildfire[sets.Wildfire.index[Wildfire_ind]])
					if spell.element == world.weather_element or spell_element == world.day_element then
						equip(sets.Obi[spell.element])
					end
						if player.equipment.range == "Doomsday" then            --GUN NAME NEEDED--
							equip(sets.Bullets.MWS)
						end
			end
			
			if spell.action_type == 'Ranged Attack' and player.equipment.ammo:lower() == 'animikii bullet' then
				cancel_spell()
				add_to_chat(8,'!!!WARNING!!! Attempted to fire Animikii Bullet! Shot canceled.')
				return
			end

			if spell.type:lower() == 'weaponskill' and player.equipment.ammo:lower() == 'animikii bullet' then
				cancel_spell()
				add_to_chat(8,'!!!WARNING!!! Attempted to fire Animikii Bullet! Weaponskill canceled.')
				return
			end
		end		
		
		
		
		
		
		
		--Midcast Rules--
		function midcast(spell,act)
		
	
			if spell.english == 'Cure*' then
				equip(sets.Utility.Cure)
			end
	
			
			if spell.name == "Ranged" then
				equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
			end
			
			if spell.action_type == 'Ranged Attack' and player.equipment.ammo:lower() == 'animikii bullet' then
				cancel_spell()
				add_to_chat(8,'!!!WARNING!!! Attempted to fire Animikii Bullet! Shot canceled.')
				return
			end

			if spell.type:lower() == 'weaponskill' and player.equipment.ammo:lower() == 'animikii bullet' then
				cancel_spell()
				add_to_chat(8,'!!!WARNING!!! Attempted to fire Animikii Bullet! Weaponskill canceled.')
				return
			end
			
			
		end
		
		
		
		
		
		
		--Aftercast Rules--
		function aftercast(spell)
			
			if player.status == 'Engaged' then
				equip(sets.MeleeTP[sets.MeleeTP.index[MeleeTP_ind]])
					else
						equip(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
	
			
		
		
		
		
		
		--Misc Rules--
		function status_change(new,old)
			
			if new == 'Engaged' then
				equip(sets.MeleeTP[sets.MeleeTP.index[MeleeTP_ind]])
					else
						equip(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
			
	
		
		function self_command(command)
		
			if command == 'toggle MTP set' then
				MeleeTP_ind = MeleeTP_ind +1
				if MeleeTP_ind > #sets.MeleeTP.index then MeleeTP_ind = 1 end
				send_command('@input /echo <----- Melee TP Set changed to '..sets.MeleeTP.index[MeleeTP_ind]..' ----->')
				equip(sets.MeleeTP[sets.MeleeTP.index[MeleeTP_ind]])
				
			elseif command == 'toggle RTP set' then
				RangedTP_ind = RangedTP_ind +1
				if RangedTP_ind > #sets.RangedTP.index then RangedTP_ind = 1 end
				send_command('@input /echo <----- Ranged TP Set changed to '..sets.RangedTP.index[RangedTP_ind]..' ----->')
				equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
	
			elseif command == 'toggle Idle set' then
				Idle_ind = Idle_ind +1
				if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
				send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
				equip(sets.Idle[sets.Idle.index[Idle_ind]])
	
			elseif command == 'toggle Req set' then
				Requiescat_ind = Requiescat_ind +1
				if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
				send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
				
			elseif command == 'toggle Evis set' then
				Evisceration_ind = Evisceration_ind +1
				if Evisceration_ind > #sets.Evisceration.index then Evisceration_ind = 1 end
				send_command('@input /echo <----- Evisceration set changed to '..sets.Evisceration.index[Evisceration_ind]..' ----->')
				
			elseif command == 'toggle LastS set' then
				LastStand_ind = LastStand_ind +1
				if LastStand_ind > #sets.LastStand.index then LastStand_ind = 1 end
				send_command('@input /echo <----- Last Stand set changed to '..sets.LastStand.index[LastStand_ind]..' ----->')
			
			elseif command == 'toggle LeadS set' then
				LeadenSalute_ind = LeadenSalute_ind +1
				if LeadenSalute_ind > #sets.LeadenSalute.index then LeadenSalute_ind = 1 end
				send_command('@input /echo <----- Leaden Salute set changed to '..sets.LeadenSalute.index[LeadenSalute_ind]..' ----->')
			
			elseif command == 'toggle WF set' then
				Wildfire_ind = Wildfire_ind +1
				if Wildfire_ind > #sets.Wildfire.index then Wildfire_ind = 1 end
				send_command('@input /echo <----- Wildfire set changed to '..sets.Wildfire.index[Wildfire_ind]..' ----->')
				
			elseif command == 'toggle QD set' then
				QuickDraw_ind = QuickDraw_ind +1
				if QuickDraw_ind > #sets.QuickDraw.index then QuickDraw_ind = 1 end
				send_command('@input /echo <----- Quick Draw set changed to '..sets.QuickDraw.index[QuickDraw_ind]..' ----->')
				
			elseif command == 'toggle Luzaf' then
				Luzaf_ind = Luzaf_ind +1
				if Luzaf_ind > #sets.Luzaf.index then Luzaf_ind = 1 end
				send_command('@input /echo <----- Luzaf state changed to '..sets.Luzaf.index[Luzaf_ind]..' ----->')
				equip(sets.Luzaf[sets.Luzaf.index[Luzaf_ind]])
	
			elseif command == 'equip TP set' then
				equip(sets.MeleeTP[sets.MeleeTP.index[MeleeTP_ind]])
			
			elseif command == 'equip Idle set' then
				equip(sets.Idle[sets.Idle.index[Idle_ind]])
				
			end
			
		end
		
	