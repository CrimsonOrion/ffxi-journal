--[[
    Seekers of Adoulin - Mission Database
    =======================================

    Mission IDs and walkthrough IDs are kept separate.

    M.MISSIONS:
        Official numeric mission IDs extracted from DAT 0xD9BA.
        These are consumed by the mission tracker.

    M.STEPS:
        Walkthrough entries using the existing numeric mission IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [110] = 'Rumors from the West',
    [112] = 'The Geomagnetron',
    [116] = 'Onward to Adoulin',
    [120] = 'Heartwings and the Kindhearted',
    [122] = 'Pioneer Registration',
    [124] = 'Life on the Frontier',
    [126] = 'Meeting of the Minds',
    [128] = 'Arciela Appears Again',
    [132] = 'Budding Prospects',
    [134] = 'The Light Shining in Your Eyes',
    [136] = 'The Heirloom',
    [138] = 'An Aimless Journey',
    [140] = 'Ortharsyne',
    [142] = 'In the Presence of Royalty',
    [144] = 'The Twin World Trees',
    [146] = 'Honor and Audacity',
    [148] = 'The Watergarden Coliseum',
    [150] = 'Friction and Fissures',
    [152] = 'The Celennia Memorial Library',
    [156] = 'For Whom Do We Toil?',
    [162] = 'Aiming for Ygnas',
    [164] = 'Calamity in the Kitchen',
    [168] = 'Arciela\'s Promise',
    [170] = 'Predators and Prey',
    [172] = 'Behind the Sluices',
    [178] = 'The Leafkin Monarch',
    [180] = 'Yggdrasil',
    [184] = 'Return of the Exorcist',
    [186] = 'The Merciless One',
    [188] = 'A Curse from the Past',
    [190] = 'The Purgation',
    [192] = 'The Key',
    [194] = 'The Princess\'s Dilemma',
    [196] = 'Dark Clouds Ahead',
    [198] = 'The Smallest of Favors',
    [200] = 'Summoned by Spirits',
    [202] = 'Evil Entities',
    [204] = 'Adoulin Calling',
    [206] = 'The Disappearance of Nyline',
    [208] = 'Shared Consciousness',
    [210] = 'Clear Skies',
    [212] = 'The Man in Black',
    [214] = 'To the Victor...',
    [216] = 'An Extraordinary Gentleman',
    [220] = 'The Order\'s Treasures',
    [222] = 'August\'s Heirloom',
    [224] = 'Beauty and the Beast',
    [226] = 'Wildcat with a Gold Pelt',
    [228] = 'In Search of Arciela',
    [232] = 'Looking For Leads',
    [234] = 'Drifting Northwest',
    [236] = 'Kumhau, the Flashfrost Naakual',
    [242] = 'Soul Siphon',
    [244] = 'Stonewalled',
    [248] = 'Salvation',
    [250] = 'Glimmer of Portent',
    [252] = '...Into the Fire',
    [254] = 'Melvien de Malecroix',
    [256] = 'Courier Catastrophe',
    [258] = 'Done and Delivered',
    [260] = 'Ministerial Whispers',
    [262] = 'A Day in the Life of a Pioneer',
    [264] = 'Lighting the Way',
    [266] = 'Sajj\'aka',
    [268] = 'Studying Up',
    [270] = 'A Vow of Truth',
    [272] = 'Darrcuiln',
    [274] = 'The Gates',
    [278] = 'Morimar',
    [280] = 'A New Force Arises',
    [282] = 'The Sacred Sapling',
    [284] = 'Tree Grafting',
    [286] = 'A Shrouded Canopy',
    [288] = 'Leafallia',
    [290] = 'Rosulatia\'s Promise',
    [292] = 'The Lightsland',
    [294] = 'The Light of Dawn Comes...',
    [296] = 'Cries from the Deep',
    [298] = 'Seeds of Doubt',
    [300] = 'The Tomatoes of Wrath',
    [302] = 'A Grave Mistake',
    [306] = 'An Emergency Convocation',
    [308] = 'Balamor, the Deathborne Xol',
    [310] = 'Anagnorisis',
    [312] = 'Just the Thing',
    [314] = 'Sugarcoated Salvation',
    [316] = 'Arciela\'s Resolve',
    [318] = 'Balamor\'s Ruse',
    [320] = 'The Charlatan',
    [324] = 'Royal Blessings',
    [326] = 'Arboreal Rumors',
    [328] = 'Arciela\'s Missive',
    [330] = 'Heroes, Unite!',
    [332] = 'A Portent Most Ominous',
    [334] = 'Yggdrasil Beckons',
    [336] = 'Returning to the Trees',
    [338] = 'The Key to the Turris',
    [342] = 'Teodor\'s Summons',
    [344] = 'The Seventh Guardian',
    [346] = 'Watery Grave',
    [350] = 'Blood for Blood',
    [352] = 'Reckoning',
    [356] = 'Abomination',
    [360] = 'Undying Light',
    [368] = 'The Light Within',
    [999] = 'fin',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- CHAPTER 1
    -- ========================================================

    [110] = {
        name = 'Rumors from the West',
        number = "1-1",
        mission_type = "Cutscene",
        steps = {
            "After installing Seekers of Adoulin, entering one of the three starting nations plays a short cutscene telling you to go to Jeuno. It is optional.",
            "Speak with " .. ACTOR.DARCIA.text .. " in the Chamber of Commerce and Industry in Lower Jeuno and choose \"I would like to apply!\" to receive the Geomagnetron key item.",
        },
    },

    [112] = {
        name = 'The Geomagnetron',
        number = "1-2",
        mission_type = "Quest",
        steps = {
            "If you don't have it yet, speak with " .. ACTOR.DARCIA.text .. " and choose \"I would like to apply!\" for the Geomagnetron and a list of founts.",
            "Attune it at the Geomagnetic Fount in any one of: Gustav Tunnel (G-10) map 1, Ranguemont Pass (J-10), Yughott Grotto (J-7), King Ranperre's Tomb (K-6), Monastic Cavern (H-10) map 1, Eldieme Necropolis (J-10) map 2, Ordelle's Caves (F-12), Gusgen Mines (G-7) map 3, Dangruf Wadi (E-11), Korroloka Tunnel (G-9) map 4, Palborough Mines (J-8) map 2, Labyrinth of Onzozo (J-5), Maze of Shakhrami (K-9) map 1, Garlaige Citadel (G-8) map 2, Crawlers' Nest (F-7) map 1, Outer Horutoto Ruins (G-7) map 2, Inner Horutoto Ruins (G/H-7) map 2 or Toraimarai Canal (I-6).",
            "Easiest at low level: Outer Horutoto Ruins, entered from the tower at (H-3) in East Sarutabaruta. Go left down the hall to (G-7); the fount is behind the farthest southwest Stone Door. Monsters there are level 1-4. At high level, Gustav Tunnel is seconds from Unity Warp (level 128).",
            "Return to " .. ACTOR.DARCIA.text .. " for the Adoulinian charter permit. You can skip the fount by paying her 1,000,000 gil, or by finishing the Rhapsodies mission The River Runs Red, where Iroha hands you the Geomagnetron.",
        },
    },

    [116] = {
        name = 'Onward to Adoulin',
        number = "1-3",
        mission_type = "Cutscene",
        steps = {
            "Activate the Waypoint at (H-7) in Lower Jeuno to travel to Ulbuka.",
        },
    },

    [120] = {
        name = 'Heartwings and the Kindhearted',
        number = "1-4",
        mission_type = "Cutscene",
        steps = {
            "Head northeast through Ceizak Battlegrounds to Western Adoulin (K-7). You can use mounts here.",
        },
    },

    [122] = {
        name = 'Pioneer Registration',
        number = "1-5",
        mission_type = "Cutscene",
        reward = "1,000 Bayld",
        steps = {
            "Travel to the Pioneers' Coalition in Western Adoulin at (E-8).",
            "Speak with " .. ACTOR.BRENTON.text .. ".",
            "Receive the Pioneer's Badge, Map of Adoulin, and 1,000 Bayld.",
            "Talk to a Task Delegator now so you start earning imprimaturs for Coalition Assignments.",
        },
    },

    [124] = {
        name = 'Life on the Frontier',
        number = "1-6",
        mission_type = "Quest",
        reward = "Wildskeeper Reive access",
        steps = {
            "Use 15 or more imprimaturs on completed Coalition Assignments. Higher Adoulin fame lowers the requirement; finishing quests such as I'm on a Boat helps.",
            "Now is a good time to start learning Survival Skills (Logging, Watercrafting, Climbing and so on); you need them to cross the Ulbuka zones.",
            "Speak with " .. ACTOR.BRENTON.text .. " in the Pioneers' Coalition for a cutscene and the Dinner invitation.",
            "You can now buy Wildskeeper Reive key items from Dimmian in Eastern Adoulin (E-6).",
        },
    },

    [126] = {
        name = 'Meeting of the Minds',
        number = "1-7",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Gates of Castle Adoulin in Eastern Adoulin between 15:00 and 22:00 (Vana'diel time) for a cutscene.",
            "Tip: start the quest Flavors of Our Lives now (Berghent at (J-9) near the Big Bridge in Western Adoulin, then Masad in the Mummers' Coalition) until Teodor is introduced. Otherwise Budding Prospects costs you an extra game day.",
            "Finishing this mission also lets you continue the Rhapsodies mission The Crucible.",
        },
    },

    [128] = {
        name = 'Arciela Appears Again',
        number = "1-8",
        mission_type = "Cutscene",
        steps = {
            "Use enough imprimaturs and earn Adoulin fame. 15 imprimaturs used plus fame level 2 (quests such as I'm on a Boat, Western Waypoints Ho!, Eastern Waypoints Ho! and The Old Man and the Harpoon) is enough.",
            "Quick assignments: repeat the Inventors' Coalition task Gather Materials: Rala Waterways (trade 3 Bloodthread to the Task Delegator), or Couriers' Coalition deliveries using waypoints. Accepting assignments and cancelling them later refunds the imprimaturs, so you can bank them.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition to finish. If you already met the requirement, the next mission can start on the next game day.",
            "Keep using imprimaturs: later missions need more.",
        },
    },

    [132] = {
        name = 'Budding Prospects',
        number = "2-1",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition.",
            "If Teodor hasn't been introduced in the quest Flavors of Our Lives yet: talk to Berghent at (J-9) near the Big Bridge, then Masad in the Mummers' Coalition, and wait until the next game day.",
            "Speak with Masad in the Mummers' Coalition (Western Adoulin) for the mission cutscene. After the day changes you may need to zone and talk to him twice.",
        },
    },

    [134] = {
        name = 'The Light Shining in Your Eyes',
        number = "2-1-1",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
        },
    },

    -- ========================================================
    -- CHAPTER 2
    -- ========================================================

    [136] = {
        name = 'The Heirloom',
        number = "2-1-2",
        mission_type = "Cutscene",
        steps = {
            "Approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene.",
        },
    },

    [138] = {
        name = 'An Aimless Journey',
        number = "2-2",
        mission_type = "Quest",
        steps = {
            "Travel to Cirdas Caverns and go to the Ergon Locus at (E-9) for a cutscene. A Colonization Reive that needs the Logging survival skill blocks the way.",
            "Routes: Ceizak Battlegrounds waypoint #3, southwest into Sih Gates, then west into Cirdas Caverns (southeast corner). Or Foret de Hennetiel waypoint #3, clear the reive to the north, go through Dho Gates and take the one-way drop into Cirdas Caverns (southwest corner). If the Augural Conveyor is unlocked, a waypoint takes you to (J-3) for 300 units.",
            "Afterwards you can continue the Rhapsodies mission Tears of the Generals.",
        },
    },

    [140] = {
        name = 'Ortharsyne',
        number = "2-2-1",
        mission_type = "Cutscene",
        steps = {
            "You need the Watercrafting and Climbing survival skills to reach Yorcia Weald from Cirdas Caverns.",
            "Enter Yorcia Weald for a cutscene. Arriving by waypoint or Home Point also works.",
        },
    },

    [142] = {
        name = 'In the Presence of Royalty',
        number = "2-2-2",
        mission_type = "Quest",
        reward = "Game day: wait for the next mission",
        steps = {
            "Examine " .. ACTOR.YORCIA_ERGON_QQ_I8.text .. " in Yorcia Weald for Yorcia's tear. Enter (I-8) from the west; a wall that sometimes blocks the path opens at 21:00. Standing on the Suspicious Place, face northeast and the ??? is straight ahead.",
            "Do not use the northern Ergon Locus ???; it is not the correct target.",
            "Alternatively, harvest Harvesting Points with Sickles until the key item drops. This is slow; bring spare Sickles.",
            "Go to (G-6) and examine the Pellucid Afflusion next to the pond for a cutscene and Rosulatia's pome. A bush at the (G-5/6)-(H-5/6) corner sometimes rises and blocks the path for a few minutes.",
        },
    },

    [144] = {
        name = 'The Twin World Trees',
        number = "2-3",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Speak with Oscairn at (G-7) in Eastern Adoulin, northeast of the Peacekeepers' Coalition.",
        },
    },

    [146] = {
        name = 'Honor and Audacity',
        number = "2-4",
        mission_type = "Cutscene",
        steps = {
            "Enter Rala Waterways from Eastern Adoulin (F-7) for a cutscene with Arciela.",
        },
    },

    [148] = {
        name = 'The Watergarden Coliseum',
        number = "2-4-1",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "In Rala Waterways, go to the room in the center of (M-6) and speak with " .. ACTOR.YEGGHA_DOLASHI.text .. " for a cutscene. The Eastern Adoulin (F-7) entrance is closest.",
        },
    },

    [150] = {
        name = 'Friction and Fissures',
        number = "2-5",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next game day after The Watergarden Coliseum.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
        },
    },

    [152] = {
        name = 'The Celennia Memorial Library',
        number = "2-5-1",
        mission_type = "Quest",
        steps = {
            "Go to the " .. ACTOR.LIBRARY.text .. " at (F-10) in Eastern Adoulin and talk to Eppel-Treppel to go inside.",
            "Read all three options in the book \"History\" on the shelf between Yefafa and Vainrachault. If you can't read the books, first do the quest Order Up from Reja Ygridhi inside the library; it needs a library card (1,000 bayld from Patient Snake in Eastern Adoulin (F-9), at the end of the path into the Scouts' Coalition).",
            "Return to " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition.",
        },
    },

    [156] = {
        name = 'For Whom Do We Toil?',
        number = "2-5-2",
        mission_type = "Quest",
        steps = {
            "Enter Rala Waterways for a cutscene. The Western Adoulin (F-5) entrance, near the Adoulin Waterfront waypoint, is closest.",
            "Go south to the dead end at (C-6) and examine the " .. ACTOR.SLUICE_GATE.text .. ". Enter the four-letter password in capitals: the initials of the four order leaders marked in the library's History book (HGSI).",
            "In the cutscene, answer \"Of course it won't help\". If you pick the other answer and fail to repeat the password, examine the gate again for the Note detailing seditious plans. Too many wrong passwords lock you out until you reread the History book.",
        },
    },

    [162] = {
        name = 'Aiming for Ygnas',
        number = "2-6",
        mission_type = "Cutscene",
        steps = {
            "Travel to the Gates of Castle Adoulin in Eastern Adoulin at (K-9).",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " for a cutscene. If you are on the Rhapsodies mission Tears of the Generals you get that cutscene first, so talk to her twice.",
        },
    },

    [164] = {
        name = 'Calamity in the Kitchen',
        number = "2-6-1",
        mission_type = "Cutscene",
        steps = {
            "Enter Rala Waterways from Western Adoulin (I-12), near the Rent-a-Room waypoint and Home Point #2.",
            "Speak with Chalvava at (F-11) for a cutscene and a Box of Adoulinian tomatoes.",
        },
    },

    [168] = {
        name = "Arciela's Promise",
        number = "2-6-2",
        mission_type = "Cutscene",
        steps = {
            "Return to " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates in Eastern Adoulin for a cutscene.",
        },
    },

    [170] = {
        name = 'Predators and Prey',
        number = "2-7",
        mission_type = "Cutscene",
        steps = {
            "Enter Rala Waterways from Western Adoulin at (F-5).",
            "Reach " .. ACTOR.SLUICE_GATE.text .. ".",
        },
    },

    [172] = {
        name = 'Behind the Sluices',
        number = "2-7-1",
        mission_type = "BCNM",
        steps = {
            "Get the Waterway facility crank from the " .. ACTOR.RALA_STORAGE_CONTAINER_H6.text .. " in Rala Waterways. From town, the Western Adoulin (K-8) entrance by the Big Bridge waypoint is closest; Sneak is enough.",
            "Return to the " .. ACTOR.SLUICE_GATE.text .. " for a cutscene, then examine it again to go behind the gate.",
            "Examine the Antiquated Sluice Gate to enter the battle. If you lose, you need a new crank from the Storage Container.",
            "You fight The Keeper (SCH/BLM, the toughest; kill it last), Mistdagger (NIN) and The Briars (a Galka WAR and an Elvaan RDM/BLM). They run to random targets to use weapon skills, so expect skillchains on your party. Trusts are allowed.",
            "Arciela joins once you draw your weapon. She needs healing, and the mission fails if she dies.",
        },
    },

    [178] = {
        name = 'The Leafkin Monarch',
        number = "2-7-2",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene. Taking the waypoint to the gates also triggers it.",
        },
    },

    [180] = {
        name = 'Yggdrasil',
        number = "2-7-3",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next game day after the cutscene at the castle gates.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition. If there is still an imprimatur and fame requirement, 15 imprimaturs used and fame level 2 is enough.",
        },
    },

    -- ========================================================
    -- CHAPTER 3
    -- ========================================================

    [184] = {
        name = 'Return of the Exorcist',
        number = "3-1",
        mission_type = "Cutscene",
        steps = {
            "Go to the Airship Docks in Western Adoulin (H-4, waypoint #8) for a cutscene.",
        },
    },

    [186] = {
        name = 'The Merciless One',
        number = "3-1-1",
        mission_type = "Cutscene",
        reward = "Access to Ingrid Trust",
        steps = {
            "Approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene.",
            "Afterwards, speak with " .. ACTOR.RIGOBERTINE.text .. " twice for the Trust: Ingrid cutscene.",
        },
    },

    [188] = {
        name = 'A Curse from the Past',
        number = "3-1-2",
        mission_type = "Quest",
        steps = {
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates.",
            "Speak with " .. ACTOR.RIGOBERTINE.text .. " in the alley at the southeast corner of (J-7) for the Eternal flame and hints. You can't get the other items without this cutscene.",
            "Examine " .. ACTOR.FONTIS_XANIRA_H8.text .. " to obtain the Vial of untainted holy water.",
            "Examine " .. ACTOR.SUNRISE_BEACON_J4.text .. " to obtain the Piece of a stone wall.",
            "Speak with " .. ACTOR.ERMINOLD.text .. " near the castle gates for the Weather vane wings. He only gives them once you have the holy water and the stone wall piece.",
        },
    },

    [190] = {
        name = 'The Purgation',
        number = "3-1-3",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "With all four key items, approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene.",
        },
    },

    [192] = {
        name = 'The Key',
        number = "3-1-4",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
        },
    },

    [194] = {
        name = "The Princess's Dilemma",
        number = "3-2",
        mission_type = "Cutscene",
        steps = {
            "Enter the " .. ACTOR.LIBRARY.text .. " for a cutscene.",
            "Choose the second option, \"What kind of sweets do you like?\".",
        },
    },

    [196] = {
        name = 'Dark Clouds Ahead',
        number = "3-2-1",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
        },
    },

    [198] = {
        name = 'The Smallest of Favors',
        number = "3-2-2",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Walk from Western Adoulin into Ceizak Battlegrounds for a cutscene. Don't use a waypoint.",
        },
    },

    [200] = {
        name = 'Summoned by Spirits',
        number = "3-3",
        mission_type = "Cutscene",
        steps = {
            "Enter the " .. ACTOR.LIBRARY.text .. " for a cutscene.",
        },
    },

    [202] = {
        name = 'Evil Entities',
        number = "3-3-1",
        mission_type = "Cutscene",
        steps = {
            "Travel to Ceizak Battlegrounds.",
            "Speak with " .. ACTOR.ELMRIC.text .. " at Frontier Station.",
        },
    },

    [204] = {
        name = 'Adoulin Calling',
        number = "3-3-2",
        mission_type = "Cutscene",
        steps = {
            "Examine " .. ACTOR.BOARDING_HOUSE_H9.text .. " in Eastern Adoulin, near the Statue of the Goddess waypoint (#3), for a very long cutscene.",
        },
    },

    [206] = {
        name = 'The Disappearance of Nyline',
        number = "3-3-3",
        mission_type = "Cutscene",
        steps = {
            "Travel to Foret de Hennetiel.",
            "Approach the Ergon Locus (Torchbloom) at (J-7)/(K-7), near the Frontier Station Waypoint.",
            "Examine " .. ACTOR.TORCHBLOOM_J7.text .. ".",
        },
    },

    [208] = {
        name = 'Shared Consciousness',
        number = "3-3-4",
        mission_type = "Cutscene",
        reward = "1k Bayld, 1k Exp/LP; Game day: wait for the next mission",
        steps = {
            "Return to " .. ACTOR.BOARDING_HOUSE_H9.text .. ".",
        },
    },

    [210] = {
        name = 'Clear Skies',
        number = "3-3-5",
        mission_type = "Cutscene",
        reward = "100 Bayld",
        steps = {
            "Wait until the next Vana'diel day after the previous mission if necessary.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition.",
        },
    },

    -- ========================================================
    -- CHAPTER 4
    -- ========================================================

    [212] = {
        name = 'The Man in Black',
        number = "3-4",
        mission_type = "Cutscene",
        steps = {
            "Travel to the Mummers' Coalition in Western Adoulin.",
            "Speak with Masad.",
            "Win 3 rounds of Boom or Bust.",
            "If you lose, speak with Masad twice to try again.",
            "Shortcut: with the Rhapsody in Azure key item, buy the Card Jailer Teodor from a Curio Vendor Moogle for 1,000 gil, then speak with Masad to win automatically.",
        },
    },

    [214] = {
        name = 'To the Victor...',
        number = "3-4-1",
        mission_type = "Cutscene",
        steps = {
            "This mission finishes as soon as you beat Teodor at Boom or Bust (or win with the Card Jailer Teodor).",
        },
    },

    [216] = {
        name = 'An Extraordinary Gentleman',
        number = "3-4-2",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition and choose \"Ortharsyne\".",
            "If Levil has nothing new, talk to Masad again to make sure you saw the Teodor cutscene, then try Levil again.",
        },
    },

    [220] = {
        name = "The Order's Treasures",
        number = "3-4-3",
        mission_type = "Cutscene",
        steps = {
            "Enter the " .. ACTOR.LIBRARY.text .. ".",
            "Complete the cutscene inside the library.",
        },
    },

    [222] = {
        name = "August's Heirloom",
        number = "3-4-4",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates in Eastern Adoulin.",
        },
    },

    [224] = {
        name = 'Beauty and the Beast',
        number = "3-5",
        mission_type = "Cutscene",
        steps = {
            "In Ceizak Battlegrounds, examine the Signs of Struggle at the (I-7)/(J-8) intersection, southwest of the Frontier Station. Follow the wall from the station into the narrow path just before the Bight Uragnite; it is by a tree near some Twigtrip Lapinions.",
        },
    },

    [226] = {
        name = 'Wildcat with a Gold Pelt',
        number = "3-5-1",
        mission_type = "Cutscene",
        steps = {
            "Approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene.",
        },
    },

    [228] = {
        name = 'In Search of Arciela',
        number = "3-5-2",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition.",
        },
    },

    [232] = {
        name = 'Looking For Leads',
        number = "3-5-3",
        mission_type = "Cutscene",
        steps = {
            "Approach Wegellion in the Scouts' Coalition in Eastern Adoulin (waypoint #2) for a cutscene and the Tintinnabulum.",
        },
    },

    [234] = {
        name = 'Drifting Northwest',
        number = "3-6",
        mission_type = "Cutscene",
        steps = {
            "Enter Kamihr Drifts for a cutscene. Arriving from Woh Gates, by Home Point or by waypoint all work. Bivouac #2 is closest to the next mission's spot.",
        },
    },

    [236] = {
        name = 'Kumhau, the Flashfrost Naakual',
        number = "3-6-1",
        mission_type = "Cutscene",
        steps = {
            "Examine the Crawling Cave at (F-11) in Kamihr Drifts for a long cutscene and the Aureate ball of fur. You don't fight Kumhau here.",
            "Route: from Bivouac #2, leave the cave by the west tunnel, turn right and go north to the inlet at the top of (G-10), go down the slope and through the cave, then head southwest to the Crawling Cave.",
        },
    },

    [242] = {
        name = 'Soul Siphon',
        number = "3-6-2",
        mission_type = "Cutscene",
        steps = {
            "Examine the Hollowed Pathway in the southwest corner of (G-11) in Kamihr Drifts and choose \"Proceed\" for a cutscene. This does not start the battle yet.",
        },
    },

    [244] = {
        name = 'Stonewalled',
        number = "3-6-3",
        mission_type = "BCNM",
        reward = "15,000 Bayld each for repeat fights",
        steps = {
            "Examine the Hollowed Pathway again to enter the Stonewalled battle. Solo with Trusts is fine; there is a 30-minute limit and buffs other than food wear off.",
            "Only the Primogenial Marolith has to die. Gargouille Drudges keep arriving one at a time from behind it, but they have little HP.",
            "You receive the Soul siphon. Don't warp away: the next mission is back at the Crawling Cave. If you lose, get a new Aureate ball of fur from the Crawling Cave (F-11).",
        },
    },

    [248] = {
        name = 'Salvation',
        number = "3-6-4",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Return to the Crawling Cave at (F-11) in Kamihr Drifts for a cutscene.",
            "Choose the third option, \"Her hilt-clutching hands.\"",
        },
    },

    [250] = {
        name = 'Glimmer of Portent',
        number = "3-6-5",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day.",
            "Speak with " .. ACTOR.LEVIL.text .. " at the Pioneers' Coalition.",
        },
    },

    [252] = {
        name = '...Into the Fire',
        number = "4-1",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.KIPLIGG.text .. " at the entrance of the Couriers' Coalition. He sends you to the Western Adoulin Waterfront.",
        },
    },

    [254] = {
        name = 'Melvien de Malecroix',
        number = "4-1-1",
        mission_type = "Cutscene",
        steps = {
            "Go to the Western Adoulin Waterfront (waypoint #9) and examine the Port Storage door at (J-4) for a cutscene.",
            "Guilberien asks for one of: 5 Eft Skins, 4 Manticore Hair, a Buffalo Horn, a Manticore Leather or a Buffalo Leather. Which one depends on your bond with Arciela (Buffalo Horn means the lowest).",
        },
    },

    [256] = {
        name = 'Courier Catastrophe',
        number = "4-1-2",
        mission_type = "Quest",
        steps = {
            "Trade the requested item(s) to the Port Storage door at (J-4) on the Western Adoulin Waterfront for a cutscene with Guilberien.",
        },
    },

    [258] = {
        name = 'Done and Delivered',
        number = "4-1-3",
        mission_type = "Cutscene",
        steps = {
            "Return to " .. ACTOR.KIPLIGG.text .. " at the entrance of the Couriers' Coalition to finish.",
        },
    },

    [260] = {
        name = 'Ministerial Whispers',
        number = "4-1-4",
        mission_type = "Cutscene",
        reward = "Game day wait / zone for next mission",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition for a small reward to finish.",
        },
    },

    [262] = {
        name = 'A Day in the Life of a Pioneer',
        number = "4-1-5",
        mission_type = "Cutscene",
        steps = {
            "Zone and wait until the next game day.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
            "Choose \"What happened after that?\".",
        },
    },

    [264] = {
        name = 'Lighting the Way',
        number = "4-2",
        mission_type = "Cutscene",
        steps = {
            "Examine the Alpine Trail at (H-5) in Kamihr Drifts for a cutscene. Bivouac #3 is closest (take the northern tunnel and follow the left wall north); the Home Point is also near. Turn FastCS off: it disconnects you here (the mission still counts when you log back in). It takes you to Mount Kamihr.",
        },
    },

    [266] = {
        name = "Sajj'aka",
        number = "4-2-1",
        mission_type = "Cutscene",
        steps = {
            "Enter the " .. ACTOR.LIBRARY.text .. " for a cutscene.",
            "Read the different stories in the cutscene to continue.",
        },
    },

    [268] = {
        name = 'Studying Up',
        number = "4-2-2",
        mission_type = "Cutscene",
        steps = {
            "Return to the Alpine Trail at (H-5) in Kamihr Drifts, north of Bivouac #3, for a cutscene (FastCS off).",
            "Answer the questions in order: Yorcia Weald; Morimar; The Serpentine Labyrinth; Yes it does; Who are \"They\"?; Unleash a feral scream; What are you proposing?",
        },
    },

    [270] = {
        name = 'A Vow of Truth',
        number = "4-2-3",
        mission_type = "Cutscene",
        steps = {
            "Enter Woh Gates from any entrance for a cutscene. From Kamihr Drifts, the entrance at (K-11) by the Frontier Station is closest; from town, use Marjami Ravine waypoint #4 and walk northwest.",
        },
    },

    [272] = {
        name = 'Darrcuiln',
        number = "4-2-4",
        mission_type = "Cutscene",
        steps = {
            "Examine the " .. ACTOR.DARKENED_CREVICE_G8.text .. " in Woh Gates, just inside the tunnel before the downward slope at the (G-7)/(G-8) border, for a cutscene and the Tuft of golden fur (the battle's entry item).",
            "From Kamihr Drifts: drop down at (I-5) and again at (H-6), then cross the big room. From Marjami Ravine: follow the left wall to skip the reive at (H-9); you still need to clear the one at (H-7).",
            "Use Sneak and Invisible (or Silent Oil and Prism Powder) before the big room: the Gefryst detect magic, the worms detect sound, and the rabbits and snolls detect sight.",
        },
    },

    [274] = {
        name = 'The Gates',
        number = "4-3",
        mission_type = "BCNM",
        steps = {
            "Examine the " .. ACTOR.DARKENED_CREVICE_G8.text .. " again to enter \"The Gates\" battle against waves of Umbrils. It starts after about a minute, so buff and call Trusts.",
            "Arciela, Darrcuiln, the Noble Warrior and Resolute Leafkins fight with you; the battle is lost if any of them die. You can heal and buff them with Blood Pact: Wards, or with Accession or Curaga cast on one of your Trusts.",
            "If you lose, get a new Tuft of golden fur from the Large Animal Track at the (J-8)/(K-8) border near the Yorcia Weald exit.",
        },
    },

    -- ========================================================
    -- CHAPTER 5
    -- ========================================================

    [278] = {
        name = 'Morimar',
        number = "4-3-1",
        mission_type = "Cutscene",
        steps = {
            "Return to the Alpine Trail at (H-5) in Kamihr Drifts, north of Bivouac #3, for a cutscene (FastCS off).",
        },
    },

    [280] = {
        name = 'A New Force Arises',
        number = "4-3-2",
        mission_type = "Quest",
        steps = {
            "Enter Outer Ra'Kaznar through the Liseran Door at (F-8) in Kamihr Drifts (or the Enigmatic Device waypoint if unlocked). To break the Amaranth Barriers, first do the quest Lerene's Lament: Lerene at (N-7) wants 2 Ancestral Cloth from the Shunned enemies at (K-7)/(K-8).",
            "Collect, in this order: the Starblessed scale from the Effigy of Sealing at (I-11), map 1; the Silvery plate at (C-7), map 1 (needed for the elevator at (I-6)); the Moontouched scale from the Effigy of Sealing at (H-2), map 1; and the Sunkissed scale from the Demonic Architrave at (C-8), basement map 2.",
            "Return to the Alpine Trail at (H-5) in Kamihr Drifts (Bivouac #3 or the Home Point) for a cutscene and the World Tree sapling.",
        },
    },

    [282] = {
        name = 'The Sacred Sapling',
        number = "4-3-3",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates in Eastern Adoulin for a cutscene.",
            "Choose \"Tree Grafting.\"",
        },
    },

    [284] = {
        name = 'Tree Grafting',
        number = "4-3-4",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
        },
    },

    [286] = {
        name = 'A Shrouded Canopy',
        number = "4-3-5",
        mission_type = "Cutscene",
        reward = "Leafallia access",
        steps = {
            "Examine the Blockaded Path at (G-11), almost (F-11), in Kamihr Drifts to enter Leafallia. Bivouac #2 is closest; it is southeast of the Hollowed Pathway from Soul Siphon.",
        },
    },

    [288] = {
        name = 'Leafallia',
        number = "4-3-6",
        mission_type = "Cutscene",
        steps = {
            "Examine the " .. ACTOR.AGED_STUMP_H8.text .. " in Leafallia for a cutscene.",
        },
    },

    [290] = {
        name = "Rosulatia's Promise",
        number = "4-3-7",
        mission_type = "Cutscene",
        steps = {
            "Examine the Heroic Footprints at (H-8) in Leafallia, by a tree across the stream behind the Aged Stump, for a long cutscene.",
        },
    },

    [292] = {
        name = 'The Lightsland',
        number = "4-3-8",
        mission_type = "Cutscene",
        reward = "500 Experience Points; one of: Adoulin's Refuge, Ygnas's Resolve, Arciela's Grace; Game day: wait for the next mission",
        steps = {
            "Return to " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a cutscene.",
            "Pick a necklace: Adoulin's Refuge, Arciela's Grace or Ygnas's Resolve. You must choose one to progress. It doesn't limit which +1 you pick later, and you trade it back then.",
        },
    },

    [294] = {
        name = 'The Light of Dawn Comes...',
        number = "4-3-9",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition. The next mission starts automatically.",
        },
    },

    [296] = {
        name = 'Cries from the Deep',
        number = "4-4",
        mission_type = "Cutscene",
        steps = {
            "Approach the Castle Adoulin gates in Eastern Adoulin, where " .. ACTOR.POHL_TRISHBAHK.text .. " stands, for a cutscene.",
        },
    },

    [298] = {
        name = 'Seeds of Doubt',
        number = "4-4-1",
        mission_type = "Cutscene",
        steps = {
            "Enter Rala Waterways from Western Adoulin (I-12) near the Residential Area (waypoint #6 Rent-a-Room or Home Point #2 are closest).",
            "Speak with Chalvava at (F-11) for a cutscene.",
        },
    },

    [300] = {
        name = 'The Tomatoes of Wrath',
        number = "4-4-2",
        mission_type = "Cutscene",
        steps = {
            "Return to " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a long cutscene with Arciela and the Order of Renaye.",
        },
    },

    [302] = {
        name = 'A Grave Mistake',
        number = "4-4-3",
        mission_type = "Quest",
        steps = {
            "Enter Rala Waterways from Eastern Adoulin (F-7) (waypoint #4 or Home Point #1). You arrive at (K-5), close to two of the three points.",
            "Examine " .. ACTOR.SAINENE.text .. ".",
            "Examine " .. ACTOR.WATERWAYS_OVERLOOK_I6.text .. ".",
            "Examine " .. ACTOR.STOUT_WEIR.text .. " to receive a Broken fuse.",
            "Return to the Castle Adoulin gates and report to " .. ACTOR.POHL_TRISHBAHK.text .. ".",
        },
    },

    [306] = {
        name = 'An Emergency Convocation',
        number = "4-4-4",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Leave Eastern Adoulin and come back.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a long cutscene.",
        },
    },

    [308] = {
        name = 'Balamor, the Deathborne Xol',
        number = "4-5",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a cutscene. No zoning needed.",
        },
    },

    [310] = {
        name = 'Anagnorisis',
        number = "4-5-1",
        mission_type = "Cutscene",
        steps = {
            "Trade " .. ACTOR.POHL_TRISHBAHK.text .. " the necklace from The Lightsland (Adoulin's Refuge, Arciela's Grace or Ygnas's Resolve). If you threw it away, just talk to her.",
        },
    },

    [312] = {
        name = 'Just the Thing',
        number = "4-5-2",
        mission_type = "Cutscene",
        steps = {
            "Enter the " .. ACTOR.LIBRARY.text .. " and speak with " .. ACTOR.ANDREINE.text .. " for a cutscene and the key item Suffering Sacchariferous.",
        },
    },

    [314] = {
        name = 'Sugarcoated Salvation',
        number = "4-5-3",
        mission_type = "Cutscene",
        steps = {
            "Return to " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a cutscene and the Sepulcher ensign.",
        },
    },

    [316] = {
        name = "Arciela's Resolve",
        number = "4-5-4",
        mission_type = "Cutscene",
        steps = {
            "Enter Rala Waterways from Eastern Adoulin (F-7), by waypoints #1 and #4.",
            "Go to (N-10), the far southeast corner, and examine the Royal Sepulcher for a cutscene.",
        },
    },

    [318] = {
        name = "Balamor's Ruse",
        number = "4-6",
        mission_type = "Quest & BCNM",
        reward = "20,000 Bayld each for repeat fights",
        steps = {
            "Kill enemies in Rala Waterways until you get a Consummate simulacrum (a temporary key item; the chat message is easy to miss). Waterway Pugils and New Moon Bats seem to drop it most. Everyone on the mission in the zone gets one at once.",
            "Examine the " .. ACTOR.AUGURAL_CONVEYOR.text .. ", near the Western Adoulin Waterfront (F-5) entrance, and choose \"The Charlatan\" to go straight into the battle.",
            "You fight Balamor and three Dullahan alongside Arciela. The Regicidal Dullahan always targets Arciela, and the battle is lost if she falls. Balamor and his two Sycophants share hate. Only Balamor has to be beaten; he surrenders around 20%. Trusts are allowed.",
            "Afterwards warp out of the Royal Sepulcher and go to the castle gates for the next mission.",
        },
    },

    [320] = {
        name = 'The Charlatan',
        number = "4-6-1",
        mission_type = "Cutscene",
        reward = "500 Experience Points; one of: Adoulin's Refuge +1, Ygnas's Resolve +1, Arciela's Grace +1; Game day: wait for the next mission",
        steps = {
            "Return to " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates and choose a +1 necklace: Adoulin's Refuge +1, Arciela's Grace +1 or Ygnas's Resolve +1. Choose carefully; it is effectively permanent.",
            "If Ploh says the princess awaits you in the Celennia Memorial Library, finish the Rhapsodies mission Solemnity first.",
        },
    },

    [324] = {
        name = 'Royal Blessings',
        number = "4-6-2",
        mission_type = "Cutscene",
        steps = {
            "Wait until the next Vana'diel day after the previous mission.",
            "Speak with " .. ACTOR.LEVIL.text .. " in the Pioneers' Coalition (Western Adoulin) for a cutscene.",
            "Choose \"'Strange'? Can you be more specific?\" and then \"Of course they will!\".",
        },
    },

    [326] = {
        name = 'Arboreal Rumors',
        number = "5-1",
        mission_type = "Cutscene",
        steps = {
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the Castle Adoulin gates for a cutscene.",
            "Choose \"I just want to see Arciela.\" to receive the Hastily scribbled note.",
        },
    },

    [328] = {
        name = "Arciela's Missive",
        number = "5-1-1",
        mission_type = "Cutscene",
        steps = {
            "Read the Hastily scribbled note in Temporary Key Items.",
            "Examine " .. ACTOR.SUNRISE_BEACON_J4.text .. ".",
        },
    },

    [330] = {
        name = 'Heroes, Unite!',
        number = "5-1-2",
        mission_type = "Cutscene",
        steps = {
            "Examine the Alpine Trail at (H-5) in Kamihr Drifts (Bivouac #3 or Home Point #1 are quickest) for a cutscene.",
        },
    },

    [332] = {
        name = 'A Portent Most Ominous',
        number = "5-1-3",
        mission_type = "Cutscene",
        steps = {
            "Enter " .. ACTOR.LEAFALLIA.text .. " through the Blockaded Path at (G-11) in Kamihr Drifts, or warp to the Leafallia Home Point.",
            "Examine the " .. ACTOR.AGED_STUMP_H8.text .. " for a cutscene, the Sky blue pome and the Sun yellow pome.",
        },
    },

    [334] = {
        name = 'Yggdrasil Beckons',
        number = "5-2",
        mission_type = "BCNM",
        reward = "20,000 Bayld each for repeat fights",
        steps = {
            "Two battles, in either order. You win each by bringing the main target below 10%. Drawing your weapon starts the fight at once. If you lose, get the entry key item again from the Aged Stump (H-8) in Leafallia.",
            "Dhokmak: go to (K-11) in Cirdas Caverns (west tunnel from Yorcia Weald's Frontier Station, or the Enigmatic Device waypoint). Examine the Wavering Flux for a cutscene, then again to enter. You fight Dhokmak and 3 Malignant Acuex with Darrcuiln, who must survive.",
            "Ashrakk: go to the southeast part of (H-6) in Yorcia Weald (Frontier Bivouac #1 is closest). Examine the Wavering Flux twice. Morimar must survive. Under 50% Ashrakk summons a Hell-spawned Orthrus, which you can ignore if your damage is high.",
        },
    },

    [336] = {
        name = 'Returning to the Trees',
        number = "5-2-1",
        mission_type = "Cutscene",
        steps = {
            "Enter Leafallia (Blockaded Path at (G-11) in Kamihr Drifts, or the Home Point) for a cutscene.",
            "Choose \"Ask for forgiveness.\" and then \"I promise.\"",
        },
    },

    [338] = {
        name = 'The Key to the Turris',
        number = "5-2-2",
        mission_type = "Quest/Cutscene",
        steps = {
            "Reach the bottom of " .. ACTOR.TURRIS.text .. " and examine the Ominous Postern for a long cutscene. With Ra'Kaznar Inner Court Home Point #1, warp there and take the Vertical Transit Device down.",
            "Otherwise reach Ra'Kaznar Inner Court first. Each Naakual you have beaten opens a shortcut through a Gates zone. Shortest first: Yumcax (Yorcia Weald, via Cirdas Caverns map 2), Tchakka (Foret de Hennetiel, via Dho Gates), Hurkan (Marjami Ravine, via Woh Gates), Achuka (Morimar Basalt Fields, via Moh Gates), Colkhab (Ceizak Battlegrounds, via Sih Gates), Kumhau (Woh Gates (D-8) to Outer Ra'Kaznar map 2, then the elevator at (I-8)).",
            "With no Naakual crests, walk the whole way from the start of Outer Ra'Kaznar, by the Augural Conveyor and the Kamihr Drifts exit.",
        },
    },

    -- ========================================================
    -- FINAL CHAPTER
    -- ========================================================

    [342] = {
        name = "Teodor's Summons",
        number = "5-3",
        mission_type = "Cutscene",
        steps = {
            "After the cutscene you are in Kamihr Drifts. Examine the Alpine Trail at (H-5) (Bivouac #3 is closest) for a cutscene.",
            "Choose \"I thought he was a libertine, myself.\" You receive an Ash runic board.",
        },
    },

    [344] = {
        name = 'The Seventh Guardian',
        number = "5-3-1",
        mission_type = "Cutscene",
        steps = {
            "In Rala Waterways, speak with " .. ACTOR.YEGGHA_DOLASHI.text .. " for a cutscene. The Eastern Adoulin (F-7) entrance (waypoints #1 and #4, Home Point #1) is closest.",
        },
    },

    [346] = {
        name = 'Watery Grave',
        number = "5-3-2",
        mission_type = "BCNM",
        reward = "20,000 Bayld each for repeat fights; ability to obtain Key Item: Prototype sigil pearl",
        steps = {
            "Examine the Entrance: Coliseum at (M-6) in Rala Waterways to fight Teodor.",
            "He surrenders below 10%. He deals steady area damage and uses Dread Spikes, which will kill melee attackers if not dispelled. He resists Sanguine Blade.",
            "If you lose, wait until the next game day and re-enter Rala Waterways; your Blank ash runic board turns back into an Ash runic board.",
        },
    },

    [350] = {
        name = 'Blood for Blood',
        number = "5-3-3",
        mission_type = "Cutscene",
        steps = {
            "Reach the bottom of " .. ACTOR.TURRIS.text .. " and examine the Ominous Postern for a cutscene. Ra'Kaznar Inner Court Home Point #1 is right next to the entrance.",
        },
    },

    [352] = {
        name = 'Reckoning',
        number = "5-4",
        mission_type = "BCNM",
        reward = "20,000 Bayld each for repeat fights",
        steps = {
            "Examine the Ominous Postern in " .. ACTOR.TURRIS.text .. " to fight Hades (first form) with Arciela. The mission fails if she dies. Drawing your weapon starts the fight.",
            "Winning plays another cutscene and gives the Awakened crystallized psyche.",
        },
    },

    [356] = {
        name = 'Abomination',
        number = "5-4-1",
        mission_type = "BCNM",
        reward = "25,000 Bayld each for repeat fights",
        steps = {
            "Examine the Ominous Postern in Ra'Kaznar Turris to fight Hades (second form). Drawing your weapon starts the fight.",
            "Arciela and Teodor help, and the mission fails if either dies. You can only heal Arciela, so keep Hades off Teodor. Hades' HP bar stays hidden.",
            "If you lose, re-enter Ra'Kaznar Inner Court for another Awakened crystallized psyche. Winning ends with you in Ceizak Battlegrounds.",
        },
    },

    [360] = {
        name = 'Undying Light',
        number = "5-5",
        mission_type = "Cutscene",
        reward = "Game day: wait for the next mission",
        steps = {
            "Enter Western Adoulin from Ceizak Battlegrounds.",
            "Proceed to the Castle Gates in Eastern Adoulin.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " and complete the final sequence.",
        },
    },

    [368] = {
        name = 'The Light Within',
        number = "5-5-1",
        mission_type = "Cutscene - Finale",
        reward = "Councilor's Cuffs; Councilor's Garb; one of: Adoulin Ring, Gorney Ring, Haverton Ring, Janniston Ring, Karieyh Ring, Orvail Ring, Renaye Ring, Shneddick Ring, Thurandaut Ring, Vocane Ring, Weatherspoon Ring, Woltaris Ring",
        steps = {
            "Wait until the next Vana'diel day after Undying Light.",
            "Zone into Ceizak Battlegrounds for a cutscene. (Answering \"No?\" about a dozen times gives extra dialogue and a key item, but drops your bond with Arciela to the lowest.)",
            "Return to the Castle Gates in Eastern Adoulin.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " for the final reward sequence.",
            "Choose your ring reward.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " again, then examine the Sandy Overlook at (J-10) in Ceizak Battlegrounds (near waypoint #1) for Trust: Arciela. You need it for The Silent Forest (Siren).",
            "If the end of the cutscene freezes, lower your frame rate to 30 fps. If you drop the ring or Councilor's gear, Ploh returns one piece per game day; to swap rings, trade her yours with 300,000 bayld.",
        },
    },
}

return M