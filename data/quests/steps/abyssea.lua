local Q = {}

Q.STEPS = {

    -- Vision of Abyssea zone quests (BG-Wiki).

    aby_lth_catering_capers = { -- Local patch: Abyssea quests
        "Speak with Regine near Veridical Conflux #01 in Abyssea - La Theine (E-3). She gives you 3 Hatchets to log 3 Plateau Chestnuts.",
        "Log 3 Plateau Chestnuts at Logging Points: between Conflux #01 and #02, around the Puks, west and south of Conflux #07, and among the Opo-opo.",
        "Trade the chestnuts to Rugiette at Veridical Conflux #04 (H-7) to complete the quest. You can repeat it without zoning.",
    },

    aby_lth_gift_of_light = { -- Local patch: Abyssea quests
        "Speak with Amaura near Veridical Conflux #01 in Abyssea - La Theine (E-3); she asks for a Sunbeam fragment.",
        "Between 6:00 and 18:00, examine the Jagged Cliff in the southeast corner of (J-6), near Conflux #07, for a bungee-jump minigame. Press NOW just as your fall ends and you start to rise; you have three tries to grab the key item Sunbeam fragment.",
        "Return to Amaura to complete the quest; without the fragment you still finish, for only 60 Cruor. Drop any Hi-Reraiser you already hold first. Zone to repeat it.",
    },

    aby_lth_fear_of_the_dark_iii = { -- Local patch: Abyssea quests
        "Speak with Secodiand in Abyssea - La Theine (E-3).",
        "Trade him 3 Clionid Wings to complete the quest. The Veld Clionids around (D-4)/(D-5) drop them; keep their Sanguinets for Cleansing the Canyon and A Ward to End All Wards. Repeating it is a quick way to raise La Theine fame (about 120 wings for rank 6).",
    },

    aby_lth_an_eye_for_revenge = { -- Local patch: Abyssea quests
        "With the key item Vial of lambent potion from Lost Memories, speak with Curilla in Abyssea - La Theine (E-3).",
        "Use a Filthy Gnole Claw, dropped by the nearby Luisons, to spawn Lugarhoo southwest of Conflux #05 on the (G-11)/(H-11) border. Defeat it for the key item Lugarhoo's eyeball; everyone in the party with the quest gets one.",
        "Return to Curilla to complete the quest and receive the key item Scarlet abyssite of furtherance.",
    },

    aby_lth_unbreak_his_heart = { -- Local patch: Abyssea quests
        "Speak with Joulet at Veridical Conflux #04 in Abyssea - La Theine (H-7) and offer to mend his rod, for a Broken Willow Fishing Rod.",
        "Repair it with a Light Crystal (Woodworking cap 10), or get a Willow Fishing Rod some other way.",
        "Trade the Willow Fishing Rod to Gallijaux at Veridical Conflux #06 (L-12) to complete the quest. To repeat it you must really leave the zone, for example through the Cavernous Maw near Conflux #01.",
    },

    aby_lth_explosive_endeavors = { -- Local patch: Abyssea quests
        "Speak with Fontoumant at Veridical Conflux #04 in Abyssea - La Theine (H-7) for three Anti-Abyssean grenade key items.",
        "Examine the three Dark Fissures and choose to attack the darkness: one at (H-6), among the Pasture Funguar just past Fontoumant, and two at (F-6) and (F-7), in the chasm where Ordelle's Caves would be.",
        "Return to Fontoumant to complete the quest. Zone to repeat it.",
    },

    aby_lth_the_angling_armorer = { -- Local patch: Abyssea quests
        "Speak with Exoroche near Veridical Conflux #04 in Abyssea - La Theine (H-7).",
        "Fish a Rusty Kunai (40 Cruor), Rusty Spear (80), Rusty Zaghnal (120) or Rusty Shield (320) from any of the four ponds. Any rod works, and a lure keeps your bait from being eaten.",
        "Trade one to Exoroche to complete the quest. Repeat it by trading him more, with no need to zone; he sometimes adds an Evolith.",
    },

    aby_lth_water_of_life = { -- Local patch: Abyssea quests
        "Speak with Miageau at Veridical Conflux #06 in Abyssea - La Theine (L-11) for four vials of purification agent.",
        "Examine the four Murky Ponds, the water on your map: one at (L-10), one at (K-11) and two at (H-7). Each turns one vial into a labeled vial.",
        "Return to Miageau to complete the quest. Zone to repeat it.",
    },

    aby_lth_out_of_touch = { -- Local patch: Abyssea quests
        "Speak with Glenne near Veridical Conflux #06 in Abyssea - La Theine (L-11) for the key item Rainbow-colored linkpearl.",
        "Find and speak with Aaveleon, who roams most of the zone along the main roads and sometimes into the valleys; widescan helps.",
        "Return to Glenne to complete the quest and receive the key item Scarlet abyssite of kismet.",
    },

    aby_lth_lost_memories = { -- Local patch: Abyssea quests
        "Speak with Halver near Veridical Conflux #06 in Abyssea - La Theine (L-11).",
        "Trade him 2 Lambent Scales, dropped by Farfadets (Treasure Hunter helps), to complete the quest and receive the key item Vial of lambent potion for An Eye for Revenge. Repeating it, with no need to zone, gives Coeurl Mantles and raises fame.",
    },

    aby_kon_hope_blooms_on_the_battlefield = { -- Local patch: Abyssea quests
        "Speak with Ayame in Abyssea - Konschtat (I-13), then with Raibaht by the magical barrier to the north.",
        "Examine the seven Repair Trunks around (I-13), one of them behind the Maw exit; three of them give the key items Rainbow pearl, Chipped wind cluster and Piece of dried ebony lumber.",
        "Speak with Raibaht, then return to Ayame to complete the quest.",
    },

    aby_kon_of_malnourished_martellos = { -- Local patch: Abyssea quests
        "Speak with Raibaht in Abyssea - Konschtat (I-13) for the key item Vat of martello fuel. Leaving the zone may reset the quest.",
        "Examine any Martello (the nearest is just north), choose to prepare to replenish it, go to the side the menu names and replenish it.",
        "Return to Raibaht to complete the quest. He then asks you to refuel a Martello for Refuel and Replenish.",
    },

    aby_kon_rose_on_the_heath = { -- Local patch: Abyssea quests
        "Speak with Ayame in Abyssea - Konschtat (I-13) for the captains' linkpearls and the key item Seal of the resistance.",
        "Speak with Argus at (D-7), northeast of Conflux #03, then Helga at (G-5), north of Conflux #05 through the Mesa Wivre, then Rashid at (F-10), northwest of Conflux #02.",
        "Return to Ayame to complete the quest.",
    },

    aby_kon_full_of_himself_alchemist = { -- Local patch: Abyssea quests
        "Speak with Julio northwest of Conflux #02 in Abyssea - Konschtat (F-10).",
        "Trade him 3 Purple Polypores, dropped by the Shadow Funguar around (G-8)/(H-8) near Conflux #04 (Treasure Hunter helps), for 2 Soothing Potions. Save the potions for The Walking Wounded; together the two quests are the fastest way to max Konschtat fame. You can repeat it without zoning.",
    },

    aby_kon_the_walking_wounded = { -- Local patch: Abyssea quests
        "Speak with Rashid northwest of Conflux #02 in Abyssea - Konschtat (F-10).",
        "Trade a Soothing Potion to each of the five Resistance Fighters nearby.",
        "Return to Rashid to complete the quest. To repeat it, speak with him again first; no zoning is needed.",
    },

    aby_kon_shady_business_redux = { -- Local patch: Abyssea quests
        "Speak with Talib, who runs around just northeast of Conflux #03 in Abyssea - Konschtat (D-7).",
        "Trade him 4 Limule Pincers (also on the Auction House) to complete the quest. You can repeat it without zoning.",
    },

    aby_kon_addled_mind_undying_dreams = { -- Local patch: Abyssea quests
        "Speak with Silver Owl at Veridical Conflux #03 in Abyssea - Konschtat (D-7).",
        "Open a Pyxis of any color in any Abyssea zone by the usual means (not with a Forbidden Key) for the key item Pinch of moist Dangruf sulfur; only the one who opens it gets it.",
        "Return to Silver Owl to complete the quest and receive the key item Azure abyssite of prosperity.",
    },

    aby_kon_the_soul_of_the_matter = { -- Local patch: Abyssea quests
        "Speak with Cleades in Abyssea - Konschtat (G-5), southeast of Conflux #06.",
        "From the Lined Boxes next to him, take a Soulgauger SGR-1 and buy Gauger Plates (5 Cruor each, up to 12 at a time).",
        "Equip them and capture a notorious monster of Abyssea - Konschtat from about 5 yalms, facing it from the front; Guimauve and Pavan are close and don't aggro. You don't need to lower its HP.",
        "Trade your plates to Cleades until he accepts one, to complete the quest. You can do it once per game day.",
    },

    aby_kon_secret_agent_man = { -- Local patch: Abyssea quests
        "Speak with Helga southeast of Conflux #06 in Abyssea - Konschtat (G-5).",
        "Speak with Naji at (J-5) for the key item Naji's gauger plate: from Conflux #08 head southwest hugging the left cliff, and turn back if you reach Martello KS-08. He looks invisible, but his name shows and he appears on widescan.",
        "Return to Helga to complete the quest and receive the key item Naji's linkpearl.",
    },

    aby_kon_playing_paparazzi = { -- Local patch: Abyssea quests
        "Speak with Naji southeast of Conflux #08 in Abyssea - Konschtat (J-5) and hand over Naji's linkpearl.",
        "Capture a Gauger Plate of Kukulkan, Turul, Fistule, Bloodeye Vileberry, Eccentric Eve or Depths Digester at close range and facing it; take several in case one fails. You don't need claim.",
        "Trade a good plate to Naji to complete the quest and receive the key item Azure abyssite of merit. Later completions give Black Mantles, once per game day.",
    },

    aby_tah_his_box_his_beloved = { -- Local patch: Abyssea quests
        "Speak with Apururu in Abyssea - Tahrongi (H-12). If you've never spoken with Kupipi next to her, do that first.",
        "Speak with Kopuro-Popuro in the Western Encampment (F-9), near Conflux #03.",
        "Use emotes such as /cheer, /clap, /praise, /smile or /joy on the Bottomless Box next to him a few times, then examine it for the key item Ripe starfruit.",
        "Return to Apururu to complete the quest.",
    },

    aby_tah_weapons_not_worries = { -- Local patch: Abyssea quests
        "Speak with Peshi Yohnts in the Western Encampment of Abyssea - Tahrongi (F-9), near Conflux #03; speak with Kupipi (H-12) first if you never have. She gives you one Pickaxe.",
        "Dig at the Excavation Points around the dragon skeleton at (E-5), a walk from Conflux #06, until you get a Hardened Bone, or buy one on the Auction House. Bring more Pickaxes for retries.",
        "Trade the bone to Peshi Yohnts to complete the quest. Zone to repeat it; about 50 completions max Tahrongi fame.",
    },

    aby_tah_cleansing_the_canyon = { -- Local patch: Abyssea quests
        "Speak with Kupipi in Abyssea - Tahrongi (H-12).",
        "Trade her 3 Sanguinets to complete the quest. The Abyssea-only families, such as Clionids, Murex and Amoebans, drop them in every Abyssea zone, or buy them on the Auction House. You can repeat it.",
    },

    aby_tah_savory_salvation = { -- Local patch: Abyssea quests
        "Speak with Piketo-Puketo in the Western Encampment of Abyssea - Tahrongi (F-9) for the key item Vial of flower-wower fertilizer.",
        "At the large tree at (G-7), near Conflux #04, examine the Gnarled Root on the path below to inject the fertilizer, then the Fragmented Nutshell up on the slope for the key item Tahrongi tree nut.",
        "Return to Piketo-Puketo to complete the quest. Zone to repeat it.",
    },

    aby_tah_bringing_down_the_mountain = { -- Local patch: Abyssea quests
        "Speak with Diegai on the (H-7)/(I-7) border of Abyssea - Tahrongi, near Conflux #07.",
        "Walk from Conflux #07 to Baladanzo at (J-8) and speak with him.",
        "Defeat Bog Bodies around (J-5), near Conflux #08, for 10 Gunpowder Swathes, then trade them to Baladanzo, all at once or one at a time (500 Cruor each), to complete the quest.",
    },

    aby_tah_a_sterling_specimen = { -- Local patch: Abyssea quests
        "Speak with Ohbiru-Dohbiru near Conflux #07 in Abyssea - Tahrongi (H-7) and tell him you've found a pink fiend.",
        "Speak with Kenapa-Keppa in the northeast corner of (I-7) for the key item Bucket of compound compost.",
        "Examine the Lycopodium Rootprint west of the mountain at (H-7) to spawn Rubicund Adenium, and lead it to Kenapa-Keppa without letting it fall more than about 20 yalms behind.",
        "After the Warp II animation ends, speak with Kenapa-Keppa to complete the quest and receive the Dance Shoes. Zone to repeat it, once per game day.",
    },

    aby_tah_for_love_of_a_daughter = { -- Local patch: Abyssea quests
        "Speak with Baha Mannohl by Veridical Conflux #05 in Abyssea - Tahrongi (H-4).",
        "Between 20:00 and 4:00, examine the Tahrongi Cacti at (F-6), past the Caoineag from Conflux #04, for the key item Cup of Tahrongi cactus water.",
        "Return to Baha Mannohl to complete the quest. Zone to repeat it; trying to start it a sixth time gives the key item Viridian abyssite of lenity instead.",
    },

    aby_tah_sisters_in_crime = { -- Local patch: Abyssea quests
        "Speak with Bopa Greso, southeast of Conflux #02 in Abyssea - Tahrongi (I-10), for the key item Hastily scrawled poster.",
        "Put up the posters at the four Signboards along the paths at (G-7), (H-6), (H-9) and (I-8).",
        "Return to Bopa Greso to complete the quest. Zone to repeat it.",
    },

    aby_tah_when_good_cardians_go_bad = { -- Local patch: Abyssea quests
        "Speak with Apururu in Abyssea - Tahrongi (H-12). Zoning resets your progress.",
        "Speak with the five Cardians (2 to 6 of Diamonds): two guard the exits of the main camp, and there is one at each encampment by Conflux #03, #05 and #07.",
        "Note which ones give odd answers. A single wrong word counts, and a correct answer spoken with hollow stars is also wrong.",
        "Tell Apururu exactly which Cardians were wrong to complete the quest and receive the key item Viridian abyssite of guerdon. If you get it wrong, zone and try again.",
    },

    aby_tah_tangling_with_tongue_twisters = { -- Local patch: Abyssea quests
        "Speak with Kupipi in Abyssea - Tahrongi (H-12).",
        "Defeat one of Cuelebre, Adze, Minhocao, Chukwa or Mictlantecuhtli for the key item Bloodied arrow (a Crimson bloodstone on later runs).",
        "Return to Kupipi to complete the quest.",
    },

    -- Scars of Abyssea zone quests (BG-Wiki).

    aby_vun_a_ward_to_end_all_wards = { -- Local patch: Abyssea quests
        "Speak with Belgidiveau at the base camp by Veridical Conflux #01 in Abyssea - Vunkerl (F-4).",
        "Trade him one Abyssea monster drop to complete the quest; most first-tier pop items work, but Magian Trial items don't. High-strength items such as Black Whisker, Gory Pincer or Mocking Beak give the most. Sanguinets and Amoeban Pseudopods from the nearby Stream Amoebans also work, and about 50 completions max Vunkerl fame. You can repeat it without zoning.",
    },

    aby_vun_the_boxwatchers_behest = { -- Local patch: Abyssea quests
        "Speak with Deraquien at the base camp by Conflux #01 in Abyssea - Vunkerl (F-4) and choose a supply pack: Pocket (-24% movement speed), Standard (-48%) or Hefty (-72%). Heavier packs pay more Cruor.",
        "Walk to Elmemague near Veridical Conflux #00 (I-9) for the key item Letter of receipt and Flee. Don't use a Conflux on the way, or the pack turns to slag and you fail; zoning or logging out also resets it.",
        "Return to Deraquien (now you can use a Conflux) to complete the quest. You can repeat it without zoning. Repeats can also give an Empyrean +1 seal.",
    },

    aby_vun_his_bridge_his_beloved = { -- Local patch: Abyssea quests
        "Speak with Cheupirudaux near Conflux #04 or #08 in Abyssea - Vunkerl (E-7) for the key item Woodworker's belt; the first time he also gives you 2 Viscous Spittle.",
        "Examine the Derelict Bridge at (F-7). If it creaks, trade it 2 Viscous Spittle; if it wavers, 4; if it crumbles, 5. Spitting Spiders east of Conflux #05 drop more.",
        "Return to Cheupirudaux to complete the quest and receive the key item Crimson abyssite of lenity. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_vun_bad_communication = { -- Local patch: Abyssea quests
        "Speak with Ferdechiond near Conflux #00 in Abyssea - Vunkerl (I-9) for the key item Espionage pearlsack. The clock starts now.",
        "Examine the three ??? he marks on your map, at (H-10), (G-8) and (E-11). Finishing the last one within 7 minutes pays the most, 8 to 9 minutes less, and 10 or more the least.",
        "Return to Ferdechiond to complete the quest. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_vun_family_ties = { -- Local patch: Abyssea quests
        "After For Want of a Pot in Abyssea - Attohwa, speak with Teigero-Bangero in Abyssea - Vunkerl (E-7), southwest of Conflux #08 past the Helter-skelters, for the key item Smudged letter.",
        "In Abyssea - Attohwa, deliver the letter to Naruru at the entrance for the key item Yellow linkpearl.",
        "Return to Teigero-Bangero to complete the quest and receive the Taru Tot Toyset.",
        "Optional: in Abyssea - Misareaux, trade the toyset (you keep it) to Panta-Putta, who walks from Conflux #00 to #04 to #07 and back, for the key item Jester's hat, then trade that to Naruru in Abyssea - Attohwa for a Jester's Hat.",
    },

    aby_vun_aqua_pura = { -- Local patch: Abyssea quests
        "Speak with High Bear near Conflux #00 in Abyssea - Vunkerl (I-9).",
        "Examine the three Watergrass spots, in any order: (E-5) by Conflux #01, (G-10) by Conflux #05, and the northeast corner of (F-13) by Conflux #06.",
        "Return to High Bear to complete the quest.",
    },

    aby_vun_aqua_puraga = { -- Local patch: Abyssea quests
        "Wait for the next game day after Aqua Pura, then speak with High Bear near Conflux #00 in Abyssea - Vunkerl (I-9).",
        "Examine one Watergrass and note what you see. (E-5): yellowish powder, beastly footprints or slimy leaves. (G-10): raindrops, gunpowder or a curious ooze. (F-13): ash-coated leaves, rotted fruit or malodorous soil.",
        "Report to High Bear. If his choices don't match the spot you checked, answer Nothing of note, then check the spot whose observations he lists and report again with the right one.",
        "Wait for the game day to change (00:00), with no need to zone, and speak with him to complete the quest. You can repeat it without zoning. Repeats can also give an Empyrean +1 seal.",
    },

    aby_vun_whither_the_whisker = { -- Local patch: Abyssea quests
        "Speak with Rahal in Abyssea - Vunkerl (F-4).",
        "Trade him a Black Whisker, dropped by the Slaughterous Smilodons northeast of Conflux #04 at (G-8) or bought on the Auction House, to complete the quest and receive the key item Crimson abyssite of celerity.",
    },

    aby_vun_scattered_shells_scattered_mind = { -- Local patch: Abyssea quests
        "Speak with Aladoverre in Abyssea - Vunkerl (E-7), near Conflux #08.",
        "Find the key items Chipped linkshell, Cracked linkshell and Grimy linkshell at ??? spots; each ??? gives one. Three spots never move: among the Helter-skelters near Conflux #08, between the Peapuks and Russet Rarabs northwest of Conflux #06, and among the Aestutaur near Conflux #04.",
        "Return to Aladoverre to complete the quest. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_wayward_wares = { -- Local patch: Abyssea quests
        "Speak with Chapi Galepilai in Abyssea - Attohwa (G-10).",
        "Examine at least one of the three Supply Points around the Crevice Amoebans and Treacle Slugs: one at (G-8) and two at (F-9). The more packs you bring back, the bigger the reward.",
        "Speak with Morlepiche at Veridical Conflux #00 to complete the quest.",
    },

    aby_att_looking_for_lookouts = { -- Local patch: Abyssea quests
        "Speak with Colti at Veridical Conflux #08 in Abyssea - Attohwa (H-8) for 5 Parradamo supply pack key items.",
        "Speak with the five Resistance Fighters around the Parradamo Tor: at the southern base (J-9), partway up the southern base on the cliff (J-9), near the top of the western face (J-8), halfway up the eastern face (K-8), and at the eastern base (K-9).",
        "Return to Colti to complete the quest. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_flown_the_coop = { -- Local patch: Abyssea quests
        "Speak with Brutus at Veridical Conflux #08 in Abyssea - Attohwa (H-8) for Gysahl Greens. If you've never been up there, Red Ghost teleports you above the ledge.",
        "Trade the greens to a Chocobo Spoor around (I-8), (I-9) or (J-13); the nearest is just out of the southeast tunnel from Brutus. A Chocobo appears.",
        "Sneak up behind it while it stops to look around and examine it. It sees through Invisible and runs if it spots you; after too many scares you need more of your own greens, with a one-minute wait.",
        "Return to Brutus to complete the quest; party members (not other alliance parties) get credit too. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_threadbare_tribulations = { -- Local patch: Abyssea quests
        "Speak with Ponono at Veridical Conflux #08 in Abyssea - Attohwa (H-7); Red Ghost takes you up the ledge if you've never been there.",
        "Trade her 3 Amoeban Pseudopods, from the Crevice Amoebans southeast and southwest of Conflux #00 or the Auction House, to complete the quest. You can repeat it without zoning; about 25 completions max Attohwa fame. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_an_offer_you_cant_refuse = { -- Local patch: Abyssea quests
        "Speak with Garnev at Veridical Conflux #00 in Abyssea - Attohwa (F-9).",
        "Trade him a Malachite, from gold Sturdy Pyxides or Attohwa notorious monsters like Maahes, to complete the quest and receive an Elite Beret. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_something_in_the_air = { -- Local patch: Abyssea quests
        "Speak with Yoran-Oran at the base camp of Abyssea - Attohwa (G-10).",
        "Examine the Gasponia flowers around (F-8)/(F-9), near Conflux #00, until you get the key item Gasponia stamen.",
        "Return to Yoran-Oran to complete the quest.",
    },

    aby_att_an_acrididaen_anodyne = { -- Local patch: Abyssea quests
        "Speak with Yoran-Oran at the base camp of Abyssea - Attohwa (G-10). Jakaka (I-10) can tell you more.",
        "Go to the small grassy patch by the bones in the southeast of (I-10); near Conflux #03 you may have to wait for the smoke at (J-9) to clear. Move around using /clap until a glowing Rockhopper appears, then examine it for the key item Rockhopper.",
        "Speak with Yoran-Oran for the key item Phial of counteragent, examine the Gasponia flowers around (F-8)/(F-9), and return to him to complete the quest. Repeats can also give an Empyrean +1 seal.",
    },

    aby_att_hazy_prospects = { -- Local patch: Abyssea quests
        "Speak with Harith in Abyssea - Attohwa (G-10) for the key item Miasmal counteragent recipe.",
        "Craft a Miasmal Counteragent while holding the recipe: a Salinator (Upih Khachla, Windurst Waters H-9), 2 Distilled Water and a Seashell (Shih Tayuun, Windurst Woods H-13).",
        "Trade it to a path-blocking Dark Miasma around the Parradamo Tor; there's one near Conflux #03 and one right by Conflux #07. It vanishes if it worked.",
        "Return to Harith to complete the quest and receive the key item Jade abyssite of lenity.",
    },

    aby_att_for_want_of_a_pot = { -- Local patch: Abyssea quests
        "Speak with Naruru by Veridical Conflux #01 in Abyssea - Attohwa (G-10).",
        "Examine the Cargo Crate at (H-8), south of Conflux #06 past the Spuks, for the key item Damaged stewpot, and give it to Naruru.",
        "Trade a Sieglinde Putty (Alchemy 30, the Auction House, or Odoba at the Alchemy guild) to Ranpi-Monpi at the Cooking Guild in Windurst Waters (D-9) for the key item Naruru's stewpot.",
        "Return to Naruru to complete the quest.",
    },

    aby_mis_missing_in_action = { -- Local patch: Abyssea quests
        "Speak with Iron Eater in Abyssea - Misareaux (K-7) for the key item Iron Eater's pearlsack.",
        "Speak with Mathurin at Conflux #03, Quasim in the northeast corner of (G-5) from Conflux #05, and Fariel in the northwest corner of (G-8), south of Conflux #06.",
        "Return to Iron Eater to complete the quest.",
    },

    aby_mis_i_dream_of_flowers = { -- Local patch: Abyssea quests
        "Speak with Goraow northeast of Conflux #05 in Abyssea - Misareaux (G-5) and trade him a Lilac.",
        "Examine the Grassy Mound at (K-12), near Conflux #08, and trade it the Lilac.",
        "Return to Goraow to complete the quest.",
    },

    aby_mis_destiny_odyssey = { -- Local patch: Abyssea quests
        "Zone after I Dream of Flowers, then speak with Goraow in Abyssea - Misareaux (H-4).",
        "Trade him a Sanguine Spike, dropped by the Peiste notorious monster Gukumatz northeast of Conflux #07, to complete the quest and receive the key item Sapphire abyssite of sojourn.",
    },

    aby_mis_unidentified_research_object = { -- Local patch: Abyssea quests
        "Speak with Yurim at the base camp of Abyssea - Misareaux (K-7). She forgets what she needs; trading her an Apple Pie reminds her, but it's optional.",
        "Trade her a Murex Spicule, from the Escarp Murex just west at (J-7), to complete the quest. Zone to repeat it; about 25 completions max Misareaux fame. Repeats can also give an Empyrean +1 seal.",
    },

    aby_mis_cookbook_of_hope_restoring = { -- Local patch: Abyssea quests
        "Speak with Jonette by Conflux #03 in Abyssea - Misareaux (G-7).",
        "Find the ??? for the key item Torn recipe page. It moves every 10 minutes in this order: among the spiders at (I-7) by Conflux #00, among the Colibri at (H-8), among the Peistes at (J-11), and among the Bugards at (K-11).",
        "Return to Jonette to complete the quest. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_mis_smoke_over_the_coast = { -- Local patch: Abyssea quests
        "Speak with Hungry Wolf near Conflux #03 in Abyssea - Misareaux (G-7).",
        "Get a Galkan Sausage from the Auction House, or trade a Giant Sheep Meat to the ??? on the campfire at (E-7), near Conflux #06. Stop at almost done for a plain sausage, mouthwatering for +1, burnt for +2 or overpowering burnt for +3; it can burn at any time.",
        "Trade the sausage (not a -1) to Hungry Wolf to complete the quest; better sausages pay more. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_mis_soil_and_green = { -- Local patch: Abyssea quests
        "Speak with Sieglinde in Abyssea - Misareaux (K-7) for the key item Mineral gauge for dummies.",
        "Examine a Logging Point (north or southeast of Conflux #05, north of #07, or west or south of #06) and note the gauge's color.",
        "Return to Sieglinde. If it was red or yellow she gives you the key item Tube of alchemical fertilizer; examine a Logging Point again, any of them, and come back. If it was blue, you're done.",
        "Speak with Sieglinde to complete the quest. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },

    aby_mis_dropping_the_bomb = { -- Local patch: Abyssea quests
        "Speak with Veit northeast of Conflux #05 in Abyssea - Misareaux (H-4).",
        "Fish Brine Crabs from the nearby stream (they ferociously bite; almost any rod and bait work) and defeat them for a Powder Casket; it's a rare drop, so Treasure Hunter helps.",
        "Trade the casket to Veit to complete the quest. He may refuse one with moisture inside; bring another. Zone to repeat it.",
    },

    aby_mis_wanted_medical_supplies = { -- Local patch: Abyssea quests
        "Speak with Yasuji near Conflux #03 in Abyssea - Misareaux (G-7).",
        "Open blue Sturdy Pyxides by hand (not with a Forbidden Key) until one gives the key item Medical supply chest; higher-level ones give it more often, and peering inside doesn't show it.",
        "Return to Yasuji to complete the quest and receive the key item Sapphire abyssite of merit. Zone to repeat it. Repeats can also give an Empyrean +1 seal.",
    },
}

return Q
