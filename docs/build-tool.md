---
title: "Build tool"
layout: post
permalink: build-tool
---

# Building and dependency management
Building all submodules, dependency management and artifact generation is done with help of [gradle](http://gradle.org).

# Gradle tasks
Main tasks is held in "build_scripts/build-tasks.gradle".

# Submodule release
Main steps:

1. Check all tests
1. Check for SNAPSHOT dependencies
1. Check "gradle.properties" for all params.
1. Commit all changes to remote git-repo in master
1. Check all stored credential in submodule dir (call `git config credential.helper store` in submodule dir)
1. Call `gradle release` (from "build_scripts/build-tasks.gradle")
1. After successful invocation - set SNAPSHOT in "gradle.properties"

# Dependencies
All dependencies specified in "build_scripts/dependencies.gradle".

---
{% include toc.md %}
