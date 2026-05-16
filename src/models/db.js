import pg from 'pg';
const { Pool } = pg;

const pool = new Pool({
    connectionString: process.env.DB_URL,
    ssl: {
        rejectUnauthorized: false
    }
});

let db = null;

if (process.env.NODE_ENV === 'development' && process.env.ENABLE_SQL_LOGGING === 'true') {
    db = {
        async query(text, params) {
            try {
                const start = Date.now();
                const res = await pool.query(text, params);
                const duration = Date.now() - start;
                console.log('Consulta ejecutada:', { 
                    text: text.replace(/\s+/g, ' ').trim(), 
                    duration: `${duration}ms`, 
                    rows: res.rowCount 
                });
                return res;
            } catch (error) {
                console.error('Error en consulta:', { 
                    text: text.replace(/\s+/g, ' ').trim(), 
                    error: error.message 
                });
                throw error;
            }
        },
        async close() {
            await pool.end();
        }
    };
} else {
    db = pool;
}

const testConnection = async () => {
    try {
        const result = await db.query('SELECT NOW() as current_time');
        console.log('¡Conexión a la base de datos exitosa! Hora del servidor:', result.rows[0].current_time);
        return true;
    } catch (error) {
        console.error('La conexión a la base de datos falló:', error.message);
        throw error;
    }
};

export { db as default, testConnection };