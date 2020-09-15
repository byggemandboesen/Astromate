from routes import SolarSystemBodies
from routes import Satellites
import Ephem

import json
from flask import (Flask, jsonify, request)
app = Flask(__name__)

# Default route which shows available routes
@app.route('/', methods=['GET'])
def root():
    return jsonify({
        'routes': [
            'SolarSystemBodies',
            'Satellites'
            '/SolarSystemBody with JSON req. body with lat, lon and elev of observer and name of body'
            'Satellite/:name',
        ]
    })

# Returns a list of basic solar system objects
@app.route('/SolarSystemBodies', methods=['GET'])
def SolarSystemBodiesNames():
    return jsonify(SolarSystemBodies.names)


# Returns current alt/az coordinates of solar system body
# TODO: Add request body validation
# TODO: integrate req body data in url and access as request.form['name'] and etc??
@app.route('/SolarSystemBody')
def SolarSystemBodyCoordinates():
    if (request.json is None):
        return ('lat, lon, elev and name of body wasn\'t given in request body!')

    UserParams = request.json
    alt, az = SolarSystemBodies.getCoords(UserParams)
    return jsonify({
        "alt": alt,
        "az": az
    })
