-- Original: Motenten / Modified: Arislan
-- Haste/DW Detection Requires Gearinfo Addon

-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F9 ]              Cycle Offense Mode
--              [ CTRL+F9 ]         Cycle Hybrid Modes
--              [ WIN+F9 ]          Cycle Weapon Skill Modes
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ ALT+` ]           Toggle Magic Burst Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+` ]          Composure
--              [ CTRL+- ]          Light Arts/Addendum: White
--              [ CTRL+= ]          Dark Arts/Addendum: Black
--              [ CTRL+; ]          Celerity/Alacrity
--              [ ALT+[ ]           Accesion/Manifestation
--              [ ALT+; ]           Penury/Parsimony
--
--  Spells:     [ CTRL+` ]          Stun
--              [ ALT+Q ]           Temper
--              [ ALT+W ]           Flurry II
--              [ ALT+E ]           Haste II
--              [ ALT+R ]           Refresh II
--              [ ALT+Y ]           Phalanx
--              [ ALT+O ]           Regen II
--              [ ALT+P ]           Shock Spikes
--              [ WIN+, ]           Utsusemi: Ichi
--              [ WIN+. ]           Utsusemi: Ni
--
--  Weapons:    [ CTRL+W ]          Toggles Weapon Lock
--
--  WS:         [ CTRL+Numpad7 ]    Savage Blade
--              [ CTRL+Numpad9 ]    Chant Du Cygne
--              [ CTRL+Numpad4 ]    Requiescat
--              [ CTRL+Numpad1 ]    Sanguine Blade
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--              Addendum Commands:
--              Shorthand versions for each strategem type that uses the version appropriate for
--              the current Arts.
--                                          Light Arts                  Dark Arts
--                                          ----------                  ---------
--              gs c scholar light          Light Arts/Addendum
--              gs c scholar dark                                       Dark Arts/Addendum
--              gs c scholar cost           Penury                      Parsimony
--              gs c scholar speed          Celerity                    Alacrity
--              gs c scholar aoe            Accession                   Manifestation
--              gs c scholar addendum       Addendum: White             Addendum: Black


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    -- state.CP = M(false, "Capacity Points Mode")
    state.Buff.Composure = buffactive.Composure or false
    state.Buff.Saboteur = buffactive.Saboteur or false
    state.Buff.Stymie = buffactive.Stymie or false

    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    enfeebling_magic_acc = S{'Bind', 'Break', 'Dispel', 'Distract', 'Distract II', 'Frazzle',
        'Frazzle II',  'Gravity', 'Gravity II', 'Silence'}
    enfeebling_magic_skill = S{'Distract III', 'Frazzle III', 'Poison II'}
    enfeebling_magic_effect = S{'Dia', 'Dia II', 'Dia III', 'Diaga', 'Blind', 'Blind II'}
    enfeebling_magic_sleep = S{'Sleep', 'Sleep II', 'Sleepga'}

    skill_spells = S{
        'Temper', 'Temper II', 'Enfire', 'Enfire II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II',
        'Enstone', 'Enstone II', 'Enthunder', 'Enthunder II', 'Enwater', 'Enwater II'}

    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

    lockstyleset = 74
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'MidAcc', 'HighAcc')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Seidr', 'Resistant')
    state.IdleMode:options('Normal', 'DT')

    state.EnSpell = M{['description']='EnSpell', 'Enfire', 'Enblizzard', 'Enaero', 'Enstone', 'Enthunder', 'Enwater'}
    state.BarElement = M{['description']='BarElement', 'Barfire', 'Barblizzard', 'Baraero', 'Barstone', 'Barthunder', 'Barwater'}
    state.BarStatus = M{['description']='BarStatus', 'Baramnesia', 'Barvirus', 'Barparalyze', 'Barsilence', 'Barpetrify', 'Barpoison', 'Barblind', 'Barsleep'}
    state.GainSpell = M{['description']='GainSpell', 'Gain-STR', 'Gain-INT', 'Gain-AGI', 'Gain-VIT', 'Gain-DEX', 'Gain-MND', 'Gain-CHR'}

    state.WeaponSet = M{['description']='Weapon Set', 'CroceaDark', 'CroceaLight', 'Almace', 'Naegling', 'Tauret', 'Idle'}
    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')
    state.SleepMode = M{['description']='Sleep Mode', 'Normal', 'MaxDuration'}
    state.EnspellMode = M(false, 'Enspell Melee Mode')
    state.NM = M(false, 'NM?')
    -- state.CP = M(false, "Capacity Points Mode")

    -- Additional local binds
    --include('Global-Binds.lua') -- OK to remove this line
    --include('Global-GEO-Binds.lua') -- OK to remove this line

    send_command('bind ^` input /ja "Composure" <me>')
    send_command('bind @t gs c cycle treasuremode')
    send_command('bind !` gs c toggle MagicBurst')

    if player.sub_job == 'SCH' then
        send_command('bind ^- gs c scholar light')
        send_command('bind ^= gs c scholar dark')
        send_command('bind !- gs c scholar addendum')
        send_command('bind != gs c scholar addendum')
        send_command('bind ^; gs c scholar speed')
        send_command('bind ![ gs c scholar aoe')
        send_command('bind !; gs c scholar cost')
    end

    send_command('bind !q input /ma "Temper II" <me>')
    send_command('bind !w input /ma "Flurry II" <stpc>')
    send_command('bind !e input /ma "Haste II" <stpc>')
    send_command('bind !r input /ma "Refresh III" <stpc>')
    send_command('bind !y input /ma "Phalanx II" <stpc>')
    send_command('bind !o input /ma "Regen II" <stpc>')
    send_command('bind !p input /ma "Shock Spikes" <me>')

    send_command('bind ~numpad7 input /ma "Paralyze II" <t>')
    send_command('bind ~numpad8 input /ma "Silence" <t>')
    send_command('bind ~numpad9 input /ma "Blind II" <t>')
    send_command('bind ~numpad4 input /ma "Poison II" <t>')
    send_command('bind ~numpad5 input /ma "Slow II" <t>')
    send_command('bind ~numpad6 input /ma "Addle II" <t>')
    send_command('bind ~numpad1 input /ma "Distract III" <t>')
    send_command('bind ~numpad2 input /ma "Frazzle III" <t>')
    send_command('bind ~numpad3 input /ma "Inundation" <t>')
    send_command('bind ~numpad0 input /ma "Dia III" <t>')

    send_command('bind !insert gs c cycleback EnSpell')
    send_command('bind !delete gs c cycle EnSpell')
    send_command('bind ^insert gs c cycleback GainSpell')
    send_command('bind ^delete gs c cycle GainSpell')
    send_command('bind ^home gs c cycleback BarElement')
    send_command('bind ^end gs c cycle BarElement')
    send_command('bind ^pageup gs c cycleback BarStatus')
    send_command('bind ^pagedown gs c cycle BarStatus')

    send_command('bind @s gs c cycle SleepMode')
    send_command('bind @e gs c cycle EnspellMode')
    send_command('bind @d gs c toggle NM')
    send_command('bind @w gs c toggle WeaponLock')
    -- send_command('bind @c gs c toggle CP')
    send_command('bind @e gs c cycleback WeaponSet')
    send_command('bind @r gs c cycle WeaponSet')

    send_command('bind ^numpad7 input /ws "Savage Blade" <t>')
    send_command('bind ^numpad9 input /ws "Chant du Cygne" <t>')
    send_command('bind ^numpad4 input /ws "Requiescat" <t>')
    send_command('bind ^numpad1 input /ws "Sanguine Blade" <t>')
    send_command('bind ^numpad2 input /ws "Seraph Blade" <t>')

    select_default_macro_book()
    set_lockstyle()

    state.Auto_Kite = M(false, 'Auto_Kite')
    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
    update_combat_form()
    determine_haste_group()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^-')
    send_command('unbind ^=')
    send_command('unbind !-')
    send_command('unbind !=')
    send_command('unbind ^;')
    send_command('unbind ![')
    send_command('unbind !;')
    send_command('unbind !q')
    send_command('unbind !w')
    send_command('bind !e input /ma "Haste" <stpc>')
    send_command('bind !r input /ma "Refresh" <stpc>')
    send_command('bind !y input /ma "Phalanx" <me>')
    send_command('unbind !o')
    send_command('unbind !p')
    send_command('unbind @s')
    send_command('unbind @d')
    send_command('unbind @t')

    send_command('unbind ~numpad7')
    send_command('unbind ~numpad8')
    send_command('unbind ~numpad9')
    send_command('unbind ~numpad4')
    send_command('unbind ~numpad5')
    send_command('unbind ~numpad6')
    send_command('unbind ~numpad1')
    send_command('unbind ~numpad2')
    send_command('unbind ~numpad3')
    send_command('unbind ~numpad0')

    send_command('unbind @w')
    -- send_command('unbind @c')
    send_command('unbind @e')
    send_command('unbind @r')
    send_command('unbind !insert')
    send_command('unbind !delete')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind ^home')
    send_command('unbind ^end')
    send_command('unbind ^pageup')
    send_command('unbind ^pagedown')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad2')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {
        body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    }

    -- Fast cast sets for spells
    sets.precast.FC = {
        main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Culminus",
		ammo="Staunch Tathlum",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','"Drain" and "Aspir" potency +1','INT+10','Mag. Acc.+15',}},
		neck="Erra Pendant",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
		left_ring="Lebeche Ring",
		right_ring="Kishar Ring",
		back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},    
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        sub="Ammurapi Shield",
        waist="Siegel Sash"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        ammo="Impatiens", --(2)
        ring1="Lebeche Ring", --(2)        
        back="Perimede Cape", --(4)
        waist="Embla Sash",
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC['Healing Magic'] = sets.precast.FC.Cure
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        ammo="Sapience Orb", --2
        head=empty,
        body="Twilight Cloak",
        hands="Gende. Gages +1", --7
        neck="Orunmila's Torque", --5
        ear1="Malignance Earring", --4
        ear2="Enchntr. Earring +1", --2
        ring1="Kishar Ring", --4
        back="Swith Cape +1", --4
        waist="Shinjutsu-no-Obi +1", --5
        })

    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"
    })
    sets.precast.Storm = set_combine(sets.precast.FC, {name="Stikini Ring +1"})
    sets.precast.FC.Utsusemi = sets.precast.FC.Cure


    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck="Rep. Plat. Medal",
        waist="Sarissapho. Belt",
        left_ear="Sherida Earring",
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Karieyh Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {        
        body="Ayanmo Corazza +2",
        hands="Malignance Gloves",        
        ear1="Sherida Earring",
        ring1="Begrudging Ring",
        ring2="Ilabrat Ring",
        })

    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {
        ammo="Voluspa Tathlum",
        ear2="Mache Earring +1",
        })

    sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
    sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck="Rep. Plat. Medal",
        waist="Sarissapho. Belt",
        left_ear="Sherida Earring",
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Karieyh Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-5%',}},
    })

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})

    sets.precast.WS['Death Blossom'] = sets.precast.WS['Savage Blade']
    sets.precast.WS['Death Blossom'].Acc = sets.precast.WS['Savage Blade'].Acc

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        ear2="Sherida Earring",
        })

    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {
        ammo="Voluspa Tathlum",
        neck="Combatant's Torque",
        ear1="Mache Earring +1",
        })

    sets.precast.WS['Sanguine Blade'] = {
        ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Lethargy Sayon +3",
		hands="Jhakri Cuffs +2",
		legs="Bunzi's Pants",
		feet="Leth. Houseaux +3",
		neck="Sibyl Scarf",
		waist="Carrier's Sash",
		left_ear="Regal Earring",
		right_ear="Ishvara Earring",
		left_ring="Archon Ring",
		right_ring="Jhakri Ring",
		back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    }

    sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {
        ammo="Pemphredo Tathlum",
        head="Bunzi's Hat",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands="Leth. Ganth. +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Carrier's Sash",
        left_ear="Regal Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Karieyh Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    })

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Seraph Dlade'], {
        head="Merlinic Hood",
        ear2="Moonshade Earring",
        ring1="Shiva Ring +1",
        waist="Orpheus's Sash",
    })

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {
        ear2="Sherida Earring",
        ring1="Rufescent Ring",
    })

    sets.precast.WS['Black Halo'].Acc = set_combine(sets.precast.WS['Black Halo'], {
        ammo="Voluspa Tathlum",
        neck="Combatant's Torque",
        ear2="Telos Earring",
        waist="Grunfeld Rope",
    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        ammo="Staunch Tathlum +1", --11
        --body="Ros. Jaseran +1", --25        
        legs="Carmine Cuisses +1", --20
        neck="Loricate Torque +1", --5
        ear1="Halasz Earring", --5
        ear2="Magnetic Earring", --8
        ring2="Evanescence Ring", --5
        waist="Rumination Sash", --10
    }

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Staunch Tathlum",
        head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        body="Bunzi's Robe",
        hands={ name="Kaykaus Cuffs", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
        legs={ name="Chironic Hose", augments={'Mag. Acc.+20','Pet: Mag. Acc.+22','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        neck="Nodens Gorget",
        waist="Rumination Sash",
        left_ear="Mendi. Earring",
        right_ear="Etiolation Earring",
        left_ring="Lebeche Ring",
        right_ring="Sirona's Ring",
        back="Solemnity Cape",
    }

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff",
        sub="Enki Strap",
        waist="Hachirin-no-Obi",
        })

    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
        neck="Phalaina Locket", -- 4(4)
        ring2="Asklepian Ring", -- (3)
        waist="Gishdubar Sash", -- (10)
        })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        ammo="Regal Gem",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        waist="Luminary Sash",
    })

    sets.midcast.StatusRemoval = {
        head="Vanya Hood",
        body="Vanya Robe",
        legs="Atrophy Tights +3",
        feet="Vanya Clogs",
        neck="Incanter's Torque",
        ear2="Meili Earring",
        ring1="Haoma's Ring",
        ring2="Menelaus's Ring",
        back="Perimede Cape",
        waist="Bishop's Sash",
    }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        hands="Hieros Mittens",
        body="Viti. Tabard +3",
        neck="Malison Medallion",
		left_ring="Ephedra Ring",
		right_ring="Ephedra Ring",
    })

    sets.midcast['Enhancing Magic'] = {
        main={ name="Pukulatmuj +1", augments={'Path: A',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Chironic Gloves", augments={'"Subtle Blow"+3','Mag. Acc.+14','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Leth. Houseaux +3",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Cascade Belt",
		left_ear="Halasz Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    }

    sets.midcast.EnhancingDuration = {
        main="Oranyan",
        sub="Enki Strap",
        ammo="Staunch Tathlum",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
        body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
        hands="Atrophy Gloves +2",
        legs={ name="Telchine Braconi", augments={'Mag. Acc.+22','"Cure" spellcasting time -3%','Enh. Mag. eff. dur. +9',}},
        feet="Leth. Houseaux +3",
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Defending Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enh. Mag. eff. dur. +16',}},
    }

    sets.midcast.EnhancingSkill = {
        main={ name="Pukulatmuj +1", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo="Staunch Tathlum",
        head="Befouled Crown",
        body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
        hands="Atrophy Gloves +2",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Leth. Houseaux +3",
        neck="Enhancing Torque",
        waist="Cascade Belt",
        left_ear="Etiolation Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','Latent effect: "Refresh"+1',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enh. Mag. eff. dur. +16',}},
        }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        head=gear.Telchine_ENH_head,
        body=gear.Telchine_ENH_body,
        hands=gear.Telchine_ENH_hands,
        legs=gear.Telchine_ENH_legs,
        feet=gear.Telchine_ENH_feet,
        })

    sets.midcast.Refresh = {
        main={ name="Crocea Mors", augments={'Path: C',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Befouled Crown",
        body="Atrophy Tabard +3",
        hands="Atrophy Gloves +2",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Gishdubar Sash",
        left_ear="Malignance Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Defending Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enh. Mag. eff. dur. +16',}},
    }

    sets.midcast.RefreshSelf = {
        waist="Gishdubar Sash",
        back="Grapevine Cape"
        }

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck="Nodens Gorget",
        waist="Siegel Sash",
        })

    sets.midcast['Phalanx'] = {
        main="Sakpata's Sword",
        sub={ name="Egeking", augments={'Accuracy+38','Mag. Acc.+22','"Fast Cast"+6',}},
        ammo="Pemphredo Tathlum",
        head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
        hands={ name="Taeon Gloves", augments={'Spell interruption rate down -10%','Phalanx +3',}},
        legs={ name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
        feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enh. Mag. eff. dur. +16',}},
    }

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        ammo="Staunch Tathlum +1",
        head={ name="Chironic Hat", augments={'Mag. Acc.+27','Attack+5','"Store TP"+2','Accuracy+18 Attack+18','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        hands="Regal Cuffs",
        ear1="Halasz Earring",
        ring1="Freke Ring",
        ring2="Evanescence Ring",
        waist="Emphatikos Rope",
        })

    sets.midcast.Storm = sets.midcast.EnhancingDuration
    sets.midcast.GainSpell = {hands="Viti. Gloves +3"}
    sets.midcast.SpikesSpell = {legs="Viti. Tights +3"}

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell


     -- Custom spell classes

    sets.midcast.MndEnfeebles = {
        main={ name="Crocea Mors", augments={'Path: C',}},
        sub="Thuellaic Ecu +1",
        ammo="Regal Gem",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+20','Pet: Mag. Acc.+22','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Rumination Sash",
        left_ear="Regal Earring",
        right_ear="Snotra Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    }

    sets.midcast.MndEnfeeblesAcc = set_combine(sets.midcast.MndEnfeebles, {
        body="Atrophy Tabard +3",
        neck="Null Loop",
        back="Null Shawl",
        range="Kaja bow",
    })

    sets.midcast.MndEnfeeblesEffect = set_combine(sets.midcast.MndEnfeebles, {
        ammo="Regal Gem",
        body="Lethargy Sayon +3",
        feet="Vitiation Boots +3",
        neck="Dls. Torque +2",
        })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {        
        })

    sets.midcast.IntEnfeeblesAcc = set_combine(sets.midcast.IntEnfeebles, {
        main="Crocea Mors",
        sub="Ammurapi Shield",
        range="Kaja bow",
        ammo=empty,
        body="Atrophy Tabard +3",
        hands="Kaykaus Cuffs +1",
        ring1="Stikini Ring +1",
        neck="Null Loop",
        waist="Acuity Belt +1",
        back="Null Shawl",
        })

    sets.midcast.IntEnfeeblesEffect = set_combine(sets.midcast.IntEnfeebles, {
        ammo="Regal Gem",
        body="Lethargy Sayon +3",
        feet="Vitiation Boots +3",
        neck="Dls. Torque +2",
        })

    sets.midcast.SkillEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        main="Contemplator +1",
        sub="Mephitis Grip",
        ammo="Regal Gem",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Atrophy Tabard +3",
        hands="Leth. Ganth. +3",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+20','Pet: Mag. Acc.+22','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Rumination Sash",
        left_ear="Snotra Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
        })

    sets.midcast.Sleep = set_combine(sets.midcast.IntEnfeeblesAcc, {
        head="Viti. Chapeau +3",
        neck="Dls. Torque +2",
        ear2="Snotra Earring",
        ring1="Kishar Ring",
        })

    sets.midcast.SleepMaxDuration = set_combine(sets.midcast.Sleep, {        
        body="Lethargy Sayon +3",
        hands="Regal Cuffs",
        hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
        })

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeeblesAcc, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.midcast['Dark Magic'] = {
        main={ name="Rubicundity", augments={'Mag. Acc.+9','"Mag.Atk.Bns."+8','Dark magic skill +9','"Conserve MP"+5',}},
		sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body={ name="Psycloth Vest", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
		hands={ name="Chironic Gloves", augments={'"Subtle Blow"+3','Mag. Acc.+14','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+20','Pet: Mag. Acc.+22','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','"Drain" and "Aspir" potency +1','INT+10','Mag. Acc.+15',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Choleric Earring",
		right_ear="Halasz Earring",
		left_ring="Excelsis Ring",
		right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",        
        })

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {waist="Luminary Sash"})
    sets.midcast['Bio III'] = set_combine(sets.midcast['Dark Magic'], {legs="Viti. Tights +3"})

    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Culminus",
        ammo="Pemphredo Tathlum",
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands="Bunzi's Gloves",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Mujin Band",
        right_ring="Metamorph Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
        }

    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Pemphredo Tathlum",        
        neck="Erra Pendant",
        })

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        range="Kaja bow",
        ammo=empty,
        neck="Erra Pendant",        
        })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,        
        ring1="Archon Ring",        
        })

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    -- Job-specific buff sets
    sets.buff.ComposureOther = {
        main={ name="Pukulatmuj +1", augments={'Path: A',}},
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body="Lethargy Sayon +3",
		hands="Atrophy Gloves +2",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Cascade Belt",
		left_ear="Etiolation Earring",
		right_ear="Halasz Earring",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enh. Mag. eff. dur. +16',}},
    }

    sets.buff.Saboteur = {
        main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Thuellaic Ecu +1",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +3",
		hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring",
		back={ name="Sucellos's Cape", augments={'INT+12','Mag. Acc+5 /Mag. Dmg.+5','Magic Damage +2','"Fast Cast"+10','Spell interruption rate down-6%',}},
    }


    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        main="Excalibur",
		sub="Culminus",
		ammo="Pemphredo Tathlum",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {
        main="Excalibur",
        sub="Culminus",
        ammo="Staunch Tathlum",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Adamantite Armor",
        hands="Leth. Ganth. +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Gurebu's Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    })

    sets.idle.Town = set_combine(sets.idle, {
        ammo="Regal Gem",
        head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
        hands="Leth. Ganth. +3",
        legs="Leth. Fuseau +3",
        feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
        neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Defending Ring",
        right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    })

    sets.resting = set_combine(sets.idle, {
        main="Chatoyant Staff",
        waist="Shinjutsu-no-Obi +1",
        })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.magic_burst = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands="Bunzi's Gloves",
        legs="Leth. Fuseau +3",
        feet="Leth. Houseaux +3",
        neck="Sibyl Scarf",
        waist="Carrier's Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Defending Ring",
        right_ring="Mujin Band",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
        }

    sets.Kiting = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Lethargy Sayon +3",
        hands="Leth. Ganth. +3",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Nyame Sollerets",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    }
    sets.latent_refresh = {waist="Fucho-no-obi"}


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Aya. Zucchetto +2",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Nyame Sollerets",
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Chirich Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    }

    sets.engaged.MidAcc = set_combine(sets.engaged, {})

    sets.engaged.HighAcc = set_combine(sets.engaged, {})

    -- No Magic Haste (74% DW to cap)
    sets.engaged.DW = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Bunzi's Hat",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Nyame Sollerets",
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Chirich Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},
    } --41

    sets.engaged.DW.MidAcc = set_combine(sets.engaged.DW, {        
        })

    sets.engaged.DW.HighAcc = set_combine(sets.engaged.DW.MidAcc, {        
        })

    -- 15% Magic Haste (67% DW to cap)
    sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {        
        }) --41

    sets.engaged.DW.MidAcc.LowHaste = set_combine(sets.engaged.DW.LowHaste, {        
        })

    sets.engaged.DW.HighAcc.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, {        
        })

    -- 30% Magic Haste (56% DW to cap)
    sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {        
        }) --31

    sets.engaged.DW.MidAcc.MidHaste = set_combine(sets.engaged.DW.MidHaste, {        
        })

    sets.engaged.DW.HighAcc.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, {
        })

    -- 35% Magic Haste (51% DW to cap)
    sets.engaged.DW.HighHaste = set_combine(sets.engaged.DW, {
      }) --26

    sets.engaged.DW.MidAcc.HighHaste = set_combine(sets.engaged.DW.HighHaste, {
        })

    sets.engaged.DW.HighAcc.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, {
        })

    -- 45% Magic Haste (36% DW to cap)
    sets.engaged.DW.MaxHaste = set_combine(sets.engaged.DW, {
        }) --10

    sets.engaged.DW.MidAcc.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, {
        })

    sets.engaged.DW.HighAcc.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, {
        })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.Hybrid = {
        head="Nyame Helm",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Jhakri Slops +2",
		feet="Nyame Sollerets",
       neck="Loricate Torque +1", --6/6
       ring2="Defending Ring", --10/10
       }

    sets.engaged.DT = set_combine(sets.engaged, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT = set_combine(sets.engaged.MidAcc, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT = set_combine(sets.engaged.HighAcc, sets.engaged.Hybrid)

    sets.engaged.DW.DT = set_combine(sets.engaged.DW, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT = set_combine(sets.engaged.DW.MidAcc, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT = set_combine(sets.engaged.DW.HighAcc, sets.engaged.Hybrid)

    sets.engaged.DW.DT.LowHaste = set_combine(sets.engaged.DW.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.LowHaste = set_combine(sets.engaged.DW.MidAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.LowHaste = set_combine(sets.engaged.DW.HighAcc.LowHaste, sets.engaged.Hybrid)

    sets.engaged.DW.DT.MidHaste = set_combine(sets.engaged.DW.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.MidHaste = set_combine(sets.engaged.DW.MidAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.MidHaste = set_combine(sets.engaged.DW.HighAcc.MidHaste, sets.engaged.Hybrid)

    sets.engaged.DW.DT.HighHaste = set_combine(sets.engaged.DW.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.HighHaste = set_combine(sets.engaged.DW.MidAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.HighHaste = set_combine(sets.engaged.DW.HighAcc.HighHaste, sets.engaged.Hybrid)

    sets.engaged.DW.DT.MaxHaste = set_combine(sets.engaged.DW.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.MidAcc.DT.MaxHaste = set_combine(sets.engaged.DW.MidAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.DW.HighAcc.DT.MaxHaste = set_combine(sets.engaged.DW.HighAcc.MaxHaste, sets.engaged.Hybrid)

    sets.engaged.Enspell = {
        hands="Aya. Manopolas +2",
        neck="Dls. Torque +2",
        waist="Orpheus's Sash",
        }

    sets.engaged.Enspell.Fencer = {ring1="Fencer's Ring"}


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.buff.Doom = {
        neck="Nicander's Necklace", --20
        ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        waist="Gishdubar Sash", --10
        }

    sets.Obi = {waist="Hachirin-no-Obi"}
    -- sets.CP = {back="Mecisto. Mantle"}

    sets.TreasureHunter = {head="Volte Cap", feet="Volte Boots", waist="Chaac Belt"}

    sets.CroceaDark = {main="Crocea Mors", sub="Ternion Dagger +1"}
    sets.CroceaLight = {main="Crocea Mors", sub="Daybreak"}
    sets.Almace = {main="Almace", sub="Ternion Dagger +1"}
    sets.Naegling = {main="Naegling", sub="Thibron"}
    sets.Tauret = {main="Tauret", sub="Ternion Dagger +1"}
    sets.Idle = {main="Daybreak", sub="Sacro Bulwark"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

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
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
    if spell.english == "Phalanx II" and spell.target.type == 'SELF' then
        cancel_spell()
        send_command('@input /ma "Phalanx" <me>')
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enhancing Magic' then
        if classes.NoSkillSpells:contains(spell.english) then
            equip(sets.midcast.EnhancingDuration)
            if spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)
                if spell.target.type == 'SELF' then
                    equip (sets.midcast.RefreshSelf)
              end
            end
        elseif skill_spells:contains(spell.english) then
            equip(sets.midcast.EnhancingSkill)
        elseif spell.english:startswith('Gain') then
            equip(sets.midcast.GainSpell)
        elseif spell.english:contains('Spikes') then
            equip(sets.midcast.SpikesSpell)
        end
        if (spell.target.type == 'PLAYER' or spell.target.type == 'NPC') and buffactive.Composure then
            equip(sets.buff.ComposureOther)
        end
    end
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
    if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value and spell.english ~= 'Death' then
            equip(sets.magic_burst)
            if spell.english == "Impact" then
                equip(sets.midcast.Impact)
            end
        end
        if spell.skill == 'Elemental Magic' or spell.english == "Kaustra" then
            if spell.element == world.weather_element and (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
                equip(sets.Obi)
            -- Target distance under 1.7 yalms.
            elseif spell.target.distance < (1.7 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Matching day and weather.
            elseif spell.element == world.day_element and spell.element == world.weather_element then
                equip(sets.Obi)
            -- Target distance under 8 yalms.
            elseif spell.target.distance < (8 + spell.target.model_size) then
                equip({waist="Orpheus's Sash"})
            -- Match day or weather.
            elseif spell.element == world.day_element or spell.element == world.weather_element then
                equip(sets.Obi)
            end
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.english:contains('Sleep') and not spell.interrupted then
        set_sleep_timer(spell)
    end
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff,gain)
    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
             disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub','range')
    else
        enable('main','sub','range')
    end

    check_weaponset()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
    determine_haste_group()
    check_moving()
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

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if (world.weather_element == 'Light' or world.day_element == 'Light') then
                return 'CureWeather'
            end
        end
        if spell.skill == 'Enfeebling Magic' then
            if enfeebling_magic_skill:contains(spell.english) then
                return "SkillEnfeebles"
            elseif spell.type == "WhiteMagic" then
                if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
                    return "MndEnfeeblesAcc"
                elseif enfeebling_magic_effect:contains(spell.english) then
                    return "MndEnfeeblesEffect"
                else
                    return "MndEnfeebles"
              end
            elseif spell.type == "BlackMagic" then
                if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
                    return "IntEnfeeblesAcc"
                elseif enfeebling_magic_effect:contains(spell.english) then
                    return "IntEnfeeblesEffect"
                elseif enfeebling_magic_sleep:contains(spell.english) and ((buffactive.Stymie and buffactive.Composure) or state.SleepMode.value == 'MaxDuration') then
                    return "SleepMaxDuration"
                elseif enfeebling_magic_sleep:contains(spell.english) then
                    return "Sleep"
                else
                    return "IntEnfeebles"
                end
            else
                return "MndEnfeebles"
            end
        end
    end
end

function get_custom_wsmode(spell, action, spellMap)
    local wsmode
    if state.OffenseMode.value == 'MidAcc' or state.OffenseMode.value == 'HighAcc' then
        wsmode = 'Acc'
    end

    return wsmode
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end

    if state.Auto_Kite.value == true then
       idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

function customize_melee_set(meleeSet)
    if state.EnspellMode.value == true then
        meleeSet = set_combine(meleeSet, sets.engaged.Enspell)
    end
    if state.EnspellMode.value == true and player.hpp <= 75 and player.tp < 1000 then
        meleeSet = set_combine(meleeSet, sets.engaged.Enspell.Fencer)
    end
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    check_weaponset()

    return meleeSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)


    return meleeSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' ..state.CombatForm.value.. ')'
    end

    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' ..state.HybridMode.value
    end

    local ws_msg = state.WeaponskillMode.value

    local c_msg = state.CastingMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(002, '| ' ..string.char(31,210).. 'Melee' ..cf_msg.. ': ' ..string.char(31,001)..m_msg.. string.char(31,002)..  ' |'
        ..string.char(31,207).. ' WS: ' ..string.char(31,001)..ws_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 14 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 15 and DW_needed <= 26 then
            classes.CustomMeleeGroups:append('HighHaste')
        elseif DW_needed > 26 and DW_needed <= 32 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 32 and DW_needed <= 43 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 43 then
            classes.CustomMeleeGroups:append('')
        end
    end
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

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'enspell' then
        send_command('@input /ma '..state.EnSpell.value..' <me>')
    elseif cmdParams[1]:lower() == 'barelement' then
        send_command('@input /ma '..state.BarElement.value..' <me>')
    elseif cmdParams[1]:lower() == 'barstatus' then
        send_command('@input /ma '..state.BarStatus.value..' <me>')
    elseif cmdParams[1]:lower() == 'gainspell' then
        send_command('@input /ma '..state.GainSpell.value..' <me>')
    end

    gearinfo(cmdParams, eventArgs)
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>

function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

function set_sleep_timer(spell)
    local self = windower.ffxi.get_player()

    if spell.en == "Sleep II" then
        base = 90
    elseif spell.en == "Sleep" or spell.en == "Sleepga" then
        base = 60
    end

    if state.Buff.Saboteur then
        if state.NM.value then
            base = base * 1.25
        else
            base = base * 2
        end
    end

    -- Merit Points Duration Bonus
    base = base + self.merits.enfeebling_magic_duration*6

    -- Relic Head Duration Bonus
    if not ((buffactive.Stymie and buffactive.Composure) or state.SleepMode.value == 'MaxDuration') then
        base = base + self.merits.enfeebling_magic_duration*3
    end

    -- Job Points Duration Bonus
    base = base + self.job_points.rdm.enfeebling_magic_duration

    --Enfeebling duration non-augmented gear total
    gear_mult = 1.40
    --Enfeebling duration augmented gear total
    aug_mult = 1.25
    --Estoquer/Lethargy Composure set bonus
    --2pc = 1.1 / 3pc = 1.2 / 4pc = 1.35 / 5pc = 1.5
    empy_mult = 1 --from sets.midcast.Sleep

    if ((buffactive.Stymie and buffactive.Composure) or state.SleepMode.value == 'MaxDuration') then
        if buffactive.Stymie then
            base = base + self.job_points.rdm.stymie_effect
        end
        empy_mult = 1.35 --from sets.midcast.SleepMaxDuration
    end

    totalDuration = math.floor(base * gear_mult * aug_mult * empy_mult)

    -- Create the custom timer
    if spell.english == "Sleep II" then
        send_command('@timers c "Sleep II ['..spell.target.name..']" ' ..totalDuration.. ' down spells/00259.png')
    elseif spell.english == "Sleep" or spell.english == "Sleepga" then
        send_command('@timers c "Sleep ['..spell.target.name..']" ' ..totalDuration.. ' down spells/00253.png')
    end
    add_to_chat(1, 'Base: ' ..base.. ' Merits: ' ..self.merits.enfeebling_magic_duration.. ' Job Points: ' ..self.job_points.rdm.stymie_effect.. ' Set Bonus: ' ..empy_mult)

end

-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

function check_weaponset()
    equip(sets[state.WeaponSet.current])
    if player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC' then
       equip(sets.DefaultShield)
    end
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 9)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
