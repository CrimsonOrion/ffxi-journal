--[[
    Windurst - Mission Database
    =============================

    M.MISSIONS:
        Official numeric mission IDs.

    M.STEPS:
        Walkthrough entries using the existing walkthrough IDs.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'The Horutoto Ruins Experiment',
    [1] = 'The Heart of the Matter',
    [2] = 'The Price of Peace',
    [3] = 'Lost for Words',
    [4] = 'A Testing Time',
    [5] = 'The Three Kingdoms',

    -- The Three Kingdoms is split into legs by the game. The step text
    -- is the matching half of walkthrough 2-3, embedded here because
    -- two of the names repeat and cannot be matched by name.
    --
    -- 6 = San d'Oria visited first, 7 = Bastok visited first,
    -- 8 = San d'Oria visited second, 9 = Bastok visited second.

    [6] = {
        name = 'The Three Kingdoms (San d\'Oria)',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Northern San d'Oria and speak with Heruze-Moruze, then Helaku at (K-10).",
            "Speak with Halver (I-9) when directed.",
            "Travel to Ghelsba Outpost and defeat Warchief Vatgit.",
            "Return to Northern San d'Oria and speak with Kasaroro.",
            "Travel to Bastok to continue with the second leg.",
        },
    },

    [7] = {
        name = 'The Three Kingdoms (Bastok)',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Bastok and speak with " .. ACTOR.PATT_POTT.text,
            "Speak with Pius at (J-8), then Grohm at (G-9).",
            "Travel to Palborough Mines and obtain Mine Gravel from a Mythril Seam at (F-7) or (I-8).",
            "Place the Gravel in the Refiner, operate the levers as required, and obtain Mythril Sand.",
            "Return to Metalworks and trade the Mythril Sand to " .. ACTOR.PATT_POTT.text,
            "Travel to Northern San d'Oria to continue with the second leg.",
        },
    },

    [8] = {
        name = 'The Three Kingdoms (San d\'Oria)',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Travel to Northern San d'Oria and speak with Kasaroro at (H-9).",
            "Speak with " .. ACTOR.HALVER.text,
            "Enter Horlais Peak and complete the required battlefield.",
            "Return to Northern San d'Oria and speak with Kasaroro again.",
            "Return to Kupipi in Heavens Tower to complete the mission.",
        },
    },

    [9] = {
        name = 'The Three Kingdoms (Bastok)',
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Return to Bastok and speak with " .. ACTOR.PATT_POTT.text,
            "Speak with Pius at (J-8), then Grohm at (G-9).",
            "Travel to Palborough Mines and enter Waughroon Shrine from the upper level at (H-10).",
            "Complete the required battlefield.",
            "Return to Patt-Pott (I-7) in Metalworks.",
            "Return to Kupipi in Heavens Tower to complete the mission.",
        },
    },
    [10] = 'To Each His Own Right',
    [11] = 'Written in the Stars',
    [12] = 'A New Journey',
    [13] = 'Magicite',
    [14] = 'The Final Seal',
    [15] = 'The Shadow Awaits',
    [16] = 'Full Moon Fountain',
    [17] = 'Saintly Invitation',
    [18] = 'The Sixth Ministry',
    [19] = 'Awakening of the Gods',
    [20] = 'Vain',
    [21] = 'The Jester Who\'d Be King',
    [22] = 'Doll of the Dead',
    [23] = 'Moon Reading',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- RANK 1
    -- ========================================================

    ['1-1'] = {
        name = "The Horutoto Ruins Experiment",
        rank = 1,
        number = '1-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Travel to the Orastery in Port Windurst and speak with " .. ACTOR.HAKKURU_RINKURU.text .. ".",
            "Travel to East Sarutabaruta and enter Inner Horutoto Ruins through the eastern magic tower.",
            "Proceed to the Cracked Wall at (H-9) and examine it to enter the passage.",
            "Continue to the Gate: Magical Gizmo at (I-9) and examine it.",
            "Search the six Ancient Magical Gizmos until one yields the Cracked Mana Orb.",
            "Return to " .. ACTOR.HAKKURU_RINKURU.text .. " with the orb.",
        },
    },

    ['1-2'] = {
        name = "The Heart of the Matter",
        rank = 1,
        number = '1-2',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Travel to the Manustery in Windurst Woods and speak with " .. ACTOR.APURURU.text .. ".",
            "Apururu gives you the six Dark Mana Orb key items. If you have a Windurst Trust permit, talk to her twice.",
            "Go to East Sarutabaruta (J-11) and speak with Pore-Ohre at the entrance of Marguerite Tower for the key item Southeastern star charm; without it you can't energize the orbs.",
            "Enter the tower (Outer Horutoto Ruins) and examine the pedestals to place the Mana Orbs. The Cracked Walls along the north and south sides hide rooms with two more pedestals.",
            "Pass through the eastern Cracked Wall and examine the Gate: Magical Gizmo for the event.",
            "Retrieve the six Glowing Mana Orbs from the pedestals.",
            "Leave the tower into East Sarutabaruta for a cutscene.",
            "Return to " .. ACTOR.APURURU.text .. ".",
        },
    },

    ['1-3'] = {
        name = "The Price of Peace",
        rank = 1,
        number = '1-3',
        mission_type = 'Quest',
        reward = "Rank 2, 1,000 gil",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Travel to the roof of the Rhinostery in Windurst Waters (J-8), near Home Point #3, and speak with " .. ACTOR.LEEPE_HOPPE.text .. " for the Food Offering and Drink Offering.",
            "Travel to Giddeus from West Sarutabaruta (F-8) (Home Point #1 puts you at (G-12)). Take every left turn from the Sarutabaruta entrance to " .. ACTOR.LAA_MOZI.text .. " at (H-7) and hand over the Food Offering.",
            "Return to the entrance and take every right turn to " .. ACTOR.GHOO_PAKYA.text .. " at (G-7) for the Drink Offering.",
            "Return to the Rhinostery; you get a cutscene as you climb the stairs to the roof (speak with " .. ACTOR.LEEPE_HOPPE.text .. " if not).",
            "Return to " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
        },
    },

    -- ========================================================
    -- RANK 2
    -- ========================================================

    ['2-1'] = {
        name = "Lost for Words",
        rank = 2,
        number = '2-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Tosuka-Porika in the Optistery of Windurst Waters (G-8, east door, near Home Point #1).",
            "Speak with Nanaa Mihgo in Windurst Woods (J-3) to borrow the key item Lapis monocle. Talk to her again if she mentions other quests first.",
            "Enter the Maze of Shakhrami from Tahrongi Canyon (K-5); the Survival Guide puts you at its entrance. Many monsters detect sound and the Goblins detect sight, so keep Sneak and Invisible up at low level.",
            "Go to (G-6) on Map 1 to drop to Map 2, then examine the Fossil Rocks until you get the key item Lapis coral. There are 14 on Map 2: 4 in the room at (H-5), 2 at (I-7), 6 in the large room at (F-7)/(G-7)/(G-8) including one at (F-8), and 2 at (I-8).",
            "Return to Nanaa Mihgo for the key item Hideout key.",
            "Enter Inner Horutoto Ruins through the Lily Tower in East Sarutabaruta (J-7). In the southwest room with an Ancient Magical Gizmo, go through the Cracked Wall at (G-9) to Map 2 and make your way to (G-8). The monsters there are level 90+ and can detect low HP, so use Sneak and Invisible and stay above 75% HP.",
            "Examine the Mahogany Door at (G-8) for a cutscene.",
            "Go to the House of the Hero in Windurst Walls (G-3) and examine its door for a cutscene.",
            "Return to Tosuka-Porika in the Optistery to complete the mission.",
        },
    },

    ['2-2'] = {
        name = "A Testing Time",
        rank = 2,
        number = '2-2',
        mission_type = 'Repeatable',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Moreno-Toeno in the Aurastery of Windurst Waters (L-6) for the key item Creature Counter.",
            "First time: within 24 game hours (1 Earth hour), defeat at least 30 monsters in Tahrongi Canyon. When repeating the mission, the area is Buburimu Peninsula and you have 48 game hours (2 Earth hours).",
            "Return to Moreno-Toeno and speak with him during the final game hour of the time limit, counted from the minute you accepted (e.g. accepted at 11:30, report between 11:30 and 12:30 the next game day). Earlier, he tells you the time left; later, the mission fails.",
        },
    },

    ['2-3'] = {
        name = "The Three Kingdoms",
        rank = 2,
        number = '2-3',
        mission_type = 'BCNM',
        reward = "Rank 3, 3,000 gil, Adventurer's Certificate",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.KUPIPI.text .. " in Heavens Tower.",

            "Bastok Path:",
            "Travel to Bastok and speak with " .. ACTOR.PATT_POTT.text .. ".",
            "Speak with Pius at (J-8), then Grohm at (G-9).",
            "Travel to Palborough Mines and obtain Mine Gravel from a Mythril Seam at (F-7) or (I-8).",
            "Place the Gravel in the Refiner, operate the levers as required, and obtain Mythril Sand.",
            "Return to Metalworks and trade the Mythril Sand to " .. ACTOR.PATT_POTT.text .. ".",
            "Travel to Northern San d'Oria and speak with Kasaroro at (H-9).",
            "Speak with " .. ACTOR.HALVER.text .. ".",
            "Enter Horlais Peak and complete the required battlefield.",
            "Return to Northern San d'Oria and speak with Kasaroro again.",

            "San d'Oria Path:",
            "Travel to Northern San d'Oria and speak with Heruze-Moruze, then Helaku at (K-10).",
            "Speak with " .. ACTOR.HALVER.text .. " when directed.",
            "Travel to Ghelsba Outpost and defeat Warchief Vatgit.",
            "Return to Northern San d'Oria and speak with Kasaroro.",
            "Return to Bastok and speak with " .. ACTOR.PATT_POTT.text .. ".",
            "Speak with Pius at (J-8), then Grohm at (G-9).",
            "Enter Waughroon Shrine and complete the required battlefield.",
            "Return to " .. ACTOR.PATT_POTT.text .. ".",

            "Return to " .. ACTOR.KUPIPI.text .. " after both paths are complete.",
        },
    },

    -- ========================================================
    -- RANK 3
    -- ========================================================

    ['3-1'] = {
        name = "To Each His Own Right",
        rank = 3,
        number = '3-1',
        mission_type = 'Quest',
        reward = "Rank Points, Starway Stairway bauble",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Kupipi in Heavens Tower for the key item Starway Stairway bauble, which opens the door on the left to the upper floors.",
            "Speak with Rhy Epocan at the top of Heavens Tower for a cutscene. The blue teleporter there takes you back down.",
            "Speak with Hakkuru-Rinkuru in the Orastery of Port Windurst (E-7, near Home Point #1).",
            "Go to Castle Oztroja (I-8, first map) and drop through the trap door for a cutscene. Stand between the two levers there and pull one: one opens the door and the other the trap door, and they swap randomly. You must pull the lever yourself; others on the mission should stand back and each pull it after the trap door closes.",
            "Return to Rhy Epocan at the top of Heavens Tower to complete the mission.",
        },
    },

    ['3-2'] = {
        name = "Written in the Stars",
        rank = 3,
        number = '3-2',
        mission_type = 'Repeatable',
        reward = "Rank Points, Portal charm",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Zubaba on the second floor of Heavens Tower for the key item Charm of light.",
            "Enter Inner Horutoto Ruins through the tower at East Sarutabaruta (J-7) (the Survival Guide's tower) and get past the Three Mage Gate.",
            "Continue to the small room at (G-7) on Map 4 and examine the Gate of Light for a cutscene.",
            "Return to Zubaba in Heavens Tower to finish the mission. Afterwards, trade a Rolanberry to Kupipi for the key item Portal charm.",
            "If you are repeating this mission, or skipped it and ranked past it: instead, trade Zubaba 3 Rusty Daggers (Auction House, or from the Wendigos past the Three Mage Gate).",
        },
    },

    ['3-3'] = {
        name = "A New Journey",
        rank = 3,
        number = '3-3',
        mission_type = 'Fight',
        reward = "Rank 4, 5,000 gil",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Examine the Vestal Chamber door at the top of Heavens Tower for a cutscene and the key item Letter to the ambassador.",
            "Speak with Pakh Jatalfih at the Windurstian Embassy in Ru'Lude Gardens (I-9) for a cutscene.",
            "Go to Lower Delkfutt's Tower (entrance at Qufim Island F-6) and examine the Cermet Door at (E-8) on Map 1 to enter the basement. If you have a Delkfutt Key item, trade it to the door for the key item Delkfutt key. Without one, a party member who has the key can take you through, or you must get one from the top of the tower.",
            "Short way to the key: from the basement, open the door at (J-8) to go up to Upper Delkfutt's Tower, walk forward and examine the ??? at the foot of the stairs to be teleported to the NM Porphyrion. You can skip the fight and examine the shimmering ??? by the elevator for the key item Delkfutt key, then take the elevator and go down the spiral stairs two zones back to the basement.",
            "Long way: climb all 10 floors from the Qufim Island entrance (about 15 minutes). Bats and Dancing Weapons detect sound, Goblins and Giants sight, Pots and Dolls magic; below level 50 bring Sneak and Invisible. The Delkfutt Key drops from Porphyrion at the top.",
            "In the basement, examine the Cermet Door at (L-7) for a cutscene. Another player using a key for you does not work here.",
            "Return to the Windurstian Embassy in Ru'Lude Gardens and examine the Door: Windurstian Emb. (the third door inside) for a cutscene that completes the mission.",
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
            "Speak with " .. ACTOR.PAKH_JATALFIH.text .. " in the Windurstian Embassy and enter the Ambassador's room.",
            "Examine the Audience Chamber door.",
            "Speak with " .. ACTOR.ALDO.text .. " in Neptune's Spire.",

            "If this is your first Magicite mission, speak with " .. ACTOR.PAYA_SABYA.text .. ".",
            "Speak with " .. ACTOR.MUCKVIS.text .. ".",
            "Speak with " .. ACTOR.SATTAL_MANSAL.text .. " in Lower Jeuno and obtain the required key items.",
            "Trade Coeurl Meat to " .. ACTOR.BAUDIN.text .. " in Upper Jeuno to obtain the Crest of Davoi.",

            "Visit the three magicite locations in any order.",
            "Davoi (G-7): pass through the Wall of Dark Arts, enter Monastic Cavern, and examine the Magicite at (F-6) to obtain the magicite.",
            "Castle Oztroja (entrance in Meriphataud Mountains, L-8): go to the Brass Door at (I-8). One of the two levers beside it opens the door, the other opens a trap door into a pit. Stand between the levers, pull one and step back at once: if the door opens, run through; if the trap opens, wait for it to close and pull the other lever. If you get \"Target is out of range\", shift your position a little.",
            "Go upstairs to Map 2 and head to (G-7), which leads out to a courtyard (Map 6). Head north, without falling off, to the hallway entrance at (I-7) into Map 7.",
            "Follow the right wall to the door at (H-9) (the monsters here are much higher level) and light the Torch to pass through. Head south and turn right to another Brass Door and open it; the zone line is just past it, so run if you have aggro.",
            "In the Altar Room (no monsters), examine the Magicite to receive Magicite: Orastone. If you only get a message that the magicite glows ominously, you are missing the Yagudo torch key item.",
            "Beadeaux: follow the left wall to the tunnel at (H-7), enter Qulun Dome, and obtain the magicite.",

            "Return to the Audience Chamber and obtain the Letter to Jeuno.",
            "Return to " .. ACTOR.PAKH_JATALFIH.text .. " to complete the mission.",
        },
    },

    -- ========================================================
    -- RANK 5
    -- ========================================================

    ['5-1'] = {
        name = "The Final Seal",
        rank = 5,
        number = '5-1',
        mission_type = 'BCNM',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Examine the Vestal Chamber door at the top of Heavens Tower to start the mission and receive the key item New Fei'Yin seal.",
            "Go to Fei'Yin, in the northeast corner of Beaucedine Glacier, for a cutscene with Zeid. Home Point #1 in Fei'Yin puts you right by Qu'Bia Arena; Unity Warp (level 128) puts you at the Fei'Yin entrance. Most monsters here detect by sound, a few by spellcasting. If you are low level, bring Trusts or a party of level 50+ players.",
            "From the Fei'Yin entrance go east to (K-8) on map 1 and open the Cermet Portal between the two Dolls to enter Qu'Bia Arena. All your buffs wear off when you enter, so plan accordingly.",
            "Examine the Burning Circle to enter the BCNM \"The Rank 5 Mission\". You only need to defeat Archlich Taber'quoan, a Black Mage who casts Sleepga II and Freeze and may use Manafont. He starts with two Ancient Sorcerers, and Ancient Warriors run in from the hallway to help; the skeletons have little HP and take extra damage from blunt weapons. Winning gives a cutscene and the key item Burnt seal.",
            "Return to Heavens Tower and examine the Vestal Chamber door at the top to complete the mission.",
        },
    },

    ['5-2'] = {
        name = "The Shadow Awaits",
        rank = 5,
        number = '5-2',
        mission_type = 'BCNM',
        reward = "Rank 6, 20,000 gil, Unlock Zilart Missions, Unlock Dynamis",
        steps = {
            "Enter the Vestal Chamber at the top of Heavens Tower.",
            "If you don't use Trusts and are level 55-60, bring a full party. Castle Zvahl is on the far west side of Xarcabard (D-7/8); Castle Zvahl Keep Home Point #1 takes you closest.",
            "Castle Zvahl Baileys: follow the one-way path to the first intersection, turn right, go north then west and down a short flight of stairs, turn left and follow the right wall to the next map. There, go to the top right corner and up the stairs, cross to the top left and back down, work into the central courtyard, go back up and through the gate on the right to a long hall with a large staircase.",
            "Castle Zvahl Keep: turn right out of the hallway and pass a few gates (the monsters here detect sight). From the upper level, follow the narrow path to more stairs and the teleporters. Stand in the middle of each one until it activates (this drops Invisible); after four of them, go to the west middle of the new map and through the door into the Throne Room.",
            "Gather at the far side of the Throne Room, then examine the door to enter the battlefield \"The Shadow Lord Battle\". In his first form he switches between physical and magic immunity: rest MP while he is immune to magic (he uses Dark Nova and black magic then) and stop melee while he is immune to physical attacks (Giga Slash, Kick Back, Umbra Smash).",
            "After a cutscene the second form starts at once: about 4,000 HP, only AoE attacks and no immunity switching. Use your two-hour abilities and Curaga freely. Winning gives a cutscene and the key item Shadow fragment, and you are returned to the Castle Zvahl Baileys entrance.",
            "Zone into Heavens Tower for a short cutscene, then examine the Vestal Chamber door at the top for Rank 6 and 20,000 gil.",
            "Speak with Apururu in Windurst Woods (H-9) to learn Trust: Ajido-Marujido.",
        },
    },

    -- ========================================================
    -- RANK 6
    -- ========================================================

    ['6-1'] = {
        name = "Full Moon Fountain",
        rank = 6,
        number = '6-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Hakkuru-Rinkuru in the Orastery of Port Windurst (near Home Point #1) for a cutscene and the key item Southwestern star charm. You will need to get past the Three Mage Gate later, so get the Portal charm from Kupipi first (see Mission 3-2) or go with other players.",
            "Enter Outer Horutoto Ruins through the southwestern tower (Dahlia Tower) in West Sarutabaruta (F-11); you arrive on Map 4.",
            "Examine the Cracked Wall at (I-8).",
            "Examine the second Cracked Wall at (J-8).",
            "Find the Gate: Magical Gizmo and examine it to spawn four Jack Cardians: Jack of Batons (BLM), Jack of Coins (RDM), Jack of Cups (WHM) and Jack of Swords (PLD). They detect magic, so keep mages back; they don't link with each other but do link with other Cardians in the area.",
            "Either defeat all four, or pull one and let the others despawn before you defeat it; otherwise the door gives no cutscene.",
            "Examine the Gate: Magical Gizmo again for a cutscene. If you see \"A mysterious force is interfering\", wait until the NMs have fully despawned and try again.",
            "Enter Full Moon Fountain from Toraimarai Canal Map 1 (Toraimarai Canal Home Point #1 is closest) for a cutscene that completes the mission.",
        },
    },

    ['6-2'] = {
        name = "Saintly Invitation",
        rank = 6,
        number = '6-2',
        mission_type = 'BCNM',
        reward = "Rank 7, 40,000 gil, Ashura Necklace",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Examine the Vestal Chamber door at the top of Heavens Tower for a cutscene, the key item Holy One's invitation and the title Hero on Behalf of Windurst.",
            "Go to Balga's Dais in Giddeus (Giddeus Home Point #1 is closest) and enter the battlefield \"Saintly Invitation\". Only players on or past this mission can enter.",
            "Defeat four Yagudo NMs that use their two-hour abilities: Nuu Kofu the Gentle (WHM), Chaa Paqa the Profound (SMN), Buu Xolo the Bloodfaced (SAM) and Juu Zeni the Poisonmist (NIN). They can be slept; fight WHM, SMN, SAM, then NIN, pulling the White Mage away so Benediction doesn't wake the others. Winning gives the key item Balga champion certificate.",
            "Go to Castle Oztroja (the Survival Guide puts you at the main entrance). Through the first Brass Door (I-8), stand between the two levers and pull one: one opens the door, the other a trap door, and they swap daily. Go upstairs to Map 2.",
            "On Map 2, go west to the Brass Door at (G-8), which opens with the right combination of its 4 levers (you can just try them until it opens). Go upstairs to Map 3 and straight on to Map 4.",
            "On Map 4, defeat Yagudo Flagellants until one drops a Judgment Key.",
            "Open the large Brass Door by lighting the unlit Torch in one of the four corner rooms, then solve the Brass Statue's password to open the trap door and drop down.",
            "Past a Yagudo High Priest (true sight), trade the Judgment Key to the smaller Brass Door on the platform. The key is used up, so make sure your whole party goes through before it closes.",
            "Speak with Kaa Toru the Just inside for the key item Holy One's oath and an Ashura Necklace.",
            "Return to the Vestal Chamber.",
        },
    },

    -- ========================================================
    -- RANK 7
    -- ========================================================

    ['7-1'] = {
        name = "The Sixth Ministry",
        rank = 7,
        number = '7-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Tosuka-Porika in the Optistery of Windurst Waters (G-8, near Home Point #1) for a cutscene and the key item Optistery ring.",
            "Go to Toraimarai Canal Map 2 (G-8). Quickest: through the Priming Gate in Windurst Walls (I-3) with the Rhinostery certificate, right at the bottom of the stairs, into the water and keep turning left to some stairs, go up, then south, east and north to (G-8). Toraimarai Canal Home Point #1 also works.",
            "Defeat the four Hinge Oils in the room (they respawn after 16 minutes; all four must be dead to enter).",
            "Go northeast up the stairs at (H-8) and examine the Marble Door at the top to enter the Animastery.",
            "Examine the Tome of Magic on the floor near the desk and the skull on a chair for a cutscene.",
            "Return to Tosuka-Porika to complete the mission and receive the key item Blank Book of the Gods.",
        },
    },

    ['7-2'] = {
        name = "Awakening of the Gods",
        rank = 7,
        number = '7-2',
        mission_type = 'Fight',
        reward = "Rank 8, 60,000 gil",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.LEEPE_HOPPE.text .. " on the roof of the Rhinostery in Windurst Waters.",
            "Speak with Kerutoto in the northern Rhinostery building for the cutscene about Leepe-Hoppe and Rukususu (it can take three or more tries). If she keeps giving the Diabolos cutscene, accept that quest and talk to her twice more.",
            "Travel to Kazham and speak with " .. ACTOR.ROMAA_MIHGO.text .. " in Mihgo's Residence.",
            "Go to the Temple of Uggalepih: take the Yhoator Jungle outpost warp, Unity Warp or Survival Guide, run to the Bloodlet Spring entrance of the Den of Rancor (J-7), and follow the right wall to zone into the Temple on Map 3.",
            "Go upstairs and follow the left wall to the room at (J-9) and defeat Bonze Marberry for a Cursed Key. It drops 2 keys per kill and respawns every 5 minutes; everyone needs one, and it won't drop if you already have one. It uses Everyone's Rancor, so reset your Tonberry Hate first if it is high and you are low level.",
            "Trade the Cursed Key to the Granite Door at (J-6) on the same map for a cutscene and the key item Book of the Gods.",
            "Return to " .. ACTOR.LEEPE_HOPPE.text .. " on the roof of the Rhinostery.",
        },
    },

    -- ========================================================
    -- RANK 8
    -- ========================================================

    ['8-1'] = {
        name = "Vain",
        rank = 8,
        number = '8-1',
        mission_type = 'Fight',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Moreno-Toeno in the Aurastery of Windurst Waters (L-6, near Home Point #2) for a cutscene and the key item Star Seeker.",
            "Examine the Qu'Hau Spring in Ro'Maeve (H-6) for a cutscene; the Ro'Maeve Survival Guide is fastest.",
            "Go to Davoi (the Proto-Waypoint or Survival Guide is fastest) and enter Monastic Cavern by entrance 2 at (H-11). Leave it by exit 4 at (I-8), follow the road west around the hill to a wooden elevator and pull its lever to reach the monastery.",
            "Inside, past two Oak Doors, defeat Dirtyhanded Gochakzuk on its throne for a Curse Wand. It drops 2 per kill and respawns every 5 minutes; everyone needs one, and it won't drop if you already have one.",
            "Take the elevator back down and cross the bridge off the island (don't drop into the river). Continue to Sedal-Godjal at (J-8) and speak with him until he turns your key item into the Magic-drained Star Seeker.",
            "Trade the Curse Wand to " .. ACTOR.SEDAL_GODJAL.text .. " for a cutscene.",
            "Return to " .. ACTOR.MORENO_TOENO.text .. ".",
        },
    },

    ['8-2'] = {
        name = "The Jester Who'd Be King",
        rank = 8,
        number = '8-2',
        mission_type = 'Fight',
        reward = "Rank 9, 80,000 gil",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with Apururu in the Manustery of Windurst Woods (Home Point #1) for a cutscene and the key item Manustery ring.",
            "In any order, collect the other three rings. Rukususu: in Fei'Yin (F-6) on Map 2, examine the Cermet Door of the north-western small room (Fei'Yin Home Point #2 is closest).",
            "Sedal-Godjal: in Davoi (J-8), reached through Monastic Cavern; enter it by entrance 2 at (H-11), hug the right wall to exit at (H/I-8), then go east.",
            "Tosuka-Porika: in the Optistery of Windurst Waters (near Home Point #1).",
            "Return to Apururu with all three rings for dialogue about the last ring.",
            "Speak with Kupipi in Heavens Tower for a cutscene.",
            "Enter Outer Horutoto Ruins through the tower in West Sarutabaruta (F-4) (the Voidwatch warp or the Geomagnetic Fount is closest) and go through the Cracked Wall at (I-6).",
            "Examine the Cracked Wall at (G-8) to spawn Queen of Coins and Queen of Swords.",
            "Defeat both Cardian NMs.",
            "Examine the Cracked Wall again (several times if needed) for a cutscene and the key item Orastery ring.",
            "Return to Apururu for a cutscene.",
            "Speak with Shantotto in Windurst Walls (K-7) for a cutscene and the key item Glove of perpetual twilight (it may take a few tries).",
            "Return to Apururu for a cutscene.",
            "Examine the Gate of Darkness (south-eastern door, I-7) on Map 4 of Inner Horutoto Ruins for a cutscene. Fastest is the Toraimarai Canal Survival Guide and back through the canal (or the Priming Gate in Windurst Walls H-3); entering through the Ruins means passing the Three Mage Gate.",
            "Return to Apururu for a cutscene that completes the mission.",
        },
    },

    -- ========================================================
    -- RANK 9
    -- ========================================================

    ['9-1'] = {
        name = "Doll of the Dead",
        rank = 9,
        number = '9-1',
        mission_type = 'Quest',
        reward = "Rank Points",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Speak with " .. ACTOR.APURURU.text .. " in Windurst Woods.",
            "Zone into Heavens Tower for a cutscene, then examine the Vestal Chamber door at the top for a cutscene with the Star Sibyl.",
            "Return to " .. ACTOR.APURURU.text .. ".",
            "Obtain Goobbue Humus. It drops from Goobbue Gardeners in The Sanctuary of Zi'Tah (13 of them in the north-east and south-east, 5-minute respawn, Treasure Hunter helps; Unity Warp level 122 goes there) and Old Goobbues in The Boyahda Tree.",
            "Trade the Goobbue Humus to the lone Mandragora Warden in the hidden area of The Boyahda Tree Map 1 (F-4) (not the pair) for a cutscene and the key item Letter from Zonpa-Zippa.",
            "Return to " .. ACTOR.APURURU.text .. ".",
            "Zone into Full Moon Fountain (Toraimarai Canal Home Point #1 is closest) for a cutscene that completes the mission.",
        },
    },

    ['9-2'] = {
        name = "Moon Reading",
        rank = 9,
        number = '9-2',
        mission_type = 'BCNM',
        reward = "Rank 10, 100,000 gil, Windurstian Flag, Ability to buy Atma of the Full Moon",
        steps = {
            "Speak with " .. ACTOR.WINDURST_GATE_GUARD.text .. ".",
            "Enter the Vestal Chamber at the top of Heavens Tower.",
            "Collect three key items in any order. Ancient Verse of Ro'Maeve: examine the Qu'Hau Spring in Ro'Maeve (H-6) (the Survival Guide is closest).",
            "Ancient Verse of Altepa: zone into the Chamber of Oracles (Quicksand Caves Home Point #1 is quickest). Otherwise enter Quicksand Caves from Western Altepa Desert (D-12) with Sneak, open the weighted door at (I-9) (3 points: Galka 3, Hume/Elvaan/Mithra 2, Tarutaru 1; the Loadstone from Open Sesame opens it solo) and keep left.",
            "Ancient Verse of Uggalepih: get an Uggalepih Key from the Tonberry Cutters on Map 2 of the Temple of Uggalepih, open the Granite Door with it and examine the ??? at (E-8) on Map 2. Unity Warp (level 125) is quickest; at level 75+ nothing aggroes.",
            "Return to the Vestal Chamber door in Heavens Tower for a cutscene.",
            "Go to Full Moon Fountain (Toraimarai Canal Home Point #1) for a two-part battlefield. If you use an addon that skips cutscenes (Enternity, FastCS) or run at 60 FPS, turn it off for this fight. Part 1: four Ace Cardians; Sleepga them and kill Ace of Batons (BLM), Ace of Swords (PLD), then Ace of Coins (RDM), and rest before the last one, Ace of Cups (WHM).",
            "Part 2: a Wyvern and a Manticore, fought alongside Ajido-Marujido. If he dies you lose, so keep him cured and pull the NMs off him.",
            "Return to the Vestal Chamber door for a cutscene, then examine it again for the final cutscene with the Star Sibyl, ending the Windurst storyline. If the game crashed after the fight and the door gives no cutscene, examine the glowing spot just outside Heavens Tower instead.",
        },
    },
}

return M