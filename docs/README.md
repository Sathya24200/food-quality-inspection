# Smart Packaged Food Quality Inspection System

## 📋 Project Overview

A comprehensive web-based quality inspection system for packaged food products that uses camera-based inspection, sensor data analysis, and automated decision-making to classify packages as passed or rejected.

## 🎯 Features

### Core Functionality
- ✅ **User Authentication**: Secure registration and login using JWT tokens
- 📸 **Camera Integration**: Real-time camera access using Web Camera API
- 🌡️ **Sensor Data Monitoring**: Temperature and weight tracking
- 🔒 **Seal Detection**: Automated sealed/unsealed package classification
- ✔️ **Automated Decision Logic**: Accept/reject based on quality parameters
- 📊 **Real-time Dashboard**: Live statistics and counters
- 📜 **Inspection History**: Complete log with date/time stamps
- 🚪 **Secure Logout**: Session management

### Dashboard Counters
1. Total Packages Inspected
2. Passed Packages
3. Rejected Packages
4. Sealed Packages
5. Unsealed Packages

## 🏗️ Technology Stack

### Frontend
- **Framework**: React.js 18.2
- **Build Tool**: Vite 4.5
- **Routing**: React Router DOM 6.16
- **HTTP Client**: Axios 1.5
- **Icons**: React Icons 4.11
- **Styling**: Modern CSS with CSS Variables

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js 4.18
- **Database**: MongoDB with Mongoose 7.6
- **Authentication**: JWT (jsonwebtoken 9.0)
- **Password Hashing**: bcryptjs 2.4
- **CORS**: cors 2.8
- **Environment Variables**: dotenv 16.3

## 📁 Project Structure

```
food-quality-inspection/
├── backend/
│   ├── config/
│   │   └── db.js                 # MongoDB connection
│   ├── controllers/
│   │   ├── authController.js     # Authentication logic
│   │   └── inspectionController.js # Inspection logic
│   ├── middleware/
│   │   └── authMiddleware.js     # JWT verification
│   ├── models/
│   │   ├── User.js               # User schema
│   │   └── Inspection.js         # Inspection schema
│   ├── routes/
│   │   ├── authRoutes.js         # Auth endpoints
│   │   └── inspectionRoutes.js   # Inspection endpoints
│   ├── utils/
│   │   └── generateToken.js      # JWT token generator
│   ├── .env                      # Environment variables
│   ├── server.js                 # Express server
│   └── package.json
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   └── PrivateRoute.jsx  # Protected route wrapper
│   │   ├── context/
│   │   │   └── AuthContext.jsx   # Global auth state
│   │   ├── pages/
│   │   │   ├── Login.jsx         # Login page
│   │   │   ├── Register.jsx      # Registration page
│   │   │   ├── Dashboard.jsx     # Main dashboard
│   │   │   ├── Auth.css          # Auth page styles
│   │   │   └── Dashboard.css     # Dashboard styles
│   │   ├── App.jsx               # Main app component
│   │   ├── main.jsx              # React entry point
│   │   └── index.css             # Global styles
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
└── docs/
    ├── README.md                 # This file
    ├── DEPLOYMENT.md             # Deployment guide
    ├── API_DOCUMENTATION.md      # API reference
    └── VIVA_GUIDE.md             # Viva preparation
```

## 🔧 Quality Decision Logic

The system automatically determines package quality based on:

### Acceptance Criteria
- **Temperature**: 0°C to 25°C (acceptable range)
- **Weight**: 100g to 1000g (acceptable range)
- **Seal Status**: Must be sealed

### Decision Rules
- ✅ **PASSED**: All parameters within acceptable range
- ❌ **REJECTED**: Any parameter out of range or package unsealed

## 🗄️ Database Schema

### User Collection
```javascript
{
  name: String (required),
  email: String (required, unique),
  password: String (hashed, required),
  role: String (enum: ['user', 'admin']),
  createdAt: Date
}
```

### Inspection Collection
```javascript
{
  userId: ObjectId (ref: User),
  packageId: String (unique identifier),
  temperature: Number (°C),
  weight: Number (grams),
  isSealed: Boolean,
  status: String (enum: ['passed', 'rejected']),
  imageData: String (base64 encoded),
  reason: String (decision explanation),
  timestamp: Date
}
```

## 🔐 API Endpoints

### Authentication Routes
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/profile` - Get user profile (protected)

### Inspection Routes
- `POST /api/inspections` - Create new inspection (protected)
- `GET /api/inspections` - Get all inspections (protected)
- `GET /api/inspections/stats` - Get statistics (protected)
- `DELETE /api/inspections/:id` - Delete inspection (protected)

## 🎨 Design Features

### Modern UI/UX
- Dark theme with gradient accents
- Glassmorphism effects
- Smooth animations and transitions
- Responsive design for all devices
- Real-time data updates
- Interactive hover effects

### Color Palette
- Primary: Blue gradient (#667eea → #764ba2)
- Success: Green gradient (#43e97b → #38f9d7)
- Danger: Red gradient (#f093fb → #f5576c)
- Info: Cyan gradient (#4facfe → #00f2fe)

## 🚀 Getting Started

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed installation and deployment instructions.

## 📚 Additional Documentation

- [API Documentation](./API_DOCUMENTATION.md) - Complete API reference
- [Deployment Guide](./DEPLOYMENT.md) - Step-by-step deployment
- [Viva Guide](./VIVA_GUIDE.md) - Academic presentation preparation

## 👥 Use Cases

1. **Food Manufacturing Plants**: Quality control at packaging lines
2. **Distribution Centers**: Incoming shipment verification
3. **Retail Stores**: Product quality assurance
4. **Research Labs**: Food safety testing and analysis

## 🔒 Security Features

- Password hashing with bcrypt (10 salt rounds)
- JWT token-based authentication
- Protected API routes
- CORS configuration
- Input validation and sanitization
- Secure session management

## 📱 Browser Compatibility

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

**Note**: Camera access requires HTTPS in production or localhost in development.

## 📄 License

MIT License - Free for academic and commercial use

## 🤝 Contributing

This is an academic project. For improvements or suggestions, please document them in the project report.

---

**Developed for**: Academic Submission  
**Category**: Industrial Automation & IoT  
**Level**: Final Year Project / Capstone
