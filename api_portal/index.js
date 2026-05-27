import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';

// Middleware
// Initialize Firebase
import './config/firebase.js';

// Middleware
import { verifyApiKey } from './middleware/apiKey.js';

// Routes
import v1Routes from './routes/v1.js';
import { testConnection } from './config/database.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 8080;

// Security and Logging
app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// Apply Global API Key Protection (Portal Gate)
//app.use(verifyApiKey);

// Mount API Routes
app.use('/v1', verifyApiKey, v1Routes);

// General Health Check
app.get('/health', (req, res) => res.json({ status: 'Portal Active', environment: process.env.NODE_ENV || 'development' }));

// Start Server
app.listen(PORT, async () => {
  console.log(`\n[API Portal] Listening on port ${PORT}`);
  console.log(`[Endpoint] http://localhost:${PORT}/v1\n`);
  
  // Verify Database Connection
  await testConnection();
});
