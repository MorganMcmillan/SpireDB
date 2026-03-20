CREATE FULLTEXT INDEX card_description
ON card (description);

CREATE FULLTEXT INDEX potion_description
ON potion (description);

CREATE FULLTEXT INDEX relic_description
ON relic (description);

CREATE FULLTEXT INDEX generated_card
ON precursor_card (card);

-- Synergy explanations

CREATE FULLTEXT INDEX card_synergy_explanation
ON card_synergy (explanation);

CREATE FULLTEXT INDEX potion_synergy_explanation
ON potion_synergy (explanation);

CREATE FULLTEXT INDEX relic_synergy_explanation
ON relic_synergy (explanation);