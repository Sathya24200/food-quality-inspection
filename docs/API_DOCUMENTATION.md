# API Documentation

## Base URL
```
Development: http://localhost:5000/api
Production: https://your-domain.com/api
```

## Authentication

All protected routes require a JWT token in the Authorization header:
```
Authorization: Bearer <token>
```

---

## Authentication Endpoints

### Register User

**Endpoint:** `POST /auth/register`

**Access:** Public

**Description:** Register a new user account

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

**Validation Rules:**
- `name`: Required, string
- `email`: Required, valid email format, unique
- `password`: Required, minimum 6 characters

**Success Response (201):**
```json
{
  "_id": "65f1a2b3c4d5e6f7g8h9i0j1",
  "name": "John Doe",
  "email": "john@example.com",
  "role": "user",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error Responses:**

400 - Missing fields:
```json
{
  "message": "Please provide all fields"
}
```

400 - User exists:
```json
{
  "message": "User already exists"
}
```

400 - Password too short:
```json
{
  "message": "Password must be at least 6 characters"
}
```

---

### Login User

**Endpoint:** `POST /auth/login`

**Access:** Public

**Description:** Authenticate user and receive JWT token

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

**Success Response (200):**
```json
{
  "_id": "65f1a2b3c4d5e6f7g8h9i0j1",
  "name": "John Doe",
  "email": "john@example.com",
  "role": "user",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error Responses:**

400 - Missing fields:
```json
{
  "message": "Please provide email and password"
}
```

401 - Invalid credentials:
```json
{
  "message": "Invalid email or password"
}
```

---

### Get User Profile

**Endpoint:** `GET /auth/profile`

**Access:** Private (requires authentication)

**Description:** Get current user's profile information

**Headers:**
```
Authorization: Bearer <token>
```

**Success Response (200):**
```json
{
  "_id": "65f1a2b3c4d5e6f7g8h9i0j1",
  "name": "John Doe",
  "email": "john@example.com",
  "role": "user"
}
```

**Error Responses:**

401 - No token:
```json
{
  "message": "Not authorized, no token"
}
```

401 - Invalid token:
```json
{
  "message": "Not authorized, token failed"
}
```

404 - User not found:
```json
{
  "message": "User not found"
}
```

---

## Inspection Endpoints

### Create Inspection

**Endpoint:** `POST /inspections`

**Access:** Private

**Description:** Submit a new package inspection

**Headers:**
```
Authorization: Bearer <token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "packageId": "PKG-1705512345678",
  "temperature": 22.5,
  "weight": 450,
  "isSealed": true,
  "imageData": "data:image/jpeg;base64,/9j/4AAQSkZJRg..."
}
```

**Field Descriptions:**
- `packageId`: Unique identifier for the package (string)
- `temperature`: Temperature in Celsius (number)
- `weight`: Weight in grams (number)
- `isSealed`: Seal status (boolean)
- `imageData`: Base64 encoded image (string, optional)

**Decision Logic:**
- Temperature: 0-25°C (acceptable)
- Weight: 100-1000g (acceptable)
- Seal: Must be true (sealed)
- Status: "passed" if all criteria met, otherwise "rejected"

**Success Response (201):**
```json
{
  "_id": "65f1a2b3c4d5e6f7g8h9i0j1",
  "userId": "65f1a2b3c4d5e6f7g8h9i0j0",
  "packageId": "PKG-1705512345678",
  "temperature": 22.5,
  "weight": 450,
  "isSealed": true,
  "status": "passed",
  "imageData": "data:image/jpeg;base64,/9j/4AAQSkZJRg...",
  "reason": "All parameters within acceptable range",
  "timestamp": "2026-01-17T15:45:30.123Z"
}
```

**Example - Rejected Response:**
```json
{
  "_id": "65f1a2b3c4d5e6f7g8h9i0j2",
  "userId": "65f1a2b3c4d5e6f7g8h9i0j0",
  "packageId": "PKG-1705512345679",
  "temperature": 28.5,
  "weight": 450,
  "isSealed": false,
  "status": "rejected",
  "reason": "Temperature out of range (28.5°C). Package is unsealed.",
  "timestamp": "2026-01-17T15:46:30.123Z"
}
```

**Error Responses:**

400 - Missing fields:
```json
{
  "message": "Please provide all required fields"
}
```

401 - Unauthorized:
```json
{
  "message": "Not authorized, no token"
}
```

---

### Get All Inspections

**Endpoint:** `GET /inspections`

**Access:** Private

**Description:** Retrieve all inspections for the authenticated user

**Headers:**
```
Authorization: Bearer <token>
```

**Query Parameters:**
- None (returns last 100 inspections, sorted by newest first)

**Success Response (200):**
```json
[
  {
    "_id": "65f1a2b3c4d5e6f7g8h9i0j1",
    "userId": "65f1a2b3c4d5e6f7g8h9i0j0",
    "packageId": "PKG-1705512345678",
    "temperature": 22.5,
    "weight": 450,
    "isSealed": true,
    "status": "passed",
    "reason": "All parameters within acceptable range",
    "timestamp": "2026-01-17T15:45:30.123Z"
  },
  {
    "_id": "65f1a2b3c4d5e6f7g8h9i0j2",
    "userId": "65f1a2b3c4d5e6f7g8h9i0j0",
    "packageId": "PKG-1705512345679",
    "temperature": 28.5,
    "weight": 450,
    "isSealed": false,
    "status": "rejected",
    "reason": "Temperature out of range (28.5°C). Package is unsealed.",
    "timestamp": "2026-01-17T15:46:30.123Z"
  }
]
```

**Error Responses:**

401 - Unauthorized:
```json
{
  "message": "Not authorized, no token"
}
```

---

### Get Inspection Statistics

**Endpoint:** `GET /inspections/stats`

**Access:** Private

**Description:** Get aggregated statistics for user's inspections

**Headers:**
```
Authorization: Bearer <token>
```

**Success Response (200):**
```json
{
  "totalPackages": 150,
  "passedPackages": 120,
  "rejectedPackages": 30,
  "sealedPackages": 140,
  "unsealedPackages": 10
}
```

**Field Descriptions:**
- `totalPackages`: Total number of inspections
- `passedPackages`: Number of packages that passed inspection
- `rejectedPackages`: Number of packages that failed inspection
- `sealedPackages`: Number of sealed packages
- `unsealedPackages`: Number of unsealed packages

**Error Responses:**

401 - Unauthorized:
```json
{
  "message": "Not authorized, no token"
}
```

---

### Delete Inspection

**Endpoint:** `DELETE /inspections/:id`

**Access:** Private

**Description:** Delete a specific inspection record

**Headers:**
```
Authorization: Bearer <token>
```

**URL Parameters:**
- `id`: Inspection ID (MongoDB ObjectId)

**Success Response (200):**
```json
{
  "message": "Inspection removed"
}
```

**Error Responses:**

404 - Not found:
```json
{
  "message": "Inspection not found"
}
```

401 - Not authorized (not owner):
```json
{
  "message": "Not authorized"
}
```

---

## Error Codes Summary

| Status Code | Meaning |
|-------------|---------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request (validation error) |
| 401 | Unauthorized (authentication required) |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## Example Usage with cURL

### Register
```bash
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Login
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Create Inspection
```bash
curl -X POST http://localhost:5000/api/inspections \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{
    "packageId": "PKG-1705512345678",
    "temperature": 22.5,
    "weight": 450,
    "isSealed": true
  }'
```

### Get Statistics
```bash
curl -X GET http://localhost:5000/api/inspections/stats \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

---

## Example Usage with JavaScript (Axios)

### Setup
```javascript
import axios from 'axios';

const API_URL = 'http://localhost:5000/api';

// Set default authorization header
axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
```

### Register
```javascript
const register = async (name, email, password) => {
  const response = await axios.post(`${API_URL}/auth/register`, {
    name,
    email,
    password
  });
  return response.data;
};
```

### Login
```javascript
const login = async (email, password) => {
  const response = await axios.post(`${API_URL}/auth/login`, {
    email,
    password
  });
  return response.data;
};
```

### Create Inspection
```javascript
const createInspection = async (inspectionData) => {
  const response = await axios.post(`${API_URL}/inspections`, inspectionData);
  return response.data;
};
```

### Get Statistics
```javascript
const getStats = async () => {
  const response = await axios.get(`${API_URL}/inspections/stats`);
  return response.data;
};
```

---

## Rate Limiting

Currently, there are no rate limits implemented. For production deployment, consider adding rate limiting middleware:

```javascript
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});

app.use('/api/', limiter);
```

---

## Data Retention

- Inspections are stored indefinitely
- Users can delete their own inspection records
- No automatic cleanup is implemented

---

## Security Considerations

1. **Password Storage**: Passwords are hashed using bcrypt with 10 salt rounds
2. **JWT Tokens**: Tokens expire after 7 days (configurable)
3. **CORS**: Configured to accept requests from frontend origin
4. **Input Validation**: All inputs are validated before processing
5. **Authorization**: Protected routes verify user ownership of resources

---

## Testing with Postman

Import this collection to test all endpoints:

1. Create a new collection named "Food Quality Inspection"
2. Add environment variables:
   - `baseUrl`: http://localhost:5000/api
   - `token`: (will be set after login)
3. Create requests for each endpoint as documented above
4. Use `{{baseUrl}}` and `{{token}}` variables in requests

---

**API Version:** 1.0.0  
**Last Updated:** January 17, 2026
