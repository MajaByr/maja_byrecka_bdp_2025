/* ======================= SETUP ======================= */
----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_STREET_NODE.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
 
/* ======================= Task 6 ======================= */

-- Select all street nodes closer than 200 meters from input_points
SELECT SN FROM T2019_KAR_STREET_NODE SN, INPUT_POINTS IP
	WHERE ST_WITHIN(ST_TRANSFORM(SN.GEOM, 3068), ST_BUFFER(IP.geometry, 200));
