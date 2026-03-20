from card_scraper import scrape_cards
import sys

player = sys.argv[1]
color = sys.argv[2]

out = open("data/" + player + "_cards.sql", "w")
out.write("INSERT INTO card VALUES\n")

for card in scrape_cards(player, color):
    out.write(card)
    out.write("\n")

out.close()