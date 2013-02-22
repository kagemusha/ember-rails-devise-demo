#= require spec_helper
#= require router

describe "App.Router", ->
  it "is an Ember.Router", ->
    assert.ok App.Router
    assert.ok Ember.Router.detect(App.Router)
