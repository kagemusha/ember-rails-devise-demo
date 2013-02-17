## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.NavbarController = Ember.ObjectController.extend
  authStateBinding: Ember.Binding.oneWay 'App.LoginStateManager.currentState'
  authState: null,
  authenticated: (->
    log.log "NavbarController authent"
    @.get("authState") == App.LoginStateManager.authenticated
  ).property("authState")
  #logout event can be captured here, but seems recommended thing is to
  #capture events in routes.  also not obvious how to change pages from controllers
  logout: ->
    log.log "NavbarController handling loguot..."
    me = @
    App.logout -> me.transitionToRoute "home"


App.WelcomeMsgController = Ember.ObjectController.extend
  authStateBinding: Ember.Binding.oneWay 'App.LoginStateManager.currentState'
  authState: null,
  user: (->
    if @.get("authState") == App.LoginStateManager.authenticated
      App.currentUser
    else
      null
  ).property("authState")




