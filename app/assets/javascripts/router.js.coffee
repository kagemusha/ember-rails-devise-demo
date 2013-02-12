## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.Router.map ->
  @route "home"
  @route "help"
  @route "login"
  @route "registration"


App.ApplicationRoute = Ember.Route.extend
#  events:
#    logout: ->
#      log.log "Logging out"
#      App.LoginStateManager.transitionTo "notAuthenticated"
#      @transitionTo 'home'
    ## logout event not getting picked up here for some reason
    ## this works in another app i've done - not sure why isn't working here but
    ## leads to needless duplication below

App.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'home'

App.HomeRoute = Ember.Route.extend
  events:
    logout: -> App.logout this

App.HelpRoute = Ember.Route.extend
  events:
    logout: -> App.logout this


App.LoginRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  setupController: (controller, model) ->
    controller.set "errorMsg", ""
  events:
    cancel: ->
      log.log "cancelling login"
      @transitionTo 'home'
    login: ->
      log.log "Logging in..."
      App.login this

App.RegistrationRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  events:
    register: ->
      log.log "Registering..."
      App.register this
    cancel: ->
      log.log "cancelling registration"
      @transitionTo 'home'
