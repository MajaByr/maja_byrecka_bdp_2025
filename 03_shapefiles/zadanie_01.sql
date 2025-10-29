/* ======================= Task 1 ======================= */

-- Create table objects and insert specified geometries
CREATE TABLE objects (
  id SERIAL PRIMARY KEY,
  geometry GEOMETRY,
  name VARCHAR(255)
); 

-- a
INSERT INTO objects (geometry, name) VALUES
(
	ST_LINETOCURVE(ST_GeomFromText('LINESTRING(0 1, 1 1, 2 0, 3 1, 4 2, 5 1, 6 1)')
		), 
		'obiekt1'
);

-- b
INSERT INTO objects (geometry, name) VALUES
(
    ST_Difference(
        ST_MakePolygon(ST_LineToCurve(ST_GeomFromText('LINESTRING(10 6, 14 6, 16 4, 14 2, 12 0, 10 2, 10 6)'))),
        ST_MakePolygon(ST_LineToCurve(ST_GeomFromText('LINESTRING(11 2, 13 2, 11 2, 11 2)')))
    ),
    'obiekt2'
);

-- c 
INSERT INTO objects (geometry, name) VALUES
	('POLYGON((7 15, 10 17, 12 13, 7 15))', 'obiekt3');

-- d
INSERT INTO objects (geometry, name) VALUES
	('LINESTRING(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)', 'obiekt4');

-- e 
INSERT INTO objects (geometry, name) VALUES
(
    ST_GeomFromText('MULTIPOINT Z(30 30 59, 38 32 234)'),
    'obiekt5'
);

-- f
INSERT INTO objects (geometry, name) VALUES
(
    ST_GeomFromText(
        'GEOMETRYCOLLECTION(
            LINESTRING(1 1, 3 2),
            POINT(4 2)
        )'
    ),
    'obiekt6'
);
