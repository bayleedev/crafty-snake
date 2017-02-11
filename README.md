Crafty Snake
============

This is my second attempt at an HTML5 game. This time I'm attempting to embrace a few more technologies to make my life easier including:
 * [CoffeeScript](http://coffeescript.org/) Making my js pretty.
 * [LESS](http://lesscss.org/) because.
 * [Grunt](http://gruntjs.com/) for automation of compiling less/coffee.
 * [Mocha](http://mochajs.org/) for unit testing.
 * [Travis](https://travis-ci.org/) for CI
 
I'm currently trying to implement models into Crafty to make data between two components share-able. We'll see how it goes!

## Grunt Tasks
 * `grunt build` - Builds the dev environemtn.
 * `grunt build:dev` - Same as `grunt build`.
 * `grunt build:prod` - Builds for production (combines all files, minifies).
 * `grunt build:watch` - Builds and watches for changes.
 * `grunt build:test` - Builds and runs the mocha tests.
 
## Installing
~~~
git clone git@github.com:blainesch/crafty-snake.git
cd crafty-snake
npm install
npm install -g grunt-cli
grunt build:test
~~~
