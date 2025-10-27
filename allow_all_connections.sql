-- Allow root user to connect from ANY host
-- WARNING: This is a security risk! Only use in development environments.

-- Create root user that accepts connections from any host
CREATE USER 'root'@'%' IDENTIFIED BY 'your_password_here';

-- Grant all privileges
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- Apply changes
FLUSH PRIVILEGES;

-- Verify the new user
SELECT User, Host FROM mysql.user WHERE User = 'root';

-- You should see:
-- +------+-----------+
-- | User | Host      |
-- +------+-----------+
-- | root | localhost |
-- | root | %         |
-- +------+-----------+

