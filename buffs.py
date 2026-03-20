from scraper import *

def buff_row(buff):
    if len(buff) < 5:
        return
    
    return [buff[3], buff[5]]

def unique_buff_row(buff):
    if len(buff) < 5:
        return
    
    if len(buff) == 8:
        return [buff[3], buff[5]]
    
    return [buff[3], buff[7]]
    # return buff

INDENT = "    "

buffs = scrape_to_sql("buffs.html", buff_row, 0)
unique_buffs = scrape_to_sql("buffs.html", unique_buff_row, 2)

out = open("data/buffs.sql", "w")
out.write("INSERT INTO effect VALUES\n")

for buff in buffs:
    out.write(INDENT + buff)
    out.write("\n")

out.write(INDENT + "-- Unique buffs\n")
for buff in unique_buffs:
    out.write(INDENT + buff)
    out.write("\n")

out.close()