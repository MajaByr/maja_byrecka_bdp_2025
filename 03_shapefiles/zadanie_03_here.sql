/* ======================= SETUP ======================= */
----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2018_KAR_GERMANY/T2018_KAR_STREETS.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_STREETS.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
 
 
/* ======================= Task 3 ======================= */

-- Create table streets_reprojected, containing T2019_KAR_STREETS transformed to DHDN.Berlin/Cassini (3068) 
-- coordinate system (from 2180)
CREATE TABLE streets_reprojected AS
SELECT 
    *,
    ST_Transform(geom, 3068) AS geom_converted
FROM T2019_KAR_STREETS;
