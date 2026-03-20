USE SpireDB;

-- Fix name being too long
ALTER TABLE intent
MODIFY COLUMN name VARCHAR(32);

INSERT INTO intent VALUES
    ("Aggressive", "This enemy intends to Attack for a total of N damage."),
    ("Defensive", "This enemy intends to Block."),
    ("Strategic (Debuff)", "This enemy intends to inflict a (powerful) Negative Effect on you."),
    ("Strategic (Buff)", "This enemy intends to use a Buff."),
    ("Aggressive (Debuff)", "This enemy intends to attack and inflict a Negative Effect on you."),
    ("Aggressive (Defense)", "This enemy intends to attack and Block."),
    ("Aggressive (Buff)", "This enemy intends to attack and use a Buff."),
    ("Defensive (Buff)", "This enemy intends to Block and use a Buff."),
    ("Defensive (Debuff)", "This enemy intends to Block and use inflict a Negative Effect on you."),
    ("Cowardly", "This enemy intends to escape."),
    ("Sleeping", "This enemy is asleep. It will do nothing on its turn."),
    ("Stunned", "This enemy is stunned. It will do nothing on its turn."),
    ("Unknown", "This enemy's intent is unknown (not attacking).");