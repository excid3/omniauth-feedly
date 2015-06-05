# OmniAuth for Feedly

[![Gem Version](http://img.shields.io/gem/v/omniauth.svg)][gem]

Unofficial OmniAuth strategy for Feedly OAuth 2.

For more on the Feedly API, go to [developer.feedly.com](https://developer.feedly.com/).

You can also check out the developer forum at https://groups.google.com/forum/#!forum/feedly-cloud.

Once you authorize your user, you can make calls to the Feedly API using the gem (Feedlr)[https://github.com/khelll/feedlr]

## Getting Started

###For Development

Feedly development is done on sandbox.feedly.com. 

You will need to use the sandbox id and secret. You can find that info here: [forum post](https://groups.google.com/forum/#!topic/feedly-cloud/ZNn0UUOyCZw)

The callback url used needs to be one that Feedly has in their system. The callback this gem uses is: http://localhost:3000/auth/feedly/callback. That means that you must make calls from 'http://localhost:3000'. 

You are welcome to set your own callback url, but you will have to have Feedly add it on their end as well.

More info about the sandbox: [docs](https://developer.feedly.com/v3/sandbox/).

###For Production

Straight from Feedly's mouth ([forum post](https://groups.google.com/forum/#!topic/feedly-cloud/ZNn0UUOyCZw)):

>When your app is ready to go live, please fill this form:

>http://goo.gl/forms/bHt5g5mD4q

>We will send you back a permanent production key and list you in the http://www.feedly.com/apps.html so that feedly users can discover your apps.
>We look forward to see your creativity at work!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-feedly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-feedly

## Usage

### For Development (sandbox.feedly.com)
Remember: Calls must be made from http://localhost:3000 (see Getting Started for more info) 
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :feedly, ENV['FEEDLY_SANDBOX_KEY'], ENV['FEEDLY_SANDBOX_SECRET'],
	:client_options => {
		:site => 'https://sandbox.feedly.com'
	}
end
```

### For Production (cloud.feedly.com)
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :feedly, ENV['FEEDLY_KEY'], ENV['FEEDLY_SECRET']
end
```

### Routing the callback
Simply add to your routes.rb file:
```ruby
get '/auth/feedly/callback', to: 'your_controller#your_action'
```

For more on integrating OmniAuth into your app: [OmniAuth Gem](https://github.com/intridea/omniauth#integrating-omniauth-into-your-application)


## Contributing

If anything changes with how feedly handles developer registration or the api, please let me know so I can update the README and/or code. 

1. Fork it ( https://github.com/johnmpotter/omniauth-feedly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
