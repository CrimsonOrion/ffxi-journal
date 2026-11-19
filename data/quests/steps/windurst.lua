local Q = {}

Q.STEPS = {

    -- ========================================================
    -- WINDURST WATERS
    -- ========================================================

    wq_wt_hat_in_hand = {
        "Speak with Baren-Moren in the hat shop in Windurst Waters South (H-7) to start the quest and receive the New Model Hat.",
        "Stay in Windurst Waters until the quest is finished, and show the hat off by talking to the townsfolk.",
        "Talk to Bondada in the hat shop, Honoi-Gomoi in Gingerberry Grove (E-7) and Kenapa-Keppa in the Rhinostery (South map), since they react to the hat.",
        "On the North map, talk to Clais near the bridge to the Rarab's Tail Hostelery (G-10), Kyume-Romeh in the Timbre Timbers Tavern (F-10), Tosuka-Porika in the east Optistery (G-8), Pechiru-Mashiru in the east Aurastery (L-6) and Machitata near the Mog House (L-11).",
        "Keep talking to as many other NPCs as you can: too few gives no credit, and the reward grows with the number you speak to.",
        "Return to Baren-Moren and choose \"Hang up your hat\" to complete the quest and receive your reward.",
    },

    wq_wt_feather_in_ones_cap = {
        "Complete Hat in Hand first, then zone before taking this quest.",
        "Speak with Baren-Moren in the hat shop in Windurst Waters South (H-7); he asks you to bring him Giant Bird Feather x3.",
        "Collect Giant Bird Feather x3, which drop from Tabar Beak and Axe Beak enemies in the Meriphataud Mountains and Sauromugue Champaign.",
        "Trade Giant Bird Feather x3 to Baren-Moren in a single trade to complete the quest and receive 1,500 gil.",
    },

    wq_wt_crisis_in_the_making = {
        "Speak with Ranpi-Monpi in the Culinarians' Guild in Windurst Waters North (D-9); he accidentally spoiled the food offering meant for the Yagudo.",
        "Travel to Giddeus via West Sarutabaruta. You can't do this while The Dawn of Delectability is active; a Map of Giddeus helps.",
        "Enter the caves at (F-8) or (I-8), behind where you left the offering in Windurst Mission 1-3, go down to the lower level and the storage room at (G-6), and examine the altar for the key item Off Offering.",
        "Return to Ranpi-Monpi and speak with him again to complete the quest and receive 400 gil.",
    },

    wq_pw_making_amends = {
        "If you are on the mission The Horutoto Ruins Experiment, complete it first. If you are on Saintly Invitation, finish the fight against the Yagudo first, or the quest will not start.",
        "Speak with Hakkuru-Rinkuru in the Orastery in Port Windurst (E-7); he needs glue to patch Minister Ajido-Marujido's broken wand.",
        "Obtain an Animal Glue.",
        "Trade the Animal Glue to Hakkuru-Rinkuru to complete the quest and receive 1,500 gil.",
    },

    wq_wt_making_the_grade = {
        "Make sure Let Sleeping Dogs Lie and Teacher's Pet are not active, and zone first if you have just finished one of them.",
        "Speak with Fuepepe in the Aurastery in Windurst Waters North (L-6); the students' exam answer sheets have been stolen.",
        "Obtain the Test Answers: they drop from Wendigos in Inner Horutoto Ruins past the Three Mage Gate (shown as \"Pile of answer sheets\" in the log), or can sometimes be bought at the Auction House.",
        "Trade the Test Answers to Fuepepe, who tells you to take them to Koru-Moru in Windurst Walls.",
        "Trade the Test Answers to Koru-Moru in Windurst Walls (E-7), not Yoran-Oran, for a Tattered test sheet.",
        "Return to Fuepepe to complete the quest and receive the Scroll of Aspir.",
        "Optional: show the Tattered test sheet to Chomoro-Kyotoro and Kirarara on top of the Windurst Waters Aurastery for extra dialogue.",
    },

    wq_wt_in_a_pickle = {
        "Speak with Chamama in Windurst Waters (F-10) to start the quest.",
        "Obtain a Smooth Stone, which drops from Crawler enemies in East Sarutabaruta and West Sarutabaruta.",
        "Trade the Smooth Stone to Chamama.",
        "Chamama does not always accept the stone: if she refuses it, get another Smooth Stone and bring it to her. It can be rejected several times in a row.",
    },

    wq_wt_wondering_minstrel = {
        "In Windurst Waters North, enter the Timbre Timbers tavern (F-10) and speak with Yuli Yaam, then Yung Yaam, then Jatan-Paratan.",
        "Answer \"I have no recollection at all\" to continue, then speak with Jatan-Paratan again; the quest now appears in your quest log.",
        "Speak with Aramu-Paramu.",
        "Go to Lower Jeuno and speak with Ruslan (I-8) in the Merry Minstrel tavern.",
        "Trade a piece of Rosewood Lumber to Jatan-Paratan to complete the quest and receive your reward.",
    },

    wq_wt_pose_by_any_other_name = {
        "Make sure you are wearing a body armor piece, or the quest cannot start.",
        "Speak with Angelica in Windurst Waters (F-10); she asks for a piece of body armor that depends on your job.",
        "Bring the item she asks for: Bronze Harness (Warrior, Paladin, Dark Knight, Dragoon, Corsair), Robe (Monk, Bard, Blue Mage), Leather Vest (Thief, Beastmaster, Ranger, Dancer), Tunic (White Mage, Red Mage, Black Mage, Summoner, Puppetmaster) or Kenpogi (Ninja, Samurai). The +1 versions do not work.",
        "The quest is timed: if you take too long to return dressed in the requested item, it ends without success. You can try again by zoning out and back in.",
        "Talk to Angelica and stand still for 10 seconds.",
        "Talk to Angelica again; she tells you to wear your item.",
        "Talk to Angelica one last time to complete the quest and receive Ancient Blood and Angelica's autograph.",
    },

    wq_pw_making_amens = {
        "This quest cannot be completed while you are on Windurst Mission 8-1 or the quest Orastery Woes, so finish those first.",
        "Speak with Kuroido-Moido in Port Windurst (E-7) to start the quest; zone first if you have just completed Making Amends.",
        "Go to Garlaige Citadel.",
        "Inside, defeat Fallen Evacuee enemies in the small rooms near the entrance until one drops a Garlaige Key.",
        "To pass the Banishing Gates alone, take a Pouch of weighted stones from the ??? on the ground on map 1 (G-8).",
        "Go through Banishing Gate #1 at (I-9) on map 1, then Banishing Gate #2 at (H-10) on map 2.",
        "Use the Garlaige Key to enter the Incinerator room at (I-7) on map 3. The quest Rubbish Day also sends you there, so it is recommended to do both at the same time.",
        "Speak with Mashira, who hands you a Broken wand.",
        "Return to Kuroido-Moido to complete the quest and receive 6,000 gil.",
    },

    wq_wt_moonlit_path = {
        "Warning: Trust magic cannot be used in the final battle at the Full Moon Fountain.",
        "Speak with Leepe-Hoppe in Windurst Waters South (J-9) to start the quest. If the quest Tuning In is offered instead (cutscene with Shikaree Y), zone and speak with Leepe-Hoppe again to get the right cutscene.",
        "Defeat the six avatar primes to collect their whispers. Do not give the whispers to the NPCs who grant access to those battles, or you will lose them.",
        "Turn the whispers in to Leepe-Hoppe to receive a Moon bauble.",
        "Go to the Full Moon Fountain. It helps to home point at Toraimarai Canal #1 beforehand, or you can warp to Toraimarai Canal with the Survival Guide.",
        "With the Moon bauble key item, interact with the fountain to enter the battlefield. Up to 6 party members can enter, each needs their own Moon bauble, and the time limit is 30 minutes.",
        "Defeat Fenrir Prime to receive the key item Whisper of the moon.",
        "Return to Leepe-Hoppe and turn in the whisper to receive your reward; you can only choose one of the rewards offered.",
        "You can repeat this quest once per Earth day: after completing it, speak with Leepe-Hoppe again for another Moon bauble, without collecting the whispers again.",
    },

    wq_wl_star_struck = {
        "Defeat Savanna Rarab in West Sarutabaruta until one drops a Torn Epistle.",
        "Speak with Koru-Moru in Windurst Walls (E-7) while the Torn Epistle is in your inventory.",
        "Optional: trade the Torn Epistle to Koru-Moru for 50 gil, although it is not necessary.",
        "Go to West Sarutabaruta and defeat Crawler enemies there until one drops a Meteorite.",
        "Trade the Meteorite to Koru-Moru to complete the quest and receive your reward.",
    },

    wq_wl_blast_from_the_past = {
        "If the quest Class Reunion is active, finish it first: you cannot start this quest until it is complete.",
        "Zone in and out if you have just completed Star Struck.",
        "Speak with Koru-Moru in Windurst Walls (E-7) to start the quest.",
        "Optional hints: Luuh Koplehn, Bonchacha and Maan-Pokuun outside; Maan-Pokuun sends you to Yoran-Oran, and once Tokaka (fishing guild) says Yoran-Oran had one, Yoran-Oran names the Maze of Shakhrami.",
        "Go to the Maze of Shakhrami.",
        "Examine the Fossil Rock at (F-8) on map 2 to spawn the NM Ichorous Ire, which drops a Burnite Shell.",
        "Trade the Burnite Shell to Koru-Moru to complete the quest.",
    },

    wq_wt_smudge_on_ones_record = {
        "You must zone after completing Chasing Tales before you can start this quest.",
        "Speak with Hariga-Origa in Windurst Waters (F-8).",
        "Obtain a Slime Oil and a Frost Turnip.",
        "Trade the Slime Oil and the Frost Turnip to Hariga-Origa at the same time to complete the quest and receive your reward.",
    },

    wq_wt_chasing_tales = {
        "Zone first if you have just completed Early Bird Catches the Bookworm.",
        "Speak with Tosuka-Porika in Windurst Waters (G-8).",
        "Speak with Furakku-Norakku behind the counter in the same room. He says that Hae Jakkya at the Windurst Woods Auction House has an overdue romance novel, \"A Song of Love\", and gives you an Overdue book notification.",
        "Deliver the notification to Hae Jakkya at (I-12) in Windurst Woods.",
        "Return to Furakku-Norakku.",
        "Go to Southern San d'Oria and speak with Hae Jakhya (G-9) to receive the overdue library book, \"A Song of Love\". She is on top of the wall, so take the passage at (F-8) to get up there.",
        "Return the book to Furakku-Norakku to complete the quest and receive 2,800 gil.",
    },

    wq_wt_food_for_thought = {
        "This quest cannot be started if you have started Say It with Flowers or the mission The Price of Peace. If Kerutoto keeps asking about challenging Diabolos, accept Waking Dreams first; once it's in your quest log you can start this one.",
        "Talk to these NPCs in this exact order: first Ohbiru-Dohbiru in the southern Rhinostery building (J-9), who says he's hungry; then Kerutoto in the northern Rhinostery building (J-8), which adds the quest to your log.",
        "Speak with Ohbiru-Dohbiru again, and with Kenapa-Keppa three times, to get their food orders.",
        "Trade Kerutoto a Grilled Hare (440 gil), Kenapa-Keppa a Hard-boiled Egg (120 gil), and Ohbiru-Dohbiru a Pamtam Kelp, a Tortilla and Windurstian Tea (440 gil).",
        "The quest completes automatically once the final order is traded, so you do not need to speak with Kerutoto again.",
    },

    wq_wt_overnight_delivery = {
        "You must zone after completing Food for Thought before you can start this quest.",
        "Speak with Kenapa-Keppa in Windurst Waters South (J-9) after 7:00 Vana'diel time; you need to speak with him four times to officially begin the quest.",
        "Go to Mhaura and speak with Kotan-Purutan at (I-9), near the ferry ticket area, after 18:00 Vana'diel time to obtain a Small bag.",
        "Return to Kenapa-Keppa before 6:00 to complete the quest.",
    },

    wq_wt_water_way_to_go = {
        "Zone first if you have just completed Overnight Delivery.",
        "Speak with Ohbiru-Dohbiru in Windurst Waters South (J-9) to receive a Rhinostery Canteen.",
        "Trade the Rhinostery Canteen to the Giddeus Spring at (K-12) or (E-12) in Giddeus to receive a Canteen of Giddeus water.",
        "Return to Ohbiru-Dohbiru and trade him the Canteen to complete the quest and receive 900 gil.",
        "This quest is repeatable, but it cannot be repeated if you have activated the quest Curses, Foiled A-Golem!?.",
    },

    wq_wt_blue_ribbon_blues = {
        "To get a Purple Ribbon, first speak with Roberta in the Nchaa's Good Goods shop in Windurst Woods (I-13).",
        "Give the Purple Ribbon to Kerutoto in the northern Rhinostery building in Windurst Waters South (J-8) for 3,600 gil.",
        "Wait one Earth minute, then speak with Kerutoto again; she gives the ribbon back. If you can take on Waking Dreams, you have to accept the Diabolos fight before she moves on.",
        "Go to The Eldieme Necropolis from Batallia Downs (J-10), or by Survival Guide. You need a Magicked astrolabe or a friend on the switches. Go straight to the intersection at (J-8), turn left and follow the path west to Titan's Gate at (G-8), go north through it and step on the square of bones to fall to map 2 (L-10). Go east to the Hume Bones at (M-10).",
        "Trade the Purple Ribbon to the Hume Bones to spawn the NM Lich C Magnus, which can drop the level 50 club Lilith's Rod.",
        "If the rod does not drop, rezone without touching the Hume Bones and repeat the quest from the beginning for another chance.",
        "If you lose the Purple Ribbon, you must wait until the next Conquest Tally to get it back. If several party members need the quest, wait 5 minutes after the defeat between each spawn.",
        "After the NM is defeated, check the Hume Bones again to receive a Blue Ribbon.",
        "Return to Kerutoto to complete the quest.",
    },

    wq_wd_all_new_c3000 = {
        "Zone first if you have just completed the previous quest.",
        "Speak with Kopuro-Popuro in Windurst Woods (H-10) to start the quest.",
        "Obtain a Beetle Shell and a Hecteyes Eye.",
        "Trade the Beetle Shell and the Hecteyes Eye to Kopuro-Popuro to complete the quest and receive 600 gil.",
    },

    wq_wl_postman_ko_twice = {
        "Speak with Ambrosius in Windurst Walls (J-12) to start the quest.",
        "Collect Muddy Bar Tab, which drops from Savanna Rarab in East Sarutabaruta.",
        "Collect Torn Epistle, which drops from Savanna Rarab in West Sarutabaruta.",
        "Collect Odd Postcard and Damp Envelope, which drop from Canyon Rarab in Tahrongi Canyon.",
        "Trade one to four of these items to Ambrosius in a single trade to complete the quest: 1 gives 50 gil, 2 give 150 gil, 3 give 250 gil and 4 give 500 gil.",
    },

    wq_wt_early_bird = {
        "Speak with Tosuka-Porika in Windurst Waters North (G-8) to start the quest; you are sent to Furakku-Norakku, who gives you the Overdue book notification for Orn.",
        "Deliver it to Orn at (F-10), in the Rarab Tail Hostelry room above the Timbre Timbers Tavern.",
        "Optional: speak with Furakku-Norakku again at Orn's request.",
        "Go to Giddeus and speak with Quu Bokye, then trade a Silver Beastcoin to receive \"Art for Everyone\".",
        "Quu Bokye is in the Treasure Room on the underground map of Giddeus: the northwest room at the end of a U-turn on the map.",
        "Speak with Furakku-Norakku with the key item to complete the quest.",
    },

    wq_pw_catch_it_if_you_can = {
        "Speak with Ohruru in Port Windurst (E-7) to start the quest.",
        "Return to her while you are under the effect of Bane, Mute or Plague.",
        "Bane is inflicted by Lost Soul enemies in The Eldieme Necropolis, and pays 1,200 gil.",
        "Mute is inflicted through the additional effect of the weapon of Eight of Cups in the Outer Horutoto Ruins (enter from (F-11) in West Sarutabaruta), and pays 1,000 gil.",
        "Plague (1,500 gil) is inflicted by Bloodsucker enemies in Toraimarai Canal, by Deathmaw Orobon enemies in the Ceizak Battlegrounds with Vile Belch (which also inflicts Silence, so use an item or Echo Drops first if you plan to warp back to Ohruru), and by the Devouring Mosquito in Reisenjima with Infected Leech, which lasts 45 seconds. Many of these wear off quickly, so set your Home Point at Port Windurst #1.",
        "Once the quest is complete, she removes the status ailment from you.",
    },

    wq_pw_all_at_sea = {
        "Speak with Paytah at the pier near the shopping piers in Port Windurst (I-7).",
        "Fish a Ripped Cap out of the water and trade it to Paytah.",
        "Take the Ripped Cap to Baren-Moren in Windurst Waters South (H-7).",
        "Bring Baren-Moren Dhalmel Hide x4 so he can repair the cap.",
        "Return the repaired cap to Paytah to complete the quest and receive your reward.",
    },

    wq_wd_all_new_c2000 = {
        "Speak with Kopuro-Popuro in Windurst Woods (H-10) to start the quest.",
        "Obtain a Rabbit Hide, a Two-Leaf Mandragora Bud and an Insect Wing.",
        "The Two-Leaf Mandragora Bud is exclusive and can be found by defeating most Mandragora-type enemies, including Tiny Mandragora in East Sarutabaruta and West Sarutabaruta.",
        "Trade the Two-Leaf Mandragora Bud, the Insect Wing and the Rabbit Hide to Kopuro-Popuro to complete the quest and receive 200 gil.",
    },

    wq_wd_mihgos_amigo = {
        "This quest cannot be started while you have the quests The Tenshodo Showdown, As Thick as Thieves, Hitting the Marquisate or Rock Racketeer, or Windurst Mission 2-1, active.",
        "Speak with Nanaa Mihgo in Windurst Woods (J-3) several times until the quest is flagged.",
        "Obtain Yagudo Necklace x4.",
        "Trade the Yagudo Necklace x4 to Nanaa Mihgo to complete the quest and receive 200 gil.",
        "Completing it raises your fame in Norg, not in Windurst: 53 completions bring your Norg fame to level 4, enough to start The Sahagin's Stash (Utsusemi: Ichi) and Trial by Water.",
        "Completing this quest is also one of the requirements to obtain Nanaa Mihgo's Trust.",
    },

    wq_wd_rock_racketeer = {
        "Speak with Nanaa Mihgo in Windurst Woods (J-3) to receive the key item Sharp gray stone.",
        "Speak with Ardea in Bastok Markets (H-8), near Home Point #4, and sell her the stone for 10 gil.",
        "Return to Nanaa Mihgo.",
        "Speak with Varun in Windurst Woods (H-9).",
        "Optional: speak with Ardea again to try to get the stone back.",
        "Obtain some pickaxes, then go to the third floor of Palborough Mines.",
        "At (I-9) you find two Mythril Seams. Mine the western seam to get a Sharp Stone.",
        "Trade the Sharp Stone to Varun to complete the quest and receive 2,100 gil.",
    },

    wq_wd_chocobilious = {
        "Speak with Kuoh Rhel inside the corral at the Chocobo Stables in Windurst Woods (K-12) to start the quest.",
        "Obtain a Papaka Grass.",
        "Speak with Tapoh Lihzeh at the medicine shop at (I-8), past the Dhalmel farm, and trade her one Papaka Grass.",
        "Speak with Kuoh Rhel again to complete the quest and receive 1,500 gil.",
    },

    wq_wt_teachers_pet = {
        "Speak with Moreno-Toeno in the east Aurastery in Windurst Waters North (L-6). You may need to speak with him twice.",
        "Obtain a Bird Feather. It can be bought at the Auction House, or dropped by Carrion Crow enemies outside Windurst.",
        "Obtain a Two-Leaf Mandragora Bud, which only drops from Mandragora enemies such as Tiny Mandragora in East and West Sarutabaruta.",
        "Trade the Bird Feather and the Two-Leaf Mandragora Bud to Moreno-Toeno to complete the quest and receive 250 gil.",
    },

    wq_wt_reap_what_you_sow = {
        "If your Windurst fame is level 4 or higher, you are assigned Let Sleeping Dogs Lie instead, and you cannot start this quest until you complete that one.",
        "Speak with Mashuu-Ajuu in Windurst Waters North (K-6); he gives you a bag of Herb Seeds and asks you to plant them.",
        "Plant the seeds to grow a Deathball or a Sobbing Fungus, or buy one at the Auction House. A Sobbing Fungus can also be bought from Soupox in Leafallia for 60 gil.",
        "Trade a Deathball to Mashuu-Ajuu to receive a Stationery Set and 700 gil, or a Sobbing Fungus to receive a Stationery Set and 500 gil.",
        "To repeat the quest you must trade a Sobbing Fungus.",
    },

    wq_wt_glyph_hanger = {
        "Speak with Hariga-Origa in Windurst Waters North (F-8); you receive the key item Note from Hariga-Origa, to be delivered to Ipupu.",
        "Take the note to Ipupu in West Sarutabaruta (I-8/J-8), near the entrance to Windurst Waters.",
        "Ipupu accepts it and gives you the key item Note from Ipupu in return.",
        "Deliver the Note from Ipupu to Hariga-Origa to complete the quest and receive your rewards.",
    },

    wq_wd_the_fanged_one = {
        "Speak with Perih Vashai in Windurst Woods (K-7). She may say something about Trusts the first time you talk to her after zoning in; keep talking to her until her dialogue is about this quest.",
        "Travel to Sauromugue Champaign and find the cave at (L-10); to get there, go up the cliff at (L-8). The Survival Guide at (J-9/J-10) is the easiest way to reach it.",
        "Examine the Tiger Bones in the cave to spawn the Old Sabertooth, and watch it die naturally, which takes about three Earth minutes. Don't fight or otherwise disturb it, or you won't get the key item.",
        "Once the Old Sabertooth has died on its own, examine the Tiger Bones to get the key item Old tiger's fang.",
        "If you do not examine the Tiger Bones soon enough after its death, you must examine them again and watch it die naturally once more.",
        "Return to Perih Vashai to complete the quest and receive the Ranger's Necklace.",
    },

    wq_wl_curses_foiled_again = {
        "Speak with Shantotto in Windurst Walls (K-7) to start the quest. The quest Blood and Glory may prevent you from starting it: come back with a job that does not meet the prerequisites for Blood and Glory.",
        "Obtain Bone Chip x2 and a Bomb Ash; both can be bought from NPCs.",
        "Trade the Bone Chip x2 and the Bomb Ash to Shantotto to complete the quest and receive a Brass Rod.",
    },

    wq_wl_curses_foiled_again2 = {
        "Wait one game day and zone after completing the previous quest. Speak with Hiwon-Biwon in Windurst Walls (K-8), then with Shantotto (K-8).",
        "Zone out and back, and speak with Shantotto again. Answer her first question either way, and the second with \"No way! Not on your life!\" (title Tarutaru Murder Suspect).",
        "She wants 2 Bomb Arms, a Revival Tree Root and Hiwon's Hair. Speak with Hiwon-Biwon again for the hair. Bomb Arm can be bought from Nogga on the top floor of Metalworks (G-7) for 690 gil when Bastok is at least 2nd in Conquest.",
        "Trade the items to Shantotto to complete the quest and receive a Misery Staff.",
    },

    wq_wl_mandragora_mad = {
        "Speak with Yoran-Oran in Windurst Walls (E-5); he asks for one of several items.",
        "Trade a Four-Leaf Mandragora Bud for 120 gil. It drops from Mandragora enemies in West Sarutabaruta, Pygmaioi enemies in Tahrongi Canyon and Sylvestre enemies in Buburimu Peninsula.",
        "Trade a Cornette for 200 gil. It drops from the Mandragora and Pygmaioi enemies above, and can also be bought for 50 sparks from the Records of Eminence NPCs, or from Harmodios in Bastok Markets (K-10) when Bastok is 1st or 2nd in Conquest.",
        "Trade a Yuhtunga Sulfur for 250 gil. It drops from the same enemies as the Four-Leaf Mandragora Bud.",
        "Trade a Three-Leaf Mandragora Bud for 1,200 gil. It drops from Yuhtunga Mandragora enemies in Yuhtunga Jungle.",
        "He also accepts a Snobby Letter. In total the quest pays between 120 and 5,500 gil, depending on the item.",
    },

    wq_wl_to_bee_or_not_to_bee = {
        "If Zayhi-Bauhi speaks normally instead of coughing, speak with Kalupa-Tawalupa and Rutango-Botango in front of him to receive the quest.",
        "Speak with Raamimi in Windurst Walls (F-7) to receive Honey.",
        "Trade the Honey to Zayhi-Bauhi, the speaker by the bridge to Heavens Tower, then speak with Kalupa-Tawalupa and Rutango-Botango.",
        "Trade 4 more Honey, one at a time, to Zayhi-Bauhi.",
        "Return to Raamimi to complete the quest and receive Mulsum x3.",
    },

    wq_pw_truth_justice_onion = {
        "Speak with Kohlo-Lakolo behind warehouse #1 at (G-5) in Port Windurst for a cutscene.",
        "Obtain a Rarab Tail. It can be bought from the Sarutabaruta regional vendor, for example Baehu-Faehu in Windurst Waters North (G-5), for about 22 gil.",
        "Trade the Rarab Tail to Kohlo-Lakolo for a cutscene and your reward, which completes the quest.",
    },

    wq_wd_making_headlines = {
        "Speak with Naiko-Paneiko at The Tarutaru Times Company in Southern Windurst Waters (C-11) to start the quest.",
        "Speak with Kyume-Romeh in the Timbre Timbers Tavern in Northern Windurst Waters (F-10) to get the key item Windurst Waters scoop.",
        "Speak with Hiwon-Biwon by Shantotto's house in Windurst Walls (K-8) to get the key item Windurst Walls scoop.",
        "Speak with Umumu near the Dhalmel Farm in Windurst Woods (I-6) to get the key item Windurst Woods scoop.",
        "Speak with Yujuju by the Air Travel Agency in Port Windurst (M-6) to get the key item Port Windurst scoop.",
        "Return to Naiko-Paneiko, who asks you to check out a lead in Inner Horutoto Ruins. Enter it from East Sarutabaruta (J-7).",
        "Examine the Mahogany Door at (G-8) to confirm the Windurst Woods scoop.",
        "Return to Naiko-Paneiko to complete the quest and receive your reward.",
    },

    wq_wd_scooped = {
        "You must zone after completing Making Headlines before you start this quest.",
        "Speak with Naiko-Paneiko in Windurst Waters South (C-11) to start the quest.",
        "Take the ferry between Mhaura and Selbina and fish up Ocean Crab; they drop the Bronze Box you need.",
        "Trade the Bronze Box to Naiko-Paneiko to complete the quest and receive 1,500 gil.",
    },

    wq_wd_creepy_crawlies = {
        "Speak with Illu Bohjaa in Windurst Woods (I-6) to start the quest. When asked, you must answer \"Yup!\" for the quest to begin the first time.",
        "Obtain Silk Thread x3 or Crawler Calculus x3. Both drop from Crawler enemies in East Sarutabaruta and West Sarutabaruta.",
        "Silk Thread can also be bought from Meriri (only for Clothcraft Apprentices or higher) or from Kuzah Hpirohpon at the nearby Clothcrafting Guild (Home Point #5).",
        "Trade either Silk Thread x3 or Crawler Calculus x3 to Illu Bohjaa to complete the quest and receive 600 gil.",
    },

    wq_pw_know_ones_onions = {
        "Zone first if you have just completed the quest Truth, Justice, and the Onion Way!",
        "Speak with Kohlo-Lakolo behind the warehouse at (G-5) in Port Windurst.",
        "Obtain Wild Onion x4 and trade them to him.",
        "In some cases the quest ends here, with a cutscene and your reward. The exact trigger is unknown; it seems related to your progress in the Windurst missions or to having the key item Old ring.",
        "Otherwise, go to the House of the Hero in Windurst Walls (G-3) and try to enter it for a cutscene.",
        "Return to Kohlo-Lakolo to complete the quest and receive your reward.",
    },

    wq_pw_inspectors_gadget = {
        "Zone first if you have just completed Know One's Onions.",
        "Speak with Kohlo-Lakolo in Port Windurst for a cutscene, then speak with Pichichi near him, who sends you to her mother.",
        "Go to Windurst Waters and speak with Chamama at (F-10) (Home Point #4). She asks for Saruta Cotton x4 to make a Fake moustache.",
        "Saruta Cotton can be bought from Kuzah Hpirohpon (79 gil) or Meriri (500 gil, Clothcraft Guild Recruit rank or higher) in Windurst Woods (F-12), or found at the Auction House under Materials, Clothcraft.",
        "Trade the Saruta Cotton x4 to Chamama, then return to Kohlo-Lakolo for a cutscene to complete the quest and receive a Heko Obi.",
    },

    wq_pw_onion_rings = {
        "Zone first if you have just completed Inspector's Gadget!",
        "Speak with Kohlo-Lakolo in Port Windurst (G-5) for a story cutscene that starts the quest. If you already have the key item Old ring, you skip ahead to the final cutscene.",
        "Go to Castle Oztroja and head to the door at (I-8) on the first map.",
        "Use the handles in front of the door to activate the trap door on purpose and fall down it.",
        "Check the Blank Target in that room to receive the key item Old ring.",
        "Return to Kohlo-Lakolo, who sends you to the House of the Hero in Windurst Walls (G-3) for your reward. If you take too long to return the ring, the quest ends when you return to him and you do not need to go to the House of the Hero; it still counts as complete.",
        "Zone and return to Kohlo-Lakolo to receive your reward.",
    },

    wq_wd_greeting_cardian = {
        "You must zone after completing the previous quest. This quest cannot be started while Windurst Mission 9-2 or the quest The Kind Cardian is open.",
        "Speak with Kororo in the Manustery in Windurst Woods (H-9).",
        "Speak with the Cardian that Kororo mentions and choose any greeting; the choice does not matter.",
        "Leave Windurst Woods, then return after one Earth minute and speak with Kororo again.",
        "The Cardian you are looking for is the Five of Spades, at the outpost in Buburimu Peninsula. Go there and speak with Five of Spades.",
        "Return to Kororo to complete the quest and receive a Tourmaline Earring.",
    },

    wq_wd_legendary_plan_b = {
        "You must zone after completing A Greeting Cardian before you start this quest.",
        "Speak with Kopuro-Popuro in Windurst Woods (H-10) to start the quest.",
        "Obtain a Luminicloth, a Revival Tree Root and a Wolf Hide. All three are on the Auction House, or farm them in The Eldieme Necropolis at any time of day: Luminicloth (rare) from ghosts, Revival Tree Root from undead, Wolf Hide from hounds.",
        "Trade the Luminicloth, the Revival Tree Root and the Wolf Hide to Kopuro-Popuro to complete the quest and receive 700 gil and Scentless Armlets.",
    },

    wq_wd_in_a_stew = {
        "Zone first if you have just completed Chocobilious.",
        "Speak with Kuoh Rhel in Windurst Woods (K-12) to start the quest.",
        "Speak with Matata (K-12).",
        "Go to Ranpi-Monpi in the northern part of Windurst Waters (D-9) and trade him Woozyshroom x3 to receive the key item Ranpi-Monpi's special stew.",
        "Speak with Kuoh Rhel to complete the quest and receive 900 gil.",
        "To repeat the quest you must wait until the next Conquest update.",
    },

    wq_wt_let_sleeping_dogs_lie = {
        "Completing Reap What You Sow is not required to start this quest. It cannot be started while Making the Grade is active.",
        "Speak with Mashuu-Ajuu (K-6) and then Paku-Nakku to start the quest.",
        "Speak with Maabu-Sonbu in Port Windurst (E-7), near Home Point #1.",
        "Harvest at the ??? at (E-5) to obtain the Blazing Pepper.",
        "Trade the Blazing Pepper to Paku-Nakku, then speak with Paku-Nakku again.",
        "The quest can also be completed without the Blazing Pepper: trade Paku-Nakku a remedy, go back to Maabu-Sonbu, who points you to Pechiru-Mashiru for advice, then go back to Paku-Nakku, choose \"The automaton butler did it!\" and get the reward from Pechiru-Mashiru. Trading the remedy locks you out of trading the Blazing Pepper.",
    },

    wq_wd_can_cardians_cry = {
        "Speak with Apururu in Windurst Woods (H-9).",
        "Obtain a Bruised Starfruit, which drops from Cursed Weapon enemies (levels 43-45) in Xarcabard or can be bought at the Auction House.",
        "Take the Bruised Starfruit to Apururu.",
        "Afterwards, trading Apururu another Bruised Starfruit gives 1,000 gil.",
    },

    wq_pw_wonder_wands = {
        "Speak with Hakkuru-Rinkuru in the Orastery in Port Windurst (E-7) to start the quest.",
        "Speak with the War Warlock Captains in the Orastery: Ohruru, just south of Hakkuru-Rinkuru on the stage; Goltata, against the west wall; and Yaman-Hachuman, against the wall to the northeast.",
        "Obtain a Rose Wand, an Oak Staff and a Mythril Rod. All three can be bought with sparks: the Oak Staff and the Mythril Rod are in the level 30-39 category, the Rose Wand in the level 40-49 category.",
        "Trade the Rose Wand, the Oak Staff and the Mythril Rod to Hakkuru-Rinkuru for the cutscene that completes the quest. Two of the items are returned to you at the end, together with your reward and a new title.",
    },

    wq_wt_heaven_cent = {
        "Speak with Ropunono in Windurst Waters (F-7) to start the quest.",
        "Obtain an Ahriman Lens and trade it to Ropunono.",
        "Go to the Maze of Shakhrami and defeat Wight enemies to obtain a Rusty Key.",
        "Trade the Rusty Key to the Iron Door at (K-9) on the second map.",
        "Inside there are several chests, and three of them hold coins that depict the constellations. The correct coins are Odin to the north, Alexander to the northeast, Shiva to the east and Garuda to the southeast.",
        "Whichever coin you pick, correct or not, you receive a Shelling Piece.",
        "Trade the Shelling Piece to Ropunono to complete the quest and receive 4,800 gil.",
    },

    wq_wt_say_it_with_flowers = {
        "Speak with Moari-Kaaori in Windurst Waters South (C-9) to start the quest. Home Point #3 is the closest.",
        "Speak with Ohbiru-Dohbiru in the southern Rhinostery building (J-9). The right answers to his questions are \"Rare\", \"Mystical\" and \"Elegant\"; wrong answers get you the wrong flower and a smaller reward.",
        "If you answer all the questions correctly, you are sent after a Tahrongi Cactus.",
        "Go to Tahrongi Canyon (F-6) and examine the Tahrongi Cacti there to get a Tahrongi Cactus.",
        "Give the flower to Moari-Kaaori to receive your reward: an Iron Sword the first time and 400 gil on later completions.",
        "Alternatively, buy a Carnation in Upper Jeuno for 60 gil and trade it to Moari-Kaaori after speaking with him, which skips the trip.",
    },

    wq_wt_hoist_the_jelly_roger = {
        "The quest Cook's Pride must be active.",
        "Obtain a Royal Jelly. Death Jacket enemies are common near the main entrance of Crawlers' Nest.",
        "Trade the Royal Jelly to Maysoon in Windurst Waters (E-9) to complete the quest and receive the key item Super soup pot.",
    },

    wq_pw_something_fishy = {
        "Speak with Tokaka in Port Windurst (C-8) to start the quest. Home Point #1 in Port Windurst is extremely close to her.",
        "Trade Tokaka a Bastore Sardine to complete the quest and receive 70 gil.",
        "To repeat it, you must zone each time you finish before the quest is offered to you again.",
    },

    wq_pw_catch_a_falling_star = {
        "Speak with Sigismund on top of the Orastery in Port Windurst (E-7); he tells you about the elusive Starfall Tear.",
        "Speak with Tohopka, who stands right next to Sigismund (E-7). Tohopka explains how to collect the tears and that you need Pugil Scales. Pugil enemies drop them, or you can find them at the Auction House under Bonecrafting.",
        "Kill Pugils just outside in East Sarutabaruta if there are no scales on the Auction House. (The Starfall Tear itself is sometimes on the Auction House, under Other.)",
        "Go to the Twinkle Tree near the Starfall Hillock in West Sarutabaruta (I-6), a rounded tree with a blue firefly-like glow at night.",
        "Wait until 0:00 to 3:00 game time. At any other time the tree says nothing is out of the ordinary; during those hours you get the message \"A frost deposit at the base of the tree twinkles in the starlight.\"",
        "At that point trade the Pugil Scales to the tree to receive your Starfall Tear.",
        "Take the Starfall Tear back to Sigismund to complete the quest and receive a Fish Scale Shield.",
    },

    -- ========================================================
    -- LATER WINDURST QUESTS
    -- ========================================================

    wq_wd_paying_lip_service = {
        "Speak with Tapoh Lihzeh in Windurst Woods (I-8). The quest will not start while Chocobilious is active.",
        "Obtain Beehive Chip x3 or Remi Shell x2. Beehive Chip can be bought for 40 gil from Odoba at the Alchemy Guild in Bastok Mines (K-6).",
        "Trade Beehive Chip x3 for 150 gil or Remi Shell x2 for 200 gil to Tapoh Lihzeh to complete the quest.",
        "If you are doing this quest for a Vana'Bout objective and have already completed it once, you do not need to speak with Tapoh Lihzeh again: just trade her the items.",
    },

    wq_wd_amazin_scorpio = {
        "Speak with Soni-Muni in Windurst Woods (H-10) to start the quest.",
        "Obtain a Scorpion Stinger. It drops from Labyrinth Scorpion and Maze Scorpion enemies in the Maze of Shakhrami, and from Diplopod enemies in Kuftal Tunnel.",
        "Trade the Scorpion Stinger to Soni-Muni to complete the quest and receive 1,500 gil.",
    },

    wq_wd_twinstone_bonding = {
        "Speak with Gioh Ajihri in Windurst Woods (K-5) to start the quest; she asks for a Twinstone Earring.",
        "Obtain a Twinstone Earring. It can be found at the Auction House, or farmed from Hill Lizard enemies in Meriphataud Mountains.",
        "Bring the Twinstone Earring back to Gioh Ajihri to receive your reward.",
    },

    wq_wl_curses_foiled_a_golem = {
        "You must zone after completing the previous quest. Speak with Shantotto in Windurst Walls (K-7): answer \"Ask if you're worthy\" and then \"Whatchu talkin' 'bout Shantotto?\" (\"Yes mommy\" gives you the title Total Loser).",
        "Go to the tower at Beaucedine Glacier (I-7) and speak with Torino-Samarino twice, choosing the first option, for the temporary key item Shantotto's new spell.",
        "In Fei'Yin (Home Point #2 is fastest), go to the basement (map 2) at (F-6) and examine the north-western Cermet Door for a cutscene with Rukususu. If you kill too many monsters while carrying the spell, it breaks into Shantotto's ex-spell; get another from Torino-Samarino.",
        "Return to Shantotto in Windurst Walls to receive the Scroll of Warp II. This quest is one of the requirements for Shantotto's Trust.",
    },

    wq_wt_acting_in_good_faith = {
        "Speak with Gantineux on the second floor of the Rarab Tail Hostelry in Windurst Waters (E-10); Home Point #4 is the closest. He gives you the key item Spirit incense and asks you to go to The Eldieme Necropolis.",
        "Go to The Eldieme Necropolis and look for a ??? that spawns in one of four locations. It can be reached via Beaucedine Glacier, the Lycopodium warps or the Unity warp to the zone.",
        "Click the ???; the incense always fails to light. If others are also doing the quest, the ??? remains after you click it.",
        "Go back to Gantineux, who gives you the key item Gantineux's letter and tells you to deliver it to Eperdur.",
        "Go to Northern San d'Oria and speak with Eperdur (M-7) upstairs in the Cathedral to complete the quest and receive a Scroll of Teleport-Mea.",
    },

    wq_wl_flower_child = {
        "Optional: speak with Ojha Rhawash in Windurst Walls (C-13). She does not say it at first, but she would like a Lilac.",
        "Obtain a Lilac. It can be bought at the Auction House, or from Areebah in Upper Jeuno (H-6) for 120 gil.",
        "Trade the Lilac to Ojha Rhawash to complete the quest.",
        "If you trade her the wrong flower, such as one meant for the other two Mog House exit quests, she keeps it and you will have to get another.",
    },

    wq_ht_three_magi = {
        "Speak with Chumimi in the basement of Heavens Tower (the bottom floor). You must be on Black Mage, level 40 or higher, to start this quest.",
        "During the cutscene you are asked to agree with one of the three NPCs. Whoever you pick decides your title, but it does not affect the quest. After the cutscene you can continue on any job.",
        "Optional: speak with Hikkuku, Ewchichi, Bebibi, Yakuku, Damama and Abobo in the tower basement to hear their concerns about the trees, or with Shantotto in her mansion in Windurst Walls (K-7) for a reminder.",
        "Go to any Telepoint and trade a synthesis crystal to receive a Faded Crystal.",
        "Travel to Xarcabard and head toward (E-8), very close to the Castle Zvahl Baileys zone line (quickest: the Castle Zvahl Baileys Survival Guide, then zone out). Find the ??? in the glowing trenches.",
        "Trade the Faded Crystal to the ??? to spawn the Chaos Elemental, a Light Elemental that resists all physical damage (a level 40 party of six can handle it). If several people are doing the quest, wait 3 minutes after it dies to spawn it again.",
        "Take the Glowstone that drops from the Chaos Elemental and return to Chumimi to complete the quest and receive a Casting Wand.",
    },

    wq_ht_recollections = {
        "Zone out of Heavens Tower first if you have just completed The Three Magi.",
        "Speak with Chumimi in the basement of Heavens Tower to start the quest. You must be a Black Mage, level 50 or higher.",
        "Optional: speak with Laityn in Ru'Lude Gardens (G-9) for a story cutscene and a hint on where to go.",
        "Go to the basement of Crawlers' Nest and obtain a Bag of Seeds, which drops from a Fire Elemental or a Water Elemental. The Elementals only appear during fire or water weather, which Crawlers' Nest shares with Rolanberry Fields (ask Appollonia in Upper Jeuno (G-6) for the forecast). They spawn in the \"donut room\" with the Strange Apparatus on Map 3: from the entrance go west until you drop into the central hub (I/J-9), then south through passage B at (J-10) to Map 3, and west to the room's entrance at (H-8).",
        "Alternatively, a Bag of Seeds can come from your Garden Furrow: tell Kuyin Hathdenna to \"look for seeds\" before harvesting it.",
        "Return to Chumimi and trade her the Bag of Seeds.",
        "Go to Castle Zvahl Baileys and defeat Demon Generals, Magistrates, Chancellors or Commanders for a Whine Cellar Key. They are at the bottom of the four corner areas of Map 3; fall from Map 2 to get there. If Borghertz's Sorcerous Hands is still unfinished, take it up to its Castle Zvahl Baileys part to save a trip.",
        "Zone into Castle Zvahl Keep and trade the Whine Cellar Key to the Ore Door at (H-7) for a cutscene and the key item Foe Finder Mk. I. Hug the right wall as you enter and go through the iron gate; it is the first Ore Door before the second iron gate.",
        "Return to Chumimi after the cutscene in the Keep. After another short sequence the quest is completed and you receive Wizard's Sabots.",
    },

    wq_ht_root_of_the_problem = {
        "Zone out of Heavens Tower first if you have just completed Recollections.",
        "Speak with Chumimi in the basement of Heavens Tower to start the quest. You must be on Black Mage.",
        "After the cutscene, trade a Silk Cloth to Koru-Moru in Windurst Walls (E-7).",
        "Return to Chumimi to receive the key item Sluice Surveyor Mk. I.",
        "Go to Toraimarai Canal on Black Mage (Manafont is needed) and examine the two ??? on Map 1. Stand right in front of each one; from too far away or the other side of the grate you only get a message that you cannot examine further.",
        "The first ??? is in the north-east corner of (H-7): from the Survival Guide, follow the left wall to the grate blocking the path. The second is at (I-9).",
        "At one of them (usually the second, rarely the first) a cutscene asks for \"the Mage's black power\": use Manafont, then examine the ??? again for another cutscene. The rest of the quest can be done on any job.",
        "Go to (J-8) and examine the ??? that is not glowing (there are two side by side) for a cutscene that spawns Magic Sludge, a Dark Elemental NM. It is highly resistant to physical damage and somewhat to magic. Only the person who started the cutscene gets credit, and another can only be spawned 3 minutes after it dies.",
        "Examine the ??? again for another cutscene.",
        "Return to Chumimi for the final cutscene and your reward, Wizard's Petasos.",
        "Optional: speak with Kupipi in Heavens Tower to receive an Earthen Charm.",
        "Optional: go through the Sealed Portal at the Three Mage Gate in Inner Horutoto Ruins and examine the Gate of Earth at (I-7) for a cutscene. Quickest is the Toraimarai Canal Survival Guide, which puts you right outside that part of the ruins by the Gate of Earth (a Rhinostery Certificate also lets you through the Canal).",
    },

    wq_wd_tenshodo_showdown = {
        "Having Windurst Mission 2-1 active prevents you from starting this quest. Nanaa Mihgo is involved in several quests and missions, so you may have to speak with her several times to trigger the cutscene that starts it.",
        "Speak with Nanaa Mihgo in Windurst Woods (J-3) as a Thief, level 40 or higher; she gives you the key item Letter from the Tenshodo. You must have the Tenshodo Membership to continue.",
        "Go to Lower Jeuno and speak with Harnek inside the Tenshodo at (J-7) for a cutscene. You receive the key item Tenshodo envelope.",
        "Travel to Selbina and speak with Elfriede (J-9) in the Shepherd's Muster Inn for a cutscene with Sneaking Tiger, who asks for a Quadav Stew. It can only be stolen from certain Quadavs in Beadeaux, so you can steal it before going to Selbina to save time.",
        "Go to Beadeaux and steal from Garnet Quadav, Silver Quadav, Zircon Quadav and Bronze Quadav until you obtain the Quadav Stew.",
        "Return to Selbina and trade the Quadav Stew to Elfriede (J-9).",
        "You receive the key item Signed envelope.",
        "Return to Harnek inside the Tenshodo in Lower Jeuno (J-7) for a final cutscene and your reward, the Marauder's Knife.",
    },

    wq_wd_thick_as_thieves = {
        "Speak with Nanaa Mihgo in Windurst Woods (J-3) to start the quest. She asks what the last signature on the key item Signed envelope was: the correct answer is V, although it likely does not matter what you answer.",
        "Optional: speak with Cha Lebagta and Bopa Greso, just south of Nanaa Mihgo at (J-4), for a couple of clues.",
        "Obtain Rock Salt, Gausebit Grass and Lizard Egg. You may need several of each.",
        "At the end of the starting cutscene you received three key items: Gang whereabouts note, First forged envelope and Second forged envelope. The two envelopes can be done in either order.",
        "First envelope: in Sauromugue Champaign, examine the ??? at the towers (G-6, G/H-8, I/J-7, J/K-8, K-9 and I-9/10) until Climbpix Highrise appears; the tower is random. The right spots say it is impossible to climb the wall with bare hands. The I-9/10 tower is reached with the Survival Guide, the Voidwatch warp, the Cavernous Maw in Sauromugue Champaign (S), or through the third Banishing Gate of Garlaige Citadel.",
        "Defeat Climbpix Highrise for a Grapnel. At the tower at I/J-7, take off all your equipment and trade the Grapnel to the ??? for a cutscene and the key item First signed forged envelope.",
        "Second envelope: in Lower Jeuno (H-10), speak with Sniggnix in the back hallway of Muckvix's Junk Shop and beat him at dice. Keep rolling until you win.",
        "In Dangruf Wadi, beat three more Goblins at dice, in order. Trade each one their favorite item before every roll; it is used up win or lose, and losing makes the next game easier.",
        "First goblin, Saltvix (Rock Salt): at the ??? in the western part of the room at G-7 (the ??? is in F-7).",
        "Second goblin, Grasswix (Gausebit Grass): at the ??? at F-4/5 where the underground tunnel comes out.",
        "Third goblin, Eggblix (Lizard Egg): go west across F-11/G-11 and walk through the wall into the hidden cave at F-11, follow the tunnel, drop down the hole and head south to the ??? in the corner at E-12.",
        "After winning all three, ride the geyser up the cliff at J-3 in Dangruf Wadi and follow the path into North Gustaberg (or use the North Gustaberg Geomagnetic Fount). Follow the river east down to the waterfall, staying on the south side.",
        "Examine the ??? there to spawn Gambilox Wanderling and defeat it. It respawns after 3 minutes for other party members; if the ??? only says it smells like a Goblin, wait a few minutes.",
        "Examine the ??? again for a cutscene and a Regal Die. Return to Lower Jeuno and trade the Regal Die to Sniggnix for the key item Second signed forged envelope.",
        "Return to Nanaa Mihgo in Windurst Woods (J-3) to complete the quest and receive the Rogue's Bonnet.",
    },

    wq_wd_hitting_the_marquisate = {
        "You must zone after completing As Thick as Thieves before you start this quest.",
        "Speak with Nanaa Mihgo in Windurst Woods (J-3) to receive the key item Cat Burglar's note.",
        "Go to Lower Jeuno (G-10) and speak with Yatniel on the top floor. He asks for Quake Grenade x4: trade them to him for a clue. You can skip this and still get the Bomb incense, but you must turn in the Quake Grenades to clear the key item from Nanaa Mihgo, or she will not let you finish the quest.",
        "Go to Mhaura (H-8) and speak with Hagain in one of the upstairs rooms of the Sailor's Stay to receive the key item Bomb incense.",
        "Go to Garlaige Citadel through the main entrance (the Survival Guide is easiest). You must examine several ??? in the ceiling in a set order, choosing \"Yes\" to use the Bomb incense each time. First-person view and locking on make them easier to target.",
        "Map 1: the first ??? is at (I-9), just south of Banishing Gate #1. Head west, take the first left, and examine the next one at (H-9).",
        "Go through Banishing Gate #1 to Map 2: examine the ??? west of the intersection at (F-9), then the one across the hall to the east at (F/G-9), then go back toward the gate for the one at (G-8/9), and round the edge of the large room (avoid the holes in the middle) to the one at (G-7).",
        "Read this before the last ???: at (I-6), examining the final ??? spawns the Bomb NM Chandelier. If it aggroes anyone before it is claimed (it detects sight and magic), it self-destructs at once and drops nothing. Use Hide or Spectral Jig right after the cutscene and claim it with a melee attack, not a spell.",
        "Defeat Chandelier for the Chandelier Coal. If it self-destructs, the ??? returns after 10 minutes; you only have to redo all the ??? if you leave the zone.",
        "Return to Mhaura and trade the Chandelier Coal to Hagain.",
        "Go back to Windurst Woods and speak with Nanaa Mihgo. The correct answer is \"Blank\", but any answer progresses the quest.",
        "Get a Pickaxe. If you have the La Theine Plateau Proto-Waypoint, you can warp to the valley and skip the cave route below, but zone into Ordelle's Caves and back out first or you will not be able to trade the pickaxe.",
        "In Ordelle's Caves (enter from La Theine Plateau at (F-7) or use the Survival Guide): take the east path at (H-3) to the next map, then the path at (H-9) back to the first map, and drop down the hole at (H-11/12). Go east through the tunnel at (I-11), careful not to fall off the cliff, follow the stairs to the intersection at (I-6), go left (south), and take the tunnel west at (H-9), where you see Napalms, to come out in La Theine Plateau.",
        "Find the ??? at the southwest corner of (H-10) in the middle of the valley and trade it your Pickaxe for a cutscene and your reward, the Rogue's Poulaines. Other types of pickaxe do not work.",
    },

    wq_wd_sin_hunting = {
        "Speak with Perih Vashai in Windurst Woods (K-7) as a Ranger, level 40 or higher, to receive the temporary key item Chieftainness's twinstone earring.",
        "She sends you to Ranguemont Pass to look for Semih Lafihna. Semih Lafihna is not there, so speak with Perchond at (F-10); Semih Lafihna was searching for Glittersand around the pond at (E-5).",
        "Go to the pond at (E-5) and defeat Evil Weapon enemies until you get a Pinch of Glittersand. High-level Goblins (88+) are on the way; lower-level Rangers should go around them or use Invisible.",
        "Trade the Glittersand to Perchond, who gives you the temporary key item Perchond's envelope and explains that a merchant in Jugner Forest has also seen the creature, and that Semih Lafihna is probably there.",
        "In Jugner Forest, speak with Alexius at the very top of (I-6) near the lake. He saw the creature, and says Semih Lafihna was looking for it at the south end of the lake during a full moon (no full moon is needed).",
        "Examine the ??? on a tree at (H-6) in Jugner Forest for a cutscene.",
        "After the cutscene, return to Perih Vashai to receive your Sniping Bow.",
    },

    wq_wd_fire_and_brimstone = {
        "You must zone after completing Sin Hunting before you start this quest.",
        "Speak with Perih Vashai in Windurst Woods (K-7); she sends you to the Blacksmiths' Guild in Mhaura.",
        "Speak with Koh Lenbalalako inside the Blacksmiths' Guild in Mhaura (F-9); speak with her twice for a cutscene that sends you to The Eldieme Necropolis.",
        "Enter The Eldieme Necropolis from Batallia Downs (I-10) for a cutscene with the Mithran Tracker (any job). The Survival Guide lands at this entrance but doesn't trigger it: zone out and back in.",
        "Go to (G-9) and examine the Gravestone for another cutscene. The Magicked astrolabe lets you get there solo.",
        "After the cutscene, go back to Windurst Woods and speak with Perih Vashai again. A cutscene with the Mithran Tracker sends you to Castle Oztroja to search a pool for an Old Earring.",
        "You need Scavenge (Ranger main or subjob). In Castle Oztroja, pull the correct handle and go through the Brass Door at (I-8) on map 1. On map 2, get the day's four-lever password at (I-10) (or try combinations) and open the Brass Door at (G-8). Upstairs on map 3, go to the leech pool at (H-9).",
        "Use Scavenge at the pool until you get the Old Earring; it can take more than one try.",
        "Trade the Old Earring to Perih Vashai for a cutscene and the Hunter's Beret.",
    },

    wq_wd_unbridled_passion = {
        "You must zone after completing Fire and Brimstone before you start this quest.",
        "Speak with Perih Vashai in Windurst Woods (K-7) for a cutscene in which she sends you to Mhaura.",
        "In Mhaura, speak twice with Koh Lenbalalako (F-9) for a cutscene. She asks you for a Gold Earring.",
        "Obtain a Gold Earring. It can be obtained for free by completing the Records of Eminence objective Conflict: Xarcabard for the first time.",
        "Trade the Gold Earring to Koh Lenbalalako for a second cutscene and the key item Koh's letter.",
        "Zone into Xarcabard for a cutscene that hints you to look near Castle Zvahl Baileys (the Castle Zvahl Baileys Survival Guide is closest).",
        "Find the cave at (E-7) in Xarcabard and examine the ???: after a cutscene a Koenigstiger appears. Defeat it. Everyone needs their own cutscene and kill; it respawns in about 3 minutes.",
        "Head south to the cave at (E-8) and examine the ??? there for another cutscene, then examine it again for 99 Ice Arrows.",
        "Return to Windurst Woods and speak with Perih Vashai for the final cutscene and your reward, Hunter's Socks.",
    },

    wq_wl_hear_a_rainbow = {
        "Obtain a Carbuncle's Ruby from a Leech enemy. The drop rate is low (about 1%, 3%+ with Treasure Hunter 3), so a Thief helps. Poison Leeches in Buburimu Peninsula are probably easiest; Bloodsuckers in Toraimarai Canal (H-9 and J-9 on map 1) may have the best rate; Acrophies on Qufim Island also work.",
        "Go to Windurst Walls (G-3) and examine the door of the House of the Hero for a cutscene.",
        "You are asked to experience 7 kinds of weather. With the Carbuncle's Ruby in your inventory, zone into an outdoor field area while that weather is active to get a short cutscene for each color. You cannot just idle in a zone, Scholar Storm spells don't count, and only Original and Rise of the Zilart field areas work (as a rule of thumb, if you can't use a mount there it won't count). The Weather Forecast NPCs show the current and next 2 game days.",
        "Orange (clear skies): any outdoor area that isn't cloudy. Yellow (dust/sand): Konschtat Highlands, Tahrongi Canyon, Western/Eastern Altepa Desert (very common), Meriphataud Mountains, Valkurm Dunes, Sauromugue Champaign. Green (wind): La Theine Plateau (often right after rain), Tahrongi Canyon, Buburimu Peninsula, Cape Teriggan. Blue (rain): Pashhow Marshlands (very common), La Theine Plateau, Jugner Forest, Buburimu Peninsula, Yuhtunga/Yhoator Jungle (not Carpenters' Landing).",
        "Indigo (snow): Beaucedine Glacier or Xarcabard (extremely common; not Uleguerand Range). Violet (thunder): Pashhow Marshlands, The Sanctuary of Zi'Tah (very common), Konschtat Highlands, Jugner Forest, Sauromugue Champaign (not Qufim Island or Behemoth's Dominion).",
        "Red (hot spells/heat waves) is the hardest: Western/Eastern Altepa Desert (rare, all year), Cape Teriggan (March to early November), Yuhtunga/Yhoator Jungle (late June to early September), Valkurm Dunes and Meriphataud Mountains (very rare). It is likelier around midday and on Firesday. Rabao shares the Altepa weather, so its Home Point #1 is a handy place to check it.",
        "If you drop the Carbuncle's Ruby before completing the quest, you do not lose progress; simply obtain another one.",
        "Once you have all 7 colors, Carbuncle appears in a cutscene and sends you to La Theine Plateau.",
        "Go to La Theine Plateau (G-6) and trade the Carbuncle's Ruby to the ??? for a cutscene that completes the quest.",
        "Optional: look to the sky around the Crag of Holla for the rainbow that appears when someone unlocks Summoner (if it's raining, it appears when the rain stops).",
    },

    wq_pw_crying_over_onions = {
        "You must zone again if you have not done so since receiving the Bouncer Club.",
        "Speak with Kohlo-Lakolo in Port Windurst (G-5) for a cutscene that starts the quest.",
        "Go to Windurst Waters South (a short walk away, or use Home Point #3) and speak with Honoi-Gomoi (E-7) for a cutscene. He is upstairs in his house, reached by a back stairway.",
        "Obtain a Star Spinel from Spelunking Sabotender enemies in Quicksand Caves. Enter from Western Altepa Desert at (G-5); they are in the passageway near (F-7), and a couple spawn by Home Point #1. Sneak is required even at level 99. The weight sensors need one Galka or any two of Hume, Elvaan or Mithra.",
        "An Ornate Door on the way opens with the nearby weight pad: 1 Galka, any 2 Hume/Elvaan/Mithra, 3 Tarutaru, or any 1 player after completing Open Sesame.",
        "Bring the Star Spinel to Honoi-Gomoi, who gives you the Star Necklace after a cutscene.",
        "Speak with Kohlo-Lakolo for a cutscene, then speak with Honoi-Gomoi again for a cutscene that completes the quest.",
    },

    wq_wt_wild_card = {
        "Speak with Honoi-Gomoi in Windurst Waters South (E-7) to start the quest. He is upstairs in his house, reached by a back stairway.",
        "Speak with Kohlo-Lakolo in Port Windurst (G-5).",
        "Go to Windurst Walls (G-3) and check the door of the House of the Hero.",
        "Go to Toraimarai Canal and open a Coffer there to obtain the Joker card. Various enemies in the zone drop the Toraimarai Coffer Key, or you can buy one from the Curio Vendor Moogle for 5,000 gil.",
        "If you spoke to Joker during the previous cutscene, return to the House of the Hero for your reward.",
        "If you spoke to Apururu in that cutscene instead, return to the Manustery in Windurst Woods (Home Point #3).",
        "Return to Honoi-Gomoi to complete the quest.",
    },

    wq_pw_the_promise = {
        "Speak with Kohlo-Lakolo in Port Windurst (G-5) to start the quest.",
        "Speak with Chamama in Windurst Waters (F-10).",
        "She makes you the Invisible man sticker you need, but only if you first bring her Shoalweed. Shoalweed drops from Recluse Spider enemies in Kuftal Tunnel.",
        "Return to Kohlo-Lakolo for your reward, the Promise Badge.",
        "Final cutscene: if you have killed Fenrir after reaching Windurst Rank 10, you have the Dark Mana Orb among your temporary key items. Zone, then speak with Kohlo-Lakolo again with that key item for a final, concluding cutscene.",
    },

    wq_wl_nothing_matters = {
        "Zone in and out if you have just completed Blast from the Past.",
        "Speak with Koru-Moru in Windurst Walls (E-7) to start the quest.",
        "Optional: speak with Yoran-Oran (E-5) about the author of the thesis on alchemy, and with Shantotto (K-7) about alchemy.",
        "Speak with Fuepepe in Windurst Waters North (L-6).",
        "Go north to the Acolyte Hostel (K-6) and interact with each of the six doors on the ground floor to play Quiz de Vana'diel. Answer a question correctly, then go to another door, until you have 4 to 6 correct answers.",
        "Quiz answers: four-leaf Mandragora bud = AGI; after Firesday = Earthsday; Windurst kids love the Agatha Crystalie mystery series; airship pass = 500,000 gil; herb seeds can't grow a Marguerite; Bastok's constellation = Titan; Windurst Waters cardians = hearts; Curilla's hair covers her left eye; Delkfutt's Tower = thirteen floors; Bastok waterwheels facing north turn counter clockwise; Galka eat raw meat, Mithra raw fish; in Kazham you can't learn the weather in Sarutabaruta; Rabao Oasis = six springs; Karaha-Baruha = Minister of the Optistery; M & P's Market = Kazham or Upper Jeuno; Ayame's sister = Kaede; Iron Eater's master = Werei; Naji = the 5th Musketeer; not on Elshimo = Cloister of Storms; Prince Trion lost an entire company; Quadav lack a Quadav hand fetich; Autumn Hunt quarry = a Giant Sheep; Rukususu likes peanuts; San d'Oria's younger prince = Pieuje; archduke of Jeuno = Kam'lanaut; Bastok Markets armourer = Kulatz Bridge; Bastok auction house = 5 counters; constellation map = Lago-Charago; Balga's Dais dragon = Black Dragon; ex-Minister of the Manustery = Zonpa-Zippa; N. Gustaberg falls = Drachenfall; Galka who lived with Werei = Gumbah; red flower girl = Valah Molkot; Goldsmiths' Guild closed 23:00-8:00; most mythril = Palborough Mines; N. San d'Oria kid looks for Exoroche; Konschtat houses the Crag of Dem; lost San d'Oria kid wants a willow fishing rod; map of Mindartia = Enid Ironheart; Mithra chieftainness = Perih Vashai; monster that doesn't belong = Zu; far-left Norg auction clerk = Atrevaux; President of Bastok = Karst, sleeps in the Presidential Suite; Aurastery principal = Koru-Moru; Port Bastok restaurant = The Steaming Sheep; river near San d'Oria = Cheval River; delivery boy's mom has Davoi Fever; papsque = Shamonde P Grauche; Royal Knight general = Rahal; sea east of Mindartia = Gugru Blue; Tenshodo leader's cape = black; Troupe Valeriano = five members; war 20 years ago = Crystal War; Windurst flag = five stars; weapon shop greeting = Hohbiba-Mubiba; west of Zulkheim = Vollbow; crystal bass = Maiden's Spring.",
        "After the questions, go to the western Acolyte Hostel building (K-5) for a cutscene and receive the Thesis on alchemy.",
        "Answering all 6 questions correctly also gives you a Vile Elixir. If you already have one you cannot complete the quest: zone out, get rid of it, then come back to continue. With 4 correct answers the quest continues, but you get no Vile Elixir.",
        "Return to Koru-Moru for a cutscene.",
        "Obtain a Cold Bone, which can be bought at the Auction House or dropped by Doom Soldier enemies that appear at night in Cape Teriggan.",
        "Obtain a Warm Egg, which can be bought at the Auction House or dropped by Anemone enemies in Yhoator Jungle.",
        "Trade the Cold Bone and Warm Egg to Koru-Moru for a cutscene.",
        "Return to Koru-Moru in a few days (after Japanese midnight) to complete the quest and receive your reward.",
    },

    wq_wt_toraimarai_turmoil = {
        "If you have just completed Blue Ribbon Blues, zone first.",
        "Speak with Ohbiru-Dohbiru in Windurst Waters South (J-9) for a cutscene. You receive the key item Rhinostery certificate, which gives access to Toraimarai Canal through Windurst Walls (H-3).",
        "To find Starmites, enter Toraimarai Canal by speaking with Seven of Diamonds in Windurst Walls (H-3). Go east at the first intersection, down the stairs at (I-8) and east, turn right at both intersections at (I-10), go up the stairs at (I-9), then head west to (G-9), where the Starmites spawn.",
        "Starmite Shell drops from Starmite enemies. Get Starmite Shell x3.",
        "Return to Ohbiru-Dohbiru and trade him the shells to complete the quest and receive 4,500 gil.",
    },

    wq_wl_puppet_master = {
        "While you are on Summoner as your main job, examine the House of the Hero in Windurst Walls (Home Point #1) to speak with Carbuncle. You must be level 40 or higher and have the Rise of the Zilart pack.",
        "Speak with Juroro in Port Bastok (I-8), near Home Point #1. Ildy-Goldy gives you an Earth Pendulum.",
        "Make your way through Quicksand Caves to the Cloister of Tremors. Home Point #2 is at the entrance. If it is your first visit, enter Quicksand Caves via Eastern Altepa Desert at (K-7) and walk to (C-9), taking the right two one-way drops on the way.",
        "Trade the Earth Pendulum to the Protocrystal to enter the battlefield.",
        "Inside, defeat Galgalim (level 56). It has Fire Spikes and uses Poison and Paralyze; Trusts can be summoned.",
        "Speak with Juroro in Port Bastok (I-8) again.",
        "Speak with Koru-Moru in Windurst Walls (E-7) to complete the quest and receive your reward. You can drop the Earth Pendulum afterwards, as it serves no further purpose.",
    },

    wq_wl_class_reunion = {
        "Zone after completing The Puppet Master. While your main job is Summoner, examine the House of the Hero in Windurst Walls for a cutscene with Carbuncle, who gives you the key item Carbuncle's Tear.",
        "Speak with Koru-Moru in Windurst Walls (E-7). He asks for four Astragalos.",
        "Obtain Astragalos x4 and trade them to Koru-Moru. Astragalos can be bought from Shih Tayuun at the Bonecraft Guild in Windurst Woods (H-13), but it is only restocked if players sell it to the guild.",
        "He sends you to three people, in any order. Fuepepe is in the east Aurastery building in Windurst Waters (North) (L-6); you may need to speak with him several times, as he repeats unrelated text before the line that continues the quest.",
        "Speak with Furakku-Norakku in the east Opistery building in Windurst Waters (North) (G-8).",
        "Speak with Shantotto at her manor in Windurst Walls (K-7). She may start other quests first; keep talking until she mentions Sunny-Pabonny.",
        "Speak with Gulmama in Northern San d'Oria (E-7) to receive an Ice Pendulum.",
        "Go to the Cloister of Frost in Fei'Yin (Home Point #2 is closest). On a first visit, enter Fei'Yin from Beaucedine Glacier (J-4) (or the Unity warp), go downstairs at (G-9) on map 1, and zone into the Cloister at (I-5) on map 2.",
        "Trade the Ice Pendulum to the Protocrystal to enter the battlefield and defeat six Dryads. They share hate, so a low-level Summoner may struggle solo; Trusts are allowed.",
        "Speak with Koru-Moru to complete the quest and receive your reward. You can toss the Ice Pendulum afterwards, as it serves no further purpose.",
    },

    wq_wl_carbuncle_debacle = {
        "Zone after completing Class Reunion. Examine the House of the Hero in Windurst Walls while your job is set to Summoner to start the quest.",
        "Speak with Koru-Moru (E-7). His reference to a Rhinostery Researcher means Ripapa.",
        "Go to Mhaura and speak with Ripapa (I-9) to obtain a Lightning Pendulum.",
        "Trade the Lightning Pendulum to the Lightning Protocrystal in the Cloister of Storms for a cutscene and a battlefield. Reach it through The Sanctuary of Zi'Tah (K-12) into The Boyahda Tree (Home Point #1 is closest): go upstairs at (B-7), then to (J-12) on the next map.",
        "Defeat Lightning Gremlin and Thunder Gremlin, both Arcana. Lightning Gremlin's attacks drain TP and Thunder Gremlin's drain MP; both resist sleep. If the cutscene after the fight stalls, unload any cutscene-skipping addon until it continues.",
        "Return to Windurst Walls and speak with Koru-Moru to obtain the key item Daze-breaker charm.",
        "Go to Rabao and speak with Agado-Pugado (G-9) to receive a Wind Pendulum.",
        "Trade the Wind Pendulum to the Wind Protocrystal in the Cloister of Gales for a cutscene and a battlefield. Get there through Western Altepa Desert (H-4) into Kuftal Tunnel, reach A on the first map, then go all the way north to Cape Teriggan; the Cloister is at (F-5).",
        "Defeat Ogmios, a Manticore.",
        "Return to Windurst Walls and speak with Koru-Moru to receive your Evoker's Horn and complete the quest. You can toss the Lightning Pendulum and the Wind Pendulum afterwards, as they serve no further purpose.",
    },

    wq_wt_eco_warrior = {
        "Speak with Lumomo in the Timbre Timbers Tavern in Windurst Waters (F-10). You must be level 25 or higher.",
        "Go to the Maze of Shakhrami and speak with Ahko Mhalijikhari (C-9) to receive the level cap status. The level cap is 25, Trust magic is usable and buffs do not wear off.",
        "Go to (H-8) on map 1 to reach map 2.",
        "Go to (I-10) on map 2 and examine the ??? to spawn three Wyrmfly (Fly NMs).",
        "After defeating all three, examine the ??? once more to receive the key item Indigested meat.",
        "Report to Lumomo to receive your reward.",
    },

    wq_wd_from_saplings_grow = {
        "You cannot start this quest while another Weapon Skill quest is active; return to the person who gave it and quit it first. You need Archery skill 250 or higher, level 71, and the Rise of the Zilart pack.",
        "Speak with Perih Vashai in Windurst Woods (K-7) to receive the key item Weapon Training Guide and the Bow of Trials.",
        "Break the latent on the Bow of Trials before completing the rest of the quest. The latent is active while you have fewer than 300 Skillchain points accumulated; you know you have enough when it breaks and the weapon's elemental resistances disappear from your active resistances.",
        "Trade the Bow of Trials back to Perih Vashai for the key item Map to the Annals of Truth, which sends you to Cape Teriggan.",
        "Fastest: the Unity Warp to Cape Teriggan (level 128) brings you to (H-7); the Cloister of Gales Home Point (F-5) and the Survival Guide at the Outpost (G-8) also work. Otherwise, with Silent Oil and Prism Powder, go through Kuftal Tunnel: from (I-7) head north without taking any branches; at (I-4) the tunnel loops south into a larger space, so curve straight back north-west and exit into Cape Teriggan.",
        "At (G-7), examine the ??? to spawn Stolas, a bird weak to Ice. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Perih Vashai to receive your reward, the Empyreal Arrow weapon skill.",
    },

    wq_pw_orastery_woes = {
        "You cannot start this quest while another Weapon Skill quest is active; return to the person who gave it and quit it first. You need Club skill 230 or higher, level 71 and the Rise of the Zilart pack, and your main job must be WAR, MNK, WHM, BLM, PLD, SMN, BLU, SCH or GEO.",
        "Speak with Kuroido-Moido in Port Windurst (E-7) to receive the key item Weapon Training Guide and the Club of Trials.",
        "Break the latent on the Club of Trials before doing the rest of the quest. Each skillchain gives trial points: 5 with no skillchain, 7 at level 1, 9 at level 2 and 11 at level 3.",
        "The latent is broken when the elemental resistances listed in the Club of Trials description disappear from the elemental resistances shown under the equipped gear grid in the equipment window.",
        "Trade the Club of Trials back to Kuroido-Moido for the key item Map to the Annals of Truth, which sends you to Ro'Maeve.",
        "Take Silent Oil: the Weapons aggro by sound and magic and the Dolls by magic, so Sneak (a spell) isn't recommended. Inside Ro'Maeve, go down the north-east stairs and turn immediately east, take the hallway to the right, turn left, drop down the ledge and go through the north-east door. Turn left and up the stairs to the north at (K-8), then follow the path north-west to the open doorway at (J-8). From the Survival Guide or the Hall of the Gods entrance, just run down the long stairs to the south-east.",
        "Through the doorway, turn right and follow the long hallway south-east past the Moongate to (M-8); the ??? is on the ground in front of an inaccessible tunnel entrance. Examine it to spawn Eldhrimnir, a magic pot. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Kuroido-Moido to receive your reward, the Black Halo weapon skill.",
    },

    wq_wl_blood_and_glory = {
        "You cannot start this quest while another Weapon Skill quest is active; return to the person who gave it and quit it first. It requires Staff skill 230 or higher and level 71.",
        "Speak with Shantotto in Windurst Walls (K-7) to receive the key item Weapon Training Guide and the Pole of Trials.",
        "Break the latent on the Pole of Trials. With it equipped in your main hand, fight enemies rated Extremely Easy Prey or higher and use weapon skills or close skillchains until you accumulate 300 Trial Points: 5 points with no skillchain, 7 at level 1, 9 at level 2 and 11 at level 3.",
        "The latent is broken when the elemental resistances listed in the Pole of Trials description disappear from the elemental resistances shown under the equipped gear grid in the equipment window.",
        "Trade the Pole of Trials back to Shantotto. You are instructed to travel to Ifrit's Cauldron.",
        "Fastest: take Ifrit's Cauldron Home Point #1 to map 7, run south and then north to drop off the lip at (J-4), then go south to transition M at (J-8) onto map 6, and north to the ???.",
        "Without the Home Point, bring Silent Oil, Prism Powder and an Ice Cluster and enter Ifrit's Cauldron from Yhoator Jungle (I-5/6), arriving on map 1. Go north at the first junction, trade the Ice Cluster to the Flame Spout at (H-6/I-6), continue west through transition A to the large circular room (map 2), go south along the ledge and take drop P at (I-7/8) to map 7. Take transition M to the south-east onto map 6; the ??? is in the middle of the bridge to the north. Clear the bats and the bomb first if needed.",
        "Examine the ??? to spawn Cailleach Bheur, a Black Mage skeleton weak to Fire and Light. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Shantotto to receive your reward, the Retribution weapon skill.",
    },

    wq_pw_escort_for_hire = {
        "Speak with Dehn Harzhapan in Port Windurst (G-6) to start the quest. Only one Escort for Hire quest can be active at a time, and only one can be completed each Conquest Tally.",
        "Go to Garlaige Citadel. As soon as you zone in you get a cutscene, after which the NPC Wanzo-Unzozo appears. You can summon Trusts, but zoning in with an Adventuring Fellow makes the escort NPC disappear.",
        "Talk to Wanzo-Unzozo to stop him, and again to make him continue. He draws aggro from almost everything, and at low HP draws undead, so cure him. He can run through the Banishing Gate like monsters, so stop him before you open it, or carry the Pouch of weighted stones.",
        "You have 30 minutes. Escort Wanzo-Unzozo until he stops on his own, then speak with him to receive the key item Completion certificate. If he vanishes before you speak with him, you do not get the key item and must do the quest again.",
        "Return to Dehn Harzhapan for your reward.",
    },

    wq_wt_tuning_in = {
        "Speak with Leepe-Hoppe on top of the Rhinostery in Windurst Waters South (J-9) to start the quest.",
        "Leepe-Hoppe needs 3 items, all of which must be farmed in Chains of Promathia areas.",
        "An Extra-Fine File drops from Fomor enemies in Lufaise Meadows: Fomor Warrior, Fomor Monk, Fomor Dark Knight, Fomor Paladin and Fomor Samurai.",
        "A Spruce Lumber drops from Taurus enemies in Phomiuna Aqueducts; 3 Taurus can be found at (G-6) of Map 1. Enter Phomiuna Aqueducts from Tavnazian Safehold, or use the Survival Guide and head northwest.",
        "A Magicked Steel is found on various Goblin enemies in Oldton Movalpolos. It is advised to farm Goblin Oilman, which seem to have a higher drop rate: use the Proto-Waypoint, drop down the ledge and head west.",
        "Trade all 3 items to Leepe-Hoppe at once to complete the quest and receive 4,000 gil. Speak with Leepe-Hoppe again to start the quest Tuning Out.",
    },

    wq_wt_tuning_out = {
        "Speak with Leepe-Hoppe in Windurst Waters South (J-9) to start the quest. You must wait one Earth minute after completing Tuning In.",
        "Speak with Jakoh Wahcondalo in Kazham (J-9).",
        "Speak with Romaa Mihgo in Kazham (H-11).",
        "In Yuhtunga Jungle (K-7), find the ??? overlooking Gemini Falls; reach that side through the tunnel at (I-7) (no need to go through Ifrit's Cauldron). The cutscene spawns 5 Nasus, easy at level 75. Only one player at a time gets the cutscene; others wait 3 minutes after the Nasus die to spawn their own.",
        "Examine the ??? again after defeating the Nasus.",
        "Return to Kazham and speak with Romaa Mihgo again.",
        "To progress further you need a Mutton Tortilla, Habaneros and a serving of Black Curry.",
        "Habaneros can be bought at the Auction House (Food, Ingredients) or from regional vendors, grown from Herb Seeds in your Mog Garden, or farmed from Mantrap enemies in Misareaux Coast.",
        "Black Curry can be bought at the Auction House (Food, Meals, Soups).",
        "Mutton Tortilla can be bought at the Auction House (Food, Meals, Breads & Rice), or from Taajiji at the Timbre Timbers Tavern in Windurst Waters North if Windurst is at least 2nd place in Conquest.",
        "Go to Norg (K-8) and trade all three foods to Comitolus for a cutscene that sends you to the Rhinostery researchers in Beaucedine Glacier.",
        "Speak with Torino-Samarino at the tower in Beaucedine Glacier (I-7); the Survival Guide and the Unity Warp (level 125) are fastest. The quest completes after this cutscene.",
        "The quest is marked complete after the cutscene. Speak with Leepe-Hoppe afterwards to receive a Cache-nez.",
    },

    wq_pw_one_good_deed = {
        "Speak with Chipmy-Popmy in Port Windurst (C-8) to start the quest. This quest requires the Chains of Promathia pack.",
        "Go to Bibiki Bay and take the Manaclipper tour to Purgonorgo Isle.",
        "On the isle, examine the ??? at (H-9) to spawn 6 Peerifools (Mandragora that use Dream Flower and link with other Mandragora). Defeat them and examine the ??? again for the key item Deed to Purgonorgo Isle.",
        "Return to Chipmy-Popmy for a cutscene; you may have to speak with him more than once.",
        "Go to Boneyard Gully through Attohwa Chasm, which you enter from the Maze of Shakhrami. Cross the bridge to the east side, go into the caves at (I-8) and follow the tunnel up to the surface at (F-7); the next tunnel at (F-6) leads to Boneyard Gully (the Attohwa Chasm Home Point is just before it).",
        "Zoning into Boneyard Gully gives a cutscene and the key item Map of the Attohwa Chasm (if you don't have it).",
        "Return to Chipmy-Popmy for another cutscene, 3,200 gil and 2,000 experience points.",
    },

    wq_wt_waking_dreams = {
        "Trust magic cannot be used in this battlefield.",
        "Speak with Kerutoto in Windurst Waters South (J-8), near Home Point #3, for a cutscene that starts the quest and gives you the key item Vial of dream incense.",
        "Go to Pso'Xja Home Point #1. Alternatively, travel to Beaucedine Glacier (H-8) and enter Pso'Xja; the Beaucedine Glacier Survival Guide brings you to (H-9), just south of the entrance.",
        "Once inside, the displacement sequence is red, purple, red, purple (you lose all buffs, Trusts included, at each one). Take the elevator down, go north, then west at the intersection, and use the Stone Gate with your Pso'Xja pass. The Home Point is just past the gate on the left; head down the steps into The Shrouded Maw.",
        "Select the Memento Circle and pick Waking Dreams.",
        "Up to 6 can enter, each with their own Vial of dream incense; the limit is 30 minutes. Diabolos Prime uses Drain, Aspir, Sleepga II, Dispelga, Blindga, Noctoshield (Phalanx), Dream Shroud (magic attack and defense up), Camisado, Nether Blast, Ultimate Terror (stat down), Nightmare (sleep plus damage over time) and Ruinous Omen (Astral Flow, HP cut by a random percentage). Floor tiles vanish during the fight, dropping you among the Diremites.",
        "Defeat Diabolos Prime to receive the key item Whisper of dreams.",
        "Return to Kerutoto with the whisper. She offers several rewards, including the ability to summon Diabolos; you can only select one reward at a time.",
        "You can repeat this quest once per Earth day.",
    },

    wq_wd_lure_of_the_wildcat = {
        "Speak with Ibwam in Windurst Woods (G-11) to receive a Green Sentinel badge and start the quest.",
        "In Windurst Waters North, speak with Npopo (G-4), Amagusa-Chigurusa (G-9), Funpo-Shipo (F-9), Kyume-Romeh (F-10) and Lago-Charago (F-8).",
        "In Windurst Walls, speak with Yoriri (J-11), Moan-Maon (J-6), Shantotto (K-7), Chomomo (H-3) and Naih Arihmepp (F-5).",
        "In Port Windurst, speak with Yujuju (M-6), Choyi Totlihpa (F-6), Yaman-Hachuman (E-7), Kunchichi (E-7) and Three of Clubs (G-7).",
        "In Windurst Woods, speak with Umumu (I-5), Cayu Pensharhumi (I-10), Nanaa Mihgo (J-3), Etsa Rhuyuli (J-13) and Soni-Muni (H-10).",
        "Once you have spoken to all 20 people, return to Ibwam, who takes your Green Sentinel badge and gives you a Green invitation card.",
        "After joining Salaheem's Sentinels, speak with Naja Salaheem and show her the invitation card to receive Imperial currency; the more Lure of the Wildcat quests you have completed, the greater the reward.",
        "After joining Salaheem's Sentinels, Alib-Mufalib offers to teleport you to Aht Urhgan Whitegate for 300 gil.",
    },

    wq_wt_babban_ny_mheillea = {
        "Speak with Khoto Rokkorah in Windurst Waters North (H-10) for a cutscene that starts the quest.",
        "Touch the Peculiar Rootprints in Rolanberry Fields (S) at (H-14). The Rolanberry Fields (S) Survival Guide is the fastest way; second best is to teleport to the stronghold in Pashhow Marshlands (S) and zone into Rolanberry Fields (S).",
        "Touch another Peculiar Rootprints in North Gustaberg (S) at (E-11), close to where Campaign Arbiters teleport you.",
        "Touch the third and final Peculiar Rootprints in Meriphataud Mountains (S) at (L-4), near the zone line to The Sanctuary of Zi'Tah. The Meriphataud Mountains (S) Survival Guide and Recall-Meriph are both good ways to get there.",
        "Return to Khoto Rokkorah for the final cutscene and your reward.",
    },

    wq_wd_trust_windurst = {
        "You must be level 5 or higher on any job.",
        "Speak with Wetata in Windurst Woods (G-10); you receive the key item Green institute card.",
        "Go to Heavens Tower and speak with Kupipi. If this is not your first Trust quest, you are finished here and receive the key item Windurst Trust permit.",
        "If this is your first Trust quest, you must use the Trust spell Kupipi in West Sarutabaruta or East Sarutabaruta, then return to Kupipi to receive the Windurst Trust permit.",
    },

    -- ========================================================
    -- QUESTS ADDED WITHOUT A PLACEHOLDER
    -- ========================================================

    wq_pw_discerning_eye = {
        "Speak with Pygmalion in Port Windurst (M-7) and accept the quest.",
        "Pygmalion shows you a picture of an NPC that you must memorize.",
        "Board the next airship.",
        "Several NPCs that look very similar to the one in the picture appear on the ship.",
        "Speak to the NPCs to get the option of returning the key item Dropped item to them. You only have one chance to get it right.",
        "If you choose correctly, you receive 500 gil. If you choose incorrectly, you fail the quest.",
    },

    wq_wd_chocobo_riding_game = {
        "Speak with the starting NPC at the Chocobo stables in Windurst Woods (K-12); you are asked to deliver a Chocobo to a distant stable.",
        "You are placed on a Chocobo and must ride to the destination. If you dismount, the quest ends in failure.",
        "Your reward depends on how quickly you deliver the Chocobo. To San d'Oria: Miratete's Memoirs at 27:00 to 28:36, a Chocobo Ticket at 28:37 to 29:59, Gysahl Greens at 30:00 or more.",
        "To Bastok: Miratete's Memoirs at 31:00 to 32:29, a Chocobo Ticket at 32:30 to 34:43, Gysahl Greens at 34:44 or more.",
        "To Jeuno: a Windurst Woods Glyph at 14:00 to 15:29, Gysahl Greens at 15:30 or more.",
    },

    wq_wd_magicked_astrolabe = {
        "Speak with Churano-Shurano on the roof of the Optistery in Windurst Waters (F-8), in front of the telescope.",
        "Accept his offer to give him 10,000 gil towards his cause. You can then purchase the permanent key item Magicked astrolabe.",
        "The Magicked astrolabe lets you open the doors in The Eldieme Necropolis by yourself.",
    },

}

return Q