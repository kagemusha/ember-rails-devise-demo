## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.Router.map ->
  @route "home"
  @route "help"
  @route "login"
  @route "registration"


App.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'home'


App.LoginRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  setupController: (controller, model) ->
    controller.set "errorMsg", ""
  events:
    cancel: ->
      log.info "cancelling login"
      @transitionTo 'home'
    login: ->
      log.info "Logging in..."
      App.login this

App.RegistrationRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  events:
    register: ->
      log.info "Registering..."
      App.register this
    cancel: ->
      log.info "cancelling registration"
      @transitionTo 'home'
