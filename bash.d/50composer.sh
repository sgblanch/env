#!/bin/bash

for dir in "${HOME}/.composer/vendor/bin" "${HOME}/.local/composer/vendor/bin"; do
    prepend_dir PATH "${dir}"
done

