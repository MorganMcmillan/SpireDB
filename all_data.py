import mysql.connector

def contents(path):
    file = open(path, "r")
    out = file.read()
    file.close()
    return out

def runall(cur, files):
    for file in files:
        print("Running " + file)
        for statement in contents(file).split(";"):
            try:
                cur.execute(statement)
                db.commit()
            except Exception as e:
                print("Error occurred. " + str(e) + " Continuing.")

def dircat(path, files):
    return list(map(lambda file: path + "/" + file, files))

# Run SQL files in the order that ensures that foreign keys are populated
FILES = ["schema.sql"] + dircat("data", [
    "bosses.sql",
    "buffs.sql",
    "colorless_cards.sql",
    "costs.sql",
    "curse_cards.sql",
    "debuffs.sql",
    "defect_cards.sql",
    "events.sql",
    "intents.sql",
    "ironclad_cards.sql",
    "monsters.sql",
    "elites.sql",
    "minions.sql",
    "potions.sql",
    "relics.sql",
    "players.sql",
    "relic_synergies.sql",
    "silent_cards.sql",
    "status_cards.sql",
    "watcher_cards.sql",
    "card_types.sql",
    "card_synergies.sql"
])

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="2Hedges%",
    database="SpireDB"
)

cur = db.cursor()
runall(cur, FILES)

print("Insertion done!")