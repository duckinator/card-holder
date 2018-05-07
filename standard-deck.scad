use <card-holder.scad>;

// NOTE: render() makes it the preview not look weird, but performs worse.
render() {
    holder(card_width=65,
            card_length=85,
            deck_thickness=20);
}

// % = show it in the preview, but not the final render.
% render() {
    translate([0, 87, 27])
        rotate([180, 0, 0])
            holder(card_width=65,
                    card_length=85,
                    deck_thickness=20);
}