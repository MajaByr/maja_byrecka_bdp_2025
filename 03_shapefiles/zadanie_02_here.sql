/* ======================= SETUP ======================= */
----- bash -----
-- shp2pgsql -I -s 2180 "/path/T2018_KAR_GERMANY/T2018_KAR_POI_TABLE.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
-- shp2pgsql -I -s 2180 "/path/T2019_KAR_GERMANY/T2019_KAR_POI_TABLE.shp" | psql -U postgres -h localhost -W -d SpatialDB-cw3
 
 
/* ======================= Task 2 ======================= */

-- Select number of points of interests added in 2019 in 500m buffer from new/modified buildings, gropued by type
WITH MODIFIED_BUILDINGS AS (
	SELECT T2019.GEOM FROM T2019_KAR_BUILDINGS T2019 
		FULL OUTER JOIN T2018_KAR_BUILDINGS T2018
			ON T2018.GEOM = T2019.GEOM
		WHERE T2018.GID IS NULL 
	),
	
NEW_POINTS AS (
	SELECT T2019.GEOM, T2019.TYPE FROM T2019_KAR_POI_TABLE T2019 
		FULL OUTER JOIN T2018_KAR_POI_TABLE T2018
			ON T2018.GEOM = T2019.GEOM
		WHERE T2018.GID IS NULL 
	)

SELECT COUNT(NP.GEOM), NP.TYPE FROM MODIFIED_BUILDINGS MB, NEW_POINTS NP
	WHERE ST_WITHIN(NP.GEOM, ST_BUFFER(MB.GEOM, 500))
	GROUP BY NP.TYPE;