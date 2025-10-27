-- Check current MySQL users and their allowed hosts
SELECT User, Host, plugin, password_expired 
FROM mysql.user 
WHERE User = 'root';

-- Check all users
SELECT User, Host 
FROM mysql.user 
ORDER BY User, Host;

