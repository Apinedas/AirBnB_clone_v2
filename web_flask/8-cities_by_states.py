#!/usr/bin/python3
"""First flask module for HBNB"""


from flask import Flask, render_template
from models import storage
from models.state import State
from os import getenv
app = Flask(__name__)
env = getenv('HBNB_TYPE_STORAGE')


@app.teardown_appcontext
def teardown_close(self):
    "Closses sqlalchemy session"
    storage.close()


@app.route('/cities_by_states', strict_slashes=False)
def cities_by_state_list():
    """Returns a HTML with states list"""
    state_dict = storage.all(State)
    return render_template('7-states_list.html', st_list=state_dict.values())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000")
