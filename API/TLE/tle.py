import requests

CatNumber = 25544 # ISS as example
url = f"https://celestrak.com/NORAD/elements/gp.php?CATNR={CatNumber}&FORMAT=TLE"

print(requests.get(url).text)