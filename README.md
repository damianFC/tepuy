# Tepuy Home

Welcome to Tepuy! A fork of [Alexa-Home](https://github.com/zachfeldman/alexa-home) by Zach Feldman. The goal of this project is to use your [Amazon Echo](http://amzn.to/1DO0ax3) to control various home automation software and other cool nifty applications.

## Setting up

* Clone this project from GitHub on a terminal.
* Setup some Environmental Variables in ~/.env such as:


export NEST_EMAIL=your_nest_email@awesome.com
export NEST_PASS=your_nest_password_not_test123

export AMAZON_EMAIL=youramazonlogin
export AMAZON_PASSWORD=your_awesome_pass_not_12345


 * For IFTTT Integration set this parameters:

export GMAIL_EMAIL=yourgmail@gmail.com

 (Consider using 2-factor authentication and obtain an application key!):
export GMAIL_PASS=youremailpassword

 (Define a seed in here, that way others without the seed can't send emails to you and trigger IFTTT)
export GMAIL_SEED=thisistheseedyoullneedfortheIFTTTrecipe-CHANGEME-TO-SOMETHING-RANDOM


  * To post a tweet then. Call Alexa: "alexa tweet mytweet" and Tepuy will send an email to your address with the subject (using the seed) and the body with the tweet.
  * You need to create a IFTTT Recipe: if gmail subject is 'echo tweet myseed' then post body to twitter.


For more, check out [Using Environment Variables to Safely Store API Credentials](http://blog.zfeldman.com/2014-04-07-Using-Environment-Variables-to-Safely-Store-API-Credentials)

## Getting Started

TODO
* Save last command locally so we don't run it again on second startup.

## Contributors

[@Finol_D](https://twitter.com/Finol_D)

This project is a fork of the Alexa-Home project by:
[@zachfeldman](https://twitter.com/zachfeldman)

## Contributing

Pull requests and issues are always the best ways to contribute.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
