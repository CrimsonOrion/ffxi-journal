--[[
    San d'Oria - Mission Database
    ===============================

    Mission IDs and walkthrough IDs are intentionally kept
    as separate identifiers:

    - M.MISSIONS uses the official numeric mission IDs consumed
      by the mission tracker.
    - M.STEPS uses the original walkthrough IDs such as 1-1,
      1-2, 2-1, etc.

    Both databases are kept in this single file.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'Smash the Orcish Scouts',
    [1] = 'Bat Hunt',
    [2] = 'Save the Children',
    [3] = 'The Rescue Drill',
    [4] = 'The Davoi Report',
    [5] = 'Journey Abroad',

    -- Journey Abroad is split into legs by the game. The step text is
    -- the matching half of walkthrough 2-3, embedded here because the
    -- names repeat and cannot be matched by name.
    --
    -- 6 = Bastok visited first, 7 = Windurst visited first,
    -- 8 = Bastok visited second, 9 = Windurst visited second.

    [6] = {
        name = 'Journey to Bastok',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Bastok and speak with Savae E. Paleade (I-9), Pius (J-8), and Grohm (G-9).",
            "In Palborough Mines, trade a Pickaxe to a Mythril Seam to obtain Mine Gravel.",
            "On the third floor, trade the Gravel to the Refiner, pull the lever, drop to the second floor, pull the second lever, and obtain Mythril Sand.",
            "Return to Savae E. Paleade (I-9) and trade the Mythril Sand.",
            "Travel to Windurst to continue with the second leg.",
        },
    },

    [7] = {
        name = 'Journey to Windurst',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Windurst Woods and speak with Mourices (F/G-10).",
            "Enter Heavens Tower and speak with Kupipi in the Clerical Chamber to receive the Shield Offering.",
            "Enter Giddeus from West Sarutabaruta at (F-8), then drop through the hole at (G-8) and head north to (G/H-7).",
            "Defeat Zhuu Buxu the Silent twice to obtain two Parana Shields.",
            "Travel west to (F-7) and speak with Uu Zhoumo (F-7) to offer the Shield Offering.",
            "Return to Mourices (F/G-10) and trade the two Parana Shields.",
            "Travel to Bastok to continue with the second leg.",
        },
    },

    [8] = {
        name = 'Journey to Bastok',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Bastok and speak with Savae E. Paleade (I-9), Pius (J-8), and Grohm (G-9).",
            "Travel through Palborough Mines, obtain Mine Gravel and turn it into Mythril Sand, then return to Savae E. Paleade (I-9).",
            "Enter Waughroon Shrine and complete the Rank 2 Final Mission against Seeker and Dark Dragon.",
            "Return to Savae E. Paleade (I-9) to receive the Kindred Report.",
            "Return to Halver (I-9) at Chateau d'Oraguille to complete the mission.",
        },
    },

    [9] = {
        name = 'Journey to Windurst',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Windurst Woods and speak with Mourices (F/G-10).",
            "Enter Heavens Tower and speak with Kupipi in the Clerical Chamber to receive the Dark Key.",
            "Travel through Giddeus to Balga's Dais and enter the Rank 2 Final Mission battlefield.",
            "Defeat Searcher and Black Dragon.",
            "Return to Windurst Woods and speak with Mourices (F/G-10) to receive the Kindred Report.",
            "Return to Halver (I-9) at Chateau d'Oraguille to complete the mission.",
        },
    },
    [10] = 'Infiltrate Davoi',
    [11] = 'The Crystal Spring',
    [12] = 'Appointment to Jeuno',
    [13] = 'Magicite',
    [14] = 'The Ruins of Fei\'Yin',
    [15] = 'The Shadow Lord',
    [16] = 'Leaute\'s Last Wishes',
    [17] = 'Ranperre\'s Final Rest',
    [18] = 'Prestige of the Papsque',
    [19] = 'The Secret Weapon',
    [20] = 'Coming of Age',
    [21] = 'Lightbringer',
    [22] = 'Breaking Barriers',
    [23] = 'The Heir to the Light',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- RANK 1
    -- ========================================================

    ['1-1'] = {
        name = "Smash the Orcish Scouts",
        rank = 1,
        number = '1-1',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Hunt Orcish Fodders in East or West Ronfaure for an Orcish Axe.",
            "Trade the Orcish Axe to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
        },
    },

    ['1-2'] = {
        name = "Bat Hunt",
        rank = 1,
        number = '1-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Enter King Ranperre's Tomb from East Ronfaure at (H-11) and hunt Ding Bats at night for Orcish Mail Scales.",
            "Examine " .. ACTOR.RANPERRE_TOMBSTONE_H10.text .. ".",
            "The Ding Bats and tombstone can be handled in either order.",
            "Trade the Orcish Mail Scales to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
        },
    },

    ['1-3'] = {
        name = "Save the Children",
        rank = 1,
        number = '1-3',
        mission_type = 'Repeatable',
        reward = "Rank 2, 1,000 gil",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Northern San d'Oria and speak with " .. ACTOR.ARNAU.text .. " in the Cathedral.",
            "Go to Ghelsba Outpost, entered from West Ronfaure (E-4).",
            "Make your way to " .. ACTOR.GHELSBA_HUT_DOOR.text .. " in the large open area.",
            "Examine the Hut Door to enter the battlefield.",
            "Defeat the three Orcs: Fodderchief Vokdek (WAR), Strongarm Zodvad (RNG) and Sureshot Snatgat (RNG). Up to 6 people who are on or past this mission can enter; the battlefield removes level restrictions and Trusts, so summon your Trusts again after entering. Winning gives the key item Orcish hut key.",
            "Examine " .. ACTOR.GHELSBA_HUT_DOOR.text .. " again after the battle.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Optional: speak with Arnau again after the Gate Guard for one more cutscene.",
        },
    },

    -- ========================================================
    -- RANK 2
    -- ========================================================

    ['2-1'] = {
        name = "The Rescue Drill",
        rank = 2,
        number = '2-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to La Theine Plateau and speak with " .. ACTOR.GALAIHAURAT.text .. ".",
            "Continue down the canyon and speak with " .. ACTOR.EQUESOBILLOT.text .. ".",
            "Enter Ordelle's Caves and follow the left wall to " .. ACTOR.RUILLONT.text .. " by the pond.",
            "Return to La Theine Plateau. " .. ACTOR.DEAUFRAIN.text .. ", " .. ACTOR.EQUESOBILLOT.text .. ", and " .. ACTOR.GALAIHAURAT.text .. " are the three who may provide the Bronze Sword.",
            "Speak with them again until you find the one carrying the Bronze Sword, then trade it to " .. ACTOR.RUILLONT.text .. " in Ordelle's Caves.",
            "Return to La Theine Plateau and speak with " .. ACTOR.VICORPASSE.text .. " to receive the Rescue Training Certificate.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
        },
    },

    ['2-2'] = {
        name = "The Davoi Report",
        rank = 2,
        number = '2-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to La Theine Plateau and enter Jugner Forest at (M-8), then follow the right side of Jugner Forest to Davoi at (G-12).",
            "Find " .. ACTOR.ZANTAVIAT.text .. " just inside Davoi.",
            "Walk south to the pond around (J-8).",
            "Examine " .. ACTOR.DAVOI_REPORT_QQ_J8.text .. " to obtain the Lost Document.",
            "Return to " .. ACTOR.ZANTAVIAT.text .. " to receive the Temple Knights' Davoi Report.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Enter the " .. ACTOR.PAPAL_CHAMBERS.text .. " on the top floor of the Cathedral in Northern San d'Oria.",
        },
    },

    ['2-3'] = {
        name = "Journey Abroad",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Speak with " .. ACTOR.HALVER.text .. " at Chateau d'Oraguille.",
            "Choose whether to visit Bastok or Windurst first. The two paths can be completed in either order.",

            "Bastok First:",
            "Travel to Bastok and speak with " .. ACTOR.SAVAE_E_PALEADE.text .. ", " .. ACTOR.PIUS.text .. ", and " .. ACTOR.GROHM.text .. ".",
            "In Palborough Mines, trade a Pickaxe to a Mythril Seam to obtain Mine Gravel.",
            "On the third floor, trade the Gravel to the Refiner, pull the lever, drop to the second floor, pull the second lever, and obtain Mythril Sand.",
            "Return to " .. ACTOR.SAVAE_E_PALEADE.text .. " and trade the Mythril Sand.",
            "Travel to Windurst Woods and speak with " .. ACTOR.MOURICES.text .. ".",
            "Enter Heavens Tower and speak with " .. ACTOR.KUPIPI.text .. " in the Clerical Chamber to receive the Dark Key.",
            "Travel through Giddeus to Balga's Dais and enter the Rank 2 Final Mission battlefield.",
            "Defeat Searcher and Black Dragon.",
            "Return to Windurst Woods and speak with " .. ACTOR.MOURICES.text .. " to receive the Kindred Report.",

            "Windurst First:",
            "Travel to Windurst Woods and speak with " .. ACTOR.MOURICES.text .. ".",
            "Enter Heavens Tower and speak with " .. ACTOR.KUPIPI.text .. " in the Clerical Chamber to receive the Shield Offering.",
            "Enter Giddeus from West Sarutabaruta at (F-8), then drop through the hole at (G-8) and head north to (G/H-7).",
            "Defeat Zhuu Buxu the Silent twice to obtain two Parana Shields.",
            "Travel west and speak with " .. ACTOR.UU_ZHOUMO.text .. " to offer the Shield Offering.",
            "Return to " .. ACTOR.MOURICES.text .. " and trade the two Parana Shields.",
            "Travel to Bastok and speak with " .. ACTOR.SAVAE_E_PALEADE.text .. ", " .. ACTOR.PIUS.text .. ", and " .. ACTOR.GROHM.text .. ".",
            "Travel through Palborough Mines, obtain Mine Gravel and turn it into Mythril Sand, then return to " .. ACTOR.SAVAE_E_PALEADE.text .. ".",
            "Enter Waughroon Shrine and complete the Rank 2 Final Mission against Seeker and Dark Dragon.",
            "Return to " .. ACTOR.SAVAE_E_PALEADE.text .. " to receive the Kindred Report.",

            "Return to " .. ACTOR.HALVER.text .. " at Chateau d'Oraguille after both national paths are complete.",
        },
    },

    -- ========================================================
    -- RANK 3
    -- ========================================================

    ['3-1'] = {
        name = "Infiltrate Davoi",
        rank = 3,
        number = '3-1',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Chateau d'Oraguille and examine " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ".",
            "Travel through Jugner Forest and enter Davoi from (G-12).",
            "Follow the right wall until the path turns north, then take the left path at the three-way intersection to reach the bridge.",
            "Wait on the bridge and speak with " .. ACTOR.QUEMARICOND.text .. " to receive the Royal Knights' Davoi Report.",
            "Return to Chateau d'Oraguille and speak with Prince Trion in " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ".",
        },
    },

    ['3-2'] = {
        name = "The Crystal Spring",
        rank = 3,
        number = '3-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Obtain a Crystal Bass. Buying one from the Auction House (Food > Fish) is much easier; you can also fish one at Crystalwater Spring in Jugner Forest (J-9), but it caps at fishing skill 35.",
            "Trade the Crystal Bass to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Enter Chateau d'Oraguille for a cutscene.",
            "Speak with Chalvatot by the late Queen Leaute's tombstone in the garden of Chateau d'Oraguille (F-7) for a cutscene that completes the mission.",
        },
    },

    ['3-3'] = {
        name = "Appointment to Jeuno",
        rank = 3,
        number = '3-3',
        mission_type = 'Fight',
        reward = "Rank 4, 5,000 gil",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.HALVER.text .. " at Chateau d'Oraguille.",
            "Examine the " .. ACTOR.GREAT_HALL.text .. " behind Halver.",
            "Travel to the San d'Orian Embassy in Ru'Lude Gardens and speak with " .. ACTOR.NELCABRIT.text .. ".",
            "Go to Lower Delkfutt's Tower (entrance at Qufim Island F-6) and examine the Cermet Door at (E-8) on Map 1 to enter the basement. If you have a Delkfutt Key item, trade it to the door for the key item Delkfutt key. Without one, a party member who has the key can take you through, or you must get one from the top of the tower.",
            "Short way to the key: from the basement, open the door at (J-8) to go up to Upper Delkfutt's Tower, walk forward and examine the ??? at the foot of the stairs to be teleported to the NM Porphyrion. You can skip the fight and examine the shimmering ??? by the elevator for the key item Delkfutt key, then take the elevator and go down the spiral stairs two zones back to the basement.",
            "Long way: climb all 10 floors from the Qufim Island entrance (about 15 minutes). Bats and Dancing Weapons detect sound, Goblins and Giants sight, Pots and Dolls magic; below level 50 bring Sneak and Invisible. The Delkfutt Key drops from Porphyrion at the top.",
            "In the basement, head east to the large room and examine the Cermet Door at (L-8) for a cutscene. Another player using a key for you does not work here.",
            "Return to the San d'Orian Embassy in Ru'Lude Gardens and examine the Embassy door to complete the mission.",
        },
    },

    -- ========================================================
    -- RANK 4
    -- ========================================================

    ['4-1'] = {
        name = "Magicite",
        rank = 4,
        number = '4-1',
        mission_type = 'Quest',
        reward = "Rank 5, 10,000 gil, Airship Pass",
        steps = {
            "Speak with " .. ACTOR.NELCABRIT.text .. " and enter the " .. ACTOR.SAN_DORIAN_EMBASSY_DOOR.text .. " in Ru'Lude Gardens.",
            "Examine the " .. ACTOR.AUDIENCE_CHAMBER.text .. " to receive the Letter to Aldo.",
            "Enter Neptune's Spire in Lower Jeuno and speak with " .. ACTOR.ALDO.text .. " to receive the Silver Bell.",
            "If you still need the Yagudo Torch, speak with " .. ACTOR.PAYA_SABYA.text .. " at (I-8) in Upper Jeuno, then speak with " .. ACTOR.MUCKVIX.text .. " at (H-9) in Lower Jeuno.",
            "Speak with " .. ACTOR.SATTAL_MANSAL.text .. " at (J-8): trade a Quadav Charm for the Coruscant Rosary, then trade a Quadav Augury Shell for the Black Matinee Necklace.",
            "In Upper Jeuno, speak with " .. ACTOR.BAUDIN.text .. " at (G-8) and trade him Coeurl Meat for the Crest of Davoi.",
            "The prerequisite key items are shared between the three nations' Magicite missions, so only missing items need to be obtained.",

            "The three Magicite locations can be completed in any order.",
            "Davoi: travel to (G-7), avoid or defeat the Orcs, use Sneak if needed, and pass through the Wall of Dark Arts into Monastic Cavern, then examine the Magicite at (F-6) to obtain Optistone.",
            "Castle Oztroja (entrance in Meriphataud Mountains, L-8): go to the Brass Door at (I-8). One of the two levers beside it opens the door, the other opens a trap door into a pit. Stand between the levers, pull one and step back at once: if the door opens, run through; if the trap opens, wait for it to close and pull the other lever. If you get \"Target is out of range\", shift your position a little.",
            "Go upstairs to Map 2 and head to (G-7), which leads out to a courtyard (Map 6). Head north, without falling off, to the hallway entrance at (I-7) into Map 7.",
            "Follow the right wall to the door at (H-9) (the monsters here are much higher level) and light the Torch to pass through. Head south and turn right to another Brass Door and open it; the zone line is just past it, so run if you have aggro.",
            "In the Altar Room (no monsters), examine the Magicite to receive Magicite: Orastone. If you only get a message that the magicite glows ominously, you are missing the Yagudo torch key item.",
            "Beadeaux: follow the left wall to (H-7), enter Qulun Dome, open the inner door, and obtain Aurastone.",

            "Return to the " .. ACTOR.AUDIENCE_CHAMBER.text .. " after obtaining all three Magicites.",
            "Return to " .. ACTOR.NELCABRIT.text .. " at the San d'Orian Embassy.",
        },
    },

    -- ========================================================
    -- RANK 5
    -- ========================================================

    ['5-1'] = {
        name = "The Ruins of Fei'Yin",
        rank = 5,
        number = '5-1',
        mission_type = 'BCNM',
        reward = "Rank Points",
        steps = {
            "Zone into Chateau d'Oraguille (Northern San d'Oria Home Point #2 is closest) for a cutscene with King Destin.",
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. " and accept the mission.",
            "Speak with " .. ACTOR.HALVER.text .. " to receive the New Fei'Yin Seal.",
            "Go to Fei'Yin, in the northeast corner of Beaucedine Glacier, for a cutscene with Zeid. Home Point #1 in Fei'Yin puts you right by Qu'Bia Arena; Unity Warp (level 128) puts you at the Fei'Yin entrance. Most monsters here detect by sound, a few by spellcasting. If you are low level, bring Trusts or a party of level 50+ players.",
            "From the Fei'Yin entrance go east to (K-8) on map 1 and open the Cermet Portal between the two Dolls to enter Qu'Bia Arena. All your buffs wear off when you enter, so plan accordingly.",
            "Examine the Burning Circle to enter the BCNM \"The Rank 5 Mission\". You only need to defeat Archlich Taber'quoan, a Black Mage who casts Sleepga II and Freeze and may use Manafont. He starts with two Ancient Sorcerers, and Ancient Warriors run in from the hallway to help; the skeletons have little HP and take extra damage from blunt weapons. Winning gives a cutscene and the key item Burnt seal.",
            "Return to " .. ACTOR.HALVER.text .. ".",
        },
    },

    ['5-2'] = {
        name = "The Shadow Lord",
        rank = 5,
        number = '5-2',
        mission_type = 'BCNM',
        reward = "Rank 6, 20,000 gil, Unlock Zilart Missions, Unlock Dynamis",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. " to accept the mission.",
            "Speak with " .. ACTOR.HALVER.text .. " at Chateau d'Oraguille.",
            "Examine the " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ".",
            "If you don't use Trusts and are level 55-60, bring a full party. Castle Zvahl is on the far west side of Xarcabard (D-7/8); Castle Zvahl Keep Home Point #1 takes you closest.",
            "Castle Zvahl Baileys: follow the one-way path to the first intersection, turn right, go north then west and down a short flight of stairs, turn left and follow the right wall to the next map. There, go to the top right corner and up the stairs, cross to the top left and back down, work into the central courtyard, go back up and through the gate on the right to a long hall with a large staircase.",
            "Castle Zvahl Keep: turn right out of the hallway and pass a few gates (the monsters here detect sight). From the upper level, follow the narrow path to more stairs and the teleporters. Stand in the middle of each one until it activates (this drops Invisible); after four of them, go to the west middle of the new map and through the door into the Throne Room.",
            "Examine the Throne Room door for a cutscene, then examine it again and choose \"The Shadow Lord Battle\". In his first form he switches between physical and magic immunity: rest MP while he is immune to magic (he uses Dark Nova and black magic then) and stop melee while he is immune to physical attacks (Giga Slash, Kick Back, Umbra Smash).",
            "After a cutscene the second form starts at once: about 4,000 HP, only AoE attacks and no immunity switching. Use your two-hour abilities and Curaga freely. Winning gives a cutscene and the key item Shadow fragment, and you are returned to the Castle Zvahl Baileys entrance.",
            "Return to Chateau d'Oraguille and speak with " .. ACTOR.HALVER.text .. " to complete the mission.",
            "Examine the " .. ACTOR.GREAT_HALL.text .. ".",
            "Examine the " .. ACTOR.PRINCES_ROYAL_ROOM.text .. " again to unlock Trust: Trion.",
        },
    },

    -- ========================================================
    -- RANK 6
    -- ========================================================

    ['6-1'] = {
        name = "Leaute's Last Wishes",
        rank = 6,
        number = '6-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.HALVER.text .. " at Chateau d'Oraguille.",
            "Enter the " .. ACTOR.GREAT_HALL.text .. " and receive the King's request for a Dreamrose.",
            "Speak with " .. ACTOR.HALVER.text .. " again.",
            "Travel to Western Altepa Desert and examine " .. ACTOR.DREAMROSE_G7.text .. " to face Sabotender Enamorado.",
            "Defeat Sabotender Enamorado.",
            "Examine " .. ACTOR.DREAMROSE_G7.text .. " again to receive the Dreamrose.",
            "Return to " .. ACTOR.HALVER.text .. ".",
            "Travel to " .. ACTOR.QUEEN_LEAUTE_GARDEN.text .. ".",
            "Receive the Piece of Paper after completing the event at the Garden.",
        },
    },

    ['6-2'] = {
        name = "Ranperre's Final Rest",
        rank = 6,
        number = '6-2',
        mission_type = 'Fight',
        reward = "Rank 7, 40,000 gil",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Chateau d'Oraguille and speak with Prince Trion in " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ".",
            "Travel to King Ranperre's Tomb and make your way to " .. ACTOR.HEAVY_STONE_DOOR.text .. ".",
            "Examine the Heavy Stone Door to face Corrupted Soffeil, Corrupted Yorgos, and Corrupted Ulbrig.",
            "Defeat all three Skeletons.",
            "Examine " .. ACTOR.HEAVY_STONE_DOOR.text .. " again and enter the chamber.",
            "Examine the tombstone inside to receive the Ancient San d'Orian Book.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Speak with the Gate Guard three times about the book; after the guard says it will take time to decipher, return later and speak with the guard again.",
            "Follow the Gate Guard's instructions and return to Prince Trion in " .. ACTOR.PRINCES_ROYAL_ROOM.text .. ".",
            "Return to " .. ACTOR.HEAVY_STONE_DOOR.text .. " in King Ranperre's Tomb and examine it again.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
        },
    },

    -- ========================================================
    -- RANK 7
    -- ========================================================

    ['7-1'] = {
        name = "Prestige of the Papsque",
        rank = 7,
        number = '7-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Northern San d'Oria and enter the " .. ACTOR.PAPAL_CHAMBERS.text .. " on the third floor of the Cathedral.",
            "If you are low level, bring a party or Trusts, and Silent Oil for Sneak.",
            "Enter Bostaunieux Oubliette from Chateau d'Oraguille (I-8).",
            "Use Sneak, go to (E-7/8) and speak with Couchatorage by the Sewer Lid to drop down to Map 2 (pick up the Survival Guide nearby if this is your first visit). Follow the right wall until you zone into West Ronfaure at (E-8); the ??? is right in front of you. Shortcuts once unlocked: Unity Warp (level 122) to Bostaunieux Oubliette or the West Ronfaure Proto-Waypoint.",
            "Examine " .. ACTOR.WEST_RONFAURE_PAPSQUE_QQ_E8.text .. " to face Marauder Dvogzog.",
            "Defeat Marauder Dvogzog, a level 67 Monk Orc with about 16,000 HP that can use Hundred Fists.",
            "Examine the ??? again to receive the key item Ancient San d'Orian tablet. If you fall off the ledge, you have to come back through the Oubliette and fight the NM again.",
            "Return to Northern San d'Oria and enter the " .. ACTOR.PAPAL_CHAMBERS.text .. ".",
        },
    },

    ['7-2'] = {
        name = "The Secret Weapon",
        rank = 7,
        number = '7-2',
        mission_type = 'BCNM',
        reward = "Rank 8, 60,000 gil",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Go to Chateau d'Oraguille and walk toward the garden (F-8) for a cutscene.",
            "Return to " .. ACTOR.SANDORIA_GATE_GUARD.text .. " to receive the mission.",
            "If you are low level, bring a party or Trusts; a Black Mage or Bard to sleep the enemies helps. Only players on or past this mission can enter.",
            "Reach Horlais Peak through Ghelsba Outpost and Yughott Grotto; Yughott Grotto Home Point #1 is right outside it.",
            "Enter the battlefield against three level 68 Orcs and two Warmachines: Darokbok of Clan Reaper (PLD), Derakbak of Clan Wolf (DRG), Jagidbod of Clan Reaper (RNG), Wolf Clan Warmachine and Reaper Clan Warmachine. Open with Sleepga II (Elemental Seal helps), kill the Warmachines first, then the Paladin, the Dragoon and its wyvern, and the Ranger last.",
            "Winning gives a cutscene and the key item Crystal dowser.",
            "Return to San d'Oria and speak with any Gate Guard to complete the mission.",
        },
    },

    -- ========================================================
    -- RANK 8
    -- ========================================================

    ['8-1'] = {
        name = "Coming of Age",
        rank = 8,
        number = '8-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Zone into Chateau d'Oraguille for a cutscene.",
            "Travel to Chateau d'Oraguille and speak with " .. ACTOR.HALVER.text .. ".",
            "Examine the two doors to the Princes' quarters if you want to hear their additional dialogue.",
            "Go to Quicksand Caves Map 2: the entrance at Eastern Altepa Desert (H-10), just east of its Survival Guide, puts you there. Unity Warp (level 125) to Quicksand Caves puts you on Map 1 at (J-5); walk south then west to (F-10) to reach Map 2.",
            "Drop down the hole at (E-11) and go to the Fountain of Kings at (G-14).",
            "Clear the area and examine the Fountain of Kings to spawn two Kraken NMs, Honor (casts Paralyga and Silencega) and Valor (uses Hundred Fists). They don't link but detect sound, resist Sleep, and can be Blinded and Gravitied. Letting one leave and then defeating the other makes it much easier.",
            "After their bodies disappear, examine the Fountain of Kings again for the key item Drops of Amnio.",
            "Return to " .. ACTOR.HALVER.text .. ".",
            "Wait one Earth minute, then leave the Chateau into Northern San d'Oria for a cutscene that completes the mission.",
        },
    },

    ['8-2'] = {
        name = "Lightbringer",
        rank = 8,
        number = '8-2',
        mission_type = 'Fight',
        reward = "Rank 9, 80,000 gil",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Chateau d'Oraguille and examine the " .. ACTOR.GREAT_HALL.text .. ".",
            "Speak with " .. ACTOR.RAHAL.text .. " to receive the Crystal Dowser and instructions.",
            "Get a Prelate Key from the Tonberry Stabbers on Maps 3/4 of the Temple of Uggalepih (Tonberry Choppers in Yhoator Jungle and Tonberry Slashers in the Den of Rancor also drop it). Only one person needs one: once someone is past the door, they can open it for the rest.",
            "Make your way to the door at (I-10) on Map 2, which opens only after the Temple Guardian is defeated (it stays open for 15 minutes after someone kills it). The Temple of Uggalepih Geomagnetic Fount is closest, or take the Survival Guide, exit to Yhoator Jungle and come back in through entrance #3 to land on Map 2.",
            "Cross the big room, go upstairs and open the door at (J-10) with the Prelate Key.",
            "In the south hallway, examine the three ??? in any order: from west to east, in the first (G-10), third (H-10) and fourth (I-10) rooms. Each gives a Piece of a broken key; the fourth room has several ???, so make sure you get the key item message. Every party member needs all three pieces.",
            "With all three pieces, examine the second door (H-10) to spawn two Doll NMs, Nio-Hum and Nio-A (about 6,500 HP each, can't be slept, aggressive to magic). Use Sneak before spawning them to pull one at a time.",
            "After the Dolls are defeated, examine the door again for a cutscene about failing to find the sword; that is the right one, and you can warp out.",
            "Return to Chateau d'Oraguille and examine the Great Hall door for a cutscene, Rank 9 and 80,000 gil.",
        },
    },

    -- ========================================================
    -- RANK 9
    -- ========================================================

    ['9-1'] = {
        name = "Breaking Barriers",
        rank = 9,
        number = '9-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Travel to Chateau d'Oraguille and examine the " .. ACTOR.GREAT_HALL.text .. ".",
            "The three objectives must be completed in order. Before entering Eldieme Necropolis alone, obtain a Magicked Astrolabe from Churano-Shurano in Windurst Waters (F-8) to open the required doors.",
            "First, travel to Cape Teriggan and reach the Valley of Sorrows entrance at (J-8). Then examine " .. ACTOR.VALLEY_OF_SORROWS_QQ_I8.text .. " to receive the Figure of Titan.",
            "Next, travel to Xarcabard and examine " .. ACTOR.XARCABARD_QQ_H7.text .. " near the clustered trees to receive the Figure of Garuda.",
            "Finally, enter the southern Eldieme Necropolis entrance from Batallia Downs at (I-10).",
            "Reach the southern room and drop through the center hole at (G-9), then follow the route through Maps 2 and 3 and exit back to Batallia Downs at (J-9).",
            "Reach " .. ACTOR.BATALLIA_BREAKING_BARRIERS_QQ_J11.text .. " near the Stone Monument and examine it to face Suparna and Suparna Fledgling.",
            "Defeat both, then examine the same target again to receive the Figure of Leviathan.",
            "Return to Chateau d'Oraguille and examine the " .. ACTOR.GREAT_HALL.text .. ".",
        },
    },

    ['9-2'] = {
        name = "The Heir to the Light",
        rank = 9,
        number = '9-2',
        mission_type = 'BCNM',
        reward = "Rank 10, 100,000 gil, San d'Orian Flag, Ability to buy Atma of the Heir",
        steps = {
            "Speak with " .. ACTOR.SANDORIA_GATE_GUARD.text .. ".",
            "Zone into Northern San d'Oria for the Rites of Succession.",
            "Zone into Chateau d'Oraguille.",
            "Travel to Fei'Yin and continue to " .. ACTOR.QU_BIA_ARENA.text .. ".",
            "Enter The Heir to the Light battlefield. The first battle consists of Death Clan Destroyer, Yukvok of Clan Death, three Worgbut of Clan Death, three Rallbrog of Clan Death, and three Vangknok of Clan Death.",
            "Defeat the first group, then continue to the second battle with Prince Trion. Defeat Warlord Rojgnoj, Rojgnoj's Left Hand, and Rojgnoj's Right Hand.",
            "Zone into Northern San d'Oria.",
            "Return to Chateau d'Oraguille and examine the " .. ACTOR.GREAT_HALL.text .. ".",
            "Travel to King Ranperre's Tomb and examine " .. ACTOR.HEAVY_STONE_DOOR.text .. ".",
            "Return to Chateau d'Oraguille and speak with " .. ACTOR.HALVER.text .. ".",
            "Return to Northern San d'Oria and visit the Papal Chambers to learn what happened to Shamonde.",
            "Zone into Southern San d'Oria for the final epilogue.",
        },
    },

}

return M
