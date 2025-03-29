# Cryptoquote

![Screenshot](./cryptoquote.png)

The project is a cryptoquote game. Replace the letters to find the hidden message.

The messages are scraped from [SmartWords.org](https://www.smart-words.org/quotes-sayings/famous-one-liners.html) and shuffled when the game starts.

# Bonus

While not a requirement of the assignment, this project uses zero JavaScript. The UI appears dynamic using nothing but CSS.

# Running locally

```sh
git clone https://github.com/vezaynk/cryptoquote
cd cryptoquote
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
PORT=5000 python ./Cryptoquote.py
```

# Live Demo

The project is deployed on Heroku here: https://cryptoquote.knyz.org/

