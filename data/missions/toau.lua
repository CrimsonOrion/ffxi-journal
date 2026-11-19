--[[
    Treasures of Aht Urhgan - Mission Database
    ============================================

    Mission IDs and walkthrough IDs are intentionally kept
    as separate identifiers.

    M.MISSIONS:
        Numeric mission IDs consumed by the mission tracker.

    M.STEPS:
        Existing walkthrough IDs used by the Journal.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'Land of Sacred Serpents',
    [1] = 'Immortal Sentries',
    [2] = 'President Salaheem',
    [3] = 'Knight of Gold',
    [4] = 'Confessions of Royalty',
    [5] = 'Easterly Winds',
    [6] = 'Westerly Winds',
    [7] = 'A Mercenary Life',
    [8] = 'Undersea Scouting',
    [9] = 'Astral Waves',
    [10] = 'Imperial Schemes',
    [11] = 'Royal Puppeteer',
    [12] = 'Lost Kingdom',
    [13] = 'The Dolphin Crest',
    [14] = 'The Black Coffin',
    [15] = 'Ghosts of the Past',
    [16] = 'Guests of the Empire',
    [17] = 'Passing Glory',
    [18] = 'Sweets for the Soul',
    [19] = 'Teahouse Tumult',
    [20] = 'Finders Keepers',
    [21] = 'Shield of Diplomacy',
    [22] = 'Social Graces',
    [23] = 'Foiled Ambition',
    [24] = 'Playing the Part',
    [25] = 'Seal of the Serpent',
    [26] = 'Misplaced Nobility',
    [27] = 'Bastion of Knowledge',
    [28] = 'Puppet in Peril',
    [29] = 'Prevalence of Pirates',
    [30] = 'Shades of Vengeance',
    [31] = 'In the Blood',
    [32] = "Sentinel's Honor",
    [33] = 'Testing the Waters',
    [34] = 'Legacy of the Lost',
    [35] = 'Gaze of the Saboteur',
    [36] = 'Path of Blood',
    [37] = 'Stirrings of War',
    [38] = 'Allied Rumblings',
    [39] = 'Unraveling Reason',
    [40] = 'Light of Judgment',
    [41] = 'Path of Darkness',
    [42] = 'Fangs of the Lion',
    [43] = "Nashmeira's Plea",
    [44] = 'Ragnarok',
    [45] = 'Imperial Coronation',
    [46] = 'The Empress Crowned',
    [47] = 'Eternal Mercenary',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    [0] = {
        name = "Land of Sacred Serpents",
        number = 1,
        mission_type = "Cutscene",
        steps = {
            "Obtain a Boarding Permit through The Road to Aht Urhgan or the Rhapsodies of Vana'diel progression.",
            "Take the ferry from Mhaura to Aht Urhgan Whitegate. Once you have the Boarding Permit you can skip the boat: Unity Warp (level 125) to Wajaom Woodlands puts you a short walk from Whitegate.",
            "Speak with Naja Salaheem in Salaheem's Sentinels, upstairs in the northeast corner of (I-10), for the key item Supplies package.",
            "Touch the Home Point in the residential area near the ferry dock if this is your first visit.",
        },
    },

    [1] = {
        name = "Immortal Sentries",
        number = 2,
        mission_type = "Quest",
        reward = "Key Item: PSC Wildcat badge; 150 Imperial Standing; Mog Locker access",
        steps = {
            "Speak with " .. ACTOR.NAJA.text .. " and receive the Supplies Package.",
            "Take the Supplies package to any Staging Point except Nyzul Isle (Azouph Isle, Dvucca Isle, Mamool Ja, Halvung or Ilrusi Atoll). You will want them all eventually. Tip: the Voidwatch warp (Atmacite Refiner > Aht Urhgan > Caedarva Mire, 1,000 cruor) puts you just outside Nashmau, close to the Azouph Isle Staging Point.",
            "Deliver the package to the blue-clad Immortal beside the Runic Portal first: touching the portal sends you straight back to Whitegate.",
            "Use the Runic Portal to return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. " to complete the mission.",
        },
    },

    [2] = {
        name = "President Salaheem",
        number = 3,
        mission_type = "Cutscene",
        reward = "Assault access",
        steps = {
            "Leave Aht Urhgan Whitegate and come back in (there is an exit to Wajaom Woodlands west of the office, under the stairs).",
            "Speak with Rytaal in the Commissions Agency (K-10, door at K-9) for an explanation of Assault, which unlocks it.",
            "Speak with Naja Salaheem twice for two cutscenes; this completes the mission and starts the next one.",
            "Optional: speak with Fubruhn (F-11) about Mog Locker access.",
        },
    },

    [3] = {
        name = "Knight of Gold",
        number = 4,
        mission_type = "Cutscene",
        reward = "Key Item: Raillefal's letter",
        steps = {
            "Speak with Cacaroon in Nashmau (G-11), across from the Mog House, for a cutscene.",
            "Trade Cacaroon 1,000 gil or one Imperial Bronze Piece for another cutscene (he won't take the gil automatically; you must trade it).",
            "Enter the Walahra Temple in Whitegate (K-8) for a cutscene.",
            "Go to the Shararat Teahouse (K-12) for a cutscene and answer: pick all three topics, then \"Raillefal's secret\", then \"A San d'Orian prince\", then \"Prince Trion\".",
        },
    },

    [4] = {
        name = "Confessions of Royalty",
        number = 5,
        mission_type = "Quest",
        steps = {
            "Enter Chateau d'Oraguille from Northern San d'Oria (I-6) (Home Point #2 is closest).",
            "Speak with Halver (I-9) for a cutscene.",
        },
    },

    [5] = {
        name = "Easterly Winds",
        number = 6,
        mission_type = "Cutscene",
        reward = "Imperial Bronze Piece x10",
        steps = {
            "Wait one Earth minute after the previous mission.",
            "Approach the Palace in Ru'Lude Gardens for a cutscene.",
            "Answer \"Yes\" and then \"That's what I'm here for!\" to receive 10 Imperial Bronze Pieces (\"What am I, a donkey?\" also completes it, but without the coins).",
        },
    },

    [6] = {
        name = "Westerly Winds",
        number = 7,
        mission_type = "Cutscene",
        reward = "Imperial Silver Piece x2",
        steps = {
            "Go to the Shararat Teahouse in Whitegate (K-11) for a cutscene and the key item Raillefal's note. Your answers don't matter; you also get an Imperial Silver Piece.",
            "Speak with Naja Salaheem (I-10) for a cutscene and a second Imperial Silver Piece. If she asks for an Imp Wing, that's for the quest Promotion: Private First Class; trade one to continue.",
        },
    },

    [7] = {
        name = "A Mercenary Life",
        number = 8,
        mission_type = "Cutscene",
        steps = {
            "Leave Aht Urhgan Whitegate and return after the required transition.",
            "Speak with " .. ACTOR.NAJA.text .. " to continue the mercenary storyline.",
        },
    },

    [8] = {
        name = "Undersea Scouting",
        number = 9,
        mission_type = "Quest",
        reward = "Key Item: Astral compass",
        steps = {
            "Enter the Chamber of Passage in Whitegate (K-8) and take the Runic Portal to the Nyzul Isle Staging Point. If you haven't unlocked it, trade an Imperial Silver Piece to Kamih Mapokhalam in Bhaflau Thickets (F-6) and walk in through the Alzadaal Undersea Ruins.",
            "Take the southeastern transport device at (H-9) to the Bhaflau Remnants, then the right (eastern) one into the Alzadaal Undersea Ruins.",
            "A cutscene plays as you zone in, giving the key item Astral compass.",
        },
    },

    [9] = {
        name = "Astral Waves",
        number = 10,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
            "Wait until the next Vana'diel day before continuing.",
        },
    },

    [10] = {
        name = "Imperial Schemes",
        number = 11,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission",
        steps = {
            "After the required Vana'diel day has passed, leave the area and return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
            "Wait until the next Vana'diel day before continuing.",
        },
    },

    [11] = {
        name = "Royal Puppeteer",
        number = 12,
        mission_type = "Quest",
        reward = "Key Item: Vial of spectral scent",
        steps = {
            "After the required Vana'diel day has passed, return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Travel to Nashmau and speak with " .. ACTOR.PYOPYOROON.text .. ".",
            "Obtain Jody's Acid from Ameretats in Bhaflau Thickets or Wajaom Woodlands.",
            "Trade Jody's Acid to " .. ACTOR.PYOPYOROON.text .. ".",
            "Complete the resulting event and receive the Vial of Spectral Scent.",
        },
    },

    [12] = {
        name = "Lost Kingdom",
        number = 13,
        mission_type = "Quest/Fight",
        reward = "Key Item: Ephramadian gold coin",
        steps = {
            "Go to Caedarva Mire from the west exit of Nashmau (or Caedarva Mire Home Point #1, just northwest of it).",
            "Examine " .. ACTOR.JAZARATT_HEADSTONE.text .. " at (E-10) for a cutscene.",
            "Examine it again to spawn the Fomor NM Jazaraat, and defeat it.",
            "Examine the headstone a third time for the Ephramadian gold coin. Everyone joining the next two battles needs one, including players who have already finished them; they only need to touch the headstone.",
        },
    },

    [13] = {
        name = "The Dolphin Crest",
        number = 14,
        mission_type = "Cutscene",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
        },
    },

    [14] = {
        name = "The Black Coffin",
        number = 15,
        mission_type = "Dungeon/BCNM",
        steps = {
            "Every party member needs an Ephramadian gold coin (from Jazaraat's Headstone, Caedarva Mire E-10) to enter.",
            "Go to the Cutter at (H-8) on Map 5 of Arrapago Reef. Fastest is the Arrapago Ring (100 Imperial Standing accolades), if you have been there before. Otherwise take the Caedarva Mire Survival Guide and go south into Arrapago Reef at (G-8) (not the G-6 zone line right next to the guide), then south to the Cutter; or take the Dvucca Isle Staging Point and go west to the (F-9) entrance, paying its fee.",
            "Approach the Cutter for a cutscene, then examine it to enter the battlefield.",
            "Gessho helps you after a minute or two (the fight goes on if he falls), and Trusts are allowed. First come five Ashu Talif Crew (2 RNG, 2 RDM, 1 COR; they resist Sleep without Elemental Seal, Lullaby works at high item level), then four more along with the Ashu Talif Captain.",
            "Bring the Ashu Talif Captain down to about 20% HP to win. You end up in Nashmau.",
        },
    },

    [15] = {
        name = "Ghosts of the Past",
        number = 16,
        mission_type = "Cutscene",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
        },
    },

    [16] = {
        name = "Guests of the Empire",
        number = 17,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission; Imperial Mythril Piece; Salvage access",
        steps = {
            "Speak with " .. ACTOR.NAJA.text .. " and prepare for the palace visit.",
            "Wear an accepted body piece plus any gloves, leg armor and boots (they don't have to match). Multi-slot gear doesn't count for the other slots. Accepted body pieces include: Adaman Cuirass, Aketon, Amir Korazin, Arhat's Gi, Barone Corazza, Black Cloak, Black Cotehardie, Blessed Bliaut, Bloody Aketon, Blue Cotehardie, Brigandine, Byrnie, Cardinal Vest, Chasuble, Dragon Harness, Dusk Jerkin, Errant Houppelande, Hachiman Domaru, Haubergeon, Hauberk, Holy Breastplate, Homam Corazza, Igqira Weskit, Jaridah Peti, Justaucorps, Nashira Manteel, Noble's Tunic, Plastron, Pahluwan Khazagand, Rasetsu Samue, Scorpion Harness, Sha'ir Manteel, Sipahi Jawshan, Vermillion Cloak and Yigit Gomlek. Keep it: Imperial Coronation needs the same.",
            "Speak with Naja Salaheem again while wearing it, or the palace won't give the cutscene.",
            "Remove your weapons and examine the Imperial Whitegate door at (L-8) in Whitegate for a cutscene and an Imperial Mythril Piece reward. Make inventory space first, or you have to watch the whole scene again.",
        },
    },

    [17] = {
        name = "Passing Glory",
        number = 18,
        mission_type = "Cutscene",
        reward = "Unlocks Ashu Talif Assault",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
        },
    },

    [18] = {
        name = "Sweets for the Soul",
        number = 19,
        mission_type = "Cutscene",
        steps = {
            "Enter the Shararat Teahouse in Aht Urhgan Whitegate for a cutscene.",
        },
    },

    [19] = {
        name = "Teahouse Tumult",
        number = 20,
        mission_type = "Quest",
        steps = {
            "Go to Aydeewa Subterrane: its Survival Guide, Unity Warp (level 125) to Wajaom Woodlands (the zone line is right behind you), or the Wajaom Woodlands (G-7) entrance.",
            "Head to the western part of the zone (Map 5): from the Survival Guide go west on Map 2 and slide down drop point D; from (G-7) go south.",
            "Examine " .. ACTOR.AYDEEWA_TARGET.text .. " at (F-8/G-8) for a cutscene that completes the mission.",
        },
    },

    [20] = {
        name = "Finders Keepers",
        number = 21,
        mission_type = "Cutscene",
        steps = {
            "Return to Salaheem's Sentinels.",
            "Speak with " .. ACTOR.SALAHEEMS_SENTINELS.text .. ".",
            "Complete the cutscene.",
        },
    },

    [21] = {
        name = "Shield of Diplomacy",
        number = 22,
        mission_type = "BCNM",
        steps = {
            "Travel to the Navukgo Execution Chamber: Mount Zhayolm's Home Point is right outside it (without it, Unity Warp level 135 to Mount Zhayolm, turn around and take the east junction at the C-7/C-8 line). You get a cutscene on entering.",
            "Examine " .. ACTOR.DECORATIVE_BRONZE_GATE.text .. " for a cutscene, then again to enter the battlefield.",
            "Defeat Khimaira 13. Dreadstorm (AoE, Terror), Thunderstrike (AoE, Stun) and Tourbillion (AoE, knockback) remove Utsusemi; Tenebrous Mist resets your TP.",
            "Lady Karababa fights with you, casting fast Ancient Magic II. Keep her healed: if her HP drops too low she warps out and you lose.",
        },
    },

    [22] = {
        name = "Social Graces",
        number = 23,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission",
        steps = {
            "Return to Salaheem's Sentinels.",
            "Complete the cutscene.",
            "Wait until the required transition has passed before continuing.",
        },
    },

    [23] = {
        name = "Foiled Ambition",
        number = 24,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission; Imperial Gold Piece x5",
        steps = {
            "Leave the area and return to Salaheem's Sentinels after the required transition.",
            "Complete the cutscene.",
            "Receive five Imperial Gold Pieces.",
            "Wait until the next Vana'diel day before continuing.",
        },
    },

    [24] = {
        name = "Playing the Part",
        number = 25,
        mission_type = "Cutscene",
        steps = {
            "Return to " .. ACTOR.NAJA.text .. " after the required transition.",
            "Choose Aphmau when prompted.",
            "Complete the cutscene.",
        },
    },

    [25] = {
        name = "Seal of the Serpent",
        number = 26,
        mission_type = "Cutscene",
        steps = {
            "Remove your weapon and shield.",
            "Examine " .. ACTOR.IMPERIAL_GATE.text .. ".",
            "Complete the cutscene.",
        },
    },

    [26] = {
        name = "Misplaced Nobility",
        number = 27,
        mission_type = "Quest",
        steps = {
            "Go to Aydeewa Subterrane: its Survival Guide, Unity Warp (level 125) to Wajaom Woodlands (the zone line is right behind you), or the Wajaom Woodlands (G-7) entrance.",
            "Head to the western part of the zone (Map 5): from the Survival Guide go west on Map 2 and slide down drop point D; from (G-7) go south.",
            "Examine " .. ACTOR.AYDEEWA_TARGET.text .. " at (F-8/G-8), the same spot as Teahouse Tumult, for a cutscene that completes the mission.",
        },
    },

    [27] = {
        name = "Bastion of Knowledge",
        number = 28,
        mission_type = "Cutscene",
        steps = {
            "Enter the Walahra Temple in Aht Urhgan Whitegate for a cutscene.",
            "Choose the second dialogue option.",
        },
    },

    [28] = {
        name = "Puppet in Peril",
        number = 29,
        mission_type = "BCNM",
        steps = {
            "Go to the Jade Sepulcher: Bhaflau Thickets Home Point #1 is closest. Otherwise take the Mamool Ja Staging Point and head north to the zone line at (I-9) with Sneak and Invisible (or a mount).",
            "Examine " .. ACTOR.ORNAMENTAL_DOOR.text .. " for a cutscene, then again and choose \"Puppet in Peril\".",
            "Defeat Lancelord Gaheel Ja, a Paladin (Flash, Holy, Cures). Clobber and Blazing Angon are AoE. While Granite Skin is up, attacks from the front do nothing, so hit him from behind until it wears off.",
            "Winning plays a cutscene that completes the mission.",
        },
    },

    [29] = {
        name = "Prevalence of Pirates",
        number = 30,
        mission_type = "Cutscene",
        reward = "Key Item: Periqia Assault area entry permit",
        steps = {
            "Go to the Cutter at (H-8) on Map 5 of Arrapago Reef: the Arrapago Ring is fastest; or the Caedarva Mire Survival Guide and south into Arrapago Reef at (G-8) (not G-6); or the Dvucca Isle Staging Point and west to the (F-9) entrance (fee).",
            "You get a cutscene on entering Arrapago Reef.",
            "Approach " .. ACTOR.CUTTER.text .. " for another cutscene.",
            "Don't warp out: head south from the Cutter into Caedarva Mire for the next mission.",
        },
    },

    [30] = {
        name = "Shades of Vengeance",
        number = 31,
        mission_type = "BCNM",
        steps = {
            "Go to the Dvucca Isle Staging Point in Caedarva Mire (south from the Cutter into Caedarva Mire puts you close).",
            "Enter Periqia through the Runic Seal just west of where you arrive.",
            "Defeat the K23H1-LAMIA gathered at (H-9) (up to 10; true sight, they link, can be slept; every attack poisons, and Venomous Tail poisons hard). After a random number are down, the battle ends. Trusts are allowed.",
            "Complete the cutscene after winning the battle.",
            "If you fail, Nahshib gives another permit after one game day. Players who already finished it don't need a permit to help.",
        },
    },

    [31] = {
        name = "In the Blood",
        number = 32,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission; Imperial Gold Piece x1",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
            "Wait until the required transition has passed before continuing.",
        },
    },

    [32] = {
        name = "Sentinel's Honor",
        number = 33,
        mission_type = "Cutscene",
        steps = {
            "Wait a game day and zone, then speak with Naja Salaheem again.",
            "While you wait, get another Ephramadian gold coin from Jazaraat's Headstone in Caedarva Mire (E-10) (Home Point or Nashmau's west exit); the next mission needs it.",
        },
    },

    [33] = {
        name = "Testing the Waters",
        number = 34,
        mission_type = "Quest",
        reward = "Key Item: Percipient eye",
        steps = {
            "Make sure you have an Ephramadian gold coin (Jazaraat's Headstone, Caedarva Mire E-10).",
            "Go to the Cutter at (H-8) on Map 5 of Arrapago Reef (Arrapago Ring; or Caedarva Mire Survival Guide and south via the G-8 zone line; or Dvucca Isle Staging Point and the F-9 entrance).",
            "Approach " .. ACTOR.CUTTER.text .. " for a cutscene. You end up in Talacca Cove; don't warp away, the next mission is there.",
        },
    },

    [34] = {
        name = "Legacy of the Lost",
        number = 35,
        mission_type = "BCNM",
        steps = {
            "After the cutscene you're in Talacca Cove (others can join via Caedarva Mire Home Point #1).",
            "Examine " .. ACTOR.ROCK_SLAB.text .. " right in front of you to enter the battlefield (30 minutes).",
            "Fight Gessho, a Ninja who warps around the arena (often followed by a TP move), uses Ninjutsu, ranged attacks and Mijin Gakure. Happobarai (AoE, Stun) and Shibaraku (AoE, knockback) are blocked by shadows; Hane Fubuki poisons.",
            "He periodically summons 3-6 clones (about 2,000 HP each, immune to Sleep, gone after about 20 seconds) that can Mijin Gakure together with him, so spread out or kill them quickly.",
            "Gessho gives up at about 15% HP; a cutscene completes the mission.",
        },
    },

    [35] = {
        name = "Gaze of the Saboteur",
        number = 36,
        mission_type = "Cutscene",
        reward = "Key Item: Luminian dagger",
        steps = {
            "Zone into the Hazhalm Testing Grounds from Caedarva Mire Map 1 (D-9) for a cutscene. Caedarva Mire Home Point #1 is closest (or Nashmau's west exit).",
            "Examine " .. ACTOR.ENTRY_GATE.text .. " for the final cutscene.",
        },
    },

    [36] = {
        name = "Path of Blood",
        number = 37,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission",
        steps = {
            "Return to Salaheem's Sentinels.",
            "Complete the cutscene.",
            "Wait until the required transition has passed before continuing.",
        },
    },

    [37] = {
        name = "Stirrings of War",
        number = 38,
        mission_type = "Cutscene",
        reward = "Key Item: Allied Council Summons",
        steps = {
            "After the required Vana'diel day has passed, travel to the Shararat Teahouse.",
            "Complete the cutscene.",
            "Receive the Allied Council Summons.",
        },
    },

    [38] = {
        name = "Allied Rumblings",
        number = 39,
        mission_type = "Cutscene",
        reward = "Zone & Day: wait for the next mission",
        steps = {
            "Go to Ru'Lude Gardens and approach the Palace doors for a cutscene.",
            "Several cutscenes can play there; make sure you get the one where you speak with Trion directly.",
        },
    },

    [39] = {
        name = "Unraveling Reason",
        number = 40,
        mission_type = "Cutscene",
        steps = {
            "After the required transition, travel to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.PHERIMOCIEL.text .. ".",
            "Complete the cutscene.",
        },
    },

    [40] = {
        name = "Light of Judgment",
        number = 41,
        mission_type = "Cutscene",
        reward = "Key Item: Nyzul Isle route",
        steps = {
            "Travel to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.RODIN_COMIDIN.text .. " outside the Automaton Workshop (I-7).",
            "Prepare for a battle and go to the Nyzul Isle Staging Point.",
        },
    },

    [41] = {
        name = "Path of Darkness",
        number = 42,
        mission_type = "BCNM",
        steps = {
            "At the Nyzul Isle Staging Point, examine " .. ACTOR.NYZUL_BLANK.text .. " (the unlit lamp at J-9, next to the Runic Portals) and choose \"Yes\".",
            "Examine " .. ACTOR.RUNIC_SEAL.text .. " at (I-9), across the room, to enter the battlefield \"Path of Darkness\". Trusts are allowed.",
            "Naja Salaheem fights with you and must survive. Battle 1: Amnaf and four Imperial Gears, which only appear once Amnaf is aggroed. Pull Amnaf, let the gears spawn and gather their hate on yourself with AoE before they kill Naja (Gravity and Bind work on them; Amnaf can be slept).",
            "Battle 2: Amnaf warps one room over and fights again with four Triple Gears (easier to sleep). She gives up at about 25% HP.",
            "Battle 3: Amnaf alone, transformed into a Soulflayer. Her Sleepga resets hate on everyone it hits. Defeat her for a cutscene that completes the mission.",
            "If you fail, get another key item from Rodin-Comidin in Whitegate and try again.",
        },
    },

    [42] = {
        name = "Fangs of the Lion",
        number = 43,
        mission_type = "Cutscene",
        reward = "Key Item: Mythril mirror",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
        },
    },

    [43] = {
        name = "Nashmeira's Plea",
        number = 44,
        mission_type = "BCNM",
        steps = {
            "At the Nyzul Isle Staging Point, examine " .. ACTOR.NYZUL_BLANK.text .. " for a cutscene.",
            "Examine " .. ACTOR.RUNIC_SEAL.text .. " at (I-9) to enter the battlefield: three battles in 45 minutes, Trusts allowed.",
            "Battle 1, Raubahn: a Blue Mage who reraises twice (three kills), resetting his abilities each time. After every Azure Lore he casts a much stronger Eyes On Me, and his Circle Blade hurts mages. In the third round he's immune to whichever damage type (melee, magic or ranged) you used most; mixing types avoids the immunity.",
            "Battle 2, Razfahd: a stationary Paladin (Banish IV, Banishga III, Dia III, Holy II). At 50% HP he uses Perfect Defense and is immune to damage for a while.",
            "Battle 3, Alexander: stationary and usually the longest fight. Divine Judgement (1,000+ AoE, clears Utsusemi) comes at 50% and repeatedly after, announced by a line of Omega symbols. Gospel of the Lost heals about 1,000 and removes debuffs (stun it if you can); Draw In pulls the target back if they move too far; Radiant Sacrament and Void of Repentance are AoE and Terror. He also uses Perfect Defense.",
            "Winning gives a cutscene that completes the mission. If you fail, get another key item from Naja Salaheem.",
        },
    },

    [44] = {
        name = "Ragnarok",
        number = 45,
        mission_type = "Cutscene",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Approach " .. ACTOR.NAJA.text .. ".",
            "Complete the cutscene.",
        },
    },

    [45] = {
        name = "Imperial Coronation",
        number = 46,
        mission_type = "Cutscene",
        steps = {
            "Wear an accepted body piece (the same list as Guests of the Empire) plus any gloves, leg armor and boots. Accepted body pieces include: Adaman Cuirass, Aketon, Amir Korazin, Arhat's Gi, Barone Corazza, Black Cloak, Black Cotehardie, Blessed Bliaut, Bloody Aketon, Blue Cotehardie, Brigandine, Byrnie, Cardinal Vest, Chasuble, Dragon Harness, Dusk Jerkin, Errant Houppelande, Hachiman Domaru, Haubergeon, Hauberk, Holy Breastplate, Homam Corazza, Igqira Weskit, Jaridah Peti, Justaucorps, Nashira Manteel, Noble's Tunic, Plastron, Pahluwan Khazagand, Rasetsu Samue, Scorpion Harness, Sha'ir Manteel, Sipahi Jawshan, Vermillion Cloak and Yigit Gomlek.",
            "Remove all main-hand and off-hand equipment.",
            "Examine " .. ACTOR.IMPERIAL_GATE.text .. " at (L-8) in Whitegate for the coronation cutscene.",
        },
    },

    [46] = {
        name = "The Empress Crowned",
        number = 47,
        mission_type = "Cutscene",
        reward = "Imperial Standard; one of: Balrahn's Ring, Jalzahn's Ring, Ulthalam's Ring",
        steps = {
            "Complete the coronation event.",
            "Choose one of the three rings: Balrahn's Ring, Jalzahn's Ring, or Ulthalam's Ring.",
            "Receive the Imperial Standard.",
        },
    },

    [47] = {
        name = "Eternal Mercenary",
        number = 48,
        mission_type = "Cutscene - Finale",
        reward = "Glory Crown",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Speak with " .. ACTOR.NAJA.text .. ".",
            "Complete the final cutscene.",
            "Receive the Glory Crown.",
        },
    },

}

return M