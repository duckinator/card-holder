// Can be used to hold the Items, Events, and Omens decks for
// Betrayal at the House on the Hill.

use <card-holder.scad>;

// NOTE: render() makes it the preview not look weird, but performs worse.
render() {
    union() {
        for(i=[0,1,2])
            translate([i*60, 0, 0])
                holder(card_width=58, card_length=110, deck_thickness=20);
    }
}

/*color("green") render() {
    union() {
        rotate([180, 0, 0])
            translate([0, -112, -27])
                for(i=[0,1,2])
                    translate([i*60, 0, 0])
                        holder(card_width=58, card_length=110, deck_thickness=20);
    }
}*/
