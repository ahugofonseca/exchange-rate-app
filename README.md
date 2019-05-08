# exchange-rate-app
Concept proof to Beep Saúde company


## Setup ##

Install dependencies:
```
$ bundle install
```

Configure database.yml according with yours credentials

Get a free API key to JsonRates
```
https://currencylayer.com/?ref=jsonrates
```

Coonfigure your access_key with Credentials (Rails Resource)
```
https://guides.rubyonrails.org/security.html#custom-credentials
```


## Demo APP ##
```
https://beep-saude-exchange-rate-app.herokuapp.com/
```


## Observations ##

Json Rates was disabled. When run request for their endpoint, is received this message: "API access has been disabled. To continue using the API, please sign up at www.currencylayer.com".

The Currency Layer API have some restrictions for Free Plan:
 - Endpoint Historical Rates without support Source Currency Switching. (eg.: set currency to Real BRL)
 - Free Plan does not support to Time-Frame Queries (eg.: set a date range)

Details about Free Plan (https://currencylayer.com/product):
 - 1.000 Requests
 - Hourly Updates
 - Historical Rates
 - Limited Support
