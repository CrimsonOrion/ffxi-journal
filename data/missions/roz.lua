--[[
    Rise of the Zilart - Mission Database
    ======================================

    Mission IDs and walkthrough IDs are intentionally kept
    as separate identifiers:

    - M.MISSIONS uses the official numeric mission IDs consumed
      by the mission tracker.
    - M.STEPS uses the original walkthrough IDs.

    Both databases are kept in this single file.
]]

local ACTOR = require('data.actors')

local M = {}

-- ============================================================
-- MISSION NAMES
-- ============================================================

M.MISSIONS = {
    [0] = 'The New Frontier',
    [2] = 'The Outlands',
    [4] = 'Welcome t\'Norg',
    [6] = 'Kazham\'s Chieftainess',
    [8] = 'The Temple of Uggalepih',
    [10] = 'Headstone Pilgrimage',
    [12] = 'Through the Quicksand Caves',
    [14] = 'The Chamber of Oracles',
    [16] = 'Return to Delkfutt\'s Tower',
    [18] = 'Ro\'Maeve',
    [20] = 'The Temple of Desolation',
    [22] = 'The Hall of the Gods',
    [23] = 'The Mithra and the Crystal',
    [24] = 'The Gate of the Gods',
    [26] = 'Ark Angels',
    [27] = 'The Sealed Shrine',
    [28] = 'The Celestial Nexus',
    [30] = 'Awakening',
    [31] = 'The Last Verse',
}

-- ============================================================
-- MISSION STEPS
-- ============================================================

