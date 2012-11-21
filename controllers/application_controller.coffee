# This 'controller' will handle the server requests for the Application resource

# Get a list of the application
app.get '/api/applications', (req, res) ->
    Application.find {}, (err, @applications) =>
        if err?
            res.json(err, 500)
        else
            res.json @applications

# Create a new application:
app.post '/api/applications', (req, res) ->
    @application = new Application(req.param('application'))
    res.json @application
###
    @application.save (err) =>
        if err?
            res.json(err, 500)
        else
            res.json @application
###
     
# Get a specific application:
app.get '/api/applications/:id', (req, res) ->
    res.json {}

# Update a specific application:
app.put "/api/applications/:id", (req, res) ->
    res.json {}

# Destroy a specific application:
app.delete '/api/applications/:id', (req, res) ->
    res.json {}