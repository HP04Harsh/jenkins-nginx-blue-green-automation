# Step 1: Use the official NGINX image as the base
FROM nginx:latest

# Step 2: Remove the default NGINX index page
RUN rm /usr/share/nginx/html/index.html

# Step 3: Copy your custom index.html into the container
# This allows the same Dockerfile to work for both Blue and Green 
# depending on which index.html is present during the build.
COPY index.html /usr/share/nginx/html/index.html

# Step 4: Expose port 80 inside the container
EXPOSE 80
