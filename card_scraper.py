# Usage: card_scraper <name> <Color>

from scraper import *

def card_row(row):
    return [row[1], *row[5::2]]


COST = 3

def parse_cost(cost: str):
    if cost == "X":
        return -1
    elif cost == "Unplayable" or cost == "":
        return NULL
    
    paren = cost.find("(") 
    if paren != -1:
        return int(cost[:paren])
    
    return int(cost)


def get_upgraded_cost(cost):
    lparen = cost.find("(") 
    rparen = cost.find(")") 
    if lparen != -1:
        return int(cost[lparen + 1 : rparen])
    
    # The upgraded cost is the same as the regular cost
    if cost == "Unplayable" or cost == "":
        return NULL

    return -1 if cost == "X" else int(cost)


def fix_card(card, color):
    return [
        card[0],
        card[4],
        card[1],
        parse_cost(card[COST]),
        get_upgraded_cost(card[COST]),
        card[2],
        color
    ]

def fix_status_card(card, color):
    return [
        card[0],
        card[2],
        "Special",
        NULL,
        NULL,
        "Status",
        color
    ]

def fix_curse_card(card, color):
    return [
        card[0],
        card[1],
        "Special",
        NULL,
        NULL,
        "Curse",
        color
    ]

def scrape_cards(card, color):
    if color == "Grey":
        fixer = fix_status_card
    elif color == "Black":
        fixer = fix_curse_card
    else:
        fixer = fix_card

    rows = scrape_data(card + "_cards.html", card_row)
    cards = map(lambda c: fixer(c, color), rows)
    cards = map(format_row, cards)
    return cards
