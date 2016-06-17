require 'test_helper'

class EffectTest < ActiveSupport::TestCase
  test "cannot be a base effect with other requirements" do
    effect = effects(:base_effect)

    Effect::REQUIREMENTS.each do |requirement|
      effect.send("#{requirement}=", true)
      assert effect.invalid?, true
    end
  end
end
