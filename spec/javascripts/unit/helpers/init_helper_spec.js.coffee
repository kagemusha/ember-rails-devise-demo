#= require spec_helper
#= require shortcuts
#= require helpers/init_helper
#= require state_managers

##as with the app files, would generally have separate test files for each controller as
##a large app

describe "init helper methods", ->

  it "initApp() should put app in notAuthenticated state if no user", ->
    App.initApp {}
    App.LoginStateManager.get('currentState.name') == "notAuthenticated"

  it "initApp() should put app in authenticated state if user", ->
    App.initApp {id: 1, email: "test@test.com", name: "Tester"}
    assert.ok App.LoginStateManager
    App.LoginStateManager.get('currentState.name') == "authenticated"
