
skater_f_head = [
  {
    desc_id = Steamer
    frontend_desc = 'Elissa Steamer'
    mesh = "models/skater_f/head_steamer.skin"
    flags = { is_pro_head is_steamer_head }
    hidden
  }
  {
    desc_id = #"Light Skin 1"
    frontend_desc = 'Light Skin 1'
    flags = { no_hair no_headgear }
    script disqualify_script
      SetPart part = body desc_id = FemaleBody
    endscript
  }
  {
    desc_id = #"Light Skin 2"
    frontend_desc = 'Light Skin 2'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_W01"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody
    endscript
  }
  {
    desc_id = #"Light Skin 3"
    frontend_desc = 'Light Skin 3'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_W02"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody
    endscript
  }
  {
    desc_id = #"Light Skin 4"
    frontend_desc = 'Light Skin 4'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_W03"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody
    endscript
  }
  {
    desc_id = #"Light Skin 5"
    frontend_desc = 'Light Skin 5'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_W04"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody
    endscript
  }
  {
    desc_id = #"Dark Skin 1"
    frontend_desc = 'Dark Skin 1'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_B01"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody2
    endscript
  }
  {
    desc_id = #"Dark Skin 2"
    frontend_desc = 'Dark Skin 2'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_B02"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody2
    endscript
  }
  {
    desc_id = #"Dark Skin 3"
    frontend_desc = 'Dark Skin 3'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_B03"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody2
    endscript
  }
  {
    desc_id = #"Dark Skin 4"
    frontend_desc = 'Dark Skin 4'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_B04"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody2
    endscript
  }
  {
    desc_id = #"Dark Skin 5"
    frontend_desc = 'Dark Skin 5'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_B05"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody2
    endscript
  }
  {
    desc_id = #"Tan Skin 1"
    frontend_desc = 'Tan Skin 1'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_A01"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody3
    endscript
  }
  {
    desc_id = #"Tan Skin 2"
    frontend_desc = 'Tan Skin 2'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_A02"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody3
    endscript
  }
  {
    desc_id = #"Tan Skin 3"
    frontend_desc = 'Tan Skin 3'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_A03"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody3
    endscript
  }
  {
    desc_id = #"Tan Skin 4"
    frontend_desc = 'Tan Skin 4'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_A04"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody3
    endscript
  }
  {
    desc_id = #"Tan Skin 5"
    frontend_desc = 'Tan Skin 5'
    replace = "CS_NH_F_wht_face.png"
    with = "textures/skater_m/CS_NH_F_A05"
    in = body
    script disqualify_script
      SetPart part = body desc_id = FemaleBody3
    endscript
  }
]
skater_f_torso = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"T-shirt"
    frontend_desc = 'T-Shirt'
    mesh = "models/skater_f/shirt_tshirt.skin"
    supports_logo
  }
  {
    desc_id = #"Camo T-shirt"
    frontend_desc = 'Camo T-Shirt'
    mesh = "models/skater_f/shirt_tshirt.skin"
    replace = "CS_JB_F_shirt_tshirt.png"
    with = "textures/skater_m/CS_JB_F_shirt_tshirt_camo"
    replace1 = "CS_JB_F_sleeve_tshirt.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_tshirt_camo"
  }
  {
    desc_id = #"Sport T-shirt"
    frontend_desc = 'Sport T-Shirt'
    mesh = "models/skater_f/shirt_tshirt.skin"
    replace = "CS_JB_F_sleeve_tshirt.png"
    with = "textures/skater_m/CS_JB_F_sleeve_tshirt_sport"
  }
  {
    desc_id = #"Tanktop short"
    frontend_desc = 'Tanktop Short'
    mesh = "models/skater_f/shirt_tanktop_2.skin"
    supports_logo
    no_back_logo
    shows_panties
  }
  {
    desc_id = Tanktop
    frontend_desc = 'Tanktop'
    mesh = "models/skater_f/shirt_tanktop.skin"
    supports_logo
    no_back_logo
    shows_panties
  }
  {
    desc_id = #"Dip-Dye Tank1"
    frontend_desc = 'Dip-dye Tank 1'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_NH_female_tanktop_dye"
    shows_panties
  }
  {
    desc_id = #"Dip-Dye Tank2"
    frontend_desc = 'Dip-dye Tank 2'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_JB_F_shirt_tanktop_dye"
    shows_panties
  }
  {
    desc_id = #"Floral Tank"
    frontend_desc = 'Floral Tank'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_JB_F_shirt_tanktop_floral"
    shows_panties
  }
  {
    desc_id = #"V-Neck"
    frontend_desc = 'V-Neck'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    shows_panties
  }
  {
    desc_id = #"V-Neck Tie-Die"
    frontend_desc = 'V-Neck Tie-Dye'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_tiedye"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_tiedye"
    shows_panties
  }
  {
    desc_id = #"V-Neck Dip-Dye"
    frontend_desc = 'V-Neck Dip-Dye'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_dye"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_dye"
    shows_panties
  }
  {
    desc_id = #"V-Neck Floral"
    frontend_desc = 'V-Neck Floral'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_floral"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_floral"
    shows_panties
  }
  {
    desc_id = #"V-Neck Stripes"
    frontend_desc = 'V-Neck Stripes'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_stripes"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_stripes"
    shows_panties
  }
  {
    desc_id = #"V-Neck Flower"
    frontend_desc = 'V-Neck Flower'
    mesh = "models/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_flower"
    shows_panties
  }
  {
    desc_id = Jersey
    frontend_desc = 'Jersey'
    mesh = "models/skater_f/shirt_jersey.skin"
    shows_panties
    not_with_backpack
  }
  {
    desc_id = #"RS Blouse"
    frontend_desc = 'RS Blouse'
    mesh = "models/skater_f/shirt_RSbutton.skin"
    not_with_backpack
    is_long_sleeve
  }
  {
    desc_id = #"RS Blouse Plaid"
    frontend_desc = 'RS Blouse Plaid'
    mesh = "models/skater_f/shirt_RSbutton.skin"
    replace = "CS_JB_F_shirt_buttondwn.png"
    with = "textures/skater_m/CS_JB_F_shirt_buttondwn_plaid"
    replace1 = "CS_JB_F_sleeve_buttondwn.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_buttondwn_plaid"
    not_with_backpack
    is_long_sleeve
  }
  {
    desc_id = #"LS Blouse"
    frontend_desc = 'LS Blouse'
    mesh = "models/skater_f/shirt_LSbutton.skin"
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
    not_with_backpack
    is_long_sleeve
  }
  {
    desc_id = #"LS Blouse Plaid"
    frontend_desc = 'LS Blouse Plaid'
    mesh = "models/skater_f/shirt_LSbutton.skin"
    replace = "CS_JB_F_shirt_buttondwn.png"
    with = "textures/skater_m/CS_JB_shirt_buttonflannel"
    replace1 = "CS_JB_F_sleeve_buttondwn.png"
    with1 = "textures/skater_m/CS_JB_sleeve_longflannel"
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
    not_with_backpack
    is_long_sleeve
  }
  {
    desc_id = #"Denim Jacket"
    frontend_desc = 'Denim Jacket'
    mesh = "models/skater_f/shirt_denimjacket.skin"
    shows_panties
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Baggy Vest"
    frontend_desc = 'Baggy Vest'
    mesh = "models/skater_f/shirt_baggyvest.skin"
    shows_panties
    not_with_backpack
  }
  {
    desc_id = #"Sniper Vest"
    frontend_desc = 'Sniper Vest'
    mesh = "models/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_baggyvest_flak"
    shows_panties
    not_with_backpack
  }
  {
    desc_id = #"Leather Vest"
    frontend_desc = 'Leather Vest'
    mesh = "models/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_leathervest"
    shows_panties
    not_with_backpack
  }
  {
    desc_id = #"Padded Vest"
    frontend_desc = 'Padded Vest'
    mesh = "models/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_baggyvest_padded"
    shows_panties
    not_with_backpack
  }
  {
    desc_id = #"Snow Jacket"
    frontend_desc = 'Snow Jacket'
    mesh = "models/skater_f/shirt_snowjacket.skin"
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Padded Jacket"
    frontend_desc = 'Padded Jacket'
    mesh = "models/skater_f/shirt_snowjacket.skin"
    replace = "CS_JB_F_shirt_snowjacket.png"
    with = "textures/skater_m/CS_NH_snowjacket_padded"
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Hoody Up"
    frontend_desc = 'Hoody Up'
    mesh = "models/skater_f/shirt_lshoodup.skin"
    script disqualify_script
      cas_temp_disq_remove_long_hair
      ClearPart part = hat
      ClearPart part = helmet
      cas_temp_disq_remove_accessories
    endscript
    supports_logo
    no_back_logo
    not_with_elissa
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Hoody Up Stripe"
    frontend_desc = 'Hoody Up Stripe'
    mesh = "models/skater_f/shirt_lshoodup.skin"
    replace = "CS_JB_shirt_hoodyup1.png"
    with = "textures/skater_m/CS_JB_shirt_hoodyupstripe1"
    replace1 = "CS_JB_shirt_hoodyup2.png"
    with1 = "textures/skater_m/CS_JB_shirt_hoodyupstripe2"
    replace2 = "CS_JB_sleeve_hoodyup.png"
    with2 = "textures/skater_m/CS_JB_sleeve_hoodyupstripe"
    script disqualify_script
      cas_temp_disq_remove_long_hair
      ClearPart part = hat
      ClearPart part = helmet
      cas_temp_disq_remove_accessories
    endscript
    not_with_elissa
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Hoody Down"
    frontend_desc = 'Hoody Down'
    mesh = "models/skater_f/shirt_lshooddown.skin"
    supports_logo
    no_back_logo
    not_with_elissa
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
  }
  {
    desc_id = #"Hoody Down Stripe"
    frontend_desc = 'Hoody Down Stripe'
    mesh = "models/skater_f/shirt_lshooddown.skin"
    replace = "CS_JB_shirt_hoodydown.png"
    with = "textures/skater_m/CS_JB_shirt_hoodydownstripe"
    replace1 = "CS_JB_sleeve_hoodydown.png"
    with1 = "textures/skater_m/CS_JB_sleeve_hoodydownstripe"
    script disqualify_script
      cas_temp_disq_remove_accessories
    endscript
    not_with_elissa
    not_with_backpack
    is_long_sleeve
    not_with_weird_hat
  }
  {
    desc_id = #"Steamer shirt"
    frontend_desc = 'Steamer Shirt'
    mesh = "models/skater_f/shirt_steamer.skin"
    not_with_backpack
  }
  {
    desc_id = #"Tube Top"
    frontend_desc = 'Tube Top'
    mesh = "models/skater_f/shirt_jennatube.skin"
  }
]
skater_f_legs = [
  {
    desc_id = Shorts
    frontend_desc = 'Shorts'
    mesh = "models/skater_f/pant_shorts.skin"
    supports_kneepads
    shows_panties
  }
  {
    desc_id = None
    frontend_desc = 'None'
    supports_kneepads
  }
  {
    desc_id = #"Short Shorts"
    frontend_desc = 'Short Shorts'
    mesh = "models/skater_f/pant_shortshorts.skin"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = #"Short Shorts Denim"
    frontend_desc = 'Short Shorts Denim'
    mesh = "models/skater_f/pant_shortshorts.skin"
    replace = "CS_NH_Slater_shorts.png"
    with = "textures/skater_m/CS_NH_crotchshort"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = Miniskirt
    frontend_desc = 'Miniskirt'
    mesh = "models/skater_f/pant_miniskirt.skin"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = #"Short Skirt"
    frontend_desc = 'Skirt'
    mesh = "models/skater_f/pant_shortskirt.skin"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = #"Short Floral Skirt"
    frontend_desc = 'Floral Skirt'
    mesh = "models/skater_f/pant_shortskirt.skin"
    replace = "CS_NH_skirt.png"
    with = "textures/skater_m/CS_NH_skirt_floral"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = #"Short Pleated Skirt"
    frontend_desc = 'Pleated Skirt'
    mesh = "models/skater_f/pant_shortskirt.skin"
    replace = "CS_NH_skirt.png"
    with = "textures/skater_m/CS_NH_pleatedskirt"
    shows_panties
    supports_kneepads
  }
  {
    desc_id = #"Baggy Pants"
    frontend_desc = 'Baggy Pants'
    mesh = "models/skater_f/pant_baggy.skin"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Regular Pants"
    frontend_desc = 'Regular Pants'
    mesh = "models/skater_f/pant_regular.skin"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Floral Pants"
    frontend_desc = 'Floral Pants'
    mesh = "models/skater_f/pant_regular.skin"
    replace = "CS_NH_steamer_pants.png"
    with = "textures/skater_m/CS_NH_baggypants_flora"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Snow Pants"
    frontend_desc = 'Snow Pants'
    mesh = "models/skater_f/pant_baggy.skin"
    replace = "CS_NH_steamer_pants.png"
    with = "textures/skater_m/CS_NH_baggypants_snow"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Camo Pants"
    frontend_desc = 'Camo Pants'
    mesh = "models/skater_f/pant_baggy.skin"
    replace = "CS_NH_steamer_pants.png"
    with = "textures/skater_m/CS_NH_cargoshorts_camo"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Stripe Pants"
    frontend_desc = 'Stripe Pants'
    mesh = "models/skater_f/pant_regular.skin"
    replace = "CS_NH_steamer_pants.png"
    with = "textures/skater_m/CS_NH_baggypants_stripe"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Cord Pants"
    frontend_desc = 'Cord Pants'
    mesh = "models/skater_f/pant_regular.skin"
    replace = "CS_NH_steamer_pants.png"
    with = "textures/skater_m/CS_NH_baggypants_cord"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Tight Pants"
    frontend_desc = 'Tight Pants'
    mesh = "models/skater_f/pant_tight.skin"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
  {
    desc_id = #"Ankle Pants"
    frontend_desc = 'Ankle Pants'
    mesh = "models/skater_f/pant_ankle.skin"
    script disqualify_script
      cas_temp_disq_remove_kneepads
    endscript
    shows_panties
  }
  {
    desc_id = #"Shorts Daisy"
    frontend_desc = 'Shorts Daisy'
    mesh = "models/skater_f/pant_jennashorts.skin"
    only_with = [ JENNA ]
    supports_kneepads
  }
  {
    desc_id = #"Steamer Pants"
    frontend_desc = 'Steamer Pants'
    mesh = "models/skater_f/pant_steamer.skin"
    script disqualify_script
      cas_temp_disq_remove_socks
      cas_temp_disq_remove_kneepads
    endscript
  }
]
skater_f_hair = [
  {
    desc_id = #"Long Dark"
    frontend_desc = 'Long Dark'
    mesh = "models/skater_f/hair_long.skin"
  }
  {
    desc_id = #"Long Light"
    frontend_desc = 'Long Light'
    mesh = "models/skater_f/hair_long.skin"
    replace = "CS_JB_Hair_F_Longhair1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Longhair1_L1"
    replace1 = "CS_JB_Hair_F_Longhair1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Longhair1_L2"
  }
  {
    desc_id = #"Longer Light"
    frontend_desc = 'Longer Light'
    mesh = "models/skater_f/hair_longer.skin"
  }
  {
    desc_id = #"Thin Long Dark"
    frontend_desc = 'Thin Long Dark'
    mesh = "models/skater_f/hair_longthin.skin"
  }
  {
    desc_id = #"Thin Long Light"
    frontend_desc = 'Thin Long Light'
    mesh = "models/skater_f/hair_longthin.skin"
    replace = "CS_JB_Hair_F_Longhair2_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Longhair2_L1"
    replace1 = "CS_JB_Hair_F_Longhair2_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Longhair2_L2"
    replace2 = "CS_JB_Hair_F_Longhair2_D3.png"
    with2 = "textures/skater_m/CS_JB_Hair_F_Longhair2_L3"
  }
  {
    desc_id = #"The 80s Dark"
    frontend_desc = 'The 80\'s Dark'
    mesh = "models/skater_f/hair_high.skin"
  }
  {
    desc_id = #"Medium Dark"
    frontend_desc = 'Medium Dark'
    mesh = "models/skater_f/hair_medium.skin"
  }
  {
    desc_id = #"Medium Light"
    frontend_desc = 'Medium Light'
    mesh = "models/skater_f/hair_medium.skin"
    replace = "CS_JB_Hair_F_Medium1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Medium1_L1"
    replace1 = "CS_JB_Hair_F_Medium1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Medium1_L2"
  }
  {
    desc_id = #"Cropped Dark"
    frontend_desc = 'Cropped Dark'
    mesh = "models/skater_f/hair_cropped.skin"
  }
  {
    desc_id = #"Cropped Light"
    frontend_desc = 'Cropped Light'
    mesh = "models/skater_f/hair_cropped.skin"
    replace = "CS_JB_Hair_F_Cropped1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Cropped1_L1"
    replace1 = "CS_JB_Hair_F_Cropped1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Cropped1_L2"
  }
  {
    desc_id = #"Bushy Dark"
    frontend_desc = 'Bushy Dark'
    mesh = "models/skater_f/hair_bushy.skin"
  }
  {
    desc_id = #"Bushy Light"
    frontend_desc = 'Bushy Light'
    mesh = "models/skater_f/hair_bushy.skin"
    replace = "CS_JB_Hair_F_Bushy1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Bushy1_L1"
    replace1 = "CS_JB_Hair_F_Bushy1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Bushy1_L2"
  }
  {
    desc_id = #"Pigtails Dark"
    frontend_desc = 'Pigtails Dark'
    mesh = "models/skater_f/hair_pigtails.skin"
  }
  {
    desc_id = #"Pigtails Light"
    frontend_desc = 'Pigtails Light'
    mesh = "models/skater_f/hair_pigtails.skin"
    replace = "CS_JB_Hair_F_Pigtails1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Pigtails1_L1"
  }
  {
    desc_id = #"Ponytail Dark"
    frontend_desc = 'Ponytail Dark'
    mesh = "models/skater_f/hair_ponytail.skin"
  }
  {
    desc_id = #"Ponytail Light"
    frontend_desc = 'Ponytail Light'
    mesh = "models/skater_f/hair_ponytail.skin"
    replace = "CS_JB_Hair_F_Ponytail1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Ponytail1_L1"
  }
  {
    desc_id = #"Very Short Dark"
    frontend_desc = 'Very Short Dark'
    mesh = "models/skater_f/hair_veryshort.skin"
    is_short_hair
  }
  {
    desc_id = #"Very Short Light"
    frontend_desc = 'Very Short Light'
    mesh = "models/skater_f/hair_veryshort.skin"
    replace = "CS_JB_Hair_F_Buzz1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Buzz1_L1"
    replace1 = "CS_JB_Hair_F_Buzz1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Buzz1_L2"
    is_short_hair
  }
  {
    desc_id = #"Mohawk Dark"
    frontend_desc = 'Mohawk Dark'
    mesh = "models/skater_f/hair_mohawk.skin"
  }
  {
    desc_id = #"Mohawk Light"
    frontend_desc = 'Mohawk Light'
    mesh = "models/skater_f/hair_mohawk.skin"
    replace = "CS_JB_Hair_F_Mohawk1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Mohawk1_L1"
  }
  {
    desc_id = Bald
    frontend_desc = 'Bald'
    is_short_hair
    no_color
  }
]
skater_f_kneepads = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Knee Pads"
    frontend_desc = 'Knee Pads'
    mesh = "models/skater_m/extra_kneepad.skin"
    force_vert_shorts
  }
  {
    desc_id = #"Vert Knee Pads"
    frontend_desc = 'Vert Knee Pads'
    mesh = "models/skater_m/extra_kneepad.skin"
    replace = "CS_NN_kneepad01.png"
    with = "textures/skater_m/CS_NN_kneepad02"
    force_vert_shorts
  }
]
skater_f_socks = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = High
    frontend_desc = 'High'
    mesh = "models/skater_f/extra_socks.skin"
    replace = "CS_NN_socks.png"
    with = "textures/skater_m/CS_NH_sock02"
  }
  {
    desc_id = Medium
    frontend_desc = 'Medium'
    mesh = "models/skater_f/extra_socks.skin"
  }
  {
    desc_id = Ankle
    frontend_desc = 'Ankle'
    mesh = "models/skater_f/extra_socks.skin"
    replace = "CS_NN_socks.png"
    with = "textures/skater_m/CS_NH_sock03"
  }
  {
    desc_id = Sport
    frontend_desc = 'Sport'
    mesh = "models/skater_f/extra_socks.skin"
    replace = "CS_NN_socks.png"
    with = "textures/skater_m/CAS_MLS_sportsocks"
  }
  {
    desc_id = English
    frontend_desc = 'English'
    mesh = "models/skater_f/extra_socks.skin"
    replace = "CS_NN_socks.png"
    with = "textures/skater_m/CAS_MLS_english"
  }
]
skater_f_elbowpads = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Elbow Pads"
    frontend_desc = 'Elbow Pads'
    mesh = "models/skater_m/extra_elbowpad.skin"
    force_short_sleeve
  }
  {
    desc_id = #" Vert Elbow Pads"
    frontend_desc = 'Vert Elbow Pads'
    mesh = "models/skater_m/extra_elbowpad.skin"
    replace = "CS_NN_elbow01.png"
    with = "textures/skater_m/CS_NN_elbow02"
    force_short_sleeve
  }
]
skater_f_backpack = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Backpack 1"
    frontend_desc = 'Backpack 1'
    mesh = "models/skater_f/extra_backpack.skin"
    is_backpack
    not_with_elissa
  }
  {
    desc_id = #"Backpack 2"
    frontend_desc = 'Backpack 2'
    mesh = "models/skater_f/extra_backpack.skin"
    replace = "CS_MLS_backpack01F.png"
    with = "textures/skater_m/CS_MLS_backpack02F"
    is_backpack
    not_with_elissa
  }
]
