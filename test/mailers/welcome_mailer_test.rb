require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "the truth" do
  	# Send the email, then test that it got queued
    email = UserMailer.create_email('me@example.com', 
    								'friend@example.com', Time.now).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

  	# assert true
  	assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You have successfully signed up to example.com', email.subject
    assert_equal read_fixture('the truth').join, email.body.to_s
  end
end
