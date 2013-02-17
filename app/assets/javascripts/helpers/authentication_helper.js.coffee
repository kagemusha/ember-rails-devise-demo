App.login = (route) ->
  $.ajax
    url: App.urls.login
    type: "POST"
    data:
       #would be nice if could do something like: user: route.currentModel.getJSON
      "user[email]": route.currentModel.email
      "user[password]": route.currentModel.password
    success: (data) ->
      App.currentUser =  data.user
      App.LoginStateManager.transitionTo "authenticated"
      route.transitionTo 'home'
    error: (jqXHR, textStatus, errorThrown) ->
      if jqXHR.status==401
        route.controllerFor('login').set "errorMsg", "That email/password combo didn't work.  Please try again"

App.register = (route) ->
  $.ajax
    url: App.urls.register
    type: "POST"
    data:
    #would be nice if could do something like this
    #user: @currentModel.getJSON
      "user[name]": route.currentModel.name
      "user[email]": route.currentModel.email
      "user[password]": route.currentModel.password
      "user[password_confirmation]": route.currentModel.password_confirmation
    success: (data) ->
      App.currentUser =  data.user
      App.LoginStateManager.transitionTo "authenticated"
      route.transitionTo 'home'
    error: (jqXHR, textStatus, errorThrown) ->
      route.controllerFor('login').set "errorMsg", "That email/password combo didn't work.  Please try again"



App.logout = (transitionRoute) ->
  log.log "Logging out..."
  $.ajax
    url: App.urls.logout
    type: "DELETE"
    dataType: "json"
    success: ->
      #Devise logout sends a 204, which JQuery interprests as error so handle there
    error: (jqXHR, textStatus, errorThrown) ->
      if jqXHR.status==204 #this is fine.  logout successful no response returned
        log.log "Logged out"
        App.currentUser = null
        transitionRoute()
        App.LoginStateManager.transitionTo 'notAuthenticated'
        return
      alert "Error logging out: #{errorThrown}"

