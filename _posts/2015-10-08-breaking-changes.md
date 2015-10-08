---
layout: default
title: Breaking changes in Nevergreen v0.8.0 (Heat Wave)
---

# Notification of breaking changes in Nevergreen v0.8.0 (Heat Wave)

## How does this effect me?

You will have to configure everything again from scratch, no existing configuration will be retained.

[nevergreen.io](http://nevergreen.io) users will be forced to do so the next time they refresh after the release. Users
running their own instance locally can choose when to upgrade, but once they do, they will be forced to reconfigure as
well.

## The problem?

We originally added some complicated code specifically for the [Go](http://www.go.cd/) and [Snap](https://snap-ci.com/) 
servers that combined entries from the cctray xml file to try and make the final output the same as other CI servers. 
This code was extracted into the [clj-cctray](https://github.com/build-canaries/clj-cctray) library when it was created.

As part of [issue #92](https://github.com/build-canaries/nevergreen/issues/92) we needed to change this code to make
stages for these servers independently selectable. Since this now required changing the clj-cctray library we quickly 
realised we had extracted a specific Nevergreen concern into a library that was meant to be generic.

We thought about moving this code to the Nevergreen API, but realised we could potentially have the same problem if
others wanted to use the API to create their own UIs. So we chose to push combining the returned entries to the
Nevergreen UI as that was the layer that was actually opinionated about how to display them.

This now meant the UI domain no longer matched the API domain so we needed to transform the data once it was fetched into
something the UI could display. Doing this with the current UI architecture proved to be very difficult, so we needed to
redesign our architecture to make it easier.

## Our solution?

We rewrote the UI to use the [flux](https://facebook.github.io/flux/) architecture pattern and switched to using
[localForage](https://github.com/mozilla/localForage) for persisting configuration.

The data being saved is very similar to v0.7.0 so we could have added migration code, but at this time we still
feel adding migrations will complicate future releases too much.