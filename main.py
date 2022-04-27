# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.

import psycopg2

from flask import Flask, render_template


conn = psycopg2.connect("dbname=company user=flaskuser password=password")

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/logout')
def logout():
    return render_template('login.html')

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    app.run()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
