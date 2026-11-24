-- Seekers of Adoulin quests (the Adoulin page of the quest log).
-- Local patch: own category; the GEO/RUN quests moved here from Other.

local M = {

    -- ========================================================
    -- WESTERN ADOULIN
    -- ========================================================

    {
        id = 'oth_wad_dances_with_luopans',
        name = "Dances with Luopans",
        area = 'adoulin',
        zone = "Western Adoulin",
        loc = "Western Adoulin (I-5)",
        npc = "Sylvie",
        req = "Lv.30+",
        prereq = "",
        reward = "Geomancer job, Matre Bell, Indi-Poison (Scroll)",
        items = "Petrified Log",
        tracker_area = 'adoulin',
        tracker_id = 118,
        trackable = true,
    },

    {
        id = 'oth_wad_elementary_my_dear_sylvie',
        name = "Elementary, My Dear Sylvie",
        area = 'adoulin',
        zone = "Western Adoulin",
        loc = "Western Adoulin (I-5)",
        npc = "Sylvie",
        req = "Lv.66+ GEO",
        prereq = "Dances with Luopans",
        reward = "3,000 Bayld, level cap 75",
        tracker_area = 'adoulin',
        tracker_id = 35,
        trackable = true,
    },

    {
        id = 'oth_wad_for_whom_the_bell_tolls',
        name = "For Whom the Bell Tolls",
        area = 'adoulin',
        zone = "Western Adoulin",
        loc = "Western Adoulin (I-5)",
        npc = "Sylvie",
        req = "Lv.90+ GEO",
        prereq = "Elementary, My Dear Sylvie",
        reward = "Filiae Bell, Dowser's Wand, 4,000-10,000 Bayld",
        tracker_area = 'adoulin',
        tracker_id = 36,
        trackable = true,
    },

    {
        id = 'oth_wad_bloodline_of_zacariah',
        name = "The Bloodline of Zacariah",
        area = 'adoulin',
        zone = "Western Adoulin",
        loc = "Western Adoulin (I-5)",
        npc = "Sylvie",
        req = "Lv.90+ GEO",
        prereq = "For Whom the Bell Tolls",
        reward = "Geomancy Mitaines",
        items = "3x Acuex Ore",
        tracker_area = 'adoulin',
        tracker_id = 37,
        trackable = true,
    },

    {
        id = 'oth_wad_the_communion',
        name = "The Communion",
        area = 'adoulin',
        zone = "Western Adoulin",
        loc = "Western Adoulin (I-5)",
        npc = "Sylvie",
        req = "Lv.90+ GEO",
        prereq = "The Bloodline of Zacariah",
        reward = "Geomancy Pants, up to 10,000 Bayld, title Storied Geomancer",
        tracker_area = 'adoulin',
        tracker_id = 38,
        trackable = true,
    },

    -- ========================================================
    -- EASTERN ADOULIN
    -- ========================================================

    {
        id = 'oth_ead_children_of_the_rune',
        name = "Children of the Rune",
        area = 'adoulin',
        zone = "Eastern Adoulin",
        loc = "Eastern Adoulin (I-8)",
        npc = "Octavien",
        req = "Lv.30+",
        prereq = "",
        reward = "Rune Fencer job, Sowilo Claymore",
        tracker_area = 'adoulin',
        tracker_id = 119,
        trackable = true,
    },

    {
        id = 'oth_ead_endeavoring_to_awaken',
        name = "Endeavoring to Awaken",
        area = 'adoulin',
        zone = "Eastern Adoulin",
        loc = "Eastern Adoulin (I-8)",
        npc = "Octavien",
        req = "Lv.66+ RUN",
        prereq = "Children of the Rune",
        reward = "3,000 Bayld, level cap 75",
        tracker_area = 'adoulin',
        tracker_id = 22,
        trackable = true,
    },

    {
        id = 'oth_ead_forging_new_bonds',
        name = "Forging New Bonds",
        area = 'adoulin',
        zone = "Eastern Adoulin",
        loc = "Eastern Adoulin (I-8)",
        npc = "Octavien",
        req = "Lv.90+ RUN",
        prereq = "Endeavoring to Awaken",
        reward = "Beorc Sword",
        items = "Sowilo Claymore or Elixir, Ifritite",
        tracker_area = 'adoulin',
        tracker_id = 23,
        trackable = true,
    },

    {
        id = 'oth_ead_legacies_lost_and_found',
        name = "Legacies Lost and Found",
        area = 'adoulin',
        zone = "Eastern Adoulin",
        loc = "Eastern Adoulin (I-8)",
        npc = "Octavien",
        req = "Lv.90+ RUN",
        prereq = "Forging New Bonds",
        reward = "Runeist Trousers, 6,000-22,000 Bayld",
        tracker_area = 'adoulin',
        tracker_id = 24,
        trackable = true,
    },

    {
        id = 'oth_ead_destinys_device',
        name = "Destiny's Device",
        area = 'adoulin',
        zone = "Eastern Adoulin",
        loc = "Eastern Adoulin (I-8)",
        npc = "Octavien",
        req = "Lv.90+ RUN",
        prereq = "Legacies Lost and Found",
        reward = "Runeist Coat, title Ultimate Runeist",
        tracker_area = 'adoulin',
        tracker_id = 25,
        trackable = true,
    },

    -- ========================================================
    -- RALA WATERWAYS
    -- ========================================================

    -- ========================================================
    -- CEIZAK BATTLEGROUNDS
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_cei_twitherym_dust',
        name = 'Twitherym Dust',
        area = 'adoulin',
        zone = 'Ceizak Battlegrounds',
        loc = 'Ceizak Battlegrounds (K-7)',
        npc = 'Gurren-Murren',
        req = 'Fame 1',
        prereq = '',
        reward = '1,000 EXP, 100 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 0,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_cei_to_catch_a_predator',
        name = 'To Catch a Predator',
        area = 'adoulin',
        zone = 'Ceizak Battlegrounds',
        loc = 'Ceizak Battlegrounds (H-9)',
        npc = 'Lucretia',
        req = 'Fame 1',
        prereq = '',
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 1,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_cei_empty_nest',
        name = 'Empty Nest',
        area = 'adoulin',
        zone = 'Ceizak Battlegrounds',
        loc = 'Ceizak Battlegrounds (H-7)',
        npc = 'Bataron',
        req = 'Fame 1',
        prereq = '',
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 2,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_cei_grind_to_sawdust',
        name = 'Grind to Sawdust',
        area = 'adoulin',
        zone = 'Ceizak Battlegrounds',
        loc = 'Ceizak Battlegrounds (K-7)',
        npc = 'Elmric',
        req = 'Fame 1',
        prereq = '',
        reward = 'Survival skill Logging, 500 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 53,
        trackable = true,
    },

    -- ========================================================
    -- YAHSE HUNTING GROUNDS
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_yah_dont_clam_up_on_me_now',
        name = "Don't Clam Up on Me Now",
        area = 'adoulin',
        zone = 'Yahse Hunting Grounds',
        loc = 'Yahse Hunting Grounds (K-9)',
        npc = 'Oblor',
        req = 'Fame 1',
        prereq = '',
        reward = '1,000 EXP, 100 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 5,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_yah_hop_to_it',
        name = 'Hop to It',
        area = 'adoulin',
        zone = 'Yahse Hunting Grounds',
        loc = 'Yahse Hunting Grounds (I-8)',
        npc = 'Chya Mindorah',
        req = 'Fame 1',
        prereq = '',
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 6,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_yah_boiling_over',
        name = 'Boiling Over',
        area = 'adoulin',
        zone = 'Yahse Hunting Grounds',
        loc = 'Yahse Hunting Grounds (G-7)',
        npc = 'Leautiere',
        req = 'Fame 1',
        prereq = '',
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 9,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_yah_the_whole_place_is_abuzz',
        name = 'The Whole Place Is Abuzz',
        area = 'adoulin',
        zone = 'Yahse Hunting Grounds',
        loc = 'Yahse Hunting Grounds (H-9)',
        npc = 'Rumin-Flumin',
        req = 'Fame 1',
        prereq = '',
        reward = 'Toxin resilience, 500 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 58,
        trackable = true,
    },

    -- ========================================================
    -- FORET DE HENNETIEL
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_for_poisoning_the_well',
        name = 'Poisoning the Well',
        area = 'adoulin',
        zone = 'Foret de Hennetiel',
        loc = 'Foret de Hennetiel (J-7)',
        npc = 'Fritha',
        req = 'Fame 1',
        prereq = '',
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 10,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_for_im_on_a_boat',
        name = "I'm on a Boat",
        area = 'adoulin',
        zone = 'Foret de Hennetiel',
        loc = 'Foret de Hennetiel (J-6)',
        npc = 'Choubollet',
        req = 'Fame 1',
        prereq = '',
        reward = 'Watercraft, survival skill Watercrafting, 500 Bayld',
        items = 'Dhalmel Leather x3, Umbril Ooze, Twitherym Scale',
        tracker_area = 'adoulin',
        tracker_id = 55,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_for_unsullied_lands',
        name = 'Unsullied Lands',
        area = 'adoulin',
        zone = 'Foret de Hennetiel',
        loc = 'Foret de Hennetiel (J-10)',
        npc = 'Inmot-Pinmot',
        req = 'Fame 1',
        prereq = "I'm on a Boat",
        reward = '2,000 EXP, 200 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 12,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_for_orobon_appetit',
        name = 'Orobon Appetit',
        area = 'adoulin',
        zone = 'Foret de Hennetiel',
        loc = 'Foret de Hennetiel (H-9)',
        npc = 'Nestroh',
        req = 'Fame 1',
        prereq = '',
        reward = 'Paresis resilience, 500 Bayld',
        items = 'Delectable Orobon Steak (liver)',
        tracker_area = 'adoulin',
        tracker_id = 59,
        trackable = true,
    },

    -- ========================================================
    -- MORIMAR BASALT FIELDS
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_mor_no_rime_like_the_present',
        name = 'No Rime Like the Present',
        area = 'adoulin',
        zone = 'Morimar Basalt Fields',
        loc = 'Morimar Basalt Fields (K-10)',
        npc = 'Hegnor',
        req = 'Fame 1',
        prereq = '',
        reward = '3,000 EXP, 300 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 16,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mor_a_geothermal_expedition',
        name = 'A Geothermal Expedition',
        area = 'adoulin',
        zone = 'Morimar Basalt Fields',
        loc = 'Morimar Basalt Fields (I-10)',
        npc = 'Fallion',
        req = 'Fame 1',
        prereq = '',
        reward = '3,000 EXP, 300 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 18,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mor_a_stones_throw_away',
        name = "A Stone's Throw Away",
        area = 'adoulin',
        zone = 'Morimar Basalt Fields',
        loc = 'Morimar Basalt Fields (K-10)',
        npc = 'Apolliane',
        req = 'Fame 1',
        prereq = '',
        reward = 'Survival skill Demolishing, 500 Bayld',
        items = 'Marble Nugget (mined yourself), Pickaxe',
        tracker_area = 'adoulin',
        tracker_id = 56,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mor_talk_about_wrinkly_skin',
        name = 'Talk About Wrinkly Skin',
        area = 'adoulin',
        zone = 'Morimar Basalt Fields',
        loc = 'Morimar Basalt Fields (K-10)',
        npc = 'Orsa-Porsa',
        req = '',
        prereq = '',
        reward = 'Calor resilience, 500 Bayld',
        items = 'Apkallu Egg, Felicifruit, Uleguerand Milk',
        tracker_area = 'adoulin',
        tracker_id = 60,
        trackable = true,
    },

    -- ========================================================
    -- KAMIHR DRIFTS
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_kam_breaking_the_ice',
        name = 'Breaking the Ice',
        area = 'adoulin',
        zone = 'Kamihr Drifts',
        loc = 'Kamihr Drifts (K-10)',
        npc = 'Traiffeaux',
        req = '',
        prereq = '',
        reward = 'Survival skill Fragmenting, Pair of fuzzy earmuffs, 500 Bayld',
        items = 'Rabbit Hide x3, Raaz Tusk',
        tracker_area = 'adoulin',
        tracker_id = 54,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_kam_no_love_lost',
        name = 'No Love Lost',
        area = 'adoulin',
        zone = 'Kamihr Drifts',
        loc = 'Kamihr Drifts (K-10)',
        npc = 'Peppe-Aleppe',
        req = '',
        prereq = '',
        reward = "Algor resilience, Peppe-Aleppe's superlative tonic, 500 Bayld",
        items = 'Ruszor Hide',
        tracker_area = 'adoulin',
        tracker_id = 61,
        trackable = true,
    },

    -- ========================================================
    -- MARJAMI RAVINE
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_mar_hide_and_go_peak',
        name = 'Hide and Go Peak',
        area = 'adoulin',
        zone = 'Marjami Ravine',
        loc = 'Marjami Ravine (M-7)',
        npc = 'Toppled Tree',
        req = '',
        prereq = "A Stone's Throw Away",
        reward = 'Pair of Velkk gloves, survival skill Climbing, 500 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 57,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mar_did_you_feel_that',
        name = 'Did You Feel That?',
        area = 'adoulin',
        zone = 'Marjami Ravine',
        loc = 'Marjami Ravine (M-7)',
        npc = 'Udip Ferawoh',
        req = '',
        prereq = '',
        reward = 'Restrainment resilience, 500 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 62,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mar_water_water_everywhere',
        name = 'Water, Water, Everywhere',
        area = 'adoulin',
        zone = 'Marjami Ravine',
        loc = 'Marjami Ravine (L-10)',
        npc = 'Jhen Durheka',
        req = 'Fame 4',
        prereq = 'Hide and Go Peak',
        reward = '2,000 EXP, 1,000 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 32,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_mar_it_never_goes_out_of_style',
        name = 'It Never Goes Out of Style',
        area = 'adoulin',
        zone = 'Marjami Ravine',
        loc = 'Marjami Ravine (L-7)',
        npc = 'Veldeth',
        req = 'Fame 5',
        prereq = '',
        reward = '500 EXP, 300 Bayld',
        items = 'Velkk Necklace x2 or Velkk Mask x2',
        tracker_area = 'adoulin',
        tracker_id = 31,
        trackable = true,
    },

    -- ========================================================
    -- YORCIA WEALD
    -- ========================================================

    { -- Local patch: Adoulin quests
        id = 'ado_yor_dirt_cheap',
        name = 'Dirt Cheap',
        area = 'adoulin',
        zone = 'Yorcia Weald',
        loc = 'Yorcia Weald (J-7)',
        npc = 'Mano-Amano',
        req = '',
        prereq = '',
        reward = '1,000 EXP, 500 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 33,
        trackable = true,
    },

    { -- Local patch: Adoulin quests
        id = 'ado_yor_flower_power',
        name = 'Flower Power',
        area = 'adoulin',
        zone = 'Yorcia Weald',
        loc = 'Yorcia Weald (J-7)',
        npc = 'Mano-Amano',
        req = '',
        prereq = 'Dirt Cheap',
        reward = '500 EXP, 300 Bayld',
        tracker_area = 'adoulin',
        tracker_id = 34,
        trackable = true,
    },
}

return M
