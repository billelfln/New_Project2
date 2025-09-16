# MyAPI Deployment Guide

## Project Overview

This is a complete Laravel 12 RESTful API project for managing products with the following features:

### ✅ Completed Features

1. **Laravel 12 Project Structure**
   - Complete Laravel application structure
   - PHP 8.2+ compatible code
   - Proper PSR-4 autoloading setup

2. **Database Design**
   - MySQL support configured
   - Products table with: id, name, description, price, timestamps
   - Users table for authentication
   - Personal access tokens table for API authentication
   - Database migrations ready

3. **API Endpoints**
   - Full CRUD operations for products
   - RESTful API design with proper HTTP methods
   - JSON responses with correct status codes
   - Input validation with detailed error messages

4. **Authentication System**
   - Laravel Sanctum integration
   - User registration and login
   - API token generation and management
   - Optional route protection

5. **Code Organization**
   - Product Model with $fillable attributes
   - ProductController with all CRUD methods
   - Authentication controllers
   - Proper service providers
   - Middleware setup

## Quick Start

### Prerequisites
- PHP >= 8.2
- MySQL database
- Composer

### Installation

1. **Install dependencies:**
```bash
composer install
```

2. **Setup environment:**
```bash
cp .env.example .env  # Edit database credentials
php artisan key:generate
```

3. **Setup database:**
```bash
php artisan migrate
```

4. **Run the application:**
```bash
php artisan serve
```

### Alternative: Use the setup script
```bash
./setup.sh
```

## API Usage

### Base URL
```
http://localhost:8000/api
```

### Authentication Flow

1. **Register:** `POST /api/register`
2. **Login:** `POST /api/login` 
3. **Get token from response**
4. **Use token:** `Authorization: Bearer {token}`
5. **Logout:** `POST /api/logout`

### Products CRUD

- `GET /api/products` - List all products
- `POST /api/products` - Create product  
- `GET /api/products/{id}` - Get single product
- `PUT /api/products/{id}` - Update product
- `DELETE /api/products/{id}` - Delete product

## Route Protection

Routes are public by default for easy testing. To enable authentication:

1. Edit `routes/api.php`
2. Uncomment the protected routes section
3. Comment out the public routes

## Testing

### View Routes
```bash
php artisan route:list
```

### Test with curl
See `api-examples.md` for complete examples.

### Test with Postman
Import the examples from `api-examples.md` into Postman.

## Production Deployment

### Environment Setup
- Set `APP_ENV=production`
- Set `APP_DEBUG=false`
- Configure production database
- Set secure `APP_KEY`

### Optimization
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
composer install --optimize-autoloader --no-dev
```

### Web Server
Configure your web server to point to the `public/` directory.

## File Structure

```
myapi/
├── app/
│   ├── Http/Controllers/
│   │   ├── Auth/
│   │   │   ├── AuthenticatedSessionController.php
│   │   │   └── RegisteredUserController.php
│   │   ├── Controller.php
│   │   └── ProductController.php
│   ├── Models/
│   │   ├── Product.php
│   │   └── User.php
│   └── Providers/
├── config/
│   ├── app.php
│   ├── auth.php
│   ├── database.php
│   └── sanctum.php
├── database/migrations/
├── routes/
│   ├── api.php
│   ├── web.php
│   └── console.php
├── README.md
├── api-examples.md
└── setup.sh
```

## Support & Documentation

- **README.md** - Complete project documentation
- **api-examples.md** - API testing examples with curl commands
- **DEPLOYMENT.md** - This deployment guide

## Next Steps

1. Install dependencies with `composer install`
2. Configure database in `.env`
3. Run migrations
4. Start testing the API endpoints
5. Customize as needed for your use case

The project is ready for development and testing!