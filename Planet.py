class Planet:
    Mass = 0;
    Radius = 0;
    Velocity = 0;
    AngleZero = 0;
    Omega = 0;
    Name = ""

    def __init__(self, name, radius, phi, periode, mass=0):
      self.Name = name
      self.Mass = mass
      self.Radius = radius * 10E9
      self.AngleZero = 3.141*phi/180
      self.Omega = 2*3.141 / (periode * 10E6)
      self.Velocity = self.Omega * self.Radius
