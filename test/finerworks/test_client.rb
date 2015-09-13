require 'test_helper'

class TestClient < Minitest::Test
  def setup
    @key = "15b1431c-6d9c-4bf3-8bce-e89e6887a3f2"
    @success_response_body = { "ResponseContent" => "Success", "ResponseStatusCode" => "OK" }.to_json
    @client = FinerWorks::Client.new(account_api_key: @key)
    @account = FinerWorks::Account.new(read_fixture("account.json"))
  end

  # Verify that the client has the correct value for the account API key.
  def test_client_key
    assert_equal @key, @client.account_api_key
  end

  # Verify that the client returns account data in the correct format.
  def test_account
    FinerWorks::Request.stub(:get, read_fixture("account.json")) do
      account = @client.account
      assert_equal FinerWorks::Account, account.class
      assert_equal "Milton", account.first_name
    end
  end

  # Verify that the client provides updated account information in the correct format.
  def test_update_account
    mock = Minitest::Mock.new
    mock.expect(:call, @success_response_body, [@client, "/Account", @client.build_post_account_json(@account)])
    FinerWorks::Request.stub(:post, mock) do
      @client.update_account(@account)
    end
    assert mock.verify
  end

  # Verify that the helper method generates appropriate JSON body content for the "POST /Account" request.
  def test_build_post_account_json
    expected = {
      "AccountApiKey": "15b1431c-6d9c-4bf3-8bce-e89e6887a3f2",
      "AccountUsername": "milton_waddams",
      "AccountUpdate_Info": {
        "AccountEmail": "milton_waddams@initech.com",
        "AccountFirstName": "Milton",
        "AccountMiddleName": "",
        "AccountLastName": "Waddams",
        "AccountPhone": "555-555-1212",
        "AccountBio": "",
        "AccountTitle": ""
      }
    }
    result = @client.build_post_account_json(@account)
    assert_equal expected, result
  end

  # Verify that the client returns gallery data in the correct format.
  def test_galleries
    FinerWorks::Request.stub(:get, read_fixture("galleries.json")) do
      galleries = @client.galleries
      assert_equal Array, galleries.class
      assert_equal 3, galleries.count
      galleries.each do |g|
        assert_equal FinerWorks::Gallery, g.class
      end
    end
  end
end