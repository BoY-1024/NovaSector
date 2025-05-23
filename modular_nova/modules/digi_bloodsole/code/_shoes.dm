/obj/item/clothing/shoes/worn_overlays(isinhands = FALSE,icon_file, mutant_styles = NONE)
	. = ..()
	if(isinhands)
		return
	if(damaged_clothes)
		. += mutable_appearance('icons/effects/item_damage.dmi', "damagedshoe")

/obj/item/clothing/shoes/separate_worn_overlays(mutable_appearance/standing, mutable_appearance/draw_target, isinhands = FALSE, icon_file, mutant_styles = NONE)
	. = ..()
	if(isinhands)
		return

	if(GET_ATOM_BLOOD_DNA_LENGTH(src))
		var/mutable_appearance/blood_overlay
		if (mutant_styles & CLOTHING_DIGITIGRADE_VARIATION)
			if(clothing_flags & LARGE_WORN_ICON)
				blood_overlay = mutable_appearance('modular_nova/modules/digi_bloodsole/icons/64x64.dmi', "shoeblood_large_digi")
			else
				blood_overlay = mutable_appearance('modular_nova/modules/digi_bloodsole/icons/blood.dmi', "shoeblood_digi")
		else
			if(clothing_flags & LARGE_WORN_ICON)
				blood_overlay = mutable_appearance('icons/effects/64x64.dmi', "shoeblood_large")
			else
				blood_overlay = mutable_appearance('icons/effects/blood.dmi', "shoeblood")
		blood_overlay.color = get_blood_dna_color(GET_ATOM_BLOOD_DNA(src))
		. += blood_overlay
