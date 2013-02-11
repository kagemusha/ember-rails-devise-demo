App.Router.map ->
  @route "home"
  @resource "login"
  @resource "registration"

App.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'home'
