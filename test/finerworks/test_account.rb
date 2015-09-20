require 'test_helper'

class TestAccount < Minitest::Test
  def setup
    @account = FinerWorks::Account.new(read_fixture_as_json("account.json"))
  end

  # Verify that Account correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "Milton", @account.first_name
    assert_equal Time.utc(2015, 9, 13, 0, 0, 0), @account.registration_date
    assert_equal "", @account.middle_name
  end
end
