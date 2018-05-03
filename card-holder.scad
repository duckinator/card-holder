card_width      = 65;
card_length     = 85;
deck_thickness  = 20;

slot_width      = card_width / 2;
slot_offset     = (card_width - slot_width) / 2;
wall_thickness  = 2;

part_width  = card_width + (wall_thickness * 2);
part_length = card_length;
part_height = deck_thickness * 1.25 + wall_thickness;

difference() {
    // Create a solid cube.
    cube([part_width, part_length, part_height]);

    // Remove the section the cards actually sit in.
    translate([ wall_thickness, -wall_thickness, wall_thickness])
        cube([card_width, part_length, part_height]);

    // Remove the bottom slot.
    translate([slot_offset, -1, -1])
        cube([part_width - (slot_offset * 2), (card_length - slot_offset), wall_thickness + 2]);

    width_chunk = card_width / 4;
    for (i=[1, 3])
        translate([-1, width_chunk * i, slot_offset / 2])
            cube([part_width + 2, width_chunk + 1, part_height]);

    translate([width_chunk,
               part_length - (wall_thickness * 2),
               slot_offset / 2])
        cube([slot_width + (wall_thickness * 2), 6, part_height]);

}