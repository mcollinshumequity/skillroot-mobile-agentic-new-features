import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    port: process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: parseInt(process.env.DB_CONNECTION_LIMIT) || 10,
    idleTimeout: 60000,
    enableKeepAlive: true,
    keepAliveInitialDelay: 0,
    ssl: {
        rejectUnauthorized: false
    }
};

// If we are in GCP environment and DB_SOCKET_PATH is provided, use it
if (process.env.DB_SOCKET_PATH) {
    dbConfig.socketPath = process.env.DB_SOCKET_PATH;
    delete dbConfig.host;
    delete dbConfig.port;
}

const pool = mysql.createPool(dbConfig);

// Helper to test connection
export const testConnection = async () => {
    try {
        const connection = await pool.getConnection();
        console.log('[Database] Connected to MySQL successfully.');
        connection.release();
        return true;
    } catch (error) {
        console.error('[Database] Connection failed:', error.message);
        return false;
    }
};

export default pool;
