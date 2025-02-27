#!/bin/bash

set -e

bazel build //...
bazel test //... --test_verbose_timeout_warnings --test_output=errors

# In separate windows:
# bazel run :frontend
# bazel run :service
# visit http://localhost:8080

# Or, to run one of the services directly:

# Build the deployable JAR:
bazel build :service-deploy

# Run it:
# java -jar bazel-bin/service/src/main/java/com/oasisdigital/grocery/grocery_deploy.jar

# There is a way to retrieve that filename programmaticlaly with "bazel aquery", beyond
# the scope of this introduction. Also, in a real build process we would copy the desired
# output artifacts onward.
