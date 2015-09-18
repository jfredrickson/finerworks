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
    assert_requested(:get, "http://api.finerworks.com/api/SomePath?AccountApiKey=#{@key}&Foo=1&Bar=abc&baz=quux")
    assert_equal FinerWorks::Response, result.class
    assert_equal "200", result.code
    assert_equal 5, result.json["someRandomJson"]
  end

  def test_get_without_params
    stub_request(:any, /.*api.finerworks.com.*/).to_return(status: 200, body: '{"someRandomJson": 5}')
    result = FinerWorks::Request.get(@client, "/SomePath")
    assert_requested(:get, "http://api.finerworks.com/api/SomePath?AccountApiKey=#{@key}")
    assert_equal FinerWorks::Response, result.class
    assert_equal "200", result.code
    assert_equal 5, result.json["someRandomJson"]
  end
end
