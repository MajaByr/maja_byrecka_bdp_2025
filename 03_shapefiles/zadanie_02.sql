/* ======================= Task 2 ======================= */

-- Select area of buffer increased by 5 from shortest line between objects 3 and 4
SELECT ST_Area(
	ST_Buffer(
		ST_ShortestLine(
		    (SELECT geometry FROM objects WHERE name='obiekt3'),
		    (SELECT geometry FROM objects WHERE name='obiekt4')
		), 
	5
	)	
);