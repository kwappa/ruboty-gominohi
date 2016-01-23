require 'test/unit'
require 'ruboty/gominohi'
class TestGominohiNotification < Test::Unit::TestCase
  test '23th Jan 2016 is a day to collect burnable garbage' do
    notification = ::Ruboty::Gominohi::Notification.new(Date.new(2016, 1, 23))
    assert_true(notification.message.include?(':fire:'))
  end

  test '28th Jan 2016 is a day to collect unburnable garbage' do
    notification = ::Ruboty::Gominohi::Notification.new(Date.new(2016, 1, 28))
    assert_true(notification.message.include?(':put_litter_in_its_place:'))
  end

  test '21st Jan 2016 is not a day to collect any garbage' do
    notification = ::Ruboty::Gominohi::Notification.new(Date.new(2016, 1, 21))
    assert_true(notification.message.nil?)
  end
end
