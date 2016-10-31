---
layout: default
title: Breaking changes in Nevergreen v0.11.0 (Kobi)
---

# Notification of breaking changes in Nevergreen v0.11.0 (Kobi)

## How does this effect me?

You will have to select projects again.

[nevergreen.io](http://nevergreen.io) users will be forced to do so the next time they refresh after the release. Users
running their own instance locally can choose when to upgrade, but once they do, they will be forced to reselect projects
as well.

## The problem?

We originally generated IDs for projects using their names, which added additional code to the client and server.
This code is unnecessary as each project has a web url which will be globally unique. 

As part of [issue #140](https://github.com/build-canaries/nevergreen/issues/140) we will remove the project id code
and use the web url instead. Since web url wasn't used before this change it isn't being saved, which means it's
impossible for us to migrate selected projects.