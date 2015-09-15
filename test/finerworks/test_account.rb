require 'test_helper'

class TestAccount < Minitest::Test
  def setup
    @account = FinerWorks::Account.new(read_fixture("account.json"))
  end

  # Verify that Account correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "Milton", @account.first_name
    assert_equal Time.new(2015, 9, 13, 0, 0, 0, "-05:00"), @account.registration_date
    assert_equal "", @account.middle_name
  end
end
