# Set up a routing for our homepage: 
app.get '/', (req, res) ->
    res.render 'index', title:'log in'
    
# handling post requests
app.post '/login', (req, res) ->
    # user object which is sent from login form
    user = req.body.user

    ###
    Usually you will check the login data accessing a database or similiar
    For the sake of this demo it just uses hardcoded values here
    ###
    if user.name is 'foo' and user.password is 'bar'
        req.session.uid = user.name
        res.render 'loggedin', title: "Logged in as #{user.name}", user: user
    else
        res.render 'index', title:'Error', error:true

app.post '/logout', (req, res) ->
    console.log req.session.uid
    req.session = null;
    res.render 'index', title:'logged out', loggedOut:true