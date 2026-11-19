local Q = {}

Q.STEPS = {

    -- ========================================================
    -- JEUNO
    -- ========================================================

    jeu_lj_the_old_monument = { -- Local patch: BRD unlock chain
        "You need to be level 30 or higher. Speak with Mertaire in the Merry Minstrel's Meadhouse in Lower Jeuno (I-8).",
        "Speak with Bki Tbujhja at the counter in the same room (H-8).",
        "Obtain a Parchment from the Auction House (Leathercraft), by crafting it, or from Pikini-Mikini in the Mhaura warehouse (G-9) for just over 2,000 gil.",
        "In Buburimu Peninsula, go to the beach just west of Mhaura via the ramp at (H-9), head to its south-west corner and into the water; a tunnel leads to the next beach. Examine the Song Runes there at (G-9) for a cutscene.",
        "Trade the Parchment to the Song Runes for a Poetic Parchment, which completes the quest.",
        "This quest does not appear in your quest list until it is completed.",
    },

    jeu_lj_a_minstrel_in_despair = { -- Local patch: BRD unlock chain
        "Return to Mertaire in Lower Jeuno (I-8) and trade him the Poetic Parchment for a cutscene and 2,100 gil.",
        "This quest does not appear in your quest list until it is completed.",
    },

    jeu_lj_path_of_the_bard = {
        "You need to be level 30 or higher. Speak with Bki Tbujhja in Lower Jeuno (H-8), inside the Merry Minstrel.",
        "Optional: speak with Mataligeat for some extra dialogue about Lewenhart.",
        "Travel through the tunnel in Valkurm Dunes (C-6) to the Secret Beach and examine the Song Runes (B-7) for a last cutscene.",
        "A quick way to reach the destination is to take the Survival Guide to Gustav Tunnel, then exit to Valkurm Dunes. If you don't have that Survival Guide, the Unity Warp (level 128) followed by Escape (a /BLM can cast it) puts you right at that exit.",
        "This quest does not appear in your quest list until it is completed.",
    },

    jeu_lj_save_my_son = {
        "You need to be level 30 or higher. Examine the Door: Merchant's House on the second floor in Lower Jeuno (G-11), above the chocobo stables.",
        "Speak with Shalott in Upper Jeuno (G-7), outside the Chocobo Stables, for a cutscene.",
        "Examine the Door: Merchant's House in Lower Jeuno (G-11) again for another cutscene.",
        "Examine the Night Flowers down the ramp in Qufim Island (F-8) between 21:30 and 4:00 for a cutscene.",
        "A Kraken (level 37-38) may spawn above the Night Flowers.",
        "Examine the Door: Merchant's House in Lower Jeuno for a cutscene and your rewards.",
    },

    jeu_uj_axe_the_competition = {
        "You cannot start this quest if you have another Weapon Skill quest active; return to the person who gave it and quit it first. You need Axe skill 240 or higher and level 71.",
        "Speak with Brutus in Upper Jeuno (G-7) to receive the key item Weapons Training Guide and the Pick of Trials. You need to break the latent on the Pick of Trials before completing the rest of the quest.",
        "Trade the Pick of Trials back to Brutus.",
        "The page gives these directions for the next part: follow the path to the T-intersection and head north, follow the path and exit the Temple, and once inside follow the path south to the ???.",
        "Go back and speak with Brutus to receive your reward, the Decimation weapon skill.",
    },

    jeu_uj_chocobo_on_the_loose = {
        "Head to Upper Jeuno and speak with Brutus at (G-7). This quest starts the first time you speak to him, together with Chocobo's Wounds.",
        "Help the chocobo leave when prompted.",
        "Head to La Theine Plateau and check the Chocobo Tracks at the far northwest corner of (E-5), just south of the sliver of map in (E-4).",
        "Return to Upper Jeuno and speak to Brutus (G-7) again.",
        "Return to Brutus (G-7) in Upper Jeuno one last time to complete the quest.",
        "Speak to Brutus (G-7) after one game day to receive a chocobo egg. You must change zones and return to Upper Jeuno after the day change.",
        "Trade the egg to one of the VCS Trainers located in Bastok Mines, Southern San d'Oria or Windurst Woods to begin raising a chocobo.",
    },

    jeu_uj_chocobos_wounds = {
        "To begin, speak with Brutus in Upper Jeuno (G-7) on any job at level 20 or higher. This starts the quest Chocobo on the Loose! first, and this quest follows it.",
        "Speak to him two more times to start the correct quest, and choose \"Nope, never!\".",
        "Obtain Gausebit Grass x4. Buy them at the Auction House (Weapons > Ammo & Misc. > Pet Items), or farm Crane Fly enemies in northern Meriphataud Mountains (near the outpost and Survival Guide, or the Castle Oztroja entrance) or Wadi Hare enemies in Dangruf Wadi. Gysahl Greens from the stables don't work.",
        "Feed the chocobo standing next to Osker by trading it one Gausebit Grass. You can feed it once every real-life minute (counted from :00, not from your last try). The command /item \"Gausebit Grass\" <t> speeds this up; stand closer to the chocobo than to Osker so F8 retargets it.",
        "It takes 6 feeding attempts to complete the quest. The first 2 attempts automatically fail and do not consume a grass.",
        "Once the chocobo has eaten the Gausebit Grass x4, you are presented with a Chocobo license.",
        "You don't need to zone before the next quest, Full Speed Ahead!, but Mapitoto won't acknowledge you without the Map of the Jeuno area (Rusese, M&P Market in Upper Jeuno (H-6), 600 gil).",
    },

    jeu_uj_path_of_the_beastmaster = {
        "Complete the prior quests Chocobo's Wounds and Save My Son. You need to be level 30 or higher.",
        "Speak with Brutus in Upper Jeuno (G-7) for a cutscene. You may have to talk to him multiple times to get the cutscene.",
        "This quest does not show up in your quest log until it is completed.",
        "Optional: visiting the Merchant's House in Lower Jeuno from now on gives a brief scene of their appreciation.",
    },

    jeu_uj_wings_of_gold = {
        "Speak with Brutus in Upper Jeuno (G-7) as a Beastmaster of level 40 or higher. From this point on you can complete the quest on any job.",
        "Kill monsters on the 7th to 10th floors of Upper Delkfutt's Tower until you get a Delkfutt Chest Key; the Gigas, Evil Spirits, Magic Urns and Light and Thunder Elementals drop it. Alternatively, you can buy one from the Curio Vendor Moogle.",
        "Use the key to open a chest in the zone to receive a Guiding bell.",
        "Return to Brutus to receive your reward, the Barbaroi Axe.",
    },

    jeu_uj_scattered_into_shadow = {
        "Speak with Brutus in Upper Jeuno (G-7) as a Beastmaster of level 50 or higher; he gives you three Aquaflora key items. From here on you can be on any job.",
        "Examine the pools on map 2 of Fei'Yin, located at (H-8), (H-5) and lastly (F-5). They are the little green marks on the map. Home Point #2, just outside the Cloister of Frost, is the closest warp.",
        "When the pool at (F-5) is examined, the NM Dabotz's Ghost spawns: a Black Mage that casts Tornado and other black magic and uses Curse often. Take Sneak off first; he spawns in the water and you can't reach him unless he aggros you.",
        "After defeating Dabotz's Ghost, examine the pool at (F-5) again.",
        "Return to Brutus for a cutscene.",
        "Next, head to Castle Oztroja and kill the monsters to find an Oztroja Chest Key, or buy one from the Curio Vendor Moogle.",
        "Use the key to open a chest inside the castle to receive a Beast Collar.",
        "Trade the Beast Collar to Tebhi, an Opo-opo that roams the indoor pond near the Brass Door leading to the magicite for the nation missions. Tebhi disappears for 3 minutes after accepting it.",
        "Return to Brutus for your reward, the Beast Gaiters.",
    },

    jeu_uj_borghertz_calling_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Summoner of level 50 or higher to begin the quest. You need the Rise of the Zilart pack.",
        "Go to Sea Serpent Grotto. Quickest is the Unity Warp (level 125) to Map 4 (L-5), in front of the Gold Door: open it, go north along the left wall to the Mythril Door, examine it until it mentions mythril dust and trade it a Mythril Beastcoin. The Proto-Waypoint to (J-5) on Map 3 also puts you behind the Mythril Door. Open a Treasure Coffer there with a Grotto Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Summoner for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Evoker's Bracers.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Summoner as your main job, open the Treasure Coffer in the Temple of Uggalepih for the Evoker's Doublet, and the one in Toraimarai Canal for the Evoker's Pigaches, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_chasing_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Ranger of level 50 or higher to begin the quest. This quest follows Fire and Brimstone.",
        "Go to Garlaige Citadel and open a Treasure Coffer with a Garlaige Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Ranger for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Hunter's Bracers.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Ranger as your main job, open the Treasure Coffer in Crawlers' Nest for the Hunter's Braccae, and the one in Davoi's Monastic Cavern for the Hunter's Jerkin, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_dragon_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop in Upper Jeuno and speak with Guslam at (H-8) as a Dragoon of level 50 or higher to begin the quest. This quest requires the Rise of the Zilart pack and follows Chasing Quotas.",
        "Go to The Boyahda Tree and open a Treasure Coffer with a Boyahda Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Dragoon for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Drachen Finger Gauntlets.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Dragoon as your main job, open the Treasure Coffer in Ifrit's Cauldron for the Drachen Mail, and the one in Quicksand Caves for the Drachen Greaves, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_harmonious_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Bard of level 50 or higher to begin the quest.",
        "Go to Castle Zvahl Baileys and open a Treasure Coffer with a Zvahl Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Bard for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Choral Cuffs.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Bard as your main job, open the Treasure Coffer in Crawlers' Nest for the Choral Roundlet, and the one in Castle Oztroja for the Choral Cannions, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_healing_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a White Mage to begin the quest. Once you have started it as a White Mage you may complete the other steps on a different job, even finishing the quest and receiving the Healer's Mitts.",
        "Go to Beadeaux and open a Treasure Coffer with a Beadeaux Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on White Mage for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Healer's Mitts.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With White Mage as your main job, open the Treasure Coffer in Garlaige Citadel for the Healer's Cap, and the one in Crawlers' Nest for the Healer's Pantaloons, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_loyal_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Samurai of level 50 or higher to begin the quest. This quest requires the Rise of the Zilart pack.",
        "Go to Kuftal Tunnel (coffers spawn at (H-7) and (H-6) on Map 1 and (K-11), (G-9), (H-9), (J-7), (J-8), (I-4), (F-6) and (D-9) on Map 2) and open a Treasure Coffer with a Kuftal Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Samurai for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Myochin Kote.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Samurai as your main job, open the Treasure Coffer in the Temple of Uggalepih for the Myochin Domaru, and the one in Quicksand Caves for the Myochin Haidate, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_lurking_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to Durable Shields in Upper Jeuno and speak with Guslam at (H-8) as a Ninja of level 50 or higher to begin the quest. This quest requires the Rise of the Zilart pack and follows 20 in Pirate Years.",
        "Go to Ifrit's Cauldron (quickest: the Unity Warp (level 122) to Yhoator Jungle, then hug the right wall; or the Elshimo Uplands Outpost warp or Survival Guide) and open a Treasure Coffer with a Cauldron Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Ninja for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Ninja Tekko.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Ninja as your main job, open the Treasure Coffer in Sea Serpent Grotto for the Ninja Kyahan, and the one in The Boyahda Tree for the Ninja Hatsuburi, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it. The Sea Serpent Grotto coffers are all past the Mythril Door, on Map 3: examine the door until it mentions mythril dust in the indentation, then trade it a Mythril Beastcoin. The Grotto Coffer Key drops from enemies past that door, and the Boyahda Coffer Key from enemies in The Boyahda Tree.",
    },

    jeu_uj_borghertz_shadowy_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Dark Knight of level 50 or higher to begin the quest. This quest follows Dark Puppet.",
        "Go to The Eldieme Necropolis (the Magicked astrolabe, 10,000 gil from Churano-Shurano in Windurst Waters (F-8), lets you open its doors solo) and open a Treasure Coffer with an Eldieme Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Dark Knight for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Chaos Gauntlets.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Dark Knight as your main job, open the Treasure Coffer in Davoi's Monastic Cavern for the Chaos Flanchard, and the one in Castle Oztroja for the Chaos Cuirass, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_sneaky_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop in Upper Jeuno and speak with Guslam at (H-8) as a Thief of level 50 or higher to begin the quest. This quest follows As Thick as Thieves.",
        "Go to Davoi, enter the Monastic Cavern and open a Treasure Coffer with a Davoi Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Thief for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Rogue's Armlets.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Thief as your main job, open the Treasure Coffer in Castle Oztroja for the Rogue's Culottes, and the one in Castle Zvahl Baileys for the Rogue's Vest, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_sorcerous_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop in Upper Jeuno and speak with Guslam at (H-8) as a Black Mage of level 50 or higher to begin the quest. You must have started Recollections.",
        "Go to Garlaige Citadel and open a Treasure Coffer with a Garlaige Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Black Mage for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark. If Recollections is still unfinished, take it up to its Castle Zvahl Baileys part (the Whine Cellar Key) to save a trip.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Wizard's Gloves.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Black Mage as your main job, open the Treasure Coffer in Davoi's Monastic Cavern for the Wizard's Coat, and the one in The Eldieme Necropolis for the Wizard's Tonban, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_stalwart_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Paladin of level 50 or higher to begin the quest. This quest requires the Rise of the Zilart pack and follows A Boy's Dream.",
        "Go to The Eldieme Necropolis (the Magicked astrolabe, 10,000 gil from Churano-Shurano in Windurst Waters (F-8), lets you open its doors solo) and open a Treasure Coffer with an Eldieme Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Paladin for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Gallant Gauntlets.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Paladin as your main job, open the Treasure Coffer in Garlaige Citadel for the Gallant Coronet, and the one in Beadeaux for the Gallant Breeches, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_striking_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Monk of level 50 or higher to begin the quest.",
        "Go to Crawlers' Nest and open a Treasure Coffer with a Nest Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Monk for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Temple Gloves.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Monk as your main job, open the Treasure Coffer in Garlaige Citadel for the Temple Crown, and the one in Beadeaux for the Temple Cyclas, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_vermillion_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Red Mage of level 50 or higher to begin the quest. This quest follows The Crimson Trial.",
        "Go to The Eldieme Necropolis (the Magicked astrolabe, 10,000 gil from Churano-Shurano in Windurst Waters (F-8), lets you open its doors solo) and open a Treasure Coffer with an Eldieme Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Red Mage for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Warlock's Gloves.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Red Mage as your main job, open the Treasure Coffer in Garlaige Citadel for the Warlock's Tights, and the one in Castle Oztroja for the Warlock's Tabard, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it. In Castle Oztroja the four-lever Brass Gate combination changes every game day.",
    },

    jeu_uj_borghertz_warring_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Warrior of level 50 or higher to begin the quest. This quest follows The Talekeeper's Truth.",
        "Go to The Eldieme Necropolis (the Magicked astrolabe, 10,000 gil from Churano-Shurano in Windurst Waters (F-8), lets you open its doors solo) and open a Treasure Coffer with an Eldieme Coffer Key. The coffer may be in the north-west part of map 2 (exit 7), on a ledge normally reached from Beaucedine Glacier via Batallia Downs; examining the Lycopodium in Batallia Downs (S) unlocks a Sparkling Light shortcut to it, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Warrior for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Fighter's Mufflers.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Warrior as your main job, open the Treasure Coffer in Crawlers' Nest for the Fighter's Mask, and the one in Castle Zvahl Baileys for the Fighter's Cuisses, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_uj_borghertz_wild_hands = {
        "If you have any other Borghertz's Hands quest active, you must complete that one before you can start this quest.",
        "Travel to the Durable Shields shop and speak with Guslam in Upper Jeuno (H-8) as a Beastmaster of level 50 or higher to begin the quest. This quest follows Scattered Into Shadow.",
        "Go to Crawlers' Nest and open a Treasure Coffer with a Nest Coffer Key, or pick the lock as a Thief. The Curio Vendor Moogle sells the key. You don't need to be on Beastmaster for this; you receive the key item Old gauntlets.",
        "Return to Upper Jeuno and speak with Guslam.",
        "Guslam cannot repair the gauntlets. If this is your first artifact armor from these quests, speak with Deadly Minnow inside the Durable Shields shop, then go to the Tenshodo in Lower Jeuno, speak with Yin Pocanakhu (J-8) and trade him 1,000 gil.",
        "In Port Jeuno, examine the ??? by the crates near the Auction House and the Jeuno Duty-Free Shop (H-8) for a cutscene.",
        "Travel to Castle Zvahl Baileys, go to (F-8) on the first map and examine one of the torches to spawn Dark Spark.",
        "After defeating Dark Spark, examine the same torch again for the key item Shadow flames.",
        "Return to Port Jeuno and examine the ??? again. After the cutscene the quest is complete and you receive the Beast Gloves.",
        "Optional: Guslam mentions more armor scattered about Vana'diel. With Beastmaster as your main job, open the Treasure Coffer in Garlaige Citadel for the Beast Helm, and the one in Beadeaux for the Beast Jackcoat, each with that zone's coffer key. The quest must be active or completed, but these are not needed to complete it.",
    },

    jeu_pj_circle_of_time = {
        "Speak with Mertaire in Lower Jeuno, who tells you to take the Star ring (tarnished) to an antique collector. You must be a Bard of level 50 or higher, and the quest does not appear in your log yet. This quest requires the Rise of the Zilart pack and follows The Requiem.",
        "Speak with Imasuke in Port Jeuno (E-6). You must have your current job set to Bard to receive the cutscene; after speaking with him you may change to any job.",
        "Travel to (I-10) in Xarcabard and examine the Perennial Snow at the end of the short tunnel. You must now wait one Earth minute before you can retrieve the ring.",
        "Retrieve the Star ring (indecipherable) by examining the Perennial Snow.",
        "Go back to Imasuke, who tells you to find someone who can translate the ring.",
        "Head to Chateau d'Oraguille and speak with Chalvatot at (F-7) to receive the Moon ring.",
        "Listen to his instructions and travel to Monastic Cavern via Davoi (H-11).",
        "Walk to the small circular room at (I-8) with the altar in it; watch for the Orcish Warlord that roams the area, which sees through Sneak and Invisible. After clearing the Orcs, examine the altar to spawn Bugaboo.",
        "Defeat Bugaboo, then examine the altar again for a cutscene.",
        "Return and speak with Chalvatot for your reward, the Choral Justaucorps, and to complete the quest.",
    },

    jeu_pj_antique_collector = {
        "Speak with Imasuke in Port Jeuno (E-6) to begin the quest. You need Jeuno fame level 2.",
        "Head to Qufim Island and kill Dancing Weapon enemies until you obtain a Kaiser Sword. Kaiser Swords can also sometimes be found at the Auction House.",
        "Trade the Kaiser Sword to Imasuke to complete the quest and receive the Map of Delkfutt's Tower.",
    },

    jeu_rg_northward = {
        "Speak with Radeivepart in Ru'Lude Gardens (H-9). He requests that you bring him a Flame Degen. You need Jeuno fame level 4.",
        "Obtain a Flame Degen. It can be purchased at the Auction House, purchased with Sparks of Eminence, crafted, or it rarely drops from Napalm enemies.",
        "Trade the Flame Degen to Radeivepart to complete the quest and receive the Map of Castle Zvahl.",
    },

    jeu_rg_defiant_challenge = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on a level 50 job. You need Jeuno fame level 1.",
        "Maat asks for three items. Three key items combine into each required item. Be wary of Explosure's Self-Destruct and Exoray's conal Breath damage attacks.",
        "Bomb Coal drops from Explosure enemies, or you can receive it after obtaining three Bomb coal fragments from ??? spots.",
        "Exoray Mold drops from Exoray enemies (uncommon), or you can receive it after obtaining three Exoray mold crumbs from ??? spots.",
        "Ancient Papyrus drops from Lich enemies (common), or you can receive it after obtaining three Ancient papyrus shreds from ??? spots. Do not walk over the graves throughout the zone, as you may fall through them to a lower level.",
        "Take care while triggering the lever, as the single bomb that wanders nearby is aggressive by sight and by magic.",
        "Trade the items to Maat to complete the quest, which raises your level cap to 55.",
    },

    jeu_rg_highest_mountains = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on a level 51 job. You need Jeuno fame level 1. He asks you for three key items guarded by monsters in Xarcabard.",
        "If this is your first time heading to Xarcabard, you may use the Unity level 125 warp to Xarcabard.",
        "The key items are: Round frigicite from Boreal Tiger at (I-5), Square frigicite from Boreal Coeurl at (J-6) and Triangular frigicite from Boreal Hound at (G-10).",
        "The Notorious Monsters stand guard in caves, have a fairly large aggro range, and respawn within about 5 minutes after being defeated.",
        "The ??? spot is always present at the far end of the cave, and you receive the key item once you touch it, so you do not need to defeat the Notorious Monsters: you can simply hold them while examining the spots. They no longer use draw-in according to the page, although a note says the Coeurl did use it several times when tested in 2024.",
        "Speak with Maat once you have all three key items to complete the quest, which raises your level cap to 60.",
    },

    jeu_rg_whence_blows_wind = {
        "Speak with Maat in Ru'Lude Gardens on a level 56 or higher job. You need Jeuno fame level 1. He asks for three crests, found deep in the beastmen strongholds: Orcish crest, Monastic Cavern (J-6); Quadav crest, Qulun Dome (J-7); Yagudo crest, Castle Oztroja (H-6). Each ??? is close to True-Sight or True-Sound Notorious Monsters.",
        "You, or a player helping you, need the key items Crimson orb, Yagudo torch, Silver bell, Coruscant rosary and Black matinee necklace from Nation Mission 4-1 Magicite; it's worth doing both together. Solo, you need Rank 4 with 4-1 flagged, as Aldo won't give you the Silver bell earlier.",
        "Orcish crest: in Davoi, enter the Monastic Cavern at (H-11), exit it at (I-8), and go to the Wall of Banishing at the (J-9) entrance. A Crimson orb opens it (a partner's orb lets everyone through). Orcs near the wall aggro once Invisible drops and interrupt the prompt.",
        "Crimson orb, if needed: speak with Sedal-Godjal in Davoi (J-8), just north of that wall, touch the Wall of Banishing at (J-9), and return to him for the White orb. Touch the ponds at (L-9), (I-6) (follow the river upstream), (E-8) and (H-10) in any order; the orb darkens to Pink, Red, Blood, and the fourth makes it a Cursed orb and curses you (Holy Water or Cursna). Return to Sedal-Godjal for the Crimson orb.",
        "Inside the Monastic Cavern from (J-9), stick to the west wall to avoid the True-Sight NMs and examine the ??? at (J-6), among cave-flower-like stalks before the cliff (don't fall off), for the Orcish crest.",
        "Quadav crest: bring Sneak (Silent Oil) but no Invisible is needed. In Beadeaux, take the tunnel at (H-7) (\"A\") to map 2 and get silenced by The Mute at (G-7), so The Afflictor at (G-8) can't curse you with a heavy gravity effect (the silence lasts about 10 minutes).",
        "Take (F-8) (\"B\") back to map 1, go up the ramp at (E-10), make your way to (I-9) and then (K-6) (you can drop from the second level), and follow the path to (M-8) into Qulun Dome. Enemies wait beyond the zone line.",
        "In Qulun Dome, go through the door on the right (this needs the Magicite key items). Ruby Quadav, a level 71-73 True-Sound NM, guards the first room; run past if it's on the far side. In the main room, hug the south wall and examine the ??? on the west wall in the northern part of (I-7) for the Quadav crest; don't drop off the ledge. If you pull too much, zone out to the left.",
        "Yagudo crest: you need the Yagudo torch, and lower-level players should bring Reraise. In Castle Oztroja you need three passwords for the 4th floor trap door; they change at the start of each game day, and guessing from the Brass Statue's list can be quicker than collecting them.",
        "Floor 1: password #1 is in the room at (H-9). At the Brass Door at (I-8), pull a lever and run back (50% chance of a trap door); try the other lever if needed. The stairs at (J-8) lead to map 2.",
        "Floor 2: turn right at the first intersection and run west to (G-7) (map 6), then north to map 7 for password #2 at (H-9). Back at the first intersection, go south to the fork at (H-10) and turn left; a hidden door in the east wall at (I-10) shows the lever pattern. Password #3 is in the room at the north-west corner of (I-8). Open the Brass Door at (G-8) with the levers; beyond it, enemies get tougher. Continue to (G-9) and map 3.",
        "Floor 3: follow the path up the stairs to (H-11), avoiding the leech pool (they aggro by sound).",
        "Floor 4: light any torch in the corner rooms at (G-7), (G-8), (H-7) or (H-8) to open the Brass Door at (H-7) and run through before it closes (Reraise helps; a Thief can Hide). Enter the three passwords at the Brass Statue in any order, with proper capitalization; a wrong one is reported immediately. Release your Trusts first, or they may not fall with you (/returntrust all, or relog).",
        "You drop into a courtyard; the ??? is on the first platform to the north. A True-Sight Yagudo High Priest usually stands right on it: wait for it to move, or let a Trust tank hold it while you examine the ??? and warp out.",
        "Speak with Maat once you have all three key items to complete the quest, which raises your level cap to 65.",
    },

    jeu_rg_riding_on_clouds = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on a level 61 or higher job. You need Jeuno fame level 1. He gives you four clues and wants you to trade a Kindred's Seal to each of the people described in the clues.",
        "You are not provided with the Kindred's Seals and need to get them yourself. Check your inventory and the Port Jeuno NPCs Shemo and Shami (Status, Currencies, Kindred's Seals Stored), as you may already have enough seals.",
        "Kindred's Seals can be acquired from any normal monster of level 50-69 that checks as Easy Prey or higher, or exchanged 3 for 1 (or 2 for 1 during certain campaigns) for other seal types from Shemo.",
        "In return for a seal you receive either a Smiling stone, Scowling stone, Somber stone or Spirited stone.",
        "Speak with Maat once you have all four stones to complete the quest, which raises your level cap to 70.",
    },

    jeu_rg_shattering_stars = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on any level 66-70 job. You need Jeuno fame level 1. This limit break applies to the jobs that existed before the Treasures of Aht Urhgan expansion, and it needs the Testimony item for the job you want to fight Maat with.",
        "Once you trade the Testimony to Maat, he asks if you are ready.",
        "Trade the Testimony to the Burning Circle to enter a one-on-one battle against Maat. The time limit is 10 minutes, and after about 5 minutes from engaging Maat, he begins to use Asuran Fists. Maat has all the relevant abilities and spells of your main job.",
        "A White Mage may instead pull Maat and stay alive for 5 minutes, causing Maat to give up. A Thief may try to steal a Scroll of Instant Warp from Maat; once you steal it, Maat gives up.",
        "When Maat gives up, you receive the title Maat Masher and a Scroll of Instant Warp.",
        "Return to Ru'Lude Gardens and speak with Maat to complete the quest, which raises your level cap to 75.",
        "If you have not yet gained access to Aht Urhgan Whitegate through the quest The Road to Aht Urhgan, you may trade your Testimony afterwards under the advanced path option and complete the quest.",
    },

    jeu_rg_beyond_the_sun = {
        "This quest requires the Rise of the Zilart pack. Talk to Maat at (H-5) in Ru'Lude Gardens on each of the 15 jobs that existed before Treasures of Aht Urhgan, and defeat him with each one.",
        "The level required to fight Maat is at least level 66.",
        "To check which jobs you have beaten Maat with, enter the Feretory and speak with Teyrnon. Instincts associated with the jobs on which you have defeated Maat cost 5,000 Infamy instead of 10,000.",
        "Upon defeating Maat for the last time, speak with him to receive the cutscene and your new Maat's Cap.",
    },

    jeu_rg_storms_of_fate = {
        "After finishing all of the cutscenes after Dawn, including Blueblade Fell, walk towards the Palace in Ru'Lude Gardens to begin the cutscene with Esha'ntarl.",
        "Examine the Dilapidated Gate in Misareaux Coast (F-7) for a cutscene. The Unity warp puts you right in front of this gate.",
        "Examine the green Unstable Displacement in the northwest section of Riverne - Site #B01 (E-7) for a cutscene. You can warp and use the Home Point to get there, or farm one Giant Scale to get to (E-7) the long way.",
        "Click the green Unstable Displacement again to enter the battlefield Storms of Fate against Bahamut.",
        "Kill Bahamut for a cutscene.",
        "Return to the Palace in Ru'Lude Gardens for a cutscene that completes the quest and gives you the key item Whisper of the Wyrmking.",
    },

    jeu_rg_shadows_of_the_departed = {
        "You must complete Storms of Fate to trigger this quest, and you need the key item Whisper of the Wyrmking.",
        "Wait until the next in-game day after completing Storms of Fate to activate this quest. If you reset your memories, this wait does not apply.",
        "Walk into the Palace in Ru'Lude Gardens for the cutscene in which you receive the key item Note written by Esha'ntarl. It is a different cutscene from the one that ended Storms of Fate, which does not give a key item.",
        "Travel to the crags of Holla, Dem and Mea and investigate the coordinates where the strange readings from the Emptiness are occurring, to obtain the key items Promyvion - Holla sliver, Promyvion - Dem sliver and Promyvion - Mea sliver.",
    },

    jeu_rg_apocalypse_nigh = {
        "You need to have completed Rise of the Zilart Mission 17 and Chains of Promathia Mission 8-4. You must zone and wait until the next game day after completing the previous quest.",
        "Enter the palace in Ru'Lude Gardens for a cutscene.",
        "Zone into Sealion's Den for a cutscene, then speak with Sueleen to go to Al'Taieu. If you get a cutscene with Sueleen instead (your first return since visiting Al'Taieu), zone back to Tavnazian Safehold and re-enter Sealion's Den for the scene with Prishe.",
        "In the Grand Palace of Hu'Xzoi, examine the entrance to The Garden of Ru'Hmet (Gate of the Gods) for a cutscene.",
        "Go to the Empyreal Paradox and examine the Transcendental Radiance for a cutscene. With the Home Point Lumoria > The Garden of Ru'Hmet > #1, zone out to the Grand Palace of Hu'Xzoi, warp there and descend.",
        "Examine the Transcendental Radiance again to enter the battlefield, and defeat Eald'narche and Kam'lanaut.",
        "Zone and wait until the next Vana'diel day after completing the battlefield, then talk to Gilgamesh in Norg for a cutscene to complete the quest and receive an earring of your choice.",
        "If you chose the wrong earring or want a different one, drop your earring and proceed to the Empyreal Paradox (it must be dropped before you zone into the Empyreal Paradox). The fastest way is the Home Point warp: Lumoria, The Garden of Ru'Hmet, #1, and descend.",
        "Select the ??? near the entrance and erase your memories (\"I've already forgotten them\" and \"Yes, erase my memories\"), then complete Shadows of the Departed and Apocalypse Nigh again to obtain an earring of your choice.",
    },

    jeu_rg_ducal_hospitality = {
        "You need to have completed Chains of Promathia Mission 3-2. Speak with Taillegeas in Ru'Lude Gardens (I-7) to begin the quest.",
        "He asks you to bring him a few items from a list of possible requests.",
        "Trade Taillegeas the items he requests to receive your reward, 4,000 gil. You can repeat the quest.",
    },

    jeu_rg_empty_memories = {
        "First enter any Promyvion area, and return to Harith in the Grand Duke's house in Ru'Lude Gardens (H-5) without erasing your memory at the Large Apparatus.",
        "Some monsters inside Promyvion drop items called Recollections. Trade Harith one of these Recollections plus 2,000 gil to receive an Anima: Recollection of Pain gives Hysteroanima (negates special attacks), Recollection of Fear gives Psychoanima (negates normal attacks) and Recollection of Guilt gives Terroanima (causes the monster to flee).",
        "Alternatively, trade Harith one of these Recollections, without gil, to receive an item: Recollection of Suffering gives a Hamayumi, Recollection of Anxiety gives a Stone Gorget and Recollection of Animosity gives a Dia Wand. The Recollections of Suffering and Animosity come from Notorious Monsters in Promyvion - Vahzl.",
        "The quest can be repeated.",
    },

    -- Local patch: artifact quests missing from the journal (BG-Wiki)
    jeu_lj_painful_memory = {
        "As a Bard of level 40 or higher, speak with Mertaire in the Merry Minstrel's Meadhouse in Lower Jeuno (H-8) to receive the key item Mertaire's bracelet.",
        "Travel to Ranguemont Pass and go to the pool at (E-5). Examine the Waters of Oblivion to spawn the NM Tros. Only the bracelet is needed, not Bard, so a higher-level job makes this easy; one spawn counts for everyone in the group.",
        "After defeating Tros, examine the Waters of Oblivion again for a cutscene and your Paper Knife.",
    },

    jeu_lj_the_requiem = {
        "As a Bard of level 50 or higher, speak with Bki Tbujhja in the Merry Minstrel's Meadhouse in Lower Jeuno (H-8). She asks for a flask of Holy Water.",
        "Trade her the Holy Water. She returns it and sends you to purify the tomb of a great bard in The Eldieme Necropolis. From here on any job works. Optional: Mataligeat in the meadhouse tells you more about the bard.",
        "Enter The Eldieme Necropolis from the (F-5) entrance in Batallia Downs, reached through Beaucedine Glacier (quickest: the Voidwatch or Unity Warp to Beaucedine Glacier, or the Lycopodium teleport in Batallia Downs if you have it). Go to the room with five unbroken sarcophagi at (D-4).",
        "Trade the Holy Water to the sarcophagus that spawns three skeleton NMs (which one is random): Yum Kimil (BLM, around level 60-65), Dog Guardian and Owl Guardian (around level 50-55). They resist Lullaby, but Repose works on the Guardians.",
        "Defeat all three, then examine the same sarcophagus for a cutscene and the key item Star ring (tarnished). Others doing the quest can trade their Holy Water to that sarcophagus after the fight for their own cutscene.",
        "Return to Bki Tbujhja for your Choral Slippers.",
    },

    jeu_lj_a_new_dawn = {
        "As a Beastmaster of level 50 or higher, examine the Door: Merchant's House at (G-11) on the upper level behind Greyson in Lower Jeuno (Home Point #1) for a cutscene. From here on any job works.",
        "Trade a piece of Mahogany Lumber to Osker near the chocobos and Brutus in Upper Jeuno (G-7) to receive the Tamer's whistle.",
        "Enter The Eldieme Necropolis from the (F-5) entrance in Batallia Downs, reached by zoning in from Beaucedine Glacier (the Voidwatch or Unity Warp to Beaucedine Glacier, or the Lycopodium teleport in Batallia Downs, are quick).",
        "Go to (D-4) and examine the north-east sarcophagus (clear the room first if you are low level) to spawn two tigers, Taifun and Trombe, and a hound, Sturm. Only Sturm has to be defeated, and the tigers can be charmed to help you.",
        "Examine the sarcophagus again for a cutscene and your Beast Trousers.",
    },

    jeu_uj_lakeside_minuet = {
        "You need a job at level 30 or higher and Wings of the Goddess. Speak with Laila in Upper Jeuno (G-7) (Home Point #1 is close) and answer \"I surely do.\" and then \"Never!\". She asks for a Stardust pebble.",
        "Speak with Rhea Myuliah, the Mithra dancer next to her. If Rhea Myuliah answers when you speak with Laila, that counts too.",
        "In the Lion Springs Tavern in Southern San d'Oria (K-6), speak with Valderotaux at the bar and dance for him (any choice on stage gives the same result). Home Point #3 is near the tavern.",
        "Return to Rhea Myuliah in Upper Jeuno. She reveals the pebbles lay at the bottom of Lake Mechieume in Jugner Forest twenty years ago.",
        "Go to (I-5) in Jugner Forest (S), near the Batallia Downs (S) zone line (Survival Guide there, the Cavernous Maw, or Recall-Jugner). Examine the glowing pebbles spot by the shore for a cutscene and the key item Stardust pebble. It doesn't actually glow: target around (I-5) and watch the target names.",
        "Speak with Laila in Upper Jeuno to finish the quest and unlock Dancer.",
    },

    jeu_uj_unfinished_waltz = {
        "As a Dancer of level 40 or higher, speak with Laila in Upper Jeuno (G-7). If she asks about seeing you dance, the quest is active.",
        "Speak with Rhea Myuliah next to her.",
        "Go to Grauberg (S) and, as a Dancer, examine the ??? in Witchfire Glen at (F-5) for a cutscene. It is in the middle of three closely packed trees just north-west of the Veridical Conflux; quickest is a Lightsworm at any Cavernous Maw to the Walk of Echoes, then out by the conflux.",
        "Examine the ??? again to spawn Migratory Hippogryph. If you zone after the first examine, you have to examine it again as a Dancer, so plan to fight it on Dancer.",
        "After defeating it, examine the ??? for a cutscene and the key item The Essence of Dance. Open it from your Permanent Key Items menu (just after any Gate Crystals).",
        "Speak with Laila for a cutscene and your War Hoop.",
    },

    jeu_uj_road_to_divadom = {
        "Zone and wait until the next game day after The Unfinished Waltz. As a Dancer of level 50 or higher, speak with Laila in Upper Jeuno (G-7).",
        "Get a Block of Yagudo Glue from Yagudo Pipers, Lutenists, Chanters, Conductors or Drummers in a Shadowreign zone; Castle Oztroja (S), via the Meriphataud Mountains (S) Survival Guide, is easiest.",
        "Zone into Jugner Forest (S) for a cutscene (the Batallia Downs (S) Survival Guide is fastest).",
        "Examine the Glowing Pebbles at (I-5) for a cutscene, then, on Dancer, trade them the Yagudo Glue for another.",
        "On Dancer, speak with Laila in Upper Jeuno for a cutscene and your Dancer's Tights.",
    },

    jeu_uj_comeback_queen = {
        "Zone and wait until the next game day after The Road to Divadom. As a Dancer of level 50 or higher, speak with Laila in Upper Jeuno (G-7) for a cutscene and the key item Wyatt's proposal.",
        "Speak with Harmodios inside the music shop in Bastok Markets (K-10), close to Home Point #4.",
        "Return to Upper Jeuno and speak with Laila again.",
        "Speak with Rhea Myuliah to practice performing for an audience. Keep their attention with the dance each likes: young people a Waltz, older people a Samba, children a Jig. Use the right one when someone starts to walk away.",
        "When you're ready, wait a game day and speak with Laila to perform. The audience is 3 children, 2 young adults and 2 older people; focus on Jigs and Waltzes so at least 5 of the 7 keep watching. If you fail, zone and wait a game day to try again.",
        "Perform well to complete the quest and receive your Dancer's Casaque.",
    },

}

return Q