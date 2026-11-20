--[[
    Rhapsodies of Vana'diel - Mission Database
    ============================================

    M.MISSIONS:
        Official mission IDs extracted from DAT 0xD9BD.

    M.STEPS:
        Walkthrough entries organized by chapter/mission position.

    The numeric mission IDs and walkthrough IDs are intentionally
    kept as separate systems.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'Rhapsodies of Vana\'diel',
    [110] = 'Resonance',
    [111] = 'Emissary from the Seas',
    [112] = 'Set Free',
    [114] = 'The Beginning',
    [118] = 'Flames of Prayer',
    [120] = 'The Path Untraveled',
    [126] = 'At the Heavens\' Door',
    [128] = 'The Lion\'s Roar',
    [130] = 'Eddies of Despair',
    [134] = 'A Land After Time',
    [136] = 'Fate\'s Call',
    [138] = 'What Lies Beyond',
    [140] = 'The Ties That Bind',
    [142] = 'Impurity',
    [144] = 'The Lost Avatar',
    [148] = 'Volto Oscuro',
    [150] = 'Ring My Bell',
    [152] = 'Spirits Awoken',
    [154] = 'Crashing Waves',
    [156] = 'Call to Serve',
    [158] = 'Numbering Days',
    [160] = 'Inescapable Binds',
    [162] = 'Desert Winds',
    [164] = 'Ever Forward',
    [168] = 'The Endless Sky',
    [170] = 'Aphmau\'s Light',
    [172] = 'Reunited',
    [174] = 'Take Wing',
    [176] = 'Prime Number',
    [178] = 'From the Ruins',
    [180] = 'Cauterize',
    [186] = 'Uncertain Destinations',
    [188] = 'Ganged Up On',
    [191] = 'Sacrifice',
    [194] = 'Somber Dreams',
    [200] = 'Of Light and Darkness',
    [202] = 'Temporary Farewells',
    [204] = 'Brushing Up',
    [206] = 'Keep On Giving',
    [208] = 'Past Imperfect',
    [209] = 'The Cursed Temple',
    [211] = 'Wisdom of Our Forefathers',
    [212] = 'Where Divinities Collide',
    [214] = 'Visions of Dread',
    [216] = 'To the Skies',
    [218] = 'Escha - Ru\'Aun',
    [222] = 'The Decisive Heroine',
    [224] = 'Fall from Grace',
    [226] = 'Banishing the Darkness',
    [228] = 'Over the Rainbow',
    [230] = 'Cacophonous Discord',
    [232] = 'Eddies of Despair',
    [234] = 'Pretender to the Throne',
    [238] = 'Banished',
    [240] = 'Call of the Void',
    [244] = 'Both Paths Taken',
    [250] = 'The Man Behind the Mask',
    [252] = 'Uncertain Futures',
    [254] = 'Darkness Beckons',
    [258] = 'The Brewing Storm',
    [260] = 'The River Runs Red',
    [262] = 'The Crucible',
    [263] = 'Forward Thinking',
    [264] = 'Tears of the Generals',
    [266] = 'What He Left Behind',
    [268] = 'Gone but Not Forgotten',
    [269] = 'August Artifacts',
    [270] = 'Solemnity',
    [272] = 'Eyes on You',
    [274] = 'Exploring the Ruins',
    [278] = 'Become Something More',
    [280] = 'Unshakable Nightmares',
    [282] = 'What Remains of Hope',
    [286] = 'Death Cares Not',
    [288] = 'No Time like the Future',
    [292] = 'Sin',
    [296] = 'Penance',
    [298] = 'Vessel of Light',
    [300] = 'The Lifestream of Reisenjima',
    [302] = 'From West to East',
    [304] = 'Good Things Come in Threes',
    [306] = 'Tackling the Problem',
    [308] = 'Way to Divinity',
    [310] = 'The Winds of Time',
    [314] = 'Calm After the Storm',
    [318] = 'Nary a Cloud in Sight',
    [320] = 'An Unending Song',
    [324] = 'A Deep Sleep',
    [326] = 'Guardians',
    [328] = 'Iroha in Distress',
    [330] = 'Absolute Trust',
    [332] = 'The Orb\'s Radiance',
    [334] = 'A Rhapsody for the Ages',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- CHAPTER 1
    -- Creation and Rebirth
    -- ========================================================

    ['1-1'] = {
        name = "Rhapsodies of Vana'diel",
        steps = {
            "Enter your home nation after reaching level 3.",
            "San d'Oria: Southern San d'Oria (H-8), Northern San d'Oria (J-10), or Port San d'Oria (H-9).",
            "Bastok: Bastok Mines (I-9), Bastok Markets (I-8), or Port Bastok (D-7).",
            "Windurst: Windurst Waters (F-5), Windurst Walls (C-6), Port Windurst (B-5), or Windurst Woods (J-10).",
            "If the opening event does not occur, examine a Tales' Beginning at one of those locations.",
        },
    },

    ['1-2'] = {
        name = "Resonance",
        steps = {
            "Enter Selbina or Mhaura.",
            "The town you choose determines which path you will follow in Emissary from the Seas.",
        },
    },

    ['1-3'] = {
        name = "Emissary from the Seas",
        steps = {
            "Selbina: speak with Naillina at (F-9) in the Mayor's Residence.",
            "Selbina: choose the first dialogue option, \"You wanted an adventurer?\"",
            "Mhaura: speak with Numi Adaligo at (F-9) in the Governor's House.",
            "Mhaura: choose the first dialogue option, \"You're searching for adventurers?\"",
        },
    },

    ['1-4'] = {
        name = "Set Free",
        steps = {
            "Selbina: obtain 3 Bee Pollen from Huge Wasps in La Theine Plateau or Konschtat Highlands, or purchase them from the Auction House.",
            "Selbina: return to Selbina and trade all 3 Bee Pollen to Abelard.",
            "Mhaura: obtain 3 Mandragora Dewdrops from Pygmaioi in Tahrongi Canyon, or purchase them from the Auction House.",
            "Mhaura: return to Mhaura and trade all 3 Mandragora Dewdrops to Ekokoko.",
            "Farming tips: Huge Wasps are densest around the Crag of Dem in Konschtat Highlands (12-15 spawns; they respawn by the time you finish a lap). Use Wide Scan to find Wasps or Pygmaioi.",
            "If your support job is not unlocked you get Gilgamesh's introductory letter instead of a Copper Voucher. At level 18 or higher, speak with Isacio in Selbina (G-10) or Vera in Mhaura (G-10) twice to unlock your support job.",
        },
    },

    ['1-5'] = {
        name = "The Beginning",
        steps = {
            "Selbina: speak with Pacomart at (H-10) to travel to Norg.",
            "Selbina: examine " .. ACTOR.NORG_OAKEN_DOOR.text .. " in Norg.",
            "Mhaura: speak with Tonasav at (H-9) to travel to Norg.",
            "Mhaura: examine " .. ACTOR.NORG_OAKEN_DOOR.text .. " in Norg.",
            "New players: unlock Norg's Survival Guide, Proto-Waypoint and Home Point before leaving. If you miss the door, the boatman takes you back to Norg again.",
        },
    },

    ['1-6'] = {
        name = "Flames of Prayer",
        steps = {
            "Examine " .. ACTOR.NORG_OAKEN_DOOR.text .. " in Norg again.",
            "You receive Rhapsody in White: +30% experience and limit points, double skill-up rate, a fifth Trust, 80% cheaper Home Points, cheaper Survival Guides and Fields of Valor buffs, and extra Curio Vendor Moogle stock.",
        },
    },

    ['1-7'] = {
        name = "The Path Untraveled",
        steps = {
            "Reach Rank 3 in your home nation.",
            "Examine a Shattered Telepoint at the Crag of Holla, Dem, or Mea.",
            "Choose the Qufim Island response to continue.",
            "If the relevant rank missions were already completed, speak with Halver at Chateau d'Oraguille (I-9) for Cipher: Halver's Alter Ego.",
            "If the relevant rank missions were already completed, speak with Kupipi in Heavens Tower for Cipher: Semih's Alter Ego.",
        },
    },

    ['1-8'] = {
        name = "At the Heavens' Door",
        steps = {
            "Travel to Qufim Island and head to Home Point #1 at (G-8).",
            "Examine " .. ACTOR.QUFIM_UNDULATING_CONFLUENCE.text,
            "Solo players should be at least level 40 before the next mission; the fight is harder than what came before.",
        },
    },

    ['1-9'] = {
        name = "The Lion's Roar",
        steps = {
            "Return to Home Point #1 at (G-8) in Qufim Island.",
            "Summon your Trusts and buff first, then examine " .. ACTOR.QUFIM_UNDULATING_CONFLUENCE.text .. " again: Ophiotaurus spawns and attacks immediately. Only one party can have it up at a time.",
            "Defeat Ophiotaurus. Calling for Help is allowed. Level 40-50 is recommended solo with Trusts.",
        },
    },

    ['1-10'] = {
        name = "Eddies of Despair",
        steps = {
            "After defeating Ophiotaurus, examine " .. ACTOR.QUFIM_UNDULATING_CONFLUENCE.text .. " again. You are teleported into Escha - Zi'Tah, which completes the mission.",
        },
    },

    ['1-11'] = {
        name = "A Land After Time",
        steps = {
            "Return to the Shattered Telepoint at the Crag of Holla, Dem, or Mea.",
            "Examine the Shattered Telepoint.",
            "Receive Rhapsody in Umber and Cipher: Lion's Alter Ego II.",
        },
    },

    ['1-12'] = {
        name = "Fate's Call",
        steps = {
            "Defeat the Shadow Lord in your nation's Rank 5-2 mission (San d'Oria: The Shadow Lord; Bastok: Xarcabard, Land of Truths; Windurst: The Shadow Awaits).",
            "Zone into any of the three starting nations for a cutscene with Iroha.",
        },
    },

    ['1-13'] = {
        name = "What Lies Beyond",
        steps = {
            "Zone into Norg and examine " .. ACTOR.NORG_GILGAMESH_OAKEN_DOOR.text .. ". If you haven't started Rise of the Zilart, its first mission's cutscene plays when you enter Norg.",
        },
    },

    ['1-14'] = {
        name = "The Ties That Bind",
        steps = {
            "Examine " .. ACTOR.SEA_SERPENT_GROTTO_QQ_J12.text .. " at the edge of the lake in Sea Serpent Grotto for a cutscene.",
            "Walking: leave Norg south on foot to Sea Serpent Grotto and follow the tunnel south to the dead end by a torch at (H-6). Open the hidden (blank-named) door, go left to (J-5), then right to the one-way drop at (K-7). Hug the left wall past the Ornamented Door (J-10) to the big room at (K-11).",
            "Or use Unity Warp (level 125) to Sea Serpent Grotto: go back northeast through the blank-named door at (M-5); the lake is straight ahead. Sneak helps, as the Mousse there aggro to sound.",
            "Don't warp away afterwards: the next mission is in Yuhtunga Jungle, and the Survival Guide at (M-3) or Escape puts you close.",
        },
    },

    ['1-15'] = {
        name = "Impurity",
        steps = {
            "Examine " .. ACTOR.YUHTUNGA_QQ_F11.text .. " in Yuhtunga Jungle for a cutscene.",
            "From Sea Serpent Grotto, Escape or a short walk takes you out to Yuhtunga Jungle. From Norg, rent a chocobo from Marilleune (H-9). From elsewhere, Unity Wanted Battle (level 119) to Yuhtunga Jungle is close.",
            "Solo players should be about level 80 before the next fight.",
        },
    },

    ['1-16'] = {
        name = "The Lost Avatar",
        steps = {
            "Buff and summon Trusts, then examine " .. ACTOR.YUHTUNGA_QQ_F11.text .. " again: Siren spawns immediately.",
            "Defeat Siren within about 15 minutes or she despawns. Her Entice charms in a cone in front of her and dismisses your Trusts if it hits you, so let a Trust tank and stand behind her. She absorbs wind damage, including Detonation, Fragmentation and Light skillchains; watch Trusts like Shantotto II.",
            "After the battle, examine " .. ACTOR.YUHTUNGA_QQ_F11.text .. " again.",
            "If you called for help during the battle, wait about one minute and examine the target again.",
            "Receive Rhapsody in Azure.",
        },
    },

    ['1-17'] = {
        name = "Volto Oscuro",
        steps = {
            "Examine " .. ACTOR.NORG_OAKEN_DOOR.text .. " in Norg.",
            "Receive Cipher: Zeid II.",
        },
    },

    ['1-18'] = {
        name = "Ring My Bell",
        steps = {
            "Examine " .. ACTOR.NORG_GILGAMESH_OAKEN_DOOR.text .. " in Norg multiple times.",
            "Enter Gilgamesh's room and speak with him at (K-8).",
        },
    },

    -- ========================================================
    -- CHAPTER 2
    -- Revitalization
    -- ========================================================

    ['2-1'] = {
        name = "Spirits Awoken",
        steps = {
            "Zone into Lower Delkfutt's Tower from Qufim Island for a cutscene. Warping to the Survival Guide also works; rezone if it doesn't trigger.",
        },
    },

    ['2-2'] = {
        name = "Crashing Waves",
        steps = {
            "You must have progressed through Promathia Mission 3-2.",
            "Go to Ru'Lude Gardens and approach the palace for a cutscene at (H-7).",
            "You must receive Cipher: Tenzen II to finish. If your inventory was full, get it from the Mystic Retriever at the palace entrance.",
        },
    },

    ['2-3'] = {
        name = "Call to Serve",
        steps = {
            "Travel to Port Jeuno.",
            "Enter Port Jeuno.",
            "Receive Cipher: Prishe's Alter Ego II.",
        },
    },

    ['2-4'] = {
        name = "Numbering Days",
        steps = {
            "Travel to Upper Jeuno.",
            "Examine " .. ACTOR.MARBLE_BRIDGE.text .. ".",
        },
    },

    ['2-5'] = {
        name = "Inescapable Binds",
        steps = {
            "Travel to Aht Urhgan Whitegate.",
            "Enter Aht Urhgan Whitegate.",
            "No access to Aht Urhgan yet? Speak with Faursel in the Tenshodo in Lower Jeuno (J-8), choose the third (hidden) option twice, then \"Where is Tenzen\".",
        },
    },

    ['2-6'] = {
        name = "Desert Winds",
        steps = {
            "Get an Aht Urhgan boarding permit from the Tenshodo. If you already have one, this mission completes automatically.",
            "The mission finishes when you get the cutscene with Tenzen in Aht Urhgan Whitegate.",
        },
    },

    ['2-7'] = {
        name = "Ever Forward",
        steps = {
            "You need to have reached Treasures of Aht Urhgan Mission 12, Royal Puppeteer, to go past this mission.",
            "If you finished all Aht Urhgan missions: examine " .. ACTOR.IMPERIAL_WHITEGATE.text .. " for a cutscene. You skip ahead to Reunited, receive Cipher: Nashmeira II and can view all Aht Urhgan cutscenes. (A cutscene in your home nation is optional.)",
            "If you are on Royal Puppeteer or later but not finished: return to your home nation for a cutscene; you skip ahead to Aphmau's Light.",
            "If you haven't started Aht Urhgan, you move on to The Endless Sky and wait there.",
            "For Cipher: Abquhbah, speak with Abquhbah after the home nation cutscene (you must be past Aht Urhgan Mission 3, President Salaheem).",
        },
    },

    ['2-8'] = {
        name = "The Endless Sky",
        steps = {
            "Complete Treasures of Aht Urhgan up to Mission 12, Royal Puppeteer, to continue.",
        },
    },

    ['2-9'] = {
        name = "Aphmau's Light",
        steps = {
            "Examine the Imperial Whitegate (L-8/9) in Aht Urhgan Whitegate while Aphmau is in town.",
            "Even past Passing Glory, in some Aht Urhgan missions Aphmau is away (for example Sweets for the Soul and Puppet in Peril). Progress to one where she is in town.",
            "Receive Cipher: Nashmeira's Alter Ego II.",
        },
    },

    ['2-10'] = {
        name = "Reunited",
        steps = {
            "Enter " .. ACTOR.WALAHRA_TEMPLE.text .. " and talk to Nadeey for a cutscene.",
        },
    },

    ['2-11'] = {
        name = "Take Wing",
        steps = {
            "Go to " .. ACTOR.SHARARAT.text .. " at (K-12) in Aht Urhgan Whitegate for a cutscene.",
        },
    },

    ['2-12'] = {
        name = "Prime Number",
        steps = {
            "Travel to Alzadaal Undersea Ruins.",
            "Enter through the Chamber of Passage and reach the Nyzul Isle Staging Point.",
            "Use 200 Imperial Standing to travel to the staging point, or use an Assault tag to enter Nyzul Isle Investigation and reach Alzadaal Undersea Ruins.",
            "Enter Alzadaal Undersea Ruins.",
        },
    },

    ['2-13'] = {
        name = "From the Ruins",
        steps = {
            "Return to Aht Urhgan Whitegate.",
            "Examine " .. ACTOR.IMPERIAL_WHITEGATE.text .. " at the Palace Door.",
            "Receive Rhapsody in Crimson.",
            "Optional, any time before Both Paths Taken: extra cutscenes play by re-entering Alzadaal Undersea Ruins (all Aht Urhgan missions done), entering The Shrouded Maw (after Promathia 3-5), and reaching the bottom of The Garden of Ru'Hmet (all Promathia missions done).",
        },
    },

    ['2-14'] = {
        name = "Cauterize",
        steps = {
            "Examine the sparkling ??? beside a Cavernous Maw in Batallia Downs, Rolanberry Fields, or Sauromugue Champaign.",
            "The corresponding [S] Cavernous Maw locations can also be used.",
            "You may need to be on Wings of the Goddess Mission 8 (In the Name of the Father) or later. If the quests Champion of the Dawn and A Forbidden Reunion are flagged, finish them first. Without Wings of the Goddess you continue to Uncertain Destinations; with it, to Ganged Up On.",
        },
    },

    ['2-15'] = {
        name = "Uncertain Destinations",
        steps = {
            "Examine the sparkling ??? beside a Cavernous Maw in Batallia Downs, Rolanberry Fields, or Sauromugue Champaign.",
            "The corresponding [S] locations can also be used.",
            "If Wings of the Goddess has not been started, receive Lightsworm here.",
            "Use the sparkling blue ???, not the white one.",
        },
    },

    ['2-16'] = {
        name = "Ganged Up On",
        steps = {
            "If Wings of the Goddess is complete, examine the sparkling ??? beside a Cavernous Maw in Batallia Downs, Rolanberry Fields, or Sauromugue Champaign.",
            "If Wings of the Goddess is incomplete, progress to at least In the Name of the Father and zone into Southern San d'Oria (S).",
            "If the Southern San d'Oria (S) event does not occur, first examine the sparkling ??? beside a present-day Cavernous Maw.",
            "Receive Lightsworm if your Wings of the Goddess progression requires it.",
            "Receive Cipher: Lilisette's Alter Ego II.",
            "If nothing advances you to Sacrifice, check the Mystic Retriever in Southern San d'Oria [S] (M-6).",
        },
    },

    ['2-17'] = {
        name = "Sacrifice",
        steps = {
            "Bring a warp (Warp Ring, Instant Warp): after the next mission you are stranded in Grauberg [S].",
            "Enter the Walk of Echoes. After Wings of the Goddess Mission 45 (Time Slips Away) use the Veridical Conflux in Pashhow Marshlands [S] (J-9) or Grauberg [S] (F-5). Otherwise use your Lightsworm on the glowing ??? next to the Cavernous Maw in Batallia Downs (H-5), Rolanberry Fields (H-6) or Sauromugue Champaign (K-9).",
            "Run straight ahead, up the stairs, and examine " .. ACTOR.ORNATE_DOOR_WALK.text .. " for a cutscene.",
        },
    },

    ['2-18'] = {
    name = "Somber Dreams",
    steps = {
            "You arrive in Witchfire Glen in Grauberg [S] automatically after the previous cutscene.",
            "Examine " .. ACTOR.GRAUBERG_QQ_H6.text .. ", the blue glowing ??? northeast of the Veridical Conflux (not the one right beside it), to spawn Cetus. It gains Dread Spikes after Aetheric Pull.",
            "After defeating Cetus, examine " .. ACTOR.GRAUBERG_QQ_H6.text .. " again for a cutscene.",
            "Examine the ??? beside the Veridical Conflux to return to the Walk of Echoes for a cutscene, then warp back to town.",
        },
    },

    ['2-20'] = {
        name = "Temporary Farewells",
        steps = {
            "Travel to Misareaux Coast (G-5).",
            "Examine " .. ACTOR.MISAREAUX_UNDULATING_CONFLUENCE.text .. " and the nearby sparkling ???.",
        },
    },

    ['2-21'] = {
        name = "Brushing Up",
        steps = {
            "Return to Misareaux Coast (G-5).",
            "Examine the ??? next to " .. ACTOR.MISAREAUX_UNDULATING_CONFLUENCE.text .. " again for another cutscene.",
            "Choose one training focus for Iroha: Strength, Endurance, or Style.",
        },
    },

    ['2-22'] = {
        name = "Keep On Giving",
        steps = {
            "Trade the food Iroha asked for to the ??? next to " .. ACTOR.MISAREAUX_UNDULATING_CONFLUENCE.text .. ". All three are sold by Curio Vendor Moogles:",
            "Strength: a Beef Stewpot (15,000 gil).",
            "Endurance: a Serving of Zaru Soba (15,000 gil).",
            "Style: 30 Spicy Crackers (450 gil each, 13,500 total; also easy to craft).",
            "Choose the dialogue option concerning Altana's help when prompted.",
        },
    },

    ['2-23'] = {
        name = "Past Imperfect",
        steps = {
            "Travel to Norg.",
            "Examine " .. ACTOR.NORG_GILGAMESH_OAKEN_DOOR.text .. ".",
            "If Gilgamesh directs you to Jakoh Wahcondalo, speak with " .. ACTOR.JAKOH.text .. " in Kazham.",
            "Return to Norg and examine " .. ACTOR.NORG_OAKEN_DOOR.text .. " again.",
        },
    },

    ['2-24'] = {
        name = "The Cursed Temple",
        steps = {
            "You must have completed Zilart Mission 4, The Temple of Uggalepih.",
            "Enter the Temple of Uggalepih from Yhoator Jungle (J-11) for a cutscene. Unity Warp (level 122) to Yhoator Jungle lands at Bloodlet Spring; head south to (J-11).",
            "Route to the Granite Door: after the first stairs turn left, then left again, and follow the path through the Granite Door at (J-7) into a hidden section. At the top of the stairs at (J-3) zone out to Yhoator Jungle (J-9), take each right (skip dead-end rooms) and zone back into the temple. The Tonberries and bees there aggro even at 99.",
            "Keep left to the Granite Door at (J-6), map 3, and examine " .. ACTOR.GRANITE_DOOR_ROV.text .. " for a cutscene.",
        },
    },

    ['2-25'] = {
        name = "Wisdom of Our Forefathers",
        steps = {
            "Travel to the Crag of Holla, Dem, or Mea.",
            "Enter the Hall of Transference through the Shattered Telepoint.",
        },
    },

    ['2-26'] = {
        name = "Where Divinities Collide",
        steps = {
            "Examine the " .. ACTOR.SHATTERED_TELEPOINT.text .. " at the Crag of Holla, Dem or Mea to enter the Hall of Transference for a cutscene.",
        },
    },

    ['2-27'] = {
        name = "Visions of Dread",
        steps = {
            "Enter the Hall of Transference through the " .. ACTOR.SHATTERED_TELEPOINT.text .. " at any Crag for a cutscene.",
        },
    },

    ['2-28'] = {
        name = "To the Skies",
        steps = {
            "Return to Norg and examine " .. ACTOR.NORG_GILGAMESH_OAKEN_DOOR.text .. " for a cutscene.",
        },
    },

    ['2-29'] = {
        name = "Escha - Ru'Aun",
        steps = {
            "Examine " .. ACTOR.MISAREAUX_UNDULATING_CONFLUENCE.text .. " in Misareaux Coast for a cutscene. The Home Point takes you right to it.",
            "Examine it again to enter Escha - Ru'Aun for another cutscene.",
        },
    },

    ['2-30'] = {
        name = "The Decisive Heroine",
        steps = {
            "Enter Escha - Ru'Aun.",
            "Head north up the ramp, then take the first left and continue west-northwest toward (H-10).",
            "Examine the blue ??? at the top of the stairs.",
            "Receive Siren's plume and Rhapsody in Emerald.",
        },
    },

    ['2-31'] = {
        name = "Fall from Grace",
        steps = {
            "Return to any Crag and examine the " .. ACTOR.SHATTERED_TELEPOINT.text .. " for a cutscene.",
        },
    },

    ['2-32'] = {
        name = "Banishing the Darkness",
        steps = {
            "Travel to Norg.",
            "Examine " .. ACTOR.NORG_OAKEN_DOOR.text .. ".",
        },
    },

    ['2-33'] = {
        name = "Over the Rainbow",
        steps = {
            "Warp to Windurst Walls Home Point #3 and speak with " .. ACTOR.SHANTOTTO.text .. " at her manor (K-7) for a cutscene.",
            "Receive Most curious curio.",
        },
    },

    ['2-34'] = {
        name = "Cacophonous Discord",
        steps = {
            "Travel to Misareaux Coast.",
            "Examine " .. ACTOR.MISAREAUX_UNDULATING_CONFLUENCE.text .. " and enter Escha - Ru'Aun.",
        },
    },

    ['2-35'] = {
        name = "Eddies of Despair",
        steps = {
            "In Escha - Ru'Aun, get an Eschan Droplet from the ??? on the left by Dremi at the entrance, then use the Eschan Portal. At each new island, find its ??? for another droplet and take the next portal, up to Portal #15.",
            "Droplet ??? locations: #2, #5 at the end of the only path, next to the door (not the one in front of the portal); #3 up the first staircase by the pillar on the right; #4 across the bridge between the two large pillars on the left; #6 southern (G-6), past and under the second staircase on the bridge with the closed door; #7 (F-5), left of the second bridge.",
            "#8, #11, #14 at the end of the only path; #9 up both stairs, left, left again at the bridge over the water, in the middle (Gargoyles aggro at night near their alcoves); #10 across both bridges, southwest side of the last platform; #12 Sneak, up both stairs, right, past the staircase on the left at (J-7); #13 across the first bridge by the first large pillar on the left.",
            "Examine the shining ??? at " .. ACTOR.ESCHAN_PORTAL_15.text .. " for a cutscene. If you lose track, a new droplet from the start lets you pay silt to use portals you've already unlocked.",
        },
    },

    ['2-36'] = {
        name = "Pretender to the Throne",
        steps = {
            "Reach " .. ACTOR.ESCHAN_PORTAL_15.text .. ".",
            "Examine " .. ACTOR.ESCHA_QQ_15.text .. " again to fight Balamor. He spams Last Laugh, a cone Drain, so mages should stand far back.",
            "Defeat Balamor. If you lose or disconnect, zone out and back in for another Most curious curio.",
            "Examine " .. ACTOR.ESCHA_QQ_15.text .. " again.",
            "Receive Cipher: Balamor's Alter Ego.",
        },
    },

    ['2-37'] = {
        name = "Banished",
        steps = {
            "Travel to Norg.",
            "Examine " .. ACTOR.NORG_OAKEN_DOOR.text .. ".",
        },
    },

    ['2-38'] = {
        name = "Call of the Void",
        steps = {
            "Go to any Crag (Holla, Dem or Mea) and examine the Dimensional Portal for a cutscene.",
            "You must receive Cipher: Selh'teus to continue. If you didn't, get it from the Mystic Retriever in Empyreal Paradox.",
        },
    },

    ['2-39'] = {
        name = "Both Paths Taken",
        steps = {
            "Travel to Empyreal Paradox.",
            "Walk to " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. ".",
            "Enter the battle and defeat the Disjoined One within 15 minutes. It is easy with five Trusts; Iroha reraises herself 15 seconds after falling, as often as needed.",
        },
    },

    ['2-40'] = {
        name = "The Man Behind the Mask",
        steps = {
            "Return to Norg.",
            "Examine " .. ACTOR.NORG_OAKEN_DOOR.text .. ".",
            "Receive Rhapsody in Mauve.",
        },
    },

    ['2-41'] = {
        name = "Uncertain Futures",
        steps = {
            "Zone into any area of San d'Oria, Bastok or Windurst that has a Mog House entrance for a cutscene and the Song of hope.",
        },
    },

    -- ========================================================
    -- CHAPTER 3
    -- Reckoning
    -- ========================================================

    ['3-1'] = {
        name = "Darkness Beckons",
        steps = {
            "Examine the Dimensional Portal at the Crag of Holla, Dem or Mea and choose Reisenjima. You get a cutscene on arrival.",
            "Speak with Shiftrix, the goblin by the entrance, to activate Oseem augments. Buy a Map of Reisenjima (50 silt) and a Mollifier (500 silt) for the next mission. Most monsters here aggro, some with True Sight or True Sound.",
            "Follow the path to the far end and examine " .. ACTOR.CEIZAK_ETCHED_ROCK.text .. " for a cutscene. From now on you can pick up the Ethereal Ingress teleports; #3 and #4 in the northwest are the only real detours.",
        },
    },

    ['3-2'] = {
        name = "The Brewing Storm",
        steps = {
            "Defeat 3 Perfervid Narakas that spawn near Ethereal Ingress #6 between 20:00 and 04:00 (Vana'diel time).",
            "Rhapsody in Mauve drops them to level 107 once you have enmity, as long as you stay in the party and the zone. Carry a Mollifier, or an Ascended Naraka may spawn.",
        },
    },

    ['3-3'] = {
        name = "The River Runs Red",
        steps = {
            "Examine " .. ACTOR.CEIZAK_ETCHED_ROCK.text .. " in Reisenjima for a cutscene.",
            "You receive Rhapsody in Fuchsia. If you get the Geomagnetron here, it is already attuned: just speak with Darcia in Lower Jeuno for the Adoulinian charter permit.",
        },
    },

    ['3-4'] = {
        name = "The Crucible",
        steps = {
            "Complete Seekers of Adoulin through Meeting of the Minds.",
            "Complete The Geomagnetron.",
            "Speak with Darcia in Lower Jeuno.",
            "Optional: zone into any starting city area with a Mog House entrance for a cutscene sending you to Ceizak Battlegrounds.",
            "Enter Ceizak Battlegrounds (Lower Jeuno or Adoulin waypoint, a connected zone, or its Home Point).",
        },
    },

    ['3-5'] = {
        name = "Forward Thinking",
        steps = {
            "Zone into Ceizak Battlegrounds for a cutscene. Your Reisenjima Sanctorium orb becomes a Drained orb.",
        },
    },

    ['3-6'] = {
        name = "Tears of the Generals",
        steps = {
            "Complete Seekers of Adoulin through An Aimless Journey.",
            "Speak with " .. ACTOR.POHL_TRISHBAHK.text .. " at the gates of Castle Adoulin.",
        },
    },

    ['3-7'] = {
        name = "What He Left Behind",
        steps = {
            "Go to the Augural Conveyor room in Rala Waterways (B-6) and examine the Conveyor to unlock it if you haven't. From the Western Adoulin (F-5) entrance, head east along the path and enter (B-6) from (C-7).",
            "Examine " .. ACTOR.RALA_AUGURAL_CONVEYOR_QQ.text .. " near the room's entrance for a cutscene.",
            "You receive Cipher: Arciela II and can view all Seekers of Adoulin cutscenes.",
        },
    },

    ['3-8'] = {
        name = "Gone but Not Forgotten",
        steps = {
            "You must be in Seekers of Adoulin's Behind the Sluices, at least past entering the sluice. Enter Rala Waterways from Western Adoulin (F-5) (Adoulin Waterfront waypoint).",
            "Examine the " .. ACTOR.SLUICE_GATE.text .. " and go to the hideout behind it.",
            "Examine " .. ACTOR.INCONSPICUOUS_BARREL.text .. " to obtain the Founder king's orb.",
        },
    },

    ['3-9'] = {
        name = "August Artifacts",
        steps = {
            "Return to the ??? near the Augural Conveyor at (C-6)/(B-6).",
            "Examine " .. ACTOR.RALA_AUGURAL_CONVEYOR_QQ.text .. ".",
        },
    },

    ['3-10'] = {
        name = "Solemnity",
        steps = {
            "Travel to Eastern Adoulin.",
            "Enter the Celennia Memorial Library.",
        },
    },

    ['3-11'] = {
        name = "Eyes on You",
        steps = {
            "Zone into the Hall of the Gods for a cutscene. Fastest: the Ro'Maeve Survival Guide, or the Voidwatch warp to Hall of the Gods. Zoning back in from Ru'Aun Gardens also works. Unity Warp (level 125) puts you at Ro'Maeve's southern entrance.",
        },
    },

    ['3-12'] = {
        name = "Exploring the Ruins",
        steps = {
            "Examine " .. ACTOR.HALL_OF_GODS_LOCATION.text .. " right in front of you for a cutscene.",
            "Afterwards, if you finished Zilart through Awakening, Promathia through Dawn, have the Bundle of half-inscribed scrolls and Cipher: Rainemard, speak with Jamal in Ru'Lude Gardens (H-5) for the Ark Angel Trust objectives.",
        },
    },

    ['3-13'] = {
        name = "Become Something More",
        steps = {
            "Return to the Reisenjima Sanctorium (Dimensional Portal at any Crag) for a cutscene and the Dimensional Compass.",
        },
    },

    ['3-14'] = {
        name = "Unshakable Nightmares",
        steps = {
            "Enter the Walk of Echoes for a cutscene. Easiest: use your Lightsworm on the glowing blue ??? next to the Cavernous Maw in Batallia Downs, Rolanberry Fields or Sauromugue Champaign (present or past). Also: the Veridical Conflux in Grauberg [S] (F-5) after WotG Mission 46, or in Pashhow Marshlands [S] (J-9) after the Voidwatch quest Glimmer of Hope.",
            "If you end up in the wrong section from Batallia Downs, leave and come back, or use another entrance. Don't use the Xarcabard [S] entrance.",
            "If you're told an event in Champion of the Dawn blocks you, enter from Xarcabard [S] to get that quest's cutscene first. Collecting its three Breath of dawn may be enough; otherwise finish it and A Forbidden Reunion.",
        },
    },

    ['3-15'] = {
        name = "What Remains of Hope",
        steps = {
            "In the Walk of Echoes, go east (toward Atomos in the sky) and examine the " .. ACTOR.WALK_OF_ECHOES_GLOWING_QQ.text .. " for a cutscene and Cait Sith's whisker.",
            "You are sent to Desuetia - Empyreal Paradox and the mission completes when you arrive.",
        },
    },

    ['3-16'] = {
        name = "Death Cares Not",
        steps = {
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. ".",
        },
    },

    ['3-17'] = {
        name = "No Time like the Future",
        steps = {
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. " once more to enter the battle against Sempurne.",
            "Sempurne is a weaker Shinryu (same moves, but it doesn't absorb damage while readying moves). Easy solo with Trusts at item level. If you lose, get another Cait Sith's whisker from Cait Sith outside.",
        },
    },

    ['3-18'] = {
        name = "Sin",
        steps = {
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. " again after the battle for a long cutscene.",
        },
    },

    ['3-19'] = {
        name = "Penance",
        steps = {
            "This mission completes during the long cutscene from Sin; you receive Rhapsody in Puce when it ends.",
        },
    },

    ['3-20'] = {
        name = "Vessel of Light",
        steps = {
            "Return to the Reisenjima Sanctorium (Dimensional Portal at any Crag; or, after Chains of Promathia, the Garden of Ru'Hmet Home Point, the elevator down, and the Dimensional Portal in Empyreal Paradox) for a cutscene.",
        },
    },

    ['3-21'] = {
        name = "The Lifestream of Reisenjima",
        steps = {
            "In Reisenjima, examine " .. ACTOR.REISENJIMA_QQ_H5.text .. " on the hill for a cutscene. If you get a Tribulens message, you are at the wrong ??? further down the hill.",
            "Warp to Ethereal Ingress #5 and run west along the path. Watch for True Sight Hippogryphs.",
        },
    },

    ['3-22'] = {
        name = "From West to East",
        steps = {
            "Defeat 11 Obstreperous Panopts in Reisenjima; many spawn around (F-11), just north of Ethereal Ingress #1. The area is full of other aggressive monsters.",
            "Rhapsody in Fuchsia drops claimed Panopts to level 112. Carry a Mollifier, or an Ascended Panopt may spawn.",
            "Zoning resets your count; each kill tells you how many remain.",
        },
    },

    ['3-23'] = {
        name = "Good Things Come in Threes",
        steps = {
            "Examine " .. ACTOR.CEIZAK_ETCHED_ROCK.text .. " in Reisenjima (by Ethereal Ingress #6 and the Sanctorium entrance) for a cutscene.",
        },
    },

    ['3-24'] = {
        name = "Tackling the Problem",
        steps = {
            "Examine the " .. ACTOR.REISENJIMA_CRYSTAL.text .. " in the Reisenjima Sanctorium for a cutscene.",
        },
    },

    ['3-25'] = {
        name = "Way to Divinity",
        steps = {
            "Keep watching the cutscene from the previous mission; it takes you to Empyreal Paradox and the next mission starts when it ends.",
        },
    },

    ['3-26'] = {
        name = "The Winds of Time",
        steps = {
            "Examine " .. ACTOR.TRANSCENDENTAL_RADIANCE.text .. " in Empyreal Paradox and enter \"The Winds of Time\".",
            "Defeat Metus. It uses Promathia's moves (Bastion of Twilight, Wheel of Impregnability, Infernal Deliverance, Empty Salvation), Osmotic Wave and Censure, and casts Meteor. Trusts are allowed.",
        },
    },

    ['3-27'] = {
        name = "Calm After the Storm",
        steps = {
            "Watch the cutscene that starts after the fight.",
            "If Tenzen is busy in a Promathia mission (for example you are on Dawn without its final cutscenes), you can't continue until he is free; then examine the Resume Point in Empyreal Paradox.",
        },
    },

    ['3-28'] = {
        name = "Nary a Cloud in Sight",
        steps = {
            "Continue through the remaining events with Iroha.",
            "Receive Cipher: Iroha and Rhapsody in Ochre.",
        },
    },

    ['3-29'] = {
        name = "An Unending Song",
        steps = {
            "Enter an area adjoining a Mog House in San d'Oria, Bastok, or Windurst.",
            "If your inventory was full earlier, get Cipher: Iroha from the Mystic Retriever in Reisenjima first, or the cutscene won't play.",
        },
    },

    ['3-30'] = {
        name = "A Deep Sleep",
        steps = {
            "Go to the Reisenjima Sanctorium (Dimensional Portal at any Crag; or, after Chains of Promathia, the Garden of Ru'Hmet Home Point, the elevator down, and the Dimensional Portal in Empyreal Paradox) for a cutscene.",
        },
    },

    ['3-31'] = {
        name = "Guardians",
        steps = {
            "Travel to the Stone Circle at (G-6) in La Theine Plateau.",
            "Examine " .. ACTOR.LA_THEINE_QQ_G6.text .. ".",
            "Receive Breath of the avatars.",
            "Unity Warp (level 99) to La Theine Plateau puts you nearby.",
        },
    },

    ['3-32'] = {
        name = "Iroha in Distress",
        steps = {
            "Return to the Reisenjima Sanctorium (Dimensional Portal at any Crag; or, after Chains of Promathia, the Garden of Ru'Hmet Home Point, the elevator down, and the Dimensional Portal in Empyreal Paradox) for a cutscene. You can now view all Rise of the Zilart cutscenes.",
        },
    },

    ['3-33'] = {
        name = "Absolute Trust",
        steps = {
            "Examine " .. ACTOR.REISENJIMA_CRYSTAL.text .. ".",
        },
    },

    ['3-34'] = {
        name = "The Orb's Radiance",
        steps = {
            "Examine " .. ACTOR.REISENJIMA_CRYSTAL.text .. " again to enter the battlefield.",
            "Iroha fights with you: she casts area Protect V and Shell V, then Flare, Flare II and Embrava, and raises herself whenever she falls. She also casts Arise on some players nearby (you come back weakened). Helpers who finished the mission don't need the key item.",
            "Defeat the Cloud of Darkness.",
            "If you fail, return to the Stone Circle in La Theine Plateau at (G-6) and obtain another Breath of the avatars.",
            "Receive Phoenix's blessing, Scintillating Rhapsody, and Cipher: Iroha II.",
        },
    },

    ['3-35'] = {
        name = "A Rhapsody for the Ages",
        steps = {
            "Complete the final events of the Rhapsodies of Vana'diel story.",
        },
    },
}

-- Two missions share the name "Eddies of Despair" (IDs 130 and 232),
-- and so do two walkthrough entries. Matching by name picked whichever
-- came first when the tables were iterated, so the steps changed from
-- one launch to the next. Link each ID to its own walkthrough here.

M.MISSIONS[130] = {
    name = 'Eddies of Despair',
    steps = M.STEPS['1-10'].steps,
}

M.MISSIONS[232] = {
    name = 'Eddies of Despair',
    steps = M.STEPS['2-35'].steps,
}

-- ============================================================
-- NUMBER, TYPE AND REWARD OF EACH MISSION (by mission id)
-- Chapter-mission code, type and reward, from the walkthrough table.
-- ============================================================

local INFO = {
    [0] = { "1-1", "Cutscene", "Access to Escha - Zi'Tah; Access to Escha - Ru'Aun" },
    [110] = { "1-2", "Cutscene", "" },
    [111] = { "1-3", "Cutscene", "" },
    [112] = { "1-4", "Quest", "Copper Voucher; or Key Item: Gilgamesh's introductory letter (Support Job unlock)" },
    [114] = { "1-5", "Cutscene", "Key Item: Reisenjima Sanctorium orb" },
    [118] = { "1-6", "Cutscene", "Key Item: \"Rhapsody in White\"" },
    [120] = { "1-7", "Cutscene", "Unlocks access to Cipher of Semih's Alter Ego and Cipher of Halver's Alter Ego" },
    [126] = { "1-8", "Cutscene", "" },
    [128] = { "1-9", "Fight - Popped NM", "" },
    [130] = { "1-10", "Cutscene", "" },
    [134] = { "1-11", "Cutscene", "Key Item: \"Rhapsody in Umber\"; Cipher of Lion's alter ego II" },
    [136] = { "1-12", "Cutscene", "" },
    [138] = { "1-13", "Cutscene", "" },
    [140] = { "1-14", "Cutscene", "" },
    [142] = { "1-15", "Cutscene", "" },
    [144] = { "1-16", "Fight - Popped NM", "Key Item: \"Rhapsody in Azure\"" },
    [148] = { "1-17", "Cutscene", "Cipher of Zeid's Alter Ego II" },
    [150] = { "1-18", "Cutscene", "" },
    [152] = { "2-1", "Cutscene", "" },
    [154] = { "2-2", "Cutscene", "Cipher of Tenzen's Alter Ego II" },
    [156] = { "2-3", "Cutscene", "Cipher of Prishe's Alter Ego II; ability to view all Chains of Promathia mission cutscenes" },
    [158] = { "2-4", "Cutscene", "" },
    [160] = { "2-5", "Cutscene", "" },
    [162] = { "2-6", "Quest", "" },
    [164] = { "2-7", "Cutscene", "" },
    [168] = { "2-8", "Quest", "" },
    [170] = { "2-9", "Quest", "Cipher of Nashmeira's Alter Ego II; ability to view all Treasures of Aht Urhgan mission cutscenes" },
    [172] = { "2-10", "Cutscene", "" },
    [174] = { "2-11", "Cutscene", "" },
    [176] = { "2-12", "Cutscene", "" },
    [178] = { "2-13", "Cutscene", "Key Item: \"Rhapsody in Crimson\"" },
    [180] = { "2-14", "Cutscene", "" },
    [186] = { "2-15", "Cutscene", "" },
    [188] = { "2-16", "Cutscene", "Cipher of Lilisette's Alter Ego II; ability to view all Wings of the Goddess mission cutscenes" },
    [191] = { "2-17", "Cutscene", "" },
    [194] = { "2-18", "Fight - Popped NM", "" },
    [200] = { "2-19", "Cutscene", "" },
    [202] = { "2-20", "Cutscene", "" },
    [204] = { "2-21", "Cutscene", "" },
    [206] = { "2-22", "Quest", "" },
    [208] = { "2-23", "Cutscene", "" },
    [209] = { "2-24", "Cutscene", "" },
    [211] = { "2-25", "Cutscene", "" },
    [212] = { "2-26", "Cutscene", "" },
    [214] = { "2-27", "Cutscene", "" },
    [216] = { "2-28", "Cutscene", "" },
    [218] = { "2-29", "Cutscene", "" },
    [222] = { "2-30", "Cutscene", "Key Item: \"Rhapsody in Emerald\"" },
    [224] = { "2-31", "Cutscene", "" },
    [226] = { "2-32", "Cutscene", "" },
    [228] = { "2-33", "Cutscene", "" },
    [230] = { "2-34", "Cutscene", "" },
    [232] = { "2-35", "Quest", "" },
    [234] = { "2-36", "Fight - Popped NM", "Cipher of Balamor's Alter Ego" },
    [238] = { "2-37", "Cutscene", "" },
    [240] = { "2-38", "Cutscene", "Cipher of Selh'teus's Alter Ego" },
    [244] = { "2-39", "BCNM", "" },
    [250] = { "2-40", "Cutscene", "Key Item: \"Rhapsody in Mauve\"" },
    [252] = { "2-41", "Cutscene", "" },
    [254] = { "3-1", "Cutscene", "Access to Reisenjima" },
    [258] = { "3-2", "Quest", "" },
    [260] = { "3-3", "Cutscene", "Key Item: \"Rhapsody in Fuchsia\"" },
    [262] = { "3-4", "Cutscene", "" },
    [263] = { "3-5", "Cutscene", "" },
    [264] = { "3-6", "Cutscene", "" },
    [266] = { "3-7", "Cutscene", "Cipher: Arciela II; ability to view all Seekers of Adoulin mission cutscenes" },
    [268] = { "3-8", "Cutscene", "" },
    [269] = { "3-9", "Cutscene", "" },
    [270] = { "3-10", "Cutscene", "" },
    [272] = { "3-11", "Cutscene", "" },
    [274] = { "3-12", "Cutscene", "" },
    [278] = { "3-13", "Cutscene", "Key Item: Dimensional compass" },
    [280] = { "3-14", "Cutscene", "" },
    [282] = { "3-15", "Cutscene", "" },
    [286] = { "3-16", "Cutscene", "" },
    [288] = { "3-17", "BCNM", "" },
    [292] = { "3-18", "Cutscene", "" },
    [296] = { "3-19", "Cutscene", "Key Item: \"Rhapsody in Puce\"" },
    [298] = { "3-20", "Cutscene", "" },
    [300] = { "3-21", "Cutscene", "" },
    [302] = { "3-22", "Quest", "" },
    [304] = { "3-23", "Cutscene", "" },
    [306] = { "3-24", "Cutscene", "" },
    [308] = { "3-25", "Cutscene", "" },
    [310] = { "3-26", "BCNM", "" },
    [314] = { "3-27", "Cutscene", "" },
    [318] = { "3-28", "Cutscene", "Key Item: \"Rhapsody in Ochre\"; Cipher: Iroha" },
    [320] = { "3-29", "Cutscene", "" },
    [324] = { "3-30", "Cutscene", "" },
    [326] = { "3-31", "Cutscene", "" },
    [328] = { "3-32", "Cutscene", "Ability to view all Rise of the Zilart mission cutscenes" },
    [330] = { "3-33", "Cutscene", "" },
    [332] = { "3-34", "BCNM", "Key Item: \"Scintillating Rhapsody\"; Key Item: Phoenix's blessing; Cipher: Iroha II" },
    [334] = { "3-35", "Cutscene - Finale", "" },
}

for id, info in pairs(INFO) do
    local entry = M.MISSIONS[id]

    if type(entry) ~= 'table' then
        entry = { name = entry }
        M.MISSIONS[id] = entry
    end

    entry.number = info[1]
    entry.mission_type = info[2]

    if info[3] ~= '' then
        entry.reward = info[3]
    end
end

return M