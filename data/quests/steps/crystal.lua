local ACTOR = require('data.actors')

local Q = {}

Q.STEPS = {
    -- ========================================================
    -- BATALLIA DOWNS (S)
    -- ========================================================
    cw_bat_lost_in_translocation = {
        'Speak with ' .. ACTOR.THORBEN_WOTG.text .. ' in Batallia Downs (S).',
        'Enter The Eldieme Necropolis (S) through the Crypt Door beside ' .. ACTOR.THORBEN_WOTG.text .. '.',
        'Examine the Sarcophagus at (I-9) to obtain the right map piece.',
        'Examine the Gravestone at (H-8) to obtain the middle map piece.',
        'During Campaign, speak with ' .. ACTOR.ERIK_WOTG.text .. ' to obtain the left map piece.',
        'Examine ' .. ACTOR.BATALLIA_S_BLANK_TARGET_ERIK.text .. ' beside ' .. ACTOR.ERIK_WOTG.text .. ' and choose "Into the fire" to return to Batallia Downs (S).',
        'Speak with ' .. ACTOR.THORBEN_WOTG.text .. ' again to complete the quest and receive the reward.',
    },

    cw_bat_message_on_the_wind = {
        "Speak with Romualdo in the Metalworks (K-9) in the present. The quest appears in your log after the next step.",
        'Speak with ' .. ACTOR.ROMUALDO_WOTG.text .. ' in Batallia Downs (S).',
        "Speak with Childerich by the Old Cabin in Grauberg (S) (E-12).",
        "Examine the ??? at (J-9), east of the Grauberg Guntower.",
        "Speak with Childerich again.",
        'Return to ' .. ACTOR.ROMUALDO_WOTG.text .. ' in Batallia Downs (S) to complete the quest and receive the Smart Grenade.',
        "Optional, for the title: speak with Romualdo in the present, then with Childerich, and choose \"Message on the Wind\".",
    },

    cw_bat_face_of_the_future = {
        "This quest starts automatically after Chasing Shadows. Enter present-day Jugner Forest from Batallia Downs for a cutscene.",
        'Examine ' .. ACTOR.METALLIC_HODGEPODGE.text .. ' in Jugner Forest, at the base of a tree near the (F-9)/(G-9) border.',
        "Zone into Ghelsba Outpost for a cutscene and the key item Orcish infiltration kit (spares from the Clandestine Marking at (I-10)). Domenic in Lower Jeuno (J-7) warps you there for 750 gil after Beyond Infinity; the Fort Ghelsba Survival Guide is right by it, or cast Escape from the Yughott Grotto Home Point.",
        'Travel to Yughott Grotto Map 1 and examine ' .. ACTOR.SCRAPE_MARK.text .. ' at (G-9).',
        'Examine ' .. ACTOR.SCRAPE_MARK.text .. ' again to enter the Face of the Future battlefield.',
        "Only Fangmonger Colossus must die; each of the 6 Tombstones you kill weakens its damage resistance. They use Seismostomp and Numbing Glare (conal paralysis) and are slow, so kite them while curing Excenmille and Maxcimille (Bostillette joins later).",
        'Examine ' .. ACTOR.MAW_BATALLIA.text .. ' in Batallia Downs (H-5) to complete the quest and receive the Griffon Ring. The maw must already be unlocked in the past; with a full inventory, examine the ??? by the maw in Batallia Downs (S) later.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S) and bring the Bundle of half-inscribed scrolls to obtain Trust: Excenmille (S).',
    },

    cw_bat_grave_resolve = {
        'Speak with ' .. ACTOR.HALVER.text .. ' in Chateau d\'Oraguille (I-9), Northern San d\'Oria Home Point #2.',
        "Obtain a Lilac: Areebah at the M&P's Market in Upper Jeuno (H-6) sells them.",
        'Travel to the ' .. ACTOR.HER_MEMORIES_WEATHERED_GRAVESTONE_WOTG.text .. ' in Batallia Downs (I-10), on the hill just above The Eldieme Necropolis entrance (its Survival Guide is closest).',
        "Trade the Lilac to the Weathered Gravestone for a cutscene and the Tiny Memory Fragment, or the Large memory fragment if this is the last of the three.",
    },

    -- ========================================================
    -- CRAWLERS' NEST (S)
    -- ========================================================
    cw_crn_weekly_adventurer = {
        'Speak with ' .. ACTOR.NAIKO_PANEIKO_WOTG.text .. ' in Crawlers\' Nest (S) and receive the Scoop-Dedicated Linkpearl.',
        'Travel to Rolanberry Fields (S) and speak with ' .. ACTOR.RAKULA_MOTAKULA_WOTG.text .. ' on the turret.',
        'Answer the mandragora questions: Leafed = 4, Black = 4, and Flowered = 5.',
        'Return to ' .. ACTOR.NAIKO_PANEIKO_WOTG.text .. ' to complete the quest and receive the Map of Fort Karugo-Narugo.',
    },

    cw_crn_evil_at_inlet = {
        'Speak with ' .. ACTOR.RODEUPANSAT_WOTG.text .. ' in Crawlers\' Nest (S) and receive the Evil Warding Seal.',
        'Travel to Vunkerl Inlet (S) at (D-11).',
        'Examine the ' .. ACTOR.CRAWLERS_NEST_S_WINDOW_QQ.text .. '.',
        'Return to ' .. ACTOR.RODEUPANSAT_WOTG.text .. ' in Crawlers\' Nest (S) to complete the quest.',
    },

    -- ========================================================
    -- WINDURST WATERS (S)
    -- ========================================================
    cw_wwt_dawn_of_delectability = {
        'Speak with ' .. ACTOR.RANPI_MONPI_WOTG.text .. ' in Windurst Waters (S).',
        'Travel to present-day Windurst Waters and speak with Ranpi-Monpi there.',
        "Obtain a Bastore Sweeper (fish in Vunkerl Inlet (S)), a Walnut (log in East Ronfaure (S)), a Dragon Fruit (log in Fort Karugo-Narugo (S)) and Pepperoni (Cooking 85); all are also on the Auction House.",
        'Trade all four ingredients to Ranpi-Monpi and wait one Vana\'diel day.',
        "Collect the Ranpi-Monpi Specialty, take it to Ranpi-Monpi in Windurst Waters (S) to feed the young lad for a Culinary Knife, and bring the knife back to the present-day Ranpi-Monpi.",
        'Receive the Trainee Knife reward.',
    },

    cw_wwt_redeeming_rocks = {
        'Speak with ' .. ACTOR.KOCCO_EHLLEK_WOTG.text .. ' in Windurst Waters (S).',
        'Speak with ' .. ACTOR.ROHN_EHLBALNA_WOTG.text .. '.',
        'Return to ' .. ACTOR.KOCCO_EHLLEK_WOTG.text .. ', who asks for a piece of kionite.',
        'Examine ' .. ACTOR.VUNKERL_S_KIONITE_QQ.text .. ' in Vunkerl Inlet (S) to obtain the Piece of Kionite.',
        'Return the blue stone to ' .. ACTOR.KOCCO_EHLLEK_WOTG.text .. '.',
        'Wait until the next Vana\'diel day and speak with ' .. ACTOR.KOCCO_EHLLEK_WOTG.text .. ' again to receive the reward.',
    },

    cw_wwt_snake_on_the_plains = {
        'Speak with ' .. ACTOR.MIAH_RIYUH_WOTG.text .. ' in Windurst Waters (S) and exchange the Green Recommendation Letter for putty.',
        'Travel to West Sarutabaruta (S) and apply the putty to the sealed entrances at (F-4), (F-11), and (J-8).',
        'Return to ' .. ACTOR.MIAH_RIYUH_WOTG.text .. ' in Windurst Waters (S).',
    },

    cw_wwt_tigress_stirs = {
        'Enter Windurst Waters (S) and obtain the Inky Black Yagudo Feather.',
        'Speak with ' .. ACTOR.DHEA_PRANDOLEH_WOTG.text .. ' in Windurst Waters (S).',
        'Travel to West Sarutabaruta (S) and examine ' .. ACTOR.WEST_SARUTABARUTA_S_STARFALL_HILLOCK_QQ.text .. ' to obtain the Small Starfruit key item.',
        'Check the ' .. ACTOR.WINDURST_S_ACOLYTE_HOSTEL_DOOR.text .. '.',
    },

    cw_wwt_tigress_strikes = {
        'Speak with ' .. ACTOR.DHEA_PRANDOLEH_WOTG.text .. ' in Windurst Waters (S).',
        "Travel to Fort Karugo-Narugo (S) and speak with Rotih Moalghett on the Fivespires map (I-8), on the second-floor ledge east of the Spiritwell; reach Fivespires through the Cavalry Gate (F-8) or by touching the Phosphorous Ward at (I-9).",
        'Exit the fortress and examine ' .. ACTOR.FORT_KARUGO_NARUGO_S_QQ_I9.text .. ', then examine it again to face War Lynx.',
        "Defeat War Lynx (about 7,000 HP, sleepable, resists Thunder; face away to avoid many of its TP moves).",
        'Examine ' .. ACTOR.FORT_KARUGO_NARUGO_S_QQ_I9.text .. ' again after the battle.',
        'Return to ' .. ACTOR.DHEA_PRANDOLEH_WOTG.text .. ' to receive the reward.',
    },

    cw_wwt_lost_book = {
        'Examine the southern Rhinostery door in Windurst Waters (S).',
        "Take a Mythril Beastcoin (farm it or buy it on the Auction House) to Quu Bokye in the lower levels of Giddeus and trade it for the Leather-bound Book.",
        'Return to the Rhinostery door in Windurst Waters (S).',
        "Examine the Optistery door in Windurst Waters (S) (F-8); they ask for a Vellum (Leathercraft or Auction House) and a Lynx Pelt.",
        "Get the Lynx Pelt from the ??? in Castle Oztroja (S) at (G-8) on the first floor, then trade the Vellum to the Optistery door for a cutscene.",
        'Wait one Vana\'diel day and return to the Optistery to receive the Scroll of Retrace.',
    },

    cw_wwt_knot_quite_there = {
        'Defeat Yagudo near the fortification in Sauromugue Champaign (S) around (K-9) until you obtain a 108-Knot Quipu.',
        'Speak with ' .. ACTOR.DHEA_PRANDOLEH_WOTG.text .. ' in Windurst Waters (S).',
        'Check the left-hand ' .. ACTOR.WINDURST_S_ACOLYTE_HOSTEL_DOOR.text .. ' at (K-5) in Windurst Waters (S), on the ground floor, for a cutscene with the young Ajido-Marujido.',
        'Travel to Sauromugue Champaign (S) and check ' .. ACTOR.BULWARK_GATE_WOTG.text .. ' to meet Rachemace.',
        'Trade the 108-Knot Quipu to ' .. ACTOR.BULWARK_GATE_WOTG.text .. '.',
        'Check the Bulwark Gate repeatedly until the "door is firmly sealed" message appears at least three times.',
        "Enter Southern San d'Oria (S) from East Ronfaure (S) on foot (not mounted) to meet Pattna-Ottna. If you get a message about Rhapsodies of Vana'diel being blocked, exit and re-enter on foot.",
        'Go through the Portcullis and check ' .. ACTOR.SOUTHERN_SAN_DORIA_S_HOUSE_DOOR_M8.text .. ' to complete the quest and receive the reward.',
    },

    cw_wwt_handbag = {
        "Speak with Hampu-Kampu in Windurst Waters (S) (G-8), outside the gate that blocks Gingerberry Grove.",
        'Examine ' .. ACTOR.WINDURST_S_ACOLYTE_HOSTEL_DOOR.text .. ' at (K-4) on the north map: second floor, right side of the left building.',
        'Return to Hampu-Kampu and receive the Torn Patches of Leather key item.',
        "Travel to present-day Southern San d'Oria and speak with Kipopo inside the first-floor room at (D-8).",
        'Obtain Laminated Ram Leather, Sheep Leather, and Silk Thread and trade them to Kipopo.',
        'Change zones and return to Kipopo to receive the Repaired Handbag.',
        'Return to Hampu-Kampu in Windurst Waters (S) and trade the handbag for the Trainee\'s Needle reward.',
    },

    -- ========================================================
    -- THE ELDIEME NECROPOLIS (S)
    -- ========================================================
    cw_eld_little_knowledge = {
        'Speak with ' .. ACTOR.ERLENE_WOTG.text .. ' in The Eldieme Necropolis (S), on the first map, while on a level 30+ job for a cutscene. The Survival Guide puts you inside; otherwise enter from Batallia Downs (S) (J-10), walk straight down the tunnel, and she is in the room where it forks north and south.',
        'Obtain 12 sheets of Vellum: buy them at the Auction House (Leathercraft), or trade Rolanberries to Tucker in Crawlers\' Nest (S) (K-8) on the first map, once the quest is active. Tucker accepts only 3 trades of up to 4 stacks each (one sheet per stack), so bring 12 stacks and trade 4 at a time. Champalpieu in Upper Jeuno sells Rolanberries.',
        'Trade all 12 Vellum to ' .. ACTOR.ERLENE_WOTG.text .. '.',
        "Change to BLM, RDM, SMN, or BLU (it doesn't need to be level 30) and activate Astral Flow, Chainspell, Azure Lore, or Manafont.",
        'While the two-hour ability is active, speak with ' .. ACTOR.ERLENE_WOTG.text .. ' again.',
        'Receive the Grimoire and Scholar job access.',
        'Once your Scholar is level 5 or higher, speak with ' .. ACTOR.ERLENE_WOTG.text .. ' again while on Scholar to learn Embrava and Kaustra (these spells have no scrolls).',
    },

    cw_eld_requiem_departed = {
        'Speak with ' .. ACTOR.HEPTACHIOND_WOTG.text .. ' in The Eldieme Necropolis (S).',
        'Travel to Fort Karugo-Narugo (S) and reach the Phosphorous Ward at (I-9) on Map 1.',
        'Proceed to Map 2 and speak with Pecca-Pocca at (G-12) to receive the Sheaf of Handmade Incense.',
        'Return to ' .. ACTOR.HEPTACHIOND_WOTG.text .. ' to receive the Scroll of Recall-Meriph.',
    },

    cw_eld_on_sabbatical = {
        'Speak with ' .. ACTOR.ERLENE_WOTG.text .. ' in The Eldieme Necropolis (S) to begin the quest and receive Ulbrecht\'s sealed letter.',
        "Speak with Gentle Tiger in Bastok Markets (S) (H-6) for a cutscene. If he says he has never heard of a bundle of half-inscribed scrolls, speak with him again; you may need to finish the Bastok (S) quests first.",
        "In the southwest corner of Pashhow Marshlands (S), touch the Indescript Markings on the line between (E-10) and (E-11) for a cutscene and Schultz's sealed letter. Level ~80 Virulent Peistes around them aggro on sight: use Invisible, or bring a strong job.",
        'Return to ' .. ACTOR.ERLENE_WOTG.text .. ' to receive Klimaform.',
    },

    cw_eld_downward_helix = {
        'Zone and wait until the next game day after On Sabbatical. As a Scholar, speak with ' .. ACTOR.ERLENE_WOTG.text .. ' in The Eldieme Necropolis (S) for a cutscene.',
        'Zone into Southern San d\'Oria (S) from East Ronfaure (S); the Survival Guide and telecrystals don\'t count.',
        'Return to ' .. ACTOR.ERLENE_WOTG.text .. '.',
        'Zone into Sauromugue Champaign (S) from Rolanberry Fields (S) for a cutscene.',
        'Examine the Indescript Markings on the ledge in the south-east corner of (J-7) in Sauromugue Champaign (S), near a ???, for a cutscene and the key item Ulbrecht\'s mortarboard. They disappear during dust (earth) weather.',
        'Return to ' .. ACTOR.ERLENE_WOTG.text .. ' for a cutscene and your Scholar\'s Bracers. Afterwards Loussaire in Bastok Markets (S) (G-10) can make the rest of your artifact pieces.',
    },

    cw_eld_seeing_blood_red = {
        'Zone and wait until the next game day after Downward Helix. As a Scholar, speak with ' .. ACTOR.ERLENE_WOTG.text .. ' in The Eldieme Necropolis (S); from here on any job works.',
        'Examine the Indescript Markings along the north edge of (E-11) in Pashhow Marshlands (S), by the wall, for the key item Unaddressed sealed letter. The Recall-Pashh telepoint and the Survival Guide put you at the south end of the map, a short walk west.',
        'Read the Unaddressed sealed letter from your Temporary Key Items menu.',
        'Return to ' .. ACTOR.ERLENE_WOTG.text .. ' for a cutscene and the key item Porting magic transcript.',
        'In Grauberg (S), enter the cave opposite the waterfall on the (E-10)/(F-10) line and examine the shimmering light on the ground. The entrance is on dry land; if you reach the waterfall you\'ve gone too far and have to go back around. The Campaign Arbiter warp from a Shadowreign city lands closest.',
        'Examine the Indescript Markings on the cave wall to enter the battlefield in Ruhotz Silvermines. The party leader must have the quest; up to 6 can enter, Trusts are allowed, 30 minute limit.',
        'Fight Ulbrecht, a level 67 Scholar with about 12,000 HP who casts tier III nukes, Sleep, Drain, Aspir, Dispel and cures. He is immune to Silence but not to Bind, Gravity or Sleep, and uses Tabula Rasa at about 50%. The fight ends when he drops below 20%. If you lose, trade ' .. ACTOR.ERLENE_WOTG.text .. ' a Sheet of Vellum for a new Porting magic transcript.',
        'Return to ' .. ACTOR.ERLENE_WOTG.text .. ' for your Scholar\'s Mortarboard.',
    },

    -- ========================================================
    -- BASTOK MARKETS (S)
    -- ========================================================
    cw_bmk_fighting_fourth = {
        'Speak with ' .. ACTOR.ADELBRECHT_WOTG.text .. ' in Bastok Markets (S) and turn in the Blue Recommendation Letter to receive Battle Rations. The quest changes your Campaign allegiance at no cost; speaking to him again before you finish lets you cancel it.',
        'Travel to North Gustaberg (S), climb the first level of Zegham Hill from around (I-8), and speak with ' .. ACTOR.GEBHARDT_WOTG.text .. ' at (I-6).',
        'Speak with ' .. ACTOR.RODERICH_WOTG.text .. ' at (E-11).',
        'Interact with ' .. ACTOR.NORTH_GUSTABERG_S_BARRICADE_E7.text .. ' at (E-7).',
        'Return to ' .. ACTOR.ADELBRECHT_WOTG.text .. ' to join the Republican Legion\'s Fourth Division (Sprinter\'s Shoes if this is your first allegiance quest).',
    },

    cw_bmk_burden_of_suspicion = {
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Speak with ' .. ACTOR.ENGELHART_WOTG.text .. ' in Bastok Markets (S).',
        'Travel to Batallia Downs (S) and enter The Eldieme Necropolis (S) via (J-10).',
        'Reach the southern chamber at (G-9), fall through the center hole, and enter the northern room at (I-7).',
        'Defeat or evade the Orcs and examine the Sarcophagus.',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Speak with ' .. ACTOR.BLATHERIX_WOTG.text .. ' to receive the reward.',
    },

    cw_bmk_storm_on_horizon = {
        'Enter Bastok Markets (S) from North Gustaberg (S).',
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. '.',
        'Examine ' .. ACTOR.NORTH_GUSTABERG_S_MONUMENT_J7.text .. ' on Zegham Hill in North Gustaberg (S): climb in around (I-8), go counter-clockwise on the second level to the ramp at (J-8), then clockwise to the last ramp at the top of (J-7).',
        'Examine ' .. ACTOR.GRAUBERG_QQ_H6.text .. ' in the Grauberg (S) cave (entrance at the south-east corner of (H-5); the Survival Guide is fastest) to complete the quest.',
    },

    cw_bmk_azure_footfalls = {
        'Enter Bastok Markets (S) from North Gustaberg (S).',
        'Speak with ' .. ACTOR.ADELBRECHT_WOTG.text .. '.',
        'Travel to the Eduard Watchtower on Zegham Hill in North Gustaberg (S) and speak with ' .. ACTOR.GEBHARDT_WOTG.text .. '.',
        'Speak with ' .. ACTOR.RODERICH_WOTG.text .. ' at the Benedikt Watchtower.',
        'Examine ' .. ACTOR.NORTH_GUSTABERG_S_BARRICADE_E7.text .. ' in North Gustaberg (S).',
        'Return to ' .. ACTOR.ADELBRECHT_WOTG.text .. ' to receive the Large Memory Fragment.',
    },

    cw_bmk_better_part_of_valor = {
        'Leave Bastok Markets (S) for North Gustaberg (S) at (G-4) and obtain the Clump of Animal Hair.',
        'Deliver the Clump of Animal Hair to ' .. ACTOR.ENGELHART_WOTG.text .. ' at the Music Shop in Bastok Markets (S) (K-10). You don\'t need to be allied to Bastok.',
        "Travel to the waterfall in North Gustaberg (S) at (F-8), near the Survival Guide, and examine the ??? on its right side.",
        "Obtain a Gnole Claw: Auction House (Materials > Bonecraft), Gnoles in Vunkerl Inlet (S) (E-7) or Decrepit Gnoles in Jugner Forest (S) (H-11).",
        'Travel to Vunkerl Inlet (S), talk to ' .. ACTOR.LEADAVOX_WOTG.text .. ' at (J-6) first, then trade the Gnole Claw for the Xhifhut key item.',
        'Return to ' .. ACTOR.ENGELHART_WOTG.text .. ' in Bastok Markets (S).',
    },

    cw_bmk_fires_of_discontent = {
        'Speak with ' .. ACTOR.ENGELHART_WOTG.text .. ' in Bastok Markets (S).',
        'Speak with ' .. ACTOR.PAGDAKO_WOTG.text .. '.',
        "Travel to present-day Metalworks and speak with Iron Eater in the President's Office at (J-8), maybe more than once.",
        'Return to the past and speak with ' .. ACTOR.ENGELHART_WOTG.text .. ' again.',
        'Travel to Grauberg (S) and examine ' .. ACTOR.GRAUBERG_QQ_H6.text .. ' inside the cave; the entrance is on the border of (H/I-5/6) (the Survival Guide is fairly close).',
        'Return to Bastok Markets (S) and speak with ' .. ACTOR.ENGELHART_WOTG.text .. '.',
        'Travel to the Metalworks gate area and speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. '.',
        'Return to ' .. ACTOR.ENGELHART_WOTG.text .. ' to complete the quest.',
    },

    cw_bmk_hammering_hearts = {
        'Speak with ' .. ACTOR.SCARRED_SHARK_WOTG.text .. ' in Bastok Markets (S).',
        'Obtain a Heavy Quadav Chestplate and Heavy Quadav Backplate.',
        'Trade both armor pieces to ' .. ACTOR.SCARRED_SHARK_WOTG.text .. '.',
        'Change zones and speak with ' .. ACTOR.SCARRED_SHARK_WOTG.text .. ' again to receive the Trainee Hammer.',
    },

    cw_bmk_light_in_darkness = {
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Speak with ' .. ACTOR.PAGDAKO_WOTG.text .. '.',
        'Trade ' .. ACTOR.BLATHERIX_WOTG.text .. ' either 30 Goblin Chocolate (sold by Pawkrix in Lower Jeuno (H-10)) or 5,000 gil for the Mine Shaft Key.',
        "Enter Pashhow Marshlands (S) from Grauberg (S) for a cutscene (Grauberg (S) Survival Guide, or the Atmacite Refiner's warp).",
        'Examine ' .. ACTOR.PASHHOW_MARSHLANDS_S_CORRODED_DOOR_F5.text .. ' to enter the battlefield.',
        "Defeat 1 Sapphire Quadav and 10 Sapphirine Quadavs. Kill about six Sapphirines first, because killing the Sapphire Quadav scatters the rest.",
        'With a free inventory slot, speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' and answer: "...the ventilation shaft.", "...the senator did not light the lantern." and "...he was distracted."',
        'Receive the Adaman Ingot reward.',
    },

    cw_bmk_fire_in_the_hole = {
        'Enter Bastok Markets (S) from North Gustaberg (S) and obtain the Silvermine Key.',
        'Travel to North Gustaberg (S) and examine ' .. ACTOR.NORTH_GUSTABERG_S_STONEHOUSED_ADIT_E9.text .. ' at the top middle of (E-9) (Survival Guide or a Campaign Arbiter Allied Notes teleport).',
        'Examine ' .. ACTOR.NORTH_GUSTABERG_S_STONEHOUSED_ADIT_E9.text .. ' again to begin the battle.',
        "Protect Adelheid as she runs through the maze; groups of level 66-70 Quadavs (1,500-2,000 HP) attack her, and sometimes switch to her. You can cure and buff her (not with BLU spells). Hard solo without AoE sleep or damage; Valaineral's Trust helps.",
        'Defeat all Quadavs; the battle ends when Adelheid reaches the turret.',
        "If you fail, zone, wait a game day and get a new Silvermine Key from Solitary Ant in North Gustaberg (S) (J-9).",
        'Re-enter Bastok Markets (S) from North Gustaberg (S).',
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Receive the Republican Silver Medal reward.',
    },

    cw_bmk_quelling_the_storm = {
        'Wait one Vana\'diel day after Fire in the Hole, then enter Bastok Markets (S) from North Gustaberg (S) for a cutscene. You must have received the Elixir from Blatherix after Burden of Suspicion.',
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' at the Metalworks entrance in Bastok Markets (S).',
        'Visit Paul (H-5), Biggorf (H-10) and Wilhelmina (I-9) in Bastok Markets (S), in any order, then return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' for a cutscene.',
        'Speak with ' .. ACTOR.BLATHERIX_WOTG.text .. ' for a cutscene. If you don\'t get it, talk to Paul, Biggorf and Wilhelmina again until they mention the "Darksteel Hurricane".',
        'Trade ' .. ACTOR.BLATHERIX_WOTG.text .. ' a Goblin Mess Tin, a Goblin Mushpot and Twinkle Powder for another cutscene. Mess Tins drop from Goblin Skirmishers (few spawn points) and other goblins, or the Auction House (Other > Beast-made); Mushpots are sold by Pawkrix in Lower Jeuno (H-10); Twinkle Powder by Upih Khachla in Windurst Waters North (H-9), sometimes by Dabih Jajalioh in Ru\'Lude Gardens (F-9).',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. '.',
        'Travel to Vunkerl Inlet (S) and examine ' .. ACTOR.VUNKERL_INLET_S_QQ_F6.text .. ', just east of the bridge (Survival Guide or Atmacite Refiner).',
        'Speak with ' .. ACTOR.BLATHERIX_WOTG.text .. ' in Bastok Markets (S) to receive the Goblin Belt.',
    },

    cw_bmk_honor_under_fire = {
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Travel to Vunkerl Inlet (S) and examine ' .. ACTOR.VUNKERL_INLET_S_QQ_F6.text .. ', just east of the bridge.',
        'Examine ' .. ACTOR.VUNKERL_S_BEASTMAN_ENSIGN.text .. '.',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' and receive a Flare Grenade.',
        'Return to ' .. ACTOR.VUNKERL_S_BEASTMAN_ENSIGN.text .. ' and examine it again to enter the battlefield.',
        'Defeat Arch Ahriman and its temporary ally doppelgangers in Everbloom Hollow.',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' to receive the Elixir Tank reward.',
    },

    cw_bmk_beneath_the_mask = {
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Enter Beadeaux (S).',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Speak with ' .. ACTOR.RED_AXE_WOTG.text .. ' in The Eldieme Necropolis (S).',
        'Travel to Vunkerl Inlet (S) and trade Beeswax and Red Textile Dye to ' .. ACTOR.LEADAVOX_WOTG.text .. ' for the Wax Seal.',
        'Return to ' .. ACTOR.RED_AXE_WOTG.text .. ' in The Eldieme Necropolis (S).',
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Travel to Beaucedine Glacier (S) and examine ' .. ACTOR.BEAUCEDINE_GLACIER_S_HOARFANG_F10.text .. ' to complete the quest and receive the reward.',
    },

    cw_bmk_what_price_loyalty = {
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S) and receive the Sack of Victuals key item.',
        'Travel to the Benedikt Watchtower in North Gustaberg (S) (E-11) and speak with ' .. ACTOR.RODERICH_WOTG.text .. '; the Campaign Arbiter warp is close.',
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Travel to Xarcabard (S) and obtain the Commander\'s Endorsement key item.',
        'Examine ' .. ACTOR.XARCABARD_S_FORBIDDING_PORTAL_I7.text .. ', then examine it again to enter battle.',
        "Defeat the humanoid opponent (Trusts allowed). He uses sword weapon skills and double attacks, randomly resets one player's enmity, and around 50% uses Mighty Strikes and gains Temblor Blade (AoE petrify). Magic draws a lot of enmity. If you lose, ask Gentle Tiger for another Commander's endorsement.",
        'Return to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' to receive the Fourth Staff.',
    },

    cw_bmk_truth_lies_hid = {
        'Obtain an Elixir.',
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S).',
        'Enter Castle Zvahl Baileys (S).',
        'In Castle Zvahl Keep (S), locate Rikke at (G-7) northwest, Rakke at (G-10) southwest, and Rokke at (H-10) southeast.',
        'Speak with all three imps and determine which one is honest.',
        'Trade the Elixir to the correct imp. If you choose incorrectly, wait one Vana\'diel day before trying again.',
        'Examine ' .. ACTOR.CASTLE_ZVAHL_KEEP_S_QQ_G9.text .. ' on Map 3.',
        'Drop down, use the center teleporter, and examine ' .. ACTOR.CASTLE_ZVAHL_KEEP_S_DISPLACED_BLOCK.text .. ' to complete the quest and receive the reward.',
    },

    -- ========================================================
    -- SOUTHERN SAN D'ORIA (S)
    -- ========================================================
    cw_ssd_steamed_rams = {
        'Speak with ' .. ACTOR.MAINCHELITE_WOTG.text .. ' in Southern San d\'Oria (S) and turn in the Red Recommendation Letter.',
        "In East Ronfaure (S), examine three ??? in any order: the Charred Propeller in a dirt hole in the south-east corner of (H-8), the Oxidized Plate at the (I-8) waterfall where the river splits, and the Piece of Shattered Lumber in a bush by a tree in the north-west corner of (J-7).",
        'Return to ' .. ACTOR.MAINCHELITE_WOTG.text .. ' to join the Knights of the Ram (you get Sprinter\'s Shoes if this is your first allegiance quest). The quest changes your Campaign allegiance at no cost, and speaking to him before you finish lets you cancel it.',
    },

    cw_ssd_seeing_spots = {
        'Speak with ' .. ACTOR.WYATT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Obtain 4 Ladybug Wings.',
        'Trade the 4 Ladybug Wings to ' .. ACTOR.WYATT_WOTG.text .. ' to receive the reward.',
    },

    cw_ssd_gifts_of_griffon = {
        'Speak with ' .. ACTOR.LOUXIARD_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Leave the area and return to ' .. ACTOR.LOUXIARD_WOTG.text .. '.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. '.',
        'Trade a Plume d\'Or to each of Machionage (C-6), Louxiard (G-7), Illeuse (H-9), Rongelouts N Distaud (I-9), Sabiliont (I-11), Elnonde (K-9), and Loillie (K-9 via the stairs at L-8).',
        'Return to ' .. ACTOR.RHOLONT_WOTG.text .. '.',
    },

    cw_ssd_claws_of_griffon = {
        'Wait one Vana\'diel day after Gifts of the Griffon.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Leave the area and return, then speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' again.',
        'Travel to Jugner Forest (S) via East Ronfaure (S).',
        'Go to (I-6) and examine the ??? on a tree stump for a cutscene.',
        'Examine the ??? again to make Fingerfilcher Dradzad, an Orc warrior NM, appear, and defeat it. It is immune to sleep.',
        'Examine the ??? once more for a cutscene that completes the quest and gives your reward.',
    },

    cw_ssd_boy_and_the_beast = {
        'Speak with ' .. ACTOR.RAUSTIGNE_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Travel to Vunkerl Inlet (S) and examine ' .. ACTOR.VUNKERL_INLET_S_QQ_H6.text .. ' to obtain the Vunkerl Herb Memo.',
        'Determine the correct herb color from the current time: Red/Sandy 00:00-07:59, Blue/Bastok 08:00-15:59, Green/Windurst 16:00-23:59.',
        'Travel to Vunkerl Inlet (S), find ' .. ACTOR.VUNKERL_INLET_S_LEAFY_PATCH_F5.text .. ', and select the correct color.',
        'Obtain the Vunkerl Herb from the Leafy Patch.',
        'Return to the ' .. ACTOR.VUNKERL_INLET_S_QQ_H6.text .. ' to complete the quest.',
    },

    cw_ssd_wrath_of_griffon = {
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Travel to Jugner Forest (S) (H-10) and find ' .. ACTOR.JUGNER_FOREST_S_TOPPLED_CRESSET_H10.text .. ' at the foot of a watch platform. The Survival Guide is fastest; grab it and the Recall-Jugner key item if you don\'t have them, as other quests use them.',
        'Examine ' .. ACTOR.JUGNER_FOREST_S_TOPPLED_CRESSET_H10.text .. ' again to battle Cobraclaw Buchzvotch and defeat him.',
        'Examine ' .. ACTOR.JUGNER_FOREST_S_TOPPLED_CRESSET_H10.text .. ' once more after the battle.',
        'Return to ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S) to complete the quest and receive a Military Scrip, which Wyatt (L-6) exchanges for 20,147 gil.',
    },

    cw_ssd_beans_ahoy = {
        'Speak with ' .. ACTOR.THIERRIDE_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Obtain 2 Lufet Salts from River Crabs in West Ronfaure.',
        'Return to ' .. ACTOR.THIERRIDE_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Trade one Lufet Salt, then another, to complete the required sequence.',
        'Change zones and return to ' .. ACTOR.THIERRIDE_WOTG.text .. ' to receive the Angler\'s Cassoulet reward.',
    },

    cw_ssd_perils_of_griffon = {
        'Wait one Vana\'diel day after Wrath of the Griffon, then change zones and speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Leave the area and speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' again.',
        'Speak with ' .. ACTOR.DAIGRAFFEAUX_WOTG.text .. ' at (I-11) in Southern San d\'Oria (S), where the chocobo stables are in the present.',
        'Return to ' .. ACTOR.RHOLONT_WOTG.text .. '.',
        "Travel to Jugner Forest (S) and examine the ??? on the tree stump at (I-6), east of the river, to obtain the Orcish Warmachine Body key item. The East Ronfaure (S) Survival Guide is the shortest way.",
        'Return to ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S) to complete the quest.',
    },

    cw_ssd_songbirds_snowstorm = {
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Speak with ' .. ACTOR.DAIGRAFFEAUX_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Enter Beaucedine Glacier (S) and examine ' .. ACTOR.BEAUCEDINE_GLACIER_S_COLOSSAL_FOOTPRINT_I7.text .. ' behind the tower.',
        'Examine ' .. ACTOR.BEAUCEDINE_GLACIER_S_ROCKY_PERCH_G10.text .. ' at the lake at least three times to obtain the Goliath Worm items.',
        'Fish for Paladin Lobster at (G-10), Scutum Crab at (J-7), and Lance Fish at (H-9).',
        'Return to ' .. ACTOR.BEAUCEDINE_GLACIER_S_COLOSSAL_FOOTPRINT_I7.text .. ' and submit the required key items.',
        'Trade a Flint Stone to ' .. ACTOR.BEAUCEDINE_GLACIER_S_CHARRED_FIREWOOD.text .. ' two levels above and north of the (I-7) tower.',
        'Examine ' .. ACTOR.BEAUCEDINE_GLACIER_S_COMPRESSED_SNOW_H10.text .. ' near the tower, then examine it again to face Orcish Bloodletter.',
        'Defeat Orcish Bloodletter and examine ' .. ACTOR.BEAUCEDINE_GLACIER_S_COMPRESSED_SNOW_H10.text .. ' a third time to complete the quest.',
    },

    cw_ssd_chasing_shadows = {
        'Speak with Rongelouts N Distaud in Southern San d\'Oria (S) at (I-9).',
        'Enter Xarcabard (S) from Beaucedine Glacier (S).',
        'Examine ' .. ACTOR.XARCABARD_S_BACKFILLED_PIT_F8.text .. '.',
        'Examine ' .. ACTOR.XARCABARD_S_COMPACT_FOOTPRINT_H8.text .. '.',
        'Examine ' .. ACTOR.XARCABARD_S_SUNKEN_FOOTPRINT_H6_H7.text .. ' up the northwest ramp.',
        'Examine ' .. ACTOR.XARCABARD_S_COMPACT_FOOTPRINT_H8.text .. ' again.',
        'Enter Batallia Downs (S) from Beaucedine Glacier (S).',
        'Examine ' .. ACTOR.BATALLIA_DOWNS_S_FRESH_SNOWMELT_H5.text .. '.',
        'Examine ' .. ACTOR.BATALLIA_DOWNS_S_FRESH_SNOWMELT_H5.text .. ' again to face NM Menechme and defeat it with Excenmille within 30 minutes.',
        'Examine ' .. ACTOR.BATALLIA_DOWNS_S_FRESH_SNOWMELT_H5.text .. ' one final time to complete the quest and receive the reward.',
    },

    cw_ssd_homecoming_queen = {
        'Enter Southern San d\'Oria from East Ronfaure.',
        'Complete Her Memories: Old Bean, Her Memories: The Faux Pas, and Her Memories: Grave Resolve.',
        'The three Tiny Memory Fragments combine into the Large Memory Fragment and complete the quest.',
    },

    cw_ssd_carnelian_footfalls = {
        'Enter Southern San d\'Oria (S) from East Ronfaure (S).',
        'Speak with ' .. ACTOR.MAINCHELITE_WOTG.text .. ' to begin the quest.',
        "Zone into East Ronfaure (S) from Southern San d'Oria (S) on foot for a cutscene.",
        "Examine the three ??? from Steamed Rams: (H-8) in a dirt hole just north-east of the fort, (I-8) at the base of the waterfall (north-west corner), and (J-7) just south of a tree (north-west corner).",
        'Return to ' .. ACTOR.MAINCHELITE_WOTG.text .. ' to receive the Large Memory Fragment.',
    },

    cw_ssd_malign_maladies = {
        'Speak with ' .. ACTOR.AMAURA_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Speak with ' .. ACTOR.MONBERAUX.text .. ' in Upper Jeuno (G-10).',
        "Examine the Library Book on the east wall of the Optistery in Windurst Waters North (G-7).",
        'Obtain a Philosopher\'s Stone.',
        'Trade the Philosopher\'s Stone to ' .. ACTOR.BOSHEAN_WOTG_FEY_BLOSSOMS_F5.text .. ' at Witchfire Glen in Grauberg (S). With the Lightsworm, a blue ??? by any Cavernous Maw (the Batallia Downs Survival Guide is next to one) and the centre Conflux in the Walk of Echoes take you there; otherwise use the Grauberg (S) Survival Guide or Campaign warp and run north-west.',
        'Wait one Vana\'diel day and change zones.',
        'Examine ' .. ACTOR.BOSHEAN_WOTG_FEY_BLOSSOMS_F5.text .. ' again to receive the key item.',
        'Speak with ' .. ACTOR.RAUSTIGNE_WOTG.text .. ' in Southern San d\'Oria (S) (I-7) to receive the Large Memory Fragment.',
    },

    -- ========================================================
    -- GARLAIGE CITADEL (S)
    -- ========================================================
    cw_gar_flipside_of_things = {
        "Speak with Rarcasmeult in Garlaige Citadel (S): map 2 (J-6), in the uncharted top-right area around (H-6)/(I-6).",
        "Go back through the door and south past Loutille and Duchille, through the Heavy Iron Gate (Slimes and Bats aggro, so bring Sneak or Silent Oil), then south and west towards the square section and the Storeroom Door at (G-7).",
        'Examine the ??? on the table to obtain the Firepower Case.',
        'Return to Rarcasmeult to receive the reward.',
    },

    cw_gar_fumbling_friar = {
        'Speak with Fondactiont in Garlaige Citadel (S) at (I-6).',
        'Travel to Grauberg (S).',
        'Examine the ??? in the waterfall area at (G-6) to obtain the Ornate Package.',
        'Return to Fondactiont to receive the Scroll of Recall-Pashh.',
    },

    cw_gar_haze_of_glory = {
        'Speak with Diordinne at (I-6) in Garlaige Citadel (S) Map 1 and receive the Number Eight Shelter Key.',
        'Travel east to Map 2 and examine ' .. ACTOR.GHOYUS_REVERIE_WOODEN_CRATES_H9.text .. ' to enter Ghoyu\'s Reverie; the party leader must perform this examination.',
        'Locate and defeat Orcish Turret at approximately (H-10) on Map 15 within 30 minutes.',
        'Manage the Goblin Effluvial Grenade attacks and poison effects during the battle.',
        "The Effluvial Flasks (about 150 HP) and the other Orcs and Goblins (about 1,500 HP) don't need to be killed. If you fail, speak with Diordinne again and wait a game day for a new key.",
        'Return to Southern San d\'Oria (S) between 18:00 and 00:00.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' to complete the quest and receive the Fullmetal Bullet.',
    },

    -- ========================================================
    -- JUGNER FOREST (S)
    -- ========================================================
    cw_jug_price_of_valor = {
        'Wait one Vana\'diel day after In a Haze of Glory, then change zones.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S).',
        'Obtain Ronfaure Maple Syrup by logging in East Ronfaure (S) (buy several Hatchets; the next quest also needs logging), Long-life Biscuits from the Tree Hollow right behind ' .. ACTOR.RHOLONT_WOTG.text .. ', and a Flask of Kingdom Water from the Well east of ' .. ACTOR.RHOLONT_WOTG.text .. '.',
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' again to receive Biscuit a la Rholont.',
        'Examine ' .. ACTOR.JUGNER_FOREST_S_FELLED_TREES_G7.text .. ' in western (G-7) (Recall-Jugner, or north then north-west from the Survival Guide).',
        "In Vunkerl Inlet (S) (the Campaign warp is closer than the Survival Guide), examine the Toppled Cresset at (I-8), then the one at (F-9)/(F-8).",
        'Examine ' .. ACTOR.VUNKERL_INLET_S_UNDERBRUSH_F13.text .. ', then examine it again to face Madthrasher Zradbodd.',
        "Madthrasher Zradbodd is an Orc BLM with lots of Fast Cast: tier IV and -ga III spells, Sleepga and Dispelga (a BLU to stun helps below i119). Afterwards examine the Underbrush again for the message sending you to Pashhow Marshlands (S); if you zone without it, you must fight him again.",
        'Examine ' .. ACTOR.PASHHOW_MARSHLANDS_S_SHIMMERING_PONDWEED_G6.text .. ' in the north-west corner of (G-6) in Pashhow Marshlands (S) to complete the quest and receive the reward.',
    },

    -- ========================================================
    -- PASHHOW MARSHLANDS (S)
    -- ========================================================
    cw_pas_bonds_never_die = {
        'Speak with ' .. ACTOR.RHOLONT_WOTG.text .. ' in Southern San d\'Oria (S) (more than once if needed) to receive the Letter to Count Aurchiat. Buy Hatchets from Geltpix (M-6) now; you\'ll need them.',
        'Travel to Pashhow Marshlands (S) and examine ' .. ACTOR.PASHHOW_MARSHLANDS_S_SHIMMERING_PONDWEED_G6.text .. ' for a cutscene that flags the quest. The Campaign teleport is fastest, or the Rolanberry Fields (S) Survival Guide, right at the zone line.',
        "In Jugner Forest (S), examine the Overgrown Mushrooms on the path at (F-10) for a cutscene (Recall-Jugner or the Survival Guide is closest). Have a free inventory slot, or you have to watch it again.",
        "Use Hatchets on Logging Points around (F-7), (F-10), (J-6) and (J/K-10/11) until you get the key item Length of Jugner Ivy (likely but not certain; with a full inventory the game has to give you the key item). Return to the Overgrown Mushrooms for another cutscene.",
        "Examine the Mossy Stump in the lower right of (F-7) for a cutscene, then again to enter a battlefield against a Young Behemoth.",
        'Report to Rongelouts N Distaud in Southern San d\'Oria (S) (I-9) to receive the Behemoth Horn reward. For the missions, then zone into Southern San d\'Oria (S) from East Ronfaure (S) to complete Crossroads of Time.',
    },

    -- ========================================================
    -- XARCABARD (S)
    -- ========================================================
    cw_xar_blood_of_heroes = {
        'Examine ' .. ACTOR.XARCABARD_S_ANIMAL_SPOOR_J9.text .. ' in Xarcabard (S) and register the Home Point at (H-9).',
        'Examine ' .. ACTOR.XARCABARD_S_WHEEL_RUT_I9.text .. ' in the dead-end tunnel to the south.',
        'Examine ' .. ACTOR.XARCABARD_S_ANIMAL_SPOOR_J9.text .. ' again to obtain the Vial of Military Prism Powder key item.',
        'Examine ' .. ACTOR.XARCABARD_S_FORBIDDING_PORTAL_I7.text .. ' to enter the battlefield.',
        "Defeat 2 Bloodwing Deathrainers (BLM), 4 Bloodwing Maimers (WAR), the bugard Gherrmoga and Kingslayer Doggvdegg (PLD). Excenmille assists, but if he dies you lose, so don't let him run in alone. Killing Doggvdegg ends the fight (he may use Invincible). If you lose, wait a game day for another Vial from the Animal Spoor.",
        'Examine ' .. ACTOR.XARCABARD_S_WHEEL_RUT_I9.text .. ' again to complete the quest and receive the Ram Staff.',
    },

    -- ========================================================
    -- CASTLE ZVAHL BAILEYS (S)
    -- ========================================================
    cw_zvb_bonds_of_mythril = {
        'Enter Castle Zvahl Baileys (S) from Castle Zvahl Keep (S).',
        'Examine ' .. ACTOR.CASTLE_ZVAHL_BAILEYS_S_QQ_G9.text .. ' on Map 3.',
        "Defeat all four imps in the central room on Map 3, after the cutscene (any killed before it have to respawn and die again).",
        'Examine ' .. ACTOR.CASTLE_ZVAHL_BAILEYS_S_QQ_G9.text .. ' again to face Gargouille Warden (resists magic, stuns with its melee); defeat it and examine the ??? again to obtain the Zvahl Passkey.',
        'Enter Throne Room (S) and examine the Throne Room door.',
        "Examine the Throne Room door again to enter battle. The humanoid opponent uses sword weapon skills plus Temblor Blade (AoE petrify) and Darkling Blade (knockback and curse); Zeid assists, and if he falls you lose.",
        "Defeat Marquis Amon, a scythe-wielding BLM demon with tier III -ga spells. His weapon skill draws everyone in, removes shadows and inflicts Doom; wear the Sanctus Rosary to block it, or stun it.",
        'Speak with ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' in Bastok Markets (S) to complete the quest and receive the Excelsis Ring.',
        'Bring the Bundle of half-inscribed scrolls to ' .. ACTOR.GENTLE_TIGER_WOTG.text .. ' to obtain Trust: Klara.',
    },

    -- ========================================================
    -- PORT SAN D'ORIA
    -- ========================================================
    cw_psd_old_bean = {
        'Speak with ' .. ACTOR.THIERRIDE_WOTG.text .. ' in the Rusty Anchor Pub in Port San d\'Oria (G-7) for Thierride\'s bean creation.',
        'Speak with ' .. ACTOR.AMAURA_WOTG.text .. ' in Southern San d\'Oria (G-6) and give her the dish to try (she may give other cutscenes first; one of them starts Her Memories: Of Malign Maladies).',
        'Return to ' .. ACTOR.THIERRIDE_WOTG.text .. ' to receive the Tiny Memory Fragment.',
    },

    -- ========================================================
    -- NORTHERN SAN D'ORIA
    -- ========================================================
    cw_nsd_faux_pas = {
        'Speak with Abioleget in the Cathedral in Northern San d\'Oria at (M-7).',
        'Speak with ' .. ACTOR.BERTENONT_WOTG.text .. ' in Northern San d\'Oria.',
        'Receive the Tiny Memory Fragment.',
    },

    -- ========================================================
    -- SAUROMUGUE CHAMPAIGN (S)
    -- ========================================================
    cw_sau_operation_cupid = {
        'Enter Batallia Downs (S) from Jugner Forest (S).',
        "Examine the Bulwark Gate in Sauromugue Champaign (S) at (E-6); the Atmacite Refiner's Voidwatch warp or the Campaign Arbiter warp is closest.",
        "Obtain Rice Vinegar, Ground Wasabi and Holy Basil; Amalasanda in the Tenshodo in Lower Jeuno (J-8) sells all three.",
        'Travel to Vunkerl Inlet (S) and trade all three ingredients to ' .. ACTOR.LEADAVOX_WOTG.text .. ' at (J-6) to receive the Pot of Martial Relish.',
        'Examine the Bulwark Gate in Sauromugue Champaign (S) at (E-6) again.',
        'Enter Batallia Downs (S) from Rolanberry Fields (S) to receive the Large Memory Fragment.',
    },
    cw_wwt_healing_herbs = { -- Local patch: Crystal War quests
        "Examine the left Rhinostery door in Windurst Waters (S) (J-8), Map 2, for a cutscene with Dantie-Corantie and Maju-Naju.",
        "Approach the Rhinostery door in present-day Windurst Waters for a cutscene and the key item The Healing Herb, then check the past door again.",
        "Touch the ??? near the center of Grauberg (S) (H-13) for the key item Fireblossom, then check the Rhinostery door in Windurst Waters (S).",
        "Check the door on each of the next two game days; the second time gives the Tincture. Then check the present-day door for a last cutscene.",
    },

    cw_fkn_a_manifest_problem = { -- Local patch: Crystal War quests
        "Speak with Rotih Moalghett in Fort Karugo-Narugo (S) (I-8), Map 2, then zone into Castle Oztroja (S) for a cutscene.",
        "Return to Rotih Moalghett for the key item Fort Key (he gives another if you lose).",
        "Examine the Colorful Door (H-5), Map 2, to fight waves of Yagudo. Buffs are removed on entry; Trusts are allowed. The Yagudo have little HP, so area attacks work well.",
        "You land in West Sarutabaruta (S); zone into Windurst Waters (S) for the last cutscene and your reward.",
    },

    cw_ssd_beast_from_the_east = { -- Local patch: Crystal War quests
        "Speak with Nichais in Southern San d'Oria (S) (L-7) and choose Immensely, yes.",
        "Check the Timeworn Altar in Grauberg (S) (F-11) for a long cutscene, then return to Nichais.",
        "Trade Nichais a Shell Bug from a Brass Quadav in present-day Vana'diel, then return to the altar for the last cutscene and two random gems.",
    },

    cw_rol_the_swarm = { -- Local patch: Crystal War quests
        "This only appears when you use a Pest Repellent from a seasonal event. The party leader uses it, then checks Fortilace in Rolanberry Fields (S) (D-9). You need at least three in the party.",
        "After a minute to buff, you have 5 minutes against an endless swarm. The Swarmspawn ignore attacks and wander, so area spells centered on you work best.",
        "Everyone gets the title Swarminator; your score doesn't change the result. Repeatable with another Pest Repellent.",
    },

    cw_wwt_when_one_man_is_not_enough = { -- Local patch: Crystal War quests
        "Bring a Blackened Siredon, Forest Carp, Greedie or Pipira (the Auction House is easiest). Speak with Dhea Prandoleh in Windurst Waters (S) (H-10).",
        "Examine the Sealed Entrance of the tower in West Sarutabaruta (S) (F-11), then speak with Dhea Prandoleh again.",
        "Trade a fish to the Sealed Entrance. A Blackened Siredon or three fish gives a longer cutscene; either way the quest completes and you get 12 Red Roses.",
    },

    cw_wwt_a_feast_for_gnats = { -- Local patch: Crystal War quests
        "Zone into Windurst Waters (S) for a cutscene, then speak with Mham Lahrih upstairs in the fort at Sauromugue Champaign (S) (K-9), next to the Cavernous Maw.",
        "Click the Abandoned Mineshaft at the foot of the stairs for the key item Signal firecracker, then again to enter the battle (up to six; the leader needs the firecracker).",
        "Destroy the Confederate Belfry (about 14,000 HP) while Quadav and later Gigas attack. Romaa Mihgo must survive; you can cure her but not buff her. Trusts are allowed. If you fail, Mham Lahrih gives a new firecracker the next game day.",
        "Speak with Dhea Prandoleh in Windurst Waters (S) to complete the quest.",
    },

    cw_wwt_the_long_march_north = { -- Local patch: Crystal War quests
        "Zone into Windurst Waters (S) for a cutscene. In Southern San d'Oria (S) speak with Raustigne (I-7), then Hauberliond (H-9).",
        "Depending on your answers, examine the New-turned Earth in East Ronfaure (S) (J-11), La Vaule (S) (K-9) or Jugner Forest (S) (J-5) for the key item Darkfire cinder.",
        "Speak with Striking Snake in the present-day Metalworks (H-7), then mine in North Gustaberg (S) with several Pickaxes until you have the key items Liquid quicksilver and Gelid sulfur.",
        "Bring them to Striking Snake, zone and wait a game day, then speak with him for the key item Beastbane bullets.",
        "Speak with Rotih Moalghett in Fort Karugo-Narugo (S) (I-8), Map 2. Summon Trusts first, then examine the Warding Door (E/F-7): the fight starts at once against Count Furfur, two Count Murmurs and two Tartalos (30 minutes).",
        "Examine the Warding Door again for the last cutscene and the Stellar Earring.",
    },

    cw_wwt_the_forbidden_path = { -- Local patch: Crystal War quests
        "Zone into Windurst Waters (S) for a cutscene, then collect three key items in any order.",
        "Irradiant strand: examine the Gate of Darkness in Inner Horutoto Ruins (I-7), Map 4.",
        "Scintillant strand: check the Fey Blossoms in Grauberg (S) (F-5), then trade them a Bottled Pixie between 18:00 and 6:00. Yagudo High Priests in Meriphataud Mountains (S) always drop it.",
        "Refulgent strand: examine the Writhing Flame in Castle Oztroja (S) (G-7), ground floor north hall, then trade it any job's Testimony. This can't be done as Geomancer or Rune Fencer.",
        "Speak with Velda-Galda in Windurst Waters (S) (K-9) three times, wait one game day, then speak with him again for your reward.",
    },

    cw_bmk_a_jewelers_lament = { -- Local patch: Crystal War quests
        "Speak with Wahid in Bastok Markets (S) (J-9), then trade him a Sunstone, an Aquamarine and a Jadeite. He gives them back.",
        "Zone, speak with him again, then exit to North Gustaberg (S) for a cutscene about a scream near Palborough Mines.",
        "Examine the ??? by a small tree in North Gustaberg (S) (J-4) twice for the key item Unadorned ring.",
        "Speak with Wahid, zone, and speak with him again for the Trainee Burin.",
    },

    cw_wwt_sins_of_the_mothers = { -- Local patch: Crystal War quests
        "Speak with Dhea Prandoleh (H-10), then Velda-Galda (K-9) in Windurst Waters (S).",
        "In Fort Karugo-Narugo (S), check the Stone monument (E-7), Map 1, take a Succulent dragon fruit from the Succulent Cactus (F-5), then check the monument again.",
        "Examine the Sunken Hollow (G-7) twice to enter the battle. Escort Nhev Befrathi and her slow daughter Syu to the exit at (G-9) on Map 2; clear monsters ahead, since the girl flees from them and from being too far from her mother.",
        "If you fail, get a new fruit the next game day. On success you appear in West Sarutabaruta (S); zone into Windurst Waters (S) for the reward.",
    },

    cw_wwt_howl_from_the_heavens = { -- Local patch: Crystal War quests
        "A game day after Sins of the Mothers, zone into Windurst Waters (S) from West Sarutabaruta (S) for a cutscene.",
        "Get the key items from the Magicite in present-day Davoi (Wall of Dark Arts, G-7), Beadeaux (Qulun Dome) and Castle Oztroja, as you did in the Zilart missions.",
        "Speak with Velda-Galda in Windurst Waters (S) (K-9), zone into West Sarutabaruta (S) for a cutscene, then examine the Windurstian Bulwark (J-8) for another.",
        "Buff, then examine the Bulwark again: the fight starts right away on the field (up to 18, 30 minutes). Four waves attack the barriers; keep Romaa Mihgo and at least one Protective Ward alive (wards can only be healed with Curing Waltz).",
        "Before zoning, examine the Bulwark again for a long cutscene, then zone into Windurst Waters (S) for your reward.",
    },

    cw_gra_succor_to_the_sidhe = { -- Local patch: Crystal War quests
        "Trade Callisto in Grauberg (S) (F-6) one of the job weapons: Fay Crozier, Fay Staff, Fay Lance, Fay Gendawa, Fane Baselard, Fane Hexagun, Dweomer Knife, Dweomer Scythe, Dweomer Maul, Oberon's Rapier, Oberon's Knuckles, Oberon's Sainti, Erlking's Blade, Sword, Tabar or Kheten, Rindomaru, Tsukumo, Ogre Jambiya or Ogre Sickle.",
        "Find a Watchful Pixie and start its battle: West Sarutabaruta (S) (F-10), East Ronfaure (S) (J-7), North Gustaberg (S) (H-6), Grauberg (S) (J-11), Batallia Downs (S) (F-7), Meriphataud Mountains (S) (I-6), Beaucedine Glacier (S) (H-10), Xarcabard (S) (J-8) or Vunkerl Inlet (S).",
        "Defeat the NMs, then speak with the Jubilant Pixie that appears. It offers your weapon with random augments; you can refuse up to five times for new ones. Repeatable.",
    },

    cw_wwt_the_young_and_the_threadless = { -- Local patch: Crystal War quests
        "Speak with Ponono in Windurst Waters (S) (K-11), North map, for the key item Ponono's charm, then zone and speak with her again for three threads.",
        "Dip each thread: Delicate wool thread at the Knightwell, West Ronfaure (H-11); Delicate linen thread at the Fay Spring waterfall, Grauberg (S) (F-6); Delicate cotton thread at Lake Tepokalipuka, East Sarutabaruta (F-9).",
        "Return to Ponono for the Trainee Scissors. Present-day Ponono in the Windurst Woods Weavers' Guild (G-12) has an extra cutscene.",
    },

    cw_ssd_son_and_father = { -- Local patch: Crystal War quests
        "Speak with Exoroche in Southern San d'Oria (S) (K-9), then Landeric in Jugner Forest (S) (G-5).",
        "Speak with Exoroche for a Bronze Sword, trade it to him, then trade it to Landeric. Answer: Ask about Exoroche, Not in the slightest!, The boy's spirit is true, Protect his family and kingdom.",
        "Speak with Exoroche for the Trainee's Spectacles. Wearing them while talking to present-day Exoroche (K-7) shows an extra scene.",
    },

    cw_wwt_manifest_destiny = { -- Local patch: Crystal War quests
        "Speak with Dhea Prandoleh in Windurst Waters (S) (H-10), examine the Mithran Bivouac in Meriphataud Mountains (S) (I-8), then enter Castle Oztroja (S) for cutscenes.",
        "Farm three Dorter Keys from Yagudo Eradicators, Knights Templar, Prioresses and Prelates in Meriphataud Mountains (S) and Castle Oztroja (S).",
        "On the castle's second-floor outdoor areas (E-7 and G-9), examine the Iron Grilles until one says someone is inside, then trade it a key. A key traded to an empty cell is lost. Three rescues give the key item Poet god's key.",
        "Climb to the top and examine the Collapsing Floor twice to fight Tzee Xicu the Manifest and two Air Elementals. Losing means a new key from the Bivouac.",
    },

    cw_mms_at_journeys_end = { -- Local patch: Crystal War quests
        "Examine the Mithran Bivouac in Meriphataud Mountains (S) (I-8) for another Poet god's key.",
        "Examine the Collapsing Floor at the top of Castle Oztroja (S) for a cutscene, then again to fight Fenrir, who shifts between Karaha-Baruha and Robel-Akbel. Keep Lehko Habhoka alive.",
        "Return to the Mithran Bivouac, then speak with Dhea Prandoleh in Windurst Waters (S) (H-10).",
        "Examine the Sealed Entrance in West Sarutabaruta (S) (F-10), then return to Windurst Waters (S) to complete the quest. Romaa Mihgo (G-11) can then teach the Romaa Mihgo Trust if you have the Bundle of half-inscribed scrolls.",
    },

    cw_wwt_her_memories_verdure_footfalls = { -- Local patch: Crystal War quests
        "Zone into Windurst Waters (S) from West Sarutabaruta (S), then speak with Miah Riyuh (H-9), North map. Do it in the nation you were in when Her Memories started.",
        "In West Sarutabaruta (S), examine the tower Sealed Entrances at (F-4), (F-11) and (J-8).",
        "Speak with Miah Riyuh again for the key item Large memory fragment.",
    },

    cw_woe_champion_of_the_dawn = { -- Local patch: Crystal War quests
        "Enter the Walk of Echoes from anywhere for a cutscene that starts the quest.",
        "Find the latent energy spots: Beaucedine Glacier (S) at the border of (G-9) and (H-9) below the campaign warp, East Ronfaure (S) in the northwest of (H-7) by a riverside tree, and Jugner Forest (S) at the southeast of Lake Mechieume (H-6/I-6). Each gives a Breath of dawn; you need all three.",
        "Enter the Walk of Echoes through the Veridical Conflux in Grauberg (S) (F-5) or Pashhow Marshlands (S) (J-9), or with a Lightsworm at a Cavernous Maw. Check the Ornate Door three times: two cutscenes, then the fight.",
        "Cait Sith uses -ja spells and Mewing Lullaby; up to six, Trusts allowed. Choose Pact with Cait Sith, Nesanica Torque, Belt or Ring, or 10,000 gil.",
        "If you lose, check the Regal Pawprint outside the door, revisit one energy spot and try again. Don't leave before doing A Forbidden Reunion if you're on Rhapsodies of Vana'diel.",
    },

    cw_woe_the_dawn_also_rises = { -- Local patch: Crystal War quests
        "To fight Cait Sith again, wait for JST midnight after your last win, then check the Ornate Door in the Walk of Echoes for a cutscene.",
        "Find the latent energy spots: Beaucedine Glacier (S) at the border of (G-9) and (H-9) below the campaign warp, East Ronfaure (S) in the northwest of (H-7) by a riverside tree, and Jugner Forest (S) at the southeast of Lake Mechieume (H-6/I-6). You need only one Breath of dawn this time.",
        "Enter the Walk of Echoes through the Veridical Conflux in Grauberg (S) (F-5) or Pashhow Marshlands (S) (J-9), or with a Lightsworm at a Cavernous Maw. Check the Ornate Door for a cutscene, then again to fight.",
        "Cait Sith uses -ja spells and Mewing Lullaby; up to six, Trusts allowed. Choose Pact with Cait Sith, Nesanica Torque, Belt or Ring, or 10,000 gil.",
    },

    cw_woe_a_forbidden_reunion = { -- Local patch: Crystal War quests
        "After Champion of the Dawn, and with Trusts unlocked, leave through a Veridical Conflux and re-enter the Walk of Echoes for a cutscene.",
        "Check the Ornate Door for a cutscene and the key item Butterfly-shaped key, then again to enter the battle (zone out and back in if it refuses).",
        "Fight Gloomscale and Gloomtalon alongside Lilisette; if she falls you lose. Both use Doom, so bring Holy Water. Trusts are allowed.",
        "Winning gives Atomos and Cipher: Lilisette. If you get the Somber Dreams cutscene instead, zone out and back in through the Veridical Conflux.",
    },
    cw_psh_guardian_of_the_void = { -- Local patch: Crystal War quests
        "First finish all three city Voidwatch climbs: get the Indigo, Crimson and Jade stratum abyssites from the Voidwatch Officers in Bastok, San d'Oria and Windurst, upgrading each at an Atmacite Refiner after every tier.",
        "Bastok: Sallow Seymour and Ushumgal (North Gustaberg and [S]), Lorbulcrud (Gusgen Mines), Murk-veined Baneberry and Melancholic Moira (Pashhow Marshlands and [S]), then Celaeno in Dangruf Wadi for the title Celaeno Silencer.",
        "San d'Oria: Sarimanok and Cottus (East Ronfaure and [S]), Krabimanjaro (Ordelle's Caves), Belphoebe and Kholomodumo (Jugner Forest and [S]), then Hahava in King Ranperre's Tomb for Hahava Condemner.",
        "Windurst: Virvatuli and Pancimanci (West Sarutabaruta and [S]), Ogbunabali (Maze of Shakhrami), Lord Asag and Akupara (Meriphataud Mountains and [S]), then Voidwrought in Outer Horutoto Ruins for Voidwrought Deconstructor.",
        "Reach the Wings of the Goddess mission Cait Sith, then examine the Veridical Conflux near the Home Point in Xarcabard (S) for a cutscene and the key item Kupofried's medallion. Don't skip this.",
        "Examine the Veridical Conflux by the gate crystal in Pashhow Marshlands (S) (J-9), then speak with a Voidwatch Officer in San d'Oria, Bastok or Windurst (past or present; not Jeuno) for the Voidwatch alarum.",
    },

    cw_rlg_drafted_by_the_duchy = { -- Local patch: Crystal War quests
        "Go to the Audience Chamber in Ru'Lude Gardens (H-6), or the Jeuno Bulwark Gate in Sauromugue Champaign (S), for a cutscene. You get the key items Voidwatcher's emblem: Jeuno and White stratum abyssite, and the next quest starts.",
    },

    cw_rlg_battle_on_a_new_front = { -- Local patch: Crystal War quests
        "Tier I, at the planar rifts (G-8), (I-9), (J-10) or the like: Cherufe in Batallia Downs, Taweret in Batallia Downs (S), Yatagarasu in Rolanberry Fields and Agathos in Rolanberry Fields (S) at (E-10), (F-8), (G-7), Goji in Sauromugue Champaign and Gugalanna in Sauromugue Champaign (S) at (G-6), (I-6), (K-10).",
        "Have an Atmacite Refiner upgrade your abyssite to White stratum abyssite II. You don't need to visit a refiner after each fight, only once the tier is done.",
        "Tier II: Gasha and Giltine in The Eldieme Necropolis and [S], Map 2 (J-6), (J-10), (L-9); Mellonia and Nympha or Kalos Eunomia in Crawlers' Nest and [S], Map 2 (F-6), (F-8), (I-7); Roly-Poly and Laidly Laurence in Garlaige Citadel and [S], Map 1 (G-9), (H-7) or Map 2 (G-8).",
        "Speak with any city Voidwatch Officer (past or present) for the Voidwatch alarum, then go to the Audience Chamber for a cutscene and the next abyssite and emblem.",
        "Also check the Bulwark Gate in Sauromugue Champaign (S) (F-6) now for 30,000 gil. It's needed before A World in Flux.",
    },

    cw_rlg_vw_op_126_qufim_incursion = { -- Local patch: Crystal War quests
        "With White stratum abyssite III, defeat the Tier III Voidwalkers: Kaggen in Qufim Island (G-6), (H-6), (I-7); Akvan in Lower Delkfutt's Tower, Basement (G-9), Floor 2 (F-5/6) or Floor 3 (I-6); Pil in Behemoth's Dominion (E-7), (H-8), (J-10).",
        "Speak with a present-day Voidwatch Officer for the Voidwatch alarum. If no officer gives the alarum, first get the 30,000 gil cutscene at the Bulwark Gate in Sauromugue Champaign (S) (F-6).",
        "Go to the Audience Chamber in Ru'Lude Gardens (H-6) for a cutscene and 50,000 gil.",
    },

    cw_psh_a_cait_calls = { -- Local patch: Crystal War quests
        "Click the Veridical Conflux by the gate crystal in Pashhow Marshlands (S) (J-9) for a cutscene. It completes this quest and starts the next.",
    },

    cw_rlg_the_truth_is_out_there = { -- Local patch: Crystal War quests
        "Speak with any present-day Voidwatch Officer for the key item Voidwatch alarum. That completes this quest and starts the next.",
    },

    cw_rlg_re_drafted_by_the_duchy = { -- Local patch: Crystal War quests
        "Go to the Audience Chamber in Ru'Lude Gardens (H-6) for a cutscene and the key items White stratum abyssite IV and Tricolor Voidwatcher's emblem. The next quest starts.",
    },

    cw_rlg_a_new_menace = { -- Local patch: Crystal War quests
        "Tier IV: Lancing Lamorak in West Ronfaure (H-6), (H-8), (H-10); Bhishani in South Gustaberg (J-10), (K-7), (L-9); Rw Nw Prt M Hrw in East Sarutabaruta (G-11), (H-6), (J-5).",
        "Have an Atmacite Refiner upgrade your abyssite to White stratum abyssite V. You don't need to visit a refiner after each fight, only once the tier is done.",
        "Tier V: Stachysaurus in La Theine Plateau (E-5), (I-11), (L-8); Gwynn Ap Nudd in Konschtat Highlands (G-4), (I-11), (J-8); Smierc in Tahrongi Canyon (I-9), (I-12), (J-6).",
        "Speak with a present-day Voidwatch Officer for the Voidwatch alarum, then go to the Audience Chamber for a cutscene and 50,000 gil. This also starts VW Op. 115 and VW Op. 118 in Jeuno.",
    },

    cw_sau_no_rest_for_the_weary = { -- Local patch: Crystal War quests
        "Speak with a Voidwatch Officer in a past (Shadowreign) area for the Voidwatch alarum. If you never got the 30,000 gil cutscene at the Bulwark Gate, do that first, then zone and wait a game day.",
        "Go to the Bulwark Gate in Sauromugue Champaign (S) (F-6) for a cutscene and the key items White stratum abyssite VI and Starlight Voidwatcher's emblem.",
    },

    cw_sau_a_world_in_flux = { -- Local patch: Crystal War quests
        "Tier VI: Gaunab in Vunkerl Inlet (S) (F-5), (G-8), (G-13); Ocythoe in Grauberg (S) (D-14), (G-7), (G-11); Kalasutrax in Fort Karugo-Narugo (S) (D-12), (I-11), (K-8).",
        "Speak with a past-era Voidwatch Officer for the Voidwatch alarum, then go to the Bulwark Gate in Sauromugue Champaign (S) (F-6) for a cutscene and 30,000 gil.",
    },

    cw_psh_between_a_rock_and_rift = { -- Local patch: Crystal War quests
        "Examine the Veridical Conflux in Pashhow Marshlands (S) (J-9) and choose to warp to the Walk of Echoes for a cutscene. It completes this quest and starts the next.",
    },

    cw_rlg_a_farewell_to_felines = { -- Local patch: Crystal War quests
        "After the next Vana'diel midnight, speak with any Voidwatch Officer for the Voidwatch alarum.",
    },

    cw_rlg_third_tour_of_duchy = { -- Local patch: Crystal War quests
        "Go to the Audience Chamber in Ru'Lude Gardens (H-6) or the Bulwark Gate in Sauromugue Champaign (S) for a cutscene. It completes this quest and starts the next.",
    },

    cw_woe_glimmer_of_hope = { -- Local patch: Crystal War quests
        "With at least one voidstone, warp to the Walk of Echoes from the Veridical Conflux in Pashhow Marshlands (S).",
        "Click the glimmering ??? where you arrive for a cutscene; a voidstone becomes Kupofried's corundum and the next quest starts.",
    },

    cw_woe_brace_for_the_unknown = { -- Local patch: Crystal War quests
        "Choose to warp to ???? at the end of the Glimmer of Hope cutscene. If you didn't, click the glimmering ??? again and pick the warp.",
        "A long cutscene in Provenance gives you a Clairvoy ant and access to Provenance.",
    },

    cw_prv_provenance = { -- Local patch: Crystal War quests
        "Get the key items Beguiling petrifact, Seductive petrifact and Maddening petrifact: 330,000 cruor each from a Voidwatch Officer, a rare drop from Voidwatch battles, or a sure drop from Beguiling, Seductive and Maddening Radiance.",
        "Examine the Regal Pawprints in Provenance after each one for a cutscene (or once with all three for all of them).",
        "Examine the Provenance Protocrystal for a short cutscene that completes the quest.",
    },

    cw_prv_crystal_guardian = { -- Local patch: Crystal War quests
        "With all three petrifacts, examine the Provenance Protocrystal to fight Provenance Watcher. Everyone in the alliance needs all three, and they are used up.",
        "After winning, check the Regal Pawprints for a cutscene that completes the quest. You can fight again with new petrifacts.",
    },

    cw_prv_endings_and_beginnings = { -- Local patch: Crystal War quests
        "Leave Provenance through the Planar Rift to the Walk of Echoes for the final cutscene.",
    },

    cw_woe_ad_infinitum = { -- Local patch: Crystal War quests
        "This marks the end of the Voidwatch story. It never completes and stays under Current Quests in game.",
    },
}

return Q