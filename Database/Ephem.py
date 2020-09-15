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
def getObjectData(observer, objectName):

    if (objectName == 'Mercury'):
        data = ephem.Mercury(observer)
    elif (objectName == 'Venus'):
        data = ephem.Venus(observer)
    elif (objectName == 'Moon'):
        data = ephem.Moon(observer)
    elif (objectName == 'Mars'):
        data = ephem.Mars(observer)

    return data
