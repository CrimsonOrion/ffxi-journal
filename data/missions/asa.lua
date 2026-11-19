--[[
    A Shantotto Ascension - Mission Database
    ==========================================

    Mission IDs and walkthrough IDs are kept separate.

    M.MISSIONS:
        Official numeric mission IDs extracted from DAT 0xD9B9.

    M.STEPS:
        Walkthrough entries using the same mission IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'A Shantotto Ascension',
    [1] = 'Burgeoning Dread',
    [2] = 'That Which Curdles Blood',
    [3] = 'Sugar-coated Directive',
    [4] = 'Enemy of the Empire (I)',
    [5] = 'Enemy of the Empire (II)',
    [6] = 'Sugar-coated Subterfuge',
    [7] = 'Shantotto in Chains',
    [8] = 'Fountain of Trouble',
    [9] = 'Battaru Royale',
    [10] = 'Romancing the Clone',
    [11] = 'Sisters in Arms',
    [12] = 'Project: Shantottofication',
    [13] = 'An Uneasy Peace',
    [14] = 'A Shantotto Ascension (Fin)',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- MISSION 1 / TRACKER ID 0
    -- ========================================================

    [0] = {
        name = "A Shantotto Ascension",
        steps = {
            "Reach level 10.",
            "Zone into Windurst Walls from Windurst Woods or Windurst Waters for a cutscene. Entering any other way (Mog House, Home Point) doesn't trigger it.",
            "If you chose to postpone, the mission shows as \"To Start ASA...\"; use the Tales' Beginning book at Windurst Walls (C-6)/(D-6) to start it.",
        },
    },

    -- ========================================================
    -- MISSION 2 / TRACKER ID 1
    -- ========================================================

    [1] = {
        name = "Burgeoning Dread",
        steps = {
            "Enter East Sarutabaruta or West Sarutabaruta through one of Windurst's gates.",
            "Complete the cutscene and note which Enfeeblement Kit you are instructed to create.",
        },
    },

    -- ========================================================
    -- MISSION 3 / TRACKER ID 2
    -- ========================================================

    [2] = {
        name = "That Which Curdles Blood",
        steps = {
            "Create the Enfeeblement Kit requested during Burgeoning Dread. The required kit is one of Silence, Sleep, Poison, or Blindness.",
            "If you need the recipe, speak with " .. ACTOR.KUROIDO_MOIDO.text .. " in Port Windurst, or with Faulpie in Southern San d'Oria or Abd-al-Raziq in Bastok Mines.",
            "The kit takes a Padded Box (Earth Crystal, 2 Bast Parchment, Inferior Cocoon; or from a Woodworking Kit 5), 2 Fine Parchment (Dark Crystal, Parchment, Pumice Stone), 2 Enchanted Ink (Dark Crystal, Black Ink, Magicked Blood) and the matching Silencing, Sleeping, Poison or Blinding Potion, combined with an Earth Crystal.",
            "The parts can be bought or traded, but you must synthesize the kit yourself. Alchemy 10 is recommended; bring spare parts in case the synth fails.",
            "Trade the kit to " .. ACTOR.QUFIM_TRODDEN_SNOW.text .. " on Qufim Island (H-7) for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 4 / TRACKER ID 3
    -- ========================================================

    [3] = {
        name = "Sugar-coated Directive",
        steps = {
            "After the Qufim Island event, receive six seals.",
            "At each protocrystal, examine it once to use the seal, then again to enter the battlefield (no Trusts; content level about 40, soloable around level 55-60). The weakened Prime avatar only dies after trying Astral Flow five times.",
            "At the " .. ACTOR.IFRITS_CAULDRON_PROTOCRYSTAL.text .. ", defeat Ifrit Prime.",
            "At the " .. ACTOR.FEIYIN_PROTOCRYSTAL.text .. ", defeat Shiva Prime.",
            "At the " .. ACTOR.CAPE_TERIGGAN_PROTOCRYSTAL.text .. ", defeat Garuda Prime.",
            "At the " .. ACTOR.BOYAHDA_PROTOCRYSTAL.text .. ", defeat Ramuh Prime.",
            "At the " .. ACTOR.DEN_OF_RANCOR_PROTOCRYSTAL.text .. ", defeat Leviathan Prime.",
            "At the " .. ACTOR.QUICKSAND_PROTOCRYSTAL.text .. ", defeat Titan Prime.",
            "After each win, examine the protocrystal again for its counterseal. If you left before getting it, just come back; you don't refight.",
            "With at least three counterseals, examine " .. ACTOR.QUFIM_TRODDEN_SNOW.text .. " on Qufim Island (H-7) for a cutscene. Gil reward: 3 seals 3,000; 4 seals 10,000; 5 seals 30,000; 6 seals 50,000.",
        },
    },

    -- ========================================================
    -- MISSION 5 / TRACKER ID 4
    -- ========================================================

    [4] = {
        name = "Enemy of the Empire (I)",
        steps = {
            "Speak with " .. ACTOR.ANDRAUSE.text .. " in Norg (I-8). He names three Sea Serpent Grotto monsters to photograph and sells a Soultrapper with 12 Blank Soul Plates for 800 gil (12 more plates each day).",
            "Equip the Soultrapper (ranged) and Blank Soul Plates (ammo), then use it on each target from your inventory or with /item \"Soultrapper\" <t>. It can't be used under Sneak or Invisible, and sometimes fails; just retry.",
            "Where they live in Sea Serpent Grotto: open area: Bigclaw, Brook/Riparian/Rivulet Sahagin, Royal Leech, Undead Bats, Grotto Pugil. Silver Beastcoin door: Sea Bonze. Mythril Beastcoin door: Blubber Eyes, Bog/Marsh/Swamp Sahagin, Rock Crab, Razorjaw Pugil, Sahagin Parasite. Gold Beastcoin door (Unity Warp level 125 puts you past it): Coastal/Delta/Lagoon/Shore Sahagin, Devil Manta, Dire Bat, Mousse, Robber Crab.",
            "Trade the three Soul Plates to " .. ACTOR.ANDRAUSE.text .. " one at a time for the Black book.",
            "Go to Gustav Tunnel and examine the " .. ACTOR.GUSTAV_OUTCROPPING.text .. " at (F-10) for a cutscene. The Gustav Tunnel Survival Guide is at the other end; Unity Warp (level 128) to Cape Teriggan can be faster.",
        },
    },

    -- ========================================================
    -- MISSION 6 / TRACKER ID 5
    -- ========================================================

    [5] = {
        name = "Enemy of the Empire (II)",
        steps = {
            "Examine the " .. ACTOR.GUSTAV_OUTCROPPING.text .. " at (F-10) in Gustav Tunnel again to start the fight; the Black book is used up, so you need another if you lose.",
            "Renfred, Bompupu and Gorattz start untargetable and send four clones each (weak, casting Ninjutsu). After a while the real agents join (more HP, keep casting Utsusemi) and must be defeated; their clones vanish when they die. No Trusts, but your buffs carry in; Phalanx blocks everything except Bompupu's nukes.",
            "You get a Cactuar key. Redeem the key at the red treasure coffer in Tenshodo Headquarters, Lower Jeuno (J-8).",
            "Examine the " .. ACTOR.GUSTAV_OUTCROPPING.text .. " again for the final cutscene. The final cutscene often freezes under Ashita or Windower, even at the default frame rate. The mission still counts: disconnect and log back in. The Goblin Footprint at (K-6)/(K-7) replays it if you trade it an item or gil (returned).",
        },
    },

    -- ========================================================
    -- MISSION 7 / TRACKER ID 6
    -- ========================================================

    [6] = {
        name = "Sugar-coated Subterfuge",
        steps = {
            "Travel to Lower Jeuno.",
            "Enter Tenshodo Headquarters and speak with " .. ACTOR.ALDO_TENSHODO.text .. ".",
        },
    },

    -- ========================================================
    -- MISSION 8 / TRACKER ID 7
    -- ========================================================

    [7] = {
        name = "Shantotto in Chains",
        steps = {
            "Examine " .. ACTOR.RO_MAEVE_ENSORCELLED_DOOR.text .. " at Ro'Maeve (B-10), southwest corner. There's no cutscene; you're told about a hexagonal depression.",
            "Get six fragment key items from NMs (everyone in the party gets one when it drops; high rate but not guaranteed; Treasure Hunter doesn't help). Each NM despawns 5 minutes after being engaged and respawns 2 minutes later. Each one only takes one kind of damage, so pick Trusts accordingly.",
            ACTOR.LODE_GOLEM.text .. " at Ro'Maeve (E-9)/(E-10): blue fragment. Only Ice, Water, Earth or Dark magic hurts it (Quick Draw works).",
            ACTOR.FIRED_URN.text .. " at Ro'Maeve (K-9)/(K-10): purple fragment. Only slashing damage hurts it.",
            ACTOR.STEELY_WEAPON.text .. " at Ro'Maeve (G-10)/(G-11): yellow fragment. Only ranged weapons hurt it (not Daken).",
            "The Sanctuary of Zi'Tah NMs only appear from 17:00 to 7:00 Vana'diel time.",
            ACTOR.HOLEY_HORROR.text .. " at Zi'Tah (H-8): green fragment. Only piercing melee damage (Daken works, ranged doesn't).",
            ACTOR.SKELETON_SCUFFLER.text .. " at Zi'Tah (F-8): red fragment. Only blunt damage (Quick Draw does very little).",
            ACTOR.BLEST_BONES.text .. " at Zi'Tah (F-7): beige fragment. Only Thunder, Fire, Wind or Light magic (Quick Draw works).",
            "Return to " .. ACTOR.RO_MAEVE_ENSORCELLED_DOOR.text .. " for a cutscene. The final cutscene often freezes under Ashita or Windower, even at the default frame rate. The mission still counts: disconnect and log back in.",
        },
    },

    -- ========================================================
    -- MISSION 9 / TRACKER ID 8
    -- ========================================================

    [8] = {
        name = "Fountain of Trouble",
        steps = {
            "Travel to Toraimarai Canal through Inner Horutoto Ruins or Windurst Walls.",
            "At max level you only need one: warp to Toraimarai Canal Home Point #1 and grab the Dark sap crystal nearby. Below level 99, collect them all; each weakens that element's Astral Flow in the next fight.",
            "Obtain the Dark Sap crystal at (F-8), Map 1.",
            "Obtain the Earth Sap crystal at (J-8) or (H-7), Map 1.",
            "Obtain the Water Sap crystal at (H-7) or (J-9), Map 1.",
            "Obtain the Fire Sap crystal at (J-9), Map 1, or (F-10)/(J-8), Map 2.",
            "Obtain the Ice Sap crystal at (I-8) or (H-7), Map 2.",
            "Obtain the Light Sap crystal at (G-8), Map 2; there are two possible positions.",
            "Obtain the Lightning Sap crystal at (H-7), Map 1, or (G-10/G-11), Map 2.",
            "Obtain the Wind Sap crystal at (H-9) or (J-9), Map 2.",
            "Go to Full Moon Fountain and examine the " .. ACTOR.MOON_SPIRAL.text .. " with at least one sap for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 10 / TRACKER ID 9
    -- ========================================================

    [9] = {
        name = "Battaru Royale",
        steps = {
            "Examine the " .. ACTOR.MOON_SPIRAL.text .. " again (with at least one sap) and enter the Battaru Royale battlefield. Trusts allowed.",
            "Defeat the eight Tarutaru clones (Boulders, Torrents, Gusts, Flames, Glaciers, Sparks, Lights, Shadows). Each casts spells of its element and, around 50% HP, summons its avatar for one Astral Flow.",
            "You get a Chocobo key. Redeem the key at the red treasure coffer in Tenshodo Headquarters, Lower Jeuno (J-8).",
        },
    },

    -- ========================================================
    -- MISSION 11 / TRACKER ID 10
    -- ========================================================

    [10] = {
        name = "Romancing the Clone",
        steps = {
            "Return to Tenshodo Headquarters in Lower Jeuno.",
            "Speak with " .. ACTOR.ALDO_TENSHODO.text .. ".",
        },
    },

    -- ========================================================
    -- MISSION 12 / TRACKER ID 11
    -- ========================================================

    [11] = {
        name = "Sisters in Arms",
        steps = {
            "Make your way through the Temple of Uggalepih and Den of Rancor to the Mahogany Door in the Sacrificial Chamber. Glowing ??? along the way give Tablets of Hexes, each a buff in the next fight.",
            "At max level one tablet is enough: warp to Den of Rancor Home Point #1, exit south via the switch, take Tablet of Hexes: Blight at (H-9) on Map 2, warp back and continue. Below level 99, collect all 16.",
            "Temple of Uggalepih: Malice (F-10) Map 1, Deceit (F-8) Map 1, Envy (F-8) Map 2, Greed (G-10) Map 2, Pride (J-11) Map 2, Bale (I-8) Map 2.",
            "Den of Rancor: Regret (E-5), Strife (H-6), Dolor (J-9), Agony (E-10), Rancor (F-11), Rage (K-11), Despair (J-13) on Map 1; Death (L-13) and Blight (H-9) on Map 2; Penury (F-9) on Map 3.",
            "Obtain four Rancor Flames to pass through the Sacrificial Chamber entrance unless its Home Point is already unlocked.",
            "Examine the " .. ACTOR.SACRIFICIAL_CHAMBER_MAHOGANY_DOOR.text .. " for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 13 / TRACKER ID 12
    -- ========================================================

    [12] = {
        name = "Project: Shantottofication",
        steps = {
            "Examine the " .. ACTOR.SACRIFICIAL_CHAMBER_MAHOGANY_DOOR.text .. " again and enter Project: Shantottofication. Tablets are used on entry; a full set gives +150 to elemental resistances and all stats, triple HP and MP, and a Reraise without Weakness. Soloable in item level 119 gear with Trusts.",
            "D. Shantotto uses high-tier magic and scythe skills (Salvation Scythe: AoE poison and paralysis); Shantotto uses magic and staff skills (Divine Malison: AoE stun, slow, silence, plague).",
            "When either reaches 50%, she rages: she can't drop below 1% until it ends, and the other comes over to skillchain on your target. If you wipe after that, it doesn't repeat on a retry without leaving.",
            "You get a Tonberry key. Redeem the key at the red treasure coffer in Tenshodo Headquarters, Lower Jeuno (J-8).",
        },
    },

    -- ========================================================
    -- MISSION 14 / TRACKER ID 13
    -- ========================================================

    [13] = {
        name = "An Uneasy Peace",
        steps = {
            "Zone into Windurst Walls from Windurst Woods or Windurst Waters (not the Mog House or a Home Point) for the final cutscene with Shantotto.",
            "Receive the Behemoth key.",
        },
    },

    -- ========================================================
    -- MISSION 15 / TRACKER ID 14
    -- ========================================================

    [14] = {
        name = "A Shantotto Ascension (Fin)",
        steps = {
            "Redeem the Behemoth key at the red coffer in Tenshodo Headquarters, Lower Jeuno (J-8): Blitzer Poleyn, Desultor Tassets or Tatsumaki Sitagoromo.",
            "The final reward also unlocks the ability to purchase Atma of Ambition.",
            "To re-roll the augment: use any Tonberry key first, get a tablet (or buy tablets from Squintrox Dryeyes in Port Jeuno for 2,000 gil and 20 Beastmen's Seals) and refight at the Mahogany Door for new Tonberry and Behemoth keys.",
        },
    },
}

return M