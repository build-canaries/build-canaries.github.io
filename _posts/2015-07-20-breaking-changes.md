---
layout: default
title: Breaking changes in Nevergreen v0.7.0 (Grape)
---

# Notification of breaking changes in Nevergreen v0.7.0 (Grape)

## How does this effect me?

You will have to configure everything again from scratch, no existing configuration will be retained.

[nevergreen.io](http://nevergreen.io) users will be forced to do so the next time they refresh after the release. Users
running their own instance locally can choose when to upgrade, but once they do, they will be forced to reconfigure as
well.

## The problem?

Two issues came up that made us decide to introduce these breaking changes.

### [Issue \#95](https://github.com/build-canaries/nevergreen/issues/95)

This bug refers to custom AES keys not being used correctly. Fixing it means any trays with passwords 
on [nevergreen.io](http://nevergreen.io) or local instances, where the user has tried to set a custom key, 
would fail to load. This is because the server would now correctly pick up the custom key and no longer be able to 
decrypt the password encrypted by the default key.

### [Issue \#94](https://github.com/build-canaries/nevergreen/issues/94)

Our initial approach to local configuration was to migrate it to work with any new features correctly. The idea
was to make the changes transparent to the end users and even after upgrading anything they had set up should
continue working the same.

Unfortunately we didn't consider our approach and the code has become messy and hard to test, even for the simple 
migrations and few releases we have.

## Our solution?

Since we are going to break the configuration for some users, we decided to completely remove any configuration added
before v0.7.0 (Grape).

Perhaps not the most elegant solution, but it will allow us to think about and handle migrations much cleaner going 
forward. As an example, we now store the version that generated the configuration giving us a very simple check for
future migrations.
