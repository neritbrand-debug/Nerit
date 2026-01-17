#!/bin/bash

# Create a simple deployment package
mkdir -p dist
cp public/index.html dist/index.html

# Create a .htaccess for Apache servers (if needed)
cat > dist/.htaccess << 'HTACCESS'
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>
HTACCESS

echo "Deployment package ready in dist/ directory"
