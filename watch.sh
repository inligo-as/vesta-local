#!/bin/bash

fswatch -o ../vesta-plugins | xargs -n1 -I{} ./onchange.sh