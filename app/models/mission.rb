class Mission < ActiveRecord::Base
  has_many :skill_check_obstacles
  has_many :combat_obstacles
  belongs_to :outcome

  validate :obstacles_do_not_share_order

  def obstacles
    (skill_check_obstacles + combat_obstacles).sort_by(&:order)
  end

  private

  def obstacles_do_not_share_order
    if obstacles.map(&:order).uniq.count != obstacles.count
      errors.add(:combat_obstacles, "Obstacles cannot share order numbers")
      errors.add(:skill_check_obstacles, "Obstacles cannot share order numbers")
    end
  end
end
