-- @block Select most expensive cards
SELECT name, description, cost FROM card
WHERE cost = (SELECT MAX(cost) FROM card);

-- @block Select all X cost cards
SELECT name, description FROM card
WHERE cost = -1;

-- @block Select card with highest attack for each color
SELECT name, damage, color FROM card
NATURAL JOIN attack_card
WHERE (damage, color) IN (
    SELECT MAX(damage), color FROM card
    NATURAL JOIN attack_card
    GROUP BY color
)
ORDER BY damage DESC
-- There are only 5 card colors
LIMIT 5;

-- @block Select card with highest defense for each color
SELECT name, block, color FROM card
NATURAL JOIN defend_card
WHERE (block, color) IN (
    SELECT MAX(block), color FROM card
    NATURAL JOIN defend_card
    GROUP BY color
)
ORDER BY block DESC
-- There are only 5 card colors
LIMIT 5;

-- @block Select the average damage for each color
SELECT AVG(damage), color FROM card
NATURAL JOIN attack_card
GROUP BY color
ORDER BY AVG(damage) DESC;

-- @block Select the average defense for each color
SELECT AVG(block), color FROM card
NATURAL JOIN defend_card
GROUP BY color
ORDER BY AVG(block) DESC;

-- @block Select the average cost for each color's attacks
SELECT AVG(cost), color FROM card
NATURAL JOIN attack_card
GROUP BY color
ORDER BY AVG(cost) DESC;

-- @block Select cards that are free to play
SELECT name, description FROM card
WHERE cost = 0;

-- @block Select cards that cost 3 or more energy to play
SELECT name, cost, description, color FROM card
WHERE cost >= 3
ORDER BY cost DESC;

-- @block Select how many cards belong to each color
SELECT COUNT(*), color FROM card
GROUP BY color
ORDER BY COUNT(*) DESC;

-- @block Select how many cards belong to each type
SELECT COUNT(*), type FROM card
GROUP BY type
ORDER BY COUNT(*) DESC;

-- @block Select how many cards belong to both each color and type
SELECT COUNT(*), color, type FROM card
GROUP BY color, type
ORDER BY color, type;

-- @block All card synergies
SELECT * FROM card_synergy;

-- @block "Fast" card synergies
SELECT * FROM card_synergy
WHERE explanation LIKE "%fast%"
OR explanation LIKE "%quick";

-- @block How many synergies a card has
CREATE OR REPLACE VIEW card_synergy_count AS
SELECT name, COUNT(*) AS synergy_count FROM (
    SELECT card AS name FROM card_synergy
    UNION ALL
    SELECT with_card AS name FROM card_synergy
) synergies
GROUP BY name
ORDER BY COUNT(*) DESC;

-- @block
SELECT * FROM card_synergy_count;

-- @block Which characters have the most synergies?
SELECT p.name, SUM(synergy_count) FROM player p
INNER JOIN card c ON p.color = c.color
INNER JOIN card_synergy_count s ON c.name = s.name
GROUP BY p.name
ORDER BY SUM(synergy_count) DESC;

-- @block Cards that cost less when upgraded
SELECT name, cost, upgraded_cost, description FROM card
WHERE upgraded_cost < cost;

-- @block Cards that become free when upgraded
SELECT name, cost, upgraded_cost, description FROM card
WHERE upgraded_cost = 0 AND cost <> 0;

-- @block Cards that cost less but are not free when upgraded
SELECT name, cost, upgraded_cost, description FROM card
WHERE upgraded_cost < cost
AND upgraded_cost <> 0;