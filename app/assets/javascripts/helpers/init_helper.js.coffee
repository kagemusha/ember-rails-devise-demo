App.initApp = (currentUser) ->
  App.initCurrentUser currentUser
  App.LoginStateManager.transitionTo 'authenticated' if App.currentUser


App.initCurrentUser = (currentUser) ->
  log.info "current user: ", currentUser
  App.currentUser =  currentUser if currentUser?.email


