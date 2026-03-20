from scraper import *

# HTML table schema: Name, Rarity, Effect

def fix_potion(potion):
    return [
        potion[0],
        potion[2],
        isolate_rarity(potion[1]),
        get_player(potion[1])
    ]

def scrape_potions():
    rows = scrape_data("potions.html", potion_row)
    potions = map(fix_potion, rows)
    potions = map(format_row, potions)
    return potions

out = open("data/potions.sql", "w")
out.write("INSERT INTO potion VALUES\n")

for potion in scrape_potions():
    out.write(potion)
    out.write("\n")

out.close()