#if have lots of state managers probably want a separate directory with file for each like other ember objects
App.LoginStateManager = Ember.StateManager.create
  initialState: 'notAuthenticated'
  authenticated: Ember.State.create
    enter: -> log.info "LoginStateManager enter state: " + this.name
    logout: (manager, context) ->
      manager.transitionTo 'notAuthenticated'

  notAuthenticated: Ember.State.create
    enter: ->  log.info "LoginStateManager enter state: " + this.name
    login: (manager, credentials) ->
      manager.transitionTo 'authenticated'
    register: (manager, credentials) ->
      manager.transitionTo 'authenticated'
