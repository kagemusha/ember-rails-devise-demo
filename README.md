Ember Rails Devise Demo
=======================

This app provides working example of using Ember with Rails and Devise.  As Ember matures, I hope to expand it with Ember
paradigms for common web functionality.

Disclaimer: Ember.js is still very much in flux, I am far from an ember expert, and documentation and best practices are still
sparse.  Take everything here with a grain of salt and if you know of a better way of doing thing, by all means contribute.

This app runs currently runs on Ember 1.0.0-pre4

Features
--------
* User Login and Registration using Devise

Other Ember.js/Rails Projects
-----------------------------

I found both of the following helpful:

* [ember_data_examle](https://github.com/dgeb/ember_data_example)
* [ember_todo](https://github.com/Skalar/ember_todo)

Getting Started
---------------

To run the app:

    (clone or fork the project)
    $ bundle install
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed    (will create a test user, or just register a new one from the app)
    $ rails server

###License
Copyright 2013 Michael Madrid under the [MIT License](http://opensource.org/licenses/MIT)
