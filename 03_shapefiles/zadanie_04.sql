/* ======================= Task 4 ======================= */

-- Save sum of objects 3 and 4 as object7
INSERT INTO objects (geometry, name)
	SELECT ST_Collect(obiekt3.geometry, obiekt4.geometry), 'obiekt7' -- ST_COLLECT aggregates geometries into collection
	FROM objects obiekt3, objects obiekt4
	WHERE obiekt3.name='obiekt3' AND obiekt4.name='obiekt4';