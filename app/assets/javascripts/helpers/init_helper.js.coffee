App.initApp = (currentUser) ->
  App.__container__.lookup('controller:auth').set 'currentUser', currentUser



