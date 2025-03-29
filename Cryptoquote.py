import urllib.request as r
import random
import os
from html.parser import HTMLParser
from html.entities import name2codepoint
from bottle import route, run, debug, template, request, post, get, redirect
import string


class MyHTMLParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.lines = []
        self.quote_buffer = ""
        self.reading = False

    def handle_data(self, data):
        if self.reading:
            self.quote_buffer += data

    def handle_starttag(self, tag, attrs):
        if tag == "p":
            try:
                class_name = [attr[1][:2]
                              for attr in attrs if attr[0] == 'class'][0]
                if class_name == "st":
                    self.reading = True
            except IndexError:
                pass

    def handle_endtag(self, tag):
        if tag == "p":
            self.reading = False
            quote = self.quote_buffer.strip()
            if len(quote) > 0:
                self.lines.append(quote)
            self.quote_buffer = ""


parser = MyHTMLParser()
url = "https://www.smart-words.org/quotes-sayings/famous-one-liners.html"
with r.urlopen(url) as f:
    parser.feed(f.read().decode('utf-8'))

random.shuffle(parser.lines)

quotes = iter([])
current_quote = None
encoded_quote = None
letter_map_user = {}
letter_map_game = {}
game_active = False


def init_game():
    global current_quote, current_quote, quotes, encoded_quote
    global letter_map_game, letter_map_user, game_active

    # Disable starting new game until
    # current game is finished.
    if game_active:
        return

    try:
        current_quote = next(quotes).upper()
    except StopIteration:
        quotes = iter(parser.lines)
        current_quote = next(quotes).upper()

    shuffled_letters = list(string.ascii_uppercase)
    random.shuffle(shuffled_letters)
    letter_map_game = {
        letter: shuffled_letters[i]
        for i, letter in enumerate(string.ascii_uppercase)
    }
    encoded_quote = ''.join([letter_map_game.get(letter, letter)
                             for letter in current_quote])
    letter_map_user = {
        letter: '_' for letter in string.ascii_uppercase
    }
    game_active = True
    print(f"New game. Quote is {current_quote}")


@route('/start')
def start():
    init_game()
    redirect('/')


@get('/')
def home():
    global game_active
    if not game_active:
        return template("start_game")

    decoded_quote = ''.join([letter_map_user.get(letter, letter)
                             for letter in list(encoded_quote)])
    if decoded_quote == current_quote:
        game_active = False
        return template("end_game", quote=current_quote)

    output = template('game', keys=letter_map_user.keys(),
                      values=letter_map_user, quote=encoded_quote)
    return output


@post('/')
def play():
    letter_from = request.params.get('letterfrom')
    letter_to = request.params.get('letterto')
    if letter_from is not None and letter_to is not None:
        try:
            old_key = list(letter_map_user.keys())[list(
                letter_map_user.values()).index(letter_to)]
            letter_map_user[old_key] = '_'
        except ValueError:
            pass
        letter_map_user[letter_from] = letter_to
    return home()

run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
