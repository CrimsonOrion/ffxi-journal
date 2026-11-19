--[[
    A Crystalline Prophecy - Mission Database
    ===========================================

    Mission IDs and walkthrough IDs are kept separate.

    M.MISSIONS:
        Official numeric mission IDs used by the mission tracker.

    M.STEPS:
        Existing walkthrough IDs used by the Journal walkthrough
        system.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'A Crystalline Prophecy',
    [1] = 'The Echo Awakens',
    [2] = 'Gatherer of Light (I)',
    [3] = 'Gatherer of Light (II)',
    [4] = 'Those Who Lurk in Shadows (I)',
    [5] = 'Those Who Lurk in Shadows (II)',
    [6] = 'Those Who Lurk in Shadows (III)',
    [7] = 'Remember Me in Your Dreams',
    [8] = 'Born of Her Nightmares',
    [9] = 'Banishing the Echo',
    [10] = 'Ode of Life Bestowing',
    [11] = 'A Crystalline Prophecy (Fin.)',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- MISSION 1
    -- ========================================================

    ['1'] = {
        name = "A Crystalline Prophecy",
        steps = {
            "Reach level 10.",
            "Zone into Lower Jeuno for the opening cutscene.",
            "If you postponed the story, examine " .. ACTOR.LOWER_JEUNO_TALES_BEGINNING.text .. " in Lower Jeuno to start it.",
        },
    },

    -- ========================================================
    -- MISSION 2
    -- ========================================================

    ['2'] = {
        name = "The Echo Awakens",
        steps = {
            "Get Seedspall Lux from Orcs in Jugner Forest around (G-11) (Davoi Survival Guide is closest).",
            "Get Seedspall Luna from Quadav in Pashhow Marshlands around (K-10) (Beadeaux Survival Guide).",
            "Get Seedspall Astrum from Yagudo in Meriphataud Mountains around (K-8) (Castle Oztroja Survival Guide).",
            "Trade all three to the " .. ACTOR.QUFIM_ACP_QQ.text .. " on Qufim Island, mid-east of (G-6) near two rock columns, for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 3
    -- ========================================================

    ['3'] = {
        name = "Gatherer of Light (I)",
        steps = {
            "Goblins in each zone below drop a food key item (about 5-10%; expect dozens of kills). In a party, one random member on or past this mission gets it, anywhere in the zone. You must hold the food when the NM dies to get its Seedspall.",
            "Batallia Downs: kill Goblins on the west side for the Bowl of bland Goblin salad.",
            "Examine the " .. ACTOR.BATALLIA_ACP_QQ.text .. " in the middle of (F-5), on the upper level connected to Beaucedine Glacier, to spawn Vegnix Greenthumb, and defeat it for Seedspall Roseum. Reach it via a Lycopodium warp at (F-5), or the Beaucedine Glacier Survival Guide then the (H-11) connection.",
            "Rolanberry Fields: kill Goblins for the Jug of greasy Goblin juice.",
            "Examine the " .. ACTOR.ROLANBERRY_ACP_QQ.text .. " in the northeast corner of (D-11), on the upper level by Crawlers' Nest (Unity Warp level 125 lands there), to spawn Chuglix Berrypaws, and defeat it for Seedspall Caerulum.",
            "Sauromugue Champaign: kill Goblins (some are near the Survival Guide) for the Chunk of smoked Goblin grub.",
            "Examine the " .. ACTOR.SAUROMUGUE_ACP_QQ.text .. " at the (I/J-9/10) intersection, near the Survival Guide, to spawn Dribblix Greasemaw, and defeat it for Seedspall Viridis.",
            "Examine the " .. ACTOR.QUFIM_ACP_QQ.text .. " on Qufim Island (G-6) with all three Seedspalls for a cutscene.",
            "Keep the goblin foods (they aren't used up). For the optional daily Viridian Key, give them to " .. ACTOR.SQUINTROX_DRYEYES.text .. " in Port Jeuno, but wait until after Gatherer of Light (II): he takes the foods.",
        },
    },

    -- ========================================================
    -- MISSION 4
    -- ========================================================

    ['4'] = {
        name = "Gatherer of Light (II)",
        steps = {
            "No Trusts in this fight, but your buffs and pets carry in.",
            "Examine the " .. ACTOR.QUFIM_ACP_QQ.text .. " on Qufim Island (G-6) to start the battle.",
            "Defeat six waves of five Seed Mandragoras (30 total). They're very weak; one hit or an AoE kills them.",
            "You get the Amber Key when the battle ends. Redeem it at the red coffer in Tenshodo HQ, Lower Jeuno (J-8).",
            "Examine the " .. ACTOR.QUFIM_ACP_QQ.text .. " again for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 5
    -- ========================================================

    ['5'] = {
        name = "Those Who Lurk in Shadows (I)",
        steps = {
            "Zone into Fei'Yin for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 6
    -- ========================================================

    ['6'] = {
        name = "Those Who Lurk in Shadows (II)",
        steps = {
            "Collect the nine Seed Afterglows in Fei'Yin within 30 minutes (Earth time); if you run out, zone out and back to restart. They drift within their areas. Suggested route from Home Point #1 (K-8): yellow (big room), green, orange, red, yellow (small room), A, white, cerulean, golden, silver, B, blue.",
            ACTOR.FEIYIN_AFTERGLOW_RED.text,
            ACTOR.FEIYIN_AFTERGLOW_ORANGE.text,
            ACTOR.FEIYIN_AFTERGLOW_YELLOW.text,
            ACTOR.FEIYIN_AFTERGLOW_GREEN.text,
            ACTOR.FEIYIN_AFTERGLOW_CERULEAN.text,
            ACTOR.FEIYIN_AFTERGLOW_BLUE.text,
            ACTOR.FEIYIN_AFTERGLOW_GOLDEN.text,
            ACTOR.FEIYIN_AFTERGLOW_SILVER.text,
            ACTOR.FEIYIN_AFTERGLOW_WHITE.text,
            "If the yellow Seed Afterglow is not at its usual location, check the circular room around (H-9)/(I-9).",
            "After all nine, choose the Mark of Seed to continue (or an Azure Key, level 60 coffer reward). You can collect them once per Earth day.",
        },
    },

    -- ========================================================
    -- MISSION 7
    -- ========================================================

    ['7'] = {
        name = "Those Who Lurk in Shadows (III)",
        steps = {
            "Examine the " .. ACTOR.QUBIA_BURNING_CIRCLE.text .. " at Qu'Bia Arena for a cutscene, then again to enter the battlefield. Trusts are allowed.",
            "Defeat Seed Yagudo (WHM; Phantasmal Dance: AoE damage, knockback, bind), Seed Quadav (RDM; Feather Maelstrom: Amnesia and Bio), Seed Orc (WAR; Thunderous Yowl: AoE Curse and Plague) and Seed Goblin (THF; teleports behind people, stacks Sneak/Trick Attack, Saucepan replaces your food with -10 all stats for about 30 minutes).",
            "You get the Ivory Key after the cutscene. Redeem it at the red coffer in Tenshodo HQ, Lower Jeuno (J-8).",
        },
    },

    -- ========================================================
    -- MISSION 8
    -- ========================================================

    ['8'] = {
        name = "Remember Me in Your Dreams",
        steps = {
            "Enter the Hall of the Gods from Ro'Maeve through the " .. ACTOR.HALL_OF_GODS_ENTRANCE.text .. " for a cutscene. The Ro'Maeve Survival Guide puts you right outside at (H-6).",
            "If you entered the Hall of the Gods from Ru'Aun Gardens, return to Ro'Maeve and enter the Hall of the Gods again.",
        },
    },

    -- ========================================================
    -- MISSION 9
    -- ========================================================

    ['9'] = {
        name = "Born of Her Nightmares",
        steps = {
            "Zone into Lower Delkfutt's Tower for a cutscene.",
        },
    },

    -- ========================================================
    -- MISSION 10
    -- ========================================================

    ['10'] = {
        name = "Banishing the Echo",
        steps = {
            "Examine the Seed Fragment in each tower section to get a level 30 cap; only then can you collect that section's Seed Afterglows (stone key items). No Trusts, people outside the cap can't heal you, and you lose no experience if you die. Sprinter's Shoes (reapply after each cap) or a Destrier Beret help; bring Prism Powder and Silent Oil for the Dolls and Elementals.",
            "Lower Delkfutt's Tower: examine the " .. ACTOR.LOWER_DELFKUTT_SEED_FRAGMENT.text .. " on the first floor.",
            "First floor " .. ACTOR.LOWER_DELFKUTT_AFTERGLOW_1.text .. ": Amicitia Stone.",
            "Stairs B, second floor " .. ACTOR.LOWER_DELFKUTT_AFTERGLOW_2.text .. ": Veritas Stone.",
            "Stairs D, third floor " .. ACTOR.LOWER_DELFKUTT_AFTERGLOW_3.text .. ": Sapientia Stone. Take the (G-6) teleport to Middle Delkfutt's Tower.",
            "Examine the " .. ACTOR.MIDDLE_DELFKUTT_SEED_FRAGMENT.text .. " on the fourth floor.",
            "Fourth floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_1.text .. ": Sanctitas Stone.",
            "Stairs E, fifth floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_2.text .. ": Felicitas Stone.",
            "Corridor F, sixth floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_3.text .. ": Divitia Stone.",
            "Teleport G, seventh floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_4.text .. ": Studium Stone.",
            "Stairs K, eighth floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_5.text .. ": Amoris Stone.",
            "Stairs L, N, then M, ninth floor " .. ACTOR.MIDDLE_DELFKUTT_AFTERGLOW_6.text .. ": Caritas Stone. Take the (F-6) teleport to Upper Delkfutt's Tower.",
            "Examine the " .. ACTOR.UPPER_DELFKUTT_SEED_FRAGMENT.text .. " on the tenth floor.",
            "Tenth floor " .. ACTOR.UPPER_DELFKUTT_AFTERGLOW_1.text .. ": Constantia Stone.",
            "Stairs, eleventh floor " .. ACTOR.UPPER_DELFKUTT_AFTERGLOW_2.text .. ": Spei Stone.",
            "Stairs B, twelfth floor " .. ACTOR.UPPER_DELFKUTT_AFTERGLOW_3.text .. ": Salus Stone. Take the (F-10) teleport to the Stellar Fulcrum.",
            "Collect all 12 stone key items, then examine " .. ACTOR.STELLAR_FULCRUM_SEED_FRAGMENT.text .. " to receive the Omnis Stone.",
        },
    },

    -- ========================================================
    -- MISSION 11
    -- ========================================================

    ['11'] = {
        name = "Ode of Life Bestowing",
        steps = {
            "Examine " .. ACTOR.STELLAR_FULCRUM_QEIOV_GATE.text .. ", then examine it again to enter the battlefield.",
            "Defeat the Seed Crystal (about 25,000 HP, strong physical and magic defense). It attacks with ranged AoE magic, casts the -ga III spells, and Draws In whoever has hate. Seed of Nihility resets everyone's ability timers (including SP abilities), Seed of Deference charms, Seed of Deception makes a Seed Thrall copy of a player, and Seed of Judgment is a heavy knockback AoE.",
            "Receive the Ebon Key and Prismatic Key.",
        },
    },

    -- ========================================================
    -- MISSION 12
    -- ========================================================

    ['12'] = {
        name = "A Crystalline Prophecy (Fin.)",
        steps = {
            "Examine the " .. ACTOR.TENSHODO_TREASURE_CHEST.text .. " in Tenshodo HQ, Lower Jeuno, and choose Nuevo Coselete, Mirke Wardecors or Royal Redingote.",
            "Only one of the three body armors may be owned at a time.",
            "You can obtain the Atma of Echoes after clearing the scenario.",
            "To re-roll the augment, toss the armor, buy an Omnis Stone from " .. ACTOR.SQUINTROX_DRYEYES.text .. " in Port Jeuno (2,000 gil and 20 Beastmen's Seals) and win the Stellar Fulcrum fight again.",
        },
    },
}

return M