import ephem

from datetime import datetime

# Returns a PyEphem observer from a set of lat/lon coords and an elevation ASL
def getObserver(lat, lon, elevation):
    user = ephem.Observer()
    user.lat = str(lat)
    user.lon = str(lon)
    user.elevation = elevation
    user.date = datetime.utcnow()
    return user


# Returns body/object data from observer data
# TODO: Add the rest of the bodies
def getSolarSystemBodyData(observer, objectName):

    objectName = objectName.lower()

    # RIP python swtich statements...
    if (objectName == 'sun'):
        data = ephem.Sun(observer)
    elif (objectName == 'mercury'):
        data = ephem.Mercury(observer)
    elif (objectName == 'venus'):
        data = ephem.Venus(observer)
    elif (objectName == 'moon'):
        data = ephem.Moon(observer)
    elif (objectName == 'mars'):
        data = ephem.Mars(observer)
    elif (objectName == 'jupiter'):
        data = ephem.JupiteR(observer)
    elif (objectName == 'saturn'):
        data = ephem.Saturn(observer)
    elif (objectName == 'uranus'):
        data = ephem.Uranus(observer)
    elif (objectName == 'neptune'):
        data = ephem.Neptune(observer)
    elif (objectName == 'pluto'):
        data = ephem.Pluto(observer)
    else:
        return 'Invalid body'

    return data
