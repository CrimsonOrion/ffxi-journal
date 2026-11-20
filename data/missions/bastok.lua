--[[
    Bastok - Mission Database
    ==========================

    M.MISSIONS:
        Official numeric mission IDs extracted from DAT 0xD9A4.

    M.STEPS:
        Walkthrough entries using the existing Bastok mission
        identifiers.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'The Zeruhn Report',
    [1] = 'A Geological Survey',
    [2] = 'Fetichism',
    [3] = 'The Crystal Line',
    [4] = 'Wading Beasts',
    [5] = 'The Emissary',

    -- The Emissary is split into legs by the game. The step text is the
    -- matching half of walkthrough 2-3, embedded here because the names
    -- repeat and cannot be matched by name.
    --
    -- 6 = San d'Oria visited first, 7 = Windurst visited first,
    -- 8 = San d'Oria visited second, 9 = Windurst visited second.

    [6] = {
        name = "The Emissary (San d'Oria)",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Northern San d'Oria and speak with Baraka at the Bastokan Consulate.",
            "Speak with Helaku at (K-10) inside the Bastokan Consulate.",
            "Travel to Chateau d'Oraguille and speak with Halver (I-9).",
            "Travel to Ghelsba Outpost and defeat Warchief Vatgit at (H-7).",
            "Return to Northern San d'Oria and speak with Helaku again.",
            "Travel to Port Windurst to continue with the second leg.",
        },
    },

    [7] = {
        name = "The Emissary (Windurst)",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Port Windurst and speak with Melek at (F-6) inside the Bastokan Consulate.",
            "Enter Heavens Tower and speak with Kupipi through the Clerical Chamber door.",
            "Travel to Giddeus and defeat Eyy Mon the Ironbreaker at (G-7).",
            "Trade the Aspir Knife to Uu Zhoumo.",
            "Return to Port Windurst and speak with Melek again.",
            "Travel to Northern San d'Oria to continue with the second leg.",
        },
    },

    [8] = {
        name = "The Emissary (San d'Oria)",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Northern San d'Oria and speak with Helaku at (K-10).",
            "Travel to Chateau d'Oraguille and speak with Halver (I-9).",
            "Travel to the battlefield entrance and enter the battlefield.",
            "Defeat the Dread Dragon.",
            "Return to Northern San d'Oria and speak with Helaku.",
            "Return to Bastok and speak with Naji (J-8) to complete the mission.",
        },
    },

    [9] = {
        name = "The Emissary (Windurst)",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Port Windurst and speak with Melek at (F-6) inside the Bastokan Consulate.",
            "Enter Heavens Tower and speak with Kupipi through the Clerical Chamber door.",
            "Travel to Giddeus and complete the battle at Balga's Dais.",
            "Return to Port Windurst and speak with Melek again.",
            "Return to Bastok and speak with Naji (J-8) to complete the mission.",
        },
    },
    [10] = 'The Four Musketeers',
    [11] = 'To the Forsaken Mines',
    [12] = 'Jeuno',
    [13] = 'Magicite',
    [14] = 'Darkness Rising',
    [15] = 'Xarcabard, Land of Truths',
    [16] = 'Return of the Talekeeper',
    [17] = 'The Pirates\' Cove',
    [18] = 'The Final Image',
    [19] = 'On My Way',
    [20] = 'The Chains That Bind Us',
    [21] = 'Enter the Talekeeper',
    [22] = 'The Salt of the Earth',
    [23] = 'Where Two Paths Converge',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    ['1-1'] = {
        name = "The Zeruhn Report",
        rank = 1,
        number = '1-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Enter Zeruhn Mines from Bastok Mines at (D-7).",
            "Speak with " .. ACTOR.MAKARIM.text .. " to receive the Zeruhn Report.",
            "Return to Bastok Metalworks and speak with " .. ACTOR.NAJI.text .. ".",
        },
    },

    ['1-2'] = {
        name = "A Geological Survey",
        rank = 1,
        number = '1-2',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Travel to Cid's Lab at (G-8) in Metalworks and speak with " .. ACTOR.CID.text .. ".",
            "Receive the Blue acidity tester.",
            "Enter Dangruf Wadi from South Gustaberg at (D-9).",
            "Follow the path north to (I-8), then stand on the geyser in the southeastern corner until it carries you onto the ledge.",
            "Check the acidity tester to confirm that it has changed to the Red acidity tester.",
            "Return to " .. ACTOR.CID.text .. ".",
        },
    },

    ['1-3'] = {
        name = "Fetichism",
        rank = 1,
        number = '1-3',
        mission_type = 'Repeatable',
        reward = "Rank 2, 1,000 gil",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Obtain the four Fetich pieces: Fetich Head, Fetich Torso, Fetich Arms and Fetich Legs. They are not Rare/Ex, so you can buy them from the Auction House (Others > Beast-made) or a bazaar instead of farming them.",
            "To farm them, enter Palborough Mines from North Gustaberg (K-3); North Gustaberg is reached from Port Bastok (L-7). Amber, Greater, Onyx and Veteran Quadavs drop the pieces.",
            "For the higher-level Quadavs: go north to the big room at (G-7), cross to (H-7) and head south, right at the split then left, down to (H-9). Follow the bends through the round room to the elevator in the middle and pull its lever to ride up to the second floor. Watch out for the NM Zi'Ghi Boneeater, and do not take the boat at (H-8) on that floor: it leaves you in Zeruhn Mines behind a gate you cannot pass back through.",
            "Return to Bastok and trade all four Fetich pieces to " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
        },
    },

    ['2-1'] = {
        name = "The Crystal Line",
        rank = 2,
        number = '2-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Travel to Cid's Lab in Bastok Metalworks and speak with " .. ACTOR.CID.text .. ".",
            "Obtain a Faded Crystal and trade it to Cid for the key item C. L. report. Faded Crystals are not Rare/Ex (Auction House: Others > Misc. 1), or you can trade a synthesis crystal to a Crag's Telepoint for one: Crag of Dem (Konschtat Highlands I-6), Crag of Holla (La Theine Plateau K-8) or Crag of Mea (Tahrongi Canyon I-6).",
            "Speak with Ayame in the Cannonry of Bastok Metalworks (K-7) to finish the mission. You may need to talk to her a few times for the right dialogue.",
        },
    },

    ['2-2'] = {
        name = "Wading Beasts",
        rank = 2,
        number = '2-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Obtain a Lizard Egg.",
            "Travel to the President's Office in Bastok Metalworks and speak with " .. ACTOR.ALOIS.text .. ".",
            "Trade the Lizard Egg to " .. ACTOR.ALOIS.text .. ".",
        },
    },

    ['2-3'] = {
        name = "The Emissary",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.NAJI.text .. " to begin the embassy mission.",
            "Choose whether to visit San d'Oria or Windurst first.",

            "San d'Oria first: travel to Northern San d'Oria and speak with Baraka at the Bastokan Consulate.",
            "Speak with Helaku at (K-10) inside the Bastokan Consulate.",
            "Travel to Chateau d'Oraguille and speak with " .. ACTOR.HALVER.text .. ".",
            "Travel to Ghelsba Outpost and defeat Warchief Vatgit at (H-7).",
            "Return to Northern San d'Oria and speak with Helaku again.",
            "Travel to Port Windurst and speak with Melek at (F-6) inside the Bastokan Consulate.",
            "Enter Heavens Tower and speak with " .. ACTOR.KUPIPI.text .. " through the Clerical Chamber door.",
            "Travel to Giddeus and complete the battle at Balga's Dais.",
            "Return to Port Windurst and speak with Melek again.",

            "Windurst first: travel to Port Windurst and speak with Melek at (F-6) inside the Bastokan Consulate.",
            "Enter Heavens Tower and speak with " .. ACTOR.KUPIPI.text .. " through the Clerical Chamber door.",
            "Travel to Giddeus and defeat Eyy Mon the Ironbreaker at (G-7).",
            "Trade the Aspir Knife to Uu Zhoumo.",
            "Return to Port Windurst and speak with Melek again.",
            "Travel to Northern San d'Oria and speak with Helaku at (K-10).",
            "Travel to Chateau d'Oraguille and speak with " .. ACTOR.HALVER.text .. ".",
            "Travel to " .. ACTOR.HORLAIS_PEAK.text .. " and enter the battlefield.",
            "Defeat the Dread Dragon.",
            "Return to Northern San d'Oria and speak with Helaku.",

            "Return to Bastok and speak with " .. ACTOR.NAJI.text .. " after completing both paths.",
        },
    },

    ['3-1'] = {
        name = "The Four Musketeers",
        rank = 3,
        number = '3-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.IRON_EATER.text .. ".",
            "If Iron Eater doesn't give the cutscene, talk to him again; if you have started the quest The Weight of Your Limits, you may have to change jobs first.",
            "Go to Beadeaux and get a cutscene on entering. The Survival Guide inside Beadeaux is closest; Unity Warp (level 122) goes to Pashhow Marshlands.",
            "Defeat 20 Copper Quadavs. Kills by anyone in your party count, and they don't have to be done in one go. There are 7 in the entry area before the tunnel and 3 more in the tunnel by the first afflictor. If Valaineral's Uriel Blade kills several at once, the extra kills don't count.",
            "After 20 kills, walk out into Pashhow Marshlands for the cutscene with Ayame that completes the mission. Using Escape skips the cutscene, and with fewer than 20 kills you get a different one.",
            "Optional: while you are in Beadeaux, you can get the Quadav Charm and Quadav Augury Shell needed later for Mission 4-1.",
        },
    },

    ['3-2'] = {
        name = "To the Forsaken Mines",
        rank = 3,
        number = '3-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.DAVYAD.text .. ".",
            "Obtain a Hare Meat.",
            "Enter Gusgen Mines from Konschtat Highlands (or use the Survival Guide). Use Sneak or Silent Oil unless the monsters check as easy prey or too weak. To reach the pond at (J-7): right (east) at the first three-way intersection, left (north) at the next one, right (east) at the fork, then right (east) again.",
            "Trade the Hare Meat to the ??? at the pond to spawn Blind Moby, a Pugil NM. If the NM Smothered Schmidt is up (it can spawn at 0:00, 1:00 or 2:00 when the siren sounds), wait for it to leave first.",
            "Defeat Blind Moby for the Glocolite. Everyone in the party needs their own, and the ??? can be used again after 3 minutes.",
            "Return to Bastok and trade the Glocolite to " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
        },
    },

    ['3-3'] = {
        name = "Jeuno",
        rank = 3,
        number = '3-3',
        mission_type = 'Fight',
        reward = "Rank 4, 5,000 gil",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.LUCIUS.text .. ".",
            "Travel to Ru'Lude Gardens and speak with " .. ACTOR.GOGGEHN.text .. " at the Bastokan Embassy.",
            "Go to Lower Delkfutt's Tower (entrance at Qufim Island F-6) and examine the Cermet Door at (E-8) on Map 1 to enter the basement. If you have a Delkfutt Key item, trade it to the door for the key item Delkfutt key. Without one, a party member who has the key can take you through, or you must get one from the top of the tower.",
            "Short way to the key: from the basement, open the door at (J-8) to go up to Upper Delkfutt's Tower, walk forward and examine the ??? at the foot of the stairs to be teleported to the NM Porphyrion. You can skip the fight and examine the shimmering ??? by the elevator for the key item Delkfutt key, then take the elevator and go down the spiral stairs two zones back to the basement.",
            "Long way: climb all 10 floors from the Qufim Island entrance (about 15 minutes). Bats and Dancing Weapons detect sound, Goblins and Giants sight, Pots and Dolls magic; below level 50 bring Sneak and Invisible. The Delkfutt Key drops from Porphyrion at the top.",
            "In the basement, cross the large room to the south-east and examine the Cermet Door at (K/L-9) for a cutscene. Another player using a key for you does not work here.",
            "Return to the Bastokan Embassy in Ru'Lude Gardens (H-10) and examine the Door: Bastokan Emb. for a cutscene that completes the mission.",
        },
    },

    ['4-1'] = {
        name = "Magicite",
        rank = 4,
        number = '4-1',
        mission_type = 'Quest',
        reward = "Rank 5, 10,000 gil, Airship Pass",
        steps = {
            "Speak with " .. ACTOR.GOGGEHN.text .. " at the Bastokan Embassy.",
            "Examine the Audience Chamber.",
            "Speak with " .. ACTOR.ALDO.text .. " in Neptune's Spire.",
            "Speak with " .. ACTOR.PAYA_SABYA.text .. " in Upper Jeuno at (I-8).",
            "Speak with " .. ACTOR.MUCKVIX.text .. " in Lower Jeuno at (H-9).",
            "Speak with " .. ACTOR.SATTAL_MANSAL.text .. " at (J-8) and obtain the required Quadav key items.",
            "Travel to Upper Jeuno and trade Coeurl Meat to " .. ACTOR.BAUDIN.text .. " at (G-8).",

            "Travel to Davoi and reach (G-7). Pass through the Wall of Dark Arts into Monastic Cavern and examine the Magicite at (F-6) to obtain the magicite.",
            "Castle Oztroja (entrance in Meriphataud Mountains, L-8): go to the Brass Door at (I-8). One of the two levers beside it opens the door, the other opens a trap door into a pit. Stand between the levers, pull one and step back at once: if the door opens, run through; if the trap opens, wait for it to close and pull the other lever. If you get \"Target is out of range\", shift your position a little.",
            "Go upstairs to Map 2 and head to (G-7), which leads out to a courtyard (Map 6). Head north, without falling off, to the hallway entrance at (I-7) into Map 7.",
            "Follow the right wall to the door at (H-9) (the monsters here are much higher level) and light the Torch to pass through. Head south and turn right to another Brass Door and open it; the zone line is just past it, so run if you have aggro.",
            "In the Altar Room (no monsters), examine the Magicite to receive Magicite: Orastone. If you only get a message that the magicite glows ominously, you are missing the Yagudo torch key item.",
            "Travel to Beadeaux, follow the left wall to (H-7), enter Qulun Dome, and obtain the magicite.",

            "Return to Ru'Lude Gardens and examine the Audience Chamber door at (H-5) for a cutscene.",
            "Speak with " .. ACTOR.GOGGEHN.text .. " in the Bastokan Embassy to receive your promotion to Rank 5.",
        },
    },

    ['5-1'] = {
        name = "Darkness Rising",
        rank = 5,
        number = '5-1',
        mission_type = 'BCNM',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.NAJI.text .. ".",
            "Go to Fei'Yin, in the northeast corner of Beaucedine Glacier, for a cutscene with Zeid. Home Point #1 in Fei'Yin puts you right by Qu'Bia Arena; Unity Warp (level 128) puts you at the Fei'Yin entrance. Most monsters here detect by sound, a few by spellcasting. If you are low level, bring Trusts or a party of level 50+ players.",
            "From the Fei'Yin entrance go east to (K-8) on map 1 and open the Cermet Portal between the two Dolls to enter Qu'Bia Arena. All your buffs wear off when you enter, so plan accordingly.",
            "Examine the Burning Circle to enter the BCNM \"The Rank 5 Mission\". You only need to defeat Archlich Taber'quoan, a Black Mage who casts Sleepga II and Freeze and may use Manafont. He starts with two Ancient Sorcerers, and Ancient Warriors run in from the hallway to help; the skeletons have little HP and take extra damage from blunt weapons. Winning gives a cutscene and the key item Burnt seal.",
            "Return to Bastok and speak with " .. ACTOR.NAJI.text .. " to complete the mission.",
        },
    },

    ['5-2'] = {
        name = "Xarcabard, Land of Truths",
        rank = 5,
        number = '5-2',
        mission_type = 'BCNM',
        reward = "Rank 6, 20,000 gil, Unlock Zilart Missions, Unlock Dynamis",
        steps = {
            "Travel to the President's Office and speak with " .. ACTOR.KARST.text .. ".",
            "If you don't use Trusts and are level 55-60, bring a full party. Castle Zvahl is on the far west side of Xarcabard (D-7/8); Castle Zvahl Keep Home Point #1 takes you closest.",
            "Castle Zvahl Baileys: follow the one-way path to the first intersection, turn right, go north then west and down a short flight of stairs, turn left and follow the right wall to the next map. There, go to the top right corner and up the stairs, cross to the top left and back down, work into the central courtyard, go back up and through the gate on the right to a long hall with a large staircase.",
            "Castle Zvahl Keep: turn right out of the hallway and pass a few gates (the monsters here detect sight). From the upper level, follow the narrow path to more stairs and the teleporters. Stand in the middle of each one until it activates (this drops Invisible); after four of them, go to the west middle of the new map and through the door into the Throne Room.",
            "Gather at the far side of the Throne Room, then examine the door to enter the battlefield \"The Shadow Lord Battle\". In his first form he switches between physical and magic immunity: rest MP while he is immune to magic (he uses Dark Nova and black magic then) and stop melee while he is immune to physical attacks (Giga Slash, Kick Back, Umbra Smash).",
            "After a cutscene the second form starts at once: about 4,000 HP, only AoE attacks and no immunity switching. Use your two-hour abilities and Curaga freely. Winning gives a cutscene and the key item Shadow fragment, and you are returned to the Castle Zvahl Baileys entrance.",
            "Return to " .. ACTOR.KARST.text .. " after the battle.",
            "Speak with " .. ACTOR.LUCIUS.text .. " to receive Trust: Volker.",
        },
    },

    ['6-1'] = {
        name = "Return of the Talekeeper",
        rank = 6,
        number = '6-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Trade crystals to a Conquest NPC until your rank bar fills, then accept the mission from " .. ACTOR.BASTOK_GATE_GUARD.text,
            "Speak with " .. ACTOR.MEDICINE_EAGLE.text .. " in Bastok Mines, all the way north.",
            "Speak with " .. ACTOR.DRAKE_FANG.text .. " in Zeruhn Mines, near the boat. Zeruhn Mines is reached from Bastok Mines (D-7) or by Survival Guide. A cutscene sends you to Western Altepa Desert.",
            "Travel to Western Altepa Desert: Unity Warp (level 125) puts you at (I-7), the Survival Guide at (K-7).",
            "Examine the " .. ACTOR.ALTEPA_QQ.text .. " on the west side of the square, between three glowing rocks, to spawn Western Sphinx and Eastern Sphinx.",
            "Defeat the two level 62 Manticore NMs, Western Sphinx and Eastern Sphinx (about 7,000 HP each, immune to Sleep and Lullaby). Only one has to die, but you can't get the key item until the other is dead or has lost interest in you.",
            "Examine " .. ACTOR.ALTEPA_QQ.text .. " again to receive the Altepa moonpebble. Do not zone first, or you will have to fight both Sphinxes again.",
            "Return to Bastok Mines (Home Point #3) and speak with " .. ACTOR.TALL_MOUNTAIN.text .. " on the bottom level near the restricted area. The mission completes after the cutscene.",
        },
    },

    ['6-2'] = {
        name = "The Pirates' Cove",
        rank = 6,
        number = '6-2',
        mission_type = 'Fight',
        reward = "Rank 7, 40,000 gil",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Go to Bastok Metalworks and speak with " .. ACTOR.NAJI.text .. " in front of the President's Office for a cutscene. You may need to speak with him several times to get the right cutscene.",
            "Travel to Norg and speak with Gilgamesh behind the Oaken Door at (K-8) until he mentions Frag Rocks.",
            "Obtain one Adaman Ore for every six people doing the mission (Auction House: Materials > Smithing; mining one in Ifrit's Cauldron is very rare). Each fight gives up to 6 Frag Rocks.",
            "Enter Ifrit's Cauldron from Yhoator Jungle (I-5). Quick routes: Ifrit's Cauldron Home Point #1 then Escape and re-enter, Unity Warp (level 122) to Yhoator Jungle, the Elshimo Uplands outpost warp or the Survival Guide.",
            "Use Sneak and Invisible past the Bats and Bombs: left at the first intersection, right at the next, to the ??? in the lava flow around (H-7) on Map 1. Buff up (Barfira helps) and trade it the Adaman Ore.",
            "This spawns two level 65 NMs: Magma, a Bomb that may Self-Destruct, and Salamander, a weaker Lizard. Only Magma has to die, so sneak-pull it. It drops the Frag Rocks.",
            "Return to Norg and trade your Frag Rock to Gilgamesh for a cutscene.",
            "Return to Bastok Metalworks and speak with " .. ACTOR.NAJI.text .. " for a final cutscene and your reward.",
        },
    },

    ['7-1'] = {
        name = "The Final Image",
        rank = 7,
        number = '7-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.CID.text .. ".",
            "Travel to Ro'Maeve (from The Sanctuary of Zi'Tah (F-5); the Unity Warp (level 125) lands at (H-11), the Survival Guide at (H-6)). Everything there aggroes to magic, most to sound and sight too. Search for the ??? at one of these locations; it moves about every 15 minutes, even during the fight:",
            ACTOR.ROMAEVE_QQ_D10.text,
            ACTOR.ROMAEVE_QQ_E9.text,
            ACTOR.ROMAEVE_QQ_E10.text,
            ACTOR.ROMAEVE_QQ_E11.text,
            ACTOR.ROMAEVE_QQ_G9.text,
            ACTOR.ROMAEVE_QQ_I8.text,
            ACTOR.ROMAEVE_QQ_J8.text,
            ACTOR.ROMAEVE_QQ_K10.text,
            ACTOR.ROMAEVE_QQ_K11.text,
            ACTOR.ROMAEVE_QQ_L10.text,
            ACTOR.ROMAEVE_QQ_L7.text,
            "Avoid the ??? at (M-8), which is used for a different purpose.",
            "Clear the nearby enemies and examine the correct ??? to face two Mokkurkalfi (Golems). You can Sneak-pull them; if you do, wait for the second to despawn before killing the first.",
            "Defeat the Mokkurkalfi and find the ??? again (it may have moved). You won't have to fight again unless you zone or die.",
            "Examine it again to obtain the Reinforced Cermet.",
            "Return to Bastok and speak with " .. ACTOR.CID.text .. ".",
        },
    },

    ['7-2'] = {
        name = "On My Way",
        rank = 7,
        number = '7-2',
        mission_type = 'BCNM',
        reward = "Rank 8, 60,000 gil",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.KARST.text .. ".",
            "Speak with " .. ACTOR.HILDA.text .. ".",
            "Travel to Waughroon Shrine through Palborough Mines (the Palborough Mines Home Point is close), or pay Domenic in Lower Jeuno (J-7) 750 gil to be teleported straight to the battlefield.",
            "Examine the Burning Circle to enter the battlefield \"On My Way\" (6 people, no level cap, no experience loss, buffs removed, Trusts allowed). You face four Quadavs that each use their two-hour ability: Sa'Nha Soulsaver (WHM), Go'Bha Slaughterer (DRK), Ku'Jhu Graniteskin (WAR) and Da'Shu Knightslayer (RDM). Sleep them and fight one at a time, pulling the White Mage first, down to the bottom of the ramp, so Benediction doesn't wake the others.",
            "Winning gives the key item Letter from Werei.",
            "Return to Bastok and speak with " .. ACTOR.KARST.text .. ".",
            "Speak with Gumbah in Bastok Mines (J-7), in the house next to Home Point #3 (upstairs and across the bridge), for the cutscene where he reads the letter. Keep talking to him until his text stops changing; if a Voracious Resurgence mission is active he talks about that first.",
        },
    },

    ['8-1'] = {
        name = "The Chains That Bind Us",
        rank = 8,
        number = '8-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.IRON_EATER.text .. ".",
            "Enter Quicksand Caves from Western Altepa Desert at (G-5).",
            "Reach (H-8) and pass through the weighted door.",
            "Continue through the next weighted door at (I-10) and reach (G-11).",
            "Examine " .. ACTOR.QUICKSAND_QQ_G11.text .. " to face Triarius IV-XIV, Princeps IV-XLV, and Centurio IV-VII.",
            "Defeat all three Antica.",
            "Examine the Galka Statue again.",
            "Return to Western Altepa Desert and enter Quicksand Caves from the entrance around (C/D-11).",
            "Pass through the weighted door at (K-8) and continue to the next area.",
            "Use the weight device at (G-8) and reach the ??? at (H-8) in front of the mural.",
            "Examine the ???.",
            "Return to " .. ACTOR.IRON_EATER.text .. ".",
        },
    },

    ['8-2'] = {
        name = "Enter the Talekeeper",
        rank = 8,
        number = '8-2',
        mission_type = 'Fight',
        reward = "Rank 9, 80,000 gil",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.DRAKE_FANG.text .. ".",
            "Enter Kuftal Tunnel from Western Altepa Desert (H-4), or use the Kuftal Tunnel Survival Guide, and stay on Map 1.",
            "Reach " .. ACTOR.KUFTAL_QQ.text .. ".",
            "Examine the ??? and choose to extract the piece of wood; it falls off the cliff. Everyone in the party must examine this ??? (anyone who misses it can still do it after the fight).",
            "Use Sneak and go down to the ??? at the foot of the cliff, directly below. Examining it spawns three level 68 NM ghosts: Dervo's Ghost, Gizerl's Ghost and Gordov's Ghost. You can pull Gordov's Ghost and wait for the others to leave, or defeat all three.",
            "Examine the lower ??? again for a cutscene and the key item Old piece of wood.",
            "Return to " .. ACTOR.DRAKE_FANG.text .. ".",
            "Optional: speak with Gumbah (J-7) and Detzo (I-6) in Bastok Mines and Iron Eater in Bastok Metalworks for short cutscenes.",
        },
    },

    ['9-1'] = {
        name = "The Salt of the Earth",
        rank = 9,
        number = '9-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.ALOIS.text .. ".",
            "Travel to Rabao and speak with Dancing Wolf (G-7) until he mentions Miraclesalt. If he keeps repeating himself without mentioning it, zone and try again; it can take a few tries.",
            "Go to the pond at (G-6) on Map 2 of Gustav Tunnel. Unity Warp (level 128) puts you just south of it; the Survival Guide goes to Map 1. Everything nearby aggroes, so others can wait at (H-7), which is safe.",
            "Examine " .. ACTOR.GUSTAV_QQ.text .. " to face Gigaplasm.",
            "Defeat Gigaplasm. It splits into 2 Macroplasms, each of those into 2 Microplasms, and each of those into 2 Nanoplasms, with less HP every time. Slimes resist melee, so bring casters, keep the rest asleep and finish one branch at a time. Don't feed them TP (Fluid Spread hurts).",
            "Examine " .. ACTOR.GUSTAV_QQ.text .. " again to obtain Miraclesalt.",
            "Return to Rabao and speak with Dancing Wolf at (G-7).",
            "Return to Bastok and speak with " .. ACTOR.ALOIS.text .. ".",
        },
    },

    ['9-2'] = {
        name = "Where Two Paths Converge",
        rank = 9,
        number = '9-2',
        mission_type = 'BCNM',
        reward = "Rank 10, 100,000 gil, Bastokan Flag, Ability to buy Atma of the Hero",
        steps = {
            "Speak with " .. ACTOR.BASTOK_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.IRON_EATER.text .. ".",
            "Go to the Throne Room in Castle Zvahl Keep (Home Point #1 is closest). Buffs wear off when you enter the battlefield, so buff inside.",
            "Enter the battlefield \"Where Two Paths Converge\" against Zeid. Phase 1 is a straight fight; his AoE weapon skill can put you to sleep, so Poison Potions help. At about 65% HP a cutscene brings in Volker.",
            "Phase 2: keep Volker alive or you lose. Zeid summons two Shadows of Rage (strong hits, low HP, immune to Sleep) and resummons them when they die. They can skillchain with him, so kill them if your group is small; otherwise focus on Zeid. Winning gives a cutscene.",
            "Return to " .. ACTOR.IRON_EATER.text .. ".",
        },
    },
}

return M