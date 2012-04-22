# Ellipsenschar durch 2 Punkte und Brennpunkt=Sonne(0,0):
# Freie Bewegung im Schwerefeld der Sonne zwischen zwei Planeten.

r1=1
r2=2
psi1=0
psi2=1.76

phi = atan((r1*sin(psi1)-r2*sin(psi2))/(r1*cos(psi1)-r2*cos(psi2)))
exc = 2*r1*cos(psi1+phi)

kk=0
while (kk<2*3.141):
  kk += 0.3141
  exc = (r2 - r1) / (r2*cos(psi2-kk) - r1*cos(psi1-kk))
  ha = r2 * (1 - exc * cos(psi2 - kk)) / (1 - exc*exc)

  zz=0
  while (zz<2*3.141):
    zz+=0.03141
    rad = ha*(1-exc*exc)/(1-exc*cos(zz-kk))

    #plot(rad,zz)

#Gescxhwindigkeit am Ziel
v2 = massSun*G*(2/r2 - 1/ha)
#Horizontalwinkel am Ziel
alpha2 = arccos((1+exc*cos(psi2))/sqrt(1+2*exc*cos(psi2)+exc*exc))
#or
alpha2 = arcsin(exc*sin(psi2)/sqrt(1+2*exc*cos(psi2)+exc*exc))


# FlyBy an Planet p (hier 2)
# Variate distanceFromGround
Vin=v2
alphaIn=alpha2
#dist = radiusPlanet + distanceFromGround

Vu = sqrt(Vu*Vu+Vp*Vp-2*Vu*Vp*cos(alphaIn))

exc = 1 + (dist*Vu*Vu/(massPlanet*G))
#h = omegaS*rS*rS
#h = dist*sqrt(Vu*Vu+(2*massPlanet*G/dist))

distance=dist*sqrt((exc+1)/(exc-1))
distanceP = Vp*Vp*delta/(massPlanet*G)
#check: distance>sqrt(Sqr(radiusPlanet+massPlanet*G/(Vu*Vu)) - Sqr(massPlanet*G/(Vu*Vu)))

delta = 2*arctan(Vp*Vp/(distanceP*Vu*Vu))
#or
delta = 2*arcsin(1/exc)

Vout=Vin+Vin*2/(sqrt(1+Sqr(delta*Vin*Vin/(massPlanet*G))))

alphaOut=alphaIn+delta











