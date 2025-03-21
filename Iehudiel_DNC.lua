-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
    include('Mote-Include.lua')
end
 
-- Setup variables that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
 
    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
    state.UseAltStep = M(false, 'Use Alt Step')
    state.SelectStepTarget = M(false, 'Select Step Target')
    state.IgnoreTargetting = M(true, 'Ignore Targetting')
    state.ClosedPosition = M(false, 'Closed Position')
    state.CombatWeapon = M{['description']='Weapon', 'Normal', 'AnusTwat', 'TauretTwat', 'TwatCento'}
 
    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
--  state.SkillchainPending = M(false, 'Skillchain Pending')
 
    state.CP = M(false, "Capacity Points Mode")
    state.Warp = M(false, "Warp Mode")
    state.MP = M(false, "Mana Mode")
    state.Neck = M(false, "Neck Mode")
    state.Dynamis = M(false, "Dynamis Mode")
    state.TH = M(false, "Treasure Hunter")
 
    lockstyleset = 96
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Gear Modes
function user_setup()
    state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc')
    state.HybridMode:options('Normal', 'MagEva', 'HIGH', 'MID', 'LOW')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Enmity')
    state.IdleMode:options('Normal', 'Turms', 'Regen')
 
-- Additional Key Binds.
    send_command('bind ^` input /ja "Chocobo Jig II" <me>') --Ctrl'~'
    send_command('bind !` input /ja "Spectral Jig" <me>') --Alt'~'
    send_command('bind f9 gs c cycle OffenseMode') --F9
    send_command('bind ^f9 gs c cycle WeaponSkillMode') --Ctrl'F9'
    send_command('bind f10 gs c cycle HybridMode') --F10
    send_command('bind f11 gs c cycle mainstep') --F11
    send_command('bind ^f12 gs c cycle IdleMode') --Ctrl'F12'   
    send_command('bind @c gs c toggle CP') --WindowKey'C'
    send_command('bind @r gs c toggle Warp') --WindowKey'R'
    send_command('bind @m gs c toggle MP') --Windowkey'M'
    send_command('bind @d gs c toggle Dynamis') --Windowkey'D'
    send_command('bind @t gs c toggle TH') --Windowkey'T'
    send_command('bind @w gs c cycle CombatWeapon') --Windowkey'W'  
    send_command('bind @e gs c cycle CastingMode') --WindowKey'E'   
    send_command('lua l gearinfo') --If you don't have GearInfo, Haste tiers won't work properly.
     
  --  send_command('bind ^c input /ja "Contradance" <me>') --Ctrl'C'    
  --  send_command('bind ^t input /ja "Trance" <me>') --Ctrl'T'
    send_command('bind ^g input /ja "Grand Pas" <me>') --Ctrl'G'
         
    send_command('bind !numpad1 input /ws "Exenterator" <t>')
    send_command('bind !numpad2 input /ws "Pyrrhic Kleos" <t>')   
    send_command('bind !numpad3 input /ws "Evisceration" <t>')
    send_command('bind !numpad4 input /ws "Rudra\'s Storm" <t>')
    send_command('bind !numpad9 input /ws "Aeolian Edge" <t>')
 
    select_default_macro_book()
    set_lockstyle()
 
    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
    update_combat_form()
    determine_haste_group()
end
 
