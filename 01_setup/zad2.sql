/* ======================= Task 4 ======================= */
/*
CREATE TABLE buildings (
  id SERIAL PRIMARY KEY,
  geometry GEOMETRY,
  name VARCHAR(255)
); 

CREATE TABLE roads (
  id SERIAL PRIMARY KEY,
  geometry GEOMETRY,
  name VARCHAR(255)
); 

CREATE TABLE poi (
  id SERIAL PRIMARY KEY,
  geometry GEOMETRY,
  name VARCHAR(255)
); 
*/

/* ======================= Task 5 ======================= */

/*
INSERT INTO roads (geometry, name) VALUES
	('LINESTRING(7.5 10.5, 7.5 0)', 'RoadY'),
	('LINESTRING(0 4.5, 12 4.5)', 'RoadX');

INSERT INTO poi (geometry, name) VALUES
	('POINT(1 3.5)', 'G'),
	('POINT(5.5 1.5)', 'H'),
	('POINT(9.5 6)', 'I'),
	('POINT(6 5.6)', 'J'),
	('POINT(6 9.5)', 'K');

INSERT INTO buildings (geometry, name) VALUES
	('POLYGON((8 4, 10.5 4, 10.5 1.5, 8 1.5, 8 4))', 'BuildingA'),
	('POLYGON((4 7, 6 7, 6.6 6, 6 5, 4 5, 4 7))', 'BuildingB'),
	('POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))', 'BuildingC'),
	('POLYGON((9 9, 10 9, 10 8, 9 8, 9 9))', 'BuildingD'),
	('POLYGON((1 2, 2 2, 2 1, 1 1, 1 2))', 'BuildingF');
*/

/* ======================= Task 5 ======================= */

-- a - select summed length of roads
SELECT SUM(ST_Length(geometry)) FROM roads;

-- b - select geometry, area and perimeter of BuildingA
SELECT ST_GeometryType(geometry), ST_AREA(geometry), ST_PERIMETER(geometry) 
	FROM buildings
	WHERE name = 'BuildingA';

-- c - select names and areas of all buildings, sort by name
SELECT name, ST_AREA(geometry) FROM buildings
	ORDER BY name;

-- d - select names and perimeters of two largest buildings
SELECT name, ST_PERIMETER(geometry) AS perimeter FROM buildings
	ORDER BY perimeter DESC
	LIMIT 2;

-- e - get shortest distance between BuildingC and point K
SELECT MIN(ST_DISTANCE(buildings.geometry, poi.geometry)) AS distance
	FROM buildings, poi
	WHERE poi.name = 'K';

-- f - calculate area of BuildingC that with distance from BuildingB greater than 0.5
SELECT ST_AREA(ST_DIFFERENCE(bC.geometry, ST_BUFFER(bB.geometry, 0.5)))
	FROM buildings bC, buildings bB
	WHERE bc.name = 'BuildingC' AND bB.name = 'BuildingB';

-- g - select buildings which centroid is above RoadX
SELECT b.name FROM buildings b, roads r
	WHERE 
		ST_Y(ST_CENTROID(b.geometry)) > ST_Y(ST_CENTROID(r.geometry))
		AND r.name = 'RoadX';

-- h - get area of BuildingC that is not included in specified polygon
SELECT ST_AREA(b.geometry) - 
	ST_AREA(
		ST_INTERSECTION(b.geometry, 'POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))')
		) AS area
	FROM buildings b
	WHERE b.name = 'BuildingC';

