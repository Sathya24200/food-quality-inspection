# Installation & Deployment Checklist

## 📋 Pre-Installation Checklist

### System Requirements
- [ ] Windows 10/11, macOS 10.15+, or Linux (Ubuntu 20.04+)
- [ ] 4GB RAM minimum (8GB recommended)
- [ ] 2GB free disk space
- [ ] Internet connection for package installation

### Software Prerequisites
- [ ] Node.js 16.x or higher installed
- [ ] npm 8.x or higher installed
- [ ] MongoDB 5.x or higher installed
- [ ] Modern web browser (Chrome 90+, Firefox 88+, Safari 14+, Edge 90+)
- [ ] Git (optional, for version control)

### Verification Commands
```bash
node --version    # Should show v16.x.x or higher
npm --version     # Should show 8.x.x or higher
mongod --version  # Should show 5.x.x or higher
```

---

## 🔧 Installation Checklist

### Backend Setup
- [ ] Navigate to `backend/` directory
- [ ] Run `npm install`
- [ ] Verify `.env` file exists
- [ ] Check MongoDB connection string in `.env`
- [ ] Verify all dependencies installed without errors
- [ ] Test server start: `npm start`
- [ ] Verify server running on port 5000
- [ ] Test API root: http://localhost:5000 (should return JSON)

### Frontend Setup
- [ ] Navigate to `frontend/` directory
- [ ] Run `npm install`
- [ ] Verify `vite.config.js` exists
- [ ] Check proxy configuration points to backend
- [ ] Verify all dependencies installed without errors
- [ ] Test dev server: `npm run dev`
- [ ] Verify frontend running on port 3000
- [ ] Open http://localhost:3000 in browser

### Database Setup
- [ ] MongoDB service is running
- [ ] Can connect to MongoDB on port 27017
- [ ] Database `food_quality_inspection` created automatically
- [ ] Collections created on first use
- [ ] MongoDB Compass connected (optional)

---

## ✅ Functionality Testing Checklist

### Authentication Flow
- [ ] Can access registration page
- [ ] Can register new user with valid data
- [ ] Registration validates email format
- [ ] Registration requires minimum 6-character password
- [ ] Registration prevents duplicate emails
- [ ] Successful registration redirects to dashboard
- [ ] Can logout successfully
- [ ] Can login with registered credentials
- [ ] Invalid credentials show error message
- [ ] JWT token stored in localStorage
- [ ] Protected routes redirect to login when not authenticated

### Camera Functionality
- [ ] "Start Camera" button visible
- [ ] Browser requests camera permission
- [ ] Camera feed displays in video element
- [ ] "Capture Image" button appears when camera active
- [ ] Image captured successfully
- [ ] Captured image displays in preview
- [ ] "Retake" button allows new capture
- [ ] Camera stops when image captured

### Sensor Data
- [ ] "Generate Sensor Data" button works
- [ ] Temperature field populated with random value
- [ ] Weight field populated with random value
- [ ] Seal status randomly set
- [ ] Can manually edit sensor values
- [ ] Values persist until form submission

### Inspection Submission
- [ ] Cannot submit without captured image
- [ ] Cannot submit without sensor data
- [ ] Submission shows loading state
- [ ] Success message appears on successful submission
- [ ] Form resets after submission
- [ ] Statistics update immediately
- [ ] New inspection appears in history

### Quality Decision Logic
- [ ] Valid package (all params in range) → PASSED
- [ ] High temperature (>25°C) → REJECTED
- [ ] Low temperature (<0°C) → REJECTED
- [ ] High weight (>1000g) → REJECTED
- [ ] Low weight (<100g) → REJECTED
- [ ] Unsealed package → REJECTED
- [ ] Multiple failures → REJECTED with all reasons
- [ ] Correct reason displayed for each rejection

### Dashboard Statistics
- [ ] Total packages counter accurate
- [ ] Passed packages counter accurate
- [ ] Rejected packages counter accurate
- [ ] Sealed packages counter accurate
- [ ] Unsealed packages counter accurate
- [ ] Statistics update in real-time
- [ ] Statistics persist after page refresh

### Inspection History
- [ ] History displays all inspections
- [ ] Newest inspections appear first
- [ ] Package ID displayed correctly
- [ ] Status badge shows correct color (green/red)
- [ ] Temperature, weight, seal status visible
- [ ] Reason for decision displayed
- [ ] Timestamp formatted correctly
- [ ] History scrollable if many records
- [ ] History persists after logout/login

### UI/UX
- [ ] Dark theme applied throughout
- [ ] Gradient colors display correctly
- [ ] Animations smooth and performant
- [ ] Responsive on desktop (1920x1080)
- [ ] Responsive on laptop (1366x768)
- [ ] Responsive on tablet (768x1024)
- [ ] Responsive on mobile (375x667)
- [ ] No layout breaks at any screen size
- [ ] Icons display correctly
- [ ] Buttons have hover effects
- [ ] Cards have hover animations

### Error Handling
- [ ] Network errors display user-friendly messages
- [ ] Invalid form data shows validation errors
- [ ] API errors caught and displayed
- [ ] Camera access denial handled gracefully
- [ ] Database connection errors handled
- [ ] Token expiration redirects to login

---

## 🚀 Production Deployment Checklist

### Security
- [ ] JWT_SECRET changed to secure random string
- [ ] .env file not committed to Git
- [ ] .gitignore includes node_modules and .env
- [ ] CORS configured for production domain
- [ ] HTTPS enabled (required for camera)
- [ ] Environment variables set on hosting platform
- [ ] Database credentials secured

### Backend Deployment
- [ ] Backend code deployed to hosting service
- [ ] Environment variables configured
- [ ] MongoDB Atlas connection string updated
- [ ] Process manager (PM2) configured
- [ ] Health check endpoint working
- [ ] API accessible from frontend domain
- [ ] Logs configured and accessible

### Frontend Deployment
- [ ] Production build created: `npm run build`
- [ ] Build completes without errors
- [ ] Static files deployed to hosting service
- [ ] API proxy configured correctly
- [ ] Environment variables set (if any)
- [ ] Domain/subdomain configured
- [ ] SSL certificate active
- [ ] CDN configured (optional)

### Database
- [ ] MongoDB Atlas cluster created
- [ ] Database user created with appropriate permissions
- [ ] IP whitelist configured
- [ ] Connection string updated in backend .env
- [ ] Database accessible from backend server
- [ ] Backups configured
- [ ] Monitoring enabled

### Testing in Production
- [ ] Can access production URL
- [ ] HTTPS working (green padlock)
- [ ] Can register new account
- [ ] Can login successfully
- [ ] Camera access works (HTTPS required)
- [ ] Can submit inspections
- [ ] Data persists in cloud database
- [ ] Statistics accurate
- [ ] History displays correctly
- [ ] No console errors
- [ ] Performance acceptable (< 3s load time)

---

## 📊 Performance Checklist

### Frontend Performance
- [ ] Initial page load < 3 seconds
- [ ] Time to interactive < 5 seconds
- [ ] No layout shifts during load
- [ ] Images optimized
- [ ] Code splitting implemented (Vite default)
- [ ] No memory leaks in React components
- [ ] Smooth animations (60fps)

### Backend Performance
- [ ] API response time < 500ms
- [ ] Database queries optimized
- [ ] Indexes created on frequently queried fields
- [ ] No N+1 query problems
- [ ] Connection pooling configured
- [ ] Compression enabled

### Database Performance
- [ ] Indexes on userId and timestamp
- [ ] Query execution time < 100ms
- [ ] No full collection scans
- [ ] Appropriate data types used
- [ ] No unnecessary data in responses

---

## 📚 Documentation Checklist

### Code Documentation
- [ ] README.md in root directory
- [ ] QUICKSTART.md for rapid setup
- [ ] DEPLOYMENT.md for deployment guide
- [ ] API_DOCUMENTATION.md for API reference
- [ ] VIVA_GUIDE.md for academic preparation
- [ ] PROJECT_SUMMARY.md for overview
- [ ] Code comments in complex sections
- [ ] Function/component documentation

### Academic Submission
- [ ] Project report written
- [ ] System flowchart created
- [ ] Screenshots captured
- [ ] Demo video recorded (optional)
- [ ] Presentation slides prepared
- [ ] Viva questions prepared
- [ ] Source code organized
- [ ] All deliverables compiled

---

## 🎓 Academic Presentation Checklist

### Preparation
- [ ] Understand all technologies used
- [ ] Can explain quality decision logic
- [ ] Know database schema
- [ ] Understand authentication flow
- [ ] Familiar with API endpoints
- [ ] Can explain security measures
- [ ] Prepared for common questions
- [ ] Demo scenarios planned

### Demo Setup
- [ ] Both servers running
- [ ] Database populated with sample data
- [ ] Browser ready with application open
- [ ] MongoDB Compass open (optional)
- [ ] Postman ready for API demo (optional)
- [ ] VS Code open with project
- [ ] Backup plan if live demo fails

### Presentation Materials
- [ ] PowerPoint/slides prepared
- [ ] System flowchart included
- [ ] Architecture diagram ready
- [ ] Screenshots of key features
- [ ] Code snippets highlighted
- [ ] Demo script prepared
- [ ] Q&A answers ready

---

## 🐛 Troubleshooting Checklist

### Common Issues
- [ ] MongoDB not starting → Check service status
- [ ] Port already in use → Kill process or change port
- [ ] Camera not working → Check HTTPS and permissions
- [ ] CORS errors → Verify backend CORS config
- [ ] Authentication failing → Check JWT secret matches
- [ ] Database connection failing → Verify MongoDB running
- [ ] npm install errors → Clear cache and retry
- [ ] Build errors → Check Node version compatibility

### Debug Tools
- [ ] Browser DevTools console for frontend errors
- [ ] Network tab for API request/response
- [ ] Backend console for server logs
- [ ] MongoDB Compass for database inspection
- [ ] Postman for API testing
- [ ] React DevTools for component inspection

---

## ✨ Final Verification

### Before Submission
- [ ] All features working as expected
- [ ] No console errors or warnings
- [ ] Code formatted and clean
- [ ] All documentation complete
- [ ] Screenshots and diagrams ready
- [ ] Demo rehearsed successfully
- [ ] Backup of entire project created
- [ ] Git repository up to date (if using)

### Quality Assurance
- [ ] Code follows best practices
- [ ] No hardcoded credentials
- [ ] Error handling implemented
- [ ] User feedback for all actions
- [ ] Loading states for async operations
- [ ] Responsive design verified
- [ ] Cross-browser testing done
- [ ] Security measures in place

---

## 🎯 Success Criteria

Your project is ready when:
- ✅ All features work without errors
- ✅ Documentation is complete and clear
- ✅ Demo runs smoothly
- ✅ You can explain all technical decisions
- ✅ Code is clean and well-organized
- ✅ Security best practices followed
- ✅ Performance is acceptable
- ✅ Ready for academic presentation

---

**Congratulations! Your Smart Packaged Food Quality Inspection System is complete and ready for submission!** 🎉
