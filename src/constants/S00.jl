const s00p = (

# 1-6
    94.00e-6,
  3808.35e-6,
  -119.94e-6,
-72574.09e-6,
    27.70e-6,
    15.61e-6
)

const s00_coefficient = (

# 1-10
    ( 0,  0,  0,  0,  1,  0,  0,  0),
    ( 0,  0,  0,  0,  2,  0,  0,  0),
    ( 0,  0,  2, -2,  3,  0,  0,  0),
    ( 0,  0,  2, -2,  1,  0,  0,  0),
    ( 0,  0,  2, -2,  2,  0,  0,  0),
    ( 0,  0,  2,  0,  3,  0,  0,  0),
    ( 0,  0,  2,  0,  1,  0,  0,  0),
    ( 0,  0,  0,  0,  3,  0,  0,  0),
    ( 0,  1,  0,  0,  1,  0,  0,  0),
    ( 0,  1,  0,  0, -1,  0,  0,  0),

    # 11-20
    ( 1,  0,  0,  0, -1,  0,  0,  0),
    ( 1,  0,  0,  0,  1,  0,  0,  0),
    ( 0,  1,  2, -2,  3,  0,  0,  0),
    ( 0,  1,  2, -2,  1,  0,  0,  0),
    ( 0,  0,  4, -4,  4,  0,  0,  0),
    ( 0,  0,  1, -1,  1, -8, 12,  0),
    ( 0,  0,  2,  0,  0,  0,  0,  0),
    ( 0,  0,  2,  0,  2,  0,  0,  0),
    ( 1,  0,  2,  0,  3,  0,  0,  0),
    ( 1,  0,  2,  0,  1,  0,  0,  0),

    # 21-30
    ( 0,  0,  2, -2,  0,  0,  0,  0),
    ( 0,  1, -2,  2, -3,  0,  0,  0),
    ( 0,  1, -2,  2, -1,  0,  0,  0),
    ( 0,  0,  0,  0,  0,  8,-13, -1),
    ( 0,  0,  0,  2,  0,  0,  0,  0),
    ( 2,  0, -2,  0, -1,  0,  0,  0),
    ( 0,  1,  2, -2,  2,  0,  0,  0),
    ( 1,  0,  0, -2,  1,  0,  0,  0),
    ( 1,  0,  0, -2, -1,  0,  0,  0),
    ( 0,  0,  4, -2,  4,  0,  0,  0),

    # 31-33
    ( 0,  0,  2, -2,  4,  0,  0,  0),
    ( 1,  0, -2,  0, -3,  0,  0,  0),
    ( 1,  0, -2,  0, -1,  0,  0,  0)
)

const s00_arg = (
    (-2640.73e-6,   0.39e-6 ),
    (  -63.53e-6,   0.02e-6 ),
    (  -11.75e-6,  -0.01e-6 ),
    (  -11.21e-6,  -0.01e-6 ),
    (    4.57e-6,   0.00e-6 ),
    (   -2.02e-6,   0.00e-6 ),
    (   -1.98e-6,   0.00e-6 ),
    (    1.72e-6,   0.00e-6 ),
    (    1.41e-6,   0.01e-6 ),
    (    1.26e-6,   0.01e-6 ),
    (    0.63e-6,   0.00e-6 ),
    (    0.63e-6,   0.00e-6 ),
    (   -0.46e-6,   0.00e-6 ),
    (   -0.45e-6,   0.00e-6 ),
    (   -0.36e-6,   0.00e-6 ),
    (    0.24e-6,   0.12e-6 ),
    (   -0.32e-6,   0.00e-6 ),
    (   -0.28e-6,   0.00e-6 ),
    (   -0.27e-6,   0.00e-6 ),
    (   -0.26e-6,   0.00e-6 ),
    (    0.21e-6,   0.00e-6 ),
    (   -0.19e-6,   0.00e-6 ),
    (   -0.18e-6,   0.00e-6 ),
    (    0.10e-6,  -0.05e-6 ),
    (   -0.15e-6,   0.00e-6 ),
    (    0.14e-6,   0.00e-6 ),
    (    0.14e-6,   0.00e-6 ),
    (   -0.14e-6,   0.00e-6 ),
    (   -0.14e-6,   0.00e-6 ),
    (   -0.13e-6,   0.00e-6 ),
    (    0.11e-6,   0.00e-6 ),
    (   -0.11e-6,   0.00e-6 ),
    (   -0.11e-6,   0.00e-6 )
)


const s01_coefficient =(

    # 1-3
    ( 0,  0,  0,  0,  2,  0,  0,  0),
    ( 0,  0,  0,  0,  1,  0,  0,  0),
    ( 0,  0,  2, -2,  3,  0,  0,  0))

const s01_arg = (
    (  -0.07e-6,   3.57e-6 ),
    (   1.71e-6,  -0.03e-6 ),
    (   0.00e-6,   0.48e-6 )
)

const s02_coefficient =(

    # 1-10
    ( 0,  0,  0,  0,  1,  0,  0,  0),
    ( 0,  0,  2, -2,  2,  0,  0,  0),
    ( 0,  0,  2,  0,  2,  0,  0,  0),
    ( 0,  0,  0,  0,  2,  0,  0,  0),
    ( 0,  1,  0,  0,  0,  0,  0,  0),
    ( 1,  0,  0,  0,  0,  0,  0,  0),
    ( 0,  1,  2, -2,  2,  0,  0,  0),
    ( 0,  0,  2,  0,  1,  0,  0,  0),
    ( 1,  0,  2,  0,  2,  0,  0,  0),
    ( 0,  1, -2,  2, -2,  0,  0,  0),

    # 11-20
    ( 1,  0,  0, -2,  0,  0,  0,  0),
    ( 0,  0,  2, -2,  1,  0,  0,  0),
    ( 1,  0, -2,  0, -2,  0,  0,  0),
    ( 0,  0,  0,  2,  0,  0,  0,  0),
    ( 1,  0,  0,  0,  1,  0,  0,  0),
    ( 1,  0, -2, -2, -2,  0,  0,  0),
    ( 1,  0,  0,  0, -1,  0,  0,  0),
    ( 1,  0,  2,  0,  1,  0,  0,  0),
    ( 2,  0,  0, -2,  0,  0,  0,  0),
    ( 2,  0, -2,  0, -1,  0,  0,  0),

    # 21-25
    ( 0,  0,  2,  2,  2,  0,  0,  0),
    ( 2,  0,  2,  0,  2,  0,  0,  0),
    ( 2,  0,  0,  0,  0,  0,  0,  0),
    ( 1,  0,  2, -2,  2,  0,  0,  0),
    ( 0,  0,  2,  0,  0,  0,  0,  0)
)

const s02_arg = (
    ( 743.53e-6,  -0.17e-6 ),
    (  56.91e-6,   0.06e-6 ),
    (   9.84e-6,  -0.01e-6 ),
    (  -8.85e-6,   0.01e-6 ),
    (  -6.38e-6,  -0.05e-6 ),
    (  -3.07e-6,   0.00e-6 ),
    (   2.23e-6,   0.00e-6 ),
    (   1.67e-6,   0.00e-6 ),
    (   1.30e-6,   0.00e-6 ),
    (   0.93e-6,   0.00e-6 ),
    (   0.68e-6,   0.00e-6 ),
    (  -0.55e-6,   0.00e-6 ),
    (   0.53e-6,   0.00e-6 ),
    (  -0.27e-6,   0.00e-6 ),
    (  -0.27e-6,   0.00e-6 ),
    (  -0.26e-6,   0.00e-6 ),
    (  -0.25e-6,   0.00e-6 ),
    (   0.22e-6,   0.00e-6 ),
    (  -0.21e-6,   0.00e-6 ),
    (   0.20e-6,   0.00e-6 ),
    (   0.17e-6,   0.00e-6 ),
    (   0.13e-6,   0.00e-6 ),
    (  -0.13e-6,   0.00e-6 ),
    (  -0.12e-6,   0.00e-6 ),
    (  -0.11e-6,   0.00e-6 )
)

const s03_coefficient = (

# 1-4
( 0,  0,  0,  0,  1,  0,  0,  0),
( 0,  0,  2, -2,  2,  0,  0,  0),
( 0,  0,  2,  0,  2,  0,  0,  0),
( 0,  0,  0,  0,  2,  0,  0,  0)
)

const s03_arg = (
(  0.30e-6, -23.51e-6 ),
( -0.03e-6,  -1.39e-6 ),
( -0.01e-6,  -0.24e-6 ),
(  0.00e-6,   0.22e-6 )

)

const s04_coefficient =(

# 1-1
( 0,  0,  0,  0,  1,  0,  0,  0),
)

const s04_arg =(
( -0.26e-6,  -0.01e-6 ),
)