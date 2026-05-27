import dotenv from 'dotenv';
dotenv.config();

export const verifyApiKey = (req, res, next) => {
  const apiKey = req.headers['x-sr-api-key'];
  const expectedKey = process.env.PORTAL_API_KEY;

  if (!apiKey || apiKey !== expectedKey) {
    return res.status(403).json({
      success: false,
      message: 'Forbidden: Missing or invalid Portal API Key.'
    });
  }

  next();
};
