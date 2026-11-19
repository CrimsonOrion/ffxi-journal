--[[
    Abyssea - Mission Database
    ===========================

    Mission IDs and walkthrough IDs are kept separate.

    M.MISSIONS:
        Official numeric mission IDs used by the mission tracker.

    M.STEPS:
        Walkthrough entries and their existing IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [160] = 'A Journey Begins',
    [161] = 'The Truth Beckons',
    [162] = 'Dawn of Death',
    [163] = 'A Goldstruck Gigas',
    [164] = 'To Paste a Peiste',
    [165] = 'Megadrile Menace',
    [166] = 'The Forbidden Frontier',
    [167] = 'First Contact',
    [168] = 'An Officer and a Pirate',
    [169] = 'Heart of Madness',
    [170] = 'Tenuous Existence',
    [171] = 'Champions of Abyssea',
    [172] = 'The Beast of Bastore',
    [173] = 'A Delectable Demon',
    [174] = 'A Fluttery Fiend',
    [175] = 'Scars of Abyssea',
    [176] = 'A Beaked Blusterer',
    [177] = 'A Man-eating Mite',
    [178] = 'An Ulcerous Uragnite',
    [179] = 'Heroes of Abyssea',
    [180] = "A Sea Dog's Summons",
    [181] = 'Death and Rebirth',
    [182] = 'Emissaries of God',
    [183] = 'Beneath a Blood-red Sky',
    [184] = 'The Wyrm God',
    [185] = 'Meanwhile, Back on Abyssea',
    [186] = 'A Moonlight Requite',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    ['160'] = {
        name = 'A Journey Begins',
        steps = {
            "On a level 30 or higher job, zone into Port Jeuno for a cutscene.",
            "Speak with " .. ACTOR.JOACHIM.text .. " for a cutscene and a Traverser stone. If you postponed the first cutscene, examine the Tales' Beginning next to Home Point #2 in Port Jeuno.",
        },
    },

    ['161'] = {
        name = 'The Truth Beckons',
        steps = {
            "Examine any Cavernous Maw while carrying a Traverser stone: La Theine Plateau (E-4), Konschtat Highlands (I-12), Tahrongi Canyon (H-12), Jugner Forest (J-8), Valkurm Dunes (I-9), Buburimu Peninsula (F-7, near the Survival Guide), Xarcabard (H-8), North Gustaberg (G-6) or South Gustaberg (J-10).",
            "Entering is enough; you don't need visitant status. Leave right away without spending the stone: you then only wait one hour to enter again. If you spend the stone, you must wait about 20 hours for a new one before you can continue the story.",
            "Return to " .. ACTOR.JOACHIM.text .. " to finish the quest. From now on you receive a new Traverser stone every 20 real-life hours (less as you progress).",
        },
    },

    ['162'] = {
        name = 'Dawn of Death',
        steps = {
            "Collect another Traverser stone from " .. ACTOR.JOACHIM.text .. " when his timer is up. You can flag the maw quests below during the one-hour lockout, as long as you hold a stone.",
            "Visit " .. ACTOR.CAVERNOUS_MAW_LA_THEINE_E4.text .. " in La Theine Plateau, " .. ACTOR.CAVERNOUS_MAW_KONSCHTAT_I12.text .. " in Konschtat Highlands, or " .. ACTOR.CAVERNOUS_MAW_TAHRONGI_H12.text .. " in Tahrongi Canyon.",
            "Visit " .. ACTOR.CAVERNOUS_MAW_JUGNER_J8.text .. " in Jugner Forest, " .. ACTOR.CAVERNOUS_MAW_VALKURM_I9.text .. " in Valkurm Dunes, or " .. ACTOR.CAVERNOUS_MAW_BUBURIMU_F7.text .. " in Buburimu Peninsula.",
            "Visit " .. ACTOR.CAVERNOUS_MAW_SOUTH_GUSTABERG_J10.text .. " in South Gustaberg, " .. ACTOR.CAVERNOUS_MAW_XARCABARD_H8.text .. " in Xarcabard, or " .. ACTOR.CAVERNOUS_MAW_NORTH_GUSTABERG_G6.text .. " in North Gustaberg.",
            "Examining a maw starts that area's quest and unlocks teleporting to that maw for 200 Cruor from the Abyssea maw teleport NPCs.",
            "Complete any three of the nine maw quests (defeat the area's Notorious Monster, then leave). Vision: A Goldstruck Gigas (La Theine), To Paste a Peiste (Konschtat), Megadrile Menace (Tahrongi). Scars: The Beast of Bastore (Vunkerl), A Delectable Demon (Misareaux), A Fluttery Fiend (Attohwa). Heroes: A Beaked Blusterer (Altepa), A Man-eating Mite (Uleguerand), An Ulcerous Uragnite (Grauberg).",
            "Return to " .. ACTOR.JOACHIM.text .. ".",
        },
    },

    ['163'] = {
        name = 'A Goldstruck Gigas',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_LA_THEINE_E4.text .. " while you have a Traverser stone. The Survival Guide in West Ronfaure is close.",
            "Defeat the Notorious Monster Briareus in Abyssea - La Theine. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea - La Theine for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['164'] = {
        name = 'To Paste a Peiste',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_KONSCHTAT_I12.text .. " while you have a Traverser stone. The Survival Guide in North Gustaberg is close.",
            "Defeat the Notorious Monster Kukulkan in Abyssea - Konschtat. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki. Be prepared: its Terror, Petrify, Poison and Curse can kill even level 99 players. Solo, bring a couple of offensive magic Trusts (they keep casting while you are terrorized) and buy HP Boost from the Cruor Prospector.",
            "Leave Abyssea - Konschtat for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['165'] = {
        name = 'Megadrile Menace',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_TAHRONGI_H12.text .. " while you have a Traverser stone. Unity Wanted Battle (level 99) to Tahrongi Canyon is close.",
            "Defeat the Notorious Monster Glavoid in Abyssea - Tahrongi. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea - Tahrongi for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['166'] = {
        name = 'The Forbidden Frontier',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " after starting A Goldstruck Gigas, To Paste a Peiste or Megadrile Menace.",
            "Speak with " .. ACTOR.JOACHIM.text .. " again after completing all three of those Vision quests for a cutscene that completes this quest.",
        },
    },

    ['167'] = {
        name = 'First Contact',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " each time you finish a maw quest: after the first (Lunar abyssite), the second (Ivory abyssite of fortune) and the third (Ivory abyssite of acumen). The third talk sends you to La Theine Plateau.",
            "Go to the stone circle in La Theine Plateau. Unity Warp (level 99) to La Theine Plateau is the fastest way.",
            "Examine " .. ACTOR.LA_THEINE_QQ_G6.text .. " between 18:00 and 05:00 (Vana'diel time) for a cutscene. This completes the quest and starts An Officer and a Pirate.",
        },
    },

    ['168'] = {
        name = 'An Officer and a Pirate',
        steps = {
            "This quest starts with the cutscene at " .. ACTOR.LA_THEINE_QQ_G6.text .. " that finished First Contact. If you have not seen it, examine it between 18:00 and 05:00 (Vana'diel time).",
            "Speak with " .. ACTOR.JOACHIM.text .. " to finish the quest.",
        },
    },

    ['169'] = {
        name = 'Heart of Madness',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " again for a cutscene. This is a second talk, right after the one that finished An Officer and a Pirate.",
        },
    },

    ['170'] = {
        name = 'Tenuous Existence',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " after finishing your fourth maw quest (Ivory abyssite of the reaper).",
            "Speak with " .. ACTOR.JOACHIM.text .. " again after your fifth (Ivory abyssite of perspicacity) for a cutscene.",
            "Return to the stone circle in La Theine Plateau and examine " .. ACTOR.LA_THEINE_QQ_G6.text .. " between 18:00 and 05:00 (Vana'diel time) for a cutscene.",
            "Return to " .. ACTOR.JOACHIM.text .. " to finish the quest; Champions of Abyssea starts automatically. Make sure you see both of his cutscenes.",
        },
    },

    ['171'] = {
        name = 'Champions of Abyssea',
        steps = {
            "This quest starts automatically when you finish Tenuous Existence.",
            "Keep doing the maw quests: " .. ACTOR.JOACHIM.text .. " has cutscenes for you after your sixth and seventh (see A Sea Dog's Summons).",
        },
    },

    ['172'] = {
        name = 'The Beast of Bastore',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_JUGNER_J8.text .. " while you have a Traverser stone. You get a cutscene with Kuchi Eyjhann. The Survival Guide in Jugner Forest is close.",
            "Defeat the Notorious Monster Sedna in Abyssea - Vunkerl. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea - Vunkerl for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['173'] = {
        name = 'A Delectable Demon',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_VALKURM_I9.text .. " while you have a Traverser stone. You get a cutscene with Kuchi Eyjhann. The Survival Guide in Valkurm Dunes is close.",
            "Defeat the Notorious Monster Cirein-croin in Abyssea - Misareaux. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea - Misareaux for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['174'] = {
        name = 'A Fluttery Fiend',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_BUBURIMU_F7.text .. " while you have a Traverser stone. You get a cutscene with Reinhard. The Survival Guide in Buburimu Peninsula is close.",
            "Defeat the Notorious Monster Itzpapalotl in Abyssea - Attohwa. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea - Attohwa for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['175'] = {
        name = 'Scars of Abyssea',
        steps = {
            "Defeat Sedna in Abyssea - Vunkerl.",
            "Defeat Cirein-croin in Abyssea - Misareaux.",
            "Defeat Itzpapalotl in Abyssea - Attohwa.",
            "Return to " .. ACTOR.JOACHIM.text .. ".",
        },
    },

    ['176'] = {
        name = 'A Beaked Blusterer',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_SOUTH_GUSTABERG_J10.text .. " while you have a Traverser stone. You get a cutscene with Orgis. Home Point #1 in Bastok Mines is close.",
            "Defeat the Notorious Monster Bennu in Abyssea - Altepa. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea and enter South Gustaberg for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['177'] = {
        name = 'A Man-eating Mite',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_XARCABARD_H8.text .. " while you have a Traverser stone. You get a cutscene with Alberic. The Survival Guide in Xarcabard is close.",
            "Defeat the Notorious Monster Resheph in Abyssea - Uleguerand. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea and enter Xarcabard for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['178'] = {
        name = 'An Ulcerous Uragnite',
        steps = {
            "Examine " .. ACTOR.CAVERNOUS_MAW_NORTH_GUSTABERG_G6.text .. " while you have a Traverser stone. It is in the northeast part of the map. You get a cutscene with Rurukaka.",
            "Defeat the Notorious Monster Amphitrite in Abyssea - Grauberg. Like most Abyssea NMs it is spawned with pop items; see the zone's spawn chart on BG-Wiki.",
            "Leave Abyssea and enter North Gustaberg for a cutscene that finishes the quest and gives a Lunar or Ivory abyssite (which one depends on how many of the nine maw quests you have finished).",
        },
    },

    ['179'] = {
        name = 'Heroes of Abyssea',
        steps = {
            "Defeat Bennu in Abyssea - Altepa.",
            "Defeat Resheph in Abyssea - Uleguerand.",
            "Defeat Amphitrite in Abyssea - Grauberg.",
            "Return to " .. ACTOR.JOACHIM.text .. ".",
        },
    },

    ['180'] = {
        name = "A Sea Dog's Summons",
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " after finishing your sixth maw quest (Ivory abyssite of guerdon).",
            "Speak with " .. ACTOR.JOACHIM.text .. " again after your seventh (Lunar abyssite) for a cutscene.",
            "Travel to " .. ACTOR.HALL_OF_GODS.text .. " between 18:00 and 05:00 (Vana'diel time). Entering the Hall of the Gods from Ro'Maeve gives a cutscene with Gilgamesh.",
        },
    },

    ['181'] = {
        name = 'Death and Rebirth',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " after finishing your eighth maw quest (Ivory abyssite of prosperity).",
            "Speak with " .. ACTOR.JOACHIM.text .. " after all nine (Ivory abyssite of destiny) for a cutscene, then speak with him once more and he sends you back to the Hall of the Gods.",
            "Travel to " .. ACTOR.HALL_OF_GODS.text .. " between 18:00 and 05:00 (Vana'diel time) for a cutscene. Emissaries of God only starts once you have seen it.",
        },
    },

    ['182'] = {
        name = 'Emissaries of God',
        steps = {
            "Defeat all six caturae and earn each title. You can kill them before this quest starts; Zuah Lepahnyu in Port Jeuno (J-8) tells you which titles you have, and you don't need to set them.",
            "Defeat Iratham in Abyssea - Tahrongi (title: Iratham Capturer).",
            "Defeat Yaanei in Abyssea - Attohwa (Yaanei Crasher).",
            "Defeat Kutharei in Abyssea - Misareaux (Kutharei Unhorser).",
            "Defeat Sippoy in Abyssea - Vunkerl (Sippoy Capturer).",
            "Defeat Raja in Abyssea - Grauberg (Raja Regicide).",
            "Defeat Rani in Abyssea - Altepa (Rani Decrowner).",
            "Speak with " .. ACTOR.JOACHIM.text .. " for a cutscene and the key item Abyssite of discernment.",
            "Travel to " .. ACTOR.HALL_OF_GODS.text .. " between 18:00 and 05:00 (Vana'diel time) for a cutscene. Beneath a Blood-red Sky starts when it ends.",
        },
    },

    ['183'] = {
        name = 'Beneath a Blood-red Sky',
        steps = {
            "Bring a Traverser stone and 10,000 Cruor to Qufim Island. Follow the wall northwest from Home Point #1.",
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE_QUFIM_F7.text .. " and choose \"Proceed\" to spend 10,000 Cruor for a Crimson traverser stone.",
            "You enter Abyssea - Empyreal Paradox automatically and get a cutscene. The Wyrm God starts right after.",
        },
    },

    ['184'] = {
        name = 'The Wyrm God',
        steps = {
            "Examine the Transcendental Radiance in Abyssea - Empyreal Paradox for a short cutscene, then examine it again to enter the battlefield against Shinryu.",
            "Shinryu absorbs damage while its wings are up and it is readying a weapon skill or casting. Mighty Guard greatly reduces physical and magic damage. Cosmic Breath is a cone with Plague and Attack Down; Gyre Charge is an area attack with Paralyze.",
            "Its regular melee attacks count as weapon skills, so keep that in mind when going for the red, blue and green staggers.",
            "Speak with " .. ACTOR.PRISHE_EMPYREAL_PARADOX.text .. " after the battle.",
        },
    },

    ['185'] = {
        name = 'Meanwhile, Back on Abyssea',
        steps = {
            "Speak with " .. ACTOR.JOACHIM.text .. " for a cutscene.",
            "Travel to " .. ACTOR.HALL_OF_GODS.text .. " between 18:00 and 05:00 (Vana'diel time) for a cutscene.",
            "Return to " .. ACTOR.PRISHE_EMPYREAL_PARADOX.text .. " in Abyssea - Empyreal Paradox.",
        },
    },

    ['186'] = {
        name = 'A Moonlight Requite',
        steps = {
            "Speak with " .. ACTOR.PRISHE_EMPYREAL_PARADOX.text .. " in Abyssea - Empyreal Paradox for a cutscene. This quest can only be flagged, never completed.",
        },
    },
}

return M