M.STEPS = {

    -- ========================================================
    -- CHAPTER 1
    -- ========================================================

    ['0'] = {
        name = "The New Frontier",
        number = 1,
        mission_type = "Cutscene",
        reward = "Key Item: Map of Norg",
        steps = {
            "Reach Rank 6 in your home nation.",
            "Enter Norg.",
        },
    },

    ['2'] = {
        name = "The Outlands",
        steps = {
            "Continue to Norg after reaching Rank 6 in your home nation.",
            "Enter " .. ACTOR.NORG_OAKEN_DOOR_L8.text .. " in Norg.",
        },
    },

    ['4'] = {
        name = "Welcome t'Norg",
        number = 2,
        mission_type = "Cutscene",
        steps = {
            "Travel to Norg.",
            "Enter " .. ACTOR.NORG_OAKEN_DOOR_L8.text .. " for a cutscene with Gilgamesh. If you get a cutscene with Iroha for another mission instead, enter the door again afterwards.",
        },
    },

    ['6'] = {
        name = "Kazham's Chieftainness",
        number = 3,
        mission_type = "Cutscene",
        reward = "Key Item: Sacrificial Chamber key",
        steps = {
            "Travel to Kazham.",
            "Speak with Jakoh Wahcondalo in Kazham (J-9) for the key item Sacrificial Chamber key. Kazham Home Point #1 is right next to her house.",
        },
    },

    ['8'] = {
        name = "The Temple of Uggalepih",
        number = 4,
        mission_type = "Dungeon/BCNM",
        reward = "Key Item: Dark fragment",
        steps = {
            "Your goal is the Sacrificial Chamber, reached through the Den of Rancor. If you have a lot of Rancor (Tonberry enmity), lower it first with the quest Everyone's Grudge in Norg: the bosses use Everyone's Rancor.",
            "Fastest: if you have the Den of Rancor Home Point #1, warp there and walk into the Sacrificial Chamber. Anyone who has finished this mission can also warp there and open the door for you; reach it with Unity Warp (level 128) to the Den of Rancor and skip the lanterns entirely.",
            "Otherwise you need an Unlit Lantern (Rare, from Tonberry Jinxers in Yhoator Jungle, Tonberry Maledictors and Pursuers in the Temple of Uggalepih, or Tonberry Imprecators in the Den of Rancor). Without Unity Warp you also need the Paintbrush of souls to open the way from the Temple.",
            "Temple route: enter from Yhoator Jungle (J-11/12), go to the northwestern exit (F-5), turn left in Yhoator Jungle and re-enter at (H-11). Pass the Temple Guardian's door at (I-10) (kill it if it is up). At (I-7), whoever has the Paintbrush examines the empty frame, waits 30 seconds without moving or being attacked, and examines it again to open the door to the Den of Rancor.",
            "In the Den of Rancor (Sneak and Invisible), go to (E-5) on map 1 and trade your Unlit Lantern to the Altar of Rancor for a Rancor Flame. Drop down the hole in the northeast corner of (F-7) to map 2 and go to (E-5).",
            "Light all four lanterns outside the Sacrificial Chamber gate by trading each a Rancor Flame. You can only carry one at a time, so a solo player makes four trips; two players two trips, four players one.",
            "Past the gate, touch the Home Point to unlock it, then zone into the Sacrificial Chamber and examine the door to enter the battlefield \"The Temple of Uggalepih\". Buff inside, as buffs wear off on entering.",
            "Defeat Grav'iton (THF: Perfect Dodge, Everyone's Rancor, can't be slept), Molyb'iton (BLM: Manafont) and Tungs'iton (SMN: Astral Flow). Kill Grav'iton first while the other two are slept and silenced, then the Black Mage, then the Summoner quickly before Astral Flow. Winning gives a cutscene and the key item Dark fragment.",
        },
    },

    ['10'] = {
        name = "Headstone Pilgrimage",
        number = 5,
        mission_type = "Quest/Fight",
        reward = "Key Items: Earth fragment, Fire fragment, Ice fragment, Light fragment, Lightning fragment, Water fragment, Wind fragment",
        steps = {
            "Examine the seven required Cermet Headstones in any order (the Dark fragment came from Grav'iton in The Temple of Uggalepih). Stand close and check that you really got each key item: from too far away the game says \"You need to move closer\", which looks similar at a glance. Grab the Cloister Home Points on the way.",
            "Earth route: the Unity Warp (level 125) to Western Altepa Desert puts you on a rock above a crevasse; walk into it, turn right at the fork to the Ruby Column (press it down if it's up), go through the open door near the end and out into the square crevasse, turn left through the first open door, and head south-west to the headstone at (H-8)/(H-9). Otherwise enter Quicksand Caves at Western Altepa (J-9), drop down the sandpit at (K-6) on map 3 and follow the path back out.",
            "Examine " .. ACTOR.HEADSTONE_W_ALTEPA.text .. " to obtain the Earth fragment.",
            "Water route: enter Ordelle's Caves at La Theine Plateau (F-7) (or the Survival Guide), go east to exit B at (I-6) onto map 1, down to (G-8), east into the south tunnel (exit D) at (H-9), up the stairs and south to the second hole at the (H-11)/(H-12) border and drop down. Go east into tunnel E (map 3), south from (I-6) to (H-9) and west out to La Theine Plateau; the headstone is at the end of the valley at (G-11). The La Theine Geomagnetic Fount is on a ledge right there.",
            "Examine " .. ACTOR.HEADSTONE_LA_THEINE.text .. " to obtain the Water fragment.",
            "Examine " .. ACTOR.CLOISTER_OF_FROST.text .. " to obtain the Ice fragment.",
            "Examine " .. ACTOR.HEADSTONE_YUHTUNGA.text .. ", defeat Carthi and Tipha, then examine it again to obtain the Fire fragment.",
            "Examine " .. ACTOR.HEADSTONE_BEHEMOTH.text .. ", defeat Legendary Weapon and Ancient Weapon, then examine it again to obtain the Lightning fragment.",
            "Examine " .. ACTOR.HEADSTONE_CAPE_TERRIGAN.text .. ", defeat Axesarion the Wanderer, then examine it again to obtain the Wind fragment.",
            "Examine " .. ACTOR.HEADSTONE_ZITAH.text .. ", defeat Doomed Pilgrims, then examine it again to obtain the Light fragment.",
        },
    },

    ['12'] = {
        name = "Through the Quicksand Caves",
        number = 6,
        mission_type = "Dungeon/BCNM",
        steps = {
            "Obtain the Loadstone from the Open Sesame quest if entering the weight doors solo.",
            "If you are low level and not using Trusts, bring a party of level 65+. Mages need Echo Drops: all three bosses' Jamming Wave silences. Quicksand Caves Home Point #1 or the Quicksand Caves Proto-Waypoint (drop down and keep west) gets you to the Chamber of Oracles quickly.",
            "Everything in the caves detects sound, so use Sneak. Go to Western Altepa Desert (Unity Warp level 125 puts you at I-7), take the tunnel at (C/D-11) on the south side, and go down the ramp to enter Quicksand Caves at (D-12).",
            "Go to " .. ACTOR.WEIGHTED_DOOR_I9.text .. " and stand on the weight pad to open it (Galka 3 points, Hume/Elvaan/Mithra 2, Tarutaru 1; 3 needed). You still have to stand on the pad even with the Loadstone.",
            "Proceed west to " .. ACTOR.WEIGHTED_DOOR_H7.text .. " and use the second weight pad to pass through.",
            "In the next room, drop down the hole to a hidden area and head to (D-4) to zone into the Chamber of Oracles.",
            "Enter the battlefield against three Antica NMs: Centurio V-III (PLD, Invincible), Triarius V-VIII (BLM, Manafont) and Princeps V-XI (RNG, Eagle Eye Shot). Open with Sleepga, keep the Paladin and Black Mage silenced, kill the Paladin first (he rebuffs and wakes the others), then the Black Mage, then the Ranger. Winning moves you into another part of the Chamber of Oracles, starting the next mission.",
        },
    },

    ['14'] = {
        name = "The Chamber of Oracles",
        number = 7,
        mission_type = "Cutscene",
        reward = "Key Item: Prismatic fragment",
        steps = {
            "Examine all eight sections of " .. ACTOR.CHAMBER_OF_ORACLES.text .. " to place the eight fragments.",
        },
    },

    ['16'] = {
        name = "Return to Delkfutt's Tower",
        number = 8,
        mission_type = "Dungeon/BCNM",
        steps = {
            "Optional: speak with Aldo at the Tenshodo in Lower Jeuno for a cutscene.",
            "Zone into Lower Delkfutt's Tower from Qufim Island (or via the Survival Guide) for a cutscene.",
            "If you have a Delkfutt Key, go to (E-8), pass through the Cermet Door, and continue to the next Cermet Door at (J-8).",
            "Proceed to (H-8) and examine the ??? in the spiral staircase to reach the 10th floor.",
            "If you do not have a Delkfutt Key, climb the tower normally until you reach the 10th floor.",
            "Once in Upper Delkfutt's Tower, go to (F-8) on the first map and through the door (this area isn't shown on the map). Climb the stairs to the 11th floor with Sneak and Invisible (Bats and Giants; Dolls and Pots detect magic).",
            "Go to (J-6) up to the 12th floor, then to (F-10) and take the teleporter into " .. ACTOR.STELLAR_FULCRUM.text .. " for a cutscene. Upper Delkfutt's Tower Home Point #1 is right by this teleporter for later visits.",
            "Walk forward and examine " .. ACTOR.QEVLOVE_GATE.text .. " to enter the battlefield.",
            "Defeat Kam'lanaut (about 10,000 HP, immune to Sleep and Silence; buffs wear off on entering, Trusts allowed). Great Wheel does AoE damage and resets hate; Light Blade hits one target very hard but has a charge time, can be stunned and is blocked by Utsusemi. He casts Silencega, Dispelga and Slowga, and his Elemental Blade gives him an en-spell that makes him absorb that element, so dispel it or switch nukes.",
        },
    },

    ['18'] = {
        name = "Ro'Maeve",
        number = 9,
        mission_type = "Quest",
        steps = {
            "Optional: speak with Aldo at the Tenshodo in Lower Jeuno.",
            "Travel to Norg and examine the Oaken Door at (K-8), choosing \"Open the door\", for a cutscene with Lion and Gilgamesh. If another expansion's mission is active, make sure you pick this option.",
        },
    },

    ['20'] = {
        name = "The Temple of Desolation",
        number = 10,
        mission_type = "Cutscene",
        steps = {
            "Travel to Ro'Maeve. Everything there detects magic, so use Silent Oil and Prism Powder (or Sneak and Invisible cast at the zone line). Mounts work here. The Ro'Maeve Survival Guide puts you right by the Hall of the Gods; Unity Warp (level 125) puts you at the Ro'Maeve entrance.",
            "Go to (H-5) and zone into the Hall of the Gods. Run through the hallway and examine the Cermet Grate twice; the next mission starts.",
        },
    },

    ['22'] = {
        name = "The Hall of the Gods",
        number = 11,
        mission_type = "Quest",
        steps = {
            "Return to Norg after reaching the sealed grate in the Hall of the Gods.",
            "Open " .. ACTOR.NORG_OAKEN_DOOR.text .. " and speak with " .. ACTOR.GILGAMESH.text .. " about the Mithra carrying a mysterious crystal.",
        },
    },

    ['23'] = {
        name = "The Mithra and the Crystal",
        number = 12,
        mission_type = "Dungeon/Fight",
        reward = "Key Item: Cerulean crystal",
        steps = {
            "Travel to Rabao (Home Point #2).",
            "Speak with " .. ACTOR.MARYOH_COMYUJAH.text .. " in front of the windmill (G-7) and choose the top option, \"Sounds fair\" (don't skip through with Enter).",
            "Go to the secret Quicksand Caves entrance in Western Altepa Desert (C/D-11), the same one as in Through the Quicksand Caves, but this time you go to the other side of the map. Shortcuts: the Rabao Proto-Waypoint to Quicksand Caves, or Quicksand Caves Home Point #1 then east to exit 5 (H-4), drop off the ledge into the desert crevasse (D-10), and go south to the entrance.",
            "Reach " .. ACTOR.WEIGHTED_DOOR_K8.text .. " and use the pressure plate to pass through.",
            "Reach " .. ACTOR.WEIGHTED_DOOR_G8.text .. ", pass through, and drop into the lower room.",
            "Near where you land, examine the ??? (stand very close) and choose \"Yes\" to dig, spawning the Pot NM Ancient Vessel.",
            "Defeat Ancient Vessel.",
            "Examine " .. ACTOR.QUICKSAND_CAVES_MITHRA_QQ.text .. " again to obtain the Scrap of Papyrus.",
            "Return to Rabao and speak with " .. ACTOR.MARYOH_COMYUJAH.text .. " again to receive the Cerulean crystal.",
            "Return to the Hall of the Gods and examine the Cermet Grate for a cutscene, then examine it again to pass through.",
            "Go down the hallway and examine the Shimmering Circle for the last cutscene.",
        },
    },

    ['24'] = {
        name = "The Gate of the Gods",
        number = 13,
        mission_type = "Cutscene",
        reward = "Access to Tu'Lia",
        steps = {
            "Return to the Hall of the Gods and examine " .. ACTOR.HALL_OF_GODS_CERMET_GATE.text .. " again.",
            "Pass through the gate and continue to the shimmering light at the far end.",
            "Examine the shimmering light.",
            "Zone into Ru'Aun Gardens to unlock access to Tu'Lia.",
        },
    },

    ['26'] = {
        name = "Ark Angels",
        number = 14,
        mission_type = "BCNM",
        reward = "Key Items: Shard of Apathy, Shard of Arrogance, Shard of Cowardice, Shard of Envy, Shard of Rage; one of: Abyssal Earring, Beastly Earring, Bushinomimi, Knight's Earring, Suppanomimi",
        steps = {
            "Zone into Ru'Aun Gardens.",
            "Enter the Shrine of Ru'Avitau.",
            "To face all five Ark Angels at once, examine " .. ACTOR.SHRINE_RUAVITAU_BLANK_TARGET_H11.text .. " twice, then obtain an Ark Pentasphere.",
            "Use the red portals in Ru'Aun Gardens to reach the five La'Loff Amphitheater battlefields.",
            "Defeat Ark Angel HM, Ark Angel TT, Ark Angel MR, Ark Angel EV, and Ark Angel GK.",
            "Alternatively, use the Ark Pentasphere at La'Loff Amphitheater and defeat all five Ark Angels in the same battle.",
        },
    },

    ['27'] = {
        name = "The Sealed Shrine",
        number = 15,
        mission_type = "Cutscene",
        steps = {
            "Travel to Norg and speak with Gilgamesh by examining the Oaken Door at (K-8).",
            "If you finished the previous mission through Divine Might and haven't chosen your earring yet, pick it up first (or enter the Shrine from the (H-9) entrance to move your log on).",
            "Go back to Ru'Aun Gardens and enter the Shrine of Ru'Avitau through any entrance (or warp to its Home Point) for a cutscene. The (I-6) entrance, near Ru'Aun Gardens Home Point #1, is handiest for the next mission.",
        },
    },

    ['28'] = {
        name = "The Celestial Nexus",
        number = 16,
        mission_type = "Dungeon/BCNM",
        steps = {
            "The Shrine of Ru'Avitau is full of monsters that detect magic, so even mages should bring Silent Oil and Prism Powder (Ninjutsu or Spectral Jig also work).",
            "First, enter the Shrine through entrance A at (H-8) in Ru'Aun Gardens, go east then north to the room with two Monoliths at (H-10), and make sure the east Monolith is active; it opens the yellow doors.",
            "Enter " .. ACTOR.SHRINE_RUAVITAU.text .. " from Ru'Aun Gardens at (I-6).",
            "Pass through the first yellow door at (J-7), then continue west through the second yellow door to reach the room with the two Monoliths at (H-7).",
            "Continue south around the square hallway to the room with the two Dark Elementals around (H-10).",
            "Go north and descend the stairs to " .. ACTOR.CELESTIAL_NEXUS.text .. ".",
            "The battlefield is against Eald'narche, in two forms. First form: Eald'narche (about 2,000 HP, ancient magic, Sleepga II) surrounded by Exoplates (about 10,000 HP, no melee) and two Orbitals (low HP, resummoned when killed, Sleep works but not Lullaby).",
            "The Exoplates use Phase Shift, a large AoE with Stun or Bind, at about 66%, 33% and 1-2% HP, harder each time. Before each one, heal everyone to full, get shadows back up and keep mages far away. At 1% they don't die until they have used Phase Shift.",
            "Second form: Eald'narche alone (about 2,500 HP) teleports around, attacks very fast and casts black magic including Bindga, plus Vortex (Terror, Bind), Stellar Burst (Silence) and Omega Javelin (Petrification). You have a minute before he aggroes. Poison Potions and Stun help.",
            "Winning gives a final cutscene and returns you to the Hall of the Gods. If you wipe, wait to be ejected: he aggroes anywhere in the battlefield.",
        },
    },

    ['30'] = {
        name = "Awakening",
        number = 17,
        mission_type = "Cutscene - Finale",
        steps = {
            "Enter Norg and speak with " .. ACTOR.GILGAMESH.text .. ".",
            "If the opening dialogue does not occur, proceed to the Captain's Chamber and speak with " .. ACTOR.GILGAMESH.text .. " there.",
            "Examine " .. ACTOR.NEPTUNES_SPIRE_TENSHODO_DOOR.text .. " in Lower Jeuno to speak with Aldo.",
            "Complete both conversations before zoning into Ru'Lude Gardens.",
        },
    },

    ['31'] = {
        name = "The Last Verse",
        number = 18,
        mission_type = "Finale",
        steps = {
            "The Last Verse is recorded after completing Apocalypse Nigh.",
        },
    },

}

return M