-- Erases the Key Binds above when you switch to another job.
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind !-')
    send_command('unbind ^=')
    send_command('unbind f11')
    send_command('unbind @c')
    send_command('unbind @r')
    send_command('unbind @m')       
    send_command('unbind @e')
    send_command('unbind @d')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad2') 
    send_command('unbind ^numpad3')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad9') 
    send_command('gs enable all')   
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------    
     
    sets.Enmity = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Emet Harness +1",
        hands="Malignance Gloves",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Unmoving Collar +1",
        waist="Sulla Belt",
        left_ear="Cryptic Earring",
        right_ear="Friomisi Earring",
        left_ring="Petrov Ring",
        right_ring="Begrudging Ring",
        back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+2','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    } --81
     
    sets.Jump = {
        ammo="Aurgelmir Orb +1",
        head="Adhemar Bonnet +1",
        neck="Etoile Gorget +1",
        ear1="Brutal Earring",
        ear2="Sherida Earring",
        body="Horos Casaque +3",
        hands="Adhemar Wrist. +1",
        ring1="Hetairoi Ring",
        ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet="Horos Toe Shoes +3"   
    }
     
    sets.precast.JA['No Foot Rise'] = {
        body="Horos Casaque +3",
    }
    sets.precast.JA['Trance'] = {head={ name="Horos Tiara +2", augments={'Enhances "Trance" effect',}},}
    sets.precast.JA['Grand Pas'] = {}       
    sets.precast.JA['Contradance'] = {} 
    sets.precast.JA['Saber Dance'] = {}
    sets.precast.JA['Fan Dance'] = {}
    sets.precast.JA['Presto'] = {}
     
    sets.precast.Waltz = {
        ammo="Yamarang",
        head={ name="Horos Tiara +2", augments={'Enhances "Trance" effect',}},
        body="Maxixi Casaque +1",
        hands="Gleti's Gauntlets",
        legs="Dashing Subligar",
        feet="Maxixi Toe Shoes +1",
        neck={ name="Etoile Gorget +1", augments={'Path: A',}},
        waist="Aristo Belt",
        left_ear="Telos Earring",
        right_ear="Handler's Earring +1",
        left_ring="Defending Ring",
        right_ring="Petrov Ring",
        back={ name="Toetapper Mantle", augments={'"Store TP"+1','"Dual Wield"+3','"Rev. Flourish"+26',}},
        } --50%
 
    sets.precast.WaltzSelf = {
        ammo="Yamarang",
        head={ name="Horos Tiara +2", augments={'Enhances "Trance" effect',}},
        body="Maxixi Casaque +1",
        hands="Gleti's Gauntlets",
        legs="Dashing Subligar",
        feet="Maxixi Toe Shoes +1",
        neck={ name="Etoile Gorget +1", augments={'Path: A',}},
        waist="Aristo Belt",
        left_ear="Sherida Earring",
        right_ear="Handler's Earring +1",
        left_ring="Defending Ring",
        right_ring="Petrov Ring",
        back={ name="Toetapper Mantle", augments={'"Store TP"+1','"Dual Wield"+3','"Rev. Flourish"+26',}},
        } --70/20R
     
    sets.precast.Samba = {
        head="Maculele Tiara +2",
        body="Macu. Casaque +2",
        hands="Macu. Bangles +2",
        legs="Maculele Tights +2",
        feet="Macu. Toe Sh. +2",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
    }
    sets.precast.Jig = {
        ammo="Staunch Tathlum",
        head="Nyame Helm",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs={ name="Horos Tights +1", augments={'Enhances "Saber Dance" effect',}},
        feet="Maxixi Toe Shoes +1",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Aristo Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Toetapper Mantle", augments={'"Store TP"+1','"Dual Wield"+3','"Rev. Flourish"+26',}},
    }
 
    sets.precast.Step = {
        ammo="Yamarang",
        head="Maculele Tiara +3",
        body="Malignance Tabard",
        hands="Maxixi Bangles +2",
        legs="Meg. Chausses +2",
        feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
        neck="Clotharius Torque",
        waist="Kentarch Belt +1",
        left_ear="Mache Earring +1",
        right_ear="Telos Earring",
        left_ring="Chirich Ring",
        right_ring="Ilabrat Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
    }
    sets.precast.Step['Feather Step'] = set_combine(sets.precast.Step, {
        feet="Macu. Toe Sh. +2",
    })
     
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
    sets.precast.Flourish1['Violent Flourish'] = {
        ammo="Yamarang",
        head="Maculele Tiara +3",
        body={ name="Horos Casaque +3", augments={'Enhances "No Foot Rise" effect',}},
        hands="Macu. Bangles +2",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Etoile Gorget +1", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Digni. Earring",
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
    }
    sets.precast.Flourish1['Desperate Flourish'] = {}
 
    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Macu. Bangles +2",back="Toetapper Mantle"}
     
    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Macu. Casaque +2"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara +3",}
 
    sets.precast.FC = {
        ammo="Staunch Tathlum",
        head={ name="Herculean Helm", augments={'"Fast Cast"+2','Attack+12','Weapon skill damage +6%',}},
        body="Malignance Tabard",
        hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
        legs="Gleti's Breeches",
        feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
        neck="Elite Royal Collar",
        waist="Plat. Mog. Belt",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Lebeche Ring",
        right_ring="Gurebu's Ring",
        back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+2','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    } --65
     
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck="Magoraga Beads"
    })
     
    ------------------------------------------------------------------------------------------------
    -------------------------------------- Sub Job Specific ----------------------------------------
    ------------------------------------------------------------------------------------------------
 
    ----------------- /Sam ---------------
    sets.precast.JA['Meditate'] = {}
    sets.precast.JA['Third Eye'] = {}
    sets.precast.JA['Sekkanoki'] = {}
    sets.precast.JA['Warding Circle'] = {}  
    ----------------- /War ---------------  
    sets.precast.JA['Provoke'] = {}
    ----------------- /Run ---------------
    sets.precast.JA['Vallation'] = {}
    sets.midcast.Flash = {}
    ----------------- /Pld ---------------  
    sets.precast.JA['Holy Circle'] = {}
    sets.precast.JA['Sentinel'] = {}
    ----------------- /Blu ---------------      
    sets.midcast['Blue Magic'] = {}
    ----------------- /Drg ---------------  
    sets.precast.JA['Jump'] = sets.Jump
    sets.precast.JA['High Jump'] = sets.Jump
    ------------------------------------------------------------------------------------------------    
    ---------------------------------------- Enmity Mode -------------------------------------------
    ------------------------------------------------------------------------------------------------    
    sets.precast.JA['No Foot Rise'].Enmity = set_combine(sets.Enmity, sets.precast.JA['No Foot Rise'])
    sets.precast.JA['Trance'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Trance'])
    sets.precast.JA['Grand Pas'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Grand Pas'])
    sets.precast.JA['Contradance'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Contradance'])    
    sets.precast.JA['Saber Dance'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Saber Dance'])
    sets.precast.JA['Fan Dance'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Fan Dance'])
    sets.precast.JA['Presto'].Enmity = set_combine(sets.Enmity, sets.precast.JA['Presto'])
 
    sets.precast.Waltz.Enmity = {
        ammo="Sapience Orb", --2
        head={ name="Horos Tiara +2", augments={'Enhances "Trance" effect',}},
        neck="Unmoving Collar +1", --10
        ear1="Cryptic Earring", --4
        ear2="Friomisi Earring", --2
        body="Maxixi Casaque +3", --19/8POT
        hands={ name="Herculean Gloves", augments={'Accuracy+14','"Waltz" potency +11%','DEX+9','Attack+9',}}, --11POT
        ring2="Begrudging Ring", --5
        ring1="Eihwaz Ring", --5
        back={ name="Senuna's Mantle", augments={'Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, --10
        waist="Sulla Belt", --3
        legs="Dashing Subligar", --10POT
        feet="Maxixi Toe shoes +1", --10POT
        } --50POT 41Enm
 
    sets.precast.WaltzSelf.Enmity = set_combine(sets.precast.Waltz.Enmity, {head="Mummu Bonnet +2",ring2="Asklepian Ring"}) --0/9R
 
    sets.precast.Samba.Enmity = set_combine(sets.Enmity, sets.precast.Samba)
    sets.precast.Jig.Enmity = set_combine(sets.Enmity, sets.precast.Jig)
 
    sets.precast.Step.Enmity = set_combine(sets.Enmity, sets.precast.Step)
    sets.precast.Step['Feather Step'].Enmity = set_combine(sets.Enmity, sets.precast.Step['Feather Step'])
     
    sets.precast.Flourish1.Enmity = set_combine(sets.Enmity, sets.precast.Flourish1)
    sets.precast.Flourish1['Animated Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish1['Animated Flourish'])
    sets.precast.Flourish1['Violent Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish1['Violent Flourish'])
    sets.precast.Flourish1['Desperate Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish1['Desperate Flourish'])
 
    sets.precast.Flourish2.Enmity = set_combine(sets.Enmity, sets.precast.Flourish2)
    sets.precast.Flourish2['Reverse Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish2['Reverse Flourish'])
     
    sets.precast.Flourish3.Enmity = set_combine(sets.Enmity, sets.precast.Flourish3)
    sets.precast.Flourish3['Striking Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish3['Striking Flourish'])
    sets.precast.Flourish3['Climactic Flourish'].Enmity = set_combine(sets.Enmity, sets.precast.Flourish3['Climactic Flourish'])
     
    ----------------- /Sam ---------------
    sets.precast.JA['Meditate'].Enmity = sets.Enmity
    sets.precast.JA['Third Eye'].Enmity = sets.Enmity
    sets.precast.JA['Sekkanoki'].Enmity = sets.Enmity
    sets.precast.JA['Warding Circle'].Enmity = sets.Enmity
    ----------------- /War ---------------  
    sets.precast.JA['Provoke'].Enmity = sets.Enmity
    ----------------- /Run ---------------
    sets.precast.JA['Vallation'].Enmity = sets.Enmity
    sets.midcast.Flash.Enmity = sets.Enmity
    ----------------- /Pld ---------------  
    sets.precast.JA['Holy Circle'].Enmity = sets.Enmity
    sets.precast.JA['Sentinel'].Enmity = sets.Enmity
    ----------------- /Blu ---------------      
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------
 
    sets.precast.WS = {
        ammo="Aurgelmir Orb +1",
        head="Adhemar Bonnet +1",
        neck="Asperity Necklace",
        ear1="Brutal Earring",
        ear2="Sherida Earring",
        body="",
        hands="Maxixi Bangles +3",
        ring2="Epona's Ring",
        ring1="Ilabrat Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
        waist="Fotia Belt",
        legs="Samnuha Tights",
        feet="Horos Toe Shoes +3"
        }
 
    sets.precast.WS['Exenterator'] = {
        ammo="Aurgelmir Orb +1",
        head="Adhemar Bonnet +1",
        neck="Fotia Gorget",
        ear1="Brutal Earring",
        ear2="Sherida Earring",
        body="",
        hands="Maxixi Bangles +3",
        ring2="Epona's Ring",
        ring1="Ilabrat Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
        waist="Fotia Belt",
        legs="Samnuha Tights",
        feet="Horos Toe Shoes +3",
    }
 
    sets.precast.WS['Pyrrhic Kleos'] = {
        ammo="Crepuscular Pebble",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+2','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
        }
 
    sets.precast.WS['Evisceration'] = {
        ammo="Oshasha's Treatise",
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Sherida Earring",
        right_ear="Odr Earring",
        left_ring="Ilabrat Ring",
        right_ring="Regal Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Phys. dmg. taken-10%',}},
        }
 
    sets.precast.WS['Shark Bite'] = {
        ammo="Charis Feather",
        head="Horos Tiara +2",
        body="Horos Casaque +3",
        hands="Maxixi Bangles +3",
        legs="Horos Tights +3",
        feet="Horos Toe Shoes +3",
        neck="Etoile Gorget +2",
        waist="Grunfeld Rope",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        ring2="Epaminondas's Ring",
        ring1="Ilabrat Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
        }
 
    sets.precast.WS['Rudra\'s Storm'] = {
        ammo="Crepuscular Pebble",
        head="Maculele Tiara +3",
        body="Gleti's Cuirass",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Gleti's Breeches",
        
        neck="Clotharius Torque",
        waist="Sarissapho. Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
        left_ring="Defending Ring",
        right_ring="Karieyh Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Weapon skill damage +10%','Phys. dmg. taken-6%',}},
        }
         
    sets.precast.WS['Aeolian Edge'] = {
        ammo="Pemphredo Tathlum",
        head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+25','Crit. hit damage +1%','INT+3',}},
        body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
        hands="Leyline Gloves",
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','"Fast Cast"+4',}},
        feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%',}},
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Acumen Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }   
         
    sets.precast.WS.Critical = {body="Meg. Cuirie +2"}
     
    --------------------------------------- Accuracy Mode ------------------------------------------
 
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Yamarang",neck="Etoile Gorget +2"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Yamarang",neck="Etoile Gorget +2"}) 
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS['Pyrrhic Kleos'], {ammo="Yamarang",neck="Etoile Gorget +2"}) 
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Yamarang",neck="Etoile Gorget +2"})
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yamarang",neck="Etoile Gorget +2",waist="Fotia Belt"})    
    sets.precast.WS['Rudra\'s Storm'].Acc = set_combine(sets.precast.WS['Rudra\'s Storm'], {ammo="Yamarang",neck="Etoile Gorget +2",waist="Fotia Belt"})
 
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
 
    sets.midcast.FastRecast = sets.precast.FC
    sets.midcast.SpellInterrupt = {}
    sets.midcast.Utsusemi = {}
 
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------
 
    sets.idle = {
        ammo="Staunch Tathlum",
        head="Maculele Tiara +3",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Gleti's Breeches",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Telos Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring="Karieyh Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Weapon skill damage +10%','Phys. dmg. taken-6%',}},
        } --33DT 17PDT =50% Physical, 50% Magical with Shell V
 
    sets.idle.Town = {
        ammo="Yamarang",
        head="Maculele Tiara +3",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Gleti's Breeches",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Attack+10','Weapon skill damage +10%','Phys. dmg. taken-6%',}},
        }
         
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
-- This is a Set that would only be used when you are NOT Dual Wielding.  Most likely Airy Buckler Builds with Fencer as War Sub.
-- There are no haste parameters set for this build, because you wouldn't be juggling DW gear, you would always use the same gear, other than Damage Taken and Accuracy sets which ARE included below.
    sets.engaged = {
        }
 
    ------------------------------------------------------------------------------------------------
    -------------------------------------- Dual Wield Sets -----------------------------------------
    ------------------------------------------------------------------------------------------------
    -- * DNC Native DW Trait: 30% DW
    -- * DNC Job Points DW Gift: 5% DW
 
    -- No Magic Haste (38% DW to cap)
    sets.engaged.DW = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck="Asperity Necklace",
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } -- 37%
 
    -- 15% Magic Haste (32% DW to cap)
    sets.engaged.DW.LowHaste = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck="Asperity Necklace",
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } -- 32%
 
    -- 30% Magic Haste (20% DW to cap)
    sets.engaged.DW.MidHaste = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        --legs={ name="Samnuha Tights", augments={'STR+7','"Dbl.Atk."+2','"Triple Atk."+1',}},
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck="Asperity Necklace",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } -- 18%
 
    -- 40% Magic Haste (8% DW to cap)
    sets.engaged.DW.HighHaste = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        --legs={ name="Samnuha Tights", augments={'STR+7','"Dbl.Atk."+2','"Triple Atk."+1',}},
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck="Asperity Necklace",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } -- 7% Gear
 
    -- 45% Magic Haste (0% DW to cap)
    sets.engaged.DW.MaxHaste = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body="Malignance Tabard",
        hands="Malignance Gloves",
        --legs={ name="Samnuha Tights", augments={'STR+7','"Dbl.Atk."+2','"Triple Atk."+1',}},
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck="Asperity Necklace",
        waist="Kentarch Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } -- 0% --1220Acc
     
    ------------------------------------------------------------------------------------------------
    --------------------------------------- Accuracy Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
-- Define three tiers of Accuracy.  These sets are cycled with the F9 Button to increase accuracy in stages as desired.
    --Max Haste Base 1220Acc
    sets.engaged.Acc1 = {head="Maculele Tiara +3",} --1267 Acc
    sets.engaged.Acc2 = {head="Maculele Tiara +3",ammo="Yamarang",hands="Malignance Gloves"} --1294Acc
    sets.engaged.Acc3 = {head="Maculele Tiara +3",ammo="Yamarang",hands="Malignance Gloves",body="Horos Casaque +3",legs="Malignance Tights",feet="Horos Toe Shoes +3"} --1321Acc legs="Malignance Tights"
-- Base Shield
    sets.engaged.LowAcc = set_combine(sets.engaged, sets.engaged.Acc1)
    sets.engaged.MidAcc = set_combine(sets.engaged, sets.engaged.Acc2)
    sets.engaged.HighAcc = set_combine(sets.engaged, sets.engaged.Acc3)
-- Base DW 1138Acc
    sets.engaged.DW.LowAcc = set_combine(sets.engaged.DW, sets.engaged.Acc1) --1185Acc
    sets.engaged.DW.MidAcc = set_combine(sets.engaged.DW, sets.engaged.Acc2) --1222Acc
    sets.engaged.DW.HighAcc = set_combine(sets.engaged.DW, sets.engaged.Acc3) --1292Acc
-- LowHaste DW 1138Acc
    sets.engaged.DW.LowAcc.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Acc1) --1185Acc
    sets.engaged.DW.MidAcc.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Acc2) --1222Acc
    sets.engaged.DW.HighAcc.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Acc3) --1292Acc
