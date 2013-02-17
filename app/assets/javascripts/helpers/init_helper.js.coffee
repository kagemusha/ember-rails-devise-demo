App.initApp = (currentUser) ->
  abbreviations()
  initConsts()
  App.initCurrentUser currentUser
  App.initStateManagers()

abbreviations = ->
  window.log = Em.Logger

App.initCurrentUser = (currentUser) ->
  log.info "current user: ", currentUser
  App.currentUser =  currentUser if currentUser?.email

App.initStateManagers = ->
  App.LoginStateManager = Ember.StateManager.create
    initialState: 'notAuthenticated'
    authenticated: Ember.State.create
      enter: -> log.debug "enter " + this.name
      logout: (manager, context) ->
        manager.transitionTo 'notAuthenticated'

    notAuthenticated: Ember.State.create
      enter: ->  log.info "Enter " + this.name
      login: (manager, credentials) ->
        manager.transitionTo 'authenticated'
      register: (manager, credentials) ->
        manager.transitionTo 'authenticated'
  App.LoginStateManager.transitionTo 'authenticated' if App.currentUser

#   throws error: Uncaught Error: assertion failed: Ember.Object.create no longer supports defining computed properties.
#    initialState: (->
#      if (App.currentUser) then 'loggedIn' else 'loggedOut'
#    ).property()

initConsts = ->
  App.urls ||= {}
  App.urls.login = "/users/sign_in.json"
  App.urls.register = "/users.json"
  App.urls.logout = "/users/sign_out.json"

