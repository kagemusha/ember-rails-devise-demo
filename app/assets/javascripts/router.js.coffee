App.Router.map ->
  @route "home"
  @route "help"
  @resource "login"
  @resource "registration"


App.ApplicationRoute = Ember.Route.extend
# this should work - not sure why isn't
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
