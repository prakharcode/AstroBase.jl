module AstroBase

using Rotations

export J2000, polar_motion, earth_rotation_angle, earth_rotation_angle, xy06, mean_anomaly_of_moon, mean_anomaly_of_sun,
       mean_longitude_of_moon_minus_mean_longitude_of_ascending_node, mean_elongation_of_moon_from_sun, mean_longitude_ascending_node_moon,
       mean_longitude_of_mercury, mean_longitude_of_venus, mean_longitude_of_earth, mean_longitude_of_mars, mean_longitude_of_jupiter,
       mean_longitude_of_saturn, mean_longitude_of_uranus, mean_longitude_of_neptune, general_precession_in_longitude

include("mfals.jl")
include("terms.jl")

const J2000 = 2451545.0
const DAYS_PER_CENTURY = 36525.0
const TURNAS = 1296000.0

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

if !isdefined(Base, :sincos)
    sincos(x::Real) = (sin(x), cos(x))
end

"""
    sec2rad(sec::Real)

Returns radians for given seconds.

# Example

```jldoctest
julia> sec2rad(3600 * 30)
0.5235987755982988
```
"""
sec2rad(sec::Real) = deg2rad(sec/3600)

"""
    mean_anomaly_of_moon(t::Real)

Returns mean anomaly of Moon for a given Julian century.

# Example

```jldoctest
julia> mean_anomaly_of_moon(23.0)
0.5891752616281019
```
"""
mean_anomaly_of_moon(t::Real)  =  sec2rad(mod((@evalpoly t 485868.249036 1717915923.2178 31.8792 0.051635 -0.00024470) , TURNAS))

"""
    mean_anomaly_of_sun(t::Real)

Returns mean anomaly of Sun for a given Julian century.

# Example

```jldoctest
julia> mean_anomaly_of_sun(23.0)
5.857396217361825
```
"""
mean_anomaly_of_sun(t::Real) =  sec2rad(mod((@evalpoly t 1287104.793048 129596581.0481 -0.5532 0.000136 -0.00001149),  TURNAS))

"""
    mean_longitude_of_moon_minus_mean_longitude_of_ascending_node(t::Real)

Returns mean longitude of the Moon for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_moon_minus_mean_longitude_of_ascending_node(23.0)
3.103138156410118
```
"""
mean_longitude_of_moon_minus_mean_longitude_of_ascending_node(t::Real)  =  sec2rad(mod((@evalpoly t 335779.526232 1739527262.8478 -12.7512 -0.001037 0.00000417), TURNAS))

"""
    mean_elongation_of_moon_from_sun(t::Real)

Returns mean elongation of the Moon from the Sun for given Julian century.

# Example

```jldoctest
julia> mean_elongation_of_moon_from_sun(23.0)
2.8012040574296484
```
"""
mean_elongation_of_moon_from_sun(t::Real)  =  sec2rad(mod((@evalpoly t 1072260.703692 1602961601.2090 -6.3706 0.006593 -0.00003169), TURNAS))

"""
    mean_longitude_ascending_node_moon(t::Real)

Return fundamental argument for a given Julian century.

# Example
```jldoctest
julia> mean_longitude_ascending_node_moon(23.0)
4.904897783682109
```
"""
mean_longitude_ascending_node_moon(t::Real) =  sec2rad(mod((@evalpoly t 450160.398036 -6962890.5431 7.4722 0.007702 -0.00005939), TURNAS ))

"""
    mean_longitude_of_mercury(t::Real)

Returns mean longitude of Mercury for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_mercury(23.0)
2.160150897150834
```
"""
mean_longitude_of_mercury(t::Real) =  mod2pi(4.402608842 + 2608.7903141574t)

"""
    mean_longitude_of_venus(t::Real)

Returns mean longitude of Venus for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_venus(23.0)
0.9030394378238363
```
"""
mean_longitude_of_venus(t::Real) =  mod2pi(3.176146697 + 1021.3285546211t)

"""
    mean_longitude_of_earth(t::Real)

Returns mean longitude of Earth for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_earth(23.0)
1.501718780251826
```
"""
mean_longitude_of_earth(t::Real)  =  mod2pi(1.753470314 + 628.3075849991t)

"""
    mean_longitude_of_mars(t::Real)

Returns mean longitude of Mars for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_mars(23.0)
5.276431642365657
```
"""
mean_longitude_of_mars(t::Real) =  mod2pi(6.203480913 + 334.0612426700t)

"""
    mean_longitude_of_jupiter(t::Real)

Returns mean longitude of Jupiter for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_jupiter(23.0)
6.233996285639864
```
"""
mean_longitude_of_jupiter(t::Real) =  mod2pi(0.599546497 + 52.9690962641t)

"""
    mean_longitude_of_saturn(t::Real)

Returns mean longitude of Saturn for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_saturn(23.0)
1.3735042049922535
```
"""
mean_longitude_of_saturn(t::Real) =  mod2pi(0.874016757 + 21.3299104960t)

"""
    mean_longitude_of_uranus(t::Real)

Returns mean longitude of Uranus for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_uranus(23.0)
1.5497819750715893
```
"""
mean_longitude_of_uranus(t::Real) =  mod2pi(5.481293872 + 7.4781598567t)

"""
    mean_longitude_of_neptune(t::Real)

Returns mean longitude of Neptune for a given Julian century.

# Example

```jldoctest
julia> mean_longitude_of_neptune(23.0)
5.053273953885775
```
"""
mean_longitude_of_neptune(t::Real) =  mod2pi(5.311886287 + 3.8133035638t)

"""
    general_precession_in_longitude(t::Real)

Returns general accumulated precession in longitude for a given Julian century.

# Example

```jldoctest
julia> general_precession_in_longitude(23.0)
0.56362992539
```
"""
general_precession_in_longitude(t::Real) =  (0.024381750 + 0.00000538691t) * t

"""
    xy06(jd1, jd2)

Returns X, Y coordinates of celestial intermediate pole for a given 2-part Julian date.

# Example

```jldoctest
julia> xy06(2.4578265e6, 0.30440190993249416)
(0.0016558850230577835, -3.986943362456243e-5)
```
"""
function xy06(jd1, jd2)
    NFLS = length(mfals)
    NFPL = length(mfapl)
    NA = length(amp)
    MAXPT= 5
    pt = Vector{Float64}(MAXPT + 1)
    fa = Vector{Float64}(14)
    xypr, xypl, xyls, sc = zeros(2), zeros(2), zeros(2), zeros(2)

    t = ((jd1 - J2000) + jd2) / DAYS_PER_CENTURY
    # Powers of T.
    w = 1.0
    for i in 1:MAXPT+1
        pt[i] = w
        w *= t
    end

    fa[1]  = mean_anomaly_of_moon(t)
    fa[2]  = mean_anomaly_of_sun(t)
    fa[3]  = mean_longitude_of_moon_minus_mean_longitude_of_ascending_node(t)
    fa[4]  = mean_elongation_of_moon_from_sun(t)
    fa[5]  = mean_longitude_ascending_node_moon(t)
    fa[6]  = mean_longitude_of_mercury(t)
    fa[7]  = mean_longitude_of_venus(t)
    fa[8]  = mean_longitude_of_earth(t)
    fa[9]  = mean_longitude_of_mars(t)
    fa[10] = mean_longitude_of_jupiter(t)
    fa[11] = mean_longitude_of_saturn(t)
    fa[12] = mean_longitude_of_uranus(t)
    fa[13] = mean_longitude_of_neptune(t)
    fa[14] = general_precession_in_longitude(t)

    for i in 1:2
           xypr[i] = @evalpoly t xyp[i][1] xyp[i][2] xyp[i][3] xyp[i][4] xyp[i][5] xyp[i][6]
    end

    ialast = NA
    for ifreq in NFPL:-1:1
        arg = 0.0
        for i in range(1,14)
           m = mfapl[ifreq][i]
           if (m != 0)
               arg += float(m) * fa[i]
           end
        end

        sc[2], sc[1] = reim(cis(arg))

        ia = nc[ifreq + NFLS]
        for i in (ialast + 1):-1:(ia + 1)
               j = i - ia
               jxy = jaxy[j]
               jsc = jasc[j]
               jpt = japt[j]
               xypl[jxy] += amp[i-1] * sc[jsc] * pt[jpt]
        end
        ialast = ia - 1
    end

    for ifreq in NFLS:-1:1
        arg = 0.0
        for i in 1:5
           m = mfals[ifreq][i]
           if (m != 0)
               arg += float(m) * fa[i]
           end
        end

        sc[2], sc[1] = reim(cis(arg))

        ia = nc[ifreq]
        for i in (ialast + 1):-1:(ia + 1)
               j = i - ia
               jxy = jaxy[j]
               jsc = jasc[j]
               jpt = japt[j]
               xyls[jxy] += amp[i-1] * sc[jsc] * pt[jpt]
        end
        ialast = ia - 1
    end

    sec2rad((xypr[1] + (xyls[1] + xypl[1]) / 1e6)), sec2rad(xypr[2] + (xyls[2] + xypl[2]) / 1e6)
end

"""
    s06(jd1, jd2, x, y)

Returns Celestial Intermediate Origin(CIO) for a given 2-part Julian date (jd1, jd2)
with CIP coordinates (x, y)

# Example
```jldoctest
julia> AstroBase.s06(2.4578265e6, 0.30434616919175345, 20, 50)
-500.00000000383193
```
"""
function s06(jd1, jd2, x, y)

    NS0 = length(s0)
    NS1 = length(s1)
    NS2 = length(s2)
    NS3 = length(s3)
    NS4 = length(s4)
    t = ((jd1 - J2000) + jd2) / DAYS_PER_CENTURY

    fa = zeros(8)
    fa[1] = mean_anomaly_of_moon(t)
    fa[2] = mean_anomaly_of_sun(t)
    fa[3] = mean_longitude_of_moon_minus_mean_longitude_of_ascending_node(t)
    fa[4] = mean_elongation_of_moon_from_sun(t)
    fa[5] = mean_longitude_ascending_node_moon(t)
    fa[6] = mean_longitude_of_venus(t)
    fa[7] = mean_longitude_of_earth(t)
    fa[8] = general_precession_in_longitude(t)

    w0 = sp[1]
    w1 = sp[2]
    w2 = sp[3]
    w3 = sp[4]
    w4 = sp[5]
    w5 = sp[6]

    for i in NS0:-1:1
        a = 0.0
        for j in 8:-1:1
            a += s0[i][1][j] * fa[j]
        end
        s, c = sincos(a)
        w0 += s0[i][2] * s + s0[i][3] * c
    end

    for i in NS1:-1:1
        a = 0.0
        for j in 8:-1:1
            a += s1[i][1][j] * fa[j]
        end
        s, c = sincos(a)
        w1 += s1[i][2] * s + s1[i][3] * c
    end

    for i in NS2:-1:1
        a = 0.0
        for j in 8:-1:1
            a += s2[i][1][j] * fa[j]
        end
        s, c = sincos(a)
        w2 += s2[i][2] * s + s2[i][3] * c
    end

    for i in NS3:-1:1
        a = 0.0
        for j in 8:-1:1
            a += s3[i][1][j] * fa[j]
        end
        s, c = sincos(a)
        w3 += s3[i][2] * s + s3[i][3] * c
    end

    for i in NS4:-1:1
        a = 0.0
        for j in 8:-1:1
            a += s4[i][1][j] * fa[j]
        end
        s, c = sincos(a)
        w4 += s4[i][2] * s + s4[i][3] * c
    end
    sec2rad((@evalpoly t w0 w1 w2 w3 w4 w5)) - x * y / 2.0
end
end # module
