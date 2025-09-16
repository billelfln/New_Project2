# API Testing Examples

This file contains example requests you can use to test the MyAPI endpoints.

## Setup

1. Start the Laravel development server:
```bash
php artisan serve
```

2. The API will be available at: `http://localhost:8000/api`

## Authentication Examples

### 1. Register a new user
```bash
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "password_confirmation": "password123"
  }'
```

Expected Response (201):
```json
{
  "success": true,
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2024-01-01T12:00:00.000000Z",
      "updated_at": "2024-01-01T12:00:00.000000Z"
    },
    "token": "1|abc123def456..."
  },
  "message": "User registered successfully"
}
```

### 2. Login existing user
```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

Expected Response (200):
```json
{
  "success": true,
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com"
    },
    "token": "2|xyz789uvw456..."
  },
  "message": "Login successful"
}
```

### 3. Logout user
```bash
curl -X POST http://localhost:8000/api/logout \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

Expected Response (200):
```json
{
  "success": true,
  "message": "Logout successful"
}
```

## Products API Examples

### 1. Create a product
```bash
curl -X POST http://localhost:8000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "MacBook Pro",
    "description": "Apple MacBook Pro 16-inch with M2 chip",
    "price": 2499.99
  }'
```

Expected Response (201):
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "MacBook Pro",
    "description": "Apple MacBook Pro 16-inch with M2 chip",
    "price": "2499.99",
    "created_at": "2024-01-01T12:00:00.000000Z",
    "updated_at": "2024-01-01T12:00:00.000000Z"
  },
  "message": "Product created successfully"
}
```

### 2. Get all products
```bash
curl -X GET http://localhost:8000/api/products
```

Expected Response (200):
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "MacBook Pro",
      "description": "Apple MacBook Pro 16-inch with M2 chip",
      "price": "2499.99",
      "created_at": "2024-01-01T12:00:00.000000Z",
      "updated_at": "2024-01-01T12:00:00.000000Z"
    }
  ],
  "message": "Products retrieved successfully"
}
```

### 3. Get single product
```bash
curl -X GET http://localhost:8000/api/products/1
```

Expected Response (200):
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "MacBook Pro",
    "description": "Apple MacBook Pro 16-inch with M2 chip",
    "price": "2499.99",
    "created_at": "2024-01-01T12:00:00.000000Z",
    "updated_at": "2024-01-01T12:00:00.000000Z"
  },
  "message": "Product retrieved successfully"
}
```

### 4. Update product
```bash
curl -X PUT http://localhost:8000/api/products/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "MacBook Pro M3",
    "description": "Apple MacBook Pro 16-inch with M3 chip - Updated",
    "price": 2699.99
  }'
```

Expected Response (200):
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "MacBook Pro M3",
    "description": "Apple MacBook Pro 16-inch with M3 chip - Updated",
    "price": "2699.99",
    "created_at": "2024-01-01T12:00:00.000000Z",
    "updated_at": "2024-01-01T12:00:01.000000Z"
  },
  "message": "Product updated successfully"
}
```

### 5. Partial update product
```bash
curl -X PUT http://localhost:8000/api/products/1 \
  -H "Content-Type: application/json" \
  -d '{
    "price": 2599.99
  }'
```

### 6. Delete product
```bash
curl -X DELETE http://localhost:8000/api/products/1
```

Expected Response (204):
```json
{
  "success": true,
  "message": "Product deleted successfully"
}
```

## Error Examples

### Validation Error (422)
```bash
curl -X POST http://localhost:8000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "",
    "price": -10
  }'
```

Expected Response (422):
```json
{
  "success": false,
  "message": "Validation failed",
  "errors": {
    "name": ["The name field is required."],
    "description": ["The description field is required."],
    "price": ["The price field must be at least 0."]
  }
}
```

### Product Not Found (404)
```bash
curl -X GET http://localhost:8000/api/products/999
```

Expected Response (404):
```json
{
  "success": false,
  "message": "Product not found"
}
```

## Using with Protected Routes

If you enable authentication protection in `routes/api.php`, include the Authorization header:

```bash
curl -X GET http://localhost:8000/api/products \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

Replace `YOUR_TOKEN_HERE` with the token received from login/register.

## Postman Collection

You can import these examples into Postman by creating a new collection and adding requests with:

Base URL: `http://localhost:8000/api`

Headers for authenticated requests:
- `Authorization: Bearer {{token}}`
- `Content-Type: application/json`

Use Postman variables:
- `{{baseUrl}}` = `http://localhost:8000/api`
- `{{token}}` = Your API token