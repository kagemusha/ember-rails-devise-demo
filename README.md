Deprecation Warning
-------------------

This project has fallen out of date and I don't intend to maintain it.  I strongly recomment people move to [ember-cli](http://www.ember-cli.com/)-based architectures as this is the future of ember.  I have a couple of
ember-cli based apps with companion Rails/Devise apps you can look at [crambear] (https://github.com/kagemusha/crambear)/[crambear-api](https://github.com/kagemusha/crambear-api) and [emblog](https://github.com/kagemusha/emblog)/[emblog-server](https://github.com/kagemusha/emblog-server).

Ember Rails Devise Demo
=======================


This app is working example of using Ember with Rails and Devise.

The running app can be viewed at: http://emrailsdevise.herokuapp.com/

For a more full-featured Ember example app using Ember, Rails and Devise, see 
[Crambear, an Ember flashcards app](https://github.com/kagemusha/crambear).

Features
--------
* User Login and Registration using Devise
* Illustrates basic usages of Ember components like routes, controllers, and templates.

Ember Version
-------------
Currently runs on [Ember.js 1.0](http://emberjs.com/blog/2013/08/31/ember-1-0-released.html)

Getting Started
---------------

To run the app:

    (clone or fork the project)
    $ bundle install
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed            #will create a test user, or just register a new one from the app
    $ export ERD_SECRET_KEY_BASE='generate-a-secret-key'   #used in initializers/config/secret_token.rb
    $ rails server

Basic Architecture of an Ember App
----------------------------------

In traditional Rails apps, pretty much every user click results in an HTTP request.  The server
processes the request, and generate an HTML page, which it returns to the client.  This happens
even for tasks the client has the data to handle, such as sorting a list on the page.

To improve responsiveness, Web 2.0 moves responsibility to the client using Javascript and
libraries such as JQuery.  Rails 4 has also moved in this direction with Turbolinks.  But these more 
complex clients no longer can rely on the server framework Rails did so well. Hence the need for 
comprehensive client-side frameworks such as Ember.

In the Ember/Rails world, Ember handles client interactions and page display.  Rails may serve
the initial page, as done here (also can be done by an HTTP server like nginx). Then it waits for
AJAX requests and responds with JSON, often using a gem such as 
[Active Model Serializers](https://github.com/rails-api/active_model_serializers).

Under this architecture, the Rails components which pertain directly with the client are:

1. a bare-bones layout (views/layouts/application.html) which includes the Ember client and css
2. a blank root page (here view/home/index)
3. a root controller (here HomeController)
4. routes defined in routes.rb
5. serializers, here using the active_model_serializer gem for packaging (in the app/serializers directory)

Devise with AJAX
----------------

When using Devise with AJAX you must add:

    respond_to :html, :json

to the appropriate Rails controller(s).  In this app, its been added to ApplicationController.  More [here](http://stackoverflow.com/questions/14319868/ember-js-with-devise-on-rails-application-406-not-acceptable-on-sign-up).

The Devise AJAX calls are in the AuthController in **javascripts/controllers/controllers.js.coffee**

Tests
-----

###Capybara Tests###

There are a couple of capybara-webkit tests up.  The first tests a registration-logout-login cycle.  Was
going to separate these out, but the standalone login test doesn't work for some reason (even though works in development).
Appreciate if anyone can figure this out.

###Konacha Tests###

[Konacha](https://github.com/jfirebaugh/konacha) is a Rails engine that allows you to test your JavaScript with the Mocha test framework and chai assertion library.

The tests here are for reference to show how to set up Konacha and far from comprehensive.

Setup is easy:

1. Add the gem to your gemfile (and run bundle install)
2. Write some tests
3. Run the task: **bundle exec rake konacha:serve**.  This will startup up a server running, by default" on port 3500.
4. Go to localhost:3500 to see test results

See the [Konacha](https://github.com/jfirebaugh/konacha) github page for detailed info.

To Do
-----

Most immediately, **validations** and **tests** are sparse.  Plan to add features as time goes by.

Other Ember.js/Rails Resources
------------------------------

### Demos and Learning Resources

The official guides:

* http://emberjs.com/guides/

The following is useful and fairly up to date (RC6 as of end Aug 2013):

* [ember_data_examle](https://github.com/dgeb/ember_data_example)

### Add-ons

  Think HTML/Handlebars too verbose?  Alex Matchneer is developing a [Slim](http://slim-lang.com/)-like templating solution:

* [emblem.js](https://github.com/machty/emblem.js)



###License
Copyright 2013 Michael Madrid under the [MIT License](http://opensource.org/licenses/MIT)
