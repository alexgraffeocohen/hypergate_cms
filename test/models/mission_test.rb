require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  def setup
    @mission = missions(:fight_the_ai)
    @ai_guards = combat_obstacles(:ai_guards)
    @locked_door = skill_check_obstacles(:locked_door)
  end

  test "#obstacles include both kinds of obstacles" do
    assert @mission.obstacles.include?(@ai_guards), true
    assert @mission.obstacles.include?(@locked_door), true
  end

  test "obstacles are ordered correctly" do
    @locked_door.order = 2
    @ai_guards.order = 1

    @locked_door.save!
    @ai_guards.save!
    @mission.reload

    assert_equal @mission.obstacles.first, @ai_guards
    assert_equal @mission.obstacles.second, @locked_door

    @locked_door.order = 1
    @ai_guards.order = 2

    @locked_door.save!
    @ai_guards.save!
    @mission.reload

    assert_equal @mission.obstacles.first, @locked_door
    assert_equal @mission.obstacles.second, @ai_guards
  end

  test "obstacles cannot share an order number" do
    assert @mission.valid?, true

    @locked_door.order = 1
    @ai_guards.order = 1

    @locked_door.save!
    @ai_guards.save!

    @mission.reload

    assert @mission.invalid?, true
  end
end
