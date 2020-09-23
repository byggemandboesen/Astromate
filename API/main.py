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
def SolarSystemBodyNames():
    return jsonify(SolarSystemBodies.names)


# Returns current alt/az coordinates of solar system body
@app.route('/SolarSystemBody')
def SolarSystemBodyCoordinates():
    # Checks if request body is null for some odd reason
    if (request.json is None):
        return ('lat, lon, elev and name of body wasn\'t given in request body!')

    UserParams = request.json
    alt, az = SolarSystemBodies.getCoords(UserParams)

    # TODO: Format name, eg. first letter is capital and rest lower case
    return jsonify({
        "Name": UserParams['name'],
        "alt": alt,
        "az": az
    })


# -------------------------------- Satellites -------------------------------- #

# Returns a list of satellite catalog numbers and their name
# TODO: Return list of satellite names and their catalog numbers
@app.route('/Satellites', methods=['GET'])
def SatelliteNames():
    return jsonify({
        "Elektro-L2": 41105,
        "Fengyun 1A": 19467,
        "Fengyun 1B": 20888,
        "Fengyun 1C": 25730,
        "Fengyun 1D": 27431,
        "Fengyun 2A": 24834,
        "Fengyun 2B": 26382,
        "Fengyun 2C": 28451,
        "Fengyun 2D": 29640,
        "Fengyun 2E": 33463,
        "Fengyun 2F": 38049,
        "Fengyun 2G": 40367,
        "Fengyun 3A": 32958,
        "Fengyun 3B": 37214,
        "Fengyun 3C": 39260,
        "Fengyun 3D": 43010,
        "Fengyun 4A": 41882,
        "GEO-KOMPSAT-2A": 43823,
        "GOES 16": 41866,
        "GOES 17": 43226,
        "METEOR-M2": 40069,
        "METEOR-M2 2": 44387,
        "METOP-A": 29499,
        "METOP-B": 38771,
        "METOP-C": 43689,
        "NOAA-15": 25338,
        "NOAA-18": 28654,
        "NOAA-19": 33591,
        "NOAA-20": 43013,
        "SUOMI NPP": 37849,
        "ISS (ZARYA)": 25544,
    })

# Returns current lat/lon coordinates of satellite from its catalog number and current observer location
@app.route('/Satellite', methods=['GET'])
def SatelliteCoordinates():
    # Checks if request body is null for some odd reason
    if(request.json is None):
        return ('lat, lon, elev and catalog number wasn\'t given in request body!')
    
    UserParams = request.json
    # Map containing satellite's current alt/az and lat/lon coordinates:
    SatelliteData = Satellites.getCoords(UserParams)

    return jsonify({
        "Name": SatelliteData['name'],
        "alt": SatelliteData["alt"],
        "az": SatelliteData["az"],
        "lat": SatelliteData["lat"],
        "lon": SatelliteData["lon"]
    })


