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
        "Optional: speak with Shalott in Upper Jeuno (G-7), outside the Chocobo Stables next to Mapitoto, for a cutscene.",
        "Examine the Door: Merchant's House in Lower Jeuno (G-11) again for another cutscene.",
        "Examine the Night Flowers down the ramp in Qufim Island (F-8) between 21:30 and 4:00 for a cutscene.",
        "A Kraken (level 37-38) may spawn above the Night Flowers.",
        "Examine the Door: Merchant's House in Lower Jeuno for a cutscene and your rewards.",
    },

    jeu_lj_fistful_of_fury = { -- Local patch: Jeuno quests
        "You need Norg (Tenshodo) Fame 3 and Silence of the Rams completed. Speak with Vola in Lower Jeuno (J-8) to begin the quest.",
        "Obtain a Nue Fang from Nue, a notorious monster in Beaucedine Glacier, or from the BCNM Eye of the Tiger.",
        "Obtain a Dodo Skin from Deadly Dodo, a notorious monster in Sauromugue Champaign, or from the KSNM Moa Constrictors.",
        "Obtain a Morbolger Vine from Morbolger, a notorious monster in Ordelle's Caves, or from the KSNM Contaminated Colosseum.",
        "Nue and Morbolger are also Records of Eminence objectives under Combat: Region (Original Areas 4 and Original Areas 1).",
        "Trade all three items to Vola for the Brown Belt and the title Brown Belt.",
    },

    jeu_lj_beat_around_the_bushin = { -- Local patch: Jeuno quests
        "You need to be a level 71 or higher Monk with Norg (Tenshodo) Fame 6. Speak with Vola in Lower Jeuno (J-8) with Monk as your main job to begin the quest.",
        "Leave the Tenshodo through the Door: Neptune's Spire for a cutscene with Atori-Tutori.",
        "Obtain a Wyrm Beard from Nidhogg or from the battlefield Early Bird Catches the Wyrm, and trade it to the Door: Neptune's Spire for a cutscene. Use the inner door next to Domenic, not the outer door with the same name.",
        "Speak with Degenhard in Bastok Markets (I-10).",
        "Obtain a Behemoth Tongue from King Behemoth or from the battlefield Horns of War, and trade it to the same door for another cutscene.",
        "Speak with Maat in Ru'Lude Gardens (H-5).",
        "Obtain an Adamantoise Egg from Aspidochelone or from the battlefield The Hills Are Alive, and trade it to the same door for a cutscene.",
        "Finally, trade a Brown Belt to the same door for the last cutscene and the Black Belt. The Brown Belt is used up in the trade.",
    },

    jeu_lj_save_the_clock_tower = { -- Local patch: Jeuno quests
        "Speak with Derrick in the Chamber of Commerce and Industry in Lower Jeuno (H-7) and ask to start a petition. He gives you a Tower Petition.",
        "Trade the Tower Petition to these 10 NPCs for their signatures: Pitantimand in Port Jeuno (H-7); Teigero-Bangero (H-10) and Zauko (I-6) in Lower Jeuno; Baudin (G-8) and Collet (G-7) in Upper Jeuno.",
        "Also in Upper Jeuno: Constance (G-9), Monberaux (G-10) and Souren (G-9) in the Infirmary, and Zuber (F-7) in the Marble Bridge Tavern. Last, Radeivepart in Ru'Lude Gardens (H-9).",
        "With all 10 signatures, trade the Tower Petition back to Derrick to complete the quest.",
    },

    jeu_lj_the_wonder_magic_set = { -- Local patch: Jeuno quests
        "Speak with Naruru, Teigero-Bangero or Panta-Putta in the merchant's house in Lower Jeuno (G-10) for a cutscene.",
        "Speak with Panta-Putta. He wants the key item Wonder Magic Set, which you get from the quest Child's Play.",
        "Return to Panta-Putta with the Wonder Magic Set to complete the quest.",
    },

    jeu_lj_your_crystal_ball = { -- Local patch: Jeuno quests
        "Speak with Kurou-Morou, the fortune teller above the Auction House in Lower Jeuno (I-7). He asks you for a crystal ball.",
        "Obtain an Ahriman Lens (Ex, not on the Auction House) from Evil Eye type monsters in Ranguemont Pass, Beaucedine Glacier or Xarcabard.",
        "In the Maze of Shakhrami, go to (G-5) on the first map, east of the exit to Attohwa Chasm, and trade the Ahriman Lens to the Rockwell at the top of the path.",
        "Wait one Earth minute, then examine the Rockwell again for a Divination Sphere.",
        "Trade the Divination Sphere to Kurou-Morou to complete the quest.",
    },

    jeu_lj_collect_tarut_cards = { -- Local patch: Jeuno quests
        "Speak with Chululu in Lower Jeuno (I-8). She gives you five copies of one random Tarut card.",
        "Collect one each of Tarut: Death, Tarut: The Hermit, Tarut: The King and Tarut: The Fool by trading with other players. The cards can be sold in bazaars but not on the Auction House.",
        "You can get another random card from Chululu once per real-life day.",
        "Trade all four cards to Chululu to complete the quest. Speak with her again afterwards to start All in the Cards.",
    },

    jeu_lj_rubbish_day = { -- Local patch: Jeuno quests
        "Ask Chululu in Lower Jeuno (I-8) to test your compatibility with another player on 3 different game days. Type the name of a nearby player as the password.",
        "Speak with her one game day after the third test to get this quest and the key item Magic Trash. If she talks about spreading the wonder of tarut cards, that is All in the Cards instead: say no and speak with her again.",
        "Obtain a Garlaige Key from the Fallen Evacuees in the rooms near the entrance of Garlaige Citadel (map 1).",
        "Pass through the first two Banishing Gates, then go to (I-7) on map 3 and trade the Garlaige Key to the Crematory Hatch to enter the Incinerator room.",
        "Speak with Mashira to dispose of the Magic Trash. The quest Making Amens! uses the same room, so take both together to farm the key only once.",
        "Return to Chululu to complete the quest.",
    },

    jeu_lj_never_to_return = { -- Local patch: Jeuno quests
        "After Your Crystal Ball, have Kurou-Morou in Lower Jeuno (I-7) read your fortune on three different game days.",
        "Ask for a fourth reading to start the quest.",
        "Trade a Horn Hairpin to Kurou-Morou to complete the quest. It can only be crafted, but is sold at the Auction House.",
    },

    jeu_lj_community_service = { -- Local patch: Jeuno quests
        "Only one player per world can take this quest each Vana'diel day. Speak with Zauko in Lower Jeuno (I-6) between 18:03 and 21:00.",
        "Light all 12 Streetlamps in Lower Jeuno before 1:00 by running up to each one and examining it.",
        "Return to Zauko to complete the quest. You can report back after 1:00, as long as the lamps were lit in time.",
        "Completing it a second time gives the key item Lamp Lighter's Membership Card, which tells you when you enter Lower Jeuno if Zauko is looking for help.",
    },

    jeu_lj_cooks_pride = { -- Local patch: Jeuno quests
        "Speak with Naruru in the merchant's house in Lower Jeuno (H-10). She can't find her cooking pot and wants a new one from the Culinarians' Guild in Windurst.",
        "Obtain the key item Super Soup Pot by completing the quest Hoist the Jelly, Roger.",
        "Return to Naruru with the Super Soup Pot to complete the quest.",
    },

    jeu_lj_tenshodo_membership = { -- Local patch: Jeuno quests
        "Enter Neptune's Spire in Lower Jeuno (I-7) and speak with Ghebi Damomohe at the counter. Pick the third, blank line of dialogue.",
        "You need either a Tenshodo Invite or the key item Tenshodo Application Form. For the form, speak with Jabbar in Warehouse #2, upper level, in Port Bastok.",
        "Or buy a Tenshodo Invite at the Auction House (Others > Misc.) and trade it to Ghebi Damomohe. It does not skip the fame requirement.",
        "Return to Ghebi Damomohe for the Tenshodo Member's Card, which lets you enter the Tenshodo back room.",
    },

    jeu_lj_deal_with_tenshodo = { -- Local patch: Jeuno quests
        "After starting A Clock Most Delicate, speak with Garnev in the Tenshodo, Lower Jeuno (J-7).",
        "Obtain a Gold Orcmask from Orcish Troopers in Davoi and the Monastic Cavern, or from the Orcish Overlord in the Monastic Cavern.",
        "Trade the Gold Orcmask to Garnev for the key item Clock Tower Oil.",
    },

    jeu_lj_gobbiebag_1 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Dhalmel Leather, Steel Ingot, Linen Cloth, Peridot. All four are sold at the Auction House (Materials).",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 35 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_2 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Ram Leather, Mythril Ingot, Wool Cloth, Turquoise. All four are sold at the Auction House (Materials).",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 40 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_3 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Tiger Leather, Gold Ingot, Velvet Cloth, Painite. All four are sold at the Auction House (Materials).",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 45 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_4 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Cermet Chunk, Darksteel Ingot, Silk Cloth, Goshenite. All four are sold at the Auction House (Materials).",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 50 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_mysteries_of_beadeaux_1 = { -- Local patch: Jeuno quests
        "During Mission 4-1 of any nation, speak with Sattal-Mansal in Lower Jeuno (J-8). This starts both Mysteries of Beadeaux quests.",
        "Obtain a Quadav Charm from the De'Vyu Headhunter in Beadeaux (I-9/I-10).",
        "Trade the Quadav Charm to Sattal-Mansal for the key item Coruscant Rosary.",
    },

    jeu_lj_mysteries_of_beadeaux_2 = { -- Local patch: Jeuno quests
        "This quest starts together with Mysteries of Beadeaux I when you speak with Sattal-Mansal in Lower Jeuno (J-8).",
        "Obtain a Quadav Augury Shell from the Go'Bhu Gascon in Beadeaux (F-6).",
        "Trade the Quadav Augury Shell to Sattal-Mansal for the key item Black Matinee Necklace.",
    },

    jeu_lj_the_goblin_tailor = { -- Local patch: Jeuno quests
        "Speak with Guttrix in Lower Jeuno (H-10). He makes race-specific armor (RSE) from a Magical Pattern.",
        "Each race gets one game week (Firesday to Darksday, about 7 hours 41 minutes) in turn. During your race's week, open a Treasure Chest in Gusgen Mines, Ordelle's Caves or the Maze of Shakhrami for the key item Magical Pattern.",
        "The chests need a Gusgen, Ordelle or Shakhrami Chest Key from the monsters in that zone. You can hold only one pattern at a time.",
        "Return to Guttrix and choose the body, hands, legs or feet piece. Repeat for the other pieces.",
    },

    jeu_lj_gobbiebag_5 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Bugard Leather, Paktong Ingot, Moblinweave, Rhodonite. All four are sold at the Auction House (Materials).",
        "Farming them yourself needs areas from Chains of Promathia.",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 55 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_6 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Balloon Cloth, Shakudo Ingot, H.Q. Eft Skin, Iolite. All four are sold at the Auction House (Materials).",
        "Farming them yourself needs areas from Chains of Promathia.",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 60 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_7 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Lynx Leather, Adaman Ingot, Rainbow Cloth, Deathstone. All four are sold at the Auction House (Materials).",
        "Farming the hide for the leather needs areas from Wings of the Goddess.",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 65 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_gobbiebag_8 = { -- Local patch: Jeuno quests
        "Speak with Bluffnix in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "Trade him Smilodon Leather, Electrum Ingot, Cilice, Angelstone. All four are sold at the Auction House (Materials).",
        "Farming the hide for the leather needs areas from Wings of the Goddess.",
        "Or trade a single Goblin Stew 880 instead of all four items. It is usually more expensive, so check the Auction House prices first.",
        "Your inventory grows to 70 slots. A Mog Satchel grows with it; ask an Artisan Moogle to enlarge a Mog Sack.",
    },

    jeu_lj_in_the_mood_for_love = { -- Local patch: Jeuno quests
        "After Promathia Mission 3-2, speak with Odasel outside Gems by Kshama in Lower Jeuno (H-9).",
        "Defeat Gigas in Lufaise Meadows until one drops a Chameleon Diamond.",
        "Trade the Chameleon Diamond to Odasel to complete the quest.",
        "Optional: speak with Matoaka inside the shop for another cutscene.",
    },

    jeu_lj_hook_line_and_sinker = { -- Local patch: Jeuno quests
        "After Promathia Mission 3-2, speak with Omer in Lower Jeuno (G-10).",
        "Fish on Qufim Island until you hook a Kraken, then defeat it for the Egret Fishing Rod. No fishing skill is needed.",
        "Trade the Egret Fishing Rod to Omer to complete the quest.",
    },

    jeu_lj_the_road_to_aht_urhgan = { -- Local patch: Jeuno quests
        "This quest follows Tenshodo Membership. Speak with Faursel in Neptune's Spire, Lower Jeuno (J-8), and pick the hidden third option at the bottom.",
        "Speak with him again and choose 'I want to go'. He offers four ways to proceed.",
        "Advanced: one beastman stronghold coffer key (Davoi, Beadeaux, Castle Oztroja, Temple of Uggalepih, Den of Rancor, Quicksand Caves, Sea Serpent Grotto), any testimony, or a Carmine, Cyan and Gray Chip. With Rhapsody in Umber, a Curio Moogle sells coffer keys for 5,000 gil.",
        "Intermediate: Jade Cryptex, Silver Engraving and 13 Knot Quipus. Beginner: Magicked Skull, Damselfly Worm, Crab Apron, Bloody Robe, Dhalmel Saliva and Wild Rabbit Tail. Or pay 500,000 gil.",
        "Trade the items (or gil), zone, and speak with Faursel again on the next game day for the key item Boarding Permit. Paying gil also gives a Map of Wajaom Woodlands and a teleport there.",
        "Take the ship from Mhaura to Al Zahbi (or a Unity warp to Wajaom Woodlands), then speak with Naja Salaheem in Aht Urhgan Whitegate (I-10) to begin the Aht Urhgan missions. On Rhapsodies Mission 2-5, choose 'Where's Tenzen?' to get the permit free.",
    },

    jeu_lj_the_miraculous_dale = { -- Local patch: Jeuno quests
        "At level 75 or higher, speak with Rakuru-Rakoru by the fountain in Lower Jeuno (I-6). He gives you the key item Data Analyzer and Logger EX.",
        "Defeat these 16 NMs while holding it: Tumbling Truffle (La Theine Plateau), Tottering Toby (Batallia Downs), Blubbery Bulge (Davoi), Black Triple Stars and Drooling Daisy (Rolanberry Fields), Jolly Green (Pashhow Marshlands), Sharp-Eared Ropipi (East Sarutabaruta), Buburimboo (Buburimu Peninsula).",
        "And: Daggerclaw Dracos (Meriphataud Mountains), Trickster Kinetix (Qufim Island), Ixtab (Upper Delkfutt's Tower), Gargantua (Beaucedine Glacier), Shadow Eye, Boreal Coeurl, Boreal Hound and Boreal Tiger (Xarcabard).",
        "Each kill shows 'The relevant battle data has been recorded'. Nyzul Isle versions don't count. Speak with Rakuru-Rakoru any time to check your progress.",
        "Return to Rakuru-Rakoru once all are recorded to complete the quest.",
    },

    jeu_lj_unlocking_a_myth_warrior = { -- Local patch: Jeuno quests
        "As a Warrior, equip the Vigil weapon Sturdy Axe (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When King's Justice appears in your weapon skill list, trade the Sturdy Axe to Zalsuhm. He unlocks King's Justice for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_monk = { -- Local patch: Jeuno quests
        "As a Monk, equip the Vigil weapon Burning Fists (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Ascetic's Fury appears in your weapon skill list, trade the Burning Fists to Zalsuhm. He unlocks Ascetic's Fury for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_white_mage = { -- Local patch: Jeuno quests
        "As a White Mage, equip the Vigil weapon Werebuster (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Mystic Boon appears in your weapon skill list, trade the Werebuster to Zalsuhm. He unlocks Mystic Boon for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_black_mage = { -- Local patch: Jeuno quests
        "As a Black Mage, equip the Vigil weapon Mage's Staff (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Vidohunir appears in your weapon skill list, trade the Mage's Staff to Zalsuhm. He unlocks Vidohunir for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_red_mage = { -- Local patch: Jeuno quests
        "As a Red Mage, equip the Vigil weapon Vorpal Sword (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Death Blossom appears in your weapon skill list, trade the Vorpal Sword to Zalsuhm. He unlocks Death Blossom for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_thief = { -- Local patch: Jeuno quests
        "As a Thief, equip the Vigil weapon Swordbreaker (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Mandalic Stab appears in your weapon skill list, trade the Swordbreaker to Zalsuhm. He unlocks Mandalic Stab for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_paladin = { -- Local patch: Jeuno quests
        "As a Paladin, equip the Vigil weapon Brave Blade (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Atonement appears in your weapon skill list, trade the Brave Blade to Zalsuhm. He unlocks Atonement for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_dark_knight = { -- Local patch: Jeuno quests
        "As a Dark Knight, equip the Vigil weapon Death Sickle (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Insurgency appears in your weapon skill list, trade the Death Sickle to Zalsuhm. He unlocks Insurgency for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_beastmaster = { -- Local patch: Jeuno quests
        "As a Beastmaster, equip the Vigil weapon Double Axe (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Primal Rend appears in your weapon skill list, trade the Double Axe to Zalsuhm. He unlocks Primal Rend for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_bard = { -- Local patch: Jeuno quests
        "As a Bard, equip the Vigil weapon Dancing Dagger (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Mordant Rime appears in your weapon skill list, trade the Dancing Dagger to Zalsuhm. He unlocks Mordant Rime for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_ranger = { -- Local patch: Jeuno quests
        "As a Ranger, equip the Vigil weapon Killer Bow (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Trueflight appears in your weapon skill list, trade the Killer Bow to Zalsuhm. He unlocks Trueflight for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_samurai = { -- Local patch: Jeuno quests
        "As a Samurai, equip the Vigil weapon Windslicer (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Tachi: Rana appears in your weapon skill list, trade the Windslicer to Zalsuhm. He unlocks Tachi: Rana for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_ninja = { -- Local patch: Jeuno quests
        "As a Ninja, equip the Vigil weapon Sasuke Katana (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Blade: Kamu appears in your weapon skill list, trade the Sasuke Katana to Zalsuhm. He unlocks Blade: Kamu for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_dragoon = { -- Local patch: Jeuno quests
        "As a Dragoon, equip the Vigil weapon Radiant Lance (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Drakesbane appears in your weapon skill list, trade the Radiant Lance to Zalsuhm. He unlocks Drakesbane for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_summoner = { -- Local patch: Jeuno quests
        "As a Summoner, equip the Vigil weapon Scepter Staff (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Garland of Bliss appears in your weapon skill list, trade the Scepter Staff to Zalsuhm. He unlocks Garland of Bliss for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_blue_mage = { -- Local patch: Jeuno quests
        "As a Blue Mage, equip the Vigil weapon Wightslayer (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Expiacion appears in your weapon skill list, trade the Wightslayer to Zalsuhm. He unlocks Expiacion for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_corsair = { -- Local patch: Jeuno quests
        "As a Corsair, equip the Vigil weapon Quicksilver (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Leaden Salute appears in your weapon skill list, trade the Quicksilver to Zalsuhm. He unlocks Leaden Salute for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_puppetmaster = { -- Local patch: Jeuno quests
        "As a Puppetmaster, equip the Vigil weapon Inferno Claws (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Stringing Pummel appears in your weapon skill list, trade the Inferno Claws to Zalsuhm. He unlocks Stringing Pummel for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_dancer = { -- Local patch: Jeuno quests
        "As a Dancer, equip the Vigil weapon Main Gauche (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Pyrrhic Kleos appears in your weapon skill list, trade the Main Gauche to Zalsuhm. He unlocks Pyrrhic Kleos for any weapon of the same type and gives the weapon back.",
    },

    jeu_lj_unlocking_a_myth_scholar = { -- Local patch: Jeuno quests
        "As a Scholar, equip the Vigil weapon Elder Staff (from Nyzul Isle) and speak with Zalsuhm in Muckvix's Junk Shop, Lower Jeuno (H-9).",
        "With it in your main hand, use weapon skills on monsters that give experience until you reach 250 points: 5 per weapon skill, 7, 9 or 11 when it closes a level 1, 2 or 3 skillchain.",
        "Trading the weapon to Zalsuhm early tells you roughly how far along you are. Storing it with Ghanraam resets the points.",
        "When Omniscience appears in your weapon skill list, trade the Elder Staff to Zalsuhm. He unlocks Omniscience for any weapon of the same type and gives the weapon back.",
    },

    jeu_uj_axe_the_competition = {
        "You cannot start this quest if you have another Weapon Skill quest active; return to the person who gave it and quit it first. You need Axe skill 240 or higher and level 71.",
        "Speak with Brutus in Upper Jeuno (G-7) to receive the key item Weapon Training Guide and the Pick of Trials. You need to break the latent on the Pick of Trials before completing the rest of the quest.",
        "Trade the Pick of Trials back to Brutus.",
        "Brutus gives you the key item Map to the Annals of Truth. Bring Sneak and Invisible to the Temple of Uggalepih.",
        "From Yhoator Jungle, follow the path to the T-intersection, head north and exit the Temple. Faster: the Voidwatch warp puts you outside the Temple (exit 1, map 1), and the Survival Guide warp inside it (exit 2); from either, follow the left wall to the granite door at (J-7), go through and on to (K-3) to exit the Temple (exit 4).",
        "Outside, follow the right wall north and then east to re-enter the Temple (exit 5, map 3), then follow the path south to the ??? at (G-9) to spawn Yallery Brown, a sapling weak to Fire and Dark. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Brutus to receive your reward, the Decimation weapon skill.",
    },

    jeu_uj_chocobo_on_the_loose = {
        "Head to Upper Jeuno and speak with Brutus at (G-7). This quest starts the first time you speak to him, together with Chocobo's Wounds.",
        "Help the chocobo leave when prompted.",
        "Head to La Theine Plateau and check the Chocobo Tracks at the far northwest corner of (E-5), just south of the sliver of map in (E-4).",
        "Return to Upper Jeuno and speak to Brutus (G-7) again.",
        "Speak with Hantileon in Southern San d'Oria (I-11). All three choices are wrong, but you have to pick them: choose \"Bring the chocobos together\".",
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

    jeu_uj_crest_of_davoi = { -- Local patch: Jeuno quests
        "You need to have reached Mission 4-1 of your nation. Speak with Baudin in Upper Jeuno (G-8) to begin the quest.",
        "Trade a Coeurl Meat to Baudin for the key item Crest of Davoi, which lets you pass the Wall of Dark Arts in Davoi.",
    },

    jeu_uj_save_my_sister = { -- Local patch: Jeuno quests
        "Speak with Baudin in Upper Jeuno (G-8) to begin the quest. It does not appear in your current quest list.",
        "Speak with Mailloquetat in Upper Jeuno (H-9) for a cutscene, then return to Baudin.",
        "Speak with Neraf-Najiruf in Ru'Lude Gardens (G-7) for a Ducal Guard's Lantern. You may need to speak with him twice.",
        "Enter the Eldieme Necropolis from Batallia Downs (I-10) and examine the four Braziers in this order: (F-9), (H-7), (F-7), (H-9). Out of order, the lantern won't light.",
        "Return to Baudin for the Holy Mace and 3,000 gil, then speak with Neraf-Najiruf once more.",
    },

    jeu_uj_a_clock_most_delicate = { -- Local patch: Jeuno quests
        "Speak with Collet in Upper Jeuno (G-7), near the clock tower, for a cutscene.",
        "Examine the Door: House west of Collet, to the right of the Marble Bridge, for another cutscene.",
        "Obtain the key item Clock Tower Oil by completing the quest Deal with Tenshodo.",
        "Examine the same Door: House again to complete the quest.",
    },

    jeu_uj_a_candlelight_vigil = { -- Local patch: Jeuno quests
        "Speak with Ilumida in Upper Jeuno (G-8) to begin the quest.",
        "Speak with Rouliette in the Temple of the Goddess, Upper Jeuno (H-9).",
        "Rouliette gives you the key item Holy Candle once you complete the quest Candle-making, which needs a Lanolin Cube from Battering Rams in La Theine Plateau (or rams in Lufaise Meadows or Caedarva Mire).",
        "Return to Ilumida to complete the quest.",
    },

    jeu_uj_the_kind_cardian = { -- Local patch: Jeuno quests
        "This follows The Lost Cardian. Panta-Putta, in the Infirmary in Upper Jeuno (G-10), asks you to take the Two of Swords to the Manustery in Windurst.",
        "Speak with Apururu in Windurst Woods (H-9) for a cutscene.",
        "Obtain a Ten of Cups: kill the Ten of Cups in the Outer Horutoto Ruins (Dahlia Tower, entered from West Sarutabaruta F-11), at (J-8) in the small room with the large locked door, or buy one at the Auction House.",
        "Give the Ten of Cups to Apururu.",
        "Return to Panta-Putta, now in Lower Jeuno (G-10), to complete the quest.",
    },

    jeu_uj_the_lost_cardian = { -- Local patch: Jeuno quests
        "Speak with Naruru, Teigero-Bangero and Panta-Putta in the merchant's house in Lower Jeuno (G-10). Nobody knows where the Two of Swords has gone.",
        "Speak with Bozz in Upper Jeuno (G-9).",
        "Speak with Monberaux in the Infirmary in Upper Jeuno (G-10) for a cutscene about a special patient. You may need to speak with him more than once.",
        "The quest completes after the cutscene, and The Kind Cardian starts automatically.",
    },

    jeu_uj_the_clockmaster = { -- Local patch: Jeuno quests
        "After Save the Clock Tower, examine the Door: House in Upper Jeuno (G-7) to speak with Galmut. This completes the quest.",
        "Optional: speak with Collet again afterwards for a short cutscene.",
    },

    jeu_uj_candle_making = { -- Local patch: Jeuno quests
        "During A Candlelight Vigil, speak with Rouliette in the Temple of the Goddess, Upper Jeuno (H-9). She will make you a candle for a Lanolin Cube.",
        "Obtain a Lanolin Cube from Battering Rams in La Theine Plateau, or from rams in Lufaise Meadows or Caedarva Mire.",
        "Trade the Lanolin Cube to Rouliette for the key item Holy Candle.",
    },

    jeu_uj_searching_for_the_right_words = { -- Local patch: Jeuno quests
        "After A Candlelight Vigil, Rubbish Day and Never to Return, speak with Kurou-Morou in Lower Jeuno (I-7).",
        "Speak with Ilumida in Upper Jeuno (G-8) until she asks you for a Moondrop.",
        "In The Boyahda Tree (map 2, H-8), examine the ??? between 19:00 and 4:00 to spawn the Ahriman NM Agas. It won't spawn during a New Moon. Home Point #1 is close.",
        "Agas uses Level 5 Petrify. Defeat it, then examine the ??? again (still between 19:00 and 4:00) for the key item Moondrop. The whole party can get one.",
        "Return to Ilumida to complete the quest.",
    },

    jeu_uj_a_chocobos_tale = { -- Local patch: Jeuno quests
        "After Promathia Mission 3-2, speak with Nevela at the chocobo stables in Upper Jeuno (G-7).",
        "Speak with Wobke in Bastok Mines (I-9).",
        "Examine the Outpost Gate at the Pashhow Marshlands outpost for a cutscene.",
        "Obtain three Warding Oils from Emerald Quadav in Beadeaux and trade them to the Outpost Gate. There is no time limit, whatever the cutscene says.",
        "Speak with Wobke in Bastok Mines again.",
        "In Batallia Downs (H-6), examine the ??? on a headstone to spawn five Badshah tigers. Defeat them and examine the ??? again for Silver Comet's Collar.",
        "Return to Nevela to complete the quest.",
    },

    jeu_uj_a_reputation_in_ruins = { -- Local patch: Jeuno quests
        "After Promathia Mission 3-3, speak with Migliorozz in the Temple of the Goddess, Upper Jeuno (H-9). You get the key item Phoenix Armlet, or Phoenix Pearl if you have cleared Promathia Mission 3-5; the quest is the same either way.",
        "Enter Pso'Xja from the tower at Beaucedine Glacier (G-9). Go up the stairs to the small room at (I-8) and examine the ??? to fight Gargoyle-Iota and Gargoyle-Kappa. They switch between physical and magic immunity (they glow blue or yellow).",
        "Examine the ??? again for the key item Blue Bracelet.",
        "Go down the stairs to the blue door at (H-9), drop down the hole, and examine the ??? at (H-7) to fight Gargoyle-Lambda and Gargoyle-Mu. Examine it again for the key item Green Bracelet.",
        "Back upstairs at (I-8), go through the green door to the Crystal Receptor at (G-8). Examine it, then hurry back and drop down the hole at (H-9): the platforms below last 120 seconds.",
        "Cross the platforms west then north, take the stairs at (G-7) to the elevator at (H-8), ride it down and examine the Avatar Gate on the west side of the round room.",
        "Return to Migliorozz to complete the quest.",
    },

    jeu_uj_unlisted_qualities = { -- Local patch: Jeuno quests
        "This quest sets your Adventuring Fellow's race, name and looks. You can only change them later by finishing Girl in the Looking Glass and Mirror, Mirror and starting over.",
        "Speak with Luto Mewrilah in Upper Jeuno (G-8) and choose a race and a name from her list.",
        "Speak with Akta in Ru'Lude Gardens (H-10) to choose your fellow's height.",
        "Speak with Kuah Dakonsa in Lower Jeuno (H-8) to choose the face and hair. You see a preview before confirming.",
        "Speak with Red Ghost in Port Jeuno (G-8) to choose the personality, which sets your fellow's dialogue and the food they make.",
        "Speak with Bheem in Upper Jeuno (F-5) for a cutscene.",
        "Return to Luto Mewrilah to complete the quest.",
    },

    jeu_uj_girl_in_the_looking_glass = { -- Local patch: Jeuno quests
        "This quest follows Unlisted Qualities. Zone after finishing it, then speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Speak with Bheem in Upper Jeuno (F-5) for a cutscene.",
        "Enter The Eldieme Necropolis from Batallia Downs (G-8) and examine the ??? at (F-9) on map 2. The skeleton NM Namorodo spawns along with your Adventuring Fellow.",
        "Trusts must be called before you examine the ???, and your fellow takes a party slot. Defeat Namorodo, then speak with your fellow before they leave; otherwise zone and fight it again.",
        "Return to Luto Mewrilah to complete the quest.",
    },

    jeu_uj_mirror_mirror = { -- Local patch: Jeuno quests
        "This quest follows Girl in the Looking Glass. Zone after finishing it, then speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Speak with Portaure in Cargo Room B, Port San d'Oria (H-9), near Home Point #1.",
        "Enter the battlefield through the Hut Door in Ghelsba Outpost (F/G-10). It is capped at level 40 and Trusts can't be used; up to three players can enter.",
        "Fight the Carrion Dragon. Your fellow joins at about 80% of its HP. Watch out for Petro Eyes.",
        "Return to Luto Mewrilah for the Signal Pearl. You can now call your Adventuring Fellow.",
    },

    jeu_uj_past_reflections = { -- Local patch: Jeuno quests
        "This quest follows Mirror, Mirror. Zone after finishing it, then speak with Luto Mewrilah in Upper Jeuno (G-8). If she talks about Fellow Points, speak with her again.",
        "Speak with Tosuka-Porika at the Optistery, Windurst Waters (north, G-8).",
        "Gather a Bison Steak (Auction House), San d'Orian Tea, Icecap Rolanberry (Yoskolo, Lower Jeuno), White Bread and Windurst Salad (Glyke, Upper Jeuno) and Whitefish Stew (Taajiji, Windurst Waters).",
        "Trade all six to Tosuka-Porika for a cutscene.",
        "Return to Luto Mewrilah, then speak with Khumo Daramasteh in Port Jeuno (J-8) to complete the quest.",
    },

    jeu_uj_blighted_gloom = { -- Local patch: Jeuno quests
        "This quest follows Past Reflections and needs Familiarity 45 with your Adventuring Fellow. Speak with Luto Mewrilah in Upper Jeuno (G-8); she sends you to one of three places.",
        "The ??? is in Ordelle's Caves (map 2, I-5, entered from La Theine Plateau H-7), Korroloka Tunnel (map 5, F-10) or Ranguemont Pass (I-9).",
        "Examine the ??? to spawn the Metallic Slime and your fellow. Defeat it, speak with your fellow, then examine the ??? again for Vitrallum. The slime respawns after 3 minutes.",
        "Return to Luto Mewrilah.",
        "In Jugner Forest, examine the ??? by the north lake at (G-5) to complete the quest. The quickest way there is through King Ranperre's Tomb from East Ronfaure, leaving at (K-5), or the Geomagnetic Fount.",
    },

    jeu_uj_blessed_radiance = { -- Local patch: Jeuno quests
        "This quest follows Blighted Gloom and needs Familiarity 70 with your Adventuring Fellow. Speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Enter Neptune's Spire in Lower Jeuno and examine the first door on the left.",
        "With your fellow called, gather three key items: Glimmering Mica (Pickaxe, Maze of Shakhrami), Mistroot (Sickle, Giddeus) and Lunascent Log (Hatchet, Jugner Forest).",
        "Warping home dismisses your fellow, but Survival Guides and mounts don't: Shakhrami, Jugner and West Sarutabaruta guides cover all three with one call.",
        "Zone into Beaucedine Glacier for a cutscene, then go to the northernmost Mirror Pond at (J-7).",
        "Examine the door in Neptune's Spire again, then speak with Luto Mewrilah to complete the quest.",
    },

    jeu_uj_mirror_images = { -- Local patch: Jeuno quests
        "This quest follows Blessed Radiance and needs Familiarity 85 with your Adventuring Fellow. Speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Enter Qu'Bia Arena from Fei'Yin (K-8); Home Point #1 is closest. The fight is capped at level 50.",
        "Defeat the demon Vassago. Let your fellow tank (Stalwart Shield works well). When your fellow says 'Here it comes! Get back!', step away from Blighted Gloom.",
        "Return to Luto Mewrilah for a cutscene.",
        "Examine the first Door: Neptune's Spire on the left in Lower Jeuno for a long cutscene that completes the quest.",
    },

    jeu_uj_chameleon_capers = { -- Local patch: Jeuno quests
        "This quest needs Familiarity 65 with your Adventuring Fellow. Speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Speak with Muhoho on the palace balcony in Ru'Lude Gardens (H-7).",
        "Speak with Gelzerio in Boytz's Knickknacks, Bastok Mines (H-7).",
        "Speak with Chamama in the Rarab Tail Hostelry, Windurst Waters (north, F-10), for the key item Jar of Reversion Dust.",
        "Speak with Luto Mewrilah again, then go to Lower Delkfutt's Tower with your Signal Pearl. Examine the ??? at (J-9), then the one at (I-5), then the one in the pool at (J-9) to spawn the Illusory Pot and your fellow.",
        "Defeat the pot, speak with your fellow and examine the ??? again. Choose a Tactics Manual: Fortitude (Stalwart Shield), Might (Fierce Attacker) or Endurance (Soothing Healer).",
        "Show the manual at any city Rendezvous Point to teach your fellow the new role. Manuals aren't used up; the other two can be bought from Ajahkeem for Fellow Points.",
    },

    jeu_uj_regaining_trust = { -- Local patch: Jeuno quests
        "This quest follows Picture Perfect and needs Familiarity 55 with an Adventuring Fellow at 51 or higher. Speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Speak with Monberaux in the Infirmary, Upper Jeuno (G-10), then return to Luto Mewrilah.",
        "On Qufim Island, go north past Delkfutt's Tower through the tunnel to the Giant Footprint at (E-6), next to a cermet spine.",
        "Examine it to spawn the Gigas NM Ingaevon and your fellow. Defeat it, then speak with your fellow. It respawns after 3 minutes.",
        "Return to Luto Mewrilah, then speak with Monberaux to complete the quest.",
    },

    jeu_uj_mixed_signals = { -- Local patch: Jeuno quests
        "This quest follows Regaining Trust and needs Familiarity 80 with an Adventuring Fellow at 56 or higher. With your Signal or Tactics Pearl in your bags but not equipped, speak with Ratoto by the Upper Jeuno Guide Stone (I-10).",
        "Speak with Luto Mewrilah in Upper Jeuno (G-8).",
        "Speak with Raimbroy in Raimbroy's Grocery, Southern San d'Oria (E-8), then return to Luto Mewrilah.",
        "In Beadeaux, enter Qulun Dome from map 2 (M-8) and examine the ??? at (I-6), the same one as for Whence Blows the Wind.",
        "Return to Luto Mewrilah to complete the quest.",
    },

    jeu_uj_lure_of_the_wildcat = { -- Local patch: Jeuno quests
        "Speak with Ajithaam in Upper Jeuno (F-5) for the key item White Sentinel Badge.",
        "Speak with these 20 people. Ru'Lude Gardens: Albiona (H-9), Crooked Arrow (G-8), Muhoho (H-7), Adolie (G-7), Yavoraile (I-6).",
        "Upper Jeuno: Sibila-Mobla (G-7), Shiroro (G-8), Luto Mewrilah (G-8), Renik (H-9), Hinda (H-9).",
        "Lower Jeuno: Sutarara (J-7), Saprut (I-7), Bluffnix (H-9), Naruru (H-10), Gurdern (G-10).",
        "Port Jeuno: Red Ghost (G-8), Karl (H-8), Shami (H-8), Sagheera (I-8), Rinzei (I-8).",
        "Return to Ajithaam for the key item White Invitation Card. After joining Salaheem's Sentinels, show it to Naja Salaheem for Imperial currency; Ajithaam will then teleport you to Aht Urhgan Whitegate for 300 gil.",
    },

    jeu_uj_a_furious_finale = { -- Local patch: Jeuno quests
        "Zone and wait until the next game day after Comeback Queen. As a Dancer of level 66 or higher, speak with Laila in Upper Jeuno (G-7).",
        "Obtain a Dancer's Testimony from Young, Amber, Amethyst or Veteran Quadav in Grauberg [S] or North Gustaberg [S].",
        "Trade the testimony to Laila; she teleports you to Qu'Bia Arena.",
        "Trade the testimony to the Burning Circle to fight Laila. Bring her to about 25% HP within 10 minutes to win. Trusts are allowed if you have Rhapsody in Umber.",
        "Not needed if you have already completed New Worlds Await or a later limit break.",
    },

    jeu_uj_clash_of_the_comrades = { -- Local patch: Jeuno quests
        "This quest follows Mixed Signals and needs Familiarity 100 with an Adventuring Fellow at 61 or higher. Speak with Luto Mewrilah in Upper Jeuno (G-8). If she has no cutscene, try Ajahkeem.",
        "Enter Qu'Bia Arena in Fei'Yin (Home Point #1 is close) to fight your fellow one-on-one. Your fellow's job depends on yours, and you lose no experience.",
        "Your hits seem capped at about 200 damage. Your fellow gives up at 10-20% HP, which completes the quest.",
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

    jeu_pj_childs_play = { -- Local patch: Jeuno quests
        "While The Wonder Magic Set is active, speak with Karl in Port Jeuno (H-8). He will give you a Wonder Magic Set for a White Rock.",
        "Trade a White Rock to Karl for the key item Wonder Magic Set.",
    },

    jeu_pj_pretty_little_things = { -- Local patch: Jeuno quests
        "Speak with Zona Shodhun in Port Jeuno (E-8). She likes pretty flowers and pebbles.",
        "Obtain a Yellow Rock. It is sold at the Auction House (Materials > Goldsmithing), or mined in Gusgen Mines or Yughott Grotto on Earthsday.",
        "Trade the Yellow Rock to Zona Shodhun to complete the quest. Your Mog House in Jeuno can now exit to any Jeuno area.",
    },

    jeu_rg_northward = {
        "Speak with Radeivepart in Ru'Lude Gardens (H-9). He requests that you bring him a Flame Degen. You need Jeuno fame level 4.",
        "Obtain a Flame Degen. It can be purchased at the Auction House, purchased with Sparks of Eminence, crafted, or it rarely drops from Napalm enemies.",
        "Trade the Flame Degen to Radeivepart to complete the quest and receive the Map of Castle Zvahl.",
    },

    jeu_rg_defiant_challenge = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on a level 50 job. You need Jeuno fame level 1.",
        "Maat asks for a Bomb Coal, an Exoray Mold and an Ancient Papyrus, in any order. Each drops from monsters, or three key-item pieces from ??? spots combine into it. If you already hold one of the finished items in any inventory, that zone's ??? says \"There is nothing out of the ordinary here.\"",
        "Solo, bring Sneak and Invisible (spells, Silent Oil and Prism Powder, Spectral Jig, or Tonko/Monomi: Ichi); drop Invisible to click each ??? and reapply. Reraise (e.g. a Scroll of Instant Reraise) is recommended. To fight for the drops instead, Trusts are enough; beware Explosure's Self-Destruct and Exoray's conal Breath (Cipher: Zeid stuns them).",
        "Bomb Coal: drops from Explosures, or collect three Bomb coal fragments in Garlaige Citadel, all on map 2 at (I-8), (H-7) and (G-6). First take the Pouch of weighted stones key item from the ??? on the floor at (G-8), map 1, just south of the entrance; undead aggro low HP through Sneak and Invisible.",
        "Garlaige route: go south and east through the first Banishing Gate, run round the outside of the square room to the east, down the stairs and hug the left wall to a wide room: ??? at (I-8). Go north-west to the next room: ??? at (H-7). Continue north, turn left down a hallway, and past the third Banishing Gate the last ??? is on your right in the first room at (G-6). Don't fall in the holes in the floor.",
        "Exoray Mold: drops from Exorays (uncommon), or collect three Exoray mold crumbs in Crawlers' Nest. Run past the crawlers and bees, up the hill, drop into the \"sack room\" and head south-south-west (not the south-south-east dead end): ??? on the path from (I-10), map 1, towards map 3, and another further along at (I-6), map 3. Use Sneak around the Exorays.",
        "For the last crumb, go back to the sack room and take the north-west tunnel (not the scorpion dead end), through the green glow and up the hill into a new sack room, take the west-south-west tunnel, turn right at the ledge (don't drop) and left into the dead-end room: ??? at (G-10), map 2, among the Exorays.",
        "Ancient Papyrus: drops from Liches (common), or collect three Ancient papyrus shreds in The Eldieme Necropolis, entering from Batallia Downs (I/J-10). The ??? spots are at (F-7), (F-9) and (H-9), map 1, each in the corner of a room with Liches around a brazier. Don't walk over the square graves: some drop you to a lower level (warp out and come back).",
        "Eldieme route: go in, turn left past the ghosts and follow the hallway. If the path left at the Hellhounds is blocked, go north into the grave room, examine the East Plate behind the Gravestone to open it, and come back (a Magicked astrolabe, 10,000 gil from Churano-Shurano in Windurst Waters (F-8), opens the gates for good). Take care at the lever: the lone bomb nearby aggroes by sight and magic.",
        "Pass the first brazier room (first ???) to an identical room down the hall (second ???), follow the only path west and north through the large grave room and up the stairs, to the last brazier room with the third ???.",
        "Trade the items to Maat to complete the quest, which raises your level cap to 55.",
    },

    jeu_rg_highest_mountains = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on a level 51 job. You need Jeuno fame level 1. He asks you for three key items guarded by monsters in Xarcabard.",
        "If this is your first time heading to Xarcabard, you may use the Unity level 125 warp to Xarcabard.",
        "The key items are: Round frigicite from Boreal Tiger at (I-5), Square frigicite from Boreal Coeurl at (J-6) and Triangular frigicite from Boreal Hound at (G-10).",
        "The Notorious Monsters stand guard in caves, have a fairly large aggro range, and respawn within about 5 minutes after being defeated.",
        "The ??? spot is always present at the far end of the cave, and you receive the key item once you touch it, so you do not need to defeat the Notorious Monsters: you can simply hold them while examining the spots. They no longer use draw-in according to the page, although a note says the Coeurl did use it several times when tested in 2024.",
        "Trusts make the Notorious Monsters easy to solo. Or ride through each cave on a Mount to get the key item, then remount or run out.",
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
        "Kindred's Seals come from any normal monster of level 50-69 that checks as Easy Prey or higher, from Shemo at 3 other seals for 1 (2 for 1 during some campaigns), or from the Greeter Moogle for 5 login points each when that's offered. New Worlds Await needs 5 more, so you may want 9 at once. Don't confuse them with Kindred's Crests.",
        "There is one clue each for San d'Oria, Bastok and Windurst, and one for Selbina or Mhaura, in no particular order. Trade a seal to the person the clue describes; in return you receive either a Smiling stone, Scowling stone, Somber stone or Spirited stone.",
        "San d'Oria: sick mother = Raminel (Southern San d'Oria, runs between (F-8) and (I-9)); likes her knives sharp = Sobane (Southern, D-6); wants to be a Royal Knight = Taurette (Northern, F-7); breath stinks = Maloquedil (Northern, J-8); job where they're not too rough = Sheridan (Port, H-10); runs the Consortium warehouses = Fontoumant (Port, H-10); nirvana slash = Brifalien (Port, H-8); more than scrolls of Stone = Rugiette (Port, J-8).",
        "Bastok: pioneer of the Palborough Mines = Babenn (Bastok Mines, J-6); watching Dalzakk's home = Gwill (Markets, E-11); robes and bronze subligaria = Brygid (Markets, K-9); never as good as her sister = Kaede (Port Bastok, J-5); lost her husband in the mines = Hilda (Port Bastok, E-6); number five doorman = Naji (Metalworks, J-8); \"Silent Mountain\" = Raibaht (Metalworks, G-8); age of magic = Lucius (Metalworks, J-9).",
        "Windurst: smartest-looking Mithra child = Koko Lihzeh (Windurst Waters, K-6); something snappy to hook customers = Naiko-Paneiko (Waters, C-11); \"strange little poppet\" = Kerutoto (Waters, J-8); magic doll upgrades = Koru-Moru (Windurst Walls, E-7); sick of being left out = Shanruru (Port Windurst, H-5); \"hats suck\" = Boizo-Naizo (Windurst Woods, H-10); another tasty frog = Sola Jaab (Woods, K-10); rolanberry souvenirs = Kupipi (Heavens Tower).",
        "Selbina/Mhaura: weaving woman who lost her memory = Mathilde (Selbina, H-9); Galkan child great at hiding = Vobo (Selbina, I-7); raising his own sheep = Melyon (Selbina, I-9); pupil of Zaldon = Gabwaleid (Selbina, H-9); fiance in Selbina = Celestina (Mhaura, G-8); small mayor = Ekokoko (Mhaura, F-9); knows a lot about pirates = Bihoro-Guhoro (Mhaura, G-9); wants to work with monsters = Jikka-Abukka (Mhaura, H-9).",
        "Speak with Maat once you have all four stones to complete the quest, which raises your level cap to 70.",
    },

    jeu_rg_shattering_stars = {
        "Speak with Maat in Ru'Lude Gardens (H-5) on any level 66-70 job. You need Jeuno fame level 1. This limit break applies to the jobs that existed before the Treasures of Aht Urhgan expansion, and it needs the Testimony item for the job you want to fight Maat with.",
        "Each job's Testimony (Warrior's Testimony, Monk's Testimony, etc.) drops from specific monsters; see the item's wiki page for where. A Testimony can be used up to three times before it tears.",
        "Once you trade the Testimony to Maat, he asks if you are ready.",
        "Saying yes teleports you to an arena (for later fights he may not warp you). On rematches, or a job other than your first, you must use that job's assigned arena: Balga's Dais for MNK/WHM/SMN, Horlais Peak for WAR/BLM/RNG, Qu'Bia Arena for PLD/DRK/BRD, Waughroon Shrine for RDM/THF/BST, Chamber of Oracles for SAM/NIN/DRG.",
        "Trade the Testimony to the Burning Circle to enter a one-on-one battle against Maat. The time limit is 10 minutes, and after about 5 minutes from engaging Maat, he begins to use Asuran Fists. Maat has all the relevant abilities and spells of your main job.",
        "Your support job is removed when you enter, so you lose all buffs except food, and your TP. Maat copies your main job with Monk as his support job, including your special ability, and can use all Hand-to-Hand weapon skills. With the key item \"Rhapsody in Umber\" (Rhapsodies of Vana'diel Missions, around level 55) you can call Trusts.",
        "A White Mage may instead pull Maat and stay alive for 5 minutes, causing Maat to give up. A Thief may try to steal a Scroll of Instant Warp from Maat; once you steal it, Maat gives up.",
        "When Maat gives up, you receive the title Maat Masher and a Scroll of Instant Warp.",
        "Return to Ru'Lude Gardens and speak with Maat to complete the quest, which raises your level cap to 75.",
        "If you have not yet gained access to Aht Urhgan Whitegate through the quest The Road to Aht Urhgan, you may trade your Testimony afterwards under the advanced path option and complete the quest.",
    },

    jeu_rg_beyond_the_sun = {
        "This quest requires the Rise of the Zilart pack. Talk to Maat at (H-5) in Ru'Lude Gardens on each of the 15 jobs that existed before Treasures of Aht Urhgan, and defeat him with each one.",
        "The level required to fight Maat is at least level 66.",
        "Talk to Maat before every fight: he asks for that job's Testimony and names the battlefield. After your first win each job has an assigned arena, and you have to walk, use the Tenshodo warp or a Home Point to get there: Balga's Dais for MNK/WHM/SMN, Horlais Peak for WAR/BLM/RNG, Qu'Bia Arena for PLD/DRK/BRD, Waughroon Shrine for RDM/THF/BST, Chamber of Oracles for SAM/NIN/DRG. The fights are like Shattering Stars, without the level cap.",
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
        "He asks for a few items from this list: Chocobo Bedding, Counterfeit Gil, Dart, Eastern Paper, Fernan's Diaries, Goblin Bread, Goblin Doll, Goblin Mushpot, Goblin Pie, Kaiserin Cosmetics, Kongou Inaho, My First Magic Kit, Naphille Pochette, Nyumomo Doll, Shuriken, Silver Obi, Snoll Gelato, Sphene Earring, Tonosama Rice Ball, Turquoise Ring.",
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