import requests
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
        lat, lon = Ephem.getSatelliteData(TLE)
        return lat, lon
    except Exception:
        return "error", "error"