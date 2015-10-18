require 'test_helper'

class TestRequest < Minitest::Test
  def setup
    @key = "15b1431c-6d9c-4bf3-8bce-e89e6887a3f2"
    @client = FinerWorks::Client.new(account_api_key: @key)
  end

  def test_get_with_params
    params = {
      "Foo" => 1,
      "Bar" => "abc",
      baz: "quux"
    }
    stub_request(:any, /.*api.finerworks.com.*/).to_return(status: 200, body: '{"someRandomJson": 5}')
    result = FinerWorks::Request.get(@client, "/SomePath", params)
    assert_requested(:get, "http://api.finerworks.com/api/SomePath?AccountApiKey=#{@key}&TimeZoneID=UTC&Foo=1&Bar=abc&baz=quux")
    assert_equal FinerWorks::Response, result.class
    assert_equal "200", result.code
    assert_equal 5, result.json["someRandomJson"]
  end

  def test_get_without_params
    stub_request(:any, /.*api.finerworks.com.*/).to_return(status: 200, body: '{"someRandomJson": 5}')
    result = FinerWorks::Request.get(@client, "/SomePath")
    assert_requested(:get, "http://api.finerworks.com/api/SomePath?AccountApiKey=#{@key}&TimeZoneID=UTC")
    assert_equal FinerWorks::Response, result.class
    assert_equal "200", result.code
    assert_equal 5, result.json["someRandomJson"]
  end

  def test_handle_404
    stub_request(:any, /.*api.finerworks.com.*/).to_return(status: 404, body: 'oops')
    result = FinerWorks::Request.get(@client, "/SomePath")
    assert_equal FinerWorks::Response, result.class
    assert_equal "404", result.code
    assert_equal nil, result.json
  end

  def test_post_with_options
    options = {
      "Foo" => 1,
      "Bar" => "abc",
      baz: "quux"
    }
    stub_request(:any, /.*api.finerworks.com.*/).to_return(status: 200, body: '{"someRandomJson": 5}')
    result = FinerWorks::Request.post(@client, "/SomePath", options)
    assert_requested(:post, "http://api.finerworks.com/api/SomePath?AccountApiKey=#{@key}&TimeZoneID=UTC",
      body: options.to_json)
    assert_equal FinerWorks::Response, result.class
    assert_equal "200", result.code
    assert_equal 5, result.json["someRandomJson"]
  end
end
