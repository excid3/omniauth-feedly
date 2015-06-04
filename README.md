# OmniAuth for Feedly

Unofficial OmniAuth strategy for Feedly OAuth 2.

For more on the Feedly API, go to [developer.feedly.com](https://developer.feedly.com/).

You can also check out the developer forum at https://groups.google.com/forum/#!forum/feedly-cloud.

## Getting Started

###For Development

Feedly development is done on sandbox.feedly.com. 

You will need to use the sandbox id and secret, but the caveat here is that your development redirect url must be one of the following: "http://localhost", "https://localhost", "http://localhost:8080", "urn:ietf:wg:oauth:2.0:oob". Obvioulsy not ideal for us port 3000ers, so i'm going to see if we can get port 3000 added.

More info about the sandbox access: [forum post](https://groups.google.com/forum/#!topic/feedly-cloud/ZNn0UUOyCZw) and [docs](https://developer.feedly.com/v3/sandbox/).

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

### For cloud.feedly.com 
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :feedly, ENV['FEEDLY_KEY'], ENV['FEEDLY_SECRET']
end
```

### For sandbox.feedly.com 
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :feedly, ENV['FEEDLY_SANDBOX_KEY'], ENV['FEEDLY_SANDBOX_SECRET'],
	:client_options => {
		:site => 'https://sandbox.feedly.com'
	}
end
```

## Contributing

If anything changes with how feedly handles developer registration or the api, please let me know so I can update the README and/or code. 

1. Fork it ( https://github.com/johnmpotter/omniauth-feedly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
