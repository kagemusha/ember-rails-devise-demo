Ember Rails Devise Demo
=======================

This app is working example of using Ember with Rails and Devise.  As Ember matures, I hope to expand it with other common Ember
paradigms.

**Disclaimer:** Ember.js is still very new and in flux, I am far from an expert, and documentation, though improving, is still not comprehensive.  While I intend to update and expand this demo with best practices as they become known to me, at present the code here should be viewed more as possible ways to get things done.  Welcome input on improvements.


Features
--------
* User Login and Registration using Devise
* Illustrates basic usages of Ember components like routes, controllers, views, templates, state managers.

Ember Version
-------------
This app runs currently runs on [Ember.js 1.0 RC1](http://emberjs.com/blog/2013/02/15/ember-1-0-rc/)

Getting Started
---------------

To run the app:

    (clone or fork the project)
    $ bundle install
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed    (will create a test user, or just register a new one from the app)
    $ rails server

Basic Architecture
------------------

In traditional Rails apps, pretty much every user click sends an HTTP request.  The server
processes the request, and formats and sends an HTML page as a response.  This will happen
even for something the client should be able to handle, such as sorting a list on the page.

To improve responsiveness, Web 2.0 moves responsibility to the client using Javascript
libraries such as JQuery.  As clients have gotten more complex, the need has arisen for more
 comprehensive frameworks/libraries such as Ember.

In the Ember/Rails world, Ember handles client interactions and page display.  Rails may serve
the initial page, as done here (also can be done by an HTTP server like nginx). Then it waits for
AJAX requests and responds with JSON.

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

The Devise AJAX calls are in **javascripts/helpers/authentication_helper.js.coffee**

Tests
-----

###Capybara Tests###

There are a couple of capybara-webkit tests up.  The first tests a registration-logout-login cycle.  Was
going to separate these out, but the standalone login test doesn't work for some reason (even though works in development).
Appreciate if anyone can figure this out.

###Konacha Tests###

[Konacha](https://github.com/jfirebaugh/konacha) is a Rails engine that allows you to test your JavaScript with the Mocha test framework and chai assertion library.

The tests here are for reference to show how to set up Konacha and far from comprehensive.

Setup is easy.  Just:

1. Add the gem to your gemfile (and run bundle install)
2. Write some tests
3. Run the task: **bundle exec rake konacha:serve**.  This will startup up a server running, by default" on port 3500.
4. Go to localhost:3500 to see test results

See the github page for detailed info.

To Do
-----

Most immediately, **validations** and **tests** are sparse.  Plan to add features as time goes by.

Other Ember.js/Rails Resources
------------------------------

### Demos and Learning Resources

The official guides:

* http://emberjs.com/guides/

Peepcode

* [Ember.js Peepcode (Jan 2013)](https://peepcode.com/products/emberjs)

  Definitely worthwhile, though found it easier to watch it at 2X speed as recitation a tad slow
  
I found both of the following demos helpful (and new ones appearing all the time):

* [ember_data_examle](https://github.com/dgeb/ember_data_example)
* [ember_todo](https://github.com/Skalar/ember_todo)

### Add-ons

  Think HTML/Handlebars too verbose?  Alex Matchneer is developing a [Slim](http://slim-lang.com/)-like templating solution:

* [emblem.js](https://github.com/machty/emblem.js)



###License
Copyright 2013 Michael Madrid under the [MIT License](http://opensource.org/licenses/MIT)
