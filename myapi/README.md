# MyAPI - Laravel 12 RESTful API

A complete RESTful API built with Laravel 12 for managing products.

## Features

- Full CRUD operations for products
- API authentication with Laravel Sanctum
- MySQL database support
- JSON responses with proper HTTP status codes
- Input validation
- API token management

## Requirements

- PHP >= 8.2
- MySQL
- Composer

## Installation

1. Install dependencies (you'll need to run this when Composer is available):
```bash
composer install
```

2. Configure your database in `.env` file:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=myapi_db
DB_USERNAME=root
DB_PASSWORD=
```

3. Generate application key:
```bash
php artisan key:generate
```

4. Run database migrations:
```bash
php artisan migrate
```

5. Start the development server:
```bash
php artisan serve
```

## API Endpoints

### Authentication

#### Register User
```http
POST /api/register
Content-Type: application/json

{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "password_confirmation": "password123"
}
```

#### Login User
```http
POST /api/login
Content-Type: application/json

{
    "email": "john@example.com",
    "password": "password123"
}
```

#### Logout User
```http
POST /api/logout
Authorization: Bearer YOUR_TOKEN_HERE
```

### Products API

#### Get All Products
```http
GET /api/products
```

#### Get Single Product
```http
GET /api/products/{id}
```

#### Create Product
```http
POST /api/products
Content-Type: application/json

{
    "name": "Laptop",
    "description": "High-performance laptop for developers",
    "price": 999.99
}
```

#### Update Product
```http
PUT /api/products/{id}
Content-Type: application/json

{
    "name": "Gaming Laptop",
    "description": "Updated description",
    "price": 1299.99
}
```

#### Delete Product
```http
DELETE /api/products/{id}
```

## Authentication Protection

To enable authentication protection for products API, edit `routes/api.php` and uncomment the protected routes section:

```php
// Uncomment this block to protect routes with authentication
Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('products', ProductController::class);
});
```

Then comment out the public routes:
```php
// Comment out this line when using protected routes
// Route::apiResource('products', ProductController::class);
```

## Testing with curl

### Register a new user:
```bash
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "email": "test@example.com",
    "password": "password123",
    "password_confirmation": "password123"
  }'
```

### Login and get token:
```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'
```

### Create a product:
```bash
curl -X POST http://localhost:8000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Product",
    "description": "A sample product for testing",
    "price": 29.99
  }'
```

### Get all products:
```bash
curl -X GET http://localhost:8000/api/products
```

### Update a product:
```bash
curl -X PUT http://localhost:8000/api/products/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Updated Product",
    "price": 39.99
  }'
```

### Delete a product:
```bash
curl -X DELETE http://localhost:8000/api/products/1
```

### Using authentication (when protected routes are enabled):
```bash
# Add this header to authenticated requests:
# -H "Authorization: Bearer YOUR_TOKEN_HERE"

curl -X GET http://localhost:8000/api/products \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

## Route List

To see all available routes, run:
```bash
php artisan route:list
```

## Response Format

All API responses follow this format:

### Success Response:
```json
{
    "success": true,
    "data": { ... },
    "message": "Operation successful"
}
```

### Error Response:
```json
{
    "success": false,
    "message": "Error description",
    "errors": { ... }
}
```

## HTTP Status Codes

- `200` - OK (successful GET, PUT)
- `201` - Created (successful POST)
- `204` - No Content (successful DELETE)
- `404` - Not Found
- `422` - Validation Error
- `401` - Unauthorized