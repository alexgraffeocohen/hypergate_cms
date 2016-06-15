class RollEffectPair < ActiveRecord::Base
  belongs_to :effect
  validate :roll_range_and_roll_population

  private

  def roll_range_and_roll_population
    return if !roll_range && !roll

    if roll_range && roll
      errors.add(:roll, "Cannot also have a roll range")
      errors.add(:roll_range, "Cannot also have a roll")
    end
  end
end
