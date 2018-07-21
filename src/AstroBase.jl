module AstroBase

using Rotations

export tio_locator, sec2rad, rad2sec, J2000, polar_motion, earth_rotation_angle,
  celestial_to_intermediate, obliquity_of_ecliptic_06, precession_fukushima_williams06

const J2000 = 2451545.0
const DAYS_PER_CENTURY = 36525.0

"""
    celestial_to_intermediate(x, y, s)

Returns celestial to intermediate-frame-of-date transformation matrix given
the Celestial Intermediate Pole location (`x`, `y` and the CIO locator `s`).

```jldoctest
julia> celestial_to_intermediate(0.2, 0.2, 0.1)
3×3 RotZYZ{Float64}(0.785398, 0.286757, -0.885398):
  0.976728   0.0774803  0.2
 -0.11811    0.972651   0.2
 -0.179034  -0.218968   0.959166
```
"""
function celestial_to_intermediate(x, y, s)
    r2 = x^2 + y^2
    e = r2 > 0.0 ? atan2(y,x) : 0.0
    d = atan(sqrt(r2 / (1.0 - r2)))
    RotZYZ(e, d, -(e + s))
end

"""
    polar_motion(rx, ry, sp)

Form the matrix of polar motion for coordinates of the pole (radians).

# Example
```jldoctest
julia> polar_motion(20, 30, 50)
3×3 RotZYX{Float64}(50.0, -20.0, -30.0):
  0.393785  -0.829946  -0.395124
 -0.10707    0.385514  -0.916469
  0.912945   0.403198   0.0629472
```
"""
function polar_motion(rx, ry, sp)
    RotZYX{Float64}(sp, -rx, -ry)
end

"""
    earth_rotation_angle(jd1, jd2)

Return Earth rotation angle (radians) for a given UT1 2-part Julian Date (jd1, jd2).

# Example
```jldoctest
julia> earth_rotation_angle(2.4578265e6, 0.30434616919175345)
4.912208135094597
```
"""
function earth_rotation_angle(jd1, jd2)
    if jd1 < jd2
        d1 = jd1
        d2 = jd2
    else
        d1 = jd2
        d2 = jd1
    end
    t = d1 + d2 - J2000
    f = mod(d1, 1.0) + mod(d2, 1.0)
    mod2pi(2pi * (f + 0.7790572732640 + 0.00273781191135448 * t))
end

"""
    sec2rad(sec::Real)

Convert an angle in arcseconds to radians.

# Example

```jldoctest
julia> sec2rad(3600 * 30)
0.5235987755982988
```
"""
sec2rad(sec::Real) = deg2rad(sec / 3600)

"""
    rad2sec(rad::Real)
Convert an angle in radians to arcseconds.

# Example

```jldoctest
julia> rad2sec(0.5235987755982988)
107999.99999999999
```
"""
rad2sec(rad::Real) = rad2deg(rad) * 3600

"""
    tio_locator(jd1, jd2)

Returns TIO locator s' position for a given TT 2-part Julian date (jd1, jd2).

# Example

'''jldoctest
julia> AstroBase.tio_locator(2.4578265e6, 0.30434616919175345)
-3.9189245827947945e-11
'''
"""
function tio_locator(jd1, jd2)
    t = (jd1 - J2000 + jd2) / DAYS_PER_CENTURY
    -47e-6 * t * sec2rad(1)
end

"""
    obliquity_of_ecliptic_06(jd1, jd2)

Returns obliquity of ecliptic (radians) for a given 2 part Julain date (TT).

# Example

```jldoctest
julia> obliquity_of_ecliptic_06(2.4578265e6, 0.30434616919175345)
0.409053547482157
```
"""
function obliquity_of_ecliptic_06(jd1, jd2)
    t = ((jd1 - J2000) + jd2) / DAYS_PER_CENTURY
    sec2rad(@evalpoly t 84381.406 -46.836769 -0.0001831 0.00200340 -0.000000576 -0.0000000434)
end

"""
    precession_fukushima_williams06(jd1, jd2)

Returns fukushima angles(radians) for a given 2 part Julian date (TT).

# Example

```jldoctest
julia> precession_fukushima_williams06(2.4578265e6, 0.30434616919175345)
(8.616170933989655e-6, 0.4090536093366178, 0.004201176043952816, 0.409053547482157)
```
"""
function precession_fukushima_williams06(jd1, jd2)
    t = ((jd1 - J2000) + jd2) / DAYS_PER_CENTURY

    sec2rad(@evalpoly t -0.052928 10.556378 0.4932044 -0.00031238 -0.000002788 0.0000000260),
    sec2rad(@evalpoly t 84381.412819 -46.811016 0.0511268 0.00053289 -0.000000440 -0.0000000176),
    sec2rad(@evalpoly t -0.041775 5038.481484 1.5584175 -0.00018522 -0.000026452 -0.0000000148),
    obliquity_of_ecliptic_06(jd1, jd2)
end

end
