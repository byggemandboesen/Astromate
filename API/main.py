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

# ------------------------------- Solar system ------------------------------- #

# Returns a list of basic solar system objects
@app.route('/SolarSystemBodies', methods=['GET'])
def SolarSystemBodiesNames():
    return jsonify(SolarSystemBodies.names)


# Returns current alt/az coordinates of solar system body
@app.route('/SolarSystemBody')
def SolarSystemBodyCoordinates():
    # Checks if request body is null for some odd reason
    if (request.json is None):
        return ('lat, lon, elev and name of body wasn\'t given in request body!')

    UserParams = request.json
    alt, az = SolarSystemBodies.getCoords(UserParams)

    return jsonify({
        "alt": alt,
        "az": az
    })


# -------------------------------- Satellites -------------------------------- #

# Returns a list of satellite catalog numbers and their name
# TODO: Return list of satellite names and their catalog numbers


# Returns current lat/lon coordinates of satellite from its catalog number and current observer location
@app.route('/Satellite', methods=['GET'])
def SatelliteCoordinates():
    # Checks if request body is null for some odd reason
    if(request.json is None):
        return ('lat, lon, elev and catalog number wasn\'t given in request body!')
    
    UserParams = request.json
    lat, lon = Satellites.getCoords(UserParams)

    return jsonify({
        "lat": lat,
        "lon": lon
    })

