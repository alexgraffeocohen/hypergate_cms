require 'test_helper'

class RollEffectPairTest < ActiveSupport::TestCase
  test "valid with roll range and no roll" do
    roll_effect_pair = roll_effect_pairs(:roll_effect_pair)
    roll_effect_pair.roll_range = 1..3
    assert roll_effect_pair.valid?, true
  end

  test "valid with roll and no roll range" do
    roll_effect_pair = roll_effect_pairs(:with_roll)
    assert roll_effect_pair.valid?, true
  end

  test "not valid with roll and roll range" do
    roll_effect_pair = roll_effect_pairs(:with_roll)
    roll_effect_pair.roll_range = 1...3
    assert roll_effect_pair.invalid?, true
  end

  test "valid without roll and roll range" do
    roll_effect_pair = roll_effect_pairs(:roll_effect_pair)
    assert roll_effect_pair.valid?, true
  end
end
