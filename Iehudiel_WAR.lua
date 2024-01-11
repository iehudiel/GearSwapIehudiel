--require("no_interruptions")
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Mote-TreasureHunter')
end
send_command('input //lua l equipviewer')
send_command('input //lua l anchor')
--send_command('input //lua l react')

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

--	^ ctrl; ! alt; @ windows
-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'PDT', 'MDT','Hybrid','Fencer')
    state.HybridMode:options()
    state.WeaponskillMode:options()
    state.PhysicalDefenseMode:options()
    state.IdleMode:options('Regen', 'PDT')
	

    update_combat_form()
    
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')

    select_default_macro_book()
	set_lockstyle()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Berserk = {
        --body="pumm. lorica +3", 
        --feet="Agoge Calligae +3",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
    sets.precast.JA.Aggressor = {
        --head="Pumm. Mask", 
        --body="Agoge lorica +3"
    }
    sets.precast.JA.Warcry = {
        --head={ name="Agoge Mask +3", augments={'Enhances "Warcry" effect',}},
    }
    sets.precast.JA.Retaliation = {
        --hands="Pumm. Mufflers +1", 
        --feet="Ravager's Calligae +2"
    }
    sets.precast.JA['Warrior\'s Charge'] = {
        --legs={ name="Agoge Cuisses", augments={'Enhances "Warrior\'s Charge" effect',}},
    }
    sets.precast.JA['Blood Rage'] = {
        --body="Boii Lorica",
    }
	sets.precast.JA['Restraint'] = {
        --hands="Boii Mufflers +2",
    }
    sets.precast.JA['Mighty Strikes'] = {
        --hands={ name="Agoge Mufflers", augments={'Enhances "Mighty Strikes" effect',}},
    }
	sets.precast.JA['Provoke'] = {
        ammo="Staunch Tathlum",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="Unmoving Collar +1",
        waist="Flume Belt +1",
        left_ear="Cryptic Earring",
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+9','Mag. Acc.+9',}},
        left_ring="Apeile Ring +1",
        right_ring="Petrov Ring",
        back="Philidor Mantle",
	}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo="Crepuscular Pebble",
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands="Regal Cpt. Gloves",
        legs="Dashing Subligar",
        feet="Pumm. Calligae +2",
        neck="Unmoving Collar +1",
        waist="Sulla Belt",
        left_ear="Handler's Earring +1",
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+9','Mag. Acc.+9',}},
        left_ring="Vocane Ring",
        right_ring="Metamorph Ring",
        back="Philidor Mantle",
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Hjarrandi Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sulev. Leggings +2",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Resolution'] = {
        ammo="Seething Bomblet",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        feet="Sakpata's Leggings",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}}
    }
			
    sets.precast.WS['Upheaval'] = {
        ammo="Knobkierrie",
        head="Sakpata's Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Sakpata's Leggings",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
	
    sets.precast.WS["Ukko's Fury"] = {
        ammo="Knobkierrie",
        head="Sakpata's Helm",
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Sakpata's Leggings",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Rng.Atk.+2','Pet: Attack+22 Pet: Rng.Atk.+22','Weapon skill damage +4%',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Sulev. Leggings +2",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Ishvara Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.precast.WS['Shockwave'] ={
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="	 Mask +3", augments={'Enhances "Savagery" effect',}},
    body="pumm. lorica +3",
    hands="Boii Mufflers +2",
    legs="pumm. cuisses +3",
    feet="Pumm. Calligae +3",
   neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
     back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Double Attack" +10%','Phys. dmg. taken-10%',}},
}
		
	sets.precast.WS['Decimation'] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+9','Mag. Acc.+9',}},
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.precast.FC = {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body={ name="Odyss. Chestplate", augments={'Accuracy+27','"Cure" potency +1%','MND+7','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Moonlight Necklace",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Ethereal Earring",
        left_ring="Rahab Ring",
        right_ring="Lebeche Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
	}
		
    -- Midcast Sets
 
 sets.midcast.FastRecast = { ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		head="Sulevia's Mask +2",
		body="Tartarus Platemail",
		hands="Sulev. Gauntlets +2",
		legs="pumm. cuisses +3",
		feet="Pumm. Calligae +3",
		neck="Loricate Torque +1",
		waist="Ioskeha Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Lebeche Ring",
		right_ring="Gelatinous Ring +1",
		back="Moonlight Cape",
		}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {

		}    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town =  {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Hermes' Sandals",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Apeile Ring +1",
        right_ring="Chirich Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
    sets.idle = {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring="Apeile Ring +1",
        right_ring="Chirich Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
	
    sets.idle.Warp = {
		left_ring="Warp Ring",
		right_ring="Dim. Ring (Holla)",
		}	

--    sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail",})
    
    -- Defense sets
    sets.defense.PDT = {
        ammo="Crepuscular Pebble",
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Flume Belt +1",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Ethereal Earring",
        left_ring="Defending Ring",
        right_ring="Vocane Ring",
        back="Philidor Mantle",
    }

    sets.defense.MDT = {
        ammo="Crepuscular Pebble",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Vocane Ring",
        back="Philidor Mantle",
    }
    
	-- Engaged sets
	
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	sets.engaged = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        feet={ name="Valorous Greaves", augments={'DEX+8','Attack+18','Quadruple Attack +2','Accuracy+20 Attack+20','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        neck="Asperity Necklace",
        waist="Kentarch Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Apeile Ring +1",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
	
	sets.engaged.PDT = {	
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Kentarch Belt",
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear="Telos Earring",
        left_ring="Chirich Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.engaged.MDT = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Kentarch Belt",
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear="Telos Earring",
        left_ring="Chirich Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.engaged.Hybrid = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Kentarch Belt",
        left_ear={ name="Schere Earring", augments={'Path: A',}},
        right_ear="Telos Earring",
        left_ring="Chirich Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }

    sets.engaged.Fencer = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Hjarrandi Helm",
        body="Hjarrandi Breast.",
        hands={ name="Tatena. Gote +1", augments={'Path: A',}},
        legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
        feet={ name="Valorous Greaves", augments={'DEX+8','Attack+18','Quadruple Attack +2','Accuracy+20 Attack+20','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        neck="Asperity Necklace",
        waist="Kentarch Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Apeile Ring +1",
        right_ring="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+10','Accuracy+10 Attack+10','"Store TP"+5','System: 1 ID: 640 Val: 0',}},
    }
		
	sets.TreasureHunter = {    
        legs={ name="Valorous Hose", augments={'Pet: VIT+1','Weapon skill damage +1%','"Treasure Hunter"+1','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
	}
	
end


----------------------	---------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)

end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)

end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1,8)
    else
        set_macro_page(2,8)
    end
end

function set_lockstyle()
	send_command('wait 6;input /lockstyleset 85')
end
function precast_weaponskill(spell, action)
    if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        cancel_spell()
        return
    end
    if player.equipment.main == "Lionheart" then
        if player.tp < 2251 then
            equip({right_ear = 'Moonshade Earring'})
        end
    else
        if player.tp < 2751 then
            equip({right_ear = 'Moonshade Earring'})
        end
    end
 
end
function job_buff_change(status,gain_or_loss)
   if (gain_or_loss) then  
     
     if status == "Aftermath: Lv.3" then
       send_command('input //timers c "AM3" 180')
     elseif status == "Aftermath: Lv.2" then
       send_command('input //timers c "AM2" 120')
     elseif status == "Aftermath: Lv.1" then
       send_command('input //timers c "AM1" 90')
     end
     
   end
   end

function job_aftercast(spell, action, eventArgs)
    if spell.type == "WeaponSkill" then 
        add_to_chat(217, 'TP Return: '..tostring(player.tp))
    end
end    

function job_precast(spell, action, spellMap, eventArgs)    
if spell.type == 'WeaponSkill' and player.target.distance > (3.4 + player.target.model_size) then 
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        eventArgs.cancel = true        
        return
    end
end        