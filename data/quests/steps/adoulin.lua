local Q = {}

Q.STEPS = {
    -- GEO/RUN AF quests (BG-Wiki), moved here from Other.

    oth_wad_dances_with_luopans = { -- Local patch: GEO/RUN unlock quests
        "Speak with Sylvie in Western Adoulin at the Waterfront (I-5), Waypoint #9. You need a job at level 30 or higher.",
        "Go to the crag nearest your home nation and examine the Ergon Locus ??? beneath the stairs up to the Telepoint for the key item Fistful of homeland soil: San d'Oria, La Theine Plateau (K-8); Bastok, Konschtat Highlands; Windurst, Tahrongi Canyon (I-6).",
        "Return to Sylvie with the soil and trade her a Petrified Log to receive the key item Luopan.",
        "Go to one of these Ergon Loci: Flourishing Island, Ceizak Battlegrounds (K-10, Frontier Station); Bud of the Swarm, Ceizak Battlegrounds (I-8, Bivouac #2); Immutable Boulder, Yahse Hunting Grounds (F-6, Bivouac #2). You get the message \"You are assaulted by an uncanny sensation.\"",
        "Rest (/heal) there to charge the Luopan; it can take up to 8 minutes, until you see \"You feel a mystical warmth welling up inside you!\"",
        "Return to Sylvie to complete the quest. You receive the Matre Bell and can become a Geomancer. Don't throw the bell away before finishing Treasures of the Earth: if you toss it, Sylvie charges 300,000 gil or 150,000 Bayld before giving you the later AF and Empyrean quests (speaking to her again may let you skip paying).",
    },

    oth_wad_elementary_my_dear_sylvie = { -- Local patch: GEO/RUN unlock quests
        "With Geomancer as your main job, level 66 or higher, speak with Sylvie in Western Adoulin at the Waterfront (I-5), Waypoint #9. You also need to be on Geomancer to spawn the NM. You don't need this quest for the level cap if you've already completed New Worlds Await or later.",
        "Go to Morimar Basalt Fields (J-8), Bivouac #1, and speak with Dabnorrin to receive the key item Vessel of summoning.",
        "Head to (K-6); the entrance is at (J-6) and leads to an area not shown on the map. Examine the Primordial Convergence from the south or west to spawn Burgeoning Flames, a Fire Elemental.",
        "This is a solo fight with a 10 minute limit, and your support job is locked when it spawns (wiping your buffs). Trusts are dismissed on spawn, but you can call them again during the fight if you have Rhapsody in Umber. It only casts Fire spells (up to about 350 damage without buffs) and has under 3,800 HP; at level 119 it's trivial.",
        "Examine the Primordial Convergence again for a cutscene and your reward. If you lose, Dabnorrin sells another Vessel of summoning for 5,000 Bayld, 10 Beastmen's Seals or 50,000 gil.",
    },

    oth_wad_for_whom_the_bell_tolls = {
        "This quest follows Elementary, My Dear Sylvie and requires the Seekers of Adoulin pack. With Geomancer as your main job (level 90 or higher), speak with Sylvie at the Western Adoulin Waterfront (I-5), Waypoint #9. After this you can be on any job.",
        "Speak with Nhili Uvolep in Eastern Adoulin (I-7), at the Sverdhried Hillock Waypoint #7, for a cutscene. If she offers you the Trial Wand or the weapon skill trial instead, keep talking to her until you get the cutscene with Sylvie; no need to zone.",
        "Go to the Frontier Station in Morimar Basalt Fields (K-10) and speak with Vestavius.",
        "Head east from Bivouac #2 to the north-west corner of (J-6) in Morimar Basalt Fields and examine the Ergon Locus ??? south of the giant rock (it doesn't sparkle) for a cutscene and the key item Silver luopan. Party members helping without the key item get a one-time Bayld reward that grows with the party size.",
        "Examine the Ergon Locus ??? again to spawn Deranged Ameretat (about 75,000 HP). It uses Sweet Breath and Bad Breath, and below 50% Extremely Bad Breath, which it skips while an enfeebling Indi- or Geo- effect is up. It has very high magic evasion and resists nearly all enfeebles, including Stun; ranged Trusts such as Apururu, Semih Lafihna or Tenzen II work well.",
        "After defeating it, examine the Ergon Locus ??? a third time for a cutscene; the Silver luopan is taken from you.",
        "Return to Sylvie in Western Adoulin (I-5) for the final cutscene and your Filiae Bell, Dowser's Wand and Bayld. Wait a game day before starting The Bloodline of Zacariah.",
    },

    oth_wad_bloodline_of_zacariah = {
        "Wait until the next game day after For Whom the Bell Tolls. With Geomancer as your main job, speak with Sylvie at the Western Adoulin Waterfront (I-5), Waypoint #9. After this you can be on any job. Flagging the quest lets you commission the other three Geomancer Artifact pieces from Wescolina in Western Adoulin (H-7).",
        "Obtain 3 Acuex Ore and trade them to Sylvie. Buy them at the Auction House (Materials > Smithing) or get them from Putrid Acuex and Flatus Acuex in Cirdas Caverns.",
        "In Cirdas Caverns (M-8/9), examine the Overgrown Grave on the ground, to the right of the Ergon Locus, for a cutscene. The Augural Conveyor to Cirdas Caverns is quickest, otherwise the Yorcia Weald Frontier Station; a Colonization Reive at (M-8) may block the way.",
        "Speak with Nhili Uvolep in Eastern Adoulin (I-7), Sverdhried Hillock Waypoint #7, for a cutscene and your Geomancy Mitaines.",
    },

    oth_wad_the_communion = {
        "Wait until the next game day after The Bloodline of Zacariah. With Geomancer as your main job, speak with Sylvie at the Western Adoulin Waterfront (I-5), Waypoint #9. After this you can be on any job.",
        "Speak with Nhili Uvolep in Eastern Adoulin (I-7), Sverdhried Hillock Waypoint #7, for a cutscene and the key item Lhaiso Neftereh's bell. If you get the Trial Wand or Geomancerrific instead, talk to her twice. Cutscene-skipping addons can freeze this cutscene. Helpers without the bell get a one-time Bayld reward for the fight.",
        "Go to Cirdas Caverns (M-8/9) and examine the Overgrown Grave for a cutscene (Augural Conveyor, or the Yorcia Weald Frontier Station; clear any Colonization Reive in the way).",
        "Examine the Overgrown Grave again to spawn Ancestral Rage (about 70,000 HP). It has very high physical damage reduction (Monk's Formless Strikes doesn't work on it) and uses high-tier Earth and Dark magic, Sleepga II, area Drain and Aspir, Entomb (Petrify, Slow, hate reset) and Tenebral Crush (Defense Down). Repose and Lullaby can sleep it.",
        "After defeating it, examine the Overgrown Grave again for a cutscene.",
        "Return to Sylvie in Western Adoulin (I-5) for a final cutscene, your Geomancy Pants and the title Storied Geomancer. Lhaiso Neftereh's bell is taken from you.",
    },

    oth_ead_children_of_the_rune = { -- Local patch: GEO/RUN unlock quests
        "Speak with Octavien in Eastern Adoulin (I-8), south down the ramp from the Sverdhried Hillock waypoint. You need a job at level 30 or higher.",
        "In Yahse Hunting Grounds (K-7), examine the Yahse Wildflower at the northern end of the three beaches for the key item Yahse wildflower petal.",
        "Speak with Octavien again and choose \"Use Rune Enhancement.\" It can take anywhere from 1 to 100 attempts (he comments every 10 failures), but you can't fail permanently; keep trying.",
        "When it succeeds, you can become a Rune Fencer and receive the Sowilo Claymore. Keep the sword: Forging New Bonds needs it, or an Elixir instead.",
    },

    oth_ead_endeavoring_to_awaken = { -- Local patch: GEO/RUN unlock quests
        "With Rune Fencer as your main job, level 66 or higher, speak with Octavien in Eastern Adoulin (I-8) to receive the key item Ephemeral Endeavor. You don't need this quest for the level cap if you've already completed New Worlds Await or later.",
        "Go to Rala Waterways (M-6), entering from Eastern Adoulin (F-7). Speak with Yeggha Dolashi and examine the door behind her to enter Rala Waterways (U).",
        "Your support job is locked; Trusts are allowed if you have Rhapsody in Umber. After you climb the stairs, Zurko-Bazurko (under 1,100 HP) attacks. Sverdheid waits in the center of the arena and doesn't attack right away, so you can buff and heal.",
        "Deal about 3,700 damage to Sverdheid (about 4,000 HP) and she surrenders, giving you the key item Enlightened Endeavor. If you fail, wait a game day for another Ephemeral Endeavor, or pay Octavien 50,000 gil, 5,000 Bayld or 10 Beastmen's Seals.",
        "Return to Octavien to complete the quest.",
    },

    oth_ead_forging_new_bonds = {
        "This quest follows Endeavoring to Awaken and requires the Seekers of Adoulin pack. Zone after finishing it, then speak with Octavien in Eastern Adoulin (I-8), near the Sverdhried Hillock waypoint, as a Rune Fencer of level 90 or higher. After this you can be on any job.",
        "Optional: speak with Gaddiux at the Inventors' Coalition in Western Adoulin (J-10) about the blacksmith.",
        "In Western Adoulin (I-4), examine the Inconspicuous Barrel in the alley near the Adoulin Waterfront waypoint. Yestin-Ovestin asks for a Rune saber and a Frost-encrusted flame gem.",
        "In Rala Waterways (E-10), in the Arboretum (closest entrance is near the Western Adoulin Mog House), examine the Tomato Vantage Point for a cutscene with Jerra Ndala. Ask about the Rune saber and trade a Sowilo Claymore or an Elixir for the key item Rune saber.",
        "Ask her about the Frost-encrusted flame gem for the key item Flask of fruiserum.",
        "In Moh Gates (K-8), trade an Ifritite to the Molten Rift for a cutscene. The Morimar Frontier Station waypoint is quickest (or Yahse Bivouac #1); you must get past a Colonization Reive at (I-7). In a group, everyone trades their Ifritite before the NM is spawned.",
        "Examine the Molten Rift again to spawn Staumarth and defeat it (any job; the Apex Efts nearby don't aggro). It resists everything but Thunder and uses Spectral Floe and Scouring Spate. If you lose, just examine the Rift again; no new Ifritite needed. You receive the key item Frost-encrusted flame gem.",
        "Examine the Inconspicuous Barrel in Western Adoulin (I-4) for a cutscene; it takes the Rune saber and the gem.",
        "After a game day, examine the Inconspicuous Barrel again for a note telling you to see Octavien.",
        "Speak with Octavien for your Beorc Sword. You can now commission the other three Rune Fencer Artifact pieces at the Tomato Vantage Point in Rala Waterways (E-10).",
    },

    oth_ead_legacies_lost_and_found = {
        "Zone after finishing Forging New Bonds. As a Rune Fencer, speak with Octavien in Eastern Adoulin (I-8) for the key item Letter from Octavien.",
        "In Port Windurst (E-7), speak with Ohruru at the back of the Orastery, use Ignis, then speak with her twice more for a cutscene.",
        "Visit at least three of these eight Strange Apparatuses (often behind invisible walls). At each, use its rune three times, then examine the Hazy Rune for that rune's Stone key item: Dangruf Wadi (E-11) Unda, Stone of Unda; Gusgen Mines map 2 (J-5) Flabra, Stone of Flabra; Crawlers' Nest map 3 (K-8) Sulpor, Stone of Sulpor; Ordelle's Caves (E-12) Gelus, Stone of Gelus; Outer Horutoto Ruins map 5 (E-6) Tellus, Stone of Tellus, from the north tower in West Sarutabaruta (the Voidwatch warp lands at the right tower); Garlaige Citadel map 3 (K-8) Tenebrae, Stone of Tenebrae, behind Banishing Gate #2.",
        "The Eldieme Necropolis map 2 (K-13) is Ignis for the Stone of Ignis: drop down the westernmost hole in room D on map 1 (G-9), not the centre one. Maze of Shakhrami map 2 (L-10) is Lux for the Stone of Lux: enter from Buburimu Peninsula, not Tahrongi Canyon (the Unity Warp drops you at the entrance).",
        "Optional: three more apparatuses give a Stone of unknown runic origins for three runes in order: Fei'Yin map 1 (G-6) Ignis, Tellus, Tenebrae; Ranguemont Pass (E-4) Flabra, Ignis, Lux; King Ranperre's Tomb map 2 (E-7) Gelus, Sulpor, Unda. These don't count toward the three. Each Stone adds 2,000 Bayld to your reward.",
        "Return to Ohruru in Port Windurst and answer her questions. Rune against a spell's element: Fire Unda, Earth Flabra, Water Sulpor, Wind Gelus, Ice Ignis, Lightning Tellus, Light Tenebrae, Dark Lux. Rune for an element it can't stomach: the same element (Fire Ignis, Earth Tellus, Water Unda, Wind Flabra, Ice Gelus, Lightning Sulpor, Light Lux, Dark Tenebrae).",
        "Ailments: Paralyze/Frost Ignis; Silence/Gravity/Choke Gelus; Slow/Petrify/Rasp Flabra; Stun/Shock Tellus; Poison/Drown Sulpor; Addle/Amnesia/Plague/Disease/Burn Unda; Bane/Blind/Bio/Drain Lux; Dia/Sleep/Charm/Holy Tenebrae. Wards: reduce elemental damage Vallation, for the party Valiance, absorb it Liement, enhance resistance Pflug. She also asks which question number you're on, so keep count. You receive the key item \"Secrets of Runic Enhancement\".",
        "Speak with Octavien in Eastern Adoulin (I-8).",
        "Examine the Inconspicuous Barrel in Western Adoulin (I-4), near the Adoulin Waterfront waypoint, to hand over the Secrets of Runic Enhancement.",
        "Wait until the next game day and examine the Inconspicuous Barrel again to complete the quest and receive the Runeist Trousers.",
    },

    oth_ead_destinys_device = {
        "As a Rune Fencer, speak with Octavien in Eastern Adoulin (I-8) for the key item Runic kinegraver.",
        "Speak with Gaddiux at the Inventors' Coalition in Western Adoulin (J-10) and choose the option about Adoulinian Kelp. Then keep picking the top two options (asking if the rune stone is still there, and about the trial objectives) until he mentions the Yahse wildflower petal.",
        "Examine the Yahse Wildflower in Yahse Hunting Grounds (K-7) for the key item Yahse wildflower petal.",
        "In Marjami Ravine, go to the ??? at the base of the waterfall east of Bivouac #2 (I-8), use Ignis three times, then examine it for a cutscene and the key item Vial of vivid rainbow extract. If nothing happens, go back to Gaddiux and repeat his dialogue.",
        "Speak with Gaddiux again, choosing the Adoulinian Kelp option, for another cutscene.",
        "Speak with Octavien in Eastern Adoulin (I-8).",
        "In Foret de Hennetiel, go to the secret beach at (J-11), south of Bivouac #2, and examine the Bloodstained Glove on the shoreline for a cutscene.",
        "Once everyone has seen the cutscene, examine the Bloodstained Glove again to spawn Insidio (any job; Trusts allowed). This Orobon uses Mayhem Lantern (area Charm) and takes less physical damage each time it does, so bring magic damage and skillchains, or let Trusts hold hate while you stay out of Charm range; Tenebrae with Pflug and other Magic Evasion buffs also helps. Everyone on the quest gets Insidio's extinguished lantern; helpers who have never assisted get up to 10,000 Bayld.",
        "Optional: examine the Bloodstained Glove again after the fight.",
        "Return to Octavien to complete the quest and receive the Runeist Coat and the title Ultimate Runeist.",
        "Optional: speak with Zurko-Bazurko in Mhaura by the Proto-Waypoint for an extra cutscene; he asks for the Runic kinegraver.",
    },

    -- Ulbuka field quests (BG-Wiki).

    ado_cei_twitherym_dust = { -- Local patch: Adoulin quests
        "Speak with Gurren-Murren at the Frontier Station in Ceizak Battlegrounds (K-7).",
        "Go south to the Twinkling Tree in the northern part of (I-10) and examine it for the key item Cupful of dust-laden sap.",
        "Return to Gurren-Murren to complete the quest.",
    },

    ado_cei_to_catch_a_predator = { -- Local patch: Adoulin quests
        "Speak with Lucretia, the guard at Bivouac #1 in Ceizak Battlegrounds (H-9).",
        "Defeat Fernfelling Chapuli just south of her until you obtain the key item Mantid bait.",
        "Examine the Claw Mark just north of Lucretia (H-8) to spawn Truculent Mantis, and defeat it for the key item Flayed mantid corpse.",
        "Return to Lucretia to complete the quest.",
    },

    ado_cei_empty_nest = { -- Local patch: Adoulin quests
        "Speak with Bataron near Bivouac #2 in Ceizak Battlegrounds (H-7).",
        "Defeat eight Belaboring Wasps around Bataron. Only the ones you claim count, you don't need to be in experience range, and zoning resets the count.",
        "Return to Bataron to complete the quest.",
    },

    ado_cei_grind_to_sawdust = { -- Local patch: Adoulin quests
        "Speak with Elmric at the Frontier Station in Ceizak Battlegrounds (K-7).",
        "Take part in a Colonization Reive until you receive an evaluation; you don't need to stay until it ends. You can also do this before speaking with Elmric.",
        "Return to Elmric to complete the quest and learn the survival skill Logging.",
    },

    ado_yah_dont_clam_up_on_me_now = { -- Local patch: Adoulin quests
        "Speak with Oblor at the Frontier Station in Yahse Hunting Grounds (K-9).",
        "Examine five Shellfish on the beaches on the east side of the map, at (K-7) or (K-8). Each one may spawn an Alluring Orobon or a Startled Uragnite, which you don't have to defeat. Don't zone, or you lose the shellfish.",
        "Return to Oblor to complete the quest.",
    },

    ado_yah_hop_to_it = { -- Local patch: Adoulin quests
        "Speak with Chya Mindorah at Bivouac #1 in Yahse Hunting Grounds (I-8).",
        "Go north to the border of (I-6) and (I-7) and defeat Calfcleaving Chapuli near the ??? until you are told you are suddenly overcome with a sense of foreboding, or that the smell of bloodlust hangs thick in the air.",
        "Examine the ??? to spawn Bothersome Chapuli, and defeat it for the key item Chapuli horn.",
        "Return to Chya Mindorah to complete the quest.",
    },

    ado_yah_boiling_over = { -- Local patch: Adoulin quests
        "Speak with Leautiere at Bivouac #2 in Yahse Hunting Grounds (G-7).",
        "In Moh Gates, examine the Magma Vein at (K-5) for the key item Magma survey report. A Colonization Reive normally blocks the way; entering from the Morimar Basalt Fields Frontier Station is fastest.",
        "Return to Leautiere to complete the quest.",
    },

    ado_yah_the_whole_place_is_abuzz = { -- Local patch: Adoulin quests
        "Speak with Rumin-Flumin at Bivouac #3 in Yahse Hunting Grounds (H-9) for the key item Land of Milk and Honey hive.",
        "Go southwest to the Pollinating Swarm at (G-10). Examine it, then rest (/heal) until you have caught 10 bees, and stand up.",
        "Examine the Pollinating Swarm again for the key item Full Land of Milk and Honey hive.",
        "Speak with Ndah Tolohjin outside the Scouts' Coalition in Eastern Adoulin, near Waypoint #2, to complete the quest and receive the key item Toxin resilience.",
    },

    ado_for_poisoning_the_well = { -- Local patch: Adoulin quests
        "Speak with Fritha at the Frontier Station in Foret de Hennetiel (J-7).",
        "Go to the River Mouth at (J-9) and examine it to spawn Cunning Craklaw.",
        "Defeat it, then examine the River Mouth again for the key item Vial of toxic Zoldeff water.",
        "Return to Fritha to complete the quest.",
    },

    ado_for_im_on_a_boat = { -- Local patch: Adoulin quests
        "Speak with Choubollet at the Frontier Station in Foret de Hennetiel (J-6). He asks for 3 Dhalmel Leather, an Umbril Ooze and a Twitherym Scale.",
        "Trade him the items to receive the Watercraft. The quest isn't finished yet.",
        "Apply Sneak, then use the Watercraft at the Castoff Point on the south side of (I-7) to cross to the southern island at (J-9); sound-aggro Pugils wait on the shore. Choosing to dive right in instead gives a short cutscene and the title Toxin Tussler, which you can also get later.",
        "Use the Watercraft again on the west side of (J-9) to cross to the north bank of the river.",
        "Head north back to Choubollet to complete the quest and learn the survival skill Watercrafting.",
    },

    ado_for_unsullied_lands = { -- Local patch: Adoulin quests
        "Speak with Inmot-Pinmot at Bivouac #2 in Foret de Hennetiel (J-10). You need the survival skill Watercrafting, from I'm on a Boat.",
        "Head west toward the beach with a tree Reive, but instead of crossing it, follow the coast south to the secret beach at (J-11).",
        "Examine the Ergon Locus there for the key item Fistful of pristine sand.",
        "Return to Inmot-Pinmot to complete the quest.",
    },

    ado_for_orobon_appetit = { -- Local patch: Adoulin quests
        "Speak with Nestroh near Bivouac #3 in Foret de Hennetiel (H-9). You need a fishing rod and bait.",
        "Fish near Nestroh until you hook a Delectable Orobon, and defeat it for a Delectable Orobon Steak. The west and north shores of the island and the Castoff Point to his northwest work; a Halcyon Rod or Composite Fishing Rod with Minnow, Shell Bug or Insect Ball bait all work.",
        "Trade the steak to Nestroh. The cut you get is random (tail, stomach, cheeks, back or liver) and only the liver satisfies him, so keep fishing until you get it. The liver completes the quest and gives you the key item Paresis resilience.",
    },

    ado_mor_no_rime_like_the_present = { -- Local patch: Adoulin quests
        "Speak with Hegnor at the Frontier Station in Morimar Basalt Fields (K-10).",
        "Go to (K-7) or (K-8), near Bivouac #1, and wait for ice weather (snow or blizzards). Inthius in Eastern Adoulin forecasts the weather.",
        "During ice weather, examine the ??? on one of the trees there for the key item Rime ice fragment.",
        "Return to Hegnor to complete the quest.",
    },

    ado_mor_a_geothermal_expedition = { -- Local patch: Adoulin quests
        "Speak with Fallion at Bivouac #3 in Morimar Basalt Fields (I-10).",
        "Collect five hot spring reports from the Hot Springs at (H-7), (H-8) and (G-8); Bivouac #2 is the nearest start. Each report can only be taken during certain game hours, whatever the weather.",
        "Report 1 (any spring): 0:00-1:00, 7:00-8:00, 10:00-11:00, 17:00-18:00 or 21:00-23:00 (not at H-8 then). Report 2 (any spring): 13:00-14:00, and at times from 3:00, 5:00 and 17:00 onward.",
        "Report 3 (H-7, near Bivouac #2): 1:00-3:00, also from 11:00, 20:00 and 22:00. Report 4 (H-8, past a Colonization Reive): 10:00-11:00 or 18:00-19:00, also from 20:00 and 22:00. Report 5 (G-8, around the corner from H-8): 5:00-6:00, 10:00-11:00 or 17:00-18:00.",
        "Return to Fallion with the reports to complete the quest.",
    },

    ado_mor_a_stones_throw_away = { -- Local patch: Adoulin quests
        "Speak with Apolliane at the Frontier Station in Morimar Basalt Fields (K-10).",
        "Mine a Marble Nugget yourself at a Mining Point in Morimar Basalt Fields; a bought or traded nugget doesn't count, but one you mined before the quest does. The point at (J-11) near the zone entrance doesn't need you to pass any Bedrock Crags. Turn Ionis on to reduce mining fatigue; Floralie in the Pioneers' Coalition, Western Adoulin (E-8), sells Trailblazing Pickaxes for Bayld.",
        "Trade the Marble Nugget to Apolliane to complete the quest and learn the survival skill Demolishing.",
    },

    ado_mor_talk_about_wrinkly_skin = { -- Local patch: Adoulin quests
        "Speak with Orsa-Porsa at the Frontier Station in Morimar Basalt Fields (K-10).",
        "Trade him an Apkallu Egg, a Felicifruit and an Uleguerand Milk for the key item Hot springs care package.",
        "Go to the Hot Spring at (H-7), nearest Bivouac #2. Remove all your equipment except rings and earrings, then examine the spring for a cutscene.",
        "Return to Orsa-Porsa to complete the quest and receive the key item Calor resilience.",
    },

    ado_kam_breaking_the_ice = { -- Local patch: Adoulin quests
        "Speak with Traiffeaux at the Frontier Station in Kamihr Drifts (K-10). Choose the first option three times (ask him to speak up), then the first (you can hear him), the second (ask him to teach you the skill) and the first (show you're dedicated).",
        "Gather 3 Rabbit Hides and a Raaz Tusk. Cicatricose Raaz in Kamihr Drifts drop tusks. The Snowpelt Rabbits there don't drop hides, but Serac Rabbits in Woh Gates do, and Cletae sells them in Southern San d'Oria (D-8).",
        "Trade the four items to Traiffeaux for a cutscene, the survival skill Fragmenting and the key item Pair of fuzzy earmuffs, which let you take part in the Reives here.",
        "The cutscene can turn the screen black with Ashita or Windower loaded. If it does, restart the game; you keep the key items, but talking to him again replays the same cutscene, so start the game without Ashita to finish the quest.",
    },

    ado_kam_no_love_lost = { -- Local patch: Adoulin quests
        "Speak with Peppe-Aleppe at the Frontier Station in Kamihr Drifts (K-10).",
        "Trade him a Ruszor Hide to complete the quest and receive the key items Algor resilience and Peppe-Aleppe's superlative tonic. Slobbering Ruszor roam Kamihr Drifts (J-7); from Home Point #1 head south along the left wall.",
    },

    ado_mar_hide_and_go_peak = { -- Local patch: Adoulin quests
        "Speak with Toppled Tree at the Frontier Station in Marjami Ravine (M-7). You need the survival skill Demolishing, from A Stone's Throw Away.",
        "Go to the lower level of (K-10) and examine the Velkk Cache by a Velkk hut in the eastern part of the area for the key item Large strip of Velkk hide. The way passes three Colonization Reives at (L-9), (K-8) and (K-11) that need Demolishing; keep right after the third.",
        "Return to Toppled Tree and speak with him again to hand over the hide.",
        "Go a little west along a path to the border of (K-7) and (K-8) and examine the Scalable Area vine for a cutscene. This completes the quest and teaches you the survival skill Climbing, used on the Scalable Areas throughout Ulbuka.",
    },

    ado_mar_did_you_feel_that = { -- Local patch: Adoulin quests
        "Speak with Udip Ferawoh at the Frontier Station in Marjami Ravine (M-7).",
        "Get afflicted with Amnesia five times by Spinescent Protuberances in Marjami Ravine; the ones elsewhere don't count. There are some around (H-10), through the tunnel with the Riverscum, and one at (L-12) near Bivouac #1.",
        "When enough have counted, you are told you have learned all you can from them; if that message doesn't appear, keep getting hit. Removing your gear and Shell helps the Amnesia land, but watch out for the Velkk nearby.",
        "Return to Udip Ferawoh to complete the quest and receive the key item Restrainment resilience.",
    },

    ado_mar_water_water_everywhere = { -- Local patch: Adoulin quests
        "Speak with Jhen Durheka at Bivouac #1 in Marjami Ravine (L-10) for the key item Ravine water testing kit. Two of the samples need the survival skill Climbing, from Hide and Go Peak.",
        "Examine three ??? for water samples, in any order. The first is at (K-5), next to the Ergon Locus: head north from Bivouac #1 up the hill past a Colonization Reive, climb the vine in the tunnel ahead, then run northeast and climb down the vine to the waterfall.",
        "The second is on the east side of the river at (H-10): from Bivouac #2 head southeast through the tunnel at (J-10) and turn right as you come out, behind a bush.",
        "The third is in Dho Gates (H-9), on the west side of the stream: enter from the Marjami Ravine Frontier Station, go right at the fork, climb the vine and follow the left wall past a small pond to the river.",
        "Return to Jhen Durheka to complete the quest.",
    },

    ado_mar_it_never_goes_out_of_style = { -- Local patch: Adoulin quests
        "Speak with Veldeth near the Frontier Station in Marjami Ravine (L-7).",
        "Trade him two Velkk Necklaces or two Velkk Masks to complete the quest. You can repeat it.",
    },

    ado_yor_dirt_cheap = { -- Local patch: Adoulin quests
        "Speak with Mano-Amano at the Frontier Station in Yorcia Weald (J-7).",
        "Go to (I-8), directly west of the Cirdas Caverns entrance, and examine the ??? among the Numbing Blossoms for the key item Fistful of numbing soil. Bivouac #2 is closest; head north from there.",
        "Return to Mano-Amano to complete the quest.",
    },

    ado_yor_flower_power = { -- Local patch: Adoulin quests
        "Zone after finishing Dirt Cheap, then speak with Mano-Amano at the Frontier Station in Yorcia Weald (J-7).",
        "Defeat three Numbing Blossoms in Yorcia Weald; you get the blossoms automatically. Exactly three grow just north of the Frontier Station, on the way to Yorcia Delve, and the area at (I-8) from Dirt Cheap has plenty.",
        "Return to Mano-Amano to complete the quest. You can repeat it without zoning.",
    },
}

return Q