-- MidHaste DW 1133Acc
    sets.engaged.DW.LowAcc.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Acc1) --1180Acc
    sets.engaged.DW.MidAcc.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Acc2) --1217Acc
    sets.engaged.DW.HighAcc.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Acc3) --1288Acc
-- HighHaste DW 1133Acc
    sets.engaged.DW.LowAcc.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Acc1) --1180Acc
    sets.engaged.DW.MidAcc.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Acc2) --1217Acc
    sets.engaged.DW.HighAcc.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Acc3) --1288Acc
-- HighHaste DW 1178Acc
    sets.engaged.DW.LowAcc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.LowAcc) --1225Acc
    sets.engaged.DW.MidAcc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.MidAcc) --1269Acc
    sets.engaged.DW.HighAcc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.HighAcc) --1288Acc
 
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
-- Define three tiers of Defense Taken.  These sets are cycled with the F10 Button.
    sets.engaged.DT1 = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Gleti's Mask",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } --23% --Horos Body 6%
    sets.engaged.DT2 = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Gleti's Mask",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } --39%
    sets.engaged.DT3 = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Gleti's Mask",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
        } --47% --M.Body+3 = 50 Or Aug Odnowa
    sets.engaged.DT4 = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Gleti's Mask",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Macu. Toe Sh. +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Cornelia's Belt",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Mag. Evasion+15',}},
    } --51
--body="Malignance Tabard",legs="Malignance Tights"
-- Shield Base
    sets.engaged.LOW = set_combine(sets.engaged, sets.engaged.DT1)
    sets.engaged.LowAcc.LOW = set_combine(sets.engaged.LowAcc, sets.engaged.DT1)
    sets.engaged.MidAcc.LOW = set_combine(sets.engaged.MidAcc, sets.engaged.DT1)
    sets.engaged.HighAcc.LOW = set_combine(sets.engaged.HighAcc, sets.engaged.DT1)
     
    sets.engaged.MID = set_combine(sets.engaged, sets.engaged.DT2)
    sets.engaged.LowAcc.MID = set_combine(sets.engaged.LowAcc, sets.engaged.DT2)
    sets.engaged.MidAcc.MID = set_combine(sets.engaged.MidAcc, sets.engaged.DT2)
    sets.engaged.HighAcc.MID = set_combine(sets.engaged.HighAcc, sets.engaged.DT2)
     
    sets.engaged.HIGH = set_combine(sets.engaged, sets.engaged.DT3)
    sets.engaged.LowAcc.HIGH = set_combine(sets.engaged.LowAcc, sets.engaged.DT3)
    sets.engaged.MidAcc.HIGH = set_combine(sets.engaged.MidAcc, sets.engaged.DT3)
    sets.engaged.HighAcc.HIGH = set_combine(sets.engaged.HighAcc, sets.engaged.DT3)
     
    sets.engaged.MagEva = set_combine(sets.engaged, sets.engaged.DT4)
    sets.engaged.LowAcc.MagEva = set_combine(sets.engaged.LowAcc, sets.engaged.DT4)
    sets.engaged.MidAcc.MagEva = set_combine(sets.engaged.MidAcc, sets.engaged.DT4)
    sets.engaged.HighAcc.MagEva = set_combine(sets.engaged.HighAcc, sets.engaged.DT4)   
