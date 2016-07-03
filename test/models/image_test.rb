require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  def setup
    @image = Image.new(event: "Thanksgiving", people: "From the left Pt. Jmaes")
  end

  test "should be valid" do
    assert @image.valid?
  end

  test "people can be absent" do
    @image.people = "         "
    assert @image.valid?
  end

  test "event must be present" do
    @image.event = "       "
    assert_not @image.valid?
  end

  test "event must not be too long" do
    @image.event = "a" * 31
    assert_not @image.valid?
  end

  test "people must not be too long" do
    @image.people = "a" * 251
    assert_not @image.valid?
  end
end
