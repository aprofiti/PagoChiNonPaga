Master:
[![Build Status](https://travis-ci.org/gaaloorg/PagoChiNonPaga.svg?branch=master)](https://travis-ci.org/gaaloorg/PagoChiNonPaga)

Develop:
[![Build Status](https://travis-ci.org/gaaloorg/PagoChiNonPaga.svg?branch=develop)](https://travis-ci.org/gaaloorg/PagoChiNonPaga)

# PagoChiNonPaga

PagoChiNonPaga is a platform developed for the homonym service offered by AddioPizzo for an Universitary project.

## Getting Started 

Download this repository from master branch.

Run 
```console
bundle install 
``` 
to install all the gems

On ubuntu and other debian based distros type:
```console
$sudo apt-get install imagemagick libmagickwand-dev 
``` 
on your terminal to install imagemagick. This tool is required to manage images.

Run 
```console
bundle exec rake db:setup
``` 
to create the Database and fill it with fake accounts. This command actually does db:create, db:schema:load and db:seed

Fill with you credentials the config/local_env.yml .
It contains the API keys for Google Maps, PayPal and the credentials of your project email.
The email is used from Devise and as asynchronous notification. 

Run 
```console
rails s
```
to start server. It runs on http://localhost:3000

