--[[
    Chains of Promathia - Mission Database
    ========================================

    M.MISSIONS:
        Official numeric mission IDs extracted from DAT 0xD9A7.

    M.STEPS:
        Existing walkthrough identifiers used by the Journal.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [101] = 'Ancient Flames Beckon',
    [110] = 'The Rites of Life',
    [118] = 'Below the Arks',
    [128] = 'The Mothercrystals',
    [137] = 'The Isle of Forgotten Saints',
    [138] = 'An Invitation West',
    [218] = 'The Lost City',
    [228] = 'Distant Beliefs',
    [238] = 'An Eternal Melody',
    [248] = 'Ancient Vows',
    [257] = 'A Transient Dream',
    [258] = 'The Call of the Wyrmking',
    [318] = 'A Vessel Without a Captain',
    [325] = 'The Road Forks',
    [330] = 'Emerald Waters',
    [331] = 'Vicissitudes',
    [335] = 'Descendants of a Line Lost',
    [339] = 'Louverance',
    [340] = 'Memories of a Maiden',
    [341] = 'Comedy of Errors, Act I',
    [345] = 'Comedy of Errors, Act II',
    [349] = 'Exit Stage Left',
    [350] = 'Tending Aged Wounds',
    [358] = 'Darkness Named',
    [367] = 'The Cradles of Children Lost',
    [368] = 'Sheltering Doubt',
    [418] = 'The Savage',
    [428] = 'The Secrets of Worship',
    [438] = 'Slanderous Utterings',
    [447] = 'The Return Home',
    [448] = 'The Enduring Tumult of War',
    [518] = 'Desires of Emptiness',
    [530] = 'Three Paths',
    [540] = 'Past Sins',
    [542] = 'Southern Legend',
    [543] = 'Partners Without Fame',
    [546] = 'A Century of Hardship',
    [549] = 'Departures',
    [550] = 'The Pursuit of Paradise',
    [552] = 'Spiral',
    [553] = 'Branded',
    [556] = 'Pride and Honor',
    [559] = 'And the Compass Guides',
    [560] = 'Where Messengers Gather',
    [562] = 'Entanglement',
    [564] = 'Head Wind',
    [568] = 'Flames for the Dead',
    [577] = 'Echoes of Time',
    [578] = 'For Whom the Verse Is Sung',
    [618] = 'A Place to Return',
    [628] = 'More Questions Than Answers',
    [638] = 'One to Be Feared',
    [647] = 'In the Light of the Crystal',
    [648] = 'Chains and Bonds',
    [718] = 'Flames in the Darkness',
    [728] = 'Fire in the Eyes of Men',
    [738] = 'Calm Before the Storm',
    [748] = 'The Warrior\'s Path',
    [758] = 'Emptiness Bleeds',
    [800] = 'Garden of Antiquity',
    [818] = 'A Fate Decided',
    [828] = 'When Angels Fall',
    [840] = 'Dawn',
    [850] = 'The Last Verse',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- CHAPTER 1
    -- ========================================================

    ['1-1'] = {
        name = "The Rites of Life",
        number = "1-1",
        mission_type = "Cutscene",
        reward = "Key Item: Mysterious amulet",
        steps = {
            "Enter Lower Delkfutt's Tower in Qufim Island.",
            "Travel to Upper Jeuno.",
            "Speak with " .. ACTOR.MONBERAUX.text .. " in the Infirmary.",
            "Receive the Mysterious Amulet.",
        },
    },

    ['1-2'] = {
        name = "Below the Arks",
        number = "1-2",
        mission_type = "Dungeon/BCNM",
        reward = "Access to Promyvions",
        steps = {
            "Travel to Ru'Lude Gardens and speak with " .. ACTOR.PHERIMOCIEL.text .. " at (G-6) in the Grand Duke's Palace.",
            "Visit the three Halls of Transference and enter Promyvion-Dem, Promyvion-Mea, and Promyvion-Holla in any order.",
            "Examine " .. ACTOR.LARGE_APPARATUS.text .. " when entering a Promyvion for the first time.",
            "Progress through the Promyvions by defeating Memory Receptacles and following the Memory Stream portals.",
            "Return to Ru'Lude Gardens and speak with " .. ACTOR.HARITH.text .. " for additional information about the Emptiness.",
        },
    },

    ['1-3'] = {
        name = "The Mothercrystals",
        number = "1-3",
        mission_type = "Dungeon/BCNM",
        reward = "Key Items: Light of Dem, Light of Holla, Light of Mea; access to the Tavnazian Archipelago",
        steps = {
            "Examine a Shattered Telepoint at one of the three Crags.",
            "At La Theine Plateau, examine " .. ACTOR.CRAG_HOLLA.text .. ".",
            "At Konschtat Highlands, examine " .. ACTOR.CRAG_DEM.text .. ".",
            "At Tahrongi Canyon, examine " .. ACTOR.CRAG_MEA.text .. ".",
            "Inside the Hall of Transference, examine the Large Apparatus on your left to enter Promyvion. Your log only changes to this mission after you clear the first Promyvion.",
            "Each Promyvion has 4 floors. To go up, defeat a Memory Receptacle; only one per floor opens the Memory Stream, so if none appears, try another (Widescan helps). Clear the Strays first, and stand with your back to a pillar against its Empty Seed knockback. Sneak and Invisible don't work: everything has true sight or true sound.",
            "Watch out for the level 139-142 Apex monsters (true sound) and go around them. To go back down a floor, use an empty receptacle platform.",
            "On the 4th floor, the spire zone lines are: Dem at (H-8) southwest of where you arrive, Holla at (K-8) straight north around a large hole, Mea at (I-6) southeast. Inside the spire, examine the Web of Recollections and choose \"Ancient Flames Beckon\". Summon Trusts only after passing the barrier, and buff inside: all buffs except food wear off.",
            "Reach the Spire of Dem and defeat Progenerator. Obtain the Light of Dem.",
            "Reach the Spire of Holla and defeat Wreaker. Obtain the Light of Holla.",
            "Reach the Spire of Mea and defeat Delver. Obtain the Light of Mea.",
            "After the third spire you appear in Lufaise Meadows (K-9) and Chapter 2 begins.",
        },
    },

    -- ========================================================
    -- CHAPTER 2
    -- ========================================================

    ['2-1'] = {
        name = "An Invitation West",
        number = "2-1",
        mission_type = "Cutscene",
        reward = "Key Item: Mysterious amulet",
        steps = {
            "After the third Promyvion you appear in Lufaise Meadows (K-9) for a cutscene.",
            "Head west to Tavnazian Safehold; its entrance is at (F-10). Orcs, Gigas and Bugards attack below about level 45; a mount avoids them all.",
            "Enter Tavnazian Safehold.",
            "The Swirling Vortex in the tunnel just east of where you arrived leads to Valkurm Dunes, so you can use it to come and go.",
        },
    },

    ['2-2'] = {
        name = "The Lost City",
        number = "2-2",
        mission_type = "Cutscene",
        reward = "Access to Phomiuna Aqueducts",
        steps = {
            "Travel to the top floor of Tavnazian Safehold.",
            "Examine " .. ACTOR.TAVNAZIAN_WALNUT_DOOR_K9.text .. " on the south side of the top floor. The other Walnut Door at (K-7) is the wrong one.",
            "Enter the room and speak with " .. ACTOR.DESPACHIAIRE.text .. ".",
            "Go back down the stairs to the main room and one more flight to the lowest level of the Safehold.",
            "Examine " .. ACTOR.SEWER_ENTRANCE.text .. " to enter the Phomiuna Aqueducts.",
            "Optional: Elysia (G-10) on the main floor starts the quest Unforgiven, which rewards a map of Tavnazian Safehold.",
        },
    },

    ['2-3'] = {
        name = "Distant Beliefs",
        number = "2-3",
        mission_type = "Cutscene/Fight",
        steps = {
            "Enter the Phomiuna Aqueducts through " .. ACTOR.SEWER_ENTRANCE.text .. " in Tavnazian Safehold.",
            "Use Sneak and Invisible while traveling through the aqueducts.",
            "Reach Map 2 from point A on Map 1 (point B won't work): climb the ladder at (F-6), go to (F-4) and drop to Map 2 (K-10), then head north. On Map 2, take the wooden ladder up at (I-6) and drop at (K-5) to reach the Minotaur at (J-2). The Taurus see with true sight but have a narrow view, so pass behind them.",
            "Defeat the Minotaur. Its Mortal Ray inflicts Doom on whoever stands in front of it facing it, so turn away quickly; Holy Water or Cursna may remove Doom (Trusts Mihli Aliapoh, Kupipi and Apururu cast Cursna). There is no cutscene, so leave before it respawns.",
            "Go to the Iron Gate at (G-8) on Map 2 (from the Minotaur, up the ladder at (K-5) and drop at (G-6)); don't fall into the water at (G-8). Open it with a Bronze Key from the Fomors, or a Thief can trade a Skeleton Key or Thief's Tools.",
            "Examine " .. ACTOR.WOODEN_LADDER.text .. " for a cutscene with Nag'molada, then climb up. If you only see yourself climbing, go back and make sure the Minotaur kill counted.",
            "Go left through the north door, down the hallway into the first room (its Fomors link). Circle right around the bookshelves to the ??? in the southwest corner; it opens a one-way door on the south side. The ??? straight ahead on the east wall is a trap that drops you out.",
            "In the hallway, use Tab to target the oil lamps on the walls (don't take the farthest one and walk into the room beyond: it's one-way). Examine the lamp for today's element and the one today's element is strong against (Firesday: Fire and Ice) within a few seconds of each other to open the west door.",
            "Proceed through the opened passage and examine " .. ACTOR.ORNATE_GATE.text .. ".",
            "Leave the aqueducts and speak with Justinius at (J-6) on the top floor of Tavnazian Safehold (Home Point #3). This cutscene freezes above 30 FPS or with cutscene-skipping addons, so set the frame rate back to 30 first.",
        },
    },

    ['2-4'] = {
        name = "An Eternal Melody",
        number = "2-4",
        mission_type = "Cutscene",
        reward = "Key Item: Mysterious amulet; access to Riverne - Site #A01",
        steps = {
            "Travel to the top floor of Tavnazian Safehold.",
            "Examine " .. ACTOR.TAVNAZIAN_WALNUT_DOOR_K7.text .. ".",
            "Speak with " .. ACTOR.JUSTINIUS.text .. " for additional information about Ulmia.",
            "Travel to Misareaux Coast.",
            "Examine " .. ACTOR.DILAPIDATED_GATE.text .. " at (I-11).",
            "Return to Tavnazian Safehold and approach the bridge around (H/I-8).",
        },
    },

    ['2-5'] = {
        name = "Ancient Vows",
        number = "2-5",
        mission_type = "Dungeon/BCNM",
        reward = "1,000 Experience/Limit Points",
        steps = {
            "Head to the Dilapidated Gate in Misareaux Coast at (F-7).",
            "Examine " .. ACTOR.DILAPIDATED_GATE.text .. ".",
            "Travel through Riverne - Site #A01.",
            "Use the " .. ACTOR.SPATIAL_DISPLACEMENT.text .. " to progress through the area.",
            "Defeat Firedrakes and obtain two Giant Scales.",
            "Use Prism Powder while traveling through areas guarded by True Sight Hippogryphs.",
            "Trade one Giant Scale to " .. ACTOR.UNSTABLE_DISPLACEMENT_G10.text .. ".",
            "Trade the second Giant Scale to " .. ACTOR.UNSTABLE_DISPLACEMENT_E10.text .. ".",
            "Continue north through the opened route into Monarch Linn.",
            "Enter the Ancient Vows battlefield.",
            "Defeat the three Mammet-19 Epsilon.",
        },
    },

    -- ========================================================
    -- CHAPTER 3
    -- ========================================================

    ['3-1'] = {
        name = "The Call of the Wyrmking",
        number = "3-1",
        mission_type = "Cutscene",
        steps = {
            "After the Mammet fight you appear in South Gustaberg near the lighthouse.",
            "Go to the airship dock in Port Bastok (Home Point #3 is closest) and walk up to " .. ACTOR.AIRSHIP_DEPARTURES.text .. " at (F-7) for a cutscene. It's outside the building, you don't need a pass, and it's easy to run past the trigger spot.",
            "Enter the Metalworks and speak with " .. ACTOR.CID.text .. " on the second floor.",
        },
    },

    ['3-2'] = {
        name = "A Vessel Without a Captain",
        number = "3-2",
        mission_type = "Cutscene",
        steps = {
            "Travel to Lower Jeuno.",
            "Enter Neptune's Spire and examine " .. ACTOR.NEPTUNES_SPIRE_TENSHODO_DOOR.text .. ".",
            "Travel to Ru'Lude Gardens.",
            "Approach the " .. ACTOR.AUDIENCE_CHAMBER.text .. " in the Grand Duke's Palace.",
        },
    },

    ['3-3'] = {
        name = "The Road Forks",
        number = "3-3",
        mission_type = "Cutscene/Quest/Fight",
        steps = {
            "Speak with " .. ACTOR.CID.text .. " in Bastok Metalworks and complete the San d'Oria and Windurst paths in either order.",

            "San d'Oria Path: enter Northern San d'Oria and speak with " .. ACTOR.ARNAU.text .. ", then speak with " .. ACTOR.CHASALVIGE.text .. " in the Cathedral's Manuscript Room.",
            "Travel to Carpenters' Landing through the (E-6) entrance from Jugner Forest and speak with " .. ACTOR.GUILLOUD.text .. " to face Overgrown Ivy.",
            "Defeat Overgrown Ivy, then speak with " .. ACTOR.GUILLOUD.text .. " again before leaving Carpenters' Landing.",
            "Travel to Southern San d'Oria and speak with " .. ACTOR.HINAREE.text .. " in the Count's Manor.",

            "Windurst Path: enter Windurst Waters and speak with " .. ACTOR.OHBIRU_DOHBIRU.text .. ", then speak with " .. ACTOR.YORAN_ORAN.text .. " and " .. ACTOR.KYUME_ROMEH.text .. ".",
            "Speak with " .. ACTOR.HONOI_GOMOI.text .. " to obtain the Cracked Mimeo Mirror, then return to " .. ACTOR.YORAN_ORAN.text .. ".",
            "Travel to Attohwa Chasm and examine the Loose Sand around (K-8), defeat Lioumere, then examine the Loose Sand again to obtain the Mimeo Jewel.",
            "Climb Parradamo Tor and reach the Cradle of Rebirth within 12 Vana'diel hours and 30 Vana'diel minutes. Obtain the Mimeo Feather, Second Mimeo Feather, and Third Mimeo Feather.",
            "Return to " .. ACTOR.YORAN_ORAN.text .. ", then speak with " .. ACTOR.YUJUJU.text .. " in Port Windurst and " .. ACTOR.TOSUKA_PORUKA.text .. " in Windurst Waters.",
            "Return to " .. ACTOR.YORAN_ORAN.text .. " to complete the Windurst path.",
            "Return to " .. ACTOR.CID.text .. " in the Metalworks after both paths are complete.",
        },
    },

    ['3-4'] = {
        name = "Tending Aged Wounds",
        number = "3-4",
        mission_type = "Cutscene",
        steps = {
            "Travel to Lower Jeuno.",
            "Enter Neptune's Spire and examine " .. ACTOR.NEPTUNES_SPIRE_TENSHODO_DOOR.text .. ".",
        },
    },

    ['3-5'] = {
        name = "Darkness Named",
        number = "3-5",
        mission_type = "Dungeon/BCNM",
        reward = "Key Item: Pso'Xja pass; Waking Dreams access; access to Dreamworld Dynamis areas",
        steps = {
            "Travel to Upper Jeuno and speak with " .. ACTOR.MONBERAUX.text .. " in the Infirmary.",
            "Speak with Ghebi Damomohe inside Neptune's Spire in Lower Jeuno.",
            "Everyone in the party needs a Pso'Xja pass: trade Ghebi Damomohe any colored chip and she gives the pass and 500 gil. Get chips from the monsters in Pso'Xja via Beaucedine Glacier: the Diremites in the first room from the (H-8) entrance drop Gray Chips (the Beaucedine Survival Guide is closest), the Nue entrance (F-7) is the best farm, and the Mimics past the (G-9) entrance often drop Cyan Chips.",
            "With the pass, enter Pso'Xja at (H-8) and follow the single path to the central room. Each colored wall you pass zones you and removes buffs, so only bother with Sneak and Invisible.",
            "Pass through the colored walls at (H-7) and (I-7) in this order: Red, Black/Purple, Red, Black/Purple.",
            "After the last wall, take the elevator that appears at (H-8) to the bottom. You can't open the map down there: ignore the teleporter pad, go into the T-shaped hallway opposite it and turn left to the Stone Gate into The Shrouded Maw (right is a dead end).",
            "Register the Home Point immediately beyond the Stone Gate.",
            "Rest and prepare for the battlefield.",
            "Examine " .. ACTOR.MEMENTO_CIRCLE.text .. " and enter the battlefield \"Darkness Named\". Buffs wear off when you enter.",
            "Defeat Diabolos.",
            "Return to Upper Jeuno and speak with " .. ACTOR.MONBERAUX.text .. ".",
            "Optional: Kerutoto in Windurst Waters (J-8) now offers Waking Dreams, which can unlock Diabolos as an avatar.",
        },
    },

    -- ========================================================
    -- CHAPTER 4
    -- ========================================================

    ['4-1'] = {
        name = "Sheltering Doubt",
        number = "4-1",
        mission_type = "Cutscene",
        reward = "Access to Riverne - Site B01",
        steps = {
            "Travel to Tavnazian Safehold.",
            "Speak with " .. ACTOR.DESPACHIAIRE.text .. ".",
            "Speak with " .. ACTOR.JUSTINIUS.text .. " for additional information.",
            "Travel to Misareaux Coast and examine " .. ACTOR.DILAPIDATED_GATE.text .. " at (I-11).",
        },
    },

    ['4-2'] = {
        name = "The Savage",
        number = "4-2",
        mission_type = "Dungeon/BCNM",
        reward = "Access to Sacrarium",
        steps = {
            "Travel to Misareaux Coast.",
            "Examine the " .. ACTOR.SPATIAL_DISPLACEMENT.text .. " around (D-6).",
            "Travel through Riverne - Site B01.",
            "Obtain one Giant Scale if necessary.",
            "Trade the Giant Scale to " .. ACTOR.UNSTABLE_DISPLACEMENT_B01_G8.text .. ".",
            "Continue through Riverne until you reach " .. ACTOR.SPATIAL_DISPLACEMENT.text .. ".",
            "Examine the Spatial Displacement to enter the Ouryu battlefield.",
            "Defeat Ouryu.",
            "Use Mistmelts when Ouryu takes flight.",
            "Return to Tavnazian Safehold and speak with " .. ACTOR.JUSTINIUS.text .. ".",
        },
    },

    ['4-3'] = {
        name = "The Secrets of Worship",
        number = "4-3",
        mission_type = "Dungeon/Fight",
        steps = {
            "Speak with " .. ACTOR.JUSTINIUS.text .. " in Tavnazian Safehold.",
            "Examine " .. ACTOR.TAVNAZIAN_WALNUT_DOOR_K7.text .. ".",
            "Go to Misareaux Coast (G-4) (Home Point #1 is close) and examine the Iron Gate for a cutscene and to enter the Sacrarium. Be ready to recast Sneak often; at level 60+ Trusts make this easy solo. Watch your Fomor Hate.",
            "Inside, go to the maze in the southeast part of Map 1. Its layout changes with the game day; follow the map for today to connection point B, which puts you in the southwest of Map 2.",
            "To pass the double-keyhole door at (H-7) on Map 2 you need either the key item Temple Knight key or two Coral Crest Keys plus a Sealion Crest Key. Solo: farm a Coral Crest Key (rare drop from Map 2 Fomors) and the Sealion Crest Key (NM Keremet, night 20:00-04:00 only, with 12 weak Azren Kuba skeletons along its hallways) and trade them to Quelveuiat in Tavnazian Safehold (I-10) for the Temple Knight key via the quest A Hard Day's Knight. Or ask someone who has it to open the door.",
            "With keys instead: one person trades a Coral Crest Key to the small keyhole and, right after the click, someone trades the Sealion Crest Key to the large one. The Coral Crest Key breaks, and if the timing is missed you need another.",
            "Past the door, take the right fork to " .. ACTOR.WOODEN_GATE.text .. " at (G-8) for a cutscene.",
            "Go back out through the keyhole door. Old Professor Mariselle spawns from a random ??? on a desk in one of the six classrooms (three north, three south); try each one. Only players on this mission can spawn it. Clear the room's Fomors first: spawning drops Sneak.",
            "Check " .. ACTOR.SACRARIUM_QQ_F5.text .. ".",
            "Check " .. ACTOR.SACRARIUM_QQ_G5.text .. ".",
            "Check " .. ACTOR.SACRARIUM_QQ_H5.text .. ".",
            "Check " .. ACTOR.SACRARIUM_QQ_F11.text .. ".",
            "Check " .. ACTOR.SACRARIUM_QQ_G11.text .. ".",
            "Check " .. ACTOR.SACRARIUM_QQ_H11.text .. ".",
            "Defeat Old Professor Mariselle (it warps around the room) and the two Mariselle's Pupils.",
            "Everyone on the mission examines the ??? again for the key item Reliquiarium key.",
            "Return to the door at (H-7): the Temple Knight key lets you straight through; otherwise use the second Coral Crest Key and the Sealion Crest Key again (or leave someone inside to open it with the switch).",
            "Enter the opened passage and examine " .. ACTOR.WOODEN_GATE.text .. " again.",
        },
    },

    ['4-4'] = {
        name = "Slanderous Utterings",
        number = "4-4",
        mission_type = "Cutscene",
        steps = {
            "Travel to Tavnazian Safehold and speak with " .. ACTOR.DESPACHIAIRE.text .. ".",
            "Proceed to Sealion's Den.",
            "Examine " .. ACTOR.SEALION_IRON_GATE.text .. ".",
        },
    },

    -- ========================================================
    -- CHAPTER 5
    -- ========================================================

    ['5-1'] = {
        name = "The Enduring Tumult of War",
        number = "5-1",
        mission_type = "Cutscene/Fight",
        reward = "Access to Promyvion - Vahzl",
        steps = {
            "Travel to Port Bastok.",
            "Speak with " .. ACTOR.CID.text .. " in Metalworks.",
            "Enter Pso'Xja from the (F-7) entrance in Beaucedine Glacier.",
            "Follow the path without dropping down until you reach " .. ACTOR.PSOXJA_STONE_DOOR_H8.text .. ".",
            "Examine the Stone Door to face Nunyunuwi.",
            "Defeat Nunyunuwi, then examine " .. ACTOR.PSOXJA_STONE_DOOR_H8.text .. " again.",
            "Take the elevator to the bottom level.",
            "Follow the hallway to the next Stone Door.",
            "Examine the Stone Door to enter Promyvion-Vahzl.",
        },
    },

    ['5-2'] = {
        name = "Desires of Emptiness",
        number = "5-2",
        mission_type = "Dungeon/Fight/BCNM",
        reward = "Key Item: Light of Vahzl",
        steps = {
            "Enter Promyvion-Vahzl.",
            "Avoid the level 140 Apex Idle Drifters, Woeful Lamenters and Livid Ragers (true hearing); set up Reraise in case. Clear floors 1 and 2 through the Memory Receptacles as in the first Promyvions.",
            "Reach the Memory Flux around (J-8) on the third floor.",
            "Examine " .. ACTOR.MEMORY_FLUX.text .. ".",
            "Defeat the Propagator, then examine the Memory Flux again for a cutscene. Don't examine the Flux while the NM is up: you'll be stuck in a cutscene while it hits you. After each flux cutscene, the Stone Door in Pso'Xja offers a teleport straight back to that flux.",
            "Use the Memory Receptacle to reach the fourth floor.",
            "On the fourth floor go straight east to the Memory Flux at (M-6).",
            "Examine the Memory Flux.",
            "Defeat Solicitor.",
            "Examine the Memory Flux again.",
            "Use the Memory Receptacle to reach the fifth floor.",
            "On the fifth floor the Memory Flux is at (D-6), northwest of where you start.",
            "Examine the Memory Flux.",
            "Defeat Ponderer.",
            "Examine the Memory Flux again.",
            "Zone into the Spire of Vahzl at (F-8). You can only cross to the Web of Recollections if you got all three flux cutscenes.",
            "Examine the Web of Recollections and enter \"Desires of Emptiness\"; buff inside. If the cutscene stops with an addon or high frame rate, set the frame rate back to 30.",
            "Defeat Procreator, Cumulator, and Agonizer.",
            "You return to Beaucedine Glacier afterwards.",
            "Return to " .. ACTOR.CID.text .. ".",
        },
    },

    ['5-3'] = {
        name = "Three Paths",
        number = "5-3",
        mission_type = "Louverance's Path: Cutscene/BCNM; Tenzen's Path: Cutscene/Fight; Ulmia's Path: Cutscene/BCNM",
        steps = {
            "Travel to Bastok Metalworks and speak with " .. ACTOR.CID.text .. ". Complete the three paths in any order.",

            "Past Sins: travel to Tavnazian Safehold and speak with " .. ACTOR.DESPACHIAIRE.text .. ", then travel to Windurst Woods and speak with Perih Vashai at (K-7).",
            "Travel to Bibiki Bay, reach Purgonorgo Isle, and examine " .. ACTOR.PURGONORGO_QQ.text .. ". Speak with Yoran-Oran at (E-5) in Windurst Walls for additional dialogue.",
            "Zone into Oldton Movalpolos, then travel to Mine Shaft #2716 and face Chekochuk, Movamuq, Swipostik, Trikotrak, and Bugbby.",
            "Defeat all five opponents, return to " .. ACTOR.CID.text .. ", then travel to Newton Movalpolos and obtain a Gold Key.",
            "Return to " .. ACTOR.MINE_SHAFT_2716.text .. " and trade the Gold Key to the Shaft Entrance, then return to " .. ACTOR.CID.text .. ".",

            "The Pursuit of Paradise: travel to La Theine Plateau and examine " .. ACTOR.LA_THEINE_COP_QQ_G6.text .. ".",
            "Enter Pso'Xja through the tower at (J-8) in Beaucedine Glacier, pass through the sixteen Stone Doors, descend the elevator, and examine the Avatar Gate.",
            "Travel to Upper Jeuno and speak with " .. ACTOR.MONBERAUX.text .. " to receive the Envelope, then travel to Ru'Lude Gardens and speak with " .. ACTOR.PHERIMOCIEL.text .. " at (G-6).",
            "Return to Upper Jeuno and speak with " .. ACTOR.MONBERAUX.text .. " again. Enter Batallia Downs and examine the ??? near (K-8) twice to obtain the Delkfutt Recognition Device.",
            "Enter Lower Delkfutt's Tower, examine the Cermet Door at (H-5), defeat Disaster Idol, and examine the Cermet Door again.",
            "Return to Pso'Xja through the (H-10) entrance in Beaucedine Glacier, follow the right wall to (I-8), pass through the wall, drop down, take the elevator to the Avatar Gate, and examine it before returning to " .. ACTOR.CID.text .. ".",

            "Where Messengers Gather: travel to Southern San d'Oria and speak with " .. ACTOR.HINAREE.text .. ", then zone into Port San d'Oria and speak with " .. ACTOR.CHASALVIGE.text .. " in Northern San d'Oria.",
            "Travel to Windurst Waters and speak with " .. ACTOR.KERUTOTO.text .. " at (J-8), then speak with " .. ACTOR.YORAN_ORAN.text .. " in Windurst Walls.",
            "Enter Boneyard Gully in Attohwa Chasm and defeat Shikaree X, Shikaree Y, and Shikaree Z.",
            "Travel to Uleguerand Range and enter Bearclaw Pinnacle through the hole at (J-9). Enter the Flames for the Dead battlefield and defeat Snoll Tzar.",
            "Use Shu'Meyo Salt during the battle to extend the time available when needed, then return to " .. ACTOR.CID.text .. " after all three paths are complete.",
        },
    },

    -- ========================================================
    -- CHAPTER 6
    -- ========================================================

    ['6-1'] = {
        name = "For Whom the Verse Is Sung",
        number = "6-1",
        mission_type = "Cutscene",
        steps = {
            "Travel to Ru'Lude Gardens.",
            "Speak with " .. ACTOR.PHERIMOCIEL.text .. " at (G-6).",
            "Travel to Upper Jeuno and examine " .. ACTOR.MARBLE_BRIDGE.text .. ".",
            "Return to Ru'Lude Gardens.",
        },
    },

    ['6-2'] = {
        name = "A Place to Return",
        number = "6-2",
        mission_type = "Fight",
        steps = {
            "Travel to Ru'Lude Gardens.",
            "Approach the " .. ACTOR.PALACE.text .. ".",
            "Speak with " .. ACTOR.PHERIMOCIEL.text .. " at (G-6).",
            "Travel to Misareaux Coast at (I-11).",
            "Examine " .. ACTOR.DILAPIDATED_GATE.text .. ".",
            "Defeat Warder Thalia, Warder Aglaia and Warder Euphrosyne. They can be slept and fought one at a time, though they start resisting Sleep; all three must die.",
            "Examine " .. ACTOR.DILAPIDATED_GATE.text .. " again.",
        },
    },

    ['6-3'] = {
        name = "More Questions Than Answers",
        number = "6-3",
        mission_type = "Cutscene",
        steps = {
            "Travel to Ru'Lude Gardens.",
            "Speak with " .. ACTOR.PHERIMOCIEL.text .. " at (G-6).",
            "Go upstairs and examine the " .. ACTOR.AUDIENCE_CHAMBER.text .. ".",
            "Travel to Selbina.",
            "Speak with " .. ACTOR.MATHILDE.text .. " in the Weaver's Guild.",
        },
    },

    ['6-4'] = {
        name = "One to Be Feared",
        number = "6-4",
        mission_type = "BCNM",
        reward = "Ducal Guard's Ring",
        steps = {
            "Travel to Bastok Metalworks and speak with " .. ACTOR.CID.text .. ".",
            "Go to Sealion's Den, at the bottom of the stone ramps near Tavnazian Safehold Home Point #2, for a cutscene on entering.",
            "Examine " .. ACTOR.SEALION_IRON_GATE.text .. ".",
            "You're taken aboard the airship. Examine its door for another cutscene and the battlefield \"One to be Feared\" (45-minute limit; buffs wear off on entering). When one person clicks the door, the whole party is pulled in, so be ready.",
            "Enter the battlefield and defeat the five Mammet-22 Zeta.",
            "After each stage you return to the airship deck with HP and MP restored; buff up and click the door for the next stage.",
            "Defeat Omega.",
            "Defeat Ultima.",
            "Winning puts you at the Dilapidated Gate in Lufaise Meadows for a cutscene and the Ducal Guard's Ring.",
            "Optional: speak with Taillegeas in Ru'Lude Gardens (I-7, Dining Hall) to learn Trust: Cherukiki.",
        },
    },

    -- ========================================================
    -- CHAPTER 7
    -- ========================================================

    ['7-1'] = {
        name = "Chains and Bonds",
        number = "7-1",
        mission_type = "Cutscene",
        steps = {
            "Travel to Tavnazian Safehold.",
            "Complete the three objectives in any order.",
            "Enter Sealion's Den.",
            "Exit Sealion's Den and examine the Phomiuna Aqueducts entrance on the bottom floor.",
            "Return to the top floor of Tavnazian Safehold.",
            "Examine " .. ACTOR.TAVNAZIAN_WALNUT_DOOR_K7.text .. ".",
        },
    },

    ['7-2'] = {
        name = "Flames in the Darkness",
        number = "7-2",
        mission_type = "Cutscene",
        steps = {
            "Travel to Misareaux Coast.",
            "Examine " .. ACTOR.DILAPIDATED_GATE.text .. " around (F-7).",
            "Return to Tavnazian Safehold and enter Sealion's Den.",
            "Speak with " .. ACTOR.SUELEEN.text .. ".",
            "Travel to Ru'Lude Gardens and approach the " .. ACTOR.PALACE.text .. ".",
            "Travel to Upper Jeuno.",
            "Examine " .. ACTOR.MARBLE_BRIDGE.text .. ".",
        },
    },

    ['7-3'] = {
        name = "Fire in the Eyes of Men",
        number = "7-3",
        mission_type = "Cutscene",
        steps = {
            "Travel to Oldton or Newton Movalpolos.",
            "Examine " .. ACTOR.MINE_SHAFT_2716.text .. ".",
            "Return to Bastok Metalworks and speak with " .. ACTOR.CID.text .. ".",
            "Wait one Vana'diel day.",
            "Speak with " .. ACTOR.CID.text .. " again.",
        },
    },

    ['7-4'] = {
        name = "Calm Before the Storm",
        number = "7-4",
        mission_type = "Cutscene/Fight",
        steps = {
            "Travel to Bastok Metalworks and speak with " .. ACTOR.CID.text .. ".",
            "Fight the three NMs in any order. If you zone before examining the spot again after a fight, the fight resets.",
            "Misareaux Coast (E-7) (Unity Warp level 122 is close): examine the Storage Compartment to spawn Boggelmann, a Bugard with high defense that uses Blood Weapon. Examine it again afterwards for a cutscene and the key item Vessel of light.",
            "Carpenters' Landing (enter from Jugner Forest J-8; the Survival Guide is fastest): examine the ??? by the water at (I-9) to spawn the Cryptonberry Executor (NIN), joined shortly by three Cryptonberry Assassins (THF, SMN, BLM) that use their two-hour abilities. Kill the Executor first and fast to avoid Mijin Gakure, then the Summoner, keeping HP high. Examine the ??? again afterwards.",
            "Bibiki Bay (F-6) (Survival Guide or Unity Warp level 119): examine the ??? inside the cave to spawn Dalham, a Kraken that attacks more times per round as its HP drops. Examine the ??? again afterwards.",
            "Return to Cid in the Metalworks for the letters from Ulmia and Prishe.",
            "Speak with Sueleen in Sealion's Den (H-6), near Tavnazian Safehold Home Point #2, for a cutscene. Note: if you plan to finish Rhapsodies of Vana'diel soon, A Fate Decided is your last chance before Dawn.",
        },
    },

    ['7-5'] = {
        name = "The Warrior's Path",
        number = "7-5",
        mission_type = "BCNM",
        reward = "Key Item: Light of Al'Taieu; access to Al'Taieu; access to Limbus",
        steps = {
            "Travel to Sealion's Den.",
            "Examine " .. ACTOR.SEALION_IRON_GATE.text .. " for a cutscene, then again to enter \"The Warrior's Path\". Buff inside, and note you can't leave until you win or lose.",
            "Defeat Tenzen (level 70, about 15,000 HP) and his three helpers (RNG, BLM, WHM, level 67). If he lands all his weapon skills during Meikyo Shisui he creates the level 4 skillchain Cosmic Elucidation and ejects you, so interrupt or burst him down.",
            "Winning gives a cutscene and puts you in Al'Taieu.",
        },
    },

    -- ========================================================
    -- CHAPTER 8
    -- ========================================================

    ['8-1'] = {
        name = "Garden of Antiquity",
        number = "8-1",
        mission_type = "Fight",
        reward = "Tavnazian Ring",
        steps = {
            "Travel to Al'Taieu.",
            "Examine the Crystalline Field at (H-11) in Al'Taieu for a brief cutscene. The Auroral Updraft at (H-12) (red pillar of light) takes you to Sealion's Den, and Sueleen there sends you back.",
            "Examine each of the three Rubious Crystals to spawn three Ru'aern NMs, defeat them and examine the crystal again for a cutscene. The Auroral Updrafts at (E-8) and (L-8) take you back to (H-12) to save running, but count as zoning (buffs and Trusts are lost). If others just used a crystal, it says \"nothing of interest\" for up to two minutes.",
            "First Rubious Crystal:",
            "Travel to the Rubious Crystal at (D-10).",
            "Examine " .. ACTOR.RUBIOUS_CRYSTAL_D10.text .. ".",
            "Defeat the three Ru'aern.",
            "Examine the Rubious Crystal again.",
            "Second Rubious Crystal:",
            "Travel to the Rubious Crystal at (H-13).",
            "Examine " .. ACTOR.RUBIOUS_CRYSTAL_H13.text .. ".",
            "Defeat the three Ru'aern.",
            "Examine the Rubious Crystal again.",
            "Third Rubious Crystal:",
            "Travel to the Rubious Crystal at (L-10).",
            "Examine " .. ACTOR.RUBIOUS_CRYSTAL_L10.text .. ".",
            "Defeat the three Ru'aern.",
            "Examine the Rubious Crystal again.",
            "Return to " .. ACTOR.CRYSTALLINE_FIELD.text .. " and enter the Grand Palace of Hu'Xzoi.",
            "Inside, examine the Gate of the Gods for a cutscene and your reward.",
            "Examine the east " .. ACTOR.PARTICLE_GATE.text .. " at (H-8) for a cutscene that completes the mission. Touch the Home Point nearby for later missions.",
        },
    },

    ['8-2'] = {
        name = "A Fate Decided",
        number = "8-2",
        mission_type = "Dungeon/Fight",
        steps = {
            "You can't save progress on this mission: if you wipe without Reraise or have to quit, you start over. At level 99 the escort takes 30-40 minutes solo. This is your last chance to progress Rhapsodies of Vana'diel until after Dawn.",
            "Enter the Grand Palace of Hu'Xzoi.",
            "Examine " .. ACTOR.PARTICLE_GATE.text .. " at (H-8).",
            "Escort the Quasilumin from (J-8) to the transporter at (L-7).",
            "Continue to the escort point at (L-8) on the second map.",
            "Continue to the escort point at (I-10).",
            "Follow the route to the transporter at (G-12).",
            "Continue to the escort point at (G-10) on the first map.",
            "Use the transporter at (G-4) to return to the second map.",
            "Continue to (H-8) and examine " .. ACTOR.CERMET_PORTAL.text .. ".",
            "Defeat Ix'ghrah.",
            "Examine the Cermet Portal again.",
            "Continue to " .. ACTOR.GATE_OF_THE_GODS.text .. " and travel toward the Garden of Ru'Hmet.",
        },
    },

    ['8-3'] = {
        name = "When Angels Fall",
        number = "8-3",
        mission_type = "Dungeon/BCNM",
        steps = {
            "Enter the Garden of Ru'Hmet.",
            "First examine the Gate of the Gods next to the Home Point for a cutscene; without it you can't reach floors 3-4.",
            "Climb to the 4th floor of your race's tower (the five points of the map): Hume north (Light of Vahzl), Elvaan east (Light of Mea), Mithra west (Light of Dem), Tarutaru southwest (Light of Holla), Galka southeast (Light of Al'Taieu). Any tower's panel progresses the mission, but only your own gives the extra cutscene and title.",
            "Examine " .. ACTOR.EBON_PANEL.text .. " twice to obtain the race-specific key item.",
            "Go to the central area of the first floor. You can't reach the elevator directly: go around east, north, then west to come at it from the other side. Four spinning Qn'zdei guard each side; the doors stay open while they sit on their pedestals. They only see (true sight) from the side with the large blue eye and can't be slept, so hug the wall to pass; if a door shuts, kill them and wait for the 5-minute respawn.",
            "Touch the Home Point in front of the elevator ramp, then step on the platform and ascend to the second floor.",
            "On the second floor (Map 2), get the key item Brand of Dawn to the north (shorter) and Brand of Twilight to the south (longer path). The Warp Distortions dismiss Trusts. Warping out and returning by Home Point saves time between them.",
            "With both brands, ascend twice from the central elevator to the third floor.",
            "Examine " .. ACTOR.PARTICLE_GATE.text .. " for a cutscene, then again to enter the battlefield.",
            "Defeat four Ix'zdei: two large ones (RDM) and two small ones (BLM). All are immune to Silence and resist Sleep heavily (Elemental Seal needed). A low-HP pot may flee to its spawn point and regenerate to full in a few seconds; Stun or weapon skills can stop it. If you die, do so by the south door and wait for the pots to reset before Reraising.",
            "Cross the empty room and examine the Luminous Convergence for a cutscene.",
            "Exit through the Particle Gate at the south side of the room, choose \"Leave the Garden of Ru'Hmet\" and \"Yes\" to return to the Grand Palace.",
            "Head south and zone into Al'Taieu for a cutscene that completes the mission.",
        },
    },

    ['8-4'] = {
        name = "Dawn",
        number = "8-4",
        mission_type = "BCNM - Finale",
        reward = "One of: Rajas Ring, Sattva Ring, Tamas Ring",
        steps = {
            "Warp to The Garden of Ru'Hmet Home Point #1 and pass through the Cermet Portal to the main elevator.",
            "Choose to descend to zone into Empyreal Paradox.",
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. ".",
            "Examine the Transcendental Radiance again to enter the Dawn battlefield.",
            "Defeat Promathia (two forms; you can rest between them). Prishe and Selh'teus fight with you. Prishe can be healed and raised. Selh'teus heals himself, and his Luminous Lance stuns Promathia; if he is KO'd, you lose at once, as you do if the whole party falls. Promathia has low evasion and is immune to Stun.",
            "-- EPILOGUE --",
            "Wait until after Japanese midnight.",
            "These epilogue scenes can be done in any order. Louverance: speak with Hinaree in Southern San d'Oria (B-6) (Home Point #4), zone into Uleguerand Range, then approach Count Caffaule's Manor (B-6) in Southern San d'Oria.",
            "Chebukkis: speak with Chipmy-Popmy at the Fishing Guild in Port Windurst (C-8) until he mentions Purgonorgo Isle, then go to Purgonorgo Isle (ferry from Bibiki Bay) and examine the ??? Warmachine (H-11) for a cutscene and a random colored drop.",
            "Shikarees: zone into Mhaura. Jabbos: zone into Oldton Movalpolos. Tenzen: speak with Cid in Bastok Metalworks (H-8).",
            "Return to Ru'Lude Gardens and approach the " .. ACTOR.PALACE.text .. ".",
            "Travel to Upper Jeuno and examine " .. ACTOR.MARBLE_BRIDGE.text .. ".",
            "Examine " .. ACTOR.MARBLE_BRIDGE.text .. " again and choose one of the final ring rewards: Rajas, Sattva, or Tamas.",
            "Return to Tavnazian Safehold and examine " .. ACTOR.TAVNAZIAN_WALNUT_DOOR_K7.text .. ".",
            "Go to Lufaise Meadows and walk into Blueblade Fell (J-6) past the first barrel on the ground for the final cutscene (Unity Warp level 119 or 125 is fastest). Afterwards the quests Requiem of Sin and Storms of Fate become available.",
            "Optional: examine the Dilapidated Gate in Misareaux Coast (I-11) for Trust: Ulmia, and after all the epilogue scenes, the Walnut Door (K-7) in Tavnazian Safehold for Trust: Prishe.",
        },
    },

    ['8-5'] = {
        name = "The Last Verse",
        number = "8-5",
        mission_type = "Finale",
        steps = {
            "The Last Verse is recorded after completing Dawn.",
        },
    },
}

return M