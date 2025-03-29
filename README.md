# Cryptoquote

![Screenshot](https://github.com/user-attachments/assets/14de7fb1-bb20-45ad-bb5b-5e7c247de86a)


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

The game does not have individual user sessions. So, for the live deploy, I disabled the "start new game" functionality to prevent rogue users from ending in-progress games. This change can be reverted in the code.

# Live Demo

The project is deployed on Heroku here: https://cryptoquote.knyz.org/

