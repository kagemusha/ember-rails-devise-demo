## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.Router.map ->
  @route "home"
  @route "help"
  @route "login"
  @route "registration"


App.ApplicationRoute = Ember.Route.extend
## this works in other apps i've done - not sure why isn't working here but
## event not getting picked up
#  events:
#    logout: ->
#      log.log "Logging out"
#      App.LoginStateManager.transitionTo "notAuthenticated"
#      @transitionTo 'home'

App.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'home'

App.HomeRoute = Ember.Route.extend
  events:
    logout: ->
      log.log "loggin'out"
      route = this
      $.ajax
        url: App.urls.logout
        type: "DELETE"
        dataType: "json"
        success: ->
          log.log "Logout success"
          App.currentUser = null
          App.LoginStateManager.transitionTo "notAuthenticated"
          route.transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) ->
          if jqXHR.status==204 #this is fine.  logout successful no response returned
            route.transitionTo 'home'
            App.LoginStateManager.transitionTo 'notAuthenticated'
            return
          alert "Error logging out: #{errorThrown}"

App.LoginRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  setupController: (controller, model) ->
    controller.set "errorMsg", ""
  events:
    cancel: ->
      log.log "cancelling login"
      @transitionTo 'home'
    login: ->
      route = @
      $.ajax
        url: App.urls.login
        type: "POST"
        data:
        #user: @currentModel.getJSON #would be nice if could do something like this
          "user[email]": @currentModel.email
          "user[password]": @currentModel.password
        success: (data) ->
          App.currentUser =  data.user
          App.LoginStateManager.transitionTo "authenticated"
          route.transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) ->
          if jqXHR.status==401
            route.controllerFor('login').set "errorMsg", "That email/password combo didn't work.  Please try again"

App.RegistrationRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  events:
    register: ->
      #password = @currentModel.getProperties("password")
      route = @
      $.ajax
        url: App.urls.register
        type: "POST"
        data:
          #would be nice if could do something like this
            #user: @currentModel.getJSON
          "user[name]": @currentModel.name
          "user[email]": @currentModel.email
          "user[password]": @currentModel.password
          "user[password_confirmation]": @currentModel.password_confirmation
        success: (data) ->
          App.currentUser =  data.user
          App.LoginStateManager.transitionTo "authenticated"
          route.transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) ->
          route.controllerFor('login').set "errorMsg", "That email/password combo didn't work.  Please try again"
    cancel: ->
      log.log "cancelling registration"
      @transitionTo 'home'
