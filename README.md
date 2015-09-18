# FinerWorks Ruby Gem

[![Build Status](https://travis-ci.org/jfredrickson/finerworks.svg?branch=master)](https://travis-ci.org/jfredrickson/finerworks)

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
=> #<FinerWorks::Response:0x007fd94719cfa8 @code="200", @message="OK", ... >
```

### Prints

Access your "My Prints Inventory". Optionally, filter by Image GUID and/or Gallery GUID. Prints are based on images, and images may be part of a gallery.

```ruby
> prints = client.prints
=> [#<FinerWorks::Print ...>, #<FinerWorks::Print ...>, ...]
> prints = client.prints("ImageGUID": "12345678-abcd-abcd-abcd-12345678abcd")
=> [#<FinerWorks::Print ...>, #<FinerWorks::Print ...>, ...]
> prints = client.prints("GalleryGUID": "12345678-abcd-abcd-abcd-12345678abcd")
=> [#<FinerWorks::Print ...>, #<FinerWorks::Print ...>, ...]
> prints = client.prints("ImageGUID": "12345678-abcd-abcd-abcd-12345678abcd", "GalleryGUID": "12345678-abcd-abcd-abcd-12345678abcd")
=> [#<FinerWorks::Print ...>, #<FinerWorks::Print ...>, ...]
```

### Galleries

You can retrieve a list of your galleries.

```ruby
> galleries = client.galleries
=> [#<FinerWorks::Gallery active=true guid="..." title="My Gallery">, ...]
```

### Images

You can retrieve a list of images in a given gallery. Optionally, filter by Gallery GUID and sort by upload date (`ASC` or `DESC`; default is descending).

```ruby
> images = client.images
=> [#<FinerWorks::Image ...>, #<FinerWorks::Image ...>, ...]
> images = client.images("GalleryGUID": "12345678-abcd-abcd-abcd-12345678abcd", sort: "ASC")
=> [#<FinerWorks::Image ...>, #<FinerWorks::Image ...>, ...]
```

### Orders

You can retrieve a list of your orders. Optionally, filter by a date/time range, by order status ID, or a specific order ID. Also, optionally sort by order ID (`ASC` or `DESC`; default is descending).

#### Options

* `"OrderDateTime_Start"` - Search for orders in the range starting at the specified date/time. Possible formats: `MM/DD/YYYY` or `YYYY-MM-DD`.
* `"OrderDateTime_End"` - Search for orders in the range ending at the specified date/time. Possible formats: `MM/DD/YYYY` or `YYYY-MM-DD`.
* `"OrderStatusID"` - Search for orders with a specific status.
* `"OrderID"` - Find a specific order by ID.
* `"Sort"` - Sort orders by ID in ascending or descending order. Possible values are `ASC` and `DESC`. Default is descending.

```ruby
> orders = client.orders
=> [#<FinerWorks::Order ...>, #<FinerWorks::Order ...>, ...]
> orders = client.orders("OrderDateTime_Start": "2015-05-01")
=> [#<FinerWorks::Order ...>, #<FinerWorks::Order ...>, ...]
> order = client.orders("OrderID": 12345)
=> [#<FinerWorks::Order id=12345 ...>]
```
