import Planet
reload(Planet)

class Solarsystem:
    planet = []
    planet.append( Planet.Planet(name = "Merkur", radius=58, periode=7.6, phi=280, mass = 0.33))


xyz = Solarsystem()

