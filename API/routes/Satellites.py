import requests
from ephem import degree
import Ephem

# The satellite TLE's are acquired through the Celestrak TLE API

# Returns TLE from catalog number
def GetTLE(CatNumber):
    CatNumber = CatNumber
    url = f"https://celestrak.com/NORAD/elements/gp.php?CATNR={CatNumber}&FORMAT=TLE"
    TLE = requests.get(url).text.splitlines()
    return TLE


def getCoords(params):
    try:
        TLE = GetTLE(params['name'])
        ComputedTLE = Ephem.getSatelliteData(TLE, Ephem.getObserver(params['lat'], params['lon'], params['elev']))
        return {
            "name": ComputedTLE.name,
            "alt": ComputedTLE.alt / degree,
            "az": ComputedTLE.az / degree,
            "lat": ComputedTLE.sublat / degree,
            "lon": ComputedTLE.sublong / degree
        }
    except Exception as error:
        print(error)
        return "error", "error", "error", "error", "error"