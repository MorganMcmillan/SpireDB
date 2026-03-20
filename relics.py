from scraper import *

def fix_relic(relic):
    return [
        relic[0],
        relic[2],
        isolate_rarity(relic[1]),
        get_player(relic[1])
    ]

def scrape_relics():
    rows = scrape_data("relics.html", relic_row)
    relics = map(fix_relic, rows)
    relics = map(format_row, relics)
    return relics

out = open("data/relics.sql", "w")
out.write("INSERT INTO relic VALUES\n")

for relic in scrape_relics():
    out.write(relic)
    out.write("\n")

out.close()