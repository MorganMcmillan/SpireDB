from scraper import *

def debuff_row(debuff):
    if len(debuff) < 5:
        return
    
    return [debuff[3], debuff[5]]

def unique_debuff_row(debuff):
    if len(debuff) < 5:
        return
    
    return [debuff[3], debuff[9]]
    # return buff

INDENT = "    "

debuffs = scrape_to_sql("debuffs.html", debuff_row, 0)
unique_debuffs = scrape_to_sql("debuffs.html", unique_debuff_row, 2)

out = open("data/debuffs.sql", "w")
out.write("INSERT INTO effect VALUES\n")

for debuff in debuffs:
    out.write(INDENT + debuff)
    out.write("\n")

out.write(INDENT + "-- Unique debuffs\n")
for debuff in unique_debuffs:
    out.write(INDENT + debuff)
    out.write("\n")

out.close()