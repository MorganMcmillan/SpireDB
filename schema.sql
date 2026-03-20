DROP DATABASE SpireDB;

CREATE DATABASE IF NOT EXISTS SpireDB;
USE SpireDB;

CREATE TABLE card (
    name VARCHAR(64) PRIMARY KEY,
    description TEXT NOT NULL,
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Shop", "Boss"),
    cost TINYINT, -- NULL if unplayable, -1 if X cost
    CHECK (cost IS NULL OR cost >= -1),
    upgraded_cost TINYINT,
    CHECK (upgraded_cost IS NULL OR upgraded_cost >= -1),
    type ENUM("Attack", "Skill", "Power", "Status", "Curse"),
    color ENUM("Red", "Green", "Blue", "Purple", "Colorless", "Grey", "Black")
);

-- Card Subclasses

CREATE TABLE attack_card (
    name VARCHAR(64) PRIMARY KEY,
    damage TINYINT,
    upgraded_damage TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE defend_card (
    name VARCHAR(64) PRIMARY KEY,
    block TINYINT,
    upgraded_block TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE strength_card (
    name VARCHAR(64) PRIMARY KEY,
    strength TINYINT,
    upgraded_strength TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE healing_card (
    name VARCHAR(64) PRIMARY KEY,
    health TINYINT,
    upgraded_health TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE harming_card (
    name VARCHAR(64) PRIMARY KEY,
    damage TINYINT,
    upgraded_damage TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE draw_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE add_card (
    name VARCHAR(64) PRIMARY KEY,
    type VARCHAR(16),
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE producer_card (
    name VARCHAR(64) PRIMARY KEY,
    type VARCHAR(16),
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE precursor_card (
    name VARCHAR(64) PRIMARY KEY,
    card VARCHAR(64),
    amount TINYINT DEFAULT 1,
    upgraded_amount TINYINT,
    FOREIGN KEY (card) REFERENCES card(name),
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE discard_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE hand_to_draw_pile_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE self_exhaust_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE exhausting_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE ethereal_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE retain_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE innate_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE cost_reduction_card (
    name VARCHAR(64) PRIMARY KEY,
    cost TINYINT,
    upgraded_cost TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE upgrading_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT, -- 10 for hand, 100 for ENTIRE DECK
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE repeat_card (
    name VARCHAR(64) PRIMARY KEY,
    times TINYINT,
    upgraded_times TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE multiplier_card (
    name VARCHAR(64) PRIMARY KEY,
    effect VARCHAR(64), -- Weak foreign key to effect.
    times TINYINT,
    upgraded_times TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE artifact_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT DEFAULT 1,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE vulnerable_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE weakening_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE dexterity_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE strength_down_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE intangible_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT DEFAULT 1,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE energy_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE poison_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE channeling_card (
    name VARCHAR(64) PRIMARY KEY,
    orb VARCHAR(16) NOT NULL,
    times TINYINT,
    upgraded_times TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE evoking_card (
    name VARCHAR(64) PRIMARY KEY,
    times TINYINT,
    upgraded_times TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE focusing_card (
    name VARCHAR(64) PRIMARY KEY,
    amount TINYINT,
    upgraded_amount TINYINT,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE no_draw_card (
    name VARCHAR(64) PRIMARY KEY,
    turns TINYINT DEFAULT 1,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE shuffling_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE start_of_turn_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE end_of_turn_card (
    name VARCHAR(64) PRIMARY KEY,
    turns TINYINT DEFAULT 1,
    upgraded_turns TINYINT DEFAULT 1,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE on_draw_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE on_kill_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);


CREATE TABLE random_enemy_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE all_enemies_card (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES card(name)
);

CREATE TABLE has_intent_card (
    name VARCHAR(64) PRIMARY KEY,
    intent VARCHAR(16), -- TODO: make FOREIGN KEY to intent.name
    FOREIGN KEY (name) REFERENCES card(name),
    FOREIGN KEY (intent) REFERENCES intent(name),
);

CREATE TABLE has_debuff_card (
    name VARCHAR(64) PRIMARY KEY,
    debuff VARCHAR(16), -- TODO: make FOREIGN KEY to debuff.name
    FOREIGN KEY (name) REFERENCES card(name),
    FOREIGN KEY (debuff) REFERENCES effect(name)
);

CREATE TABLE potion (
    name VARCHAR(64) PRIMARY KEY,
    description TEXT NOT NULL,
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Shop", "Boss"),
    player VARCHAR(16)
);

CREATE TABLE relic (
    name VARCHAR(64) PRIMARY KEY,
    description TEXT NOT NULL,
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Event", "Shop", "Boss"),
    player VARCHAR(16), -- Weak foreign key to player. Cannot use actual foreign key due to player referencing `relic`
    CHECK (player IS NULL or player IN (SELECT name FROM player))
);

CREATE TABLE card_cost (
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Shop", "Boss"),
    color ENUM("Red", "Green", "Blue", "Purple", "Colorless", "Grey", "Black"),
    min_cost SMALLINT,
    max_cost SMALLINT,
    PRIMARY KEY(rarity, color)
);

CREATE TABLE potion_cost (
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Shop", "Boss") PRIMARY KEY,
    min_cost SMALLINT,
    max_cost SMALLINT
);

CREATE TABLE relic_cost (
    rarity ENUM("Starter", "Common", "Uncommon", "Rare", "Special", "Shop", "Boss") PRIMARY KEY,
    min_cost SMALLINT,
    max_cost SMALLINT
);

-- High-level game information

CREATE TABLE player (
    name VARCHAR(16) PRIMARY KEY,
    color ENUM("Red", "Green", "Blue", "Purple", "Colorless", "Grey", "Black"),
    starting_relic VARCHAR(64),
    FOREIGN KEY (starting_relic) REFERENCES relic(name)
);

CREATE TABLE intent (
    name VARCHAR(32) PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE effect (
    name VARCHAR(24) PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE enemy (
    name VARCHAR(64) PRIMARY KEY,
    health SMALLINT NOT NULL,
    act TINYINT NOT NULL,
    CHECK (act BETWEEN 1 AND 4)
);

-- Enemy subclasses

CREATE TABLE monster (
    name VARCHAR(64) PRIMARY KEY,
    first_encounters TINYINT,
    encounter_chance DECIMAL(5, 3)
);

CREATE TABLE elite (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES enemy(name)
);

CREATE TABLE boss (
    name VARCHAR(64) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES enemy(name)
);

CREATE TABLE minion (
    name VARCHAR(64) PRIMARY KEY,
    summoner VARCHAR(64),
    FOREIGN KEY (summoner) REFERENCES enemy(name),
    FOREIGN KEY (name) REFERENCES enemy(name)
);

CREATE TABLE event (
    name VARCHAR(64) PRIMARY KEY,
    act TINYINT, -- or NULL if it appears in every or some acts
    CHECK (act IS NULL OR act BETWEEN 1 AND 4)
);

-- Synergies

CREATE TABLE card_synergy (
    card VARCHAR(64),
    with_card VARCHAR(64),
    explanation TEXT,
    CHECK (SUBSTR(explanation, -1, 1) = ".") -- That the explanation is a full sentence.
    PRIMARY KEY (card, with_card),
    FOREIGN KEY (card) REFERENCES card(name),
    FOREIGN KEY (with_card) REFERENCES card(name)
);

CREATE TABLE potion_synergy (
    potion VARCHAR(64),
    with_card VARCHAR(64),
    explanation TEXT,
    CHECK (SUBSTR(explanation, -1, 1) = ".") -- That the explanation is a full sentence.
    PRIMARY KEY (potion, with_card),
    FOREIGN KEY (potion) REFERENCES potion(name),
    FOREIGN KEY (with_card) REFERENCES card(name)
);

CREATE TABLE relic_synergy (
    relic VARCHAR(64),
    with_card VARCHAR(64),
    explanation TEXT,
    CHECK (SUBSTR(explanation, -1, 1) = ".") -- That the explanation is a full sentence.
    PRIMARY KEY (relic, with_card),
    FOREIGN KEY (relic) REFERENCES relic(name),
    FOREIGN KEY (with_card) REFERENCES card(name)
);