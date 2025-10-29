/* ======================= Task 4 ======================= */

-- Create table input_points and insert two points into this table
CREATE TABLE input_points (
  id SERIAL PRIMARY KEY,
  geometry GEOMETRY
); 


INSERT INTO input_points (geometry) VALUES
	(ST_SetSRID(ST_GeomFromText('POINT(8.36093 49.03174)'), 4326)), -- default coordinates system
	(ST_SetSRID(ST_GeomFromText('POINT(8.39876 49.00644)'), 4326));