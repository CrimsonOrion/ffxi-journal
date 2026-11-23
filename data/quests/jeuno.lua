local M = {}

-- ============================================================
-- JEUNO QUESTS
--
-- Source:
-- XiQlog / BG-Wiki quest data
--
-- Category:
-- Jeuno
--
-- Status is intentionally NOT stored here.
-- Status is provided by the tracker at runtime.
-- ============================================================

M.zones = {

    -- ========================================================
    -- LOWER JEUNO
    -- ========================================================

    {
        name = 'Lower Jeuno',

        quests = {

            {
                id = 'jeu_lj_the_old_monument',
                name = 'The Old Monument',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-8)',
                npc = 'Mertaire',
                req = 'Lv.30+',
                prereq = '',
                reward = 'Poetic Parchment, title Researcher of Classics',
                items = 'Parchment',
            }, -- Local patch: BRD unlock chain

            {
                id = 'jeu_lj_a_minstrel_in_despair',
                name = 'A Minstrel in Despair',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-8)',
                npc = 'Mertaire',
                req = 'Lv.30+',
                prereq = 'The Old Monument',
                reward = '2,100 gil',
                items = 'Poetic Parchment',
            }, -- Local patch: BRD unlock chain

            {
                id = 'jeu_lj_path_of_the_bard',
                name = 'Path of the Bard',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-8)', -- Local patch: was (I-8)/Mertaire
                npc = 'Bki Tbujhja',
                req = 'Lv.30+',
                prereq = 'A Minstrel in Despair',
                reward = 'Bard job, title Wandering Minstrel',
            },

            {
                id = 'jeu_lj_save_my_son',
                name = 'Save My Son',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (G-11)',
                npc = "Merchant's House door",
                req = 'Lv.30+, Fame req unknown',
                prereq = "Chocobo's Wounds",
                reward = 'Beast Whistle, 2,100 gil',
            },

            {
                id = 'jeu_lj_painful_memory',
                name = "Painful Memory",
                area = 'jeuno',
                zone = "Lower Jeuno",
                loc = "Lower Jeuno (H-8)",
                npc = "Mertaire",
                req = "Lv.40+ BRD",
                prereq = "Path of the Bard",
                reward = "Paper Knife",
                repeatable = true,
            },

            {
                id = 'jeu_lj_the_requiem',
                name = "The Requiem",
                area = 'jeuno',
                zone = "Lower Jeuno",
                loc = "Lower Jeuno (H-8)",
                npc = "Bki Tbujhja",
                req = "Lv.50+ BRD, Rise of Zilart required",
                prereq = "Painful Memory",
                reward = "Choral Slippers",
                repeatable = true,
                items = "Holy Water",
            },

            {
                id = 'jeu_lj_a_new_dawn',
                name = "A New Dawn",
                area = 'jeuno',
                zone = "Lower Jeuno",
                loc = "Lower Jeuno (G-11)",
                npc = "Merchant's House door",
                req = "Lv.50+ BST",
                prereq = "Scattered Into Shadow",
                reward = "Beast Trousers",
                repeatable = true,
                items = "Mahogany Lumber",
            },

            {
                id = 'jeu_lj_fistful_of_fury',
                name = 'Fistful of Fury',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-8)',
                npc = 'Vola',
                req = 'Fame 3 (Norg)',
                fame_area = 'norg',
                prereq = 'Silence of the Rams',
                reward = 'Brown Belt, title Brown Belt',
                items = 'Nue Fang, Dodo Skin, Morbolger Vine',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_beat_around_the_bushin',
                name = 'Beat Around the Bushin',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-8)',
                npc = 'Vola',
                req = 'Lv.71+ MNK, Fame 6 (Norg)',
                fame_area = 'norg',
                prereq = 'Fistful of Fury',
                reward = 'Black Belt, title Black Belt',
                items = 'Wyrm Beard, Behemoth Tongue, Adamantoise Egg, Brown Belt',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_save_the_clock_tower',
                name = 'Save the Clock Tower',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-7)',
                npc = 'Derrick',
                req = 'Fame 5',
                prereq = 'A Clock Most Delicate',
                reward = 'Title Clock Tower Preservationist',
                items = 'Tower Petition',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_the_wonder_magic_set',
                name = 'The Wonder Magic Set',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (G-10)',
                npc = 'Panta-Putta',
                req = 'Fame 4',
                prereq = '',
                reward = "Mythril Earring, title Fool's Errand Runner",
                items = 'Wonder Magic Set',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_your_crystal_ball',
                name = 'Your Crystal Ball',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-7)',
                npc = 'Kurou-Morou',
                req = 'Fame 2',
                prereq = '',
                reward = 'Fortune telling, title Fortune-teller in Training',
                items = 'Ahriman Lens, Divination Sphere',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_collect_tarut_cards',
                name = 'Collect Tarut Cards',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-8)',
                npc = 'Chululu',
                req = 'Fame 2',
                prereq = '',
                reward = 'Fortune telling',
                items = 'Tarut: Death, Tarut: The Hermit, Tarut: The King, Tarut: The Fool',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_rubbish_day',
                name = 'Rubbish Day',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-8)',
                npc = 'Chululu',
                req = 'Fame 4',
                prereq = 'Collect Tarut Cards',
                reward = '6,000 gil, Chain Choker, title Street Sweeper',
                items = 'Magic Trash, Garlaige Key',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_never_to_return',
                name = 'Never to Return',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-7)',
                npc = 'Kurou-Morou',
                req = 'Fame 5',
                prereq = 'Your Crystal Ball',
                reward = '1,200 gil, Garnet Ring',
                items = 'Horn Hairpin',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_community_service',
                name = 'Community Service',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-6)',
                npc = 'Zauko',
                req = 'Fame 1',
                prereq = '',
                reward = "Jeuno fame, title Torchbearer; Lamp Lighter's Membership Card the second time",
                repeatable = true,
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_cooks_pride',
                name = "Cook's Pride",
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-10)',
                npc = 'Naruru',
                req = 'Fame 4',
                prereq = 'The Wonder Magic Set',
                reward = '3,000 gil, Mythril Ring, title Mercy Errand Runner',
                items = 'Super Soup Pot',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_tenshodo_membership',
                name = 'Tenshodo Membership',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-7)',
                npc = 'Ghebi Damomohe',
                req = 'Fame 3',
                prereq = '',
                reward = "Tenshodo Member's Card",
                items = 'Tenshodo Invite, Tenshodo Application Form',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_deal_with_tenshodo',
                name = 'Deal with Tenshodo',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-7)',
                npc = 'Garnev',
                req = 'A Clock Most Delicate active',
                prereq = '',
                reward = 'Key item Clock Tower Oil, title Trader of Renown',
                items = 'Gold Orcmask',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_1',
                name = 'The Gobbiebag Part I',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 1',
                prereq = '',
                reward = 'Inventory increased to 35 slots',
                items = 'Dhalmel Leather, Steel Ingot, Linen Cloth, Peridot, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_2',
                name = 'The Gobbiebag Part II',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 1',
                prereq = 'The Gobbiebag Part I',
                reward = 'Inventory increased to 40 slots',
                items = 'Ram Leather, Mythril Ingot, Wool Cloth, Turquoise, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_3',
                name = 'The Gobbiebag Part III',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 1',
                prereq = 'The Gobbiebag Part II',
                reward = 'Inventory increased to 45 slots',
                items = 'Tiger Leather, Gold Ingot, Velvet Cloth, Painite, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_4',
                name = 'The Gobbiebag Part IV',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 1',
                prereq = 'The Gobbiebag Part III',
                reward = 'Inventory increased to 50 slots',
                items = 'Cermet Chunk, Darksteel Ingot, Silk Cloth, Goshenite, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_mysteries_of_beadeaux_1',
                name = 'Mysteries of Beadeaux I',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-8)',
                npc = 'Sattal-Mansal',
                req = 'Mission 4-1 (any nation)',
                prereq = '',
                reward = 'Key item Coruscant Rosary',
                items = 'Quadav Charm',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_mysteries_of_beadeaux_2',
                name = 'Mysteries of Beadeaux II',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-8)',
                npc = 'Sattal-Mansal',
                req = 'Mission 4-1 (any nation)',
                prereq = '',
                reward = 'Key item Black Matinee Necklace',
                items = 'Quadav Augury Shell',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_the_goblin_tailor',
                name = 'The Goblin Tailor',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-10)',
                npc = 'Guttrix',
                req = 'Fame 3, Lv.10+',
                prereq = '',
                reward = 'Race-specific armor (RSE) piece of your choice',
                items = 'Magical Pattern',
                repeatable = true,
            }, -- Local patch: Jeuno quests
        },
    },

    -- ========================================================
    -- UPPER JEUNO
    -- ========================================================

    {
        name = 'Upper Jeuno',

        quests = {

            {
                id = 'jeu_uj_axe_the_competition',
                name = 'Axe the Competition',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = 'Axe skill 240+, Lv.71',
                prereq = '',
                reward = 'Decimation weapon skill',
            },

            {
                id = 'jeu_uj_chocobo_on_the_loose',
                name = 'Chocobo on the Loose!',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = '',
                prereq = '',
                reward = 'Chocobo Egg (raise for rental/riding)',
            },

            {
                id = 'jeu_uj_chocobos_wounds',
                name = "Chocobo's Wounds",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = 'Lv.20+',
                prereq = '',
                reward = 'Chocobo license (Key Item)',
                items = 'Gausebit Wildgrass',
            },

            {
                id = 'jeu_uj_path_of_the_beastmaster',
                name = 'Path of the Beastmaster',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = 'Lv.30+',
                prereq = "Chocobo's Wounds, Save My Son",
                reward = 'Beastmaster job',
            },

            {
                id = 'jeu_uj_wings_of_gold',
                name = 'Wings of Gold',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = 'Lv.40+ BST',
                prereq = 'Path of the Beastmaster',
                reward = 'Barbaroi Axe',
            },

            {
                id = 'jeu_uj_scattered_into_shadow',
                name = 'Scattered Into Shadow',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Brutus',
                req = 'Lv.50+ BST',
                prereq = 'Wings of Gold',
                reward = 'Beast Gaiters',
                items = 'Beast Collar',
            },

            {
                id = 'jeu_uj_borghertz_calling_hands',
                name = "Borghertz's Calling Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ SMN, Rise of Zilart required',
                prereq = 'Class Reunion',
                reward = "Evoker's Bracers",
            },

            {
                id = 'jeu_uj_borghertz_chasing_hands',
                name = "Borghertz's Chasing Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ RNG',
                prereq = 'Fire and Brimstone',
                reward = "Hunter's Bracers",
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_dragon_hands',
                name = "Borghertz's Dragon Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ DRG, Rise of Zilart required',
                prereq = 'Chasing Quotas',
                reward = 'Drachen Finger Gauntlets',
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_harmonious_hands',
                name = "Borghertz's Harmonious Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ BRD',
                prereq = 'The Requiem',
                reward = 'Choral Cuffs',
            },

            {
                id = 'jeu_uj_borghertz_healing_hands',
                name = "Borghertz's Healing Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ WHM',
                prereq = 'Prelude of Black and White',
                reward = "Healer's Mitts",
            },

            {
                id = 'jeu_uj_borghertz_loyal_hands',
                name = "Borghertz's Loyal Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ SAM, Rise of Zilart required',
                prereq = 'Yomi Okuri',
                reward = 'Myochin Kote',
            },

            {
                id = 'jeu_uj_borghertz_lurking_hands',
                name = "Borghertz's Lurking Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = "Lv.50+ NIN, Rise of Zilart required",
                prereq = "I'll Take the Big Box",
                reward = 'Ninja Tekko',
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_shadowy_hands',
                name = "Borghertz's Shadowy Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ DRK',
                prereq = 'Dark Puppet',
                reward = 'Chaos Gauntlets',
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_sneaky_hands',
                name = "Borghertz's Sneaky Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ THF',
                prereq = 'As Thick as Thieves',
                reward = "Rogue's Armlets",
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_sorcerous_hands',
                name = "Borghertz's Sorcerous Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ BLM',
                prereq = 'Recollections',
                reward = "Wizard's Gloves",
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_stalwart_hands',
                name = "Borghertz's Stalwart Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ PLD, Rise of Zilart required',
                prereq = "A Boy's Dream",
                reward = 'Gallant Gauntlets',
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_striking_hands',
                name = "Borghertz's Striking Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ MNK',
                prereq = 'The First Meeting',
                reward = 'Temple Gloves',
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_vermillion_hands',
                name = "Borghertz's Vermillion Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ RDM',
                prereq = 'Enveloped in Darkness',
                reward = "Warlock's Gloves",
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_warring_hands',
                name = "Borghertz's Warring Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ WAR',
                prereq = "The Talekeeper's Truth",
                reward = "Fighter's Mufflers",
                repeatable = true,
            },

            {
                id = 'jeu_uj_borghertz_wild_hands',
                name = "Borghertz's Wild Hands",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-8)',
                npc = 'Guslam',
                req = 'Lv.50+ BST',
                prereq = 'Scattered Into Shadow',
                reward = 'Beast Gloves',
                repeatable = true,
                no_chain_indent = true,
            },

            {
                id = 'jeu_uj_lakeside_minuet',
                name = "Lakeside Minuet",
                area = 'jeuno',
                zone = "Upper Jeuno",
                loc = "Upper Jeuno (G-7)",
                npc = "Laila",
                req = "Lv.30+, Wings of the Goddess required",
                prereq = "",
                reward = "Dancer job",
            },

            {
                id = 'jeu_uj_unfinished_waltz',
                name = "The Unfinished Waltz",
                area = 'jeuno',
                zone = "Upper Jeuno",
                loc = "Upper Jeuno (G-7)",
                npc = "Laila",
                req = "Lv.40+ DNC",
                prereq = "Lakeside Minuet",
                reward = "War Hoop",
                repeatable = true,
            },

            {
                id = 'jeu_uj_road_to_divadom',
                name = "The Road to Divadom",
                area = 'jeuno',
                zone = "Upper Jeuno",
                loc = "Upper Jeuno (G-7)",
                npc = "Laila",
                req = "Lv.50+ DNC",
                prereq = "The Unfinished Waltz",
                reward = "Dancer's Tights",
                repeatable = true,
                items = "Block of Yagudo Glue",
            },

            {
                id = 'jeu_uj_comeback_queen',
                name = "Comeback Queen",
                area = 'jeuno',
                zone = "Upper Jeuno",
                loc = "Upper Jeuno (G-7)",
                npc = "Laila",
                req = "Lv.50+ DNC",
                prereq = "The Road to Divadom",
                reward = "Dancer's Casaque",
                repeatable = true,
            },

            {
                id = 'jeu_uj_crest_of_davoi',
                name = 'Crest of Davoi',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Baudin',
                req = 'Rank 4 mission (any nation), Fame 1',
                prereq = '',
                reward = 'Key item Crest of Davoi',
                items = 'Coeurl Meat',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_save_my_sister',
                name = 'Save My Sister',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Baudin',
                req = 'Rank 4 mission (any nation), Fame 4',
                prereq = 'Crest of Davoi',
                reward = 'Holy Mace, 3,000 gil, title Exorcist in Training',
                items = "Ducal Guard's Lantern",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_clock_most_delicate',
                name = 'A Clock Most Delicate',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Collet',
                req = 'Fame 5',
                prereq = '',
                reward = "1,200 gil, Engineer's Gloves, title Professional Loafer",
                items = 'Clock Tower Oil',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_candlelight_vigil',
                name = 'A Candlelight Vigil',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Ilumida',
                req = 'Fame 4',
                prereq = '',
                reward = 'Flower Necklace, title Activist for Kindness',
                items = 'Holy Candle',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_the_kind_cardian',
                name = 'The Kind Cardian',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-10)',
                npc = 'Panta-Putta',
                req = 'Fame 4',
                prereq = 'The Lost Cardian',
                reward = 'Green Cape, title Bringer of Bliss',
                items = 'Two of Swords, Ten of Cups',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_the_lost_cardian',
                name = 'The Lost Cardian',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-10)',
                npc = 'Monberaux',
                req = 'Fame 4',
                prereq = "Cook's Pride",
                reward = "2,100 gil, key item Two of Swords, title Two's Company",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_the_clockmaster',
                name = 'The Clockmaster',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Galmut',
                req = 'Fame 5',
                prereq = 'Save the Clock Tower',
                reward = 'Time Hammer, 1,200 gil, title Timekeeper',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_candle_making',
                name = 'Candle-making',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-9)',
                npc = 'Rouliette',
                req = 'Fame 4',
                prereq = '',
                reward = 'Key item Holy Candle, title Believer of Altana',
                items = 'Lanolin Cube',
            }, -- Local patch: Jeuno quests
        },
    },

    -- ========================================================
    -- PORT JEUNO
    -- ========================================================

    {
        name = 'Port Jeuno',

        quests = {

            {
                id = 'jeu_pj_circle_of_time',
                name = 'The Circle of Time',
                area = 'jeuno',
                zone = 'Port Jeuno',
                loc = 'Port Jeuno (E-6)',
                npc = 'Imasuke',
                req = 'Lv.50+ BRD, Rise of Zilart required',
                prereq = 'The Requiem',
                reward = 'Choral Justaucorps',
                repeatable = true,
            },

            {
                id = 'jeu_pj_antique_collector',
                name = 'The Antique Collector',
                area = 'jeuno',
                zone = 'Port Jeuno',
                loc = 'Port Jeuno (E-6)',
                npc = 'Imasuke',
                req = 'Fame 2',
                prereq = '',
                reward = "Map of Delkfutt's Tower",
                items = 'Kaiser Sword',
            },

            {
                id = 'jeu_pj_childs_play',
                name = "Child's Play",
                area = 'jeuno',
                zone = 'Port Jeuno',
                loc = 'Port Jeuno (H-8)',
                npc = 'Karl',
                req = 'Fame 4, The Wonder Magic Set active',
                prereq = '',
                reward = 'Key item Wonder Magic Set, title Trader of Mysteries',
                items = 'White Rock',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_pj_pretty_little_things',
                name = 'Pretty Little Things',
                area = 'jeuno',
                zone = 'Port Jeuno',
                loc = 'Port Jeuno (E-8)',
                npc = 'Zona Shodhun',
                req = 'Fame 1',
                prereq = '',
                reward = 'Mog House exit to any Jeuno area',
                items = 'Yellow Rock',
            }, -- Local patch: Jeuno quests
        },
    },

    -- ========================================================
    -- RU'Lude Gardens
    -- ========================================================

    {
        name = "Ru'Lude Gardens",

        quests = {

            {
                id = 'jeu_rg_northward',
                name = 'Northward',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-9)",
                npc = 'Radeivepart',
                req = 'Fame 4',
                prereq = '',
                reward = 'Map of Castle Zvahl',
                items = 'Flame Degen',
            },

            {
                id = 'jeu_rg_defiant_challenge',
                name = 'In Defiant Challenge',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Lv.50+',
                prereq = '',
                reward = 'Raises level cap to 55',
                items = 'Bomb Coal, Exoray Mold, Piece of Ancient Papyrus',
            },

            {
                id = 'jeu_rg_highest_mountains',
                name = 'Atop the Highest Mountains',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Lv.51+',
                prereq = 'In Defiant Challenge',
                reward = 'Raises level cap to 60',
            },

            {
                id = 'jeu_rg_whence_blows_wind',
                name = 'Whence Blows the Wind',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Lv.56+',
                prereq = 'Atop the Highest Mountains',
                reward = 'Raises level cap to 65',
            },

            {
                id = 'jeu_rg_riding_on_clouds',
                name = 'Riding on the Clouds',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Lv.61+',
                prereq = 'Whence Blows the Wind',
                reward = 'Raises level cap to 70',
                items = "Kindred's Seal",
            },

            {
                id = 'jeu_rg_shattering_stars',
                name = 'Shattering Stars',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Lv.66+',
                prereq = 'Riding on the Clouds',
                reward = 'Raises level cap to 75',
            },

            {
                id = 'jeu_rg_beyond_the_sun',
                name = 'Beyond the Sun',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Maat',
                req = 'Rise of Zilart required, defeat Maat on all 15 pre-ToAU jobs',
                prereq = 'Shattering Stars',
                reward = "Maat's Cap",
            },

            {
                id = 'jeu_rg_storms_of_fate',
                name = 'Storms of Fate',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (walk toward the Ducal Chamber)",
                npc = "Esha'ntarl",
                req = 'Promathia Mission 8-4 required',
                prereq = '',
                reward = 'Whisper of the Wyrmking (Key Item)',
            },

            {
                id = 'jeu_rg_shadows_of_the_departed',
                name = 'Shadows of the Departed',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (walk toward the Ducal Chamber)",
                npc = "Esha'ntarl",
                req = '',
                prereq = 'Storms of Fate',
                reward = 'Promyvion - Holla/Dem/Mea slivers',
            },

            {
                id = 'jeu_rg_apocalypse_nigh',
                name = 'Apocalypse Nigh',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (walk toward the Ducal Chamber)",
                npc = "Esha'ntarl",
                req = 'Zilart Mission 17 and Promathia Mission 8-4 required',
                prereq = 'Shadows of the Departed',
                reward = 'Ethereal/Hollow/Magnetic/Static Earring (choice)',
                repeatable = true,
            },

            {
                id = 'jeu_rg_ducal_hospitality',
                name = 'Ducal Hospitality',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (I-7)",
                npc = 'Taillegeas',
                req = 'Promathia Mission 3-2 required, Fame 4',
                prereq = '',
                reward = '4,000 gil (repeatable turn-in)',
                repeatable = true,
            },

            {
                id = 'jeu_rg_empty_memories',
                name = 'Empty Memories',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Harith',
                req = '',
                prereq = 'Six Recollection quests (Pain, Fear, Guilt, Suffering, Anxiety, Animosity)',
                reward = 'Anima or weapon/accessory (repeatable trade-in)',
                repeatable = true,
            },
        },
    },
}

-- ============================================================
-- QUEST TRACKER DATA
--
-- Mapeamento baseado no FFXI_QUEST_ID do XiQlog.
--
-- area = área do quest log enviado pelo servidor.
-- bit  = bit do quest dentro dessa área.
-- ============================================================

local tracker_data = {

    -- --------------------------------------------------------
    -- LOWER JEUNO
    -- --------------------------------------------------------

    jeu_lj_path_of_the_bard = {
        area = 'jeuno',
        bit = 20,
    },

    jeu_lj_save_my_son = {
        area = 'jeuno',
        bit = 5,
    },

    jeu_lj_painful_memory = {
        area = 'jeuno',
        bit = 63,
    },

    jeu_lj_the_requiem = {
        area = 'jeuno',
        bit = 64,
    },

    jeu_lj_a_new_dawn = {
        area = 'jeuno',
        bit = 62,
    },

    jeu_lj_fistful_of_fury = {
        area = 'jeuno',
        bit = 41,
    },

    jeu_lj_beat_around_the_bushin = {
        area = 'jeuno',
        bit = 67,
    },

    jeu_lj_the_old_monument = {
        area = 'jeuno',
        bit = 11,
    },

    jeu_lj_a_minstrel_in_despair = {
        area = 'jeuno',
        bit = 12,
    },

    jeu_uj_crest_of_davoi = {
        area = 'jeuno',
        bit = 0,
    },

    jeu_uj_save_my_sister = {
        area = 'jeuno',
        bit = 1,
    },

    jeu_uj_a_clock_most_delicate = {
        area = 'jeuno',
        bit = 2,
    },

    jeu_lj_save_the_clock_tower = {
        area = 'jeuno',
        bit = 3,
    },

    jeu_uj_a_candlelight_vigil = {
        area = 'jeuno',
        bit = 6,
    },

    jeu_lj_the_wonder_magic_set = {
        area = 'jeuno',
        bit = 7,
    },

    jeu_uj_the_kind_cardian = {
        area = 'jeuno',
        bit = 8,
    },

    jeu_lj_your_crystal_ball = {
        area = 'jeuno',
        bit = 9,
    },

    jeu_lj_collect_tarut_cards = {
        area = 'jeuno',
        bit = 10,
    },

    jeu_lj_rubbish_day = {
        area = 'jeuno',
        bit = 13,
    },

    jeu_lj_never_to_return = {
        area = 'jeuno',
        bit = 14,
    },

    jeu_lj_community_service = {
        area = 'jeuno',
        bit = 15,
    },

    jeu_lj_cooks_pride = {
        area = 'jeuno',
        bit = 16,
    },

    jeu_lj_tenshodo_membership = {
        area = 'jeuno',
        bit = 17,
    },

    jeu_uj_the_lost_cardian = {
        area = 'jeuno',
        bit = 18,
    },

    jeu_uj_the_clockmaster = {
        area = 'jeuno',
        bit = 21,
    },

    jeu_uj_candle_making = {
        area = 'jeuno',
        bit = 22,
    },

    jeu_pj_childs_play = {
        area = 'jeuno',
        bit = 23,
    },

    jeu_lj_deal_with_tenshodo = {
        area = 'jeuno',
        bit = 26,
    },

    jeu_lj_gobbiebag_1 = {
        area = 'jeuno',
        bit = 27,
    },

    jeu_lj_gobbiebag_2 = {
        area = 'jeuno',
        bit = 28,
    },

    jeu_lj_gobbiebag_3 = {
        area = 'jeuno',
        bit = 29,
    },

    jeu_lj_gobbiebag_4 = {
        area = 'jeuno',
        bit = 30,
    },

    jeu_lj_mysteries_of_beadeaux_1 = {
        area = 'jeuno',
        bit = 31,
    },

    jeu_lj_mysteries_of_beadeaux_2 = {
        area = 'jeuno',
        bit = 32,
    },

    jeu_lj_the_goblin_tailor = {
        area = 'jeuno',
        bit = 42,
    },

    jeu_pj_pretty_little_things = {
        area = 'jeuno',
        bit = 43,
    },

    -- --------------------------------------------------------
    -- UPPER JEUNO
    -- --------------------------------------------------------

    jeu_uj_axe_the_competition = {
        area = 'jeuno',
        bit = 59,
    },

    jeu_uj_chocobo_on_the_loose = {
        area = 'jeuno',
        bit = 92,
    },

    jeu_uj_chocobos_wounds = {
        area = 'jeuno',
        bit = 4,
    },

    jeu_uj_path_of_the_beastmaster = {
        area = 'jeuno',
        bit = 19,
    },

    jeu_uj_wings_of_gold = {
        area = 'jeuno',
        bit = 60,
    },

    jeu_uj_scattered_into_shadow = {
        area = 'jeuno',
        bit = 61,
    },

    jeu_uj_borghertz_calling_hands = {
        area = 'jeuno',
        bit = 58,
    },

    jeu_uj_borghertz_chasing_hands = {
        area = 'jeuno',
        bit = 54,
    },

    jeu_uj_borghertz_dragon_hands = {
        area = 'jeuno',
        bit = 57,
    },

    jeu_uj_borghertz_harmonious_hands = {
        area = 'jeuno',
        bit = 53,
    },

    jeu_uj_borghertz_healing_hands = {
        area = 'jeuno',
        bit = 46,
    },

    jeu_uj_borghertz_loyal_hands = {
        area = 'jeuno',
        bit = 55,
    },

    jeu_uj_borghertz_lurking_hands = {
        area = 'jeuno',
        bit = 56,
    },

    jeu_uj_borghertz_shadowy_hands = {
        area = 'jeuno',
        bit = 51,
    },

    jeu_uj_borghertz_sneaky_hands = {
        area = 'jeuno',
        bit = 49,
    },

    jeu_uj_borghertz_sorcerous_hands = {
        area = 'jeuno',
        bit = 47,
    },

    jeu_uj_borghertz_stalwart_hands = {
        area = 'jeuno',
        bit = 50,
    },

    jeu_uj_borghertz_striking_hands = {
        area = 'jeuno',
        bit = 45,
    },

    jeu_uj_borghertz_vermillion_hands = {
        area = 'jeuno',
        bit = 48,
    },

    jeu_uj_borghertz_warring_hands = {
        area = 'jeuno',
        bit = 44,
    },

    jeu_uj_borghertz_wild_hands = {
        area = 'jeuno',
        bit = 52,
    },

    jeu_uj_lakeside_minuet = {
        area = 'jeuno',
        bit = 95,
    },

    jeu_uj_unfinished_waltz = {
        area = 'jeuno',
        bit = 96,
    },

    jeu_uj_road_to_divadom = {
        area = 'jeuno',
        bit = 97,
    },

    jeu_uj_comeback_queen = {
        area = 'jeuno',
        bit = 98,
    },

    -- --------------------------------------------------------
    -- PORT JEUNO
    -- --------------------------------------------------------

    jeu_pj_circle_of_time = {
        area = 'jeuno',
        bit = 65,
    },

    jeu_pj_antique_collector = {
        area = 'jeuno',
        bit = 25,
    },

    -- --------------------------------------------------------
    -- RU'LUDE GARDENS
    -- --------------------------------------------------------

    jeu_rg_northward = {
        area = 'jeuno',
        bit = 24,
    },

    jeu_rg_defiant_challenge = {
        area = 'jeuno',
        bit = 128,
    },

    jeu_rg_highest_mountains = {
        area = 'jeuno',
        bit = 129,
    },

    jeu_rg_whence_blows_wind = {
        area = 'jeuno',
        bit = 130,
    },

    jeu_rg_riding_on_clouds = {
        area = 'jeuno',
        bit = 131,
    },

    jeu_rg_shattering_stars = {
        area = 'jeuno',
        bit = 132,
    },

    jeu_rg_beyond_the_sun = {
        area = 'jeuno',
        bit = 76,
    },

    jeu_rg_storms_of_fate = {
        area = 'jeuno',
        bit = 86,
    },

    jeu_rg_shadows_of_the_departed = {
        area = 'jeuno',
        bit = 88,
    },

    jeu_rg_apocalypse_nigh = {
        area = 'jeuno',
        bit = 89,
    },

    jeu_rg_ducal_hospitality = {
        area = 'jeuno',
        bit = 68,
    },

    jeu_rg_empty_memories = {
        area = 'jeuno',
        bit = 70,
    },
}

-- ============================================================
-- APPLY TRACKER DATA
-- ============================================================

local function apply_tracker_data(
    zones
)
    for _, zone_data in ipairs(
        zones
    ) do

        for _, quest in ipairs(
            zone_data.quests
        ) do

            local info =
                tracker_data[
                    quest.id
                ]

            if info ~= nil then

                quest.tracker_area =
                    info.area

                quest.tracker_id =
                    info.bit

                quest.trackable = true

            else

                quest.tracker_area =
                    quest.tracker_area
                    or quest.area

                -- tracker_id se deja en nil: el quest no es rastreable

                quest.trackable = false
            end
        end
    end
end

apply_tracker_data(
    M.zones
)

return M