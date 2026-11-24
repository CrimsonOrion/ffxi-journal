local Q = {}

Q.STEPS = {
    -- Coalition Assignments (BG-Wiki).

    col_pio_procure_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Obtain 5 materials by logging at Logging Points in Ceizak Battlegrounds or Yahse Hunting Grounds; bring several Hatchets. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Obtain 5 materials by harvesting at Harvesting Points in Foret de Hennetiel; bring several Sickles. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Obtain 5 materials by mining at Mining Points in Morimar Basalt Fields; bring several Pickaxes. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Obtain 5 materials by logging at Logging Points in Yorcia Weald; bring several Hatchets. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Obtain 5 materials by mining at Mining Points in Marjami Ravine; bring several Pickaxes. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Obtain 5 materials by mining at Mining Points in Kamihr Drifts; bring several Pickaxes. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Obtain 5 materials by mining at Mining Points in Cirdas Caverns; bring several Pickaxes. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_procure_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Procure: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Obtain 5 materials by mining at Mining Points in Outer Ra'Kaznar; bring several Pickaxes. Floralie in the Pioneers' Coalition sells Trailblazing tools for Bayld, and Ionis reduces gathering fatigue.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Take part in a Colonization Reive in Ceizak Battlegrounds or Yahse Hunting Grounds until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Take part in a Colonization Reive in Foret de Hennetiel until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Take part in a Colonization Reive in Morimar Basalt Fields until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Take part in a Colonization Reive in Yorcia Weald until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Take part in a Colonization Reive in Marjami Ravine until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Take part in a Colonization Reive in Kamihr Drifts until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Take part in a Colonization Reive in Cirdas Caverns until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pio_clear_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Pioneers' Coalition, Western Adoulin (E-8), near Waypoint #2, and sign up for Clear: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Take part in a Colonization Reive in Outer Ra'Kaznar or Ra'Kaznar Inner Court until it's cleared.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_provide_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Provide: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Take the provisions to the site in Foret de Hennetiel where the Frontier Station is to be constructed where the Frontier Station is to be built. This assignment is usually not offered, as the Frontier Stations already exist.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_provide_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Provide: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Take the provisions to the site in Morimar Basalt Fields where the Frontier Station is to be constructed where the Frontier Station is to be built. This assignment is usually not offered, as the Frontier Stations already exist.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_provide_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Provide: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Take the provisions to the site in Yorcia Weald where the Frontier Station is to be constructed where the Frontier Station is to be built. This assignment is usually not offered, as the Frontier Stations already exist.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_provide_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Provide: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Take the provisions to the site in Marjami Ravine where the Frontier Station is to be constructed where the Frontier Station is to be built. This assignment is usually not offered, as the Frontier Stations already exist.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_provide_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Provide: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Take the provisions to the site in Kamihr Drifts where the Frontier Station is to be constructed where the Frontier Station is to be built. This assignment is usually not offered, as the Frontier Stations already exist.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_deliver_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Deliver: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Go to the Frontier Station in Foret de Hennetiel back to the assignment desk and pick up the supplies there.",
        "Bring the supplies back to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_deliver_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Deliver: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Go to the Frontier Station in Morimar Basalt Fields back to the assignment desk and pick up the supplies there.",
        "Bring the supplies back to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_deliver_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Deliver: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Go to the Frontier Station in Yorcia Weald back to the assignment desk and pick up the supplies there.",
        "Bring the supplies back to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_deliver_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Deliver: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Go to the Frontier Station in Marjami Ravine back to the assignment desk and pick up the supplies there.",
        "Bring the supplies back to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_deliver_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Deliver: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Go to the Frontier Station in Kamihr Drifts back to the assignment desk and pick up the supplies there.",
        "Bring the supplies back to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Ceizak Battlegrounds or Yahse Hunting Grounds.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Foret de Hennetiel.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Morimar Basalt Fields.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Yorcia Weald.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Marjami Ravine.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_cou_support_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Couriers' Coalition, Western Adoulin (G-7), near Waypoint #1, and sign up for Support: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Bring the supplies to a Frontier Bivouac in Kamihr Drifts.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_rala_waterways = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Rala Waterways with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Obtain three spools of Bloodthread; the monsters or gathering points of Rala Waterways provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Obtain five Chapuli Wings; the monsters or gathering points of Ceizak Battlegrounds provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_yahse_hunting_grounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Yahse Hunting Grounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Obtain five Twitherym Wings; the monsters or gathering points of Yahse Hunting Grounds provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Obtain three Craklaw Pincers; the monsters or gathering points of Foret de Hennetiel provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Obtain three Peiste Stingers; the monsters or gathering points of Morimar Basalt Fields provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Obtain three Snapweed Tendrils; the monsters or gathering points of Yorcia Weald provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Obtain three Tulfaire Feathers; the monsters or gathering points of Marjami Ravine provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Obtain three Raaz Tusks; the monsters or gathering points of Kamihr Drifts provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_sih_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Sih Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Obtain three jars of Acuex Poison; the monsters or gathering points of Sih Gates provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_moh_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Moh Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Obtain three Matamata Shells; the monsters or gathering points of Moh Gates provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Obtain three jars of Umbril Ooze; the monsters or gathering points of Cirdas Caverns provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_dho_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Dho Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Obtain three Slug Eyes; the monsters or gathering points of Dho Gates provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_woh_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Woh Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Obtain three Snoll Arms; the monsters or gathering points of Woh Gates provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Obtain one Dullahan Armor; the monsters or gathering points of Outer Ra'Kaznar provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_inv_gather_ra_kaznar_inner_court = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Inventors' Coalition, Western Adoulin (J-10), near Waypoint #4, and sign up for Gather: Ra'Kaznar Inner Court with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Obtain three Luminicloths; the monsters or gathering points of Ra'Kaznar Inner Court provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Examine an Ergon Locus in Ceizak Battlegrounds or Yahse Hunting Grounds to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Examine an Ergon Locus in Foret de Hennetiel to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Examine an Ergon Locus in Morimar Basalt Fields to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Examine an Ergon Locus in Yorcia Weald to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Examine an Ergon Locus in Marjami Ravine to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Examine an Ergon Locus in Kamihr Drifts to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_sih_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Sih Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Examine an Ergon Locus in Sih Gates or Moh Gates to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Examine an Ergon Locus in Cirdas Caverns to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_survey_dho_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Survey: Dho Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Examine an Ergon Locus in Dho Gates or Woh Gates to survey it.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Obtain 1 branch of Gnatbane; the monsters or gathering points of Foret de Hennetiel provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Obtain 1 Marble Nugget; the monsters or gathering points of Morimar Basalt Fields provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Obtain 1 Guatambu Log; the monsters or gathering points of Yorcia Weald provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Obtain 1 chunk of Wootz Ore; the monsters or gathering points of Marjami Ravine provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Obtain 1 Gelid Aggregate; the monsters or gathering points of Kamihr Drifts provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Obtain 1 Scholar Stone; the monsters or gathering points of Cirdas Caverns provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_sco_analyze_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Scouts' Coalition, Eastern Adoulin (F-9), near Waypoint #2, and sign up for Analyze: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Obtain 1 Vanadium Ore; the monsters or gathering points of Outer Ra'Kaznar provide them, or buy them on the Auction House.",
        "Trade the items to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Take part in a Lair Reive in Ceizak Battlegrounds and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_yahse_hunting_grounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Yahse Hunting Grounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Take part in a Lair Reive in Yahse Hunting Grounds and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Take part in a Lair Reive in Foret de Hennetiel and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Take part in a Lair Reive in Morimar Basalt Fields and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Take part in a Lair Reive in Yorcia Weald and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Take part in a Lair Reive in Marjami Ravine and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Take part in a Lair Reive in Kamihr Drifts and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Take part in a Lair Reive in Cirdas Caverns and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_preserve_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Preserve: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Take part in a Lair Reive in Outer Ra'Kaznar or Ra'Kaznar Inner Court and see it through to a successful finish.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_rala_waterways = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Rala Waterways with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Defeat 5 Toads in Rala Waterways.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_sih_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Sih Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Defeat 5 Twitherym in Sih Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_moh_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Moh Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Defeat 5 Raptors in Moh Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_cirdas_caverns = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Cirdas Caverns with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Defeat 3 Maroliths in Cirdas Caverns.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_dho_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Dho Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Defeat 3 Efts in Dho Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_woh_gates = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Woh Gates with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Defeat 3 Acuex in Woh Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_pea_patrol_outer_ra_kaznar = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Peacekeepers' Coalition, Eastern Adoulin (F-7), near Waypoint #1, and sign up for Patrol: Outer Ra'Kaznar with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Defeat 3 Ironclads in Outer Ra'Kaznar.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Find and examine a Lost article in Ceizak Battlegrounds or Yahse Hunting Grounds.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Find and examine a Lost article in Foret de Hennetiel or Sih Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Disciple rank in this coalition.",
        "Find and examine a Lost article in Morimar Basalt Fields or Moh Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Find and examine a Lost article in Yorcia Weald or Cirdas Caverns.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Find and examine a Lost article in Marjami Ravine or Dho Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_recover_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Recover: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Find and examine a Lost article in Kamihr Drifts or Woh Gates.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_rala_waterways = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Rala Waterways with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Petitioner rank in this coalition.",
        "Let a Slug in Rala Waterways hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_ceizak_battlegrounds = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Ceizak Battlegrounds with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Let a Chapuli in Ceizak Battlegrounds or Yahse Hunting Grounds hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Let a Craklaw in Foret de Hennetiel or Sih Gates hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_morimar_basalt_fields = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Morimar Basalt Fields with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Contributor rank in this coalition.",
        "Let a Matamata in Morimar Basalt Fields or Moh Gates hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_yorcia_weald = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Yorcia Weald with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Let a Snapweed in Yorcia Weald hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Advisor rank in this coalition.",
        "Let a Tulfaire in Marjami Ravine hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_research_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Research: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Legend rank in this coalition.",
        "Let a Raaz in Kamihr Drifts hit you with one of its special attacks (weapon skills, not normal hits).",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_boost_foret_de_hennetiel = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Boost: Foret de Hennetiel with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Probationer rank in this coalition.",
        "Cheer up the worker at the Frontier Station in Foret de Hennetiel or Morimar Basalt Fields.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_boost_marjami_ravine = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Boost: Marjami Ravine with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Partner rank in this coalition.",
        "Cheer up the worker at the Frontier Station in Marjami Ravine or Yorcia Weald.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },

    col_mum_boost_kamihr_drifts = { -- Local patch: Coalition assignments
        "Speak with the Task Delegator in the Mummers' Coalition, Western Adoulin (G-11), near Waypoint #3, and sign up for Boost: Kamihr Drifts with 1 to 3 Imprimaturs; more Imprimaturs give more EXP and Bayld. It needs Magnate rank in this coalition.",
        "Cheer up the worker at the Frontier Station in Kamihr Drifts.",
        "Return to the Task Delegator to complete the assignment, then vote on a referendum. You can take it again with more Imprimaturs.",
    },
}

return Q
