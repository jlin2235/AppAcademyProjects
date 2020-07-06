require 'rack'
Rack::Server.start(
  app: app,
  Port: 3000
)