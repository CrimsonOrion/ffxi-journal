--[[
    A Moogle Kupo d'Etat - Mission Database
    ========================================

    M.MISSIONS:
        Official numeric mission IDs extracted from DAT 0xD9B8.

    M.STEPS:
        Walkthrough entries using the same mission IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'A Moogle Kupo d\'Etat',
    [1] = 'Drenched! It Began with a Raindrop',
    [2] = 'Hasten! In a Jam in Jeuno?',
    [3] = 'Welcome! To My Decrepit Domicile',
    [4] = 'Curses! A Horrifically Harrowing Hex',
    [5] = 'An Errand! The Professor\'s Price',
    [6] = 'Shock! Arrant Abuse of Authority',
    [7] = 'Lender Beware! Read the Fine Print',
    [8] = 'Rescue! A Moogle\'s Labor of Love',
    [9] = 'Roar! A Cat Burglar Bares Her Fangs',
    [10] = 'Relief! A Triumphant Return',
    [11] = 'Joy! Summoned to a Fabulous Fete',
    [12] = 'A Challenge! You Could Be a Winner',
    [13] = 'Smash! A Malevolent Menace',
    [14] = 'A Moogle Kupo d\'Etat (Fin.)',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- MISSION 1
    -- ========================================================

    [0] = {
        name = "A Moogle Kupo d'Etat",
        steps = {
            "Reach level 10.",
            "Enter your home nation Mog House and speak with " .. ACTOR.HOME_MOG_HOUSE_MOOGLE.text .. ".",
        },
    },

    -- ========================================================
    -- MISSION 2
    -- ========================================================

    [1] = {
        name = "Drenched! It Began with a Raindrop",
        steps = {
            "Speak with " .. ACTOR.HOME_MOG_HOUSE_MOOGLE.text .. " in your home nation Mog House.",
            "Get an Orcish Armor Plate from Orcs in Yughott Grotto.",
            "Obtain a Quadav Backscale from Quadavs in Palborough Mines.",
            "Obtain a Yagudo Caulk from Yagudos in Giddeus.",
            "Trade all three at once to " .. ACTOR.HOME_MOG_HOUSE_MOOGLE.text .. " in the Mog House of your current nation of allegiance.",
        },
    },

    -- ========================================================
    -- MISSION 3
    -- ========================================================

    [2] = {
        name = "Hasten! In a Jam in Jeuno?",
        steps = {
            "Examine the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 4
    -- ========================================================

    [3] = {
        name = "Welcome! To My Decrepit Domicile",
        steps = {
            "The three key items can be gathered in any order, even before the Moogle asks. They are random and can take 50+ tries: fill your inventory first so the point keeps going without moving, and bring a stack of each tool.",
            "Mine a Sturdy metal strip in Gusgen Mines, Palborough Mines or Ifrit's Cauldron.",
            "Log a Piece of rugged tree bark in East Ronfaure, Jugner Forest, Ghelsba Outpost or Yuhtunga Jungle.",
            "Harvest a Savory lamb roast in Giddeus or West Sarutabaruta.",
            "Examine the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields once per key item (three cutscenes).",
        },
    },

    -- ========================================================
    -- MISSION 5
    -- ========================================================

    [4] = {
        name = "Curses! A Horrifically Harrowing Hex",
        steps = {
            "Speak with " .. ACTOR.SHANTOTTO.text .. " in Windurst Walls (K-7) for a cutscene. She asks for a Ripe starfruit, and the next mission starts.",
        },
    },

    -- ========================================================
    -- MISSION 6
    -- ========================================================

    [5] = {
        name = "An Errand! The Professor's Price",
        steps = {
            "Enter Outer Horutoto Ruins from West Sarutabaruta (F-11) and kill Cardians for one or more Orbs (Swords, Cups, Batons, Coins).",
            "Each Orb the battle starter holds removes one immunity from the Custom Cardians: Swords = slashing, Batons = blunt, Cups = piercing, Coins = magic. Holding 1-2 Orbs means 15 Cardians, 3 means 10, all 4 means 5. Only the starter's Orbs count, and everyone's are used up.",
            "Zone into Outer Horutoto Ruins from East Sarutabaruta (H-3) and examine the " .. ACTOR.MAGICAL_GIZMO.text .. " on the platform in front of you (H-6) to start the battle. No Trusts.",
            "Defeat the Custom Cardians. You get 500 experience, a Ripe starfruit and a Peach coral key. Redeem it at the red treasure coffer in Tenshodo HQ, Lower Jeuno (J-8).",
            "Return to " .. ACTOR.SHANTOTTO.text .. " in Windurst Walls and pay her 5,000 gil.",
            "Examine the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 7
    -- ========================================================

    [6] = {
        name = "Shock! Arrant Abuse of Authority",
        steps = {
            "Your Moogle names a random zone to go chocobo digging in. Bring a stack (or more) of Gysahl Greens.",
            "Each dig gives a direction and a hint of distance, from coldest to hottest: favored by moogles (freezing), enjoy traversing (very cold), to a moogle's liking (cold), been through this way (warm), frequents this spot (hot), digging in the immediate vicinity (very hot: you're on top of it).",
            "Dig until you find the Moldy, worm-eaten chest. Its spot changes if you leave the zone.",
            "Return to the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 8
    -- ========================================================

    [7] = {
        name = "Lender Beware! Read the Fine Print",
        steps = {
            "Obtain a Sahagin Key.",
            "Go to Sea Serpent Grotto (Norg is closest) and examine the " .. ACTOR.SHADY_SCONCE.text .. " for a cutscene. Examine it twice if it doesn't register.",
            "Use the Sahagin Key on the " .. ACTOR.SEA_SERPENT_ORNAMENTAL_DOOR.text .. " (only one party member needs a key).",
            "Continue to Map 5 and examine the " .. ACTOR.WATERFALL_BASIN.text .. " at (H-6) for a cutscene.",
            "Return to the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields.",
        },
    },

    -- ========================================================
    -- MISSION 9
    -- ========================================================

    [8] = {
        name = "Rescue! A Moogle's Labor of Love",
        steps = {
            "You must have the Map of the Quicksand Caves; the Goblin marks the stone spots on it.",
            "Reach the Goblin Geologist (J-11) on Quicksand Caves Map 5: the Geomagnetic Fount waypoint (go east, right after the door; don't fall in the hole), or the hidden Western Altepa Desert (D-12) entrance (Quicksand Caves Home Point #1, exit 5 at (H-4), then south). Speak with him.",
            "Collect the nine stones (Surya, Chandra, Mangala, Budha, Brihaspati, Shukra, Shani, Rahu, Ketu) from the ??? marked in green on your map. The marks are random, saved on your PC, and don't clear when collected, so note which you've done. Use \"Change Map\" to plan.",
            "Possible maps: Map 5 via Western Altepa (G-5) entrance 6 (Kuftal Tunnel Survival Guide); Maps 3 and 4 via Western Altepa (J-9) entrance 2 (Unity Warp level 125; Map 4 is exit C at (D-11)); Map 1 via Eastern Altepa (K-7) entrance 1 (Unity Warp level 125 to Quicksand Caves); Map 2 via Eastern Altepa (H-10) entrance 4 (Survival Guide). Many are one-way drops; Teleport-Altep, Instant Warp or Quicksand Caves Home Point #2 help.",
            "Return to the " .. ACTOR.GOBLIN_GEOLOGIST.text .. " with all nine for the Navaratna talisman.",
            "Go to the Chamber of Oracles and examine the " .. ACTOR.CHAMBER_OF_ORACLES_SHIMMERING_CIRCLE.text .. " for a cutscene. From the Goblin: weight pad at (I-9), west to the pad at (H-7), drop down the hole in the next room, then (D-4). The pads need a Galka, a Loadstone, 2 Hume/Elvaan/Mithra or 3 Tarutaru (Trusts don't count). Unlock Home Point #1 outside.",
        },
    },

    -- ========================================================
    -- MISSION 10
    -- ========================================================

    [9] = {
        name = "Roar! A Cat Burglar Bares Her Fangs",
        steps = {
            "Examine the " .. ACTOR.CHAMBER_OF_ORACLES_SHIMMERING_CIRCLE.text .. " in the Chamber of Oracles (Quicksand Caves Home Point #1) and enter the battlefield. Trusts allowed.",
            "Fight Nanaa Mihgo (dagger skills; King Cobra Clamp is a cone with Paralyze, Stun and Poison; twice calls Bopa Greso or Cha Lebagta) with a Goblin Repossessor (THF), Intimidator (WAR) and Enforcer (RDM). Everything can be slept: sleep Nanaa while you clear the Goblins.",
            "Defeating Nanaa Mihgo wins. You get a Red coral key and a cutscene. Redeem it at the red treasure coffer in Tenshodo HQ, Lower Jeuno (J-8).",
        },
    },

    -- ========================================================
    -- MISSION 11
    -- ========================================================

    [10] = {
        name = "Relief! A Triumphant Return",
        steps = {
            "Examine the " .. ACTOR.INCONSPICUOUS_DOOR.text .. " in Upper Jeuno (H-8), across from Durable Shields for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 12
    -- ========================================================

    [11] = {
        name = "Joy! Summoned to a Fabulous Fete",
        steps = {
            "Zone into Castle Zvahl Baileys (Survival Guide is quickest) for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 13
    -- ========================================================

    [12] = {
        name = "A Challenge! You Could Be a Winner",
        steps = {
            "Examine the " .. ACTOR.SHADOWY_PILLAR.text .. " at Castle Zvahl Baileys (J-8).",
            "Go to Beaucedine Glacier (Survival Guide) and examine the " .. ACTOR.LONELY_EVERGREEN.text .. " in the center (G-7) for a cutscene.",
            "Speak with the " .. ACTOR.GOBLIN_GRENADIER.text .. " at the tower (H-8). You need the Map of the Northlands. Don't leave the zone until the chest is open, or it resets.",
            "Touch the six Pips (green map markers) to see their elements. Lay the six out as on the map and draw a line between each pair that touches straight across or up/down (not diagonally) and are neighbors in the week: Fire, Earth, Water, Wind, Ice, Lightning, Light, Dark (Dark wraps back to Fire). The lines draw a digit like a digital clock.",
            "Give the " .. ACTOR.GOBLIN_GRENADIER.text .. " the digit (up to two extra hints allowed) for the Pocket mogbomb, plus 5 minutes of Flee if you used no hints.",
            "Return to the " .. ACTOR.LONELY_EVERGREEN.text .. " for the Trivia Challenge Kupon.",
            "In Xarcabard, answer three questions about your own character at " .. ACTOR.XARCABARD_OPTION_1.text .. ", " .. ACTOR.XARCABARD_OPTION_2.text .. " and " .. ACTOR.XARCABARD_OPTION_3.text .. ", in any order. Divide the bigger option by the smaller: about 2 means pick the bigger, about 1.5 the smaller; if one option is 0, pick 0.",
            "You get the Gauntlet Challenge Kupon.",
            "Zone into Castle Zvahl Baileys and speak to the " .. ACTOR.SHADOWY_PILLAR.text .. " by the zone line. You drop to level 1 with Sneak, Invisible and Deodorize (3-7 minutes; bring Prism Powder and Silent Oil).",
            "Reach " .. ACTOR.FLAMES_OF_FATE.text .. " within 8 minutes: on the floor below the last torch on the left at (G-8), just before the stairs into Castle Zvahl Keep (don't go up them). Drop Invisible to click it for the Festival Souvenir Kupon.",
            "Zone into Castle Zvahl Keep and speak to the " .. ACTOR.OMINOUS_PILLAR.text .. " by the zone line. It asks you to find a slacking moogle.",
            "Take exit A or B, then C to Map 3, and ride the beastmen beacon teleporters. After each one, check the Craggy Pillar in that room (after the 4th, it's in the next room south) until one gives the Mega Bonanza Kupon. Don't zone into the next area by accident.",
            "Examine " .. ACTOR.CRAGGY_PILLAR_1.text .. ".",
            "Examine " .. ACTOR.CRAGGY_PILLAR_2.text .. ".",
            "Examine " .. ACTOR.CRAGGY_PILLAR_3.text .. ".",
            "Examine " .. ACTOR.CRAGGY_PILLAR_4.text .. ".",
            "Continue through the Throne Room and examine the " .. ACTOR.THRONE_ROOM_DOOR.text .. " for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 14
    -- ========================================================

    [13] = {
        name = "Smash! A Malevolent Menace",
        steps = {
            "Examine the " .. ACTOR.THRONE_ROOM_DOOR.text .. " in Castle Zvahl Keep to enter the battlefield. Trusts allowed.",
            "Riko Kupenreich throws bombs in a cone with knockback (Barfira helps) and teleports. Washtub is an AoE that 3 shadows absorb, Bill Toss inflicts Terror, and Crystalline Flare draws you in for heavy AoE damage plus Blind and Stun. He resists Sleep but can be Stunned. Slow and Spikes do nothing.",
            "At 50% damage taken he retreats to the dais with 2 untouchable Moogle White Mages curing him and sends 5 Black Mages (sleepable, killable; -ga III and tier IV nukes). He returns once he's healed or the Black Mages are dead. This repeats; the last time he stays and fights alongside them, the most dangerous phase.",
            "Everything takes extra damage but has very high HP. Win for the Angel skin key and Oxblood key. If you lose, restart A Challenge! from the Lonely Evergreen in Beaucedine Glacier.",
        },
    },

    -- ========================================================
    -- MISSION 15
    -- ========================================================

    [14] = {
        name = "A Moogle Kupo d'Etat (Fin.)",
        steps = {
            "Examine the " .. ACTOR.TENSHODO_TREASURE_CHEST.text .. " in Tenshodo HQ, Lower Jeuno (J-8), and use the Angel skin key: Champion's Galea, Anwig Salade or Selenian Cap.",
            "The Oxblood Key can be used at the same coffer for its separate reward.",
            "Completion unlocks the ability to purchase Atma of Dread.",
            "To re-roll the augment: toss the helm, redeem any Angel skin key you still hold, buy a Mega Bonanza Kupon from " .. ACTOR.SQUINTROX_DRYEYES.text .. " in Port Jeuno (2,000 gil and 20 Beastmen's Seals) and win the Throne Room fight again (once per Japanese midnight).",
        },
    },
}

return M