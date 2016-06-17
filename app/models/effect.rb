class Effect < ActiveRecord::Base
  REQUIREMENTS = [
    :mining_bay,
    :cargo_bay,
    :repair_bay,
    :battery,
    :defense_droid,
    :astrometrics,
    :ship_computer,
  ]

  belongs_to :outcome
  has_many :roll_effect_pairs

  validate :cannot_be_base_effect_with_other_requirements

  private

  def cannot_be_base_effect_with_other_requirements
    active_requirements = REQUIREMENTS.map { |requirement|
      self.send(requirement)
    }.include?(true)

    if base_effect && active_requirements
      errors.add(:base_effect, "Cannot be a base effect with other requirements")
    end
  end
end
