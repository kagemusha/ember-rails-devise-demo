App.Router.map ->
  @route "home"
  @route "help"
  @resource "login"
  @resource "registration"


App.ApplicationRoute = Ember.Route.extend
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
      log.log "Logging out"
      App.LoginStateManager.transitionTo "notAuthenticated"
      @transitionTo 'home'

App.LoginRoute = Ember.Route.extend
  events:
    cancel: ->
      log.log "cancelling login"
      @transitionTo 'home'
    login: ->
      log.log "Login event"
      App.LoginStateManager.transitionTo "authenticated"
      @transitionTo 'home'
