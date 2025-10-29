/* ======================= Task 5 ======================= */

-- Update data in the input_points table, so they are converted to DHDN.Berlin/Cassini coordinates system
UPDATE input_points
SET geometry = ST_Transform(geometry, 3068);