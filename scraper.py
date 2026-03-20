from bs4 import BeautifulSoup

TABLE_SELECTOR = "table.article-table"

class Null:
    def __init__(self):
        pass
    def __repr__(self):
        return "NULL"

NULL = Null()

def isolate_rarity(rarity: str):
    lparen = rarity.find(" (")
    if lparen != -1:
        return rarity[:lparen]
    
    return rarity

def get_player(rarity: str):
    lparen = rarity.find("(")
    if lparen != -1:
        rarity = rarity[lparen + 1:]
        first_space = rarity.find(" ")
        return rarity[:first_space]

    return NULL

def scrape_tables(path):
    with open("webscraping/" + path, "br") as fp:
        soup = BeautifulSoup(fp, features="html.parser", from_encoding="utf-8")
        tables = soup.select(TABLE_SELECTOR)
    return tables

def potion_row(row):
    return row[3::2]

relic_row = potion_row

def get_rows(table, schema):
    # Skip table header
    rows = table.tbody.contents[2::2]
    columns = map(lambda tr: schema(tr.contents), rows)
    return list(columns) if columns else None

def get_row_text(row):
    if row is None:
        return
    row_texts = map(lambda td: td.text.strip(), row)
    return list(row_texts)

def scrape_data(path, schema, index=0):
    table = scrape_tables(path)[index]
    rows = get_rows(table, schema)
    data = map(get_row_text, rows)
    return filter(lambda d: d is not None, data)

# Formats the row as text appropriate for SQL
def format_row(row):
    return "(" + str(row)[1:-1] + "),"

def scrape_to_sql(path, schema, index=0):
    texts = scrape_data(path, schema, index)
    return list(map(format_row, texts))

# rows = get_rows(scrape_tables("ironclad_cards.html")[0], card_row)
# print(*list(map(get_row_text, rows)), sep='\n')

# print(get_column(0, scrape_tables("potions.html")[0]))