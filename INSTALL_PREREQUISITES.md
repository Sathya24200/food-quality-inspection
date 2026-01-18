# 🚀 Prerequisites Installation Guide

## ⚠️ IMPORTANT: You Must Install These First

Your system is missing Node.js and npm. Follow these steps:

---

## Step 1: Install Node.js (5 minutes)

### Download
1. Open your browser
2. Go to: **https://nodejs.org/**
3. Click the **green "LTS" button** (recommended version)
4. Download will start automatically (file: `node-v20.x.x-x64.msi`)

### Install
1. Find the downloaded file (usually in Downloads folder)
2. **Double-click** the `.msi` file
3. Click **"Next"** on welcome screen
4. **Accept** the license agreement
5. Keep default installation path: `C:\Program Files\nodejs\`
6. **IMPORTANT**: On "Tools for Native Modules" screen:
   - ✅ Check the box "Automatically install the necessary tools"
7. Click **"Next"** → **"Install"**
8. Wait for installation (2-3 minutes)
9. Click **"Finish"**

### Verify Installation
1. **Close all PowerShell/Terminal windows**
2. Open a **NEW PowerShell window** (important!)
3. Run these commands:
   ```powershell
   node --version
   npm --version
   ```
4. You should see version numbers like:
   ```
   v20.11.0
   10.2.4
   ```

✅ **If you see version numbers, Node.js is installed correctly!**

---

## Step 2: Install MongoDB (10 minutes)

### Download
1. Go to: **https://www.mongodb.com/try/download/community**
2. Select:
   - Version: 7.0.x (current)
   - Platform: Windows
   - Package: msi
3. Click **"Download"**

### Install
1. Run the downloaded `.msi` file
2. Choose **"Complete"** installation type
3. **Install MongoDB as a Service**:
   - ✅ Check "Install MongoDB as a Service"
   - Service Name: MongoDB
   - Data Directory: C:\Program Files\MongoDB\Server\7.0\data\
   - Log Directory: C:\Program Files\MongoDB\Server\7.0\log\
4. **Install MongoDB Compass** (optional GUI tool):
   - ✅ Check this box if you want a visual database tool
5. Click **"Next"** → **"Install"**
6. Wait for installation (5-7 minutes)
7. Click **"Finish"**

### Verify MongoDB is Running
1. Open PowerShell as **Administrator**
2. Run:
   ```powershell
   mongod --version
   ```
3. You should see MongoDB version info

### Start MongoDB Service (if not running)
```powershell
net start MongoDB
```

✅ **MongoDB is now installed and running!**

---

## Step 3: After Installation

Once both are installed, come back to this project and run:

### Terminal 1 - Backend
```powershell
cd d:\Antigravity\food-quality-inspection\backend
npm install
npm start
```

### Terminal 2 - Frontend
```powershell
cd d:\Antigravity\food-quality-inspection\frontend
npm install
npm run dev
```

### Open Browser
```
http://localhost:3000
```

---

## 🆘 Troubleshooting

### "npm is not recognized" after installing Node.js
- **Solution**: Close ALL terminal windows and open a NEW one
- Node.js adds itself to PATH, but existing terminals won't see it

### MongoDB won't start
```powershell
# Check if service exists
sc query MongoDB

# Start the service
net start MongoDB

# If that fails, start manually
mongod
```

### Port already in use
```powershell
# Find what's using port 5000
netstat -ano | findstr :5000

# Kill the process (replace <PID> with actual number)
taskkill /PID <PID> /F
```

---

## ⏱️ Total Installation Time

- Node.js: ~5 minutes
- MongoDB: ~10 minutes
- **Total: ~15 minutes**

---

## ✅ Checklist

- [ ] Downloaded Node.js installer
- [ ] Installed Node.js
- [ ] Verified: `node --version` works
- [ ] Verified: `npm --version` works
- [ ] Downloaded MongoDB installer
- [ ] Installed MongoDB
- [ ] Verified: `mongod --version` works
- [ ] MongoDB service is running
- [ ] Ready to install project dependencies!

---

**After completing these steps, the application will run perfectly!** 🚀
