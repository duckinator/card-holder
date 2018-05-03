card_width      = 65;
card_length     = 85;
deck_thickness  = 20;

slot_width      = card_width / 2;
slot_offset     = (card_width - slot_width) / 2;
wall_thickness  = 2;

part_width  = card_width + (wall_thickness * 2);
part_length = card_length + (wall_thickness * 2);
part_height = deck_thickness * 1.25 + wall_thickness;

// It renders really weirdly if two intersecting things have the exact
// same coordinates.
glitch_adjustment = 0.1;

width_chunk = card_width / 4;

difference() {
    // Create a solid cube.
    cube([part_width, part_length, part_height]);

    // Remove the section the cards actually sit in.
    translate([ wall_thickness, -wall_thickness, wall_thickness])
        cube([card_width, part_length, part_height]);

    // Bottom slots.
    for (i=[0,2,4])
        translate([ slot_offset,
                    width_chunk * i - glitch_adjustment,
                   -glitch_adjustment])
            cube([width_chunk * 2,
                  width_chunk,
                  wall_thickness + (glitch_adjustment * 2)]);
    
    // Side slots.
    for (i=[1,3])
        translate([-glitch_adjustment,
                    width_chunk * i,
                    slot_offset / 2])
            cube([part_width + (glitch_adjustment * 2),
                  width_chunk,
                  part_height - (width_chunk / 2) + glitch_adjustment]);

    // Rear slot.
    translate([width_chunk,
               part_length - wall_thickness - glitch_adjustment,
               slot_offset / 2])
        cube([slot_width + (wall_thickness * 2),
              wall_thickness + (glitch_adjustment * 2),
              part_height]);
}