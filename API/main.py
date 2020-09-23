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
        "ISS (ZARYA)": 25544,
        "METEOR-M2": 40069,
        "NOAA-19": 33591,
        "NOAA-15": 25338,
        "NOAA-18": 28654 
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


