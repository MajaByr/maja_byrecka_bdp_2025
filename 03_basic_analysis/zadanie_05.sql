/* ======================= Task 5 ======================= */

-- Select area of all buffers (increased by 5) created from objects that don't contain curves
SELECT ST_AREA(ST_BUFFER(geometry, 5))
	FROM objects
	WHERE NOT ST_HASARC(geometry); -- ST_HASARC returns True if geometry contains circular string
