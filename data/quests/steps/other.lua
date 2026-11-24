local Q = {}

Q.STEPS = {

    -- ========================================================
    -- MHAURA
    -- ========================================================

    oth_mha_potters_preference = {
        "Speak with Nereus in Mhaura (I-8), near the Proto-Waypoint, to begin the quest. You need Windurst fame level 5. Nereus seeks a dish of Gusgen clay from the depths of the Gusgen Mines.",
        "The Gusgen Clay is by the right-most pond at (I-6/7) on map 3 of Gusgen Mines; bring Sneak, as monsters there are 85+. From the Survival Guide, head north, down the stairs and through the right-most door at (H-6) (use the lever if it's closed; not while Invisible), then drop down the hole in the north-east corner of (I-6) on map 2. The Grounds Tome at (H-7) sells Sneak and Invisible, but only buy it after the door.",
        "Bring the Gusgen Clay to Nereus for your reward, 2,160 gil. You can repeat the quest after 8 hours.",
    },

    oth_mha_expertise = {
        "Wait 8 Vana'diel days after completing His Name Is Valgeir to begin this quest. Speak with Take in Mhaura (I-8), inside the Sailor's Stay. She wants you to bring back one of Valgeir's dishes from Selbina.",
        "Speak with Valgeir in Selbina (I-9), inside the Shepherd's Muster.",
        "Obtain 1 Scream Fungus and 1 Land Crab Meat and trade them to Valgeir.",
        "Wait 2 game days and return to Valgeir for the key item Land crab bisque.",
        "Take the bisque to Take for your reward, the Tableware Set, and the title Three-Star Purveyor.",
    },

    oth_mha_fishermans_heart = {

        "You need a Fishing skill of at least 20 (gear included). Speak with Katsunaga on the waterfront in Mhaura (H-9).",

        "Trade him a Gugru Tuna. In exchange he tells you your fishing history: how many times you have cast your line, how many fish you have caught, and the longest and heaviest fish you have landed.",

        "Afterwards Katsunaga can show you the list of fish you have caught. It counts toward the 100 species needed for Fish Favors the Bold and the 60 types for Thanks for All the Fish. Only fish that entered your inventory count, not ones regretfully released for lack of space, and only those caught since the June 2015 update.",

        "Completing the quest also lets you unlock an Accuracy/Evasion Vorseal. The quest is repeatable.",
    },

    oth_mha_his_name_is_valgeir = {
        "You need to wait two, possibly three game days after completing Unending Chase before this quest is offered. Speak with Rycharde in Mhaura (I-8). He gives you an Aragoneu pizza to deliver to his father, Valgeir, in Selbina.",
        "Rycharde pays your fare for the next Ferry between Mhaura and Selbina if you choose to take it.",
        "Deliver the pizza to Valgeir in Selbina (I-9).",
        "Return to Rycharde for your reward, the Map of the Toraimarai Canal.",
    },

    oth_mha_raining_mannequins = {
        "Speak with Fyi Chalmwoh in the Goldsmithing shop in Mhaura (G-8) to begin the quest, then speak to her again. You need Windurst fame level 4. She wants to build a mannequin that rivals those of times past, and it is your job to gather information on how to make one.",
        "Speak with Ramona in Selbina (H-9), inside the Weavers' Guild, to receive the Ye Olde Mannequin Catalogue.",
        "Speak with Cheupirudaux in Northern San d'Oria (F-3), near Home Point #4, to receive the Mannequin joint diagrams.",
        "Gather all 5 pieces, a Mannequin Body, Feet, Hands, Head and Legs, and trade them to Fyi Chalmwoh. They can also be bought from player bazaars.",
        "Zone and speak with Fyi Chalmwoh again to receive your reward, a mannequin matching your race and gender.",
    },

    oth_mha_orlandos_antiques = {
        "Speak with Orlando in Mhaura (G-9) to begin the quest. Find where the Goblins bury their junk: he is interested in the items that Goblin Diggers tend to bury if left undisturbed.",
        "Trade Orlando eight of any one of the items to complete the quest and receive 100 to 900 gil, depending on the item. You can repeat the quest.",
    },

    oth_mha_recycling_rods = {
        "Speak with Keshab-Menjab at the lower level of Mhaura (H-9) to begin the quest. You need Other fame level 1. You have been asked to help bring in cleanly snapped rods for recycling; the recycled rods are supposedly sold somewhere around Bibiki Bay.",
        "In Bibiki Bay - Purgonorgo Isle, fish up a Lancet Jagil (Minnows seem to work as bait) and defeat it until one drops a Cleanly Snapped Rod.",
        "Return the rod to Keshab-Menjab to complete the quest and receive 1,500 gil.",
    },

    oth_mha_rycharde_the_chef = {
        "Speak with Numi Adaligo in the governor's house in Mhaura (F-9) and ask about jobs, then with Take (I-8) on the first floor of the Sailor's Stay.",
        "Speak with Rycharde on the second floor of the Sailor's Stay to begin the quest. He needs your help to find some dhalmel meat.",
        "Obtain 2 Dhalmel Meat and trade them to Rycharde to complete the quest. You receive 1,500 gil and the title Purveyor in Training.",
    },

    oth_mha_trial_by_lightning = {
        "Speak with Ripapa in Mhaura (I-9) to obtain the quest. You need Mhaura fame level 6. Warning: Trust Magic cannot be used in this battlefield. Once you have the key item Tuning fork of lightning, you can safely undertake the quest, and every party member needs their own.",
        "Enter The Boyahda Tree from The Sanctuary of Zi'Tah (K-12) or (J-12). On map 1, go to (A-7) to climb to map 2, and go behind the waterfall at (I-11) to the hidden entrance to the Cloister of Storms. The Boyahda Tree Home Point #1 is best; the Unity Warp puts you on map 2 a short run from it (monsters aggro even at 99).",
        "Ring the tuning fork upon the Lightning Protocrystal. Up to 6 party members can enter the arena, and the time limit is 30 minutes.",
        "Defeat Ramuh Prime to receive the key item Whisper of storms.",
        "Return to Ripapa with the whisper and she offers several reward options, including the ability to summon Ramuh. You can only select one of the rewards at any time, and you may repeat this quest once per Earth day.",
        "To save travel time to the Cloister, use the Mini Fork of Ltn. given by Trial-Size Trial by Lightning: be on Summoner as your main job, get the Mini Tuning Fork from Lacia, trade it back to her, and enter the Protocrystal normally.",
    },

    oth_mha_trial_size_lightning = {
        "You need to be a Summoner of level 20 or higher and have Other fame level 2. Speak with Lacia in Mhaura (I-9) to begin the quest and obtain a Mini Tuning Fork of Lightning.",
        "You may prepare for the upcoming battle and, whenever you are ready, trade Lacia the tuning fork to be transported to the arena.",
        "Trade the fork to the Lightning Protocrystal to enter the fighting arena.",
        "Defeat Ramuh Prime to complete the quest. Only Carbuncle may be used for this battle; Siren can also be used, but that seems unintended.",
        "You may re-obtain the Mini Tuning Fork from Lacia at any point if you want to repeat the fight, but she will no longer teleport you to the Cloister.",
    },

    oth_mha_the_basics = {
        "You need to wait 8 real-life hours after completing The Clue before this quest is offered. Speak with Rycharde in Mhaura (I-8), who asks you to take Mhauran couscous to Valgeir in Selbina.",
        "Rycharde offers to buy you a ticket for the next Ferry between Mhaura and Selbina, but you can travel to Selbina any way you choose.",
        "Deliver the dish to Valgeir in Selbina (I-9); he gives you a Popoto to take back.",
        "Return to Rycharde and trade him the Popoto to complete the quest and receive a Tea Set. Optional: speak with Valgeir and then Rycharde once more to conclude the story.",
    },

    oth_mha_the_clue = {
        "Wait 8 Earth hours after completing Expertise. Speak with Rycharde in Mhaura (H-8), upstairs in the Sailors' Stay, and accept his request.",
        "Bring him 4 Crawler Eggs (Auction House, Cooking, or from Crawlers) to complete the quest. You receive 3,000 gil and the title Four-Star Purveyor.",
    },

    oth_mha_the_old_lady = {
        "Speak with Vera in Mhaura (G-10). You need to be level 18 or higher. Fulfill her request if you want the promised rewards.",
        "Obtain a Bloody Robe, a Dhalmel Saliva and a Wild Rabbit Tail and bring them to Vera.",
        "Completing the quest unlocks your Support Job.",
    },

    oth_mha_the_sand_charm = {
        "Speak with Blandine in Mhaura (I-9) to begin the quest. You need Windurst fame level 4.",
        "Speak with Zexu.",
        "Exit the dock, then talk to Blandine again.",
        "Speak with Celestina in the nearby Goldsmithing Guild. The quest now shows in your log.",
        "Obtain a Sand Charm, which drops from Crossbones on the Ferry between Mhaura and Selbina. Crossbones appear on the ferry only when pirates attack, which is a rare occurrence.",
        "Trade the Sand Charm to Celestina to complete the quest and receive the Map of Bostaunieux Oubliette.",
    },

    oth_mha_unending_chase = {
        "You need to wait 8 real-life hours (8 game days) after completing Way of the Cook before this quest is offered. Speak with Rycharde in Mhaura (I-8). He wants you to get him an ingredient called a puffball.",
        "Obtain a Puffball and trade it to Rycharde to complete the quest. You receive 2,100 gil and the title Two-Star Purveyor.",
    },

    oth_mha_way_of_the_cook = {
        "You need to wait 8 real-life hours after completing Rycharde the Chef before this quest is offered. Speak with Rycharde in Mhaura to begin it. He needs your help finding some ingredients: a beehive chip and some dhalmel meat.",
        "Obtain a Beehive Chip and a Dhalmel Meat and trade them to Rycharde to complete the quest. You receive between 1,000 and 1,500 gil and the title One-Star Purveyor.",
    },

    -- ========================================================
    -- SELBINA
    -- ========================================================

    oth_sel_explorers_footsteps = {
        "Talk to Abelard in Selbina (G-9) to receive some Selbina Clay. You need to be level 15 or higher. The mayor wants you to find the stone monuments left by a certain adventurer and copy their writings to clay.",
        "Take the Selbina Clay to the Stone Monuments around the world and copy their writings. Repeat for the remaining Stone Monuments; the quest does not complete until you finish all the tablets.",
        "Return the tablets to Abelard. When you finish them all you receive the Map of the Crawlers' Nest. You can repeat the quest.",
        "Three more monuments exist in the Shadowreign: Vunkerl Inlet (S) at (E-12), Grauberg (S) at (F-5) and Fort Karugo-Narugo (S) at (E-7), outside the map. You can copy them with the Selbina Clay, but when you trade them there is no response from Abelard.",
    },

    oth_sel_cargo = {
        "Talk to Vuntar in Selbina (H-9). He will pay a premium price for rolanberries, but only for those that are thoroughly aged and can serve as food for long voyages.",
        "Purchase some Rolanberries.",
        "In Crawlers' Nest, trade the right berry to the baskets in the circular rooms. Each trade has a chance to spawn an NM crawler at one of the room's exits; it walks to the basket and then attacks you, and always drops the upgraded berry. Bring several stacks for the higher tiers.",
        "Trade the aged Rolanberries to Vuntar: Rolanberry 881 pays 800 gil, 874 pays 2,000 gil and 864 pays 3,000 gil (Rolanberry 854 and the white or withered berries aren't accepted). You can repeat the quest.",
    },

    oth_sel_donate_to_recycling = {
        "Speak with Romeo in Selbina (H-9). You need Other fame level 1. Donate five pieces of onion equipment to help new recruits everywhere; donors may receive an award.",
        "Trade him five pieces of the same type of onion equipment to complete the quest. You receive a Wastebasket and the title Ecologist.",
    },

    oth_sel_elder_memories = {
        "Speak with Isacio in Selbina (G-10). You need to be level 18 or higher. You must prove yourself worthy before you can learn his fighting techniques.",
        "Obtain a Damselfly Worm, a Magicked Skull and a Crab Apron and bring them to Isacio.",
        "Completing the quest unlocks your Support Job.",
    },

    oth_sel_inside_the_belly = {
        "Speak with Zaldon in Selbina (H-9). This quest follows The Real Gift. You need a Fishing skill of 30 or higher; you can use gear and Advanced Synthesis Image Support to reach it. Some fish in Vana'diel like to eat shiny objects, and Zaldon will cut open any you catch.",
        "Trade Zaldon certain fish and he will gut them for you. What you receive depends on the fish, and some of them earn a title. You can repeat the quest.",
    },

    oth_sel_only_the_best = {
        "Speak with Melyon in Selbina (I-9). You need Other fame level 1. He will pay premium prices for any of the following: five heads of La Theine Cabbage, three ears of Millioncorn, or one clump of Boyahda Moss.",
        "Trade Melyon any one of those sets to complete the quest and receive between 100 and 600 gil. If you have already completed the quest at least once, you do not need to speak to him again to start it; you can simply trade the items again.",
        "Repeating this quest several times is the easiest way to improve your reputation in Bastok, San d'Oria, Jeuno, Selbina and Rabao. You can repeat the quest.",
    },

    oth_sel_picture_perfect = {

        "You need your Adventuring Fellow at its level cap of 50 with a familiarity of 35, and must have finished Mirror, Mirror or A Pose by Any Other Name. With your Signal Pearl or Tactics Pearl equipped, speak with Diederik in Selbina (G-10) for a cutscene.",

        "Diederik has lost a painting ordered by a customer. Choose either to ask Angelica for a new painting, or to delay the buyer, Umberto, while a new one is made. Both paths need the same two things.",

        "Obtain a Bal Shell by using a Pickaxe at an Excavation Point in Korroloka Tunnel. Angelica's path: trade it to Angelica on the top floor of the Rarab Tail Hostelry in Windurst Waters (North) (F-10). Umberto's path: trade it to Umberto in Bastok Markets (L-10), then speak with Diederik again.",

        "Obtain the Opalescent Stone from Castle Oztroja. Go through the Brass Door at (I-8) to Map 2, take the exit at (I-9) to Map 6, and examine the Brass Door at (I-8) there for a cutscene, then again to enter.",

        "Examine the ??? inside the room to spawn the NM Yagudo Muralist along with your Adventuring Fellow. Defeat it, speak with your Fellow, then examine the ??? again to obtain the key item. Another player must wait 3 minutes before spawning the NM again.",

        "Speak with Angelica in Windurst Waters (North) to receive the key item Old Woman's Portrait.",

        "Take the portrait to Umberto in Bastok Markets (L-10) for a cutscene that completes the quest. Your Adventuring Fellow's level cap rises to 55 and you earn the title Team Player.",
    },

    oth_sel_the_gift = {
        "You need to have finished Under the Sea to get this quest. Speak with Oswald in Selbina (I-9). He wants to order something nutritious to cheer his girlfriend up a bit, and asks you for the special ingredient, a Danceshroom.",
        "Trade Oswald a Danceshroom to complete the quest and receive the Sleep Dagger. Danceshrooms can be bought at the Auction House under Food, Ingredients.",
    },

    oth_sel_the_real_gift = {
        "The Sand Charm must be completed before you are offered this quest. Speak with Oswald in Selbina (I-9) to begin it.",
        "Trade Oswald a Shall Shell to complete the quest. You receive the Glass Fiber Fishing Rod and the title The Love Doctor.",
    },

    oth_sel_the_rescue = {
        "Speak with Thunder Hawk in Selbina (G-9) to begin the quest. He wants you to rescue two merchants from captivity; they should be somewhere in the Quadav camp in Beadeaux.",
        "Head to Beadeaux and kill a De'Vyu Headhunter to obtain a Quadav Charm.",
        "Head to (I-8) and trade the Quadav Charm to the Jail Door, on the ground floor, for a cutscene and a Trader's sack.",
        "Return to Thunder Hawk for a storytelling scene and your reward, the Map of the Ranguemont Pass and 3,000 gil, and the title Honorary Citizen of Selbina.",
    },

    oth_sel_test_my_mettle = {
        "Speak with Devean in Selbina (I-8). He asks you to bet on how long it takes you to get a pair of Power Sandals from Davoi. Find the pair of Power Sandals hidden in a jar somewhere in Davoi and bring them back before time runs out for a cash prize.",
        "The quicker you return, the more money you get back. The time is measured in game hours, not Earth hours.",
        "Once in Davoi you need to locate a Jar that contains the Power Sandals. The jar can spawn at (I-8), (K-9), (J-8), (H-8), (F-6), (J-9), (F-9), (G-9), (H-9) and (F-7).",
        "Return the Power Sandals to Devean before time runs out. You can also choose to keep the Power Sandals for yourself, but that means you fail the quest.",
    },

    oth_sel_under_the_sea = {
        "Speak with Yaya in Selbina (H-9), then Oswald (I-9), inside the Shepherd's Muster by the Nomad Moogles, then Jimaida (H-9); the quest is now active.",
        "Speak with Zaldon (H-9). Fish up a Fat Greedie in Selbina and trade it to Zaldon; repeat with one fish at a time until he gives you the temporary key item Etched ring.",
        "Bring the ring back to Oswald for your reward, the Amber Earring.",
    },

    -- ========================================================
    -- TAVNAZIAN SAFEHOLD
    -- ========================================================

    oth_tvs_a_bitter_past = {
        "Talk to Frescheque in Tavnazian Safehold (H-8, 3rd floor) to start the quest.",
        "Talk to Raminey (J-7, 3rd floor).",
        "Talk to Equette (I-9, 2nd floor).",
        "In Lufaise Meadows, examine the ??? at (I-8) to spawn Blackbone Frazdiz (DRK) and Rainbringer Vjatvot (BLM). Both can be slept briefly, and nearby Orcs link.",
        "Defeat the NMs and select the ??? again to obtain the Tiny wristlet.",
        "Return to the Tavnazian Safehold and talk to Frescheque for your reward, the Yinyang Lorgnette. Talk to Equette again for an additional cutscene.",
    },

    oth_tvs_hard_days_knight = {
        "Talk to Quelveuiat in Tavnazian Safehold (I-10, middle floor).",
        "Zone into Lufaise Meadows by taking the south exit at (I-6), then head to (H-10). Clear any nearby Orcs, as they will link.",
        "Click the ??? at the top of the platform to spawn Splinterspine Grukjuk, a Ranger Orc NM, and defeat it.",
        "Return to Tavnazian Safehold and speak with Quelveuiat to complete the quest and receive 2,100 gil.",
        "Optional: after completing the quest you may trade Quelveuiat a Sealion Crest Key and a Coral Crest Key to obtain a Temple Knight key, which lets you open the large door to the inner part of Sacrarium at (H-7) solo.",
    },

    oth_tvs_behind_the_smile = {
        "Talk to Enaremand in Tavnazian Safehold (J-7, Home Point #3), on the upper level. This quest follows It's Raining Mannequins and requires the Chains of Promathia pack. One last material is required to complete his final masterpiece, and the mannequin craftswoman in Mhaura may have clues.",
        "Go to Mhaura and talk with Fyi Chalmwoh at (G-8).",
        "Go to Carpenters' Landing, entering from Jugner Forest (J-8) (the Carpenters' Landing Survival Guide puts you one square east). At (I-10), touch the ??? on a red mushroom near the south-west corner to spawn the Orc NM Bullheaded Grosvez.",
        "After you have defeated Bullheaded Grosvez, touch the ??? again to receive the Red oil.",
        "Go back to the Tavnazian Safehold and talk to Enaremand again for your reward, the Mannequin Pumps.",
    },

    oth_tvs_elderly_pursuits = {
        "This quest follows Secrets of Ovens Lost and requires the Chains of Promathia pack. Speak with Despachiaire in Tavnazian Safehold (K-10) for a cutscene and the Antique amulet.",
        "Speak with Rouva in Southern San d'Oria (I-8).",
        "Enter Carpenters' Landing from the Jugner Forest (E-6) entrance and examine the ??? at (F-9) to spawn the NM Para. At low health it makes copies of itself, so kill it fast.",
        "Examine the ??? again to exchange the Antique amulet for the Cathedral medallion, then return to Rouva.",
        "Return to Despachiaire for your reward, the Elegant Ribbon.",
    },

    oth_tvs_fly_high = {
        "Speak with Ferchinne in Tavnazian Safehold (G-9), in the lower section of the main floor near the waterfalls and bridges. You need to be on or past Promathia Mission 4-2 and have the Chains of Promathia pack.",
        "Obtain 2 Hippogryph Tailfeathers (from Hippogryphs in Riverne - Site #A01 and #B01, or the Auction House under Clothcraft) and trade them to Ferchinne for your reward, the Mistmelt. You can repeat the quest.",
        "A Mistmelt forces Ouryu to land when you fight him, but has no effect in The Savage II.",
    },

    oth_tvs_go_go_gobmuffin = {
        "To activate this quest you must be on or past Promathia Mission 4-2 and have zoned into Riverne - Site B01. You need the Chains of Promathia pack.",
        "Speak with Epinolle in Tavnazian Safehold (F-8) to begin the quest.",
        "Enter Riverne - Site #B01 and head to the island at (J-6). As you leave the spatial distortion onto the island, three goblin NMs spawn: Book Browser Bokabraq (BLM), Chemical Cook Chemachiq (WHM) and Spell Spitter Spilospok (WAR). Defeat them.",
        "Return to Epinolle for your reward, the Map of Cape Riverne.",
    },

    oth_tvs_search_of_the_truth = {
        "Speak with Tressia in Tavnazian Safehold (J-6). You need to have completed Darkness Named and have the Chains of Promathia pack. Search for information regarding what happened on the day Wazozo's treasure was stolen.",
        "Optional: speak with Mengrenaux and Chemioue, also in the Patrol HQ (J-6, third floor).",
        "Speak with these four, in any order, for short cutscenes: Fouagine (I-9, third floor, under the archway), Noam (G-9, second floor, lower section), Zadant (H-8, second floor, on the ramp down) and Raminey (J-7, third floor, Home Point #3).",
        "Return to Tressia and put what you learned in order. Two orders are known to work and the right one seems to change with each try: Fouagine, Zadant, Raminey, Noam or Fouagine, Zadant, Noam, Raminey. Keep trying either one.",
        "Look at the other patrol members' reports (reports 1 and 2 from Mengrenaux, 3 and 4 from Chemioue), then return to Tressia and say where each was gathered: report 1 (I-8), report 2 (H-8), report 3 (G-9), report 4 (J-7).",
        "Follow the trail: examine the ??? next to Noam (G-9, second floor) to receive the Shaded Cruse, then the ??? up the ramp to the north (G-7), the one by the open doors on the left (G-8), the one in the hallway (H-8), and the last one in the bottom right corner of (H-8).",
        "Return to Tressia in the Patrol HQ (J-6).",
        "Go to Ondieulix (I-7, second floor, near Home Point #1) for your reward, the Gramary Cape.",
    },

    oth_tvs_name_of_science = {
        "Start the quest by talking to Yurim in Tavnazian Safehold (J-8), on the top floor. This quest requires the Chains of Promathia pack.",
        "Choose a reward, then trade the appropriate base item and chip to Yurim. Be careful: you cannot cancel the quest after making your decision. You can repeat the quest.",
        "Speak with Yurim again. Either collect the organs now, or trade him an Apple Pie for a hint. Then trade him the organs to complete the quest and receive your item.",
        "Recipes: Silver Earring + Black or White Chip, 5 Euvhi Organs, 5 Luminian Tissues. Silver Obi + chip, 7 + 3 organs and 3 Luminian Tissues: Red 7 Phuabo/3 Xzomit, Yellow 7 Hpemde/3 Aern, Blue 7 Hpemde/3 Phuabo, Green 7 Aern/3 Hpemde, Clear 7 Xzomit/3 Phuabo, Purple 7 Phuabo/3 Hpemde, White 7 Xzomit/3 Aern, Black 7 Aern/3 Xzomit.",
        "Gorget + chip, plus Yovra Organs: Red 10 Phuabo/5 Xzomit/1 Yovra, Yellow 10 Xzomit/5 Aern/1, Blue 10 Aern/5 Hpemde/1, Green 10 Phuabo/5 Hpemde/1, Clear 10 Phuabo/5 Aern/1, Purple 10 Xzomit/5 Hpemde/1, White 7 Aern/3 Phuabo/3 Hpemde/2 Yovra, Black 7 Hpemde/3 Phuabo/3 Aern/2 Yovra.",
        "After completing it once, you can also trade vices and auras from several Lumoria HNMs to Meret for rewards.",
    },

    oth_tvs_forbidden_doors = {
        "Wait up to 1 minute after completing Behind the Smile. Talk with Enaremand in Tavnazian Safehold (J-7).",
        "Talk to Chemioue (J-6). If you have not done Petals for Parelbriaux and you are at Promathia Mission 3-5 or later, you may get that cutscene first.",
        "Go to Phomiuna Aqueducts, find a Wooden Ladder at (C-9) on the second map, and climb the ladder for a cutscene.",
        "Go to Misareaux Coast and examine the ??? at (I-6), near the end of the river, for the Mire incense.",
        "Go to the base of the waterfall at (F-4) in Misareaux Coast and examine the ??? for a cutscene.",
        "Examine the ??? again to spawn the mannequin NM Alsha. It casts Silence, Paralyze and sometimes Cure III on you; below about 20% it casts Fire II on itself, and if it kills itself you must zone and try again, since you have to land the final blow.",
        "After defeating Alsha, examine the ??? again for the key item Better Humes and Mannequins.",
        "Travel to Mhaura and speak with Fyi Chalmwoh, who takes the key item and lets you pose your mannequins for 200 gil.",
    },

    oth_tvs_paradise_salvation = {
        "Speak with Nivorajean in Tavnazian Safehold (I-9), on the surface level. You need to be level 50 or higher, have the Chains of Promathia pack, and have Promathia Mission 4-3 flagged for Sacrarium access. To complete a map of the Sacrarium, she needs you to find a piece of the old floorplans.",
        "Find the piece of the old floorplans in the Sacrarium and bring it back to Nivorajean for your reward, the Map of the Sacrarium.",
    },

    oth_tvs_petals_for_parelbriaux = {
        "Speak with Chemioue on the top floor of Tavnazian Safehold (J-6), slightly north of Home Point #3, for a cutscene. You need to have completed Promathia Mission 3-5 and have the Chains of Promathia pack.",
        "Speak with Tressia, next to Chemioue.",
        "Speak with Parelbriaux (K-7): walk back to the Home Point and up the ramp to the east.",
        "If you get a cutscene about a Shikaree tracker, that is for Tango with a Tracker: go talk to Despachiaire at (K-10), behind a Walnut Door, then return to Parelbriaux and talk to him twice more for a cutscene with Chemioue.",
        "Speak with Ondieulix on the middle floor (I-7), just south of Home Point #1, for a cutscene that adds the quest to your log.",
        "In Lufaise Meadows, examine the ??? at (G-6) during foggy weather (most often early morning) to spawn the NM Baumesel. Defeat it and examine the ??? again.",
        "Speak with Ondieulix at (I-7) to receive your reward, the Powerful Rope.",
    },

    oth_tvs_secrets_of_ovens_lost = {
        "Talk to Despachiaire in Tavnazian Safehold (K-10), on the top floor. This quest follows Spice Gals and requires the Chains of Promathia pack.",
        "Talk to Jonette on the middle floor, near the stream at (G-9).",
        "You need access to Phomiuna Aqueducts or the Sacrarium (each needs different Chains of Promathia progress). In either, find a ??? on a bookshelf for the key item Tavnazian cookbook; it moves to the next room about every 10 minutes.",
        "Phomiuna Aqueducts: the libraries are the four rooms at (F-7), (F-9), (J-7) and (J-9) on the third map, with the ??? on the north or south bookshelf. From the entrance, open the iron door at (G-8) or (J-6) with a Bronze Key (or a Thief's tools), avoid the Taurus, and take the ladder at (E-8) or (M-8). Two True-Sight Taurus guard each hallway to the libraries, and their aggro can't be avoided in the narrow corridors.",
        "Sacrarium: the ??? is in one of the four corner rooms, (F-5), (H-5), (F-11) or (H-11), on the inner side of a bookshelf facing away from the door; it seems to move north-east, north-west, south-east, south-west. Bring Sneak (Invisible isn't needed) for the True-Sight Stegotaurs, take whichever maze entrance is open that day, and pass the one that guards a maze entrance when it turns away, or aggro it, zone and run past before it respawns.",
        "Return to Jonette for a Page from Miratete's Memoirs. You can repeat the quest once per Conquest week by speaking to her again, but only if you collected the page before the week ended.",
    },

    oth_tvs_requiem_of_sin = {
        "This quest follows Tango with a Tracker and requires the Chains of Promathia pack. Speak with Despachiaire in Tavnazian Safehold (K-10) for the Letter from Shikaree Y (on repeats, the Letter from the Mithran Trackers).",
        "Head to Boneyard Gully and select \"Requiem of Sin\" at the Dark Miasma to enter a battlefield.",
        "You have 30 minutes, up to 6 players, each with their own letter key item; there's no level cap, but Trusts can't be used. Shikaree X is BST/NIN with a rabbit pet (resists sleep but not bind or gravity; if it dies first, X summons another), and Shikaree Y is DRK/MNK, and Shikaree Z is DRG/WHM with a wyvern that resists sleep. The Shikaree are hard to sleep, it doesn't last, and they build TP fast and skillchain with each other.",
        "Defeat all three for a treasure chest with your reward, which varies, and the title Disciple of Justice. You can repeat the quest once per Conquest Tally.",
    },

    oth_tvs_the_big_one = {

        "Speak with Travonce in the Tavnazian Safehold (F-9). His final wish is to reel in the big one, and he asks you to protect him while he fishes.",

        "Between 13:00 and 16:00 (Vana'diel time), leave the Safehold through the southeast exit into Lufaise Meadows. The first person with the quest to enter gets a short cutscene.",

        "Wait until everyone in your party is in Lufaise Meadows before speaking with Travonce; anyone not there cannot take part. The level cap for the escort is 45, Trust magic cannot be used, and uncapped helpers cannot cast on the capped players or on the monsters Travonce fishes up.",

        "Escort Travonce. On the bridge he fishes up at least one Notorious Monster; defeat it. He then heads to the sea (defeat any Orcs on the way), where he fishes up more NMs, and finally to a lake to the north, where he fishes up three more. Defeat them all. Possible NMs: Asrai, Abhac, Vu-Murt, Petrocrab, Cetic Parasite, Ferrocrab and Nakki.",

        "At last he fishes up The Big One, a Flesh-type monster. Defeat it and Travonce gives you the key item Travonce's Escort Award.",

        "Speak with Travonce in the Tavnazian Safehold (F-9) for your reward: Dragon Chronicles, a Glass Fiber Fishing Rod, a Sinking Minnow, or one of the odd things he fished up. The quest is repeatable.",
    },

    oth_tvs_call_of_the_sea = {
        "Speak with Leporaitceau in Tavnazian Safehold (J-8, 3rd floor).",
        "Speak with Equette (I-9, 2nd floor).",
        "Speak with Anteurephiaux (J-8, 3rd floor) to officially begin the quest.",
        "Travel to Misareaux Coast and look for a ??? at (K-12). Checking the ??? spawns the NM Bloody Coffin.",
        "Once the NM is defeated, check the ??? again to receive the key item Whispering conch.",
        "Return to Anteurephiaux. Finally, speak with Equette to complete the quest and receive the Memento Muffler.",
    },

    oth_tvs_unforgiven = {
        "Speak with Elysia on the first floor of Tavnazian Safehold (G-10) to begin the quest. She dropped her hairpin while doing her shopping.",
        "Head up to the third floor of the safehold and examine the ??? behind the pillar at (K-9), near the Walnut Door (maybe twice). You obtain the Alabaster hairpin.",
        "Return to Elysia, then speak with Pradiulot (H-9), for your reward, the Map of Tavnazia. For more of the story, speak with Elysia and Pradiulot once more.",
    },

    oth_tvs_uninvited_guests = {
        "Speak with Justinius on the top floor of Tavnazian Safehold (J-6) to activate the quest and receive a Monarch Linn Patrol Permit. You need Other fame level 1, and the Chains of Promathia mission The Savage must be complete. Every alliance member needs their own permit; it's used up on entry.",
        "Travel to Monarch Linn: the Riverne - Site #B01 Home Point and the Spatial Displacement are fastest. Without it you need 2 Giant Scales for Site #A01 or 1 for Site #B01 (exclusive drops from Firedrakes and Ignidrakes).",
        "One Mammet-800 appears per 2 alliance members (up to 9). They have the abilities of Mammet-19 Epsilon from Promathia Mission 2-5, scaled up; Yellow Liquid (0-3 drop from each) still locks one into its current form. They change stance when someone enters the grassy arena and attack a minute later. The fight ends when the last one dies.",
        "Return to Justinius for your reward, most often a Page from Miratete's Memoirs. You can repeat the quest after each Conquest Tally.",
    },

    oth_tvs_x_marks_the_spot = {
        "Talk to Despachiaire in Tavnazian Safehold (K-10, upper level), behind the Walnut Door at (K-9), to start the quest.",
        "Speak with Parelbriaux (K-7, upper level).",
        "Speak with Odeya (J-10, upper level).",
        "Obtain a Tavnazian Liver from the Orcs in Lufaise Meadows or the Tavnazian Sheep in Lufaise Meadows or Misareaux Coast, and trade it to Odeya.",
        "Go to Phomiuna Aqueducts. Map 1: climb the ladder at (F-6), follow the path and turn right at the T intersection. Map 2: go to (M-8) and climb the ladder; the Iron Gate at (J-6) needs a Bronze Key, or a Thief with several Thief's Tools.",
        "Map 3: take the south corridor and examine the ??? at the north-east corner of (J-9), behind the ladder against the bookcase, to open the secret door. In the hidden hallway, examine the second Ornate Gate at (K-8) for a cutscene.",
        "Return to Odeya for the final cutscene and your reward, 4,000 gil.",
    },

    oth_tvs_tango_with_a_tracker = {
        "Speak with Despachiaire in Tavnazian Safehold (K-10) to obtain the Letter from Shikaree X. The letter has arrived in the safehold, and she wants to gauge your battle prowess in Boneyard Gully.",
        "Head to Boneyard Gully (Attohwa Chasm Home Point #1 is fastest) and select \"Tango with a Tracker\" at the Dark Miasma to enter a battlefield.",
        "You have 30 minutes, up to 6 players, each with their own letter key item; there's no level cap, but Trusts can't be used. Shikaree X is BST/NIN with a rabbit pet (resists sleep but not bind or gravity; if it dies first, X summons another), and Shikaree Y is DRK/MNK. The Shikaree are hard to sleep, it doesn't last, and they build TP fast and skillchain with each other.",
        "Win the battle to complete the quest and receive 10,000 gil.",
    },

    oth_tvs_vw_op_026 = {

        "You need to be level 75 or higher and have an Adventurer's Certificate. Speak with Owain in the Tavnazian Safehold (H-6), at Home Point #1, for a cutscene.",

        "Choose to take part in Voidwatch operations to receive the key item Hyacinth Stratum Abyssite.",

        "Defeat the four Voidwatch Notorious Monsters of the Promathia areas at their planar rifts:",

        "Fjalar in Attohwa Chasm: rifts at (I-9), (K-7) and (K-10).",

        "Abununnu in Lufaise Meadows: rifts at (H-9), (F-8) and (G-7).",

        "Tsui-Goab in Misareaux Coast: rifts at (J-8), (I-7) and (J-10).",

        "Isarukitsck in the Uleguerand Range: rifts at (G-11), (G-10) and (J-10/11).",

        "Return to Owain to complete the quest. VW Op. 004: Bibiki Bombardment begins automatically.",
    },

    -- ========================================================
    -- CARPENTERS' LANDING
    -- ========================================================

    oth_cpl_mithran_delicacies = {

        "You need to be on the Chains of Promathia mission Head Wind. Speak with Anguenet in Carpenters' Landing (J-10), right next to the Survival Guide, and choose the fourth option, Newtpool, to begin the quest.",

        "Obtain a Muddy Siredon. It is fished up in the Newt Pool area of the Phanauet Channel, but one bought from the Auction House works just as well.",

        "Trade the Muddy Siredon to Lourdaude, the Tonberry standing beside Anguenet. He asks for 100 gil.",

        "Trade him 100 gil to receive a Blackened Siredon. The quest is repeatable.",
    },

    -- ========================================================
    -- RIVERNE - SITE A01
    -- ========================================================

    oth_riv_confessions_bellmaker = {
        "Travel to Riverne - Site #A01 and check the Stone Monument at (C-7). You receive a cutscene and the Ornamented scroll.",
        "Speak with Reinberta in Bastok Markets (I-8).",
        "Speak with Mevreauche in Northern San d'Oria (E-6).",
        "Head back to the Stone Monument in Riverne - Site #A01 and check it for a cutscene. Examine it again to spawn the NM Arcane Phantasm.",
        "After defeating the NM, click the Stone Monument once more to complete the quest and receive the Minstrel's Dagger.",
    },

    oth_riv_vw_op_004 = {

        "This quest begins automatically when Owain upgrades your key item to the Hyacinth Stratum Abyssite II at the end of VW Op. 026: Tavnazian Terrors.",

        "Go to Bibiki Bay and take the Manaclipper to Purgonorgo Isle (Map 2), or use the Voidwatch teleport, which is the fastest way.",

        "Defeat Bismarck at one of its planar rifts on Purgonorgo Isle: (F-9), (J-9) or (I-10).",

        "Return to Owain in the Tavnazian Safehold (H-6) to complete the quest.",
    },

    -- ========================================================
    -- ULEGUERAND RANGE
    -- ========================================================

    oth_ule_bombs_away = {
        "You need to be on or past the Chains of Promathia mission Flames for the Dead. Speak with Buffalostalker Dodzbraz in Uleguerand Range (F-9), just southeast of the Unity warp level 128. He is an Orc who despises snolls.",
        "Obtain 2 Cluster Cores, a fairly common drop from Cluster-type monsters.",
        "Trade him the two Cluster Cores to receive your reward, the Shu'Meyo Salt. You can repeat the quest.",
    },

    -- ========================================================
    -- LA THEINE PLATEAU
    -- ========================================================

    oth_lat_waking_the_beast = {
        "Speak with Carbuncle at the ??? in La Theine Plateau (G-6). You must first have obtained spirit pacts with the 6 summonable Celestial avatars before you are presented with the Rainbow resonator.",
        "Collect six key items from much harder versions of the six Celestial avatars, one at each avatar's Cloister. Select \"Waking the Beast\" at the battlefield entrance; you don't need the Trial quests active. Up to 18 players, no Trusts.",
        "The avatars are level 85, use their meritable Blood Pacts and can use Astral Flow at any time. Each has four elementals that share its hate, heal it with tier IV nukes and add their element's debuff to their melee; new ones only appear when the avatar uses its meritable Blood Pact (up to four at a time).",
        "With all six key items, go to the Full Moon Fountain (the Toraimarai Canal Home Point is fastest) for a cutscene and the final battle (up to 18 players). The key items are kept if you lose and used up when you win.",
        "Carbuncle leaves at 75% HP for one Celestial avatar, at 50% for two more and at 25% for the last three, coming back after each group is defeated. Then five Carbuncle Primes spawn at once, each able to use Searing Light (repeatedly); defeat all five to win.",
        "In the cutscene you choose whether to return the Faded ruby. Return to the ??? in La Theine Plateau (G-6): returning it gives the title Disturber of Slumber, keeping it Interrupter of Dreams.",
        "Every player who participates in the final fight receives a Carbuncle's Pole. All other quest rewards are dropped at random at the end of the Carbuncle Prime battle.",
        "You can repeat the quest after the next Conquest Tally.",
    },

    -- ========================================================
    -- OLDTON MOVALPOLOS
    -- ========================================================

    oth_old_generous_general = {

        "You need to be level 60 or higher. Enter Oldton Movalpolos through the far eastern entrance in North Gustaberg (K-6) for a cutscene that starts the quest. This is not the entrance by the Survival Guide. If you turn it down, you cannot start it again until the next Conquest tally.",

        "Speak with Faulpie in the Tanners' Guild in Southern San d'Oria (E-8), near Home Point #4, for a cutscene.",

        "Trade Faulpie a Buffalo Hide, a Sheep Leather and 10,000 gil.",

        "Wait until the next game day and speak with Faulpie again to receive a Goblin Cutting and the recipe for a Goblin Coif. A lost cutting can be replaced for 100,000 gil.",

        "Synthesize a Goblin Coif (Leathercraft 75, Earth Crystal): Goblin Cutting, Steel Sheet, Linen Cloth, 2 Artificial Lens, Moblin Thread, Undead Skin and Sheep Leather.",

        "Enter Oldton Movalpolos again through the (K-6) entrance while wearing the Goblin Coif for a cutscene and the Goblin Recommendation Letter.",

        "Go to (G-8) and examine the Iron Box while wearing the coif to spawn the Goblin Preceptor (RDM) with Grimoire Guru Grimogek, Dread Dealing Dredodak and four Bugbear Portermen. Only the Goblin Preceptor has to be defeated; the others then disappear.",

        "Examine the Iron Box again while wearing the coif for a cutscene, then trade the Goblin Coif to it to receive Choplix's Coif.",

        "Leave Oldton Movalpolos and enter again through the (K-6) entrance while wearing Choplix's Coif for a cutscene and a Gold Beastcoin. You earn the title Moblin Kinsman. The quest can be repeated once per Conquest tally.",
    },

    oth_old_missionary_moblin = {
        "Speak with Koblakiq in Oldton Movalpolos (H-11) to begin the quest. This quest requires the Chains of Promathia pack.",
        "Obtain a Soiled Letter and trade it to Koblakiq to complete the quest and receive 4,000 gil.",
    },

    oth_old_for_the_birds = {
        "After completing Missionary Moblin you need to zone out and back in to initiate this quest. Talk to Koblakiq in Oldton Movalpolos (H-11) to begin it. A letter has arrived from Zeelozok asking for an arnica root to be brought to Castle Oztroja, and Koblakiq entrusts the task to you. It is suggested that you have the three beastmen stronghold Survival Guides, as the quest requires traveling between the three strongholds, and that you bring Echo Drops, Holy Water or someone who can cast Cursna.",
        "Obtain an Arnica Root if you have not already.",
        "Head to Castle Oztroja and go to the Brass Door at (I-8).",
        "The Brass Door has two handles: one opens it, the other opens a trap door in front of it. Pull one and immediately step away; if the trap door opens, wait for it to close and pull the other.",
        "On the next map, go to (G-7) and through the exit onto a ledge; walk north along it to Daa Bola the Seer at (I-7) and trade him the Arnica Root.",
        "Return to Koblakiq in Oldton Movalpolos for the key item Glittering fragment.",
        "In Beadeaux, go down at (H-7) into the tunnels and out at (F-8). The Afflictors curse anyone nearby (Cursna or Holy Water) unless you're silenced: touch The Mute in the north of (G-7) first (Echo Drops or Silena remove the silence).",
        "Above ground, go up to the upper level at (E-10) and to the large island at (G-10) to speak with Ge'Fhu Yagudoeye. Four Quadav NMs spawn: two Nickel Quadavs (PLD) and two Magnes Quadavs (BLM), easy solo at 75. Only one player can do this at a time; others wait 3 minutes and spawn them again.",
        "After the fight, talk to Ge'Fhu Yagudoeye again for a short cutscene.",
        "Head back to Oldton Movalpolos and speak with Koblakiq to complete the quest and receive your Jaguar Mantle.",
    },

    oth_old_better_the_demon = {
        "Speak with Koblakiq in Oldton Movalpolos (H-11) to begin the quest. Make sure you have zoned after completing For the Birds. To save time, you can bring a Demon Pen with you when you travel to start this quest.",
        "Head to Castle Zvahl Baileys and fight Blood Demons and Demon Generals until you obtain a Demon Pen.",
        "Trade the Demon Pen to Koblakiq, wait one Earth minute and speak with him again.",
        "In Castle Zvahl Baileys, examine the ??? at (I-8), behind the gate where Dark Spark spawns, to spawn Marquis Andrealphus with 2 Demon Bannerets and 2 Demon Secretaries (sleepable). Nearby demons link. Only the Marquis must die; the extras then die too. He can Escape whoever has hate back to Xarcabard, unless only one party member is left in the zone or you're solo.",
        "Examine the ??? again for the key item Zeelozok's earplug, and return to Koblakiq to complete the quest and receive the Goblin Grenade.",
    },

    -- ========================================================
    -- MOG HOUSE
    -- ========================================================

    oth_mog_give_moogle_break = {
        "Place a Bronze Bed in your Mog House using the furniture Layout menu. You need Other fame level 3 (home nation fame). Wait one Earth minute, exit your Mog House, re-enter and speak to the Moogle. If you have enough fame, you receive a cutscene.",
        "If you get the A Moogle Kupo d'Etat cutscene instead, speak to him again. If an item that gives weekly conquest rewards (such as an Aurum Coffer) is in your layout, you may need to remove it to trigger the quest.",
        "Trade the Moogle the items he asks for: a Power Bow and a Beetle Ring. The Power Bow can be bought from a Records of Eminence NPC using Sparks (equip level 10 to 19). The Beetle Ring +1 does not count.",
        "When your Moogle returns from his trip after one Earth minute (without ever leaving your Mog House), he gives you a Mog Safe that holds 60 items and you receive the title Mog's Kind Master.",
    },

    oth_mog_moogles_in_the_wild = {
        "Place a Noble's Bed in your Mog House, zone out and back in, wait one Earth minute and speak to your Moogle (maybe twice). You need to have completed The Moogle's Picnic! and have home nation fame level 7. Remove any weekly conquest-reward item (such as an Aurum Coffer) from your layout if it won't trigger.",
        "Trade your Moogle a Raptor Mantle and a Wool Hat.",
        "When he returns from his trip after one Earth minute, your Mog Safe holds 80 items.",
    },

    oth_mog_moogles_picnic = {
        "Place a Mahogany Bed in your Mog House, zone out and back in, and speak to the Moogle (maybe twice). You need to have completed Give a Moogle a Break and have home nation fame level 5. If an item that gives weekly conquest rewards (such as an Aurum Coffer) is in your layout, you may need to remove it.",
        "Trade your Moogle a Shrimp Lure and Selbina Butter.",
        "When he returns from his trip after one Earth minute, your Mog Safe holds 70 items.",
    },

    -- ========================================================
    -- DAVOI
    -- ========================================================

    oth_dav_understanding_overlord = {

        "You need to be level 60 or higher. Enter the Monastic Cavern through the (G-7) entrance in Davoi for a cutscene that starts the quest. If you turn it down, you cannot start it again until the next Conquest tally.",

        "Speak with Faulpie in the Tanners' Guild in Southern San d'Oria (E-8) for a cutscene.",

        "Trade Faulpie a Buffalo Hide, a Ram Leather and 10,000 gil.",

        "Wait until the next game day and speak with Faulpie again to receive an Orc Cutting and the recipe for an Orc Helm.",

        "Synthesize an Orc Helm (Leathercraft 74, Earth Crystal): Orc Cutting, Iron Sheet, Linen Thread, Wool Thread, 2 Manticore Hair and 2 Black Pearls.",

        "Enter the Monastic Cavern again while wearing the Orc Helm for a cutscene and the key item Communication from Tzee Xicu.",

        "Examine the Cryptexphere (F-6) while wearing the helm to spawn the Orcish Overlord and six other Orc NMs. Only the Orcish Overlord has to be defeated; the others then disappear.",

        "Examine the Cryptexphere again while wearing the helm for a cutscene, then trade the Orc Helm to it to receive Gadzradd's Helm.",

        "Leave the Monastic Cavern and enter again while wearing Gadzradd's Helm for a cutscene and a Gold Beastcoin. You earn the title Orcish Serjeant. The quest is repeatable.",
    },

    -- ========================================================
    -- BEADEAUX
    -- ========================================================

    oth_bea_affable_adamantking = {

        "You need to be level 60 or higher. In Beadeaux, enter the Qulun Dome at (H-7), on the left after first going underground, for a cutscene that starts the quest. If you turn it down, you cannot start it again until the next Conquest tally.",

        "Speak with Peshi Yohnts in Windurst Woods (H-13) for a cutscene.",

        "Trade Peshi Yohnts a Bugard Leather, a Turtle Shell and 10,000 gil.",

        "Wait until the next game day and speak with Peshi Yohnts again to receive Quadav Parts and the recipe for a Quadav Barbut.",

        "Synthesize a Quadav Barbut (Bonecraft 78, Earth Crystal): Quadav Parts, Tiger Leather, Lizard Molt, Bugard Tusk, Wool Thread, Red Grass Cloth and 2 Black Pearls.",

        "Enter the Qulun Dome at (H-7) again while wearing the Quadav Barbut for a cutscene and the key item Orcish Seeker Bats.",

        "Examine the Beastmen's Banner (F-8) while wearing the barbut to spawn the Diamond Quadav (WHM) and six other Quadav NMs. Only the Diamond Quadav has to be defeated; the others then disappear. It can use Benediction, which heals and wakes the NMs around it.",

        "Examine the Beastmen's Banner again while wearing the barbut for a cutscene, then trade the Quadav Barbut to it to receive Da'Vhu's Barbut.",

        "Leave the Qulun Dome and enter again while wearing Da'Vhu's Barbut for a cutscene and a Gold Beastcoin. You earn the title Bronze Quadav. The quest is repeatable.",
    },

    -- ========================================================
    -- PASHHOW MARSHLANDS
    -- ========================================================

    oth_pas_monstrosity = {

        "Speak with the Suspicious Hume in the Pashhow Marshlands (E-12). The Voidwatch teleport or the Unity Warp to the Pashhow Marshlands are the quickest ways there.",

        "He asks for one of three items: a Rabbit Hide, a Lizard Tail or a Two-Leaf Mandragora Bud. The Bog Bunnies just north of him drop Rabbit Hides.",

        "Trade the item to any of the Suspicious NPCs: the Suspicious Tarutaru in Port Windurst (M-4) near Home Point #3, the Suspicious Elvaan in Northern San d'Oria (L-8) near Home Point #3, or the Suspicious Galka in Port Bastok (K-12) near Home Point #2. After a short cutscene you receive the Ring of Supernal Disjunction.",

        "Examine the Odyssean Passage and enter it for a cutscene that completes the quest. You can now take part in Monstrosity.",

        "For The Curious Case of Melvien you can get the Gladiatorial Writ of Summons from any of the Suspicious NPCs (choose Belligerency). If you only want it for the Mog Garden, return the writ afterwards, or you stay flagged for Belligerency in its zones.",
    },

    -- ========================================================
    -- XARCABARD
    -- ========================================================

    oth_xar_survival_of_wisest = {

        "You need to be a Scholar of level 66 or higher, and must have completed Seeing Blood-red and waited until the next game day.",

        "Zone into Xarcabard for a cutscene. The Survival Guide and Teleport-Vahzl both work.",

        "Obtain a Scholar's Testimony, which drops from Orcs such as the Orcish Stonechucker, Orcish Fodder and Orcish Mesmerizer in East Ronfaure (S).",

        "Go to the Throne Room in Castle Zvahl Keep for a cutscene at the door, then trade the Scholar's Testimony to the door to start the fight. All buffs are lost on entry and your support job is disabled; Trust magic is allowed if you have the key item Rhapsody in Umber.",

        "Fight Schultz and his Crimson Grimoire. You win when Schultz is down to about 20% HP; the Grimoire does not have to be defeated. Engage quickly, since both buff themselves if left alone, and neither can be slept reliably. If you are not using Trusts or are undergeared, defeat the Grimoire first, as it has much less HP.",

        "Winning completes the quest, raises your level limit to 75 and earns the title Grimoire Bearer. If you have already completed New Worlds Await or a later limit break, you do not need this quest for the level limit.",
    },

    -- ========================================================
    -- MULTI-NATION
    -- ========================================================

    oth_mul_moral_manifest = {
        "Enter the Altar Room in Castle Oztroja for a cutscene with Hooknox that starts the quest (go past the left/right switch gate with the trap door, to (G-7) onto another map, turn right and go straight back into the castle, then to (G-10)). You need to be level 60 or higher. If you turn it down, you can't start it again until the next Conquest Tally.",
        "Speak with Ponono in Windurst Woods (G-12) for a cutscene, then trade him a Velvet Cloth, a Rainbow Cloth and 10,000 gil.",
        "Wait until the next game day and speak with Ponono again for the Yagudo Cutting. Synthesize a Yagudo Headgear (Clothcraft 80, Leathercraft 50, Bonecraft 55, Earth Crystal): Yagudo Cutting, Bugard Tusk, Cockatrice Skin, Wool Thread, 2 Yagudo Feathers and 2 Black Pearls.",
        "Return to the Altar Room while wearing your Yagudo Headgear for a cutscene. You receive the key item Vault quipus.",
        "Examine the Stone Lid while wearing the headgear to spawn the Yagudo Avatar with Duu Masa the Onecut, Fee Jugu the Ramfist, Goo Pake the Bloodhound, Kee Taw the Nightingale, Laa Yaku the Austere and Poo Yozo the Babbler. Only the Yagudo Avatar must be defeated; the others then despawn. Examine the Stone Lid again, wearing the headgear, for a cutscene.",
        "Trade your Yagudo Headgear to the Stone Lid for a cutscene; it is replaced by Tsoo's Headgear.",
        "Wearing Tsoo's Headgear, zone out to the south of the Altar Room and back in for a cutscene and a Gold Beastcoin. You receive the title Yagudo Initiate.",
    },

    oth_mul_records_of_eminence = {

        "Open the main menu and select Quests. Under Records of Eminence, go to Objective List > Tutorial > Basics and set the objective First Step Forward.",

        "Speak with one of the Records of Eminence NPCs: Isakoth in Bastok Markets (E-11), Rolandienne in Southern San d'Oria (G-10), Fhelm Jobeizat in Windurst Woods (J-10), or the Eternal Flame in Western Adoulin (H-11).",

        "This completes First Step Forward, gives you the key item Memorandoll and unlocks the other Records of Eminence objectives. Some objectives only appear after completing others.",
    },

    oth_mul_unity_concord = {

        "You need to have completed ten or more Records of Eminence objectives.",

        "Set the Records of Eminence objective All for One, found under Tutorial in the Records of Eminence menu.",

        "Speak with a Unity Concord NPC: Urbiolaine in Southern San d'Oria (G-10), Igsli in Bastok Markets (E-11), Teldro-Kesdrodo or Yonolala in Windurst Woods (J-10), or Nunaarl Bthtrogg in Western Adoulin (H-11).",

        "Choose a Unity to join: Pieuje, Ayame, Invincible Shield, Apururu, Maat, Aldo, Jakoh Wahcondalo, Naja Salaheem, Flaviria, Sylvie or Yoran-Oran. This completes the quest.",

        "Unity objectives in Records of Eminence earn Accolades, spent at the same NPCs on items, Unity Warps and the Wanted battles. You can change Unity once per Conquest week for an Accolade fee.",
    },
}

return Q