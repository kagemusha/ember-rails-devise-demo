## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.Router.map ->
  @route "home"
  @route "help"
  @route "login"
  @route "registration"


App.IndexRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @transitionTo 'home'


App.LoginRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  setupController: (controller, model) ->
    controller.set 'content', model
    controller.set "errorMsg", ""
  actions:
    login: ->
      log.info "Logging in..."
      @controllerFor("auth").login this
    cancel: ->
      log.info "cancelling login"
      @transitionTo 'home'

App.RegistrationRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  actions:
    register: ->
      log.info "Registering..."
      @controllerFor("auth").register this
    cancel: ->
      log.info "cancelling registration"
      @transitionTo 'home'
