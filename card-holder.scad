module holder(card_width, card_length, deck_thickness) {
    wall_thickness  = 2;
    part_width      = card_width  + (wall_thickness * 2);
    part_length     = card_length +  wall_thickness;
    part_height     = deck_thickness * 1.25;
    slot_width      = part_width / 2;
    slot_offset     = part_width / 4;

    difference() {
        // Create a solid cube.
        cube([part_width, part_length, part_height]);

        // Remove the section the cards actually sit in.
        translate([wall_thickness, -wall_thickness, wall_thickness])
            cube([card_width, part_length, part_height]);

        // Bottom slots.
        for (i=[0,2,3])
            translate([slot_offset, slot_offset * i, 0])
                cube([slot_width, slot_offset, wall_thickness]);
        
        // Side slots.
        translate([0, 0, wall_thickness])
            cube([part_width, part_length / 4 + 1, part_height]);

        translate([0, (part_length / 2), wall_thickness])
            cube([part_width, part_length / 4, part_height]);

        *for (i=[0,2,3])
            translate([0, slot_offset * i, wall_thickness])
                cube([part_width,
                      slot_offset,
                      part_height]);//part_height - (slot_offset / 2)]);

        // Rear slot.
        translate([slot_offset, part_length - wall_thickness, slot_offset / 2])
            cube([slot_width, wall_thickness, part_height]);
    }
}

// NOTE: render() makes it the preview not look weird, but performs worse.
render() {
    holder(card_width=65, card_length=85, deck_thickness=20);
}

// % = show it in the preview, but not the final render.
% render() {
    translate([0, 87, 27])
        rotate([180, 0, 0])
            holder(card_width=65, card_length=85, deck_thickness=20);
}
