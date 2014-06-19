# lineman-lib-template

//[![Build Status](https://travis-ci.org/linemanjs/lineman-lib-template.png?branch=master)](https://travis-ci.org/linemanjs/lineman-lib-template)

Thanks to [Lineman](http://linemanjs.org) and the [lineman-lib-template](https://github.com/linemanjs/lineman-lib-template)

This project is to provide script files to use with the [Roll20](http://roll20.net/) [API](https://wiki.roll20.net/API:Introduction).

I learned my programming skills and habits from the Ruby community, so I bring that mindset to my programming and
organizational habits.  Please don't let it put you off.  Please contribute pull requests, I'll be ecstatic to add contributers.

## So What's it do?

I'm interested in writing code to support my specifc needs with a Star Wars Edege of the Empire campaign.  But at
the same time from the very first integration I tried (the great EotE dice roller) that the order of scripts running in
the sandbox matters, and there is currently no way to reorder things.
# provide the build environment to take many scripts and combine them into one.
# build a utility library of functions that will help me (and others?) write other code easier.
# refactor the die roller into a more data friendly model.
# provide an initiative system for SW:Eote.
# provide a force pool system for SW:Eote
# provide a cargo bay inventory system and ships account system for chat
# provide an astrogation droid who can plot routes

### That all?

After that I'm going to be much more interested in dealing with generators, data stores, and things that allow me to
generate a name nd with simple chat commands add a entry for him somewhere that can be tracked.  I also have a huge ADD
issue and so I may wander off course a bit.  All the more reasons for people to help out!

NPC Generator/Loggers?

I'll stop now.

## Areas that need clarifying,

Quite a lot to start.
*  How do the various settings in package.json like dependencies and scripts, main work?

## notes

It's worth mentioning that lineman-lib-template will, by default, *not include* any JavaScript files you place in
`vendor/js` in the distribution. However, some libraries may desire this behavior and it can be set with a flag at the
 top of `config/application.coffee`, just change `false` to `true`:

``` coffee
includeVendorInDistribution = true
```

## publishing your lib to npm for use with Node.js

This template also provides an easy example of publishing your lib on Node if that's
appropriate. Instead of pointing at the built distribution, consider exporting your
goods from `main.js`. Take a look at the project as a silly little example (note
that it is dumping the example method, `sumTo` onto global scope).
