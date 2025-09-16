#!/bin/bash

echo "🚀 Setting up MyAPI Laravel Project..."

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "❌ PHP is not installed. Please install PHP 8.2 or higher."
    exit 1
fi

# Check PHP version
php_version=$(php -r "echo PHP_VERSION;")
echo "✅ PHP version: $php_version"

# Check if Composer is installed
if ! command -v composer &> /dev/null; then
    echo "❌ Composer is not installed. Please install Composer first."
    exit 1
fi

echo "✅ Composer is available"

# Install dependencies
echo "📦 Installing Composer dependencies..."
composer install

# Generate application key
echo "🔑 Generating application key..."
php artisan key:generate

# Create database if using SQLite for testing
if [ ! -f "database/database.sqlite" ]; then
    echo "📁 Creating SQLite database for testing..."
    touch database/database.sqlite
fi

# Run migrations
echo "🗄️  Running database migrations..."
php artisan migrate --force

# Clear and cache config
echo "⚡ Optimizing application..."
php artisan config:cache
php artisan route:cache

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Configure your database in .env file"
echo "2. Run: php artisan serve"
echo "3. Visit: http://localhost:8000"
echo "4. Test API endpoints using the examples in api-examples.md"
echo ""
echo "📚 Documentation:"
echo "- README.md - Complete project documentation"
echo "- api-examples.md - API testing examples"
echo ""
echo "🔧 Useful commands:"
echo "- php artisan route:list  # View all routes"
echo "- php artisan serve       # Start development server"
echo "- php artisan migrate     # Run migrations"
echo "- php artisan tinker      # Interactive shell"