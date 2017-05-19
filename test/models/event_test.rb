require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "item is required with item_role_requirement" do
    event = events(:land_on_ai_planet)
    event.item_role_requirement = roles(:engineer)

    assert_not(event.valid?)
  end

  test "is valid with item and item_role_requirement" do
    event = events(:land_on_ai_planet)
    event.item_role_requirement = roles(:engineer)
    event.item = items(:laser_sword)

    assert(event.valid?)
  end

  test "item is not required without item_role_requirement" do
    event = events(:land_on_ai_planet)
    event.item = nil

    assert(event.valid?)
  end

  test "ship module is required with ship_module_role_requirement" do
    event = events(:land_on_ai_planet)
    event.ship_module = nil
    event.ship_module_role_requirement = roles(:engineer)

    assert_not(event.valid?)
  end

  test "is valid with ship module and ship_module_role_requirement" do
    event = events(:land_on_ai_planet)
    event.ship_module_role_requirement = roles(:engineer)
    event.ship_module = ship_modules(:med_bay)

    assert(event.valid?)
  end

  test "ship module is not required without ship_module_role_requirement" do
    event = events(:land_on_ai_planet)
    event.ship_module = nil

    assert(event.valid?)
  end

  test "Event#destroy when it is not a starting event" do
    encounter = encounters(:ai_planet)
    event = Event.new(
      description: "test",
      encounter: encounter
    )

    event.destroy

    assert_equal(1, Encounter.where(id: encounter.id).count)
  end

  # TODO: this test is failing right now
  # test "Event#destroy when it is a starting event" do
  #   encounter = encounters(:ai_planet)
  #   event = encounter.starting_event

  #   byebug
  #   event.destroy
  #   byebug

  #   assert_equal(1, Encounter.where(id: encounter.id).count)
  # end
end
