local Q = {}

Q.STEPS = {

    -- ========================================================
    -- KAZHAM
    -- ========================================================

    out_kaz_guardian = {
        "Speak with Hari Pakhroib in Kazham (I-11), who wants Wild Pamamas. You need Kazham fame level 7 and the Rise of the Zilart pack.",
        "Obtain a Wild Pamamas, which drops from Young Opo-opo enemies in Yuhtunga Jungle and can sometimes be found at the Auction House. On later repeats a Wild Melon also works. Despite what the NPC says, you do not need to bring Ice Clusters, as there are no Flame Spouts on the path.",
        "Head to Ifrit's Cauldron using the entrance from (G-6) in Yhoator Jungle. The Survival Guide can also bring you there.",
        "Once inside Ifrit's Cauldron, take the left path at the fork and continue until you find the Altar of Ashes at (I-9) on map 2, a black pillar near the edge of the path. Alternatively, use the Unity 125 teleport to map 3 and take exit G, then A, then B to reach (I-9) of map 2.",
        "Trade the Wild Pamamas to the Altar. The NPC mentions needing to shout your name, but that is not necessary.",
        "Return to Hari Pakhroib for your reward, 5,000 gil. You can repeat the quest.",
    },

    out_kaz_question_of_taste = {
        "Talk to Etteh Sulaej in Kazham (J-9). You need Kazham fame level 6 and the Rise of the Zilart pack, and this quest follows A Pose by Any Other Name. You receive the key item Letter to Angelica.",
        "Take the letter to Windurst Waters and talk to Angelica at the Rarab Tail Hostelry. You receive the key items Angelica's letter and the painting \"Final Fantasy\", which she wants you to hang in the Temple of Uggalepih.",
        "Go back to Kazham and talk to Etteh Sulaej.",
        "Go to (G-8) on the first map of the Temple of Uggalepih and hang the picture at the Stone Picture Frame, on the south wall of the Paintbrush Room, to spawn the Golem NM Trompe L'Oeil. The Temple of Uggalepih Survival Guide warp puts you a short distance from the Stone Frame.",
        "Defeat the NM, then check the frame for the Ripped \"Final Fantasy\" painting. In a party, there is a 10-minute wait before the NM can be spawned again.",
        "Return to Etteh Sulaej to receive your reward, 3,000 gil. You can repeat the quest; Angelica then gives you \"Final Fantasy Part II\" instead.",
    },

    out_kaz_grudging = {
        "To begin this quest you must have traded an Unlit Lantern to the Altar of Rancor and received a Rancor Flame at some point before; it helps to have a Rancor Flame on you. This quest follows A Question of Taste and requires the Rise of the Zilart pack.",
        "Once you have used a Rancor Flame, talk to Jakoh Wahcondalo in Kazham (J-9), who tells you to leave her village. The other NPCs in the room tell you to go to the Den of Rancor and Temple of Uggalepih complex to be cleansed and then come back. You get the title Excommunicate of Kazham as soon as the quest becomes active.",
        "You need at least one Unlit Lantern, dropped by Tonberry Maledictors. Four players with four lanterns is easiest, but all four lamps at the altar must be lit, and you can solo it by making four trips; the altar stays lit for a good while.",
        "From the Temple of Uggalepih's main entrance, take every right turn to exit at (F-5), then hug the left wall in Yhoator Jungle to re-enter the temple at (H-11).",
        "Once in the temple, head to (I-10) and defeat the Temple Guardian to open the door.",
        "Past the guardian's door, head north to the paintings room at (I-7) and use a Paintbrush of souls to enter the Den of Rancor.",
        "In the Den of Rancor, hug the right wall to the Altar of Rancor at (D/E-5) and trade it the Unlit Lanterns for Rancor Flames. Take them to the other Altar of Rancor at (I/J-13) and trade them; after the fourth lantern is lit, the bomb NM Rancor Torch appears.",
        "Kill the Rancor Torch, then head back to Kazham and talk to the Chieftainess for your reward, 11,000 gil.",
    },

    out_kaz_knife = {
        "Trade Mhebi Juhbily in Kazham (I-10) a Sandfish. You need Kazham fame level 6 and the Rise of the Zilart pack. When asked, tell her you give it to her. Then check the shed behind her for a cutscene.",
        "Speak with Vah Keshura at (H-9).",
        "Obtain a Tonberry Board. It drops from Tonberry Pursuer enemies in the Temple of Uggalepih, Tonberry Shadower enemies in Yhoator Jungle and Tonberry Trailer enemies in the Den of Rancor.",
        "Use a Unity Concord warp to the Temple of Uggalepih (level 125), or walk: enter from Yhoator Jungle (J-12), go south at (J-7), north at (H-9) and north again at (G-7) to come back out into Yhoator Jungle, then head left and re-enter the Temple at (H-11), careful not to fall off the ledge.",
        "Back inside, head west, then south to (H-10), then west again past the Granite Door into the Tonberry Kitchen.",
        "Speak with Chef Nonberry and trade him the Tonberry Board for the key item Nonberry's knife.",
        "Return to Mhebi Juhbily for your reward, 7,200 gil.",
    },

    out_kaz_missionary_man = {
        "Speak with Rauteinot in Kazham (G-9), who asks for a slab of Elshimo Marble. You need Kazham fame level 3 and the Rise of the Zilart pack.",
        "Obtain an Elshimo Marble, which drops from Ivory Lizard enemies in Yuhtunga Jungle.",
        "Trade the Elshimo Marble to Rauteinot. You receive Rauteinot's parcel.",
        "Head to Northern San d'Oria and speak with Mulaujeant at (E-5), on the second floor near the Blacksmithing Guild.",
        "Wait until one Earth minute has passed and speak with Mulaujeant again to be given the Sublime statue of the Goddess.",
        "Return to Rauteinot for your reward, the Scroll of Teleport-Yhoat.",
    },

    out_kaz_gullibles_travels = {
        "Speak with Magriffon in Kazham (I-7), inside Celodekhi's B&B. You need Kazham fame level 6 and the Rise of the Zilart pack. He has given all his worldly possessions to save a pack of Opo-opos from starvation, and needs someone to save him from getting kicked out before he completes his top-secret mission.",
        "Trade him the gil he asks for, between 10,000 and 30,000 gil. This earns you the title Gullible's Travels.",
    },

    out_kaz_even_more_gullibles = {
        "You must zone after completing Gullible's Travels before you can flag this quest. You need Kazham fame level 7 and the Rise of the Zilart pack. Magriffon has spent all of his (your?) money to save a maiden in distress.",
        "Speak with Magriffon in Kazham (I-7) and trade him the gil he asks for.",
        "Zone, then return to Magriffon, who gives you a Treasure map key item.",
        "Go to the three spots on the treasure map in Yuhtunga Jungle, (F-7), (H-10) and (I-12), and examine the Blue Rafflesia at each for a Rafflesia Nectar.",
        "Return to Magriffon to finish the quest and receive 3 Rafflesia Nectar.",
        "After completing this quest, all Mithra in Kazham are repulsed by you, but Opo-opos are attracted to you. The only way to fix this is by completing Personal Hygiene, though it is recommended that you finish The Opo-opo and I first so you can get an Opo-opo Crown.",
    },

    out_kaz_personal_hygiene = {
        "You need the scent from Even More Gullible's Travels. This scent repulses all Mithra in Kazham, but it is required to start The Opo-opo and I, so if you plan to do that quest, do not wash it off before you start it. You need the Rise of the Zilart pack.",
        "Speak with Gatih Mijurabi in Kazham (I-8) to begin the quest to remove the scent. The Mithra of Kazham are having a hard time holding in their lunches, and the only way to get clean is a long dip in a hot spring deep beneath the sea.",
        "The hot spring is in Korroloka Tunnel (G-9) on map 4.",
        "Return to Gatih Mijurabi to complete the quest and receive the Mithran Stone.",
        "If you need to re-apply the scent for The Opo-opo and I, you can check the three Rafflesia flowers in Yuhtunga Jungle once per game day until you get the scent back.",
    },

    out_kaz_opo_opo_and_i = {
        "Once you have finished Even More Gullible's Travels and received the scent, speak with Lulupp in Kazham (G-7) for a cutscene. The Opo-opo in Kazham love your new fragrance: bring them what they want, in the correct order, and they make you their king.",
        "Trade these items in this exact order; a wrong order resets all progress (you then need to trade each item again, but they don't take it a second time): Lulupp (G-7) a Broken Mithran Rod (Auction House, or break a Mithran Fishing Rod from Babubu in Port Windurst (C-8) on something too heavy); Kukupp (I-11) a Workbench (Woodworking 7 or Auction House); Mumupp (J-9) a Ten of Coins (Ten of Coins monster, Outer Horutoto Ruins, same place as The Kind Cardian).",
        "Next, Roropp (H-9) Sands of Silence (Demon Magistrate/Chancellor, Castle Zvahl Baileys: from the Survival Guide go west to map 2 and down the stairs at (H-6) or (H-10), or fall through the big holes); Popopp (H-9) a Wandering Bulb (Utukku, Fei'Yin: downstairs at (G-9) and north, or south from Home Point #2, in the small rooms with doors); Bubupp (I-8) Giant Fish Bones (Tonberry Stalker).",
        "Then Tatapp, who walks counter-clockwise round the town (trade while moving), a Blackened Toad (Brook Sahagin round the lake at (J-12) in Sea Serpent Grotto, or the room at (M-14)); Kakapp (J-9) a Wyvern Skull (Hurricane Wyvern, Ifrit's Cauldron: from the Home Point drop at (J-4) into map 7, round the crater to (J-8), north to map 3 and west to a square room); Lalapp (F-9) Ancient Salt (Sand Digger, Quicksand Caves, same spot as Zilart Mission 12); Nenepp (I-11), who moves in and out of range, a Lucky Egg (Knight Crawler, The Boyahda Tree).",
        "If you forget how far you are, talk to the Opo-opos on the list: those already given the right item say \"Opopopopo!\" and bow. Wide scan lists them in the right order if you can get all 10 in one scan.",
        "When every Opo-opo has received its item, you receive the Opo-opo Crown and the title King of the Opo-opos.",
    },

    out_kaz_trial_by_fire = {
        "Speak with Ronta-Onta in Kazham (J-9) to obtain the quest. You need Kazham fame level 6 and the Rise of the Zilart pack; if he won't give it, keep talking to him until his text changes. Once you have the key item Tuning fork of fire, you can safely undertake the quest. Each party member must have their own Tuning fork of fire. Trusts can't be used.",
        "Travel to Yhoator Jungle and look for the entrance to Ifrit's Cauldron at (I-6). On the first map, go to the Flame Spout at (H-6), trade it an Ice Cluster or wait for it to recede, and continue to (F-6). On map B, drop down at (I-8); on map C, take the drop at (H-7), then go to (G-6) for the Cloister of Flames. Home Point #1 is best; the Unity Warp (level 125) puts you a short run from it (go left to J, follow the tunnel and walk off the ledge at its end).",
        "Defeat Ifrit Prime to receive the key item Whisper of flames.",
        "Return to Ronta-Onta with the whisper and he offers several reward options, including the ability to summon Ifrit. You can only select one of the rewards at any time, and you may repeat this quest once per Earth day. You may also keep the whisper to meet the requirements of The Moonlit Path.",
        "To save travel time to the Cloister, use the Mini Fork of Fire from Trial-Size Trial by Fire: be on Summoner as your main job, get the Mini Tuning Fork from Dodmos, trade it back to Dodmos, and enter the Protocrystal normally. As long as you do not clear the level 20 version of the battlefield, you may warp to the Cloister as many times as you wish.",
    },

    out_kaz_cloak_and_dagger = {
        "You cannot start this quest if you have another Weapon Skill quest active; return to the person who gave it and quit it first. Speak with Jakoh Wahcondalo in Kazham (J-9) to receive the Dagger of Trials.",
        "You need to break the latent on the Dagger of Trials before completing the rest of the quest. You know you have enough points when the latent breaks and the weapon's elemental resistances disappear from your active resistances (the colored dots below the gear grid).",
        "Trade the Dagger of Trials back to Jakoh Wahcondalo for the key item Map to the Annals of Truth, which sends you to Gustav Tunnel.",
        "Fastest: the Unity Warp (level 128) puts you in the tunnel leading to the NM, with a Grounds Tome nearby for Sneak and Invisible; head north hugging the east wall to the ??? near the (I-9)/(J-9) intersection. Otherwise, with Silent Oil and Prism Powder, follow the path to (G-9) and take the western tunnel, go east at its fork, and from the large room take the eastern tunnel at (I-8) to the ??? at (I-9), map 2.",
        "Examine the ??? to spawn Baronial Bat, weak to Wind and Light. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Return to Jakoh Wahcondalo to receive your reward, the Evisceration weapon skill.",
    },

    out_kaz_trial_size_fire = {
        "You need to be a Summoner of level 20 or higher, Kazham fame level 2 and the Rise of the Zilart pack. Speak with Dodmos in Kazham (J-9) to begin the quest and obtain a Mini Tuning Fork of Fire.",
        "You may prepare for the upcoming battle and, whenever you are ready, trade Dodmos the tuning fork to be transported to the arena.",
        "Trade the fork to the Fire Protocrystal to enter the fighting arena.",
        "Defeat Ifrit Prime to complete the quest.",
        "You may re-obtain the Mini Tuning Fork from Dodmos at any point if you want to repeat the fight, but he will no longer teleport you to the Cloister. Try to fight Ifrit on Watersday and do not fight him on Firesday.",
    },

    out_kaz_firebloom_tree = {
        "You need Windurst fame level 6 (Kazham uses the fame of Windurst). Speak with Soun Abralah in Kazham (H-9). He needs a piece of wood from the Firebloom Tree that will not burn, even in the inferno of Ifrit's Cauldron.",
        "Go to the Firebloom Tree Roots in Yuhtunga Jungle (H-9), northeast of the Survival Guide and the Outpost. Examine the roots on each side of the tree to obtain the Northern, Eastern, Southern and Western Vine. The Western Vine is in the tunnel. No hatchet is needed.",
        "Travel to Ifrit's Cauldron and examine three different Flame Spouts. Each one burns one of the vines, until only the vine from the most fire-resistant side is left. If a spout shows only bubbling lava, wait for the flame to rise again. Bombs guard the last spouts, so bring Sneak and Invisible (non-magic, or cast them well away from the bombs).",
        "A suggested route on Map 1: Flame Spout (H-6), then B > C > K > L to the spout at (H-6)/(H-7), then E > H > N to the spout at (I-10). The wiki also suggests the Survival Guide, then K > L > H to the Ash Dragon area.",
        "Return to the Firebloom Tree and examine the root that matches your remaining vine (check your temporary key items if you forget). Remove a piece of wood to obtain the key item Firebloom Tree Wood.",
        "Return to Soun Abralah to complete the quest and receive 5,000 gil. The quest is repeatable.",
    },

    out_kaz_discerning_eye = {
        "You need an airship pass. Speak with Swift in Kazham (H-7) and accept the quest.",
        "Swift shows you a picture of the passenger who dropped an item. You can look at it as many times as you like; when you say you have it memorized you receive the key item Dropped Item.",
        "Board the next airship. Eight passengers who look very similar to the owner appear on board. They share the race, gender and face, and differ in hair and clothing. Some stand in hard-to-see places, such as above the stairs or behind the engine.",
        "Return the Dropped Item to the passenger you think is the owner. You only get one try: the right passenger gives you 500 gil, and the wrong one takes the item and you receive nothing.",
        "If you have not returned the item before the airship lands, you keep it and must give it back to Swift before you can take the quest again.",
        "Completing it with a passenger of every race and gender earns the title Very Discerning Individual, and with every character model, Extremely Discerning Individual. The quest is repeatable.",
    },

    out_kaz_elshimo_list = {
        "First start Voidwatch Ops: Border Crossing with Kieran in Norg and receive the key item Ashen Stratum Abyssite.",
        "Speak with Hildegard in Kazham (F-9) to begin the quest. Speak with her before defeating the Voidwatch monsters below, or the kills will not count.",
        "Defeat the three Tier I Voidwatch Notorious Monsters of the Elshimo region at their planar rifts:",
        "Holy Moly in Yuhtunga Jungle: rifts at (F-11), (G-6) and (J-7).",
        "Neith in the Temple of Uggalepih: rifts on Map 1 at (I-9) and (K-6), and on Map 2 at (G-8).",
        "Ildebrann in Ifrit's Cauldron: rifts on Map 3 at (F-9), and on Map 5 at (F-9) and (I-6). The closest teleport is the Unity Warp (level 125) to Map 5.",
        "Return to Hildegard to complete the quest.",
    },

    -- ========================================================
    -- NORG
    -- ========================================================

    out_nrg_forge_your_destiny = {
        "Speak with Jaucribaix in Norg (K-8), near the Captain's Chamber, to begin the quest. You need to be level 30 or higher on any job and have the Rise of the Zilart pack. A lump of bomb steel and a sacred branch are required to make a new katana, and Jaucribaix's pupils can tell you where to get them.",
        "Speak with Aeka at (I-8) to receive the Oriental Steel.",
        "Speak with Ranemaud at (I-7) to receive the Sacred Sprig.",
        "Go to the cave at (D-8) in Konschtat Highlands and trade the Oriental Steel to the ??? inside to spawn Forger, a level ~33 Bomb NM. The level 99 Unity warp (Sleepy Mabel) puts you close, at (G-7).",
        "Defeat Forger for the Bomb Steel. If you die or lose the Bomb Steel, Aeka gives you another Oriental Steel for a Darksteel Ore. For multiple people, wait 4 minutes between Forger spawns.",
        "Buy a Hatchet (a Trbl. Hatchet doesn't work) and go to The Sanctuary of Zi'Tah. An area off the map in the northern part of (K-10) leads to a block at (L-9); climb the nearby rock to reach the ??? and trade it the Hatchet to spawn Guardian Treant. The level 122 Unity warp (Keeper of Heiligtum) puts you close, at (K-12).",
        "Defeat Guardian Treant, then trade the Sacred Sprig to the ??? for the Sacred Branch. For multiple people, only one kill is needed, but the Treant takes at least 10 minutes to respawn, so everyone should trade their Sprig before leaving.",
        "Trade the Bomb Steel and the Sacred Branch to Jaucribaix.",
        "Return in 72 in-game hours (3 real-life hours) to receive your reward: the Mumeito and the ability to become a Samurai, with the title Bushido Blade.",
        "The Mumeito is required for the Samurai artifact quest The Sacred Katana, so hold on to it. If you lose it, you have to pay Ranemaud 30,000 gil for a replacement.",
    },

    out_nrg_black_market = {
        "Speak with Muzaffar in Norg (I-8) to begin the quest. You need Outlands fame level 1 (the page is unsure) and the Rise of the Zilart pack.",
        "Bring him either 4 Eastern Pottery, 4 Northern Fur or 4 Southern Mummy to complete the quest. Eastern Pottery x4 pays 2,000 gil and drops from Clockwork Pods in Garlaige Citadel or Fei'Yin.",
        "Northern Fur x4 pays 1,500 gil and drops from Giant Hunter enemies in Qufim Island, and from Giant Lobber enemies in Lower Delkfutt's Tower or Middle Delkfutt's Tower. Southern Mummy x4 pays 3,000 gil and drops from Lich enemies in Western Altepa Desert.",
        "All the required items can also be found at the Auction House, under Others, Misc. 1. The quest gives you the title Black Marketeer and can be repeated.",
    },

    out_nrg_mama_mia = {
        "Speak with Mamaulabion in Norg (G-6) to activate the quest. You need Norg fame level 4 and the Rise of the Zilart pack. This does not need to be done before obtaining the seven items. He would like any \"thuper-dee-duper\" special power items you come across, but cannot tell you where to find them.",
        "Obtain the seven items by choosing them as your reward from the Prime Avatar fights: Trial by Fire (Ifrit) for Egil's Torch, Trial by Ice (Shiva) for Rust 'B' Gone, Trial by Wind (Garuda) for Bubbly Water, Trial by Earth (Titan) for Desert Light, Trial by Lightning (Ramuh) for Elder Branch, Trial by Water (Leviathan) for Eye of Nept, and The Moonlit Path (Fenrir) for Ancients' Key.",
        "Return all seven items to Mamaulabion. They must be traded one at a time, and it is not necessary to turn in all seven at once.",
        "Wait until midnight (JST), then speak with Mamaulabion once more to receive the Evoker's Ring.",
        "The quest is only repeatable if the Evoker's Ring is dropped.",
    },

    out_nrg_stop_your_whining = {
        "Travel to Norg and enter the Buccaneer's Quarters at (J-8). You need to be level 10 or higher with Norg fame level 4 and have the Rise of the Zilart pack.",
        "Talk to Washu. He gives you an Empty Barrel, which you need to fill with Opo-opo brew found in a Yhoator Jungle tree.",
        "Examine a ??? that spawns randomly in Yhoator Jungle. Once you find it, the Empty Barrel turns into a Barrel of Opo-opo brew.",
        "Return to Washu to receive your reward, the Scroll of Hojo: Ichi, and the title Apprentice Sommelier.",
    },

    out_nrg_trial_by_water = {
        "Speak with Edal-Tahdal in Norg (H-9) to obtain the quest. You need Norg fame level 4 and the Rise of the Zilart pack; if he won't give it, keep talking to him until his text changes. Once you have the key item Tuning fork of water, you can safely undertake the quest. Each party member must have their own Tuning fork of water. Trusts can't be used.",
        "Enter the Temple of Uggalepih from Yhoator Jungle (J-12), getting a Paintbrush of souls if you don't have one. Leave by the (F-5) exit of the first map (the Survival Guide is there), follow the left wall in Yhoator Jungle back into the Temple, and continue to (I-7).",
        "Use the Paintbrush of souls on the empty Picture frame to open the door to the Den of Rancor. Faster: Den of Rancor Home Point #2; from Home Point #1, go to point A (I-5) on map 2 to reach map 1. The Unity Warp to Den of Rancor (level 128) skips the Paintbrush.",
        "On the first map of the Den of Rancor (Map C), drop down the hole at (J-7) to the sixth map (Map D) and enter the Cloister of Tides at (I-7).",
        "Defeat Leviathan Prime to receive the key item Whisper of tides.",
        "Return to Edal-Tahdal with the whisper and he offers several reward options, including the ability to summon Leviathan. You can only select one of the rewards at any time, and you may repeat this quest once per Earth day. You receive the title Heir of the Great Water.",
        "To save travel time to the Cloister, use the Mini Tuning Fork given by the quest Trial-Size Trial by Water. As long as you do not clear the level 20 version of the battlefield, you may warp to the Cloister as many times as you wish.",
    },

    out_nrg_everyones_grudge = {
        "Speak with Magephaud in Norg (I-8) to begin the quest. You need Outlands fame level 2 and the Rise of the Zilart pack, and you must have defeated a Tonberry before you can start it. He asks for three gold beastcoins if you want to learn how to rid yourself of the Tonberries' rancor.",
        "Bring Magephaud the 3 gold beastcoins. You receive the permanent key item Tonberry key (Zilart).",
        "With the Tonberry key (Zilart) you can reset your Tonberry Hate at any time: use it on the secret door at (F-11) on map 1 of the Temple of Uggalepih, where the Tonberry Priest resets your Tonberry Hate in exchange for a gil penance.",
        "The Tonberry key (Shantotto) from the A Shantotto Ascension missions is a temporary key item and does not do this. If you are having trouble resetting Tonberry Hate, you may have the wrong key item; check with Magephaud to see if he still requests the 3 beastcoins.",
    },

    out_nrg_damp_scroll = {
        "To begin this quest you first need a Damp Scroll. It can be fished up in Sea Serpent Grotto or bought at the Auction House. You need level 10 or higher, Outlands fame level 3 and the Rise of the Zilart pack.",
        "You must have the Damp Scroll in your inventory when you speak with Shivivi in Norg (J-8) to begin the quest.",
        "Take the scroll to Horlais Peak (hot springs side) and trade it to the hot springs there. This transforms the scroll into a Scroll of Jubaku: Ichi and gives you the title Cracker of the Secret Code.",
    },

    out_nrg_sahagins_stash = {
        "Speak with Laisrean in Norg (H-7) to begin the quest. You need Norg fame level 4 and the Rise of the Zilart pack. He wants something from the Sahagins' storage area in the Sea Serpent Grotto; anything will do.",
        "Exit Norg into Sea Serpent Grotto. Head south until you reach the fork at (H-6) and go east. Turn south at (J-5), head east at (J-10), and turn east at (K-12).",
        "Go past the Silver Door at (N-14): examine the door three times and trade it a Silver Beastcoin to get through. You keep the Silver Beastcoin.",
        "Fall off the path to the one below at (H-8) and continue north. Follow the path until you find the ??? at (H-3). Interacting with it gives you a Sea serpent statue.",
        "Return to Laisrean for your reward, the Scroll of Utsusemi: Ichi, and the title Treasure-House Ransacker.",
    },

    out_nrg_not_your_vault = {
        "Speak with Keal in Norg (H-8) to begin the quest. He walks around by the Survival Guide. You need to be level 5 or higher, Outlands fame level 3 and have the Rise of the Zilart pack. He wants you to bring back a sealed iron box from the Sahagin-infested Norg vault.",
        "Exit Norg into Sea Serpent Grotto. Once there, head south until you reach (H-7) and go west from there.",
        "Turn south at (F-7) and continue west, following the path as it turns north at (B-7).",
        "The ??? you are looking for is in the room at (C-5). Examine it to get the key item Sealed iron box.",
        "Return to Keal to complete the quest and receive the Scroll of Tonko: Ichi.",
    },

    out_nrg_shining_subligar = {
        "Speak with Heiji in Norg (I-7) to begin the quest. You need Norg fame level 3 and the Rise of the Zilart pack. Ten rusty subligaria are needed for the training of young ninjas, and Heiji accepts them one at a time.",
        "Obtain 10 Rusty Subligar (they are fished up) and trade them to Heiji. You do not have to trade all 10 at the same time, as he remembers how many you have traded.",
        "Once all 10 are traded you receive your reward, the Scroll of Kurayami: Ichi, and the title Looks Sublime in a Subligar.",
    },

    out_nrg_shining_leggings = {
        "Speak with Heizo in Norg (H-7) to begin the quest. You need Norg fame level 3 and the Rise of the Zilart pack. Ten pairs of rusty leggings are needed for the training of young ninjas, and Heizo accepts them one at a time.",
        "Obtain 10 Rusty Leggings (they are fished up or come from a Goblin Box) and trade them to Heizo. You do not have to trade all 10 at the same time, as he remembers how many you have traded.",
        "Once all 10 are traded you receive your reward, the Scroll of Dokumori: Ichi, and the title Looks Good in Leggings.",
    },

    out_nrg_sacred_katana = {
        "Talk to Jaucribaix in Norg (K-8), near the Captain's Chamber, while on Samurai to initiate the quest. You need to be a Samurai of level 40 or higher and have the Rise of the Zilart pack; this quest follows Forge Your Destiny. You may change to a different job to complete the rest of the quest.",
        "Travel to The Sanctuary of Zi'Tah.",
        "Kill Goblin Robber enemies to get a Sack of Fish Bait, a common drop.",
        "Trade the Fish Bait to the ??? at (E-8) to pop Isonade, a fish NM with approximately 6,100 HP.",
        "Re-examine the ??? to obtain the Handful of crystal scales.",
        "Return to Norg and trade your Mumeito to Jaucribaix to complete the quest and receive the Magoroku. If you do not have your Mumeito, Ranemaud at (I-7) can give you a new one for 30,000 gil.",
    },

    out_nrg_yomi_okuri = {
        "You must zone after completing The Sacred Katana to begin this quest. Speak with Jaucribaix in Norg (K-8). You need to be a Samurai of level 50 or higher and have the Rise of the Zilart pack. A ritual is needed to send the souls of those who died in a long-ago war to their proper resting place.",
        "Speak with Washu at (J-8).",
        "Trade Washu a Bastore Sardine, a Frost Turnip, a piece of Giant Sheep Meat and a Hecteyes Eye to receive the key item Washu's tasty wurst.",
        "Examine the ??? in Labyrinth of Onzozo (F-8) to spawn the NM Ubume, a level 60-65 Bard bird that loves Horde Lullaby. The Survival Guide lands you at (G-11), near the Buburimu Peninsula zone line; walking in from Buburimu Peninsula also works.",
        "After defeating Ubume, examine the ??? again for the key item Yomotsu feather.",
        "Return to Norg and speak with Jaucribaix.",
        "Exit Norg, re-enter, and speak with Jaucribaix to receive the key item Yomotsu Hirasaka.",
        "Examine the ??? in Valkurm Dunes at (B-7) between 18:00 and 4:00 to spawn Doman (Fomor) and Onryo (Ghost), both around level 52. The Survival Guide to Gustav Tunnel lands you just outside (B-7).",
        "After defeating them and once their corpses disappear, examine the ??? again for the key item Faded Yomotsu Hirasaka.",
        "Speak with Jaucribaix again to receive your reward, the Myochin Sune-Ate.",
    },

    out_nrg_thief_in_norg = {
        "You must zone after completing Yomi Okuri to begin this quest. Speak with Jaucribaix in Norg (K-8). You need to be a Samurai of level 50 or higher and have the Rise of the Zilart pack. At the close of the Great War, Gilgamesh's father trapped a terrible spirit within a helm, and that helm has been stolen.",
        "Speak with Sanosuke in Port Jeuno (H-8), inside the Duty Free Shop.",
        "Speak with Phoochuchu in Mhaura (H-8), on the ground level under the bridge.",
        "Examine the door on the lower level of Bastok Mines (J-6), near the Alchemy Guild. It must be closed when you examine it; if another player has it open, the cutscene doesn't trigger.",
        "Enter Waughroon Shrine through the top floor of Palborough Mines for a cutscene (Domenic's teleport also works; Home Point warp is fastest).",
        "Speak with Jaucribaix in Norg to receive a Banishing Charm.",
        "Trade the Banishing Charm to the Burning Circle in Waughroon Shrine to start a battle against three Demons: Rasetsu (DRK), Gaki (BLM) and Onki (SMN, with an elemental). All three can use their two-hour abilities; 30 minute limit, Trusts allowed.",
        "After defeating them you receive the key item Charred helm.",
        "Speak with Jaucribaix again; he requests a Gold Thread. Trade a Gold Thread to Jaucribaix.",
        "Zone out of Norg, then return to Jaucribaix for your reward, the Myochin Kabuto, and the title Paragon of Samurai Excellence. You can toss the Banishing Charm after completing the quest, as it serves no further purpose.",
    },

    out_nrg_pirate_years = {
        "Talk to Ryoma in Norg (H-8), at Home Point #1, to begin the quest, then head to Port Bastok. You need to be a Ninja of level 40 or higher, Outlands fame level 1 and the Rise of the Zilart pack; this quest follows Ayame and Kaede. Norg has begun investigating an ancient scroll that was rediscovered recently.",
        "Speak with Kagetora inside Warehouse #2 at (F-6) in Port Bastok (near Port Bastok Home Point #3).",
        "Go to (I-5) in Port Bastok and speak with Ensetsu.",
        "After speaking with Ensetsu, make your way to (H-5)/(H-6) of Eastern Altepa Desert. From this point you can continue on any job. The shortest route to the ??? is to take the Survival Guide to Western Altepa Desert and then zone to Eastern Altepa Desert.",
        "Clear the area and examine the ??? once ready. Two Tsuchigumo spiders spawn; they can't be slept.",
        "After defeating them, examine the ??? again for the Trick box. Both corpses must disappear first.",
        "Head back to Norg and speak with Ryoma to complete the quest and receive your reward, Anju and Zushio.",
    },

    out_nrg_big_box = {
        "Travel to Norg and speak with Ryoma (H-8) to receive the quest. You need to be a Ninja of level 50 or higher, Outlands fame level 1 and the Rise of the Zilart pack; this quest follows 20 in Pirate Years. If you just completed 20 in Pirate Years, you need to zone and re-enter Norg for Ryoma to begin it. The trick box you brought back has been identified as a fake, and he needs help finding the real box.",
        "Speak with Ensetsu in Port Bastok (I-5), who sends you to Leodarion.",
        "In Rabao, speak with Leodarion at (F-8), on the west side of the lake near the windmill. He asks for an Oak Pole.",
        "Buy an Oak Pole for 156 Sparks from a Records of Eminence NPC (Equ. Lv. 40-50, page 2): Rolandienne in Southern San d'Oria (G-10), Isakoth in Bastok Markets (E-11), Fhelm Jobeizat in Windurst Woods (J-10) or Eternal Flame in Western Adoulin (H-11). Trade it to Leodarion.",
        "Speak with Leodarion again on the next game day to receive the Seance staff and instructions to go to Mhaura.",
        "Once in Mhaura, take the ferry to Selbina so that you are traveling at nighttime. Suitable ferry departure times for this quest leave Mhaura at 16:00 and 0:00. On the ferry that departs at 16:00, you must wait until night time at 20:00 for the event to appear.",
        "The NM Enagakure appears on the main deck: on the 0:00 ferry it is already there (and leaves at 4:00), on the 16:00 ferry it appears at 20:00. Unload any cutscene-skipping addon first, or zoning onto the night ferry can send you straight to Selbina.",
        "Defeat Enagakure, keep at least one inventory slot free, and wait until the ferry docks in Selbina.",
        "You receive a cutscene and the Ninja Hakama, and the quest is complete. You can repeat the quest.",
    },

    out_nrg_true_will = {
        "Speak with Ryoma in Norg (H-8) to begin the quest. You need to be a Ninja of level 50 or higher and have the Rise of the Zilart pack; this quest follows I'll Take the Big Box. The Sahagin have stolen Mitsunari's treasure and hidden it somewhere in the jungle on Elshimo Island.",
        "Travel to (I-7) in Yhoator Jungle. The quickest way is Survival Guide teleportation from Elshimo Uplands to Yhoator Jungle, with one east of Home Point #1 in Norg. The Unity warp (level 122) teleports you to (J-7).",
        "Once prepared, examine the ??? at (I-7), northwest of Bloodlet Spring, to spawn 3 Sahagin NMs: Kappa Akuso (Monk), Kappa Biwa (Bard) and Kappa Bonze (White Mage).",
        "Only one of them needs to be killed, so a recommended strategy is to zone to Den of Rancor and fight one while the others despawn.",
        "After the Sahagin are defeated, examine the ??? again for the key item Old trick box. You won't get it until all three, including corpses, have despawned.",
        "Return to Ryoma for another cutscene.",
        "In Rabao, speak with Leodarion at (F-7), on the west side of the lake near the windmill.",
        "Get a Kuftal Coffer Key in Kuftal Tunnel, or buy one from the Curio Vendor Moogle. Quickest: the Survival Guide from Vollbow, or the Unity Warp (level 125) to Kuftal Tunnel.",
        "Find and open the Treasure Coffer in Kuftal Tunnel to obtain the Large trick box.",
        "Return to Leodarion to complete the quest and receive the Ninja Chainmail and the title Paragon of Ninja Excellence. You can repeat the quest.",
    },

    out_nrg_potential_within = {
        "You cannot start this quest if you have another Weapon Skill quest active; return to the person who gave it and quit it first. You need to be level 71 with a base Great Katana skill of 250 or higher.",
        "Speak with Jaucribaix in Norg (K-8). He grants you the key item Weapon Training Guide as well as the Tachi of Trials. Wield the katana to find your true potential; when the blade has lost its power, you will know you have been accepted.",
        "You need to break the latent on the Tachi of Trials. With it equipped in your main hand, fight experience-yielding monsters (Incredibly Easy Prey or higher) and perform Weapon Skills or close skillchains to accumulate 300 Trial Points.",
        "You will know the latent is broken when the elemental resistances listed in the description of the Tachi of Trials have disappeared from the elemental resistances in the equipment window.",
        "Trade the Tachi of Trials back to Jaucribaix for the key item Map to the Annals of Truth, which sends you to Kuftal Tunnel.",
        "The Unity Warp (level 125) gets you fairly close. Otherwise, with Silent Oil and Prism Powder, follow the path to the first junction and head north through the large tunnel to (I-5), then go south-east; the ??? is in this tunnel at (L-7).",
        "Examine the ??? to spawn Kettenkaefer, a beetle weak to Ice and Light. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Jaucribaix to receive your reward, the weapon skill Tachi: Kasha.",
    },

    out_nrg_bugi_soden = {
        "You cannot start this quest if you have another Weapon Skill quest active; return to the person who gave it and quit it first. You need a Ninja of level 71 and Katana skill 250 or higher, and the Rise of the Zilart pack.",
        "Speak with Ryoma in Norg (H-8). He grants you the key item Weapon Training Guide as well as the Kodachi of Trials.",
        "You need to break the latent on the Kodachi of Trials. With it equipped in your main hand, fight experience-yielding monsters (Incredibly Easy Prey or higher) and perform Weapon Skills or close skillchains to accumulate 300 Trial Points. A weapon skill with no skillchain gives 5 points and a level 1 skillchain gives 7.",
        "You will know the latent is broken when its bonus stats disappear on un-equipping and re-equipping the Kodachi of Trials; the elemental resistances also disappear from your stats.",
        "Trade the Kodachi of Trials back to Ryoma for the key item Map to the Annals of Truth, which sends you to the Labyrinth of Onzozo (the Survival Guide is fastest).",
        "Take Silent Oil and Prism Powder to the Labyrinth of Onzozo. Inside, follow the path to (H-9) and take the eastern tunnel, continue northeast through the large room and take the tunnel at (J-8). In the next large room, curve around the eastern wall to the tunnel at (H-7), head north at the next intersection, and continue north to the border of (I-5)/(I-6), where the ??? spawns the NM.",
        "Examine the ??? to spawn Megapod Megalops, a crab weak to Ice and Lightning. Defeat it and examine the ??? again for the key item Annals of Truth.",
        "Go back and speak with Ryoma to receive your reward, the weapon skill Blade: Ku.",
    },

    out_nrg_trial_size_water = {
        "You need to be a Summoner of level 20 or higher, Outlands fame level 2 and the Rise of the Zilart pack. Speak with Verctissa in Norg (H-9) to begin the quest and obtain a Mini Tuning Fork of Water.",
        "Trade the fork to the Water Protocrystal to enter the fighting arena.",
        "Defeat Leviathan Prime to complete the quest. Only Carbuncle may be used for this battle; Siren can also be used, but that seems unintended.",
        "You may re-obtain the Mini Tuning Fork from Verctissa at any point if you want to repeat the fight, but she will no longer teleport you to the Cloister.",
    },

    out_nrg_undying_pledge = {
        "Speak with Stray Cloud in Norg (H-9) for a cutscene. You need Outlands fame level 4 and the Rise of the Zilart pack. Find Stray Cloud's friend Gubokka in the Sea Serpent Grotto.",
        "Head towards Sea Serpent Grotto; you get another cutscene shortly before you reach the zone line.",
        "Once inside Sea Serpent Grotto, head to (K-6), where you find a ???. Check the ??? to spawn Glyryvilu.",
        "Defeat Glyryvilu, then check the ??? again to receive the key item Caliginous Blade.",
        "Return to Stray Cloud for your reward, the Light Buckler.",
    },

    out_nrg_border_crossing = {
        "You need to be level 75 or higher. No other Voidwatch progress is needed to start this series.",
        "Speak with Kieran in Norg (I-8) for a cutscene and the key item Ashen Stratum Abyssite.",
        "Speak with Hildegard in Kazham (F-9) to begin VW Op. 054: Elshimo List, and with Gushing Spring in Rabao (G-8), near the Nomad Moogles, to begin VW Op. 101: Detour to Zepwell. Start both before defeating their Voidwatch monsters, or the kills will not count. Speaking with them also unlocks teleports to those regions from the Atmacite Refiner.",
        "Complete both quests by defeating their six Tier I Voidwatch Notorious Monsters (three each) and reporting back to Hildegard and Gushing Spring.",
        "Return to Kieran to complete the quest.",
    },

    out_nrg_li_telor_variant = {
        "You must have completed Voidwatch Ops: Border Crossing and started Zilart Mission 14, Ark Angels.",
        "Speak with Kieran in Norg (H-8) for a cutscene.",
        "Speak with Gilgamesh in Norg (L-8) for another cutscene.",
        "Return to Kieran for a cutscene. Your key item becomes the Ashen Stratum Abyssite II and the quest is now in your log.",
        "Defeat the three Tier II Voidwatch Notorious Monsters of the Li'Telor region at their planar rifts:",
        "Cath Palug in The Sanctuary of Zi'Tah: rifts at (E-9), (F-8) and (G-10). The rift at (G-10) is close to the Survival Guide.",
        "Modron in The Boyahda Tree: rifts on Map 1 at (G-5), (K-8) and (L-9), and on Map 2 at (F-7), very close to the Unity Warp (level 125).",
        "Mimic King in Ro'Maeve: rifts at (E-7), (I-9) and (K-7).",
        "Return to Kieran to complete the quest and receive the key item Ashen Stratum Abyssite III. Skyward Ho, Voidwatcher! begins automatically.",
    },

    out_nrg_skyward_ho = {
        "This quest begins automatically when Kieran gives you the Ashen Stratum Abyssite III at the end of VW Op. 115: Li'Telor Variant.",
        "Defeat the three Tier III Voidwatch Notorious Monsters of the Tu'Lia region at their planar rifts:",
        "Aello in Ru'Aun Gardens: rifts at (G-5), (I-11) and (J-6).",
        "Qilin in The Shrine of Ru'Avitau: rifts at (F-6), (F-9) and (J-6) (the wikis disagree on whether this is Map 2 or Map 3).",
        "Uptala in Ve'Lugannon Palace: rifts at (D-5), (G-13) and (M-8).",
        "Return to Norg and speak with Kieran (H-8) first. If you speak with Gilgamesh before Kieran, you have to zone before Gilgamesh will give you the cutscene.",
        "Speak with Gilgamesh (L-8) for a cutscene to complete the quest.",
    },

    -- ========================================================
    -- OTHER OUTLANDS LOCATIONS
    -- ========================================================

    out_yut_wrath_of_opo_opos = {
        "You must first have Zilart Mission 5, Headstone Pilgrimage, active or complete, and have the Rise of the Zilart pack. The Opo-opos are not happy that you stole their \"red treasure\".",
        "Obtain a Garnet.",
        "Trade the Garnet to the Cermet Headstone in Yuhtunga Jungle (L-7) at any time during or after Zilart Mission 5 to receive an Opo-opo Necklace and the title Friend of the Opo-opos.",
    },

    out_cap_wandering_souls = {
        "You must have Zilart Mission 5, Headstone Pilgrimage, activated (or already completed), and have the Rise of the Zilart pack. Is there any way to soothe the spirits that wander about Cape Teriggan? Perhaps a Rain Lily.",
        "Obtain a Rain Lily.",
        "Trade the Rain Lily to the Cermet Headstone in Cape Teriggan (H-5) to receive a Flagellant's Rope and the title Bearer of Bonds Beyond Time.",
    },

    out_zit_soul_searching = {
        "You must first have completed Zilart Mission 7 and have the Rise of the Zilart pack.",
        "Touch the Cermet Headstone in The Sanctuary of Zi'Tah (I-7) with the key item from that mission in your possession.",
        "You receive the Bat Earring and the title Guider of Souls to the Sanctuary.",
    },

    out_sra_divine_might = {
        "Enter The Shrine of Ru'Avitau from the (H-9) entrance in Ru'Aun Gardens (the Survival Guide puts you on the way; Home Point #5 is also close). You need to have completed Zilart Mission 13. Completing this quest also counts as completing Zilart Mission 14.",
        "Head north a short way and examine the Blank Target at (G/H-11) for a cutscene, then again for how to get an Ark Pentasphere. You must flag it there, or you get no credit and need another Ark Pentasphere. Divine Might now appears in your Outlands quests log.",
        "You, or someone in your alliance, need an Ark Pentasphere: trade an Illuminink and a Parchment to the Qu'Hau Spring in Ro'Maeve (H-6) during a full moon between 18:00 and 06:00. Illuminink drops from Cursed Puppets and Magic Flagons in Ro'Maeve.",
        "Trade the Ark Pentasphere to any Shimmering Circle in La'Loff Amphitheater. Up to 18 can enter, with a 30-minute limit. Defeat Ark Angel MR, TT, EV, HM and GK; at level 99 it's easy.",
        "At level 75: bring Reraise and only raise once everyone is down and the Ark Angels have reset (they share hate); move out of the centre if you're about to die. Put a tank or kiter on each and kill them one by one, keep the pets asleep, and kill TT first (nasty spells). MR charms at least once (Fealty, light resistance, magic evasion help); GK's Meikyo Shisui aims at a Light skillchain (Utsusemi breaks it); stay out of HM's Mijin Gakure range (Barfira doesn't help); EV's Spirits Within can one-shot.",
        "Once you have finished the battle, return to the Blank Target in The Shrine of Ru'Avitau to choose your reward: the key items Shard of Apathy, Shard of Arrogance, Shard of Cowardice, Shard of Envy and Shard of Rage, and one of the following earrings: Abyssal Earring, Beastly Earring, Bushinomimi, Knight's Earring or Suppanomimi.",
        "To repeat (once per Conquest Tally): drop your earring (zone if you dropped it in the same area), then take the quest again at the Blank Target (G/H-11); it shows as a second Divine Might quest.",
        "For the repeat you also need a Light Ore: trade it to the Qu'Hau Spring during a full moon between 18:00 and 06:00 for the key item Moonlight ore (each player needs their own, and only after accepting the quest). A used Ark Pentasphere doesn't work again, so trade a new Illuminink and Parchment separately; if you trade all three together you only get the Moonlight ore.",
        "Win the battlefield again and return to the Blank Target for a new earring.",
    },

    out_ead_open_sesame = {
        "Speak with Lokpix in Eastern Altepa Desert (G-7). You need the Rise of the Zilart pack. He wants a Tremorstone plus one of: 1 Meteorite, 1 Soil Gem (Goldsmithing) or 12 Soil Geodes.",
        "A Meteorite drops from Crawlers on the Starfall Hillock in West Sarutabaruta (very rare), comes from Colonization Reives in Kamihr Drifts (needs \"Fragmenting\" from Breaking the Ice) or Outer Ra'Kaznar (needs \"Pulverizing\" from Lerene's Lament), or from a Mog Garden Mineral Vein at rank 3.",
        "The Tremorstone comes from the Cloister of Tremors in the west of Quicksand Caves; the Unity Warp (level 125) to Quicksand Caves helps, and Home Point #2 puts you just outside the Cloister.",
        "Trade Lokpix the Tremorstone and the other item together to receive the key item Loadstone. The Loadstone lets you open the weighted doors in Quicksand Caves solo, without needing multiple players.",
    },

    -- ========================================================
    -- RABAO
    -- ========================================================

    out_rab_missing_piece = {
        "Speak with Alfesar in Rabao (H-7), who asks you to help him find an Ancient tablet fragment. You need Rabao fame level 4 and the Rise of the Zilart pack.",
        "The Ancient tablet fragment is found by checking one of 5 ???s in the Quicksand Caves: (H-6), (H-10) and (E-9) on map 1, and (D-9) and (L-11) on map 2. As soon as the ??? is found, it instantly respawns in one of those 5 locations.",
        "Return to Alfesar, who gives you the Tablet of ancient magic and the Letter from Alfesar.",
        "Speak with Charlaimagnat in Northern San d'Oria (M-7).",
        "Zone and return to Charlaimagnat after one Earth minute for your reward, the Scroll of Teleport-Altep.",
    },

    out_rab_antidote = {
        "Speak with Edigey in Rabao (F-9) to begin the quest. You need Rabao fame level 4 and the Rise of the Zilart pack. He wants sand scorpion poison so he can make an antidote, an essential item for the desert caravans.",
        "Obtain a Desert Venom, which drops from Doom Scorpion enemies in Eastern Altepa Desert and Tulwar Scorpion enemies in Western Altepa Desert, or buy one at the Auction House.",
        "Trade the Desert Venom to Edigey for your reward. The first time you complete the quest you receive a Dotanuki and the title Desert Hunter; each time after that you only receive gil. You can repeat the quest.",
    },

    out_rab_trial_by_wind = {
        "Speak with Agado-Pugado in Rabao (G-9) to obtain the quest. You need Rabao fame level 6 and the Rise of the Zilart pack. Once you have the key item Tuning fork of wind, you can safely undertake the quest. Each party member must have their own Tuning fork of wind.",
        "Travel to Cape Teriggan (F-5) to enter the Cloister of Gales and ring the tuning fork upon the protocrystal.",
        "Defeat Garuda Prime to receive the key item Whisper of gales.",
        "Return to Agado-Pugado with the whisper and she offers several reward options, including the ability to summon Garuda. You can only select one of the rewards at any time, and you may repeat this quest once per Earth day. You receive the title Heir of the Great Wind. You may also keep the whisper to meet the requirements of The Moonlit Path.",
        "To save travel time to the Cloister, use the Mini Fork of Wind from Trial-Size Trial by Wind: be on Summoner as your main job, get the Mini Tuning Fork from Rahi Fohlatti, trade it back to her, and enter the Protocrystal normally. As long as you do not clear the level 20 version of the battlefield, you may warp to the Cloister as many times as you wish.",
    },

    out_rab_kuftal_tour = {
        "Speak with Datta in Rabao (F-7) to begin the quest. You need to be level 40 or lower and have the Rise of the Zilart pack. You have been asked to join a tour planned by Datta: travel to the cliff inside the entrance to Kuftal Tunnel with a party of two or more people of level forty or lower, and meet Datta's partner, Hawk Nose.",
        "Form a party with at least two people who are level 40 or lower. Trusts and Adventuring Fellows don't count, but Level Sync works.",
        "Head to Kuftal Tunnel and examine the ??? just inside the entrance for a cutscene; the whole party must be close by, or you see nothing out of the ordinary. The Survival Guide is right at this entrance; otherwise a chocobo from Rabao gets you across the desert. The only monsters near the ??? are Sand Lizards, which don't aggro.",
        "Once you get the cutscene in Kuftal Tunnel, return to Datta for your reward, 8,000 gil, and the title Kuftal Tourist. You can watch the cutscene again with the Goblin Footprint after returning to Datta.",
    },

    out_rab_immortal_lu_shang = {
        "You need a Broken Lu Shang's Rod, which you can get by breaking your own Lu Shang's Fishing Rod or buying a broken one. You need the Rise of the Zilart pack.",
        "Trade Irmilant in Rabao (G-7) the Broken Lu Shang's Rod, a Piece of Ancient Lumber and 2 Light Crystals.",
        "Irmilant repairs the rod and you receive the Lu Shang's Fishing Rod and the title The Immortal Fisher, Lu Shang. You do not need to have completed The Competition or The Rivalry to have your rod fixed. You can repeat the quest.",
    },

    out_rab_trial_size_wind = {
        "You need to be a Summoner, Rabao fame level 2 and have the Rise of the Zilart pack. Speak with Rahi Fohlatti in Rabao (G-9) to begin the quest and obtain a Mini Tuning Fork of Wind.",
        "You may prepare for the upcoming battle and, whenever you are ready, trade Rahi Fohlatti the tuning fork to be transported to the arena.",
        "Trade the fork to the Wind Protocrystal to enter the fighting arena.",
        "Defeat Garuda Prime to complete the quest. Clarsach Call is wind-elemental and gets absorbed, so do not use it.",
        "You may re-obtain the Mini Tuning Fork from Rahi Fohlatti at any point if you want to repeat the fight, but she will no longer teleport you to the Cloister.",
    },

    out_rab_chasing_dreams = {
        "First head to Rabao and talk to Rudolfo (J-7). You need to have completed Promathia Mission 2-1 and have the Chains of Promathia pack. A young cargo hauler named Sanctia has suddenly left Rabao, and Zoriboh wants you to find her; she has probably headed for Norg to board a ship bound for the Tavnazian Marquisate.",
        "Talk to Zoriboh in Rabao (F-6).",
        "Head to Norg and talk to Sohyon (J-8). Then talk to Washu to receive the key item Washu's flask.",
        "Head to Korroloka Tunnel and fill the flask at four Giant Clams: (F-10) on map 1 as you enter from Zeruhn Mines, (K-6) on map 3, (G-11) on map 5 and (I-10) on map 2. Washu's flask turns into a Flask of clam water.",
        "Return to Sohyon in Norg (J-8) for the Storeroom key, then speak with Gimb (H-9).",
        "In Port Bastok, speak with Kagetora (F-6), then trade 5 Eastern Gems to Patient Wheel (F-5). They drop from Riparian Sahagin behind the silver door in Sea Serpent Grotto.",
        "In Selbina, speak with Abelard (G-9). Then take the Swirling Vortex in the Valkurm Dunes cave at (I-9) to Lufaise Meadows for a cutscene as you zone in.",
        "Head to Rabao and talk to Zoriboh (F-6) to complete the quest and receive your reward, the Venerer Ring and 4,000 gil.",
    },

    out_rab_indomitable_spirit = {
        "To begin this quest in your log, you need the key item Serpent Rumors. It can be bought from Fennella in Port Windurst (C-8) for 95,000 Guild Points with Fishing rank Adept or higher. You can still obtain the other items needed for this quest before initiating it. You need the Rise of the Zilart pack.",
        "Get the Opal Silk and Saber Shoot by trading Liks and Gugrusauruses to Zaldon in Selbina (about a 0.5% chance each).",
        "Speak with Irmilant in Rabao (G-7). He asks you to bring the two base materials required to craft a legendary fishing rod, which seem to have found their way into the bellies of sea creatures that still elude the finest fishermen.",
        "Trade the Opal Silk and the Saber Shoot to Irmilant.",
        "Return to Irmilant after the Conquest tally to receive your reward, the Ebisu Fishing Rod. It can be re-obtained if dropped by mistake.",
    },

    out_rab_search_for_goldmane = {
        "You need to have completed Chasing Dreams and Promathia Mission 2-5, Ancient Vows. Speak with Zoriboh in Rabao (F-6) to begin the quest and receive the key item Care Package.",
        "Go to the Tavnazian Safehold and speak with Quelveuiat (I-10), on the first floor near the Altar of the Dawn, for a cutscene.",
        "Obtain a Copper Key, which drops from Riverne Vultures in Riverne - Site #A01. You also need a Giant Scale (from a Firedrake) to pass through the Unstable Displacements.",
        "In Riverne - Site #A01, go through the portals to the island at (I-11) for a cutscene, then trade the Copper Key to the Trunk there for another cutscene.",
        "Go to the Metalworks in Bastok and speak with Vladinek (H-8), in the Craftsmen's Eatery on the upper floor, for a long cutscene.",
        "Go to Bibiki Bay and take the Manaclipper to Purgonorgo Isle. Buy a ticket from Tswe Panipahr, and ask Fheli Lapatzuo (H-7) at the docks which boat is the right one. If you have Bismarck access, the Voidwatch teleport also works.",
        "Examine the Weathered Boat on the beach at (F-9) for a cutscene. The NM Rohemolipaud, an Elvaan Ranger, appears. After about 1,400 damage, or once the fight has gone on long enough, he uses Camouflage and the fight ends. Each party member who needs the quest must start the fight separately.",
        "Examine the Weathered Boat again for a cutscene and the Deluxe Carbine.",
        "Return to Zoriboh in Rabao to complete the quest and receive 3,000 gil and the title Rookie Hero Instructor.",
    },

    out_rab_fish_favors_bold = {
        "You must have completed Indomitable Spirit and have the Ebisu Fishing Rod, and you must have fished up 100 different fish. After Fisherman's Heart, Katsunaga in Mhaura (H-9) can tell you how many you have caught. You also need the Rise of the Zilart, Chains of Promathia, Treasures of Aht Urhgan, Wings of the Goddess, Seekers of Adoulin and Scars of Abyssea packs.",
        "Speak with Irmilant in Rabao (G-7) to begin the quest.",
        "Catch the five legendary fish below, in any order, and trade each one to Irmilant:",
        "Matsya: at the East Bridges in Vunkerl Inlet (S), with a Dwarf Pugil.",
        "Dragon's Tabernacle: at the Cape Teriggan seafront, with a Shrimp Lure.",
        "Quicksilver Blade: on the Silver Sea route to Nashmau or to Al Zahbi, with a Sardine Ball.",
        "Phantom Serpent: in Abyssea - Misareaux, at the seafront next to Veridical Conflux #08, with a Sea Dragon Liver (exclusive bait).",
        "Lord of Ulbuka: in Cirdas Caverns at the exit to Yorcia Weald, with a Dwarf Pugil or Rotten Meat. First you must have caught a Remora (Woh Gates pond, J-11, Minnow), an Ancient Carp (Moh Gates pond, L-6/7, Insect Ball), a Tusoteuthis Longa (Dho Gates Map 1, F/G-12, Minnow) and a Cameroceras (Sih Gates Map 2, Minnow).",
        "A fish counts once Katsunaga has it registered as caught by you, so a fish you caught earlier can be replaced with one bought from the Auction House. A Penguin, Seagull or Duck Ring makes the legendary fish much easier to land.",
        "After all five fish are accepted, trade the Ebisu Fishing Rod to Irmilant to receive the Ebisu Fishing Rod +1 and the title Exalted Fisherman.",
    },

    out_rab_thanks_for_fish = {
        "You need a Lu Shang's Fishing Rod (it can be bought; The Rivalry is not required) and to have completed the Records of Eminence objective First Step Forward.",
        "Speak with Jourdenaux in Rabao (F-8) with the rod to begin the quest.",
        "Fish up 60 different types of fish, with any rod. Fish caught before the quest count, and Katsunaga in Mhaura (H-9) can tell you how many you have. If you already have 60, Jourdenaux moves on to the next step.",
        "Speak with Jourdenaux again to unlock the Records of Eminence category Fishing > Fishing (Tenacity).",
        "Complete every objective in Fishing (Tenacity) using only Lu Shang's Fishing Rod. Lures that catch several small fish per cast, such as the Sabiki Rig, Rogue Rig and Robber Rig, count each fish toward objectives that need many catches.",
        "Trade Lu Shang's Fishing Rod to Jourdenaux to complete the quest and receive Lu Shang's Fishing Rod +1 (Rare/Ex, tagged with your server and completion number) and the title Fish Whisperer. If it breaks, Jourdenaux repairs it for an Ancient Lumber.",
    },

    out_rab_detour_to_zepwell = {
        "First start Voidwatch Ops: Border Crossing with Kieran in Norg and receive the key item Ashen Stratum Abyssite.",
        "Speak with Gushing Spring in Rabao (G-8), near the Nomad Moogles, to begin the quest. Speak with her before defeating the Voidwatch monsters below, or the kills will not count.",
        "Defeat the three Tier I Voidwatch Notorious Monsters of the Zepwell region at their planar rifts:",
        "Sabotender Campeador in the Western Altepa Desert: rifts at (G-10), (H-5) and (L-6).",
        "Tangaroa in the Kuftal Tunnel: rifts on Map 2 at (F-8) and (J-9), and on Map 3 at (I-8). The closest teleport is the Unity Warp (level 125) to Map 2.",
        "Malleator Maurok in the Quicksand Caves: rift on Map 3 at (G-9)/(F-9). Use the Unity Warp (level 125) in the Western Altepa Desert, then take Entrance 2 of the Quicksand Caves.",
        "Return to Gushing Spring to complete the quest.",
    },

}

return Q