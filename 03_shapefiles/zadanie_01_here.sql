/* ======================= SETUP ======================= */
----- pgsql -----
-- CREATE EXTENSION postgis;

----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2018_KAR_GERMANY/T2018_KAR_BUILDINGS.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_BUILDINGS.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
 
 
/* ======================= Task 1 ======================= */

-- Select buildings built/modified between 2018-2019
SELECT * FROM T2019_KAR_BUILDINGS T2019 
	FULL OUTER JOIN T2018_KAR_BUILDINGS T2018
		ON T2018.GEOM = T2019.GEOM -- GID doesn't consider modified buildings
	WHERE T2018.GID IS NULL; 
