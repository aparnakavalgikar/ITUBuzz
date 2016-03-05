CREATE SCHEMA ITUBUZZ;

use ITUBUZZ;

-- create a user in your local as below
-- Once we finalize the server, we will create user 
-- using that host name as in example below
CREATE USER 'dbadmin'@'localhost' 
IDENTIFIED BY 'dbadmin';

/** 
 * (The following command is an example user creation in Amazon RDS)
 * create user 'dbadmin'@'itubuzz.cyy9rwcwacrf.us-west-1.rds.amazonaws.com' 
 * identified by 'dbadmin'; 
 */
 
GRANT ALL ON ITUBUZZ TO 'dbadmin'@'localhost';