-- @block remove previous table data
TRUNCATE TABLE attack_card;
TRUNCATE TABLE defend_card;
TRUNCATE TABLE strength_card;
TRUNCATE TABLE healing_card;
TRUNCATE TABLE harming_card;
TRUNCATE TABLE draw_card;
TRUNCATE TABLE add_card;
TRUNCATE TABLE producer_card;
TRUNCATE TABLE precursor_card;
TRUNCATE TABLE discard_card;
TRUNCATE TABLE hand_to_draw_pile_card;
TRUNCATE TABLE self_exhaust_card;
TRUNCATE TABLE exhausting_card;
TRUNCATE TABLE ethereal_card;
TRUNCATE TABLE retain_card;
TRUNCATE TABLE innate_card;
TRUNCATE TABLE cost_reduction_card;
TRUNCATE TABLE upgrading_card;
TRUNCATE TABLE repeat_card;
TRUNCATE TABLE multiplier_card;
TRUNCATE TABLE artifact_card;
TRUNCATE TABLE vulnerable_card;
TRUNCATE TABLE weakening_card;
TRUNCATE TABLE dexterity_card;
TRUNCATE TABLE strength_down_card;
TRUNCATE TABLE intangible_card;
TRUNCATE TABLE energy_card;
TRUNCATE TABLE poison_card;
TRUNCATE TABLE channeling_card;
TRUNCATE TABLE evoking_card;
TRUNCATE TABLE focusing_card;
TRUNCATE TABLE no_draw_card;
TRUNCATE TABLE shuffling_card;
TRUNCATE TABLE start_of_turn_card;
TRUNCATE TABLE end_of_turn_card;
TRUNCATE TABLE on_draw_card;
TRUNCATE TABLE on_kill_card;
TRUNCATE TABLE random_enemy_card;
TRUNCATE TABLE all_enemies_card;
TRUNCATE TABLE has_intent_card;
TRUNCATE TABLE has_debuff_card;

-- Attack cards

-- @block With upgrade
INSERT INTO attack_card (name, damage, upgraded_damage)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "deal \\d+\\(\\d+\\)\\s+damage") AS value
    FROM card
    WHERE type = "Attack"),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO attack_card (name, damage, upgraded_damage)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "deal \\d+\\s+damage") AS value
    FROM card
    WHERE type = "Attack"),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Defense cards

-- @block With upgrade
INSERT INTO defend_card (name, block, upgraded_block)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "gain \\d+\\(\\d+\\)\\s+block") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO defend_card (name, block, upgraded_block)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "gain \\d+\\s+block") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Strength cards

-- @block With upgrade
INSERT INTO strength_card (name, strength, upgraded_strength)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "gain \\d+\\(\\d+\\)\\s+strength") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO strength_card (name, strength, upgraded_strength)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "gain \\d+\\s+strength") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Healing cards
-- Yes I know there's a typo

-- @block With upgrade
INSERT INTO healing_card (name, health, upgraded_health)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "heal \\d+\\(\\d+\\)\\s+hp") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO healing_card (name, health, upgraded_health)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "heal \\d+\\s+hp") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Harming cards

-- @block With upgrade
INSERT INTO harming_card (name, damage, upgraded_damage)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "take \\d+\\(\\d+\\)\\s+damage") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO harming_card (name, damage, upgraded_damage)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "take \\d+\\s+damage") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Draw cards

-- @block With upgrade
INSERT INTO draw_card (name, amount, upgraded_amount)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "draw \\d+\\(\\d+\\)\\s+card") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, "(", 1) AS value,
    SUBSTRING_INDEX(SUBSTRING_INDEX(value, "(", -1), ")", 1) AS upgraded_value
    FROM values1
)
SELECT name, SUBSTR(value, 5), upgraded_value FROM values2
WHERE value IS NOT NULL;

-- @block No upgrade
INSERT INTO draw_card (name, amount, upgraded_amount)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "draw \\d+\\s+card") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTR(value, 5, 3) AS value FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- Add cards

-- @block Choose one of any random card
INSERT INTO add_card (name, type)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Choose 1 of 3 \\w+") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, " ", -1) AS value
    FROM values1
)
SELECT name, value FROM values2
WHERE value IS NOT NULL;

-- Producer cards

-- @block Adds a specific type of random card
INSERT INTO producer_card (name, type)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Add a random \\w+") AS value
    FROM card),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, " ", -1) AS value
    FROM values1
)
SELECT name, value FROM values2
WHERE value IS NOT NULL;

-- Precursor cards
-- These cards add specific cards

-- @block Adds a single specific card
INSERT INTO precursor_card (name, card, amount, upgraded_amount)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Add a \\w+") AS value
    FROM card
    ),
values2 AS (
    SELECT name, SUBSTRING_INDEX(value, " ", -1) AS value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, 1, 1 FROM values2
WHERE value in (SELECT name FROM card);

-- @block Shuffles in a single specific card to your draw pile
INSERT INTO precursor_card (name, card, amount, upgraded_amount)
with values1 as (
    select name, REGEXP_SUBSTR(description, "shuffle an? .+into") as value
    from card
    ),
values2 AS (
    SELECT name, SUBSTRING_INDEX(
        SUBSTRING_INDEX(
            SUBSTR(value, 11),
            " with", 1),
        " into", 1) AS value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, TRIM(value), 1, 1 FROM values2;

-- @block Adds multiple of the same card
INSERT IGNORE INTO precursor_card (name, card, amount, upgraded_amount)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Add \\d\\(\\d\\) .+to") AS value
    FROM CARD
),
values2 AS (
    SELECT name, REGEXP_REPLACE((SUBSTR(value, 4)), "( i?n?to|\\(|\\))", "") AS value
    FROM values1
)
SELECT name, SUBSTRING_INDEX(SUBSTRING_INDEX(value, " ", -1), "s", 1), SUBSTR(value, 1, 2), SUBSTR(value, 3, 2) FROM values2
WHERE value IS NOT NULL;

-- Discard cards

-- @block Specific number of cards
INSERT INTO discard_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "discard .+ card") AS value
    FROM card
),
values2 AS (
    SELECT name, REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
)
SELECT name, value, IFNULL(upgraded_value, value) FROM values2
WHERE value IS NOT NULL;

-- @block Entire hand
-- Note: the max hand size is 10, so 10 means to discard your entire hand.
REPLACE INTO discard_card
SELECT name, 10, 10 FROM card
WHERE description LIKE "%discard your hand%";

-- From hand to the draw pile cards

-- @block Best to just do it manually
INSERT INTO hand_to_draw_pile_card VALUES
    ("Forethought", 1, 10),
    ("Setup", 1, 1),
    ("Thinking Ahead", 1, 1),
    ("Warcry", 1, 1);

-- Self exhaust cards

-- @block
INSERT INTO self_exhaust_card
SELECT name FROM card
WHERE description LIKE "%Exhaust.%";

-- Exhausting other cards

-- @block Just one card
INSERT INTO exhausting_card (name, amount, upgraded_amount)
SELECT name, 1, 1 FROM card
WHERE description LIKE "%Exhaust 1 card%"
OR description LIKE "%Exhaust a %";

-- @block Any number of cards
INSERT INTO exhausting_card (name, amount, upgraded_amount)
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Exhaust \\d+\\(\\d+\\)") AS value
    FROM card
)
SELECT name, REGEXP_SUBSTR(value, "\\d+"), REGEXP_SUBSTR(value, "\\d+", 1, 2)
FROM values1
WHERE value IS NOT NULL;

-- @block Non-attack cards
INSERT INTO exhausting_card (name, amount, upgraded_amount)
SELECT name, -1, -1 FROM card
WHERE description LIKE "%Exhaust all non-Attack%";

-- @block Ethereal (disappears when not played) cards
INSERT INTO ethereal_card
SELECT name FROM card
WHERE description LIKE "%Ethereal.%";

-- @block Retain (stays in hand after turn) cards
INSERT INTO retain_card
SELECT name FROM card
WHERE description LIKE "%Retain.%";

-- @block Innate (drawn on first turn) cards
INSERT INTO innate_card
SELECT name FROM card
WHERE description LIKE "%Innate.%";

-- Cost reduction cards

-- @block Every card in your hand
INSERT INTO cost_reduction_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "reduce the cost .+ to \\d+") AS value
    FROM card
),
values2 AS (
    SELECT name, REGEXP_SUBSTR(value, "\\d") AS value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, value FROM values2;

-- @block Specific card types (not differentiated)
-- Best to just do this manually
INSERT INTO cost_reduction_card VALUES
    ("Corruption", 0, 0),
    ("Swivel", 0, 0),
    ("Setup", 0, 0);

-- @block Upgrading cards
INSERT INTO upgrading_card 
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Upgrade (a|it)\\b") AS upgrades_one,
    REGEXP_SUBSTR(description, "\\bALL\\b") AS upgrades_all
    FROM card
)
SELECT name, 1, IF(upgrades_all IS NOT NULL, 10, 1) FROM values1
WHERE upgrades_one IS NOT NULL;

-- @block Upgrades entire DECK
INSERT INTO upgrading_card
SELECT name, 100, 100 FROM card
WHERE description REGEXP "Upgrade all"
AND NOT description REGEXP "in your hand";

-- @block Repeating cards (-1 for X times)
INSERT INTO repeat_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "\\(?(\\d+|X) times\\)?") AS value
    FROM card
),
values2 AS (
    SELECT name, SUBSTR(value, 1, 1) AS value,
    SUBSTR(value, 2, 1) AS upgraded_value
    FROM values1
    WHERE value IS NOT NULL
),
values3 AS (
    SELECT name, CASE
        WHEN value = "X" THEN -1
        WHEN value = "(" THEN 1
        ELSE value
    END AS value,
    upgraded_value
    FROM values2
)
SELECT name, value, IF(upgraded_value = " ", value, upgraded_value)
FROM values3;

-- @block Repeating cards (explicit upgraded times)
INSERT INTO repeat_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "^[^\\.]+\\d+\\(\\d+\\) times\\.") as value
    FROM card
),
values2 AS (
    SELECT name, REGEXP_SUBSTR(value, "\\d+\\(\\d+\\) times") AS value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, REGEXP_SUBSTR(value, "\\d+"), REGEXP_SUBSTR(value, "\\d+", 2) FROM values2;

-- @block Multiplier cards
INSERT INTO multiplier_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "double(\\(triple\\))?") AS value,
    SUBSTRING_INDEX(REGEXP_SUBSTR(description, "\\w+\\."), ".", 1) AS effect
    FROM card
)
SELECT name, effect, 2, IF(
    value LIKE "%Triple%",
    3,
    2
) FROM values1
WHERE value IS NOT NULL;

-- @block Artifact cards
INSERT INTO artifact_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Gain .+ Artifact\\.") AS value
    FROM card
)
SELECT name, REGEXP_SUBSTR(value, "\\d+"), REGEXP_SUBSTR(SUBSTRING_INDEX(value, "(", -1), "\\d+") FROM values1
WHERE value IS NOT NULL;

-- @block Vulnerable cards
INSERT INTO vulnerable_card
WITH values1 AS (
    SELECT name,
    REGEXP_SUBSTR(description, "Apply \\d+(\\(\\d+\\))?.+Vulnerable") AS value
    FROM card
),
values2 AS (
    SELECT name,
    REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values2;

-- @block Weakening cards
INSERT INTO weakening_card
WITH values1 AS (
    SELECT name,
    REGEXP_SUBSTR(description, "\\d+(\\(\\d+\\))?\\s+Weak") AS value
    FROM card
),
values2 AS (
    SELECT name,
    REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values2;

-- @block Dexterity cards
INSERT INTO dexterity_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Gain \\d+(\\(\\d+\\))?\\s+Dexterity") AS value
    FROM card
)
SELECT name, REGEXP_SUBSTR(value, "\\d+"), REGEXP_SUBSTR(value, "\\d+", 1, 2) FROM values1
WHERE value IS NOT NULL;

-- @block Strength down cards
INSERT INTO strength_down_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Lose \\d+(\\(\\d+\\))?\\s+Strength") AS value
    FROM card
)
SELECT name, REGEXP_SUBSTR(value, "\\d+"), REGEXP_SUBSTR(value, "\\d+", 1, 2) FROM values1
WHERE value IS NOT NULL;

-- @block Intangible (take no more than one damage) cards
INSERT INTO intangible_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Gain \\d+(\\(\\d+\\))?.+Intangible\\.") AS value
    FROM card
),
values2 AS (
    SELECT name, REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values2;

-- @block Gaining energy cards
INSERT INTO energy_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Gain \\d+(\\(\\d+\\))?\\s+Energy") AS value
    FROM card
),
values2 AS (
    SELECT name, REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
    WHERE value IS NOT NULL
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values2;

-- @block Poisoning cards
INSERT INTO poison_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Apply \\d+(\\(\\d+\\))?\\s+poison") AS value
    FROM card
),
values2 AS (
    SELECT name,
    REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value
    FROM values1
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values2
WHERE value IS NOT NULL;

-- @block Channeling cards
INSERT INTO channeling_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "Channel \\d+(\\(\\d+\\))?\\s+\\w+") AS value
    FROM card
),
values2 AS (
    SELECT name,
    REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value,
    REGEXP_SUBSTR(value, "\\w+$") AS orb
    FROM values1
)
SELECT name, orb, value, COALESCE(upgraded_value, value) FROM values2
WHERE value IS NOT NULL;

-- @block Evoking (orb) cards
INSERT INTO evoking_card
SELECT name, CASE
    WHEN description REGEXP "twice" THEN 2
    WHEN description REGEXP "Remove" THEN 0
    WHEN description REGEXP "X" THEN -1
    ELSE 1
END AS times,
CASE
    WHEN description REGEXP "twice" THEN 2
    WHEN description REGEXP "\\(Evoke\\) ALL" THEN 100
    WHEN description REGEXP "\\(X\\+1\\) times" THEN -2
    ELSE 1
END as upgraded_times
FROM card
WHERE description REGEXP "Evoke";

-- @block Focussing (increases orb effects) cards
INSERT INTO focusing_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "(Gain|Lose) \\d+(\\(\\d+\\))?\\s+Focus") AS value
    FROM card
),
values2 AS (
    SELECT name,
    REGEXP_SUBSTR(value, "\\d+") AS value,
    REGEXP_SUBSTR(value, "\\d+", 1, 2) AS upgraded_value,
    REGEXP_SUBSTR(value, "^\\w+") LIKE "Gain" AS increases
    FROM values1
    WHERE value IS NOT NULL
),
values3 AS (
    SELECT name,
    IF(increases, value, -value) AS value,
    IF(increases, upgraded_value, -upgraded_value) AS upgraded_value
    FROM values2
)
SELECT name, value, COALESCE(upgraded_value, value) FROM values3;

-- @block No draw cards
INSERT INTO no_draw_card (name)
SELECT name FROM card
WHERE description LIKE "%cannot draw%";

-- @block Shuffling cards
INSERT INTO shuffling_card
SELECT name FROM card
WHERE description REGEXP "Shuffle (all|your)";

-- @block Start of your turn cards
INSERT INTO start_of_turn_card
SELECT name FROM card
WHERE description REGEXP "start of (each|your)";

-- @block End of your turn cards
INSERT INTO end_of_turn_card
SELECT name, IFNULL(SUBSTR(REGEXP_SUBSTR(description, "\\d+\\s+turn"), 1, 1), 1), IFNULL(SUBSTR(REGEXP_SUBSTR(description, "\\d+\\s+turn"), 1, 1), 1) FROM card
WHERE description REGEXP "end of (each|your|\\d+) turn";

-- @block On draw cards
INSERT INTO on_draw_card
SELECT name FROM card
WHERE description LIKE "%whenever you draw%";

-- @block On kill cards
INSERT INTO on_kill_card
SELECT name FROM card
WHERE description LIKE "%If this kills a%";

-- @block Targets random enemy cards
INSERT INTO random_enemy_card
SELECT name FROM card
WHERE description LIKE "%random enemy%";

-- @block Targets all enemies cards
INSERT INTO all_enemies_card
SELECT name FROM card
WHERE description LIKE "%ALL enemies%";

-- @block Has intent card
INSERT INTO has_intent_card
-- These only activate when an enemy intends to attack
SELECT name, "Attack" FROM card
WHERE description LIKE "%enemy indends to%";

-- @block Has debuff card
INSERT INTO has_debuff_card
WITH values1 AS (
    SELECT name, REGEXP_SUBSTR(description, "If the enemy is\\s+\\w+") AS value
    FROM card
)
SELECT name, REGEXP_REPLACE(REGEXP_SUBSTR(value, "\\w+$"), "ed", "")
FROM values1
WHERE value IS NOT NULL;