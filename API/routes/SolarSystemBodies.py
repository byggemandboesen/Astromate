from ephem import degree

import Ephem

names = [
    'Sun',
    'Mercury',
    'Venus',
    'Moon'
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'Pluto',
    'Ceres'
]

# Returns alt/az coordinates for solar system body
def getCoords(params):
    try:
        Observer = Ephem.getObserver(params['lat'], params['lon'], params['elev'])
        objectInfo = Ephem.getSolarSystemBodyData(Observer, params['name'])
        return objectInfo.alt / degree, objectInfo.az / degree
    except Exception as error:
        return 'error', 'error'
