# FinerWorks Ruby Gem

A Ruby interface for the [FinerWorks Web API](http://api.finerworks.com/).

## Usage

First, obtain a FinerWorks account API key.

All API calls take place through the client:

```ruby
> require 'finerworks'
> client = FinerWorks::Client.new(account_api_key: YOUR_ACCOUNT_API_KEY)
=> #<FinerWorks::Client:0x007f9b0a922190 @account_api_key="...">
```

### Account Information

You can retrieve and update your account information.

```ruby
> account = client.account
=> #<FinerWorks::Account bio="" business_address1="" ... >
> account.phone = "123-456-7890"
=> "123-456-7890"
> client.update_account(account)
=> {"ResponseContent"=>"Success", "ResponseStatusCode"=>"OK"}
```

### Galleries

You can retrieve a list of your galleries.

```ruby
> galleries = client.galleries
=> [#<FinerWorks::Gallery active=true guid="..." title="My Gallery">]
```
