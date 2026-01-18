# Deployment Guide

## 📋 Prerequisites

Before deploying the application, ensure you have:

- **Node.js**: Version 16.x or higher ([Download](https://nodejs.org/))
- **MongoDB**: Version 5.x or higher ([Download](https://www.mongodb.com/try/download/community))
- **Git**: For version control (optional)
- **Modern Web Browser**: Chrome, Firefox, Safari, or Edge

## 🔧 Local Development Setup

### Step 1: Install MongoDB

#### Windows
1. Download MongoDB Community Server from [mongodb.com](https://www.mongodb.com/try/download/community)
2. Run the installer and follow the setup wizard
3. Choose "Complete" installation
4. Install MongoDB as a Windows Service
5. Verify installation:
   ```powershell
   mongod --version
   ```

#### macOS
```bash
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community
```

#### Linux (Ubuntu/Debian)
```bash
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
```

### Step 2: Backend Setup

1. **Navigate to backend directory**:
   ```bash
   cd food-quality-inspection/backend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Configure environment variables**:
   - The `.env` file is already created with default values
   - Modify if needed:
     ```env
     PORT=5000
     MONGODB_URI=mongodb://localhost:27017/food_quality_inspection
     JWT_SECRET=food_quality_inspection_secret_key_2026
     JWT_EXPIRE=7d
     NODE_ENV=development
     ```

4. **Start the backend server**:
   ```bash
   npm start
   ```
   
   Or for development with auto-reload:
   ```bash
   npm run dev
   ```

5. **Verify backend is running**:
   - Open browser and navigate to `http://localhost:5000`
   - You should see: `{"message": "Food Quality Inspection API is running"}`

### Step 3: Frontend Setup

1. **Open a new terminal** and navigate to frontend directory:
   ```bash
   cd food-quality-inspection/frontend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the development server**:
   ```bash
   npm run dev
   ```

4. **Access the application**:
   - Open browser and navigate to `http://localhost:3000`
   - The application should load successfully

## 🎯 First-Time Usage

### 1. Register a New Account
1. Click "Register here" on the login page
2. Fill in your details:
   - Full Name
   - Email Address
   - Password (minimum 6 characters)
3. Click "Register"
4. You'll be automatically logged in and redirected to the dashboard

### 2. Perform Your First Inspection
1. Click "Start Camera" to activate your webcam
2. Position a package in front of the camera
3. Click "Capture Image" to take a photo
4. Click "Generate Sensor Data" to simulate temperature and weight readings
5. Review the data and click "Submit Inspection"
6. View the results in the statistics cards and history panel

## 🌐 Production Deployment

### Option 1: Traditional VPS Deployment

#### Backend Deployment

1. **Prepare the server**:
   ```bash
   sudo apt update
   sudo apt install nodejs npm mongodb
   ```

2. **Clone or upload your project**:
   ```bash
   git clone <your-repo-url>
   cd food-quality-inspection/backend
   ```

3. **Install dependencies**:
   ```bash
   npm install --production
   ```

4. **Configure environment**:
   ```bash
   nano .env
   ```
   Update with production values:
   ```env
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/food_quality_inspection
   JWT_SECRET=<generate-strong-secret>
   JWT_EXPIRE=7d
   NODE_ENV=production
   ```

5. **Use PM2 for process management**:
   ```bash
   npm install -g pm2
   pm2 start server.js --name food-inspection-api
   pm2 startup
   pm2 save
   ```

6. **Configure Nginx as reverse proxy**:
   ```nginx
   server {
       listen 80;
       server_name api.yourdomain.com;

       location / {
           proxy_pass http://localhost:5000;
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
       }
   }
   ```

#### Frontend Deployment

1. **Build the production bundle**:
   ```bash
   cd food-quality-inspection/frontend
   npm install
   npm run build
   ```

2. **Configure Nginx to serve static files**:
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       root /var/www/food-inspection/dist;
       index index.html;

       location / {
           try_files $uri $uri/ /index.html;
       }

       location /api {
           proxy_pass http://localhost:5000;
       }
   }
   ```

3. **Copy build files**:
   ```bash
   sudo mkdir -p /var/www/food-inspection
   sudo cp -r dist/* /var/www/food-inspection/
   ```

### Option 2: Cloud Platform Deployment

#### Heroku (Backend)

1. **Install Heroku CLI**:
   ```bash
   npm install -g heroku
   ```

2. **Login and create app**:
   ```bash
   heroku login
   cd backend
   heroku create food-inspection-api
   ```

3. **Add MongoDB Atlas**:
   - Sign up at [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
   - Create a free cluster
   - Get connection string
   - Add to Heroku config:
     ```bash
     heroku config:set MONGODB_URI="mongodb+srv://..."
     heroku config:set JWT_SECRET="your-secret"
     ```

4. **Deploy**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git push heroku main
   ```

#### Vercel (Frontend)

1. **Install Vercel CLI**:
   ```bash
   npm install -g vercel
   ```

2. **Deploy**:
   ```bash
   cd frontend
   vercel
   ```

3. **Update API endpoint**:
   - Create `frontend/.env.production`:
     ```env
     VITE_API_URL=https://your-backend-url.herokuapp.com
     ```
   - Update axios base URL in code if needed

#### Netlify (Frontend Alternative)

1. **Install Netlify CLI**:
   ```bash
   npm install -g netlify-cli
   ```

2. **Build and deploy**:
   ```bash
   cd frontend
   npm run build
   netlify deploy --prod --dir=dist
   ```

## 🔒 SSL/HTTPS Configuration

For production, always use HTTPS (required for camera access):

### Using Let's Encrypt (Free)

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

## 🧪 Testing the Deployment

### Backend Health Check
```bash
curl http://localhost:5000
# Should return: {"message": "Food Quality Inspection API is running"}
```

### Test Registration
```bash
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"test123"}'
```

### Test Login
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test123"}'
```

## 🐛 Troubleshooting

### MongoDB Connection Issues
- **Error**: "MongoNetworkError: failed to connect"
- **Solution**: 
  ```bash
  # Check if MongoDB is running
  sudo systemctl status mongod
  # Start if not running
  sudo systemctl start mongod
  ```

### Port Already in Use
- **Error**: "EADDRINUSE: address already in use :::5000"
- **Solution**:
  ```bash
  # Windows
  netstat -ano | findstr :5000
  taskkill /PID <PID> /F
  
  # Linux/Mac
  lsof -ti:5000 | xargs kill -9
  ```

### Camera Not Working
- **Issue**: Camera access denied
- **Solution**: 
  - Ensure you're using HTTPS in production
  - Check browser permissions
  - Use localhost for development testing

### CORS Errors
- **Error**: "Access-Control-Allow-Origin"
- **Solution**: Verify CORS configuration in `backend/server.js`

### Build Errors
- **Error**: Module not found
- **Solution**:
  ```bash
  rm -rf node_modules package-lock.json
  npm install
  ```

## 📊 Performance Optimization

### Backend
- Enable compression:
  ```bash
  npm install compression
  ```
  Add to `server.js`:
  ```javascript
  const compression = require('compression');
  app.use(compression());
  ```

### Frontend
- Already optimized with Vite
- Production build includes:
  - Code splitting
  - Tree shaking
  - Minification
  - Asset optimization

## 🔄 Updating the Application

1. **Pull latest changes**:
   ```bash
   git pull origin main
   ```

2. **Update backend**:
   ```bash
   cd backend
   npm install
   pm2 restart food-inspection-api
   ```

3. **Update frontend**:
   ```bash
   cd frontend
   npm install
   npm run build
   sudo cp -r dist/* /var/www/food-inspection/
   ```

## 📝 Environment Variables Reference

### Backend (.env)
| Variable | Description | Example |
|----------|-------------|---------|
| PORT | Server port | 5000 |
| MONGODB_URI | MongoDB connection string | mongodb://localhost:27017/db_name |
| JWT_SECRET | Secret key for JWT | random_secure_string |
| JWT_EXPIRE | Token expiration time | 7d |
| NODE_ENV | Environment mode | production |

### Frontend (optional)
| Variable | Description | Example |
|----------|-------------|---------|
| VITE_API_URL | Backend API URL | https://api.example.com |

## ✅ Deployment Checklist

- [ ] MongoDB installed and running
- [ ] Backend dependencies installed
- [ ] Environment variables configured
- [ ] Backend server running on port 5000
- [ ] Frontend dependencies installed
- [ ] Frontend running on port 3000
- [ ] Can register new user
- [ ] Can login successfully
- [ ] Camera access working
- [ ] Can submit inspections
- [ ] Statistics updating correctly
- [ ] History displaying properly

## 🎓 For Academic Submission

### Demo Preparation
1. Ensure both servers are running
2. Have sample test data ready
3. Prepare different test scenarios:
   - Valid package (passed)
   - High temperature (rejected)
   - Low weight (rejected)
   - Unsealed package (rejected)

### Presentation Setup
1. Open application in browser
2. Have MongoDB Compass open to show database
3. Keep VS Code open with project structure
4. Prepare Postman collection for API demonstration

---

**Need Help?** Check the troubleshooting section or review the code comments for detailed explanations.
