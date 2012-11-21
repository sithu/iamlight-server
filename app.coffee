require("coffee-script")
# Setup Express.js:
global.express = require 'express'
eco = require 'eco'
http = require 'http'
path = require 'path'

# Creating server
global.app = app = express.createServer()

# server configuration
app.configure ->
    app.set 'views', "#{__dirname}/views"
    app.set 'view engine', 'eco'
  
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session(secret: 'd19e19fd62f62a216ecf7d7b1de434ad')
    app.use app.router
    app.use express.static(path.join(__dirname, 'public'))
    app.use express.errorHandler(dumpExceptions: true, showStack: true)

# Set up the Database: 
require("#{__dirname}/models/database")
require("#{__dirname}/models/application")

# Set up routing to all controllers:
require("#{__dirname}/controllers/home_controller")
require("#{__dirname}/controllers/application_controller")

# run server
port = process.env.PORT or 3000
app.listen port
console.log "Server is starting on port %d in %s mode…", port, app.settings.env
