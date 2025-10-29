/* ======================= Task 3 ======================= */

-- Change object 4 to polygon
-- It's necessary to ensure that the line is closed (loop)

SELECT ST_GEOMETRYTYPE(geometry) FROM OBJECTS WHERE id=4;


UPDATE objects
	SET geometry = ST_AddPoint(geometry, ST_StartPoint(geometry))
	WHERE name='obiekt4';

UPDATE objects
	SET geometry = ST_MakePolygon(geometry)
	WHERE name='obiekt4';


SELECT ST_GEOMETRYTYPE(geometry) FROM OBJECTS WHERE id=4;