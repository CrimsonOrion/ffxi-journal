--[[
    Wings of the Goddess - Mission Database
    ==========================================

    M.MISSIONS:
        Official numeric mission IDs used by the mission tracker.

    M.STEPS:
        Walkthrough entries using the same mission IDs.

    The two tables must use the same identifiers so that each
    mission resolves to its corresponding walkthrough.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'Cavernous Maws',
    [1] = 'Back to the Beginning',
    [2] = 'Cait Sith',
    [3] = 'The Queen of the Dance',
    [4] = 'While the Cat Is Away',
    [5] = 'A Timeswept Butterfly',
    [6] = 'Purple, The New Black',
    [7] = 'In the Name of the Father',
    [8] = 'Dancers in Distress',
    [9] = 'Daughter of a Knight',
    [10] = 'A Spoonful of Sugar',
    [11] = 'Affairs of State',
    [12] = 'Borne by the Wind',
    [13] = 'A Nation on the Brink',
    [14] = 'Crossroads of Time',
    [15] = 'Sandswept Memories',
    [16] = 'Northland Exposure',
    [17] = 'Traitor in the Midst',
    [18] = 'Betrayal at Beaucedine',
    [19] = 'On Thin Ice',
    [20] = 'Proof of Valor',
    [21] = 'A Sanguinary Prelude',
    [22] = 'Dungeons and Dancers',
    [23] = 'Distorter of Time',
    [24] = 'The Will of the World',
    [25] = 'Fate in Haze',
    [26] = 'The Scent of Battle',
    [27] = 'Another World',
    [28] = 'A Hawk in Repose',
    [29] = 'The Battle of Xarcabard',
    [30] = 'Prelude to a Storm',
    [31] = 'Storm\'s Crescendo',
    [32] = 'Into the Beast\'s Maw',
    [33] = 'The Hunter Ensnared',
    [34] = 'Flight of the Lion',
    [35] = 'Fall of the Hawk',
    [36] = 'Darkness Descends',
    [37] = 'Adieu, Lilisette',
    [38] = 'By the Fading Light',
    [39] = 'Edge of Existence',
    [40] = 'Her Memories',
    [41] = 'Forget Me Not',
    [42] = 'Pillar of Hope',
    [43] = 'Glimmer of Life',
    [44] = 'Time Slips Away',
    [45] = 'When Wills Collide',
    [46] = 'Whispers of Dawn',
    [47] = 'A Dreamy Interlude',
    [48] = 'Cait in the Woods',
    [49] = 'Fork in the Road',
    [50] = 'Maiden of the Dusk',
    [51] = 'Where It All Began',
    [52] = 'A Token of Troth',
    [53] = 'Lest We Forget',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- MISSIONS 0-7
    -- ========================================================

    [0] = {
        name = "Cavernous Maws",
        steps = {
            "Examine one of the three Cavernous Maws:",
            "Batallia Downs: " .. ACTOR.MAW_BATALLIA.text .. ".",
            "Rolanberry Fields: " .. ACTOR.MAW_ROLANBERRY.text .. ".",
            "Sauromugue Champaign: " .. ACTOR.MAW_SAUROMUGUE.text .. ", beyond Banishing Gate #3 in Garlaige Citadel.",
            "Examine it for a cutscene. You arrive in the past at a random one of the three Maws, whichever you entered.",
            "After arriving in the past, examine the other two Maws to open their passages between the past and present.",
            "If you warp out or die before unlocking another Maw, Survival Guide or Home Point in the past, you must go back through the Maw of the zone you landed in. A Maw does nothing in the present until you have activated it from the past.",
        },
    },

    [1] = {
        name = "Back to the Beginning",
        steps = {
            "Get a recommendation letter from an Allied fortress near Jeuno. Your choice only affects Allied Notes prices and where Retrace sends you; you can do every nation's quests either way.",
            "San d'Oria (Red letter): Randecque in Garlaige Citadel [S], second map (I-6): follow the left wall to the Planar Rift (H-7), turn right through two Heavy Iron Gates. Windurst (Green letter): Kalsu-Kalasu in Crawlers' Nest [S] (L-8), near the entrance. Bastok (Blue letter): Turbulent Storm in The Eldieme Necropolis [S] (J-9), entered from Batallia Downs [S] (J-10).",
            "Carry the letter to that city through the Shadowreign zones. San d'Oria: Batallia Downs [S] > north Jugner Forest [S] > Vunkerl Inlet [S] > south Jugner Forest [S] > East Ronfaure [S]. Windurst: Sauromugue Champaign [S] > Meriphataud Mountains [S] > Fort Karugo-Narugo [S] > West Sarutabaruta [S]. Bastok: Rolanberry Fields [S] > Pashhow Marshlands [S] > Grauberg [S] > North Gustaberg [S].",
            "San d'Oria: give the letter to Mainchelite in Southern San d'Oria [S] (I-9) and complete Steamed Rams, then Gifts of the Griffon and Claws of the Griffon.",
            "Bastok: give the letter to Adelbrecht in Bastok Markets [S] (E-9) and complete The Fighting Fourth, then Better Part of Valor and Fires of Discontent.",
            "Windurst: give the letter to Miah Riyuh in Windurst Waters [S] (H-9) and complete Snake on the Plains, then The Tigress Stirs and The Tigress Strikes.",
            "After one nation's quest line, examine any of the three Cavernous Maws outside Jeuno in the past (or a present-day one you have already activated) for a cutscene and the title Cait Sith's Assistant.",
        },
    },

    [2] = {
        name = "Cait Sith",
        steps = {
            "San d'Oria: complete Boy and the Beast and Wrath of the Griffon.",
            "Bastok: complete Light in the Darkness and Burden of Suspicion.",
            "Windurst: complete Knot Quite There and A Manifest Problem.",
            "After one pair, walk into Southern San d'Oria [S] from East Ronfaure [S] for a cutscene. Arriving by Home Point, Survival Guide or any other warp doesn't work.",
        },
    },

    [3] = {
        name = "The Queen of the Dance",
        steps = {
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. " in Southern San d'Oria [S] (K-6) for a cutscene. If it's locked, you still need to walk in from East Ronfaure [S] to finish Cait Sith, or finish the nation quests.",
            "Speak with Turlough in present-day Upper Jeuno (G-7), watching the dancers, for the key item Mayakov show ticket.",
            "Return to " .. ACTOR.LION_SPRINGS_DOOR.text .. " and examine it again.",
        },
    },

    [4] = {
        name = "While the Cat is Away",
        steps = {
            "Zone from Southern San d'Oria [S] into East Ronfaure [S] for a cutscene. The next mission starts right after.",
        },
    },

    [5] = {
        name = "A Timeswept Butterfly",
        steps = {
            "Zone into La Vaule [S] from Jugner Forest [S] (G-11) for a cutscene. Fastest is the Jugner Forest [S] Survival Guide right by the entrance (or Recall-Jugner, or the Jugner Forest [S] campaign warp).",
            "On foot from Batallia Downs [S]: keep left into Vunkerl Inlet [S] (L-6), take the eastern path toward (H-7) (there is a one-way drop at F-6), down to (D-10) into Jugner Forest [S], drop off the ramp at (J-11), cross the logs at (I-9), pass the Telepoint at (H-9) and keep right at the split at (H-11) to the Wooden Gate at (G-11).",
        },
    },

    [6] = {
        name = "Purple, The New Black",
        steps = {
            "In La Vaule [S]: enter the big room at (J-7) and go west to (I-7), north then west to (G-7), north to (G-6) and turn left. Cross the big room of level-80 Orcs to (E-6), giving a wide berth to Coinbiter Cjaknokk (true sight; the others link to it). Go north, west to (E-7), then east and south over the bridge at (F-8): the Reinforced Gateway is on your right at (F-9).",
            "Examine the Reinforced Gateway.",
            "Examine it again to enter the battle against Galarhigg.",
            "Your buffs are removed upon entering the battlefield, so summon Trusts after entering.",
            "Defeat Galarhigg (watch out for Petro Eyes). You move on to the next mission right after.",
        },
    },

    [7] = {
        name = "In the Name of the Father",
        steps = {
            "This mission unlocks Rhapsodies of Vana'diel 2-16 (Ganged Up On). Continue your nation's quests: Bastok, Storm on the Horizon and Fire in the Hole; San d'Oria, Perils of the Griffon and In a Haze of Glory; Windurst, When One Man Is Not Enough and A Feast for Gnats.",
            "Return to Southern San d'Oria [S].",
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. ".",
        },
    },

    -- ========================================================
    -- MISSIONS 8-17
    -- ========================================================

    [8] = {
        name = "Dancers in Distress",
        steps = {
            "Speak with Raustigne in Southern San d'Oria [S] (I-7/8) for a cutscene.",
            "Examine the Elegant Footprints in Jugner Forest [S] (I-6), by the tree stump near the H-6/I-6 border just over the makeshift bridge from East Ronfaure [S] (the East Ronfaure [S] Survival Guide is closest).",
            "Your answers and the day decide which item you're asked for: a Gold Beastcoin, Lynx Meat or a Nyumomo Doll (dropped by Orcs in present-day Batallia Downs; Treasure Hunter helps).",
            "Zone (logging out doesn't count), then trade the item to the Elegant Footprints to complete the mission.",
            "Tip: before leaving Jugner Forest [S], kill Wandering Saplings (at J-6 and F-10) for a Cernunnos Bulb, one per person, for the next mission.",
        },
    },

    [9] = {
        name = "Daughter of a Knight",
        steps = {
            "Speak with Amaura in Southern San d'Oria [S] (G-6) (Home Point #4) and trade her a Cernunnos Bulb (from Wandering Saplings in Jugner Forest [S]).",
            "Trade a Cernunnos Bulb to the Humus-rich Earth in Jugner Forest [S] (E-6) to plant it (Campaign Arbiter warp then northwest, or the Survival Guide; watch for Lobisons).",
            "Go to the same spot in present-day Jugner Forest (Norvallen outpost warp or Survival Guide) and examine the Humus-rich Earth for a cutscene, then again to spawn Cernunnos, a Treant (Protect IV, Shell IV, Stone IV, Stonega III).",
            "Examine " .. ACTOR.JUGNER_HUMUS_RICH_EARTH_E6.text .. " again to obtain Cernunnos Resin.",
            "Return to Amaura with the resin for a cutscene.",
            "Wait for the next game day, zone, and speak with Amaura again for the key item Bottle of treant tonic. If you're on the quest To Cure a Cough, you may need to talk to her more than once.",
        },
    },

    [10] = {
        name = "A Spoonful of Sugar",
        steps = {
            "Speak with Raustigne at the Victory Gate in Southern San d'Oria [S] (I-7).",
        },
    },

    [11] = {
        name = "Affairs of State",
        steps = {
            "In either order: speak with Radford near the Metalworks in Bastok Markets [S] (H-6) (Survival Guide is closest), and with Velda-Galda in north Windurst Waters [S] (K-9), near the zone line to Windurst Walls.",
            "After both, you receive the key item Count Borel's letter.",
        },
    },

    [12] = {
        name = "Borne by the Wind",
        steps = {
            "Examine the Bulwark Gate in Sauromugue Champaign [S] (E-6/F-6) for a cutscene. Fastest: the past Atmacite Refiner warp; otherwise your nation's Campaign Arbiter warp and ride northwest, or the Rolanberry Fields Survival Guide and the Voidwatch passage beside it.",
            "In the cutscene, choose the first option (the second only adds some text). You receive the key item Underpass hatch key. If you get a short Voidwatch scene with Jeuno's leader instead, examine the gate again.",
            "This cutscene can freeze with frame-rate or cutscene-skip addons; set the frame rate back to 30 if it does.",
        },
    },

    [13] = {
        name = "A Nation on the Brink",
        steps = {
            "Examine " .. ACTOR.UNDERPASS_HATCH.text .. " in Batallia Downs [S] (J-9/K-9), on the rampart inside a tower, for a cutscene.",
            "Examine it again to enter Everbloom Hollow (up to 6; the leader needs the Underpass hatch key). Trusts are allowed and nothing inside can be slept.",
            "Nine allied NPCs split up by nation and each fight two waves: Quadavs to the northwest, Orcs to the northeast, Yagudo to the south. Help them clear the waves.",
            "Then defeat One-eyed Gwajboj, a Paladin who may use Invincible more than once.",
            "Winning gives a cutscene and the Jeunoan Flag. If your inventory is full, get it later from the ??? on the barrels just north of the entrance.",
        },
    },

    [14] = {
        name = "Crossroads of Time",
        steps = {
            "Continue your nation's quests: Bastok, Quelling the Storm and Honor Under Fire; San d'Oria, The Price of Valor and Bonds That Never Die; Windurst, The Long March North and The Forbidden Path.",
            "Enter Southern San d'Oria [S] by walking from East Ronfaure [S].",
        },
    },

    [15] = {
        name = "Sandswept Memories",
        steps = {
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. " in Southern San d'Oria [S] (K-6) for a cutscene.",
        },
    },

    [16] = {
        name = "Northland Exposure",
        steps = {
            "Zone into Beaucedine Glacier [S] for a cutscene: by its Survival Guide, your nation's Campaign Arbiter warp, or through the tunnel at the northwest end of Batallia Downs [S] (E-4).",
        },
    },

    [17] = {
        name = "Traitor in the Midst",
        steps = {
            "Plant a Shadow bug on five Cait Siths at towers across Beaucedine Glacier [S] by examining the Regal Pawprints at each and winning a minigame (any order; three tries each, no need to zone). Other Regal Pawprints in the zone are for later missions.",
            "Cait Sith Coig, tower at (J-8): hit her with a blow dart as she moves back and forth.",
            "Cait Sith Seachd, tower at (I-7): guide Lilisette in Red Light, Green Light; when she puts her hands on her hips, her next move is two steps. For all three of these games, move when Cait Sith turns her head 45 degrees: her next turn is always away. Unload cutscene-skipping addons first.",
            "Cait Sith Ceithir, tower at (G-9): guide Portia in Red Light, Green Light; if she panics, her next move is slower.",
            "Cait Sith Aon, tower at (H-8) (where the Campaign Arbiter warps you): Red Light, Green Light in first person.",
            "Cait Sith Tri, tower at (F-7): as a baby chocobo, chirp or wiggle to lure her within a minute, then choose \"Stun!\" when it appears.",
            "With all five bugs planted, examine " .. ACTOR.BEAUCEDINE_REGAL_PAWPRINTS_H10.text .. " under the large broken tree branch near the tower (not at the tower's base).",
        },
    },

    -- ========================================================
    -- MISSIONS 18-27
    -- ========================================================

    [18] = {
        name = "Betrayal at Beaucedine",
        steps = {
            "Examine " .. ACTOR.BEAUCEDINE_REGAL_PAWPRINTS_H9.text .. " behind the tree near the bottom of the ramp from the Campaign Arbiter for a cutscene.",
            "Examine it again to spawn Count Halphas and four Dark Demons.",
            "Only Count Halphas has to die; the Dark Demons vanish with him. The Demons can be slept with Sleepga, Halphas can't.",
            "Examine " .. ACTOR.BEAUCEDINE_REGAL_PAWPRINTS_H9.text .. " again.",
        },
    },

    [19] = {
        name = "On Thin Ice",
        steps = {
            "Speak with Raustigne in Southern San d'Oria [S] (I-7) for a cutscene.",
        },
    },

    [20] = {
        name = "Proof of Valor",
        steps = {
            "Collect at least 20 signatures from the knights of Southern San d'Oria [S] (more earns a bonus: 30 Oxblood Orb, 41 Foulard, 81 Angel Skin Orb, 100 Orichalcum Ingot, 120 Molybdenum Ingot).",
            "One signature each for just talking to: Aissaville (I-7), Illeuse (H-9), Daigraffeaux (I-11), Andagge (H-9), Louxiard (G-7), Machionage (C-6), Remiotte (L-10), Elnonde (K-9), Loillie (K-9) and Mailleronce (M-6).",
            "Quizzes, up to 6 each (no retry unless you get every answer wrong): Farouel (K-7): Smilodons, Tauri, Ghosts. Vichauxdat (I-8): Three, Gutrenders, Grradhod. Aurfet (G-9, upper level): Yrvaulair S Coussereaux, Febrenard C Brunnaut, Valaineral R Davilles, Knights of the Rustwing Hawk. Corseihaut (F-6): Uwe Prien, Mythril Musketeers, Klara Bester, Robel Akbel, Twelve, Choh Moui.",
            "Item trades: Eumielle (I-9) 12 for an Angler's Cassoulet; Coucheutand (I-8) 5/10/15 for an Orcish Axe/Orc Helm/Gold Orcmask; Hauberliond (H-9) 9-12 for 1-4 stacks of Crossbow Bolts; Sabiliont (I-11) 9-12 for 3-8 stacks of Gysahl Greens; Rongelouts N Distaud (I-9) 35 for a Gnole Claw plus three wins at his rock-paper-scissors (/point: use Nether Vellum, /think: Volcanic Rock, /poke: Scorpion Stinger).",
            "Return to Raustigne (I-7) and confirm your submission for a cutscene (zone first if needed; if you decline, zone and come back).",
        },
    },

    [21] = {
        name = "A Sanguinary Prelude",
        steps = {
            "Enter Beaucedine Glacier [S].",
        },
    },

    [22] = {
        name = "Dungeons and Dancers",
        steps = {
            "Examine " .. ACTOR.BEAUCEDINE_REGAL_PAWPRINTS_G9.text .. " (G-9) on the high ground southwest of the Campaign Arbiter, on the same level (don't go to the tower or down the ramp), for a cutscene.",
            "Examine them again to enter the Everbloom Hollow maze. You have 30 minutes, with warnings at 10, 5 and 1 minutes. If you fail, get another Aroma bug from Naoi's Regal Pawprints at (H-10).",
            "Everyone gets two Ratstail Explosives (carry up to 3) to blow open dead-end walls at their ???, and jars of Firesand for the colored detonators. Defeated Goblin Reavers leave a ??? with more explosives.",
            "Proceed northwest while keeping to the right-hand wall.",
            "Use a Ratstail Explosive on " .. ACTOR.DUNGEONS_DANCERS_EXPLOSIVE_WALL_HI9.text .. ".",
            "Use another Ratstail Explosive on " .. ACTOR.DUNGEONS_DANCERS_EXPLOSIVE_WALL_H8.text .. ".",
            "Go back and defeat the Goblin Reaver, then examine the ??? it leaves once per explosive until you have three.",
            "Use a Ratstail Explosive on " .. ACTOR.DUNGEONS_DANCERS_EXPLOSIVE_WALL_I9.text .. ".",
            "Examine " .. ACTOR.DUNGEONS_DANCERS_DEAD_END_J7.text .. ".",
            "Examine it again and place the jar of Firesand.",
            "Return to " .. ACTOR.DUNGEONS_DANCERS_GREEN_SWITCH_I7.text .. " and activate the switch.",
            "Return through the wall at " .. ACTOR.DUNGEONS_DANCERS_DEAD_END_J7.text .. " into Map 2. Make sure you have at least two explosives: no Goblin Reavers spawn there.",
            "Use a Ratstail Explosive on " .. ACTOR.DUNGEONS_DANCERS_EXPLOSIVE_WALL_G89.text .. ".",
            "Travel east and use another Ratstail Explosive on " .. ACTOR.DUNGEONS_DANCERS_EXPLOSIVE_WALL_I9_MAP2.text .. ".",
            "Examine " .. ACTOR.DUNGEONS_DANCERS_EXIT_QQ.text .. " to leave the battlefield.",
        },
    },

    [23] = {
        name = "Distorter of Time",
        steps = {
            "Go north from the Beaucedine Glacier [S] Campaign Arbiter to (H-7) and walk into the hole in the ground in the bottom right of the square.",
            "Examine " .. ACTOR.BEAUCEDINE_REGAL_PAWPRINTS_H7.text .. " just past where you drop to warp straight into Ruhotz Silvermines for the battle (30 minutes).",
            "Defeat Cait Sith Ceithir, a Black Mage. Mewing Lullaby sleeps everyone and resets TP; Eerie Eye inflicts Amnesia and Silence; Level ? Holy rolls dice for 150 to 1,500+ AoE damage (or nothing). He summons Atomos, whose Soul Vacuum drains about 50 from all your stats and passes them to Cait Sith.",
            "Lilisette fights with you and can be healed and buffed by anyone; if she dies, you lose. Solo with Trusts, staying out of range can avoid Level ? Holy.",
            "If you fail, get another Umbra bug from the Regal Pawprints under the tree root at (H-10), once per game day.",
        },
    },

    [24] = {
        name = "The Will of the World",
        steps = {
            "Speak with Raustigne in Southern San d'Oria [S] (I-7) for a cutscene. It can freeze with cutscene-skip or frame-rate addons; set the frame rate back to 30 if so.",
        },
    },

    [25] = {
        name = "Fate in Haze",
        steps = {
            "Continue your nation's quests: Bastok, Beneath the Mask and What Price Loyalty; San d'Oria, Songbirds in a Snowstorm and Blood of Heroes; Windurst, Sins of the Mothers and Howl from the Heavens.",
            "Travel to Southern San d'Oria [S].",
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. ".",
        },
    },

    [26] = {
        name = "The Scent of Battle",
        steps = {
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. " in Southern San d'Oria [S] (K-6) for a cutscene that starts the mission.",
            "Examine the Bulwark Gate in Sauromugue Champaign [S] (F-6) for a cutscene. The Sauromugue Champaign [S] Voidwatch warp puts you right there; otherwise take the Rolanberry Fields Survival Guide through the Maw and walk.",
        },
    },

    [27] = {
        name = "Another World",
        steps = {
            "Walk into present-day Southern San d'Oria from East Ronfaure for a cutscene.",
            "Speak with Halver in Chateau d'Oraguille (I-9) (you need to be allowed past Bacherume).",
            "The Voracious Resurgence Mission 3-1 and its epilogue quests take priority: if Halver sends you to Rahal, finish that first; after an epilogue cutscene, zone out and back in to continue.",
        },
    },

    -- ========================================================
    -- MISSIONS 28-37
    -- ========================================================

    [28] = {
        name = "A Hawk in Repose",
        steps = {
            "Buy a Lilac from Areebah at M & P's Market in Upper Jeuno (H-6) for 120 gil; buy two, since a later quest needs one too.",
            "Examine the Weathered Gravestone up the hill in present-day Batallia Downs (I-10) for a cutscene (The Eldieme Necropolis Survival Guide, then walk outside). If you only see \"You see the weathered gravestone\", another mission or quest is taking priority.",
            "Trade the Lilac to " .. ACTOR.WEATHERED_GRAVESTONE.text .. ".",
        },
    },

    [29] = {
        name = "The Battle of Xarcabard",
        steps = {
            "Zone into Xarcabard [S] for a cutscene.",
            "Examine " .. ACTOR.RALLY_RED.text .. " at (F-8), next to the sparkling spot.",
        },
    },

    [30] = {
        name = "Prelude to a Storm",
        steps = {
            "Examine " .. ACTOR.RALLY_GREEN.text .. " at (G-9) for a cutscene and the key item Magelight signal flare.",
            "Examine " .. ACTOR.SPELL_WORKED_SNOW.text .. " just southeast of it to enter the battlefield.",
            "Talk to Pesoso to start. Clear three rooms of weak monsters; the last one in each room flees to a wall and blows it open to the next room.",
            "When you get the message that all hostiles are cleared, talk to Pesoso near the third room to leave. If it doesn't come, go back to the first room: enemies from the third room wander toward it over time.",
            "Your reward depends on how fast you finished. If your inventory was full or you already had it, make space and examine Rally Point: Green again.",
        },
    },

    [31] = {
        name = "Storm's Crescendo",
        steps = {
            "Examine " .. ACTOR.RALLY_BLUE.text .. " at the northwest corner of (H-8) for the key item Alchemical signal flare (once per game day).",
            "Examine " .. ACTOR.EXCAVATED_SNOW.text .. " to your right to enter, and speak with Antje to begin. In a party, only one person should do it: others getting Flee cancels your own, and one win counts for everyone.",
            "Reach all 24 Republic Operatives while under Flee; each one refreshes your Flee and detonates a charge. Talking to one without Flee sends you back to Antje. The Flee job ability, Powder Boots (bring 5+) or gear that grants Flee can cover a gap, but then the operatives stop refreshing it.",
            "Each blast's smoke shows where the next operative is. The first is south of Antje and the circuit runs counter-clockwise. The Tigers don't remove Flee.",
            "After all 24, report to Captain Antje (your Flee can have worn off by then).",
            "Return to " .. ACTOR.RALLY_RED.text .. ".",
        },
    },

    [32] = {
        name = "Into the Beast's Maw",
        steps = {
            "Examine " .. ACTOR.RALLY_RED.text .. " at (F-8) for a cutscene.",
            "Enter Castle Zvahl Baileys [S] for a cutscene; touch its Survival Guide if you don't have it.",
            "Examine " .. ACTOR.PECULIAR_GLINT.text .. " at (G-7) for a cutscene and the key item Distress signal flare.",
            "Examine it again to enter the battlefield against Count Bifrons and four Orcs.",
            "Only Count Bifrons (black magic, Sleepga II) has to die. Sleep the Orcs at the start.",
        },
    },

    [33] = {
        name = "The Hunter Ensnared",
        steps = {
            "Examine " .. ACTOR.RALLY_RED.text .. " in Xarcabard [S] (F-8).",
        },
    },

    [34] = {
        name = "Flight of the Lion",
        steps = {
            "Examine the Bulwark Gate in Sauromugue Champaign [S] (F-6) for a cutscene with the survivors of Operation Snowstorm. Fastest is an Atmacite Refiner's Voidwatch warp from a past city; otherwise the Rolanberry Fields Survival Guide through the Maw.",
        },
    },

    [35] = {
        name = "Fall of the Hawk",
        steps = {
            "Enter Castle Zvahl Baileys [S] (its Survival Guide is fastest) for a cutscene.",
        },
    },

    [36] = {
        name = "Darkness Descends",
        steps = {
            "Go through Castle Zvahl Baileys [S] and Castle Zvahl Keep [S] (Castle Zvahl Keep [S] Home Point #1 if you have it) and zone into the Throne Room [S] for a cutscene.",
            "Examine the Throne Room door to enter the battlefield against Aquila and Haudrale.",
            "Aquila casts tier 3-4 nukes, Sleepga II and Dispelga, has en-spells, and his Altair Bullet is a cone with Paralyze and big knockback. Haudrale casts black magic and has a knockback weapon skill.",
            "Lilisette joins after about three minutes; if she falls, you lose.",
        },
    },

    [37] = {
        name = "Adieu, Lilisette",
        steps = {
            "Continue your nation's quests: Bastok, The Truth Lies Hid and Bonds of Mythril; San d'Oria, Chasing Shadows and Face of the Future; Windurst, Manifest Destiny and At Journey's End.",
            "Travel to Southern San d'Oria [S].",
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. ".",
        },
    },

    -- ========================================================
    -- MISSIONS 38-47
    -- ========================================================

    [38] = {
        name = "By the Fading Light",
        steps = {
            "Examine " .. ACTOR.RALLY_RED.text .. " in Xarcabard [S] (F-8) for a cutscene.",
        },
    },

    [39] = {
        name = "Edge of Existence",
        steps = {
            "Examine one of the Cavernous Maws for a cutscene; each zone's Survival Guide puts you right beside it:",
            "Batallia Downs: " .. ACTOR.MAW_BATALLIA.text .. ".",
            "Rolanberry Fields: " .. ACTOR.MAW_ROLANBERRY.text .. ".",
            "Sauromugue Champaign: " .. ACTOR.MAW_SAUROMUGUE.text .. ".",
        },
    },

    [40] = {
        name = "Her Memories",
        steps = {
            "Collect four Large memory fragments.",
            "First: complete Her Memories: Old Bean, Her Memories: The Faux Pas and Her Memories: Grave Resolve, then Her Memories: Homecoming Queen.",
            "Second: Her Memories: Of Malign Maladies (start it early: it has a game-day wait).",
            "Complete Her Memories: Operation Cupid to obtain the third Large Memory Fragment.",
            "Fourth, from the nation you're allied with in the past: Her Memories: Carnelian Footfalls (San d'Oria), Azure Footfalls (Bastok) or Verdure Footfalls (Windurst).",
            "With all four, you're told to return to Cait Sith and the next mission starts.",
        },
    },

    [41] = {
        name = "Forget Me Not",
        steps = {
            "Examine one of the Cavernous Maws for a cutscene; each zone's Survival Guide puts you right beside it. Unload cutscene-skipping addons first: they can disconnect you here.",
            "Batallia Downs: " .. ACTOR.MAW_BATALLIA.text .. ".",
            "Rolanberry Fields: " .. ACTOR.MAW_ROLANBERRY.text .. ".",
            "Sauromugue Champaign: " .. ACTOR.MAW_SAUROMUGUE.text .. ".",
        },
    },

    [42] = {
        name = "Pillar of Hope",
        steps = {
            "Unequip all weapons and your shield.",
            "Examine " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. " at Witchfire Glen in Grauberg [S] (F-5) for a cutscene. Use the Grauberg [S] Survival Guide or Campaign Arbiter warp and go northwest. With the Voidwatch quest Glimmer of Hope done, you can also enter the Walk of Echoes from Pashhow Marshlands [S] (J-9) and use its center Conflux.",
        },
    },

    [43] = {
        name = "Glimmer of Life",
        steps = {
            "Wait for the next game day and zone.",
            "Return to " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. ".",
            "Examine the Veridical Conflux again.",
            "While you wait, farm a Punch Bug for the next mission.",
        },
    },

    [44] = {
        name = "Time Slips Away",
        steps = {
            "Obtain a Punch Bug from Lou Carcolhs, Ancient Quadavs, Vajra Quadavs, or Gold Quadavs in Pashhow Marshlands [S] or Beadeaux [S].",
            "Trade the Punch Bug to " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. " in Grauberg [S] (F-5) for a cutscene and the key item Bottled punch bug.",
        },
    },

    [45] = {
        name = "When Wills Collide",
        steps = {
            "Examine " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. " to enter the Walk of Echoes.",
            "Examine " .. ACTOR.WALK_ORNATE_DOOR.text .. " north of the Veridical Conflux.",
            "Examine the Ornate Door again to enter the battlefield.",
            "Defeat the four Spitewardens: a Monk (Hundred Fists, Forlorn Strike); a Paladin (Invincible, Banishga) that shares hate with the third; a Dancer that heals, removes debuffs like Gravity and has a Doom gaze (turn away); and one using your weapon type and its weapon skills, with Essence Jack at low HP. When kiting with Gravity, kill the Dancer first.",
            "If you lose, you need another Punch Bug.",
        },
    },

    [46] = {
        name = "Whispers of Dawn",
        steps = {
            "Unequip all weapons and your shield.",
            "Examine " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. ".",
            "The next cutscene is here too, but only after the next game day and a zone.",
        },
    },

    [47] = {
        name = "A Dreamy Interlude",
        steps = {
            "After the required time has passed, change zones.",
            "Return to " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. ".",
            "Examine the Veridical Conflux for a cutscene. Instead of warping away while you wait, you can zone into the Walk of Echoes through the Conflux and come back.",
        },
    },

    -- ========================================================
    -- MISSIONS 48-53
    -- ========================================================

    [48] = {
        name = "Cait in the Woods",
        steps = {
            "Examine the Blank Target in East Ronfaure [S] (H-7, northwest corner of the square) for a cutscene and the key item Ronfaure dawndrop.",
        },
    },

    [49] = {
        name = "Fork in the Road",
        steps = {
            "The Ronfaure dawndrop is obtained automatically.",
            "Collect the other seven dawndrops (Blank Targets) in any order; leave the Walk of Echoes one for last, since the next mission is there. Tips: Jugner Forest [S] (I-6) is near the earlier Elegant Footprints, east of the river; La Vaule [S] (K-9) is next to a house; Southern San d'Oria [S] (K-6) is near the Lion Springs Tavern; Beaucedine Glacier [S] (H-9) is down the ramp from the Campaign Arbiter; Xarcabard [S] (F-8) is next to Rally Point: Red; the Throne Room [S] one is mid-walkway on the west side; the Walk of Echoes one is south of the Conflux.",
            ACTOR.JUGNER_DAWNDROP.text,
            ACTOR.LA_VAULE_DAWNDROP.text,
            ACTOR.SAN_DORIA_DAWNDROP.text,
            ACTOR.BEAUCEDINE_DAWNDROP.text,
            ACTOR.XARCABARD_DAWNDROP.text,
            ACTOR.THRONE_ROOM_DAWNDROP.text,
            ACTOR.WALK_DAWNDROP.text,
            "After all eight dawndrops have been obtained, they combine into the Primal glow.",
        },
    },

    [50] = {
        name = "Maiden of the Dusk",
        steps = {
            "Examine " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. " in Grauberg [S] (F-5) for a cutscene that takes you into the Walk of Echoes. If you got your last dawndrop inside the Walk, step out first and examine it from Grauberg.",
            "Examine " .. ACTOR.WALK_ORNATE_DOOR.text .. " north of the Veridical Conflux.",
            "Examine the Ornate Door again to enter the battlefield.",
            "First form: Lilith's melee hits everyone around her with knockback, one weapon skill dispels, and she casts AoE enfeebles, Comet and (low HP) Meteor. Under Trance she uses Fatal Attraction, a charm gaze; turn away. After she falls you return to the entrance to rest and rebuff.",
            "Second form, Lilith Ascendant: cone Dark Flare/Burst/Quake/Freeze/Tornado and Dark Moon (Weakness). She summons Elemental Gyves; don't stand in them and nuke them down, especially the black ones (Bio and a 5-second Doom), which appear in twos after Dark Moon. Below 50% she announces Dark Sun, an AoE Death in about 15 yalms: run.",
            "Winning gives a 10-minute cutscene. If you lose, wait for the next game day and examine the Conflux again for another Primal glow.",
        },
    },

    [51] = {
        name = "Where It All Began",
        steps = {
            "Examine " .. ACTOR.LION_SPRINGS_DOOR.text .. " in Southern San d'Oria [S] (K-6) for a cutscene and the key item Wedding invitation.",
        },
    },

    [52] = {
        name = "A Token of Troth",
        steps = {
            "Unequip your weapons and shield.",
            "Examine the Bulwark Gate in Sauromugue Champaign [S] (E-6) for a cutscene.",
            "Examine the Bulwark Gate again.",
        },
    },

    [53] = {
        name = "Lest We Forget",
        steps = {
            "Examine " .. ACTOR.VERIDICAL_CONFLUX_WOTG.text .. " in Grauberg [S] (F-5) for a cutscene.",
            "Your reward is a Moonshade Earring with one augment you choose from each of its two augment sets.",
        },
    },

}

return M