require 'test_helper'

class ShipEffectResultTest < ActiveSupport::TestCase
  def setup
    @ship_effect = ship_effects(:crew_sanity)
  end

  test "invalid when amount greater than 3" do
    subject = ShipEffectResult.new(amount: 4, ship_effect: @ship_effect)
    assert_not subject.valid?
  end

  test "invalid when amount less than -3" do
    subject = ShipEffectResult.new(amount: -4, ship_effect: @ship_effect)
    assert_not subject.valid?
  end

  test "valid when amount is between -3 and 3" do
    valid_amounts = (-3...3).to_a
    valid_amounts.each do |amount|
      subject = ShipEffectResult.new(
        amount: amount,
        ship_effect: @ship_effect
      )
      assert subject.valid?
    end
  end
end
