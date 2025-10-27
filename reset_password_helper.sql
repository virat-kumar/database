-- MySQL Password Reset Helper Script
-- Run this script after connecting with: mysql -u root -p --connect-expired-password

-- Reset the password to match .env file
ALTER USER 'root'@'localhost' IDENTIFIED BY '#Unlockme007';

-- Set password to never expire
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;

-- Refresh privileges
FLUSH PRIVILEGES;

-- Verify the change
SELECT User, Host, password_expired, password_lifetime 
FROM mysql.user 
WHERE User = 'root';

-- Show message
SELECT 'Password has been reset successfully!' AS Status;

