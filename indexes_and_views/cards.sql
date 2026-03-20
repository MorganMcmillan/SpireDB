-- @block Card rarities

CREATE VIEW starter_card AS
SELECT * FROM card
WHERE rarity = "Starter";

CREATE VIEW common_card AS
SELECT * FROM card
WHERE rarity = "Common";

CREATE VIEW uncommon_card AS
SELECT * FROM card
WHERE rarity = "Uncommon";

CREATE VIEW rare_card AS
SELECT * FROM card
WHERE rarity = "Rare";

CREATE VIEW special_card AS
SELECT * FROM card
WHERE rarity = "Special";

CREATE VIEW shop_card AS
SELECT * FROM card
WHERE rarity = "Shop";

CREATE VIEW boss_card AS
SELECT * FROM card
WHERE rarity = "Boss";

-- @block card types

CREATE VIEW attack_type_card AS
SELECT * FROM card
WHERE type = "Attack";

CREATE VIEW skill_type_card AS
SELECT * FROM card
WHERE type = "Skill";

CREATE VIEW power_type_card AS
SELECT * FROM card
WHERE type = "Power";

CREATE VIEW status_type_card AS
SELECT * FROM card
WHERE type = "Status";

CREATE VIEW curse_type_card AS
SELECT * FROM card
WHERE type = "Curse";

-- @block Card Colors

CREATE VIEW red_card AS
SELECT * FROM card
WHERE Color = "Red";

CREATE VIEW green_card AS
SELECT * FROM card
WHERE Color = "Green";

CREATE VIEW blue_card AS
SELECT * FROM card
WHERE Color = "Blue";

CREATE VIEW purple_card AS
SELECT * FROM card
WHERE Color = "Purple";

CREATE VIEW colorless_card AS
SELECT * FROM card
WHERE Color = "Colorless";

CREATE VIEW grey_card AS
SELECT * FROM card
WHERE Color = "Grey";

CREATE VIEW black_card AS
SELECT * FROM card
WHERE Color = "Black";
