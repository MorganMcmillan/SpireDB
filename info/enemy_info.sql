-- @block Select average health
SELECT AVG(health) FROM enemy;

-- @block Select average health per act
SELECT AVG(health), act FROM enemy
GROUP BY act
ORDER BY act;

-- @block Select average MONSTER health
SELECT AVG(health) FROM enemy
NATURAL JOIN monster;

-- @block Select average MONSTER health per act
SELECT AVG(health), act FROM enemy
NATURAL JOIN monster
GROUP BY act
ORDER BY act;

-- @block Select average ELITE health
SELECT AVG(health) FROM enemy
NATURAL JOIN elite;

-- @block Select average ELITE health per act
SELECT AVG(health), act FROM enemy
NATURAL JOIN elite
GROUP BY act
ORDER BY act;

-- @block Select average BOSS health
SELECT AVG(health) FROM enemy
NATURAL JOIN boss;

-- @block Select average BOSS health per act
SELECT AVG(health), act FROM enemy
NATURAL JOIN boss
GROUP BY act
ORDER BY act;

-- @block Select the enemy with the most health
SELECT name, health FROM enemy
WHERE health = (SELECT MAX(health) FROM enemy);

-- @block Select the enemy with the least health
SELECT name, health FROM enemy
WHERE health = (SELECT MIN(health) FROM enemy);

-- @block Select enemies that can be killed in one hit
SELECT name, health FROM enemy
WHERE health <= (SELECT MAX(upgraded_damage) FROM attack_card)
ORDER BY health ASC;

-- @block Select how many enemies are in each act
SELECT COUNT(*), act FROM enemy
GROUP BY act
ORDER BY act;