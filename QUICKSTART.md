# Quick Start Guide

## ⚡ 5-Minute Setup

### Step 1: Install Prerequisites (One-time)

**Install Node.js:**
- Download from: https://nodejs.org/
- Choose LTS version (16.x or higher)
- Verify: `node --version`

**Install MongoDB:**
- Download from: https://www.mongodb.com/try/download/community
- Install as Windows Service (recommended)
- Verify: `mongod --version`

### Step 2: Install Dependencies

**Backend:**
```bash
cd food-quality-inspection/backend
npm install
```

**Frontend:**
```bash
cd food-quality-inspection/frontend
npm install
```

### Step 3: Start the Application

**Terminal 1 - Start Backend:**
```bash
cd backend
npm start
```
✅ Backend running on http://localhost:5000

**Terminal 2 - Start Frontend:**
```bash
cd frontend
npm run dev
```
✅ Frontend running on http://localhost:3000

### Step 4: Use the Application

1. Open browser: http://localhost:3000
2. Click "Register here"
3. Create account (name, email, password)
4. You're in! Start inspecting packages

---

## 🎯 First Inspection in 30 Seconds

1. **Start Camera** → Click "Start Camera" button
2. **Capture** → Position package, click "Capture Image"
3. **Generate Data** → Click "Generate Sensor Data"
4. **Submit** → Click "Submit Inspection"
5. **View Results** → See statistics update and history log

---

## 🔧 Troubleshooting

### MongoDB not starting?
```bash
# Windows
net start MongoDB

# Check if running
mongod --version
```

### Port already in use?
```bash
# Kill process on port 5000
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### Camera not working?
- Allow camera permissions in browser
- Use localhost (not 127.0.0.1)
- Check if another app is using camera

### Dependencies not installing?
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
```

---

## 📝 Default Configuration

**Backend (.env):**
```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/food_quality_inspection
JWT_SECRET=food_quality_inspection_secret_key_2026
JWT_EXPIRE=7d
NODE_ENV=development
```

**Frontend (vite.config.js):**
```javascript
server: {
  port: 3000,
  proxy: {
    '/api': 'http://localhost:5000'
  }
}
```

---

## 🎓 Demo Scenarios

### Scenario 1: Valid Package (PASS)
- Temperature: 20°C
- Weight: 500g
- Sealed: Yes
- **Result**: ✅ PASSED

### Scenario 2: High Temperature (REJECT)
- Temperature: 30°C
- Weight: 500g
- Sealed: Yes
- **Result**: ❌ REJECTED (Temperature out of range)

### Scenario 3: Unsealed Package (REJECT)
- Temperature: 20°C
- Weight: 500g
- Sealed: No
- **Result**: ❌ REJECTED (Package unsealed)

---

## 📊 Quality Criteria Reference

| Parameter | Min | Max | Unit |
|-----------|-----|-----|------|
| Temperature | 0 | 25 | °C |
| Weight | 100 | 1000 | g |
| Sealed | - | True | Boolean |

---

## 🚀 Production Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete production deployment guide.

**Quick Production Checklist:**
- [ ] Change JWT_SECRET to secure random string
- [ ] Use MongoDB Atlas for cloud database
- [ ] Build frontend: `npm run build`
- [ ] Deploy backend to Heroku/AWS
- [ ] Deploy frontend to Vercel/Netlify
- [ ] Enable HTTPS (required for camera)

---

## 📚 Full Documentation

- [README.md](README.md) - Project overview
- [DEPLOYMENT.md](DEPLOYMENT.md) - Detailed deployment
- [API_DOCUMENTATION.md](API_DOCUMENTATION.md) - API reference
- [VIVA_GUIDE.md](VIVA_GUIDE.md) - Academic preparation

---

## 🎤 Quick Viva Answers

**Q: What technologies did you use?**
A: React.js frontend, Node.js/Express backend, MongoDB database, JWT authentication

**Q: How does the quality check work?**
A: System checks temperature (0-25°C), weight (100-1000g), and seal status. If all pass, package is accepted; otherwise rejected.

**Q: How is the camera integrated?**
A: Using Web Camera API (getUserMedia) to access webcam, capture frames to canvas, convert to base64 image.

**Q: How do you secure the application?**
A: JWT tokens for authentication, bcrypt for password hashing, protected API routes, CORS configuration.

---

**Need Help?** Check the full documentation in the `docs/` folder!
