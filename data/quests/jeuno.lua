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
                id = 'jeu_lj_all_in_the_cards',
                name = 'All in the Cards',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-8)',
                npc = 'Chululu',
                req = 'Fame 5',
                prereq = 'Collect Tarut Cards',
                reward = '600 gil, title Card Collector',
                items = 'Tarut: Death, Tarut: The Fool, Tarut: The Hermit, Tarut: The King',
                repeatable = true,
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

            {
                id = 'jeu_lj_gobbiebag_5',
                name = 'The Gobbiebag Part V',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 3',
                prereq = 'The Gobbiebag Part IV',
                reward = 'Inventory increased to 55 slots',
                items = 'Bugard Leather, Paktong Ingot, Moblinweave, Rhodonite, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_6',
                name = 'The Gobbiebag Part VI',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 3',
                prereq = 'The Gobbiebag Part V',
                reward = 'Inventory increased to 60 slots',
                items = 'Balloon Cloth, Shakudo Ingot, H.Q. Eft Skin, Iolite, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_7',
                name = 'The Gobbiebag Part VII',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 4',
                prereq = 'The Gobbiebag Part VI',
                reward = 'Inventory increased to 65 slots',
                items = 'Lynx Leather, Adaman Ingot, Rainbow Cloth, Deathstone, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_8',
                name = 'The Gobbiebag Part VIII',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 4',
                prereq = 'The Gobbiebag Part VII',
                reward = 'Inventory increased to 70 slots',
                items = 'Smilodon Leather, Electrum Ingot, Cilice, Angelstone, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_9',
                name = 'The Gobbiebag Part IX',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 5',
                prereq = 'The Gobbiebag Part VIII',
                reward = 'Inventory increased to 75 slots',
                items = 'Orichalcum Ingot, Peiste Leather, Oil-Soaked Cloth, Oxblood Orb, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_gobbiebag_10',
                name = 'The Gobbiebag Part X',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Bluffnix',
                req = 'Fame 5',
                prereq = 'The Gobbiebag Part IX',
                reward = 'Inventory increased to 80 slots, title Grand Greedalox',
                items = 'Molybdenum Ingot, Griffon Leather, Foulard, Angel Skin Orb, or Goblin Stew 880',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_in_the_mood_for_love',
                name = 'In the Mood for Love',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Odasel',
                req = 'Promathia Mission 3-2',
                prereq = '',
                reward = '4,800 gil, title Pick-up Artist',
                items = 'Chameleon Diamond',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_hook_line_and_sinker',
                name = 'Hook, Line, and Sinker',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (G-10)',
                npc = 'Omer',
                req = 'Promathia Mission 3-2',
                prereq = '',
                reward = '3,000 gil, title Rod Retriever',
                items = 'Egret Fishing Rod',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_the_road_to_aht_urhgan',
                name = 'The Road to Aht Urhgan',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (J-8)',
                npc = 'Faursel',
                req = 'Fame 1',
                prereq = 'Tenshodo Membership',
                reward = 'Key item Boarding Permit',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_the_miraculous_dale',
                name = 'The Miraculous Dale',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (I-6)',
                npc = 'Rakuru-Rakoru',
                req = 'Lv.75+',
                prereq = '',
                reward = '59,630 gil',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_warrior',
                name = 'Unlocking a Myth (Warrior)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Warrior, Sturdy Axe equipped',
                prereq = '',
                reward = "King's Justice usable with any weapon of its type",
                items = 'Sturdy Axe',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_monk',
                name = 'Unlocking a Myth (Monk)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Monk, Burning Fists equipped',
                prereq = '',
                reward = "Ascetic's Fury usable with any weapon of its type",
                items = 'Burning Fists',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_white_mage',
                name = 'Unlocking a Myth (White Mage)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'White Mage, Werebuster equipped',
                prereq = '',
                reward = 'Mystic Boon usable with any weapon of its type',
                items = 'Werebuster',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_black_mage',
                name = 'Unlocking a Myth (Black Mage)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = "Black Mage, Mage's Staff equipped",
                prereq = '',
                reward = 'Vidohunir usable with any weapon of its type',
                items = "Mage's Staff",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_red_mage',
                name = 'Unlocking a Myth (Red Mage)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Red Mage, Vorpal Sword equipped',
                prereq = '',
                reward = 'Death Blossom usable with any weapon of its type',
                items = 'Vorpal Sword',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_thief',
                name = 'Unlocking a Myth (Thief)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Thief, Swordbreaker equipped',
                prereq = '',
                reward = 'Mandalic Stab usable with any weapon of its type',
                items = 'Swordbreaker',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_paladin',
                name = 'Unlocking a Myth (Paladin)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Paladin, Brave Blade equipped',
                prereq = '',
                reward = 'Atonement usable with any weapon of its type',
                items = 'Brave Blade',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_dark_knight',
                name = 'Unlocking a Myth (Dark Knight)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Dark Knight, Death Sickle equipped',
                prereq = '',
                reward = 'Insurgency usable with any weapon of its type',
                items = 'Death Sickle',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_beastmaster',
                name = 'Unlocking a Myth (Beastmaster)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Beastmaster, Double Axe equipped',
                prereq = '',
                reward = 'Primal Rend usable with any weapon of its type',
                items = 'Double Axe',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_bard',
                name = 'Unlocking a Myth (Bard)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Bard, Dancing Dagger equipped',
                prereq = '',
                reward = 'Mordant Rime usable with any weapon of its type',
                items = 'Dancing Dagger',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_ranger',
                name = 'Unlocking a Myth (Ranger)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Ranger, Killer Bow equipped',
                prereq = '',
                reward = 'Trueflight usable with any weapon of its type',
                items = 'Killer Bow',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_samurai',
                name = 'Unlocking a Myth (Samurai)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Samurai, Windslicer equipped',
                prereq = '',
                reward = 'Tachi: Rana usable with any weapon of its type',
                items = 'Windslicer',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_ninja',
                name = 'Unlocking a Myth (Ninja)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Ninja, Sasuke Katana equipped',
                prereq = '',
                reward = 'Blade: Kamu usable with any weapon of its type',
                items = 'Sasuke Katana',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_dragoon',
                name = 'Unlocking a Myth (Dragoon)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Dragoon, Radiant Lance equipped',
                prereq = '',
                reward = 'Drakesbane usable with any weapon of its type',
                items = 'Radiant Lance',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_summoner',
                name = 'Unlocking a Myth (Summoner)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Summoner, Scepter Staff equipped',
                prereq = '',
                reward = 'Garland of Bliss usable with any weapon of its type',
                items = 'Scepter Staff',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_blue_mage',
                name = 'Unlocking a Myth (Blue Mage)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Blue Mage, Wightslayer equipped',
                prereq = '',
                reward = 'Expiacion usable with any weapon of its type',
                items = 'Wightslayer',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_corsair',
                name = 'Unlocking a Myth (Corsair)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Corsair, Quicksilver equipped',
                prereq = '',
                reward = 'Leaden Salute usable with any weapon of its type',
                items = 'Quicksilver',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_puppetmaster',
                name = 'Unlocking a Myth (Puppetmaster)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Puppetmaster, Inferno Claws equipped',
                prereq = '',
                reward = 'Stringing Pummel usable with any weapon of its type',
                items = 'Inferno Claws',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_dancer',
                name = 'Unlocking a Myth (Dancer)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Dancer, Main Gauche equipped',
                prereq = '',
                reward = 'Pyrrhic Kleos usable with any weapon of its type',
                items = 'Main Gauche',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_lj_unlocking_a_myth_scholar',
                name = 'Unlocking a Myth (Scholar)',
                area = 'jeuno',
                zone = 'Lower Jeuno',
                loc = 'Lower Jeuno (H-9)',
                npc = 'Zalsuhm',
                req = 'Scholar, Elder Staff equipped',
                prereq = '',
                reward = 'Omniscience usable with any weapon of its type',
                items = 'Elder Staff',
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
                id = 'jeu_uj_full_speed_ahead',
                name = 'Full Speed Ahead!',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Mapitoto',
                req = 'Lv.20+, Chocobo license, Map of the Jeuno area',
                prereq = "Chocobo's Wounds",
                reward = "Key items Raptor companion and Trainer's whistle",
            }, -- Local patch: Jeuno quests

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

            {
                id = 'jeu_uj_searching_for_the_right_words',
                name = 'Searching for the Right Words',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Ilumida',
                req = 'Fame 6',
                prereq = 'A Candlelight Vigil, Rubbish Day, Never to Return',
                reward = '3,000 gil, Scroll of Sleepga II',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_chocobos_tale',
                name = "A Chocobo's Tale",
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Nevela',
                req = 'Promathia Mission 3-2',
                prereq = '',
                reward = '5,200 gil, title Chocobo Love Guru',
                items = 'Warding Oil x3',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_reputation_in_ruins',
                name = 'A Reputation in Ruins',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (H-9)',
                npc = 'Migliorozz',
                req = 'Promathia Mission 3-3',
                prereq = '',
                reward = '3,500 gil',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_unlisted_qualities',
                name = 'Unlisted Qualities',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Fame 1',
                prereq = '',
                reward = 'Silver Ingot; you choose your Adventuring Fellow',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_girl_in_the_looking_glass',
                name = 'Girl in the Looking Glass',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = '',
                prereq = 'Unlisted Qualities',
                reward = 'Continues the Adventuring Fellow story',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_mirror_mirror',
                name = 'Mirror, Mirror',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = '',
                prereq = 'Girl in the Looking Glass',
                reward = 'Signal Pearl (call your Adventuring Fellow), title Destined Fellow',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_past_reflections',
                name = 'Past Reflections',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = '',
                prereq = 'Mirror, Mirror',
                reward = 'Familiarity limit raised to 50',
                items = "Bison Steak, San d'Orian Tea, Icecap Rolanberry, White Bread, Whitefish Stew, Windurst Salad",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_blighted_gloom',
                name = 'Blighted Gloom',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 45',
                prereq = 'Past Reflections',
                reward = 'Familiarity limit raised to 70',
                items = 'Vitrallum',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_blessed_radiance',
                name = 'Blessed Radiance',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 70',
                prereq = 'Blighted Gloom',
                reward = 'Familiarity limit raised to 90',
                items = 'Pickaxe, Sickle, Hatchet',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_mirror_images',
                name = 'Mirror Images',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 85',
                prereq = 'Blessed Radiance',
                reward = 'Familiarity limit raised to 120, fellow learns Blessed Radiance',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_chameleon_capers',
                name = 'Chameleon Capers',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 65',
                prereq = 'Mirror, Mirror',
                reward = 'One Tactics Manual (Fortitude, Might or Endurance)',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_regaining_trust',
                name = 'Regaining Trust',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 55, fellow at 51 or higher',
                prereq = 'Picture Perfect',
                reward = 'Fellow level cap raised to 60, title Worthy of Trust',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_mixed_signals',
                name = 'Mixed Signals',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 80, fellow at 56 or higher',
                prereq = 'Regaining Trust',
                reward = 'Fellow level cap raised to 65, a random Homemade food, title A Friend Indeed',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_lure_of_the_wildcat',
                name = 'Lure of the Wildcat (Jeuno)',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (F-5)',
                npc = 'Ajithaam',
                req = '',
                prereq = '',
                reward = 'Key item White Invitation Card',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_furious_finale',
                name = 'A Furious Finale',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-7)',
                npc = 'Laila',
                req = 'Lv.66+ DNC',
                prereq = 'Comeback Queen',
                reward = 'Dancer level limit raised to 75, title Dazzling Dance Diva',
                items = "Dancer's Testimony",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_clash_of_the_comrades',
                name = 'Clash of the Comrades',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Familiarity 100, fellow at 61 or higher',
                prereq = 'Mixed Signals',
                reward = 'Fellow level cap raised to 70, title Fellow Fortifier',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_trial_in_tandem',
                name = 'A Trial in Tandem',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Lv.75+, fellow at 66 or higher, Magian trial log',
                prereq = 'Clash of the Comrades',
                reward = 'Fellow level cap raised to 75',
                items = 'Tandem Necklace',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_trial_in_tandem_redux',
                name = 'A Trial in Tandem, Redux',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Lv.75+, fellow at 71 or higher, Magian trial log',
                prereq = 'A Trial in Tandem',
                reward = 'Fellow level cap raised to 80',
                items = 'Tandem Necklace +1',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_yet_another_trial_in_tandem',
                name = 'Yet Another Trial in Tandem',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Lv.75+, fellow at 76 or higher, Magian trial log',
                prereq = 'A Trial in Tandem, Redux',
                reward = 'Fellow level cap raised to 85',
                items = 'Tandem Necklace +2',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_quaternary_trial_in_tandem',
                name = 'A Quaternary Trial in Tandem',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Lv.75+, fellow at 81 or higher, Magian trial log',
                prereq = 'Yet Another Trial in Tandem',
                reward = 'Fellow level cap raised to 90',
                items = 'Tandem Necklace +3',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_uj_a_trial_in_tandem_revisited',
                name = 'A Trial in Tandem Revisited',
                area = 'jeuno',
                zone = 'Upper Jeuno',
                loc = 'Upper Jeuno (G-8)',
                npc = 'Luto Mewrilah',
                req = 'Lv.75+, fellow at 86 or higher, Magian trial log',
                prereq = 'A Quaternary Trial in Tandem',
                reward = 'Fellow level cap raised to 99',
                items = "Tandem Necklace +4, Kindred's Crest x20",
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
                id = 'jeu_rg_new_worlds_await',
                name = 'New Worlds Await',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.75',
                prereq = 'Shattering Stars (or another level-75 limit break quest)',
                reward = 'Raises level cap to 80, key item Limit breaker',
                items = "Kindred's Seal x5, 3 merit points",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_expanding_horizons',
                name = 'Expanding Horizons',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.76+',
                prereq = 'New Worlds Await',
                reward = 'Raises level cap to 85',
                items = "Kindred's Crest x5, 4 merit points",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_beyond_the_stars',
                name = 'Beyond the Stars',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.81+',
                prereq = 'Expanding Horizons',
                reward = 'Raises level cap to 90',
                items = "Kindred's Crest x10, 5 merit points",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_dormant_powers_dislodged',
                name = 'Dormant Powers Dislodged',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.86+',
                prereq = 'Beyond the Stars',
                reward = 'Raises level cap to 95, key item Soul gem',
                items = "Kindred's Crest, one requested item, 10 merit points",
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_prelude_to_puissance',
                name = 'Prelude to Puissance',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.91+',
                prereq = 'Dormant Powers Dislodged',
                reward = 'Key item Soul gem clasp',
                items = 'Seasoning Stone',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_beyond_infinity',
                name = 'Beyond Infinity',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.91+',
                prereq = 'Prelude to Puissance',
                reward = 'Raises level cap to 99, Scroll of Instant Warp, warps from Domenic',
                items = 'Soul gem clasp',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_martial_mastery',
                name = 'Martial Mastery',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = 'Nomad Moogle',
                req = 'Lv.96+',
                prereq = 'Beyond Infinity',
                reward = 'Key item Heart of the bushin, title Bushin-Ryu Inheritor',
                items = '15 merit points',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_vw_op_115_valkurm_duster',
                name = 'VW Op. 115: Valkurm Duster',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = "Mawl'gofaur",
                req = '',
                prereq = 'A New Menace',
                reward = 'Title Ig-Alima Inhumer',
                items = 'White stratum abyssite VI',
            }, -- Local patch: Jeuno quests

            {
                id = 'jeu_rg_vw_op_118_buburimu_squall',
                name = 'VW Op. 118: Buburimu Squall',
                area = 'jeuno',
                zone = "Ru'Lude Gardens",
                loc = "Ru'Lude Gardens (H-5)",
                npc = "Mawl'gofaur",
                req = '',
                prereq = 'A New Menace',
                reward = 'Title Botulus Rex Engorger',
                items = 'White stratum abyssite VI',
            }, -- Local patch: Jeuno quests

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

    jeu_lj_gobbiebag_5 = {
        area = 'jeuno',
        bit = 74,
    },

    jeu_lj_gobbiebag_6 = {
        area = 'jeuno',
        bit = 75,
    },

    jeu_lj_gobbiebag_7 = {
        area = 'jeuno',
        bit = 93,
    },

    jeu_lj_gobbiebag_8 = {
        area = 'jeuno',
        bit = 94,
    },

    jeu_lj_in_the_mood_for_love = {
        area = 'jeuno',
        bit = 69,
    },

    jeu_lj_hook_line_and_sinker = {
        area = 'jeuno',
        bit = 71,
    },

    jeu_uj_searching_for_the_right_words = {
        area = 'jeuno',
        bit = 66,
    },

    jeu_uj_a_chocobos_tale = {
        area = 'jeuno',
        bit = 72,
    },

    jeu_uj_a_reputation_in_ruins = {
        area = 'jeuno',
        bit = 73,
    },

    jeu_uj_unlisted_qualities = {
        area = 'jeuno',
        bit = 77,
    },

    jeu_uj_girl_in_the_looking_glass = {
        area = 'jeuno',
        bit = 78,
    },

    jeu_uj_mirror_mirror = {
        area = 'jeuno',
        bit = 79,
    },

    jeu_uj_past_reflections = {
        area = 'jeuno',
        bit = 80,
    },

    jeu_uj_blighted_gloom = {
        area = 'jeuno',
        bit = 81,
    },

    jeu_uj_blessed_radiance = {
        area = 'jeuno',
        bit = 82,
    },

    jeu_uj_mirror_images = {
        area = 'jeuno',
        bit = 83,
    },

    jeu_uj_chameleon_capers = {
        area = 'jeuno',
        bit = 84,
    },

    jeu_uj_regaining_trust = {
        area = 'jeuno',
        bit = 85,
    },

    jeu_uj_mixed_signals = {
        area = 'jeuno',
        bit = 87,
    },

    jeu_uj_lure_of_the_wildcat = {
        area = 'jeuno',
        bit = 90,
    },

    jeu_lj_the_road_to_aht_urhgan = {
        area = 'jeuno',
        bit = 91,
    },

    jeu_uj_a_furious_finale = {
        area = 'jeuno',
        bit = 99,
    },

    jeu_lj_the_miraculous_dale = {
        area = 'jeuno',
        bit = 100,
    },

    jeu_uj_clash_of_the_comrades = {
        area = 'jeuno',
        bit = 101,
    },

    jeu_lj_unlocking_a_myth_warrior = {
        area = 'jeuno',
        bit = 102,
    },

    jeu_lj_unlocking_a_myth_monk = {
        area = 'jeuno',
        bit = 103,
    },

    jeu_lj_unlocking_a_myth_white_mage = {
        area = 'jeuno',
        bit = 104,
    },

    jeu_lj_unlocking_a_myth_black_mage = {
        area = 'jeuno',
        bit = 105,
    },

    jeu_lj_unlocking_a_myth_red_mage = {
        area = 'jeuno',
        bit = 106,
    },

    jeu_lj_unlocking_a_myth_thief = {
        area = 'jeuno',
        bit = 107,
    },

    jeu_lj_unlocking_a_myth_paladin = {
        area = 'jeuno',
        bit = 108,
    },

    jeu_lj_unlocking_a_myth_dark_knight = {
        area = 'jeuno',
        bit = 109,
    },

    jeu_lj_unlocking_a_myth_beastmaster = {
        area = 'jeuno',
        bit = 110,
    },

    jeu_lj_unlocking_a_myth_bard = {
        area = 'jeuno',
        bit = 111,
    },

    jeu_lj_unlocking_a_myth_ranger = {
        area = 'jeuno',
        bit = 112,
    },

    jeu_lj_unlocking_a_myth_samurai = {
        area = 'jeuno',
        bit = 113,
    },

    jeu_lj_unlocking_a_myth_ninja = {
        area = 'jeuno',
        bit = 114,
    },

    jeu_lj_unlocking_a_myth_dragoon = {
        area = 'jeuno',
        bit = 115,
    },

    jeu_lj_unlocking_a_myth_summoner = {
        area = 'jeuno',
        bit = 116,
    },

    jeu_lj_unlocking_a_myth_blue_mage = {
        area = 'jeuno',
        bit = 117,
    },

    jeu_lj_unlocking_a_myth_corsair = {
        area = 'jeuno',
        bit = 118,
    },

    jeu_lj_unlocking_a_myth_puppetmaster = {
        area = 'jeuno',
        bit = 119,
    },

    jeu_lj_unlocking_a_myth_dancer = {
        area = 'jeuno',
        bit = 120,
    },

    jeu_lj_unlocking_a_myth_scholar = {
        area = 'jeuno',
        bit = 121,
    },

    jeu_lj_gobbiebag_9 = {
        area = 'jeuno',
        bit = 123,
    },

    jeu_lj_gobbiebag_10 = {
        area = 'jeuno',
        bit = 124,
    },

    jeu_rg_new_worlds_await = {
        area = 'jeuno',
        bit = 133,
    },

    jeu_rg_expanding_horizons = {
        area = 'jeuno',
        bit = 134,
    },

    jeu_rg_beyond_the_stars = {
        area = 'jeuno',
        bit = 135,
    },

    jeu_rg_dormant_powers_dislodged = {
        area = 'jeuno',
        bit = 136,
    },

    jeu_rg_beyond_infinity = {
        area = 'jeuno',
        bit = 137,
    },

    jeu_lj_all_in_the_cards = {
        area = 'jeuno',
        bit = 166,
    },

    jeu_rg_martial_mastery = {
        area = 'jeuno',
        bit = 167,
    },

    jeu_rg_prelude_to_puissance = {
        area = 'jeuno',
        bit = 170,
    },

    jeu_uj_full_speed_ahead = {
        area = 'jeuno',
        bit = 179,
    },

    jeu_uj_a_trial_in_tandem = {
        area = 'jeuno',
        bit = 160,
    },

    jeu_uj_a_trial_in_tandem_redux = {
        area = 'jeuno',
        bit = 161,
    },

    jeu_uj_yet_another_trial_in_tandem = {
        area = 'jeuno',
        bit = 162,
    },

    jeu_uj_a_quaternary_trial_in_tandem = {
        area = 'jeuno',
        bit = 163,
    },

    jeu_uj_a_trial_in_tandem_revisited = {
        area = 'jeuno',
        bit = 164,
    },

    jeu_rg_vw_op_115_valkurm_duster = {
        area = 'jeuno',
        bit = 168,
    },

    jeu_rg_vw_op_118_buburimu_squall = {
        area = 'jeuno',
        bit = 169,
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