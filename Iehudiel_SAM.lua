function get_sets()

	send_command('bind f9 gs c toggle MTP set')
	send_command('bind f10 gs c toggle Idle set')
	send_command('bind f11 gs c toggle Shoha set')
	send_command('bind f12 gs c toggle Fudo set')
	send_command('bind ^f11 gs c toggle Apex set')
	send_command('bind ^f12 gs c toggle Kaiten set')
	
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
	end
	

		--Idle Sets--
		sets.Idle = {
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Kasuga Kabuto +2",
      body="Kasuga Domaru +2",
      hands="Wakido Kote +2",
      legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
      feet="Flam. Gambieras +2",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Telos Earring",
      right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }		

		sets.Idle.index = {'Standard', 'Town'}
		
		Idle_ind = 1
		
		sets.Idle.Standard = {
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Kasuga Kabuto +2",
      body="Kasuga Domaru +2",
      hands="Wakido Kote +2",
      legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
      feet="Flam. Gambieras +2",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Telos Earring",
      right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
							  
		sets.Idle.Town = {
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Kasuga Kabuto +2",
      body="Kasuga Domaru +2",
      hands="Wakido Kote +2",
      legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
      feet="Flam. Gambieras +2",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Telos Earring",
      right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
				
		--TP Sets--
		sets.TP = {}

		sets.TP.index = {'Standard', 'Hybrid','DT','MEVA'}
		--1=Standard, 2=Hybrid, 3=AccuracyFull, 4=DT, 5=DTAccuracy--
		TP_ind = 1
	
		sets.TP.Standard = {
      sub="Utu Grip",
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Kasuga Kabuto +2",
		body="Kasuga Domaru +2",
		hands="Wakido Kote +2",
		legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
		feet="Flam. Gambieras +2",
		neck="Sam. Nodowa +1",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
		left_ring="Chirich Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
							
		sets.TP.Hybrid = {
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Kasuga Kabuto +2",
      body="Kasuga Domaru +2",
      hands="Wakido Kote +2",
      legs="Mpaca's Hose",
      feet="Mpaca's Boots",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Telos Earring",
      right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
      left_ring="Defending Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
	
		sets.TP.MEVA = {
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Nyame helm",
      body="Nyame Mail",
      hands="Nyame Gauntlets",
      legs="Nyame Flanchard",
      feet="Nyame Sollerets",
      neck="Samurai's nodowa +2",
      waist="Ioskeha Belt +1",
      left_ear="Dedition Earring",
      right_ear="Telos Earring",
      ring2="Gelatinous Ring +1",
      ring1="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
							
		sets.TP.DT = {
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Nyame helm",
      body="Nyame Mail",
      hands={ name="Wakido Kote +3", augments={'Enhances "Blade Bash" effect',}},
      legs="Nyame Flanchard",
      feet="Nyame Sollerets",
      neck="Samurai's nodowa +2",
      waist="Ioskeha Belt +1",
      left_ear="Dedition Earring",
      right_ear="Telos Earring",
      ring2="Gelatinous Ring +1",
      ring1="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }



				  
		sets.TP.DTAccuracy = {
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Nyame helm",
      body="Nyame Mail",
      hands={ name="Wakido Kote +3", augments={'Enhances "Blade Bash" effect',}},
      legs="Tatenashi Haidate +1",
      feet="Flamma gambieras +2",
      neck="Samurai Nodowa +2",
      waist="Flume Belt",
      left_ear="Genmei Earring",
      right_ear="Telos Earring",
      left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -5%',}},
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
							  
							  
		sets.RangedTP = {}

		sets.RangedTP.index = {'Standard', 'AccuracyLite', 'AccuracyFull'}
		--1=Standard, 2=AccuracyLite, 3=AccuracyFull--
		TP_ind = 1
	
		sets.RangedTP.Standard = {
      range="Cibitshavore",ammo="Tulfaire arrow",
      head="Otomi helm",
      neck="Iqabi necklace", 
      ear1="Steelflash earring", 
      ear2="Bladeborn earring", 			          
      body="Sakonji domaru +3",
      hands="Umuthi gloves",
      ring1="K'ayres ring",
      ring2="Rajas ring",
      back="Takaha mantle",
      waist="Cetl belt",
      legs="Wakido haidate +1",
      feet="Waki. Sune-Ate +1"
    }
							
		sets.RangedTP.AccuracyLite = {range="Cibitshavore",ammo="Wooden arrow",
					      head="Otomi helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",				      
						  body="Sakonji domaru +3",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
					      back="Takaha mantle",waist="Dynamic belt +1",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
	
		sets.RangedTP.AccuracyFull = {range="Cibitshavore",ammo="Tulfaire arrow",
					      head="Yaoyotl helm",neck="Iqabi necklace", ear1="Steelflash earring", ear2="Bladeborn earring", 				      
						  body="Sakonji domaru +3",hands="Umuthi gloves",ring1="K'ayres ring",ring2="Rajas ring",
					      back="Takaha mantle",waist="Dynamic belt +1",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							  
							  
							  
							  
							  
							  
		--Weaponskill Sets--
		sets.WS = {
      ammo="Knobkierrie",
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Flam. Zucchetto +2",
      body="Ken. Samue +1",
      hands="Kasuga Kote +2",
      legs="Ken. Hakama +1",
      feet="Mpaca's Boots",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
	
		sets.Shoha = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Kasuga Kote +2",
      legs="Hiza. Hizayoroi +2",
      feet="Nyame Sollerets",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
	
		sets.Shoha.index = {'Attack','Accuracy'}
		Shoha_ind = 1
	
		sets.Shoha.Attack = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Kasuga Kote +2",
      legs="Hiza. Hizayoroi +2",
      feet="Nyame Sollerets",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
								  
		sets.Shoha.Accuracy = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Kasuga Kote +2",
      legs="Hiza. Hizayoroi +2",
      feet="Nyame Sollerets",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
							 
		sets.Fudo = {}
	
		sets.Fudo.index = {'Attack','Accuracy'}
		Fudo_ind = 1
	
		sets.Fudo.Attack = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Kasuga Kote +2",
      legs="Hiza. Hizayoroi +2",
      feet="Kas. Sune-Ate +2",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
							   
		sets.Fudo.Accuracy = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Kasuga Kote +2",
      legs="Hiza. Hizayoroi +2",
      feet="Kas. Sune-Ate +2",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
							  
		sets.Kaiten = {}
		
		sets.Kaiten.index = {'Attack','Accuracy'}
		Kaiten_ind = 1
	
		sets.Kaiten.Attack = {
      ammo="Knobkierrie",
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Flam. Zucchetto +2",
      body="Ken. Samue +1",
      hands="Kasuga Kote +2",
      legs="Ken. Hakama +1",
      feet="Mpaca's Boots",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
							   
		sets.Kaiten.Accuracy = {
      ammo="Knobkierrie",
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Flam. Zucchetto +2",
      body="Ken. Samue +1",
      hands="Kasuga Kote +2",
      legs="Ken. Hakama +1",
      feet="Mpaca's Boots",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Crep. Earring",
      right_ear="Telos Earring",
      left_ring="Chirich Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
		
		sets.Jinpu = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Nyame Helm",
      body="Nyame Mail",
      hands="Nyame Gauntlets",
      legs="Nyame Flanchard",
      feet="Nyame Sollerets",
      neck="Sam. Nodowa +1",
      waist="Carrier's Sash",
      left_ear="Friomisi Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

		sets.Impulse = {
      sub="Utu Grip",
      ammo="Knobkierrie",
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Nyame Gauntlets",
      legs="Hiza. Hizayoroi +2",
      feet="Nyame Sollerets",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Ishvara Earring",
      right_ear="Thrud Earring",
      left_ring="Epaminondas's Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'STR+15','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
		sets.Apex = {}
	
		sets.Apex.index = {'Attack','Accuracy', 'Accuracy Max'}
		Apex_ind = 1
	
		sets.Apex.Attack = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+28','Weapon skill damage +4%','Attack+12',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','Weapon skill damage +3%','STR+10','Attack+5',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+29','Weapon skill damage +4%','VIT+15','Attack+10',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +5%','STR+8','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Thrud Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
							
		sets.Apex.Accuracy = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+28','Weapon skill damage +4%','Attack+12',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','Weapon skill damage +3%','STR+10','Attack+5',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+29','Weapon skill damage +4%','VIT+15','Attack+10',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +5%','STR+8','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Thrud Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
							   
		sets.Apex.MaxAccuracy = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+28','Weapon skill damage +4%','Attack+12',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','Weapon skill damage +3%','STR+10','Attack+5',}},
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +3%','STR+7','Accuracy+14','Attack+15',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +5%','STR+8','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Thrud Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

        sets.Namas = {}
	
		sets.Namas.index = {'Attack','Accuracy'}
		Namas_ind = 1
	
		sets.Namas.Attack = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+28','Weapon skill damage +4%','Attack+12',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','Weapon skill damage +3%','STR+10','Attack+5',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+29','Weapon skill damage +4%','VIT+15','Attack+10',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +5%','STR+8','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Thrud Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
							   
		sets.Namas.Accuracy = {
    sub="Utu Grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+28','Weapon skill damage +4%','Attack+12',}},
    body={ name="Valorous Mail", augments={'Accuracy+25','Weapon skill damage +3%','STR+10','Attack+5',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+29','Weapon skill damage +4%','VIT+15','Attack+10',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+22','Weapon skill damage +5%','STR+8','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Thrud Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}								
									  
									  
									  
									  
									  
		--Utility Sets--
		sets.Utility = {}
		
		sets.Utility.PDT = {
      sub="Utu Grip",
      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
      head="Mpaca's Cap",
      body="Mpaca's Doublet",
      hands="Wakido Kote +2",
      legs="Mpaca's Hose",
      feet="Mpaca's Boots",
      neck="Sam. Nodowa +1",
      waist="Sailfi Belt +1",
      left_ear="Telos Earring",
      right_ear={ name="Kasuga Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
      left_ring="Defending Ring",
      right_ring="Niqmaddu Ring",
      back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
						
		sets.Utility.MDT = {    
	ammo="Staunch Tathlum",
    head="Kendatsuba Jinpachi +1",
    body="Kendatsuba Samue +1",
    hands={ name="Wakido Kote +3", augments={'Enhances "Blade Bash" effect',}},
    legs="Tatenashi Haidate +1",
    feet="Kendatsuba Sune-Ate +1",
    neck="Samurai Nodowa +2",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -5%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -5%','Phys. dmg. taken -4%',}},
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
							
				
				
				
				
				
		--Job Ability Sets--
		sets.JA={}
		
		sets.JA['Provoke'] = {neck="Unmoving collar +1",head="Halitus helm",ring1="Supershear ring",ear1="Cryptic earring",ear2="Friomisi earring",ring2="Begrudging ring",waist="Warwolf belt",
	}
		
		sets.JA.Sengikori = {feet="Unkai Sune-Ate +2",}
	
		sets.JA.Meditate = {head="Wakido kabuto +1",
							hands="Sakonji kote +1",}
							
		sets.JA.Meikyo = {feet="Sakonji sune-ate",}
		
		sets.JA.Sekkanoki = {hands="Unkai Kote +1"}
		
		sets.JA.Hasso = {legs="Unkai Haidate +2",
							hands="Wakido kote +2"}
							
		
		
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
   sets.precast.JA['Blade Bash'] = {hands={ name="Sakonji Kote +1", augments={'Enhances "Blade Bash" effect',}},}

		end
		
		
function precast(spell)
	if spell.english == 'Meditate' then
		equip(sets.JA.Meditate)
	end

	if spell.english == 'Meikyo Shisui' then
		equip(sets.JA.Meikyo)
	end
	
	if spell.name == "Hasso" then
		equip(sets.JA.Hasso)
	end
	
	if spell.english == 'Tachi: Shoha' or spell.english == 'Tachi: Gekko' or spell.english == 'Tachi: Yukikaze' or spell.english == 'Tachi: Kasha' then
		equip(sets.Shoha[sets.Shoha.index[Shoha_ind]])
	end
	
	if spell.english == 'Tachi: Fudo' or spell.english == 'Tachi: Rana' then
        equip(sets.Fudo[sets.Fudo.index[Fudo_ind]])
    end
 
    if spell.english == 'Tachi: Kaiten' then
        equip(sets.Kaiten[sets.Kaiten.index[Kaiten_ind]])
    end
	
	 if spell.english == 'Tachi: Jinpu' then
        equip(sets.Jinpu)
    end
	
	if spell.english == 'Apex Arrow' then
		equip(sets.Apex[sets.Apex.index[Apex_ind]])
	end

    if spell.english == 'Namas Arrow' then
		equip(sets.Namas[sets.Namas.index[Namas_ind]])
	end

    if spell.name == "Ranged" then
        equip(sets.Utility.Snapshot)
    end
end		

function midcast(spell,act)
    if spell.name == "Ranged" then
        equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
    end
end

function aftercast(spell,act)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function self_command(command)
	if command == 'toggle MTP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
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
	elseif command == 'toggle Shoha set' then
		Shoha_ind = Shoha_ind +1
		if Shoha_ind > #sets.Shoha.index then Shoha_ind = 1 end
		send_command('@input /echo <----- Tachi: Shoha Set changed to '..sets.Shoha.index[Shoha_ind]..' ----->')
    elseif command == 'toggle Fudo set' then
		Fudo_ind = Fudo_ind +1
		if Fudo_ind > #sets.Fudo.index then Fudo_ind = 1 end
		send_command('@input /echo <----- Tachi: Fudo Set changed to '..sets.Fudo.index[Fudo_ind]..' ----->')
    elseif command == 'toggle Kaiten set' then
		Kaiten_ind = Kaiten_ind +1
		if Kaiten_ind > #sets.Kaiten.index then Kaiten_ind = 1 end
		send_command('@input /echo <----- Tachi: Kaiten Set changed to '..sets.Kaiten.index[Kaiten_ind]..' ----->')
    elseif command == 'toggle Apex set' then
		Apex_ind = Apex_ind +1
		if Apex_ind > #sets.Apex.index then Apex_ind = 1 end
		send_command('@input /echo <----- Apex Arrow Set changed to '..sets.Apex.index[Apex_ind]..' ----->')
    elseif command == 'toggle Namas set' then
		Namas_ind = Namas_ind +1
		if Namas_ind > #sets.Namas.index then Namas_ind = 1 end
		send_command('@input /echo <----- Namas Arrow Set changed to '..sets.Namas.index[Namas_ind]..' ----->')
	elseif command == 'equip TP set' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'equip Idle set' then
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end