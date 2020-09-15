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


def getCoords(params):
    Observer = Ephem.getObserver(params['lat'], params['lon'], params['elev'])
    objectInfo = Ephem.getObjectData(Observer, params['name'])
    # TODO: Turn alt/az coordinates into degrees before returning
    return objectInfo.alt, objectInfo.az
