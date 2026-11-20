--[[
    The Voracious Resurgence - Mission Database
    =============================================

    Mission IDs and walkthrough IDs are intentionally kept
    as separate identifiers:

    - M.MISSIONS uses the official numeric mission IDs consumed
      by the mission tracker.
    - M.STEPS contains the walkthrough data.

    In The Voracious Resurgence, the walkthrough IDs already
    correspond directly to the official mission IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'The Voracious Resurgence',
    [110] = "The Gloom Phantom's Approach",
    [118] = 'The Brygid Cup',
    [128] = 'The Destiny Destroyers',
    [138] = "Kupipi's Dilemma",
    [146] = "The Cardians' Duty",
    [158] = "Zhuu Buxu's Gambit",
    [168] = 'Star Onion Fortune',
    [178] = 'The Doll Whisperer',
    [192] = 'Dancing Prince',
    [202] = "Claidie's Concern",
    [210] = 'Curilla Unleashed',
    [228] = "Run, Excenmille, Run!",
    [240] = 'Of Knights and Orcs',
    [256] = 'Best Served Cold',
    [270] = "Cornelia's Call to Action",
    [286] = 'Naja the Ambitious',
    [298] = 'Raubahn the Blue',
    [310] = "Ghatsad's Quandary",
    [326] = 'The Revelation',
    [338] = "Tateeya's Worries",
    [352] = 'The Seagull Phratrie',
    [362] = 'The Sea Sage',
    [380] = 'Sky, Moon, Incantrix',
    [392] = "Nii's Last Stand",
    [414] = 'Dance of the Tengu',
    [430] = "Raebrimm's Rebirth",
    [440] = 'Uran-Mafran of the Maelstrom',
    [452] = "Koru-Moru's Hypothesis",
    [460] = 'Altennia Burns Bright',
    [468] = 'Maat on the Rampage',
    [484] = 'Not Just a Pretty Face',
    [494] = 'Delkfutt the Great',
    [508] = 'Oshasha Violation',
    [516] = 'Phantasmic Heroes',
    [530] = "Skokkr Undrborn's Temptation",
    [542] = 'The Prime Weapons',
    [552] = 'To Movalpolos!',
    [562] = 'Magh Bihu on the Prowl',
    [574] = '101 Dazbogs',
    [580] = 'Kipdrix the Faithful',
    [592] = "Duke Alloces's Decision",
    [602] = "Odin's Eye",
    [612] = 'Moglesse Oblige',
    [624] = 'The Voracious Beast',
    [642] = 'Your Decision',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- PART 1
    -- ========================================================

    [0] = {
        name = 'The Voracious Resurgence',
        steps = {
            "Requirements: all Rhapsodies of Vana'diel missions complete, and Trust: Iroha II learned (the Mystic Retriever in the Reisenjima Sanctorium re-issues the cipher).",
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines, in the back room of the house on the upper walkway. Home Point #3 is nearest.",
        },
    },

    [110] = {
        name = "The Gloom Phantom's Approach",
        steps = {
            "Zone into Zeruhn Mines from Bastok Mines for a cutscene. (Optional: Rasmus at (I-6) and Makarim at (H-11) have extra dialogue.)",
            "Examine " .. ACTOR.DISTURBED_DIRT.text .. " at (K-9) for a cutscene.",
            "Examine " .. ACTOR.DISTURBED_DIRT.text .. " again to spawn the Gloom Phantom. You have 15 minutes. It has about 30,000 HP and uses Blood Weapon and Brazen Rush.",
            "After the fight, examine " .. ACTOR.DISTURBED_DIRT.text .. " again for a cutscene. If you zoned first, just examine it again.",
        },
    },

    [118] = {
        name = 'The Brygid Cup',
        steps = {
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines (Home Point #3: up the stairs on the right, left, across the bridge, then right through the door).",
            "Speak with " .. ACTOR.BRYGID.text .. " in Bastok Markets (Home Point #4) twice, and agree to help with her fashion show.",
            "Pick an NPC to dress as (head, body, hands, legs, feet; weapons don't matter). Cheapest: Nbu Latteh (Bronze Harness, Scale Cuisses, Scale Greaves; about 3,000 gil at Brunhilde Armorer in Bastok Markets, or from Sparks). Black Mud: Wool Hat (Chetak, Lower Jeuno), Doublet, Slops, Ash Clogs. Naji: Gavial Mail, Breeches, Battle Boots. Michea: Gambison, Brais, Gaiters. Azima's Shadowreign look (Witch Hat, Marduk's Jubbah/Dastanas/Shalwar, Sorcerer's Sabots) wins first prize for 2,000 extra gil.",
            "Speak with Ruenda outside The Steaming Sheep in Port Bastok (Home Point #3, (E-7)) while wearing the outfit (actual gear or an equipment set; turn /lockstyle off). The cutscene runs over 5 minutes.",
            "Speak with " .. ACTOR.BRYGID.text .. " once more for your reward.",
        },
    },

    [128] = {
        name = 'The Destiny Destroyers',
        steps = {
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines for a cutscene.",
            "Go to Korroloka Tunnel through Zeruhn Mines (the Zeruhn Mines Survival Guide is quickest).",
            "Examine the " .. ACTOR.KORROLOKA_STALAGMITE.text .. " at (D-9) on Map 1 (the first map, bottom level; skip the upper path) for a cutscene.",
            "Examine " .. ACTOR.KORROLOKA_STALAGMITE.text .. " again to fight Gloom Phantom (WAR/DRK), Magh Bihu (RDM) and Dazbog (PLD). You have 15 minutes. Each has about 30,000 HP and its job's SP ability. If they focus one target they skillchain and magic burst (Fire IV, Water IV); AA TT can sleep the meeble and mandragora.",
            "Examine " .. ACTOR.KORROLOKA_STALAGMITE.text .. " again after the fight for a cutscene.",
            "Return to " .. ACTOR.GUMBAH.text .. " for a cutscene and your reward.",
        },
    },

    -- ========================================================
    -- PART 2
    -- ========================================================

    [138] = {
        name = "Kupipi's Dilemma",
        steps = {
            "Speak with " .. ACTOR.KUPIPI.text .. " in Heavens Tower (Windurst Walls, Home Point #1) for a cutscene.",
            "Trade a Red Grass Cloth to " .. ACTOR.SASSA_KOTASSA.text .. " in the lobby (Auction House: Materials > Clothcraft).",
            "Trade a Yagudo Drink to Sheelala (Curio Vendor Moogle or Auction House: Food > Meals > Drinks).",
            "Trade a Dream Flower Petal to Habida-Jubida (Auction House: Materials > Alchemy 1, or kill Alraune in Bibiki Bay - Purgonorgo Isle after they use Dream Flower).",
            "Return to " .. ACTOR.KUPIPI.text .. " for a cutscene; she asks for a White Rolanberry (a Ripe White Rolanberry also works).",
            "Get one from the Auction House (Food > Ingredients), or trade a Rolanberry (Crawler's Nest NM chain, or the Auction House) to Pellio in Rolanberry Fields (F-11) for a 50/50 White or Ripe White Rolanberry. Pellio only accepts it after Kupipi's request. The Crawler's Nest Survival Guide is closest.",
            "Trade the White Rolanberry or Ripe White Rolanberry to " .. ACTOR.KUPIPI.text .. " for a cutscene.",
            "Speak with " .. ACTOR.SHANTOTTO.text .. " in Windurst Walls (K-7) for the final cutscene and 20,000 gil. If the title doesn't appear, it is still unlocked (Burute-Sorute, Windurst Walls (H-10), 400 gil list).",
        },
    },

    [146] = {
        name = "The Cardians' Duty",
        steps = {
            "Speak with " .. ACTOR.SHANTOTTO.text .. " in her manor in Windurst Walls (K-7) for a cutscene (no zoning needed).",
            "Speak with " .. ACTOR.KUPIPI.text .. " in Heavens Tower for a cutscene. (Optional: the three Tarutaru in the lobby give hints.)",
            "Go to East Sarutabaruta (J-8), the northeast corner south of the Tower near the canyon wall, and examine the Disturbed Earth for a cutscene. Unity Warp (level 99) to East Sarutabaruta, or the Inner Horutoto Ruins Survival Guide, is quickest.",
            "Examine the Disturbed Earth again to fight a Yagudo Vicar (WHM), Yagudo Centurion (BLM) and two Yagudo Underlings (NIN, MNK). You have 15 minutes. Each has about 30,000 HP and its SP ability. King of Spades (PLD) helps you and you lose if he dies; they all go for him first. AA TT's Sleepga works.",
            "Examine the Disturbed Earth again after the fight for a cutscene.",
            "Return to " .. ACTOR.KUPIPI.text .. " in Heavens Tower for the final cutscene and your reward.",
        },
    },

    [158] = {
        name = "Zhuu Buxu's Gambit",
        steps = {
            "Speak with " .. ACTOR.KUPIPI.text .. " in Heavens Tower for a cutscene and the Star-crested summons (no zoning needed).",
            "Speak with " .. ACTOR.TOSUKA_PORUKA.text .. " in the east wing of the Optistery, Windurst Waters (Home Point #1), for a cutscene.",
            "Go to Giddeus, drop down at E on Map 1, and enter the storage room on Map 2 at (F-6). Click the door, not the Yagudo guard.",
            "Examine the " .. ACTOR.WORN_CHEST.text .. ": there is no cutscene, and a Yagudo Lookout (SAM, about 30,000 HP) attacks you from behind. You have 15 minutes. It uses Meikyo Shisui around 66% HP and Yaegasumi around 33%.",
            "Examine the " .. ACTOR.WORN_CHEST.text .. " again for a cutscene and the Strange doll. If you zoned first, you can come back without fighting again.",
            "Return to " .. ACTOR.TOSUKA_PORUKA.text .. " for a cutscene and your reward.",
        },
    },

    [168] = {
        name = 'Star Onion Fortune',
        steps = {
            "Speak with " .. ACTOR.TOSUKA_PORUKA.text .. " again for a cutscene (no zoning needed).",
            "Speak with Kohlo-Lakolo in Port Windurst (G-5), behind Warehouse 1 (Home Point #1), for a cutscene. (Optional: Shanruru has an extra cutscene.)",
            "Open your Temporary Key Items and examine the Piece of evidence to see the cipher.",
            "Speak with Kohlo-Lakolo again and say you deciphered it.",
            "Go to The Boyahda Tree, Map 1 bottom floor, and check the three Muggy Air spots at (D-5), (H-6) and (H-9); only the one with a white glow is active. The Proto-Waypoint puts you at (D-4); Unity Warp (level 125) also works (turn around to reach Map 1).",
            "Touching the active spot spawns the Templar Crawler right away. It hits hard with Poison Breath and gains extra Protect after Cocoon. Everyone in the party gets a Sublime lucky egg when it dies.",
            "Return to Kohlo-Lakolo for a cutscene and your reward.",
        },
    },

    [178] = {
        name = 'The Doll Whisperer',
        steps = {
            "Speak with Kohlo-Lakolo in Port Windurst for a cutscene (no zoning needed).",
            "Examine the Secluded Spot in West Sarutabaruta (J-8), south of the Tower behind the tree, for a cutscene. Windurst Waters Home Point #1 is closest.",
            "Examine the Secluded Spot again to fight Chepelle (BST). She starts with a tiger and calls a sheep at 75% and a hare at 50% (they don't need to die and can be slept), uses Familiar from 60% HP every minute, resists damage heavily, and favors Detonation and Distortion axe skillchains.",
            "Examine the Secluded Spot again after the fight for a cutscene.",
            "Return to Kohlo-Lakolo for a cutscene and the Magicked doll.",
            "Speak with " .. ACTOR.KUPIPI.text .. " for the final cutscene and your reward.",
        },
    },

    -- ========================================================
    -- PART 3
    -- ========================================================

    [192] = {
        name = 'Dancing Prince',
        steps = {
            "Speak with " .. ACTOR.HALVER.text .. " in Chateau d'Oraguille (Northern San d'Oria Home Point #2) for a cutscene.",
            "Speak with " .. ACTOR.RAHAL.text .. " in the Royal Knights' quarters to the west for a cutscene.",
            "Go to Davoi and speak with " .. ACTOR.QUEMARICOND.text .. ", who paces between (G-7) and (H-7), for a cutscene. The Proto-Waypoint or the Davoi Survival Guide is quickest.",
            "Enter Monastic Cavern from the Davoi (H-11) entrance and touch the Ritual Site on the (H-9)/(H-10) border to fight an Orcish Bewitcher (BLM/DRK, about 30,000 HP, Manafont from 90% HP). You get the Orcish battle plan when it dies.",
            "Return to " .. ACTOR.QUEMARICOND.text .. " for a cutscene and Quemaricond's report (Escape and re-enter Davoi is quickest).",
            "Speak with " .. ACTOR.RAHAL.text .. " for the final cutscene and your reward.",
        },
    },

    [202] = {
        name = "Claidie's Concern",
        steps = {
            "Speak with " .. ACTOR.HALVER.text .. " for a cutscene (no zoning needed).",
            "Go to " .. ACTOR.QUEEN_GARDEN.text .. " at (F-7), west of the Central Garden, for a cutscene.",
            "Go to Attohwa Chasm with a few Sickles (Trailblazer Sickles don't work) and harvest the glowing Harvesting Point at (H-8) for the Solidago flower. Only that point works. Unity Warp (level 125) is quickest: turn around and follow the tunnel.",
            "Return to the garden and speak with " .. ACTOR.CHALVATOT.text .. " for a cutscene.",
            "Return to " .. ACTOR.HALVER.text .. " for the final cutscene and your reward.",
        },
    },

    [210] = {
        name = "Curilla Unleashed",
        steps = {
            "Zone after the previous mission, then speak with " .. ACTOR.HALVER.text .. " for a cutscene and the Missive to Altennia.",
            "Go to Ranguemont Pass (Survival Guide, or East Ronfaure (K-4)) and touch the Vicious Claw Marks at (J-8) to fight a Harnessed Smilodon (WAR, about 35,000 HP, Mighty Strikes).",
            "Touch the Vicious Claw Marks again for a cutscene with Altennia.",
            "Return to " .. ACTOR.HALVER.text .. " for a cutscene.",
            "Examine the door to the " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ", the northern door of the Central Garden, for a cutscene.",
            "Go to Bostaunieux Oubliette from the Chateau. Stay on the top floor (don't drop into the pit at (E-7)/(E-8)) and touch the Frigid Confluence at (H-9) to fight Trion (about 25,000 HP, very high defense, Invincible as early as 75% HP). The fight ends with a cutscene.",
            "Speak with Curilla in the Temple Knights' quarters for the final cutscene and your reward (more than once if she has other quests for you).",
        },
    },

    [228] = {
        name = 'Run, Excenmille, Run!',
        steps = {
            "Wait one game day after Curilla Unleashed. Meanwhile, get a Doll Gizmo for the next mission: Auction House (Others > Misc. 1), or 100% from the Manipulator patrolling the big room on Temple of Uggalepih Map 2 at (I-10)/(J-10) (15-minute respawn; Proto-Waypoint is closest).",
            "Speak with " .. ACTOR.HALVER.text .. " for a cutscene.",
            "Speak with " .. ACTOR.RAHAL.text .. " in the Royal Knights' quarters for a cutscene.",
            "Go to Beaucedine Glacier (Survival Guide is quickest) and touch the Ferric Stench at (H-8), east of the tower, to fight an Orcish Atlatl (WAR), Orcish Axeman (BST), Orcish Praetor (WAR) and Harnessed Smilodon (WAR). You get the Carmine Swallows' map afterwards.",
            "Touch the Ferric Stench again for a cutscene.",
            "Touch the Point of Interest on the lowest level by Mirror Pond, at the lower-left corner of (J-6)/(I-6), for a cutscene and a Hi-Elixir Tank. Unity Warp (level 128) to Fei'Yin and zoning out is close. Don't warp away if you're continuing.",
        },
    },

    [240] = {
        name = 'Of Knights and Orcs',
        steps = {
            "Bring a Doll Gizmo (see the previous mission).",
            "Zone into Fei'Yin from Beaucedine Glacier for a cutscene.",
            "Go to Fei'Yin Map 2 and trade the Doll Gizmo to Talos, a pile of doll parts in front of a door south down the hall at (H-6) from Capricious Cassie's room, for a cutscene. It doesn't show on Wide Scan. Fei'Yin Home Point #2 (Cloister of Frost) is closest.",
            "Return to Beaucedine Glacier and examine the Point of Interest by Mirror Pond (southwest corner of (J-6)) for a cutscene. Escape from Fei'Yin puts you close.",
            "Examine the Point of Interest again to fight Slackjawed Mukdrom (WAR, about 50,000 HP, repeated Mighty Strikes, drain on hit).",
            "Examine the Point of Interest again after the fight for a cutscene.",
            "Return to Chateau d'Oraguille and examine the door to the " .. ACTOR.PRINCES_ROYAL_ROOM.text .. " for the final cutscene and your rewards.",
        },
    },

    -- ========================================================
    -- PART 4
    -- ========================================================

    [256] = {
        name = 'Best Served Cold',
        steps = {
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines.",
            "Speak with " .. ACTOR.DRANGORD.text .. " near the entrance to Zeruhn Mines.",
            "Enter Zeruhn Mines from Bastok Mines.",
            "Optional: Drake Fang in Zeruhn Mines (H-6) points you south.",
            "Examine the " .. ACTOR.QUADAV_INQUEST.text .. " at (I-9) for a cutscene.",
            "Examine " .. ACTOR.QUADAV_INQUEST.text .. " again to fight Do'Bho Venomtail (BLM, about 30,000 HP, Manafont, poison on hit), Old Quadav (WAR), Brass Quadav (DRK) and Copper Quadav (THF), about 25,000 HP each.",
            "Examine " .. ACTOR.QUADAV_INQUEST.text .. " again after the fight for the final cutscene and your reward.",
        },
    },

    [270] = {
        name = "Cornelia's Call to Action",
        steps = {
            "Speak with " .. ACTOR.IRON_EATER.text .. " in the President's Office in Metalworks (J-8), Home Point #1, for a cutscene.",
            "Zone into Palborough Mines from North Gustaberg for a cutscene. The Abyssea - Grauberg Cavernous Maw is closest; Escape from the Palborough Mines Home Point also puts you at the entrance.",
            "Examine " .. ACTOR.PERVERSION_REFUGE.text .. " at (H-9) on Map 3, north of Palborough Mines Home Point #1, for a cutscene.",
            "Examine " .. ACTOR.PERVERSION_REFUGE.text .. " again to fight the Mind-warped Scorpion (about 50,000 HP, drain on hit).",
            "Examine " .. ACTOR.PERVERSION_REFUGE.text .. " again for a cutscene and Iapetus.",
            "Return to " .. ACTOR.IRON_EATER.text .. " for the final cutscene and a Seafood Gratin.",
        },
    },

    [286] = {
        name = 'Naja the Ambitious',
        steps = {
            "Requires the Treasures of Aht Urhgan missions to be complete.",
            "Speak with " .. ACTOR.NAJA.text .. " in Aht Urhgan Whitegate (I-10) for a cutscene (the one where she sings about A.M.A.N.).",
            "Go to Wajaom Woodlands (H-13) (Unity Warp level 125, or the Aydeewa Subterrane Survival Guide) and examine the glowing " .. ACTOR.SAVAGE_SCARS_WAJAOM.text .. " behind the Engraved Tablet for a cutscene.",
            "Examine " .. ACTOR.SAVAGE_SCARS_WAJAOM.text .. " again to fight the Returned Soulflayer (BLU, about 100,000 HP). You have 15 minutes. Under Azure Lore and Unbridled Learning it spams Water Bomb, Yawn (sleepga), Gates of Hades and more; a strong RDM can silence it. Mind Purge strips a player's buffs.",
            "Examine " .. ACTOR.SAVAGE_SCARS_WAJAOM.text .. " again for a cutscene and the Lock of golden hair.",
            "Return to " .. ACTOR.NAJA.text .. " for your reward (the Ziamet armor set). Tsih Kolgimih near the Al Zahbi entrance replays these cutscenes.",
        },
    },

    [298] = {
        name = 'Raubahn the Blue',
        steps = {
            "If Besieged has captured a mission NPC, free them first.",
            "Examine the " .. ACTOR.IMPERIAL_WHITEGATE.text .. " in Aht Urhgan Whitegate (L-9), Home Point #2, for a cutscene.",
            "Go to Caedarva Mire Map 4 (Hediva Isle): Unity Warp (level 135, needs Captain rank or a Remnants Permit), or the Runic Portal to the Nyzul Isle Staging Point, then teleporter D, then teleporter J on your left, then north.",
            "Go northeast along the slightly hidden path and examine " .. ACTOR.SAVAGE_SCARS_CAEDARVA.text .. " at (I-6), beside the Engraved Tablet, for a cutscene. Summon Trusts first.",
            "Examine " .. ACTOR.SAVAGE_SCARS_CAEDARVA.text .. " again to fight the Arisen Soulflayer and three Descended Winebibbers (all must die; watch for Fluid Toss). You have 15 minutes. Uran-Mafran (BLM) helps; you lose if he's KO'd, and you can cure him.",
            "Examine " .. ACTOR.SAVAGE_SCARS_CAEDARVA.text .. " again for a cutscene.",
            "Return to the " .. ACTOR.IMPERIAL_WHITEGATE.text .. " for a cutscene and Mnejing's receiver (hear Besieged messages anywhere).",
        },
    },

    -- ========================================================
    -- PART 5
    -- ========================================================

    [310] = {
        name = "Ghatsad's Quandary",
        steps = {
            "Speak with Ghatsad in the Automaton Workshop (I-7), Aht Urhgan Whitegate Home Point #1, for a cutscene and the Gift for Megomak.",
            "Go to Mount Zhayolm via the Halvung Staging Point. You need the Cast metal plate key item to open the Gates of Halvung at (J-7).",
            "Through the gate, head southwest, go up the ramp in the middle of (I-8), then west and south to the Acid-eaten Door at the northwest corner of (I-9). Examine it for a cutscene.",
            "Go to Hazhalm Testing Grounds in Caedarva Mire (Caedarva Mire Home Point #1) and examine the " .. ACTOR.ENTRY_GATE.text .. " for a cutscene.",
            "Go back out to Caedarva Mire and examine the Vexing Sniffles at (E-10), in the graveyard, for a cutscene.",
            "Examine the Vexing Sniffles again to fight Gloom Phantom (WAR/DRK), Magh Bihu (MNK) and Dazbog (PLD), about 60,000 HP each. Mnejing helps and must stay alive. You get the Pure white ampoule.",
            "Examine the Vexing Sniffles again for a cutscene.",
            "Return to the Acid-eaten Door in Mount Zhayolm (I-9) for a cutscene.",
            "Return to Ghatsad in Aht Urhgan Whitegate (I-7) for the final cutscene and your reward.",
        },
    },

    [326] = {
        name = 'The Revelation',
        steps = {
            "Speak with " .. ACTOR.ABDA_LURABDA.text .. " in the Automaton Workshop (I-7), Aht Urhgan Whitegate, for a cutscene.",
            "Zone into Aydeewa Subterrane from the Wajaom Woodlands (I-6) entrance for a cutscene. Leave Whitegate at (H-10), or take the Aydeewa Survival Guide and Escape.",
            "Examine " .. ACTOR.AYDEEWA_SURVEY_POINT_K7.text .. " on Map 2 for a cutscene.",
            "Head south, then hug the west wall to " .. ACTOR.AYDEEWA_SURVEY_POINT_J9.text .. " for a cutscene. Unlock the Aydeewa Survival Guide now if you haven't.",
            "Go to (E-9) and down the ramp at D (aggressive Chigoes) to Map 5, and examine " .. ACTOR.AYDEEWA_SURVEY_POINT_F8.text .. " for a cutscene.",
            "Head southwest to exit F (Map 3), drop down and go south to (G-10). A short cutscene plays at the stairs; then examine " .. ACTOR.AYDEEWA_FINAL_SURVEY_POINT_G10.text .. " (again, if the cutscene didn't play because of Sneak or Invisible).",
            "Examine " .. ACTOR.AYDEEWA_FINAL_SURVEY_POINT_G10.text .. " again to fight Missabikong (Marolith, about 150,000 HP). It has Shock Spikes, uses Mighty Strikes and AoE moves at low HP, absorbs Thunder (including Light skillchains), and is weak to Darkness and blunt damage.",
            "Examine " .. ACTOR.AYDEEWA_FINAL_SURVEY_POINT_G10.text .. " again after the fight for a cutscene.",
            "Return to " .. ACTOR.ABDA_LURABDA.text .. " for the final cutscene and your reward.",
        },
    },

    [338] = {
        name = "Tateeya's Worries",
        steps = {
            "Speak with Tateeya in the Automaton Workshop (I-7), Aht Urhgan Whitegate, for a cutscene.",
            "Speak with Ghatsad for a cutscene. (Being in the middle of No Strings Attached can block this.)",
            "Go to the Jade Sepulcher via Bhaflau Thickets Map 2 (Home Point #1, or the Mamool Ja Staging Point and head north).",
            "Examine the " .. ACTOR.ORNAMENTAL_DOOR.text .. " for a cutscene.",
            "Examine the " .. ACTOR.ORNAMENTAL_DOOR.text .. " again to enter the battlefield (Trusts allowed).",
            "Defeat Drakeweaver Hageel Ja (PLD), Riftweaver Pomaal Ja (BLU), Fistweaver Mufaal Ja (MNK), about 60,000 HP each, and Glyphweaver Sikool Ja (BLM, about 100,000 HP; Thunder V/VI, Thundaja, Stun). All use their SP abilities and can be slept and silenced. Sikool Ja stays at 1% until you break his weapon: weapon skill while he is swinging or just after.",
            "Return to Aht Urhgan Whitegate and examine the " .. ACTOR.IMPERIAL_WHITEGATE.text .. " for the final cutscene and the Thunder Hammer. Keep it; a later mission needs it.",
        },
    },

    [352] = {
        name = 'The Seagull Phratrie',
        steps = {
            "Before you go: get a Hamsi (Wahnid, Aht Urhgan Whitegate (H-11), 1:00-18:00 except Lightsday, only if stocked; the Auction House; or fish it in Whitegate) and a Lamian Fang Key (??? once per game day at (I-7) on Caedarva Mire Map 1, by the pond; you'll need more later). A Thief can use a Skeleton Key or Thief's Tools instead.",
            "Go to Arrapago Reef Map 1 (the Arrapago Reef Survival Guide is easiest) and examine the ??? at the northeast corner of (H-10), at the center of the ship's bow just left of the glowing target, for a cutscene that mentions the Pteraketos. On foot: enter from Caedarva Mire (I-6), trade a key to the Iron Gate at (J-10), and hug the left wall.",
            "Go to Arrapago Reef Map 3 and trade the Hamsi to the " .. ACTOR.APKALLU_GUIDE.text .. " for a cutscene. The Caedarva Mire Survival Guide and the cave east is quickest; without it, walk via Map 2 (B), Map 3 (C) and gate E at (F-9) (needs a key) and zone at (F-6) to unlock it.",
            "Summon Trusts and put on DT gear, then click the Camp Remnants just west at (F-7) to fight two Merrow Kabukidancers (SAM; Torrent strips gear), two Qutrub (DRK) and two Mamool Ja Divers (MNK). AoEs only hit the main target here, so sleep them individually (not the Qutrub).",
            "Click the Camp Remnants again for a cutscene. FastCS (or a frame rate above 30 FPS) can freeze the end of this cutscene on a black screen; hold Print Screen for a few seconds to break out, or unload FastCS first.",
            "Return to the ??? on the ship at (H-10), Map 1, for the final cutscene and your reward (walk: Map 2 via C, then B; or get another key if the day has rolled over).",
        },
    },

    [362] = {
        name = 'The Sea Sage',
        steps = {
            "Bring the Thunder Hammer from Tateeya's Worries.",
            "Speak with the " .. ACTOR.APKALLU_GUIDE.text .. " on Arrapago Reef Map 3 (F-7) for a cutscene (Caedarva Mire Survival Guide, then east).",
            "Examine the " .. ACTOR.LEYPOINT.text .. " in Wajaom Woodlands (G-8) for a cutscene (Olduum Ring, Survival Guide or Unity Warp level 125).",
            "Enter Aydeewa Subterrane at entrance 8, Wajaom Woodlands (E-10). Follow the left wall without dropping down, leave by exit 7 at (J-8), and continue past the first ledge into the open area (raptors or spiders mean you went wrong).",
            "Equip the Thunder Hammer as your main weapon and walk up to the untargetable Marolith at (G-9) for a cutscene and the Aeropearl.",
            "Return to the " .. ACTOR.APKALLU_GUIDE.text .. " for a cutscene.",
            "Speak with Ghatsad in Aht Urhgan Whitegate (I-7) for a cutscene.",
            "In Alzadaal Undersea Ruins, kill Qiqirns until Panaiveriyamman (WAR Acrolith, about 150,000 HP) appears; summon Trusts first. It resists magic (especially Dark) but is weak to Water. Everyone in the party gets the Man-made solution.",
            "Return to Ghatsad for a cutscene and the Repaired aeropearl. FastCS (or a frame rate above 30 FPS) can freeze the end of this cutscene on a black screen; hold Print Screen for a few seconds to break out, or unload FastCS first.",
            "Get another Lamian Fang Key and go back to the ??? on the ship at (H-10), Arrapago Reef Map 1 (Arrapago Reef Survival Guide).",
            "Return to the Apkallu Guide (F-7), by the Caedarva Mire Survival Guide, for the final cutscene and your reward. FastCS (or a frame rate above 30 FPS) can freeze the end of this cutscene on a black screen; hold Print Screen for a few seconds to break out, or unload FastCS first.",
        },
    },

    -- ========================================================
    -- PART 6
    -- ========================================================

    [380] = {
        name = 'Sky, Moon, Incantrix',
        steps = {
            "Bring three Hoptoad (fish off the bridge by Reisenjima Ethereal Ingress #2 with a Fly Lure or Lufaise Fly) and an Eastern Ginger (Reisenjima harvesting with Reaper, 50 Silt from Shiftrix (F-12); Bhaflau Thickets harvesting; or Reisenjima caskets).",
            "Speak with " .. ACTOR.REIKUU.text .. " at (K-8) near Ethereal Ingress #6 in Reisenjima for a cutscene.",
            "Speak with " .. ACTOR.INCANTRIX.text .. " at Ethereal Ingress #10 and answer \"No, of course not.\"",
            "Examine the " .. ACTOR.SUSPICIOUS_OVERGROWTH.text .. " at (H-6), between Ingress #3 and #5, for a cutscene, then trade it the three Hoptoad and the Eastern Ginger for another.",
            "Return to " .. ACTOR.REIKUU.text .. " for the final cutscene and your reward.",
        },
    },

    [392] = {
        name = "Nii's Last Stand",
        steps = {
            "Speak with " .. ACTOR.REIKUU.text .. " for a cutscene (no zoning needed).",
            "Speak with " .. ACTOR.INCANTRIX.text .. " at Ethereal Ingress #10 for a cutscene.",
            "Examine the " .. ACTOR.BABBLING_BROOK.text .. " in the river at (F-5), Ethereal Ingress #4, for a cutscene.",
            "Return to " .. ACTOR.INCANTRIX.text .. " for a cutscene.",
            "Examine the " .. ACTOR.ASPIRANTS_GROUNDS.text .. " at (K-7), Ethereal Ingress #6, for a cutscene and the Aspirant's canteen.",
            "Leave your party, then examine the " .. ACTOR.ASPIRANTS_GROUNDS.text .. " again for a 10-minute solo battle (no Trusts). The mobs hit for 1; the goal is for you and Nii Aquu to each defeat half of them, so soften them with AoE and let her finish some. Her comments tell you if the ratio is right.",
            "The cutscene afterwards shows whether you passed; if so, you get your reward.",
        },
    },

    [414] = {
        name = 'Dance of the Tengu',
        steps = {
            "Speak with " .. ACTOR.REIKUU.text .. " at (K-8) near Ethereal Ingress #6 for a cutscene.",
            "Examine the " .. ACTOR.BABBLING_BROOK.text .. " at (F-5), Ingress #4, for a cutscene.",
            "Examine the " .. ACTOR.BABBLING_BROOK.text .. " again to fight Zhuu Buxu (about 125,000 HP, Mijin Gakure). You have 15 minutes. It uses the Omen queue; Trusts allowed. Nii Aquu helps and must stay alive. A cutscene follows.",
            "Examine the " .. ACTOR.BABBLING_BROOK.text .. " again to fight Reikuu (about 90,000 HP). You have 15 minutes. Gessho helps and must survive (he can win even if your party falls). Both make clones; hitting the real Reikuu with a weapon skill or AoE staggers him and removes his clones. His Mijin Gakure can deal over 2,000 even in DT gear.",
            "Return to " .. ACTOR.REIKUU.text .. " for the final cutscene and your rewards.",
        },
    },

    -- ========================================================
    -- PART 7
    -- ========================================================

    [430] = {
        name = "Raebrimm's Rebirth",
        steps = {
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines (J-7) to begin.",
            "Speak with Dancing Wolf in Rabao (G-6)/(G-7) near Home Point #2 for a cutscene.",
            "Go to the (G-5) entrance of Quicksand Caves in Western Altepa Desert (Kuftal Tunnel Survival Guide and exit, or Unity Warp level 125 to Kuftal Tunnel and Escape).",
            "Go through the weight door at (H-8) (one Galka, two Humes/Elvaan/Mithra, three Tarutaru, or a Loadstone) and examine the " .. ACTOR.QUICKSAND_QQ_G11.text .. " at the statue for a cutscene.",
            "Recommended: continue to (C-8), exit to Western Altepa Desert, and press the sapphire column; the next mission needs the Altepa Gate open.",
            "Enter Quicksand Caves at the Western Altepa Desert (D-12) entrance (the Quicksand Caves Proto-Waypoint puts you on the right map; don't fall). From (K-8) on Map 5, go through D to Map 6 and touch the ??? at (H-8) to fight two Spelunking Sabotenders (MNK; 1,000 Needles), two Sand Lizards and two Sand Tarantulas (WAR). They resist Sleep and Petrify; use Trusts.",
            "Touch the ??? again for the final cutscene and your reward.",
        },
    },

    [440] = {
        name = 'Uran-Mafran of the Maelstrom',
        steps = {
            "Speak with Dancing Wolf in Rabao (G-6), Home Point #2, for a cutscene.",
            "Zone into Quicksand Caves through the Altepa Gate in Western Altepa Desert (I-6)/(I-7) for a cutscene (see the Altepa Gate page if it isn't open).",
            "Touch " .. ACTOR.JOURNEYS_END.text .. " at (K-10) to fight Uran-Mafran (BLM/RDM, about 185,000 HP; Trusts allowed). Oggbi (MNK) helps and must survive.",
            "Uran-Mafran uses Manafont repeatedly (clearing debuffs), has heavy fast cast and regain, casts Meteor, Comet, Impact and AoE enfeebles, resists Silence, and self-skillchains Black Halo into tier VI magic bursts for 10,000+. Wear DT gear; Trust tanks won't survive the bursts. The win still counts if you die.",
            "Touch " .. ACTOR.JOURNEYS_END.text .. " again for a cutscene.",
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines (J-7) for the final cutscene and your reward.",
        },
    },

    [452] = {
        name = "Koru-Moru's Hypothesis",
        steps = {
            "Speak with " .. ACTOR.SHANTOTTO.text .. " in Windurst Walls (K-7), Home Point #3. Koru-Moru asks for a Spectral Crimson, a Spectral Goldenrod and a Luminicloth.",
            "Spectral Crimson: Fomor BRD, PLD and RDM in Misareaux Coast (near the Sacrarium (E-7), the campfire at (J-11)) or Lufaise Meadows Blueblade Fell (J-6), at night (20:00-4:00).",
            "Spectral Goldenrod: Haunts in Kuftal Tunnel (Survival Guide, hug the left wall to (H-7) on Map 1) or Srei Ap in Uleguerand Range (K-7).",
            "Luminicloth: Revenant, Utukku or Wekufe in Fei'Yin, or Qaitu in Abyssea - Konschtat.",
            "Trade all three to " .. ACTOR.SHANTOTTO.text .. " for a cutscene, your rewards and Memorian, the Magicked Doll.",
            "Optional memories (worth seeing; Memorian activates): Honoi-Gomoi upstairs at the back of the Trader's Home, Windurst Waters (E-7); Dancing Wolf (G-7) and Rahi Fohlatti (G-9) in Rabao; Ghatsad in Whitegate (I-7); zoning into Palborough Mines from North Gustaberg; plus Halver and Rahal during the next mission. Then return the Depleted Memorian to Shantotto.",
        },
    },

    [460] = {
        name = 'Altennia Burns Bright',
        steps = {
            "Speak with " .. ACTOR.HALVER.text .. " in Chateau d'Oraguille for a cutscene and Trion's directive.",
            "Speak with " .. ACTOR.RAHAL.text .. " in the Royal Knights' quarters for a cutscene.",
            "Go to Ifrit's Cauldron (Unity Warp level 125) with several Pickaxes (Ostalie, Southern San d'Oria (E-9)). Mine for the Ember-encrusted orichalcum; the correct point rotates among Map 5 (G-8), Map 3 (J-7), Map 3 (F-7), Map 4 (F-7), Map 1 (F-9), Map 1 (G-8) and Map 7 (I-10), and gives the key item on the first swing. A point that gives items is the wrong one.",
            "If you get \"Event skipped\" from aggro while mining, check your Temporary Key Items; you may have it anyway.",
            "Return to " .. ACTOR.RAHAL.text .. " for the final cutscene and your reward. If you collected the other memories, Memorian turns into the Depleted Memorian; take it to " .. ACTOR.SHANTOTTO.text .. ".",
        },
    },

    -- ========================================================
    -- PART 8
    -- ========================================================

    [468] = {
        name = 'Maat on the Rampage',
        steps = {
            "Speak with Maat in Ru'Lude Gardens (H-5) for a cutscene and the Cloth-lined basket.",
            "Speak with " .. ACTOR.MUCKVIX.text .. " at the back of the goblin shop in Lower Jeuno (H-10) for a cutscene and the Map to the woman's home.",
            "Speak with Miladi-Nildi near the Mog House entrance in Lower Jeuno (J-5) for a cutscene.",
            "Touch the Goblin Festival Site on the coast at Batallia Downs (K-7) at night (18:00-6:00) for a cutscene. Unity Warp (level 125) puts you at (K-8).",
            "Touch it again (any time of day) to fight \"The Shadow\" (about 200,000 HP). You have 15 minutes. Mumor helps; you lose if she falls. He uses many SP abilities: Benediction whenever either of you weapon skills (from 89% HP), Manafont, Hundred Fists, Chainspell (with Dispelga), Meikyo Shisui, Blood Weapon, and hand-to-hand self-skillchains. He isn't resistant to enfeebles; Silence lasts.",
            "Touch the site again for a cutscene and Maat's pillow.",
            "Return to Maat for the final cutscene and your reward.",
        },
    },

    [484] = {
        name = 'Not Just a Pretty Face',
        steps = {
            "Speak with " .. ACTOR.MUCKVIX.text .. " in Lower Jeuno (H-10) for a cutscene.",
            "Go to Qufim Island (Survival Guide) and examine Before Delkfutt's Tower at (G-6), by the Lower Delkfutt's Tower entrance, for a cutscene.",
            "Examine it again to fight Echion (Gigas WAR, about 200,000 HP; Trusts allowed). The Destiny Destroyers help; you lose if any of them falls, and you can't heal them.",
            "Echion gains Ice Spikes (up to 500 per hit, stronger after each SP ability; reduce with Barblizzard, Carols or magic evasion), uses Mighty Strikes and Hundred Fists more than once, Daunting Hurl (Terror), and below 50% Colossal Slam (AoE knockback and Zombie).",
            "Examine Before Delkfutt's Tower again for a cutscene.",
            "Return to " .. ACTOR.MUCKVIX.text .. " for the final cutscene and your reward.",
        },
    },

    [494] = {
        name = 'Delkfutt the Great',
        steps = {
            "Speak with Shami in Port Jeuno (H-8) for a cutscene.",
            "Speak with Valaineral R Davilles in Southern San d'Oria (S) (H-8) for a cutscene. He may be away on Campaign; Voucheramme, Hinrich or Dallus-Mallus can tell you where the Royal Guards are. Zone out and back if he doesn't reappear.",
            "Touch the shiny Secret Entrance at the east edge of Batallia Downs (S) (G-7) to enter The Eldieme Necropolis (S). The Survival Guide or Campaign warp puts you nearby.",
            "Examine the Egg Discovery Site at (F-9) for a cutscene. Noillurie must not be away on a Campaign operation; the site tells you if she is.",
            "Examine it again to fight Sa'Jho Shieldbreaker (PLD), Enkelados (BST) with three Saplings, and Sharpshot Luttdrutt (RNG, spawns up on the ledge). You have 15 minutes. All but the Saplings resist sleep. Enkelados may Charm if you kill his Saplings first.",
            "Examine the Egg Discovery Site again for a cutscene.",
            "Return to Valaineral R Davilles for a cutscene and your rewards.",
        },
    },

    -- ========================================================
    -- PART 9
    -- ========================================================

    [508] = {
        name = 'Oshasha Violation',
        steps = {
            "Requires Seekers of Adoulin to be complete.",
            "Speak with " .. ACTOR.ANDREINE.text .. ", the receptionist on the left as you enter the Celennia Memorial Library (F-10), for a cutscene.",
            "Go to Marjami Ravine: from Waypoint #2 head southeast, take the tunnel by the small watchtower at (J-9)/(J-10), and at the tent enter the cave on the left and climb the vine to " .. ACTOR.BIBLIOMANIACS_LAIR.text .. " at (I-10), in front of the Seat of Gramk-Droog.",
            "Examine " .. ACTOR.BIBLIOMANIACS_LAIR.text .. ": the fight starts at once against Brash Gramk-Droog (WAR), a Velkk Defiler (DRK) and a Velkk Inquisitor (RDM). All can be slept and silenced.",
            "Examine " .. ACTOR.BIBLIOMANIACS_LAIR.text .. " again for a cutscene and the Liber Daemonium.",
            "Return to " .. ACTOR.ANDREINE.text .. " for the final cutscene and your reward.",
        },
    },

    [516] = {
        name = 'Phantasmic Heroes',
        steps = {
            "Speak with " .. ACTOR.MARJOIRELLE.text .. " near Home Point #2 in Western Adoulin (H-12) for a cutscene.",
            "Go to Leafallia and examine the " .. ACTOR.ODYSSEAN_PASSAGE.text .. " for a cutscene.",
            "Examine the nearby " .. ACTOR.TEST_OF_TALENTS.text .. " for a cutscene.",
            "Leave your party (or have no members in the zone), then examine the " .. ACTOR.TEST_OF_TALENTS.text .. " again for a solo battle against the Shadow Lord. No Trusts; buffs you zone in with carry over.",
            "Volker, Zeid, Valli, Oshasha and Romaa Mihgo help; you lose only if all five fall. The Shadow Lord swaps between dual-wield (Blighting Blitz can one-shot everyone but Valli) and two-hand stances, dispels with a conal attack (four shadows absorb it), and uses Mighty Strikes and Blood Weapon repeatedly.",
            "After the cutscene, speak with " .. ACTOR.ANDREINE.text .. " in the Celennia Memorial Library for the final cutscene and your reward.",
        },
    },

    [530] = {
        name = "Skokkr Undrborn's Temptation",
        steps = {
            "Speak with " .. ACTOR.GLOWING_HEARTH.text .. " near Home Point #1 in Eastern Adoulin (H-6); the cutscene moves you into the Silver Knife.",
            "Speak with " .. ACTOR.OSCARNOT.text .. " for a cutscene. (If bidding for the Auria Collection has closed, speak with Zemerine before Gama-Shama.)",
            "Speak with Gama-Shama in the Silver Knife; he mentions his Esthete's Masque and Runje Desaali.",
            "Speak with " .. ACTOR.RUNJE_DESAALI.text .. " in Eastern Adoulin (J-10) until she shows you the Esthete's Masque and hints at the gear she wants. Get that dialogue before trading.",
            "Trade " .. ACTOR.RUNJE_DESAALI.text .. " an item level 106 or 115 Wildskeeper Reive weapon, armor or Rare/Ex accessory (she pays 4,000-6,000 Bayld). Check for a Kupon AW-WK first; Records of Eminence NPCs also trade all six Wildskeeper key items for a weapon.",
            "Ask her \"What does Geosuke recommend?\" and buy the Esthete's Masque, Coat and Hose (30,000 Bayld each, 90,000 total).",
            "In the Silver Knife, speak with Zemerine while wearing all three (or a lockstyle of exactly that set) for a cutscene.",
            "Take them off or disable the lockstyle, then speak with " .. ACTOR.OSCARNOT.text .. " for a cutscene. (If Zemerine's cutscene didn't play, try this step anyway.)",
            "Speak with " .. ACTOR.GLOWING_HEARTH.text .. " outside the Silver Knife for a cutscene and your reward.",
        },
    },

    [542] = {
        name = 'The Prime Weapons',
        steps = {
            "Go to Leafallia and examine the " .. ACTOR.ODYSSEAN_PASSAGE.text .. " for a cutscene. (Optional: " .. ACTOR.ANDREINE.text .. " hints at Oshasha's whereabouts.)",
            "Trade a Stygian Ash to the " .. ACTOR.ODYSSEAN_PASSAGE.text .. " for a cutscene and the Bronze-hued tag. Pixies drop it around Witchfire Glen in Grauberg (S) (Lightsworm at the blue sparkles by the Batallia Downs Survival Guide, then the conflux behind you; or the Grauberg (S) Survival Guide or Campaign warp).",
            "Go to Outer Ra'Kaznar (waypoint) and the Shrouded Workroom at (K-3) on the upper floor (Map 1). Don't touch the roots at (J-3); they send you back to the entrance. Watch for Umbrils. Examine it for a cutscene.",
            "Return to the " .. ACTOR.ODYSSEAN_PASSAGE.text .. " in Leafallia for the final cutscene and your reward.",
            "Start your Prime Weapon now: speak with Oggbi in The Steaming Sheep, Port Bastok (E-6), for Uran-Mafran's orb, then pay Gama-Shama in the Silver Knife 10,000 Gallimaufry and wait a game day.",
            "Pick a damage-dealing weapon (not Duban or Loughnashade); you need it at stage 2 for Duke Alloces's Decision and The Voracious Beast, and its job limits who you can bring to the hard final fight. For a support-job-friendly melee pick: Lorg Mor (WHM, GEO), Opashoro (BLM, SMN, SCH), Mpu Gandring (RDM, THF, BRD, DNC), Caliburnus (PLD, BLU, RDM).",
        },
    },

    -- ========================================================
    -- PART 10
    -- ========================================================

    [552] = {
        name = 'To Movalpolos!',
        steps = {
            "Requires the Chains of Promathia epilogue with Jabbos in Oldton Movalpolos (after Dawn).",
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines (J-7), Home Point #3, for a cutscene.",
            "Speak with " .. ACTOR.TARNOTIK.text .. " in Oldton Movalpolos (K-10) for a cutscene (Proto-Waypoint is closest, or the Survival Guide).",
            "Go to Mine Shaft #2716 (trade Tarnotik a Snow Lily, the Newton Movalpolos Home Point, or Twinkbrix at (E-13) for 10,000 gil) and examine the " .. ACTOR.MINE_SHAFT_2716.text .. " entrance for a cutscene.",
            "Examine the " .. ACTOR.MINE_SHAFT_2716.text .. " entrance again and choose \"To Movalpolos!\" to fight Gloom Phantom, Awoken Vampyr Jarl, Awoken Ariri Samariri (can use Death) and Awoken Hildesvini. Trusts allowed; Jabbos can tank one (he engages when you draw your weapon). A cutscene and your reward follow.",
        },
    },

    [562] = {
        name = 'Magh Bihu on the Prowl',
        steps = {
            "Before you go, get an Acidic Humus and a Watermelon per party member. Acidic Humus: Auction House (Others > Misc. 2), or in Abyssea - Tahrongi kill Pachypodiums for an Alkaline Humus and trade it to the ??? on the east side of (H-8) to spawn Gancanagh. Watermelon: Scamplix near Home Point #2 in Rabao (F-7).",
            "Go to The Boyahda Tree Map 1 (F-4), the spot entered from (E-4) with a single Mandragora Warden (F-4) (Proto-Waypoint is closest; or the Cloister Home Point and exit F; or Unity Warp level 135), and ask about Magh Bihu.",
            "Trade the Acidic Humus to the " .. ACTOR.MANDRAGORA_WARDEN.text .. " for a cutscene.",
            "Speak with the " .. ACTOR.MANDRAGORA_WARDEN.text .. " again and choose \"Where did Magh Bihu go?\"",
            "Trade the Watermelon to the " .. ACTOR.MANDRAGORA_WARDEN.text .. " for the final cutscene and your reward.",
        },
    },

    [574] = {
        name = '101 Dazbogs',
        steps = {
            "Farm six Fat Worm Meat (Rare/Ex) from Boulder Eaters in Gustav Tunnel Map 2 (J-6); Unity Warp (level 128) puts you on that map. Treasure Hunter helps.",
            "Go to Gusgen Mines Map 4 (where Juggler Hecatomb spawns) and speak with " .. ACTOR.HEDROV.text .. " behind the shed in the middle of the room at (H-7) for a cutscene. From the Survival Guide go to exit A, keep left and take tunnel G; or tunnels B and E, then Drop H on Map 3.",
            "Trade the six Fat Worm Meat to " .. ACTOR.HEDROV.text .. " for a cutscene and your reward.",
        },
    },

    [580] = {
        name = 'Kipdrix the Faithful',
        steps = {
            "Speak with " .. ACTOR.TARNOTIK.text .. " in Oldton Movalpolos (K-10) for a cutscene.",
            "Enter " .. ACTOR.MINE_SHAFT_2716.text .. " for a cutscene (Snow Lily to Tarnotik, the Newton Movalpolos Home Point, or 10,000 gil to Twinkbrix).",
            "Return to " .. ACTOR.TARNOTIK.text .. " for a cutscene.",
            "Go to Castle Zvahl Keep (Throne Room Home Point) and examine the " .. ACTOR.THRONE_ROOM_DOOR.text .. " for a cutscene.",
            "Examine the " .. ACTOR.THRONE_ROOM_DOOR.text .. " again to fight an Orcish Warchief (PLD; Blind aura), Yagudo Inquisitor (SAM; Addle aura) and Topaz Quadav (WHM; Slow aura). Each uses its SP ability and is easy to sleep and silence; auras end when the owner dies. Magh Bihu and Dazbog help once you draw your weapon.",
            "Set your frame rate back to 30 FPS and unload FastCS first: the cutscene afterwards can crash at higher rates. You exit into Xarcabard and receive your reward.",
        },
    },

    [592] = {
        name = "Duke Alloces's Decision",
        steps = {
            "Requires a Prime Weapon upgraded to stage 2 (not Duban or Loughnashade).",
            "Equip it and examine " .. ACTOR.HEROES_GAMBIT.text .. " at (J-9) in Xarcabard (Unity Warp level 125 is close) for a cutscene.",
            "Examine the " .. ACTOR.VALHALLAN_RIFT.text .. " across from the Home Point in Castle Zvahl Keep (G-7) for a cutscene. After this you may switch to any job.",
            "Examine the " .. ACTOR.VALHALLAN_RIFT.text .. " again to fight Chaos (RDM/DRK). You have 15 minutes. The Destiny Destroyers help and are very sturdy; you lose if any of them falls. Keep Reraise up. Chaos's strong dispel strips buffs and pieces of gear; Manafont clears his debuffs. Any weapon can hurt him here.",
            "You're moved to Xarcabard. Examine " .. ACTOR.HEROES_GAMBIT.text .. " again for a cutscene and your gil reward (the Despairing psyche is taken).",
        },
    },

    [602] = {
        name = "Odin's Eye",
        steps = {
            "Requires access to Dynamis - Xarcabard.",
            "Zone after the previous mission, then examine " .. ACTOR.HEROES_GAMBIT.text .. " in Xarcabard for a cutscene and the Despairing psyche.",
            "Enter Dynamis - Xarcabard and touch the four Twinkling Presence spots: northwest (I-9) among the demons; east (H-7) on the right cliff above the ramp; north-middle (F-7) above the Uleguerand Range exit; northwest corner of (G-10). You get the Suffering, Anguished, Rancorous and Determined psyche.",
            "Examine the glowing Before Castle Zvahl spot at (D-7), where the Dynamis Lord fight is, for a cutscene and Raebrimm's memento. You're moved out of Dynamis.",
            "Speak with " .. ACTOR.GUMBAH.text .. " in Bastok Mines (J-7) for a cutscene and your reward.",
        },
    },

    -- ========================================================
    -- PART 11
    -- ========================================================

    [612] = {
        name = 'Moglesse Oblige',
        steps = {
            "Speak with the Moogle in your home nation's Mog House for a cutscene.",
            "Examine the " .. ACTOR.LA_THEINE_STONE_CIRCLE_QQ_G6.text .. " in La Theine Plateau for a cutscene (Unity Warp level 99, Survival Guide or Teleport-Holla).",
            "Go to the " .. ACTOR.MOOGLE_MEETING.text .. " spot in La Theine Plateau, reached through Ordelle's Caves Map 3: from the Survival Guide go to B, take path D on Map 1, and on Map 2 drop down the southeast hole at (H-11). The Proto-Waypoint is quicker. Examine it for a cutscene.",
            "Examine the " .. ACTOR.MOOGLE_MEETING.text .. " spot again to fight Spikehelm Argok (Orc DRK), Tethys (Gigas MNK), Garmatur the Merciless (Troll RDM) and Antican Curule Aedillis (BLM). Trusts allowed; all can be slept and silenced. A cutscene and your reward follow.",
        },
    },

    [624] = {
        name = 'The Voracious Beast',
        steps = {
            "Examine " .. ACTOR.HEROES_GAMBIT.text .. " at (J-9) in Xarcabard for a cutscene.",
            "Examine the " .. ACTOR.VALHALLAN_RIFT.text .. " at (G-7) in Castle Zvahl Keep (Throne Room Home Point) for a cutscene.",
            "Examine the " .. ACTOR.VALHALLAN_RIFT.text .. " again to fight Garazu-Horeizu (BLM/RDM). Buffs are removed on entry; Trusts allowed; the Destiny Destroyers help. He uses staff weapon skills, Chainspell -ga IV nukes and clones of your group; only he needs to die.",
            "After the cutscene, everyone equips a stage 2+ Prime Weapon (not Duban or Loughnashade; helpers too) and examines the " .. ACTOR.VALHALLAN_RIFT.text .. " again to fight Chaos. This is the hardest fight in the storyline; bring other players. Trusts may be resummoned.",
            "Other weapons (and pets of players not using their Prime) deal 70% less and can't finish him; the last hit must come from a Prime Weapon. Chaos regenerates when idle and can Cure IV for 30,000+. When his HP first drops low it is hidden, Gurebu-Ougrebu and Medada fall and become Profane Circle fetters that cut his damage taken; kill them. Cornelia, Lehko Habhoka, Ragelise, Fickblix and Luzaf then arrive one at a time and absorb Black Sanctus (a doom counter) for you; fallen ones become fetters too.",
            "You get the Vial of Chaos's blood. Return to " .. ACTOR.HEROES_GAMBIT.text .. " for the final cutscene and choose a ring. You can defer the choice; a dropped ring can be replaced free once per conquest tally (zone first if you dropped it in Xarcabard).",
        },
    },

    [642] = {
        name = 'Your Decision',
        steps = {
            "This mission starts automatically after The Voracious Beast.",
            "Speak with Gama-Shama in the Silver Knife: you can now fully upgrade Prime Weapons, and your Gallimaufry cap rises to 100,000,000.",
            "Speak with Elijah in Upper Jeuno, zone, then speak with him again to start collecting Voracious Psyches.",
        },
    },

}

return M