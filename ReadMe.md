# OCSI Test 

## Overview
Vagrant file and install script to provision Ubuntu box with Apache2, PHP8.3 and Postgresql. Box serves a single page Vue3 application frontend and Laravel11 backend API, with a couple of simple functions: Fetches and displays a simple message (chosen at random from a local messages table); Fetches geospatial data from a remote resource, and displays any data that has badly formed geometries (Using PostGIS Postgresql extension)

## Setup
* Open a terminal in the base of the repo and run `vagrant up` - this will provision the VM the first time it is run 
* When the VM machine is running it can be accessed via `Vagrant ssh` from the terminal
* Open a browser and navigate to `http:\\127.0.0.1` and the frontend will display.  Press buttons to trigger API calls