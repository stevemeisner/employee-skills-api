# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'employee-skills.netlify.app'
    resource '/employees',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: false
  end

  # For development
  allow do
    origins 'localhost:8081', 'localhost:8080'
    resource '/employees',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: false
  end
end
