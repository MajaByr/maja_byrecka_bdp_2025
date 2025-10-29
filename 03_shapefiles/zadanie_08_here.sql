/* ======================= SETUP ======================= */
----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_RAILWAYS.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_WATER_LINES.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3

/* ======================= Task 8 ======================= */

-- Create table from intersect points of railways and water lines
CREATE TABLE T2019_KAR_BRIDGES AS
SELECT 
    ST_INTERSECTION(R.GEOM, WL.GEOM) AS GEOM
FROM T2019_KAR_RAILWAYS R
JOIN T2019_KAR_WATER_LINES WL
  ON ST_INTERSECTS(R.GEOM, WL.GEOM);


