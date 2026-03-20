USE SpireDB;

-- Note: "Red" just means "class specific"
INSERT INTO card_cost VALUES
    ("Common", "Red", 45, 55),
    ("Uncommon", "Red", 68, 82),
    ("Rare", "Red", 135, 165),
    ("Uncommon", "Colorless", 81, 99),
    ("Rare", "Colorless", 162, 198);

INSERT INTO relic_cost VALUES
    ("Common", 143, 157),
    ("Uncommon", 238, 262),
    ("Rare", 285, 315),
    ("Shop", 143, 157);

INSERT INTO potion_cost VALUES
    ("Common", 48, 52),
    ("Uncommon", 72, 78),
    ("Rare", 95, 105);