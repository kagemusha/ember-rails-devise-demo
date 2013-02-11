App.Router.map ->
  @route "home"

App.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'home'
