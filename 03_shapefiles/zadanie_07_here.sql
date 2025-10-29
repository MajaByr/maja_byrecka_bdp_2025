/* ======================= SETUP ======================= */
----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_LAND_USE_A.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
 
/* ======================= Task 7 ======================= */

-- Count sporting goods stores that are closer than 300 meters from parks

SELECT COUNT(PT) FROM T2019_KAR_POI_TABLE PT, T2019_KAR_LAND_USE_A LU
	WHERE PT.TYPE = 'Sporting Goods Store' AND
	ST_WITHIN(PT.GEOM, ST_BUFFER(LU.GEOM, 300));