-- No Haste DW
    sets.engaged.DW.LOW = set_combine(sets.engaged.DW, sets.engaged.DT1)
    sets.engaged.DW.LowAcc.LOW = set_combine(sets.engaged.DW.LowAcc, sets.engaged.DT1)
    sets.engaged.DW.MidAcc.LOW = set_combine(sets.engaged.DW.MidAcc, sets.engaged.DT1)
    sets.engaged.DW.HighAcc.LOW = set_combine(sets.engaged.DW.HighAcc, sets.engaged.DT1)
     
    sets.engaged.DW.MID = set_combine(sets.engaged.DW, sets.engaged.DT2)
    sets.engaged.DW.LowAcc.MID = set_combine(sets.engaged.DW.LowAcc, sets.engaged.DT2)
    sets.engaged.DW.MidAcc.MID = set_combine(sets.engaged.DW.MidAcc, sets.engaged.DT2)
    sets.engaged.DW.HighAcc.MID = set_combine(sets.engaged.DW.HighAcc, sets.engaged.DT2)
 
    sets.engaged.DW.HIGH = set_combine(sets.engaged.DW, sets.engaged.DT3)
    sets.engaged.DW.LowAcc.HIGH = set_combine(sets.engaged.DW.LowAcc, sets.engaged.DT3)
    sets.engaged.DW.MidAcc.HIGH = set_combine(sets.engaged.DW.MidAcc, sets.engaged.DT3)
    sets.engaged.DW.HighAcc.HIGH = set_combine(sets.engaged.DW.HighAcc, sets.engaged.DT3)
     
    sets.engaged.DW.MagEva = set_combine(sets.engaged.DW, sets.engaged.DT4)
    sets.engaged.DW.LowAcc.MagEva = set_combine(sets.engaged.DW.LowAcc, sets.engaged.DT4)
    sets.engaged.DW.MidAcc.MagEva = set_combine(sets.engaged.DW.MidAcc, sets.engaged.DT4)
    sets.engaged.DW.HighAcc.MagEva = set_combine(sets.engaged.DW.HighAcc, sets.engaged.DT4)
-- Low Haste DW
    sets.engaged.DW.LOW.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.DT1)
    sets.engaged.DW.LowAcc.LOW.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, sets.engaged.DT1)
    sets.engaged.DW.MidAcc.LOW.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.DT1)
    sets.engaged.DW.HighAcc.LOW.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.DT1)
     
    sets.engaged.DW.MID.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.DT2)
    sets.engaged.DW.LowAcc.MID.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, sets.engaged.DT2)
    sets.engaged.DW.MidAcc.MID.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.DT2)
    sets.engaged.DW.HighAcc.MID.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.DT2)
     
    sets.engaged.DW.HIGH.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.DT3)
    sets.engaged.DW.LowAcc.HIGH.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, sets.engaged.DT3)
    sets.engaged.DW.MidAcc.HIGH.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.DT3)
    sets.engaged.DW.HighAcc.HIGH.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.DT3)
     
    sets.engaged.DW.MagEva.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.DT4)
    sets.engaged.DW.LowAcc.MagEva.LowHaste = set_combine(sets.engaged.DW.LowAcc.LowHaste, sets.engaged.DT4)
    sets.engaged.DW.MidAcc.MagEva.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.DT4)
    sets.engaged.DW.HighAcc.MagEva.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.DT4)
-- Mid Haste
    sets.engaged.DW.LOW.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.DT1)
    sets.engaged.DW.LowAcc.LOW.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, sets.engaged.DT1)
    sets.engaged.DW.MidAcc.LOW.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.DT1)
    sets.engaged.DW.HighAcc.LOW.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.DT1)
     
    sets.engaged.DW.MID.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.DT2)
    sets.engaged.DW.LowAcc.MID.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, sets.engaged.DT2)
    sets.engaged.DW.MidAcc.MID.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.DT2)
    sets.engaged.DW.HighAcc.MID.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.DT2)
 
    sets.engaged.DW.HIGH.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.DT3)
    sets.engaged.DW.LowAcc.HIGH.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, sets.engaged.DT3)
    sets.engaged.DW.MidAcc.HIGH.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.DT3)
    sets.engaged.DW.HighAcc.HIGH.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.DT3)
 
    sets.engaged.DW.MagEva.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.DT4)
    sets.engaged.DW.LowAcc.MagEva.MidHaste = set_combine(sets.engaged.DW.LowAcc.MidHaste, sets.engaged.DT4)
    sets.engaged.DW.MidAcc.MagEva.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.DT4)
    sets.engaged.DW.HighAcc.MagEva.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.DT4)       
-- High Haste
    sets.engaged.DW.LOW.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.DT1)
    sets.engaged.DW.LowAcc.LOW.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, sets.engaged.DT1)
    sets.engaged.DW.MidAcc.LOW.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.DT1)
    sets.engaged.DW.HighAcc.LOW.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.DT1)
     
    sets.engaged.DW.MID.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.DT2)
    sets.engaged.DW.LowAcc.MID.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, sets.engaged.DT2)
    sets.engaged.DW.MidAcc.MID.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.DT2)
    sets.engaged.DW.HighAcc.MID.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.DT2)
     
    sets.engaged.DW.HIGH.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.DT3)
    sets.engaged.DW.LowAcc.HIGH.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, sets.engaged.DT3)
    sets.engaged.DW.MidAcc.HIGH.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.DT3)
    sets.engaged.DW.HighAcc.HIGH.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.DT3)
     
    sets.engaged.DW.MagEva.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.DT4)
    sets.engaged.DW.LowAcc.MagEva.HighHaste = set_combine(sets.engaged.DW.LowAcc.HighHaste, sets.engaged.DT4)
    sets.engaged.DW.MidAcc.MagEva.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.DT4)
    sets.engaged.DW.HighAcc.MagEva.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.DT4)
-- Max Haste
    sets.engaged.DW.LOW.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.DT1)
    sets.engaged.DW.LowAcc.LOW.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, sets.engaged.DT1)
    sets.engaged.DW.MidAcc.LOW.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.DT1)
    sets.engaged.DW.HighAcc.LOW.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.DT1)
     
    sets.engaged.DW.MID.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.DT2)
    sets.engaged.DW.LowAcc.MID.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, sets.engaged.DT2)
    sets.engaged.DW.MidAcc.MID.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.DT2)
    sets.engaged.DW.HighAcc.MID.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.DT2)
     
    sets.engaged.DW.HIGH.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.DT3)
    sets.engaged.DW.LowAcc.HIGH.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, sets.engaged.DT3)
    sets.engaged.DW.MidAcc.HIGH.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.DT3)
    sets.engaged.DW.HighAcc.HIGH.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.DT3)
     
    sets.engaged.DW.MagEva.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.DT4)
    sets.engaged.DW.LowAcc.MagEva.MaxHaste = set_combine(sets.engaged.DW.LowAcc.MaxHaste, sets.engaged.DT4)
    sets.engaged.DW.MidAcc.MagEva.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.DT4)
    sets.engaged.DW.HighAcc.MagEva.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.DT4)
 
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Weapon Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
 
    sets.AnusTwat = {main="Aeneas",sub="Twashtar"}
    sets.TauretTwat = {main="Tauret",sub="Twashtar"}
    sets.TwatCento = {main="Twashtar",sub="Centovente"}
 
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
     
    sets.buff.Doom = {
        left_ring="Blenmot's Ring +1",
        right_ring="Blenmot's Ring +1",
    }
--  sets.buff['Saber Dance'] = {legs="Horos Tights +3"}
--  sets.buff['Fan Dance'] = {hands="Horos Bangles +3"}
    sets.buff['Closed Position'] = {feet="Horos T. Shoes +3"}
    sets.buff['Climactic Flourish'] = {
        head="Maculele Tiara +3"
    }
    sets.Warp = {ring1="Dim. Ring (Holla)",ring2="Warp Ring",ear1="Reraise Earring",}
    sets.CP = {back="Mecisto. Mantle"}
    sets.MP = {Ear2="Ethereal Earring",Waist="Flume Belt +1",}
    sets.Neck = {neck="Uggalepih Necklace",}
    sets.Dynamis = {Neck="Etoile Gorget +2",feet="Malignance Boots",}
    sets.TH = {main="Taming Sari",head="White Rarab Cap +1",feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+23','MND+5','"Treasure Hunter"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},sub="Taming Sari",}
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
     
-- Used to overwrite Moonshade Earring if TP is more than 2750.
    if spell.type == 'WeaponSkill' then
        if player.tp > 2750 then
        equip({left_ear = "Telos Earring"})
        end
-- Used to optimize Rudra's Storm when Climactic Flourish is active.
        if spell.english == "Rudra's Storm" and buffactive['Climactic Flourish'] then
            equip({head="Maculele Tiara +1",right_ear="Ishvara Earring",body="Meghanada Cuirie +2",ammo="Charis Feather"})
        end 
-- Test Section to combine functions
        if state.Buff['Sneak Attack'] == true then
            equip(sets.precast.WS.Critical)
        end
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
    end
 
end
 
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Sneak Attack'] == true then
           equip(sets.precast.WS.Critical)
        end
         
        if state.Buff['Climactic Flourish'] then
           equip(sets.buff['Climactic Flourish'])
        end
    end
     
    if spell.english == "Curing Waltz" or spell.english == "Curing Waltz II" or spell.english == "Curing Waltz III" or spell.english == "Curing Waltz IV" or spell.english == "Curing Waltz V" and spell.target.type == 'SELF' then
        if state.CastingMode.value == 'Enmity' then
            equip(sets.precast.WaltzSelf.Enmity)
        else
            equip(sets.precast.WaltzSelf)
        end
    end
     
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff,gain)
    if buff == 'Saber Dance' or buff == 'Climactic Flourish' or buff == 'Fan Dance' then
        handle_equipping_gear(player.status)
    end
 
    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /echo Doomed.')
             disable()
        else
            enable()
            handle_equipping_gear(player.status)
        end
    end
     
end
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
function job_handle_equipping_gear(playerStatus, eventArgs)
    update_combat_form()
    determine_haste_group()
end
 
function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end
 
function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end
 
function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode
 
    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
 
    return wsmode
end
 
function customize_idle_set(idleSet)
 
    if state.CombatWeapon.value == 'AnusTwat' then
        idleSet = set_combine(idleSet, sets.AnusTwat)
    end
     
    if state.CombatWeapon.value == 'TauretTwat' then
        idleSet = set_combine(idleSet, sets.TauretTwat)
    end
     
    if state.CombatWeapon.value == 'TwatCento' then
        idleSet = set_combine(idleSet, sets.TwatCento)
    end
 
    if state.CP.current == 'on' then
        equip(sets.CP)
        disable('back')
    else
        enable('back')
    end 
     
    if state.Warp.current == 'on' then
        equip(sets.Warp)
        disable('ring1')
        disable('ring2')
        disable('ear1')     
    else
        enable('ring1')
        enable('ring2')
        enable('ear1')          
    end
     
    if state.MP.current == 'on' then
        equip(sets.MP)
        disable('Waist')
        disable('Ear2')
    else
        enable('Waist')
        enable('Ear2')
    end
     
    if state.TH.current == 'on' then
        equip(sets.TH)
        disable('Feet')
        disable('Head')
    else
        enable('Feet')
        enable('Head')
    end
     
    if state.Dynamis.current == 'on' then
        equip(sets.Dynamis) 
        disable('Neck')
        disable('Feet')
    else
        enable('Neck')
        disable('Feet')     
    end
 
    return idleSet
end
 
function customize_melee_set(meleeSet)
    if state.Buff['Climactic Flourish'] then
        meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
    end
 
    if state.CombatWeapon.value == 'AnusTwat' then
        meleeSet = set_combine(meleeSet, sets.AnusTwat)
    end
     
    if state.CombatWeapon.value == 'TauretTwat' then
        meleeSet = set_combine(meleeSet, sets.TauretTwat)
    end
     
    if state.CombatWeapon.value == 'TwatCento' then
        meleeSet = set_combine(meleeSet, sets.TwatCento)
    end
 
    if state.CP.current == 'on' then
        equip(sets.CP)
        disable('back')
    else
        enable('back')
    end 
     
    if state.Warp.current == 'on' then
        equip(sets.Warp)
        disable('ring1')
        disable('ring2')
    else
        enable('ring1')
        enable('ring2')
    end
     
    if state.MP.current == 'on' then
        equip(sets.MP)
        disable('Waist')
        disable('Ear2')
    else
        enable('Waist')
        enable('Ear2')
    end
 
    if state.TH.current == 'on' then
        equip(sets.TH)
        disable('Feet')
        disable('Head')
    else
        enable('Feet')
        enable('Head')
    end
     
    if state.Dynamis.current == 'on' then
        equip(sets.Dynamis) 
        disable('Neck')
    else
        enable('Neck')
    end
 
    return meleeSet
end
 
-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        if state.IgnoreTargetting.value == true then
            state.IgnoreTargetting:reset()
            eventArgs.handled = true
        end
 
        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
    end
end
 
-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = '[ Melee'
 
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
 
    msg = msg .. ': '
 
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ' ][ WS: ' .. state.WeaponskillMode.value .. ' ]'
 
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. '[ Defense: ' .. state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ' ]'
    end
 
    if state.ClosedPosition.value then
        msg = msg .. '[ Closed Position: ON ]'
    end
 
    if state.Kiting.value then
        msg = msg .. '[ Kiting Mode: ON ]'
    end
 
    msg = msg .. '[ '..state.MainStep.current
 
    if state.UseAltStep.value == true then
        msg = msg .. '/'..state.AltStep.current
    end
 
    msg = msg .. ' ]'
 
    add_to_chat(123, msg)
 
    eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 1 then
            classes.CustomMeleeGroups:append('MaxHaste')        
        elseif DW_needed > 1 and DW_needed <= 9 then
            classes.CustomMeleeGroups:append('HighHaste')           
        elseif DW_needed > 9 and DW_needed <= 21 then
            classes.CustomMeleeGroups:append('MidHaste')                
        elseif DW_needed > 21 and DW_needed <= 38 then
            classes.CustomMeleeGroups:append('LowHaste')                
        elseif DW_needed > 38 then
            classes.CustomMeleeGroups:append('')
        end
    end
end
 
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'step' then
        if cmdParams[2] == 't' then
            state.IgnoreTargetting:set()
        end
 
        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current..'Step'].current
            state.CurrentStep:cycle()
        else
            doStep = state.MainStep.current
        end
 
        send_command('@input /ja "'..doStep..'" <t>')
    end
    gearinfo(cmdParams, eventArgs)
end
 
function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
            DW_needed = tonumber(cmdParams[2])
            DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end
     
-- If you attempt to use a step, this will automatically use Presto.
function job_pretarget(spell, action, spellMap, eventArgs)  
    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
         
        if player.main_job_level >= 77 and prestoCooldown < 1 and not buffactive['Presto'] then
            cast_delay(1.1)
            send_command('input /ja "Presto" <me>')
        end 
    end
         
-- If you attempt to use Climactic Flourish with less than 4 finishing moves, this will automatically use 'Current Step' and resend Climactic Flourish. 
        local under4FMs = not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and not buffactive['Finishing Move (6+)']
        local doStep = ''
        local doStep = state.MainStep.current
    if spell.english == "Climactic Flourish" and under4FMs then
            cast_delay(1.9)
            send_command('@input /ja "'..doStep..'" <t>')
    end 
end
 
-- Automatically loads a Macro Set by: (Pallet,Book)
function select_default_macro_book()
    if player.sub_job == 'SAM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 3)        
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 3)   
    else
        set_macro_page(1, 3)
    end
end
 
function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
