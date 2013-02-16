Ember Rails Devise Demo
=======================

This app is working example of using Ember with Rails and Devise.  As Ember matures, I hope to expand it with other common Ember
paradigms.

**Disclaimer:** Ember.js is still very new and in flux, I am far from an expert, and documentation, though improving, is still not comprehensive.  While I intend to update and expand this demo with best practices as it becomes known to me, at present the code here should be viewed more as possible ways to get things done.

This app runs currently runs on Ember 1.0.0-pre4

Features
--------
* User Login and Registration using Devise
* Illustrates basic usages of Ember components like routes, controllers, views, templates, state managers.

Other Ember.js/Rails Projects
-----------------------------

### Demos and Learning Resources

I found both of the following helpful:
* [Ember.js Peepcode (Jan 2013)](https://peepcode.com/products/emberjs)
  >Worthwhile, though found it easier to follow it at 2X speed as recitation a tad slow :-)
* [ember_data_examle](https://github.com/dgeb/ember_data_example)
* [ember_todo](https://github.com/Skalar/ember_todo)

### Add-ons

Think HTML/Handlebars is a tad verbose?  Alex Matchneer is developing a [Slim](http://slim-lang.com/)-like templating solution:
* [emblem.js](https://github.com/machty/emblem.js)


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
