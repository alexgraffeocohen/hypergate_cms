require 'test_helper'

class EncounterTest < ActiveSupport::TestCase
  def setup
    @encounter = Encounter.new(
      category: categories(:habitable_planet),
      description: "Just a bunch of dumb humans.",
      starting_event: nil
    )
  end

  test "skips starting_event presence validation if not published" do
    @encounter.published = false

    assert(@encounter.save, "Encounter was invalid and did not save.")
  end

  test "requires starting_event when published" do
    @encounter.published = true

    assert_not(@encounter.save, "Encounter was valid and saved.")
  end

  test "published defaults to false" do
    @encounter.save

    assert_not(@encounter.published)
  end

  test "standalone defaults to true" do
    @encounter.save

    assert(@encounter.standalone)
  end

  test "destroying encounter destroys correct children objects" do
    encounter = encounters(:ai_planet)
    starting_event = encounter.starting_event
    response = starting_event.responses.first
    option = starting_event.options.where(text: "Fight the AI").first
    skill_check = option.skill_check
    success_event = option.success_event
    item_reward = success_event.item_rewards.first
    module_reward = success_event.ship_module_rewards.first
    failure_event = option.failure_event
    ship_effect_result = failure_event.ship_effect_results.first

    item = item_reward.item
    ship_module = module_reward.ship_module
    ship_effect = ship_effect_result.ship_effect

    assert(encounter.destroy)

    assert_equal(0, Event.where(id: starting_event.id).count, "Expected starting event to be destroyed")
    assert_equal(0, Response.where(id: response.id).count, "Expected role response to be destroyed")
    assert_equal(0, Option.where(id: option.id).count, "Expected option to be destroyed")
    assert_equal(0, SkillCheck.where(id: skill_check.id).count, "Expected skill check to be destroyed")
    assert_equal(0, Event.where(id: success_event.id).count, "Expected success event to be destroyed")
    assert_equal(0, ItemReward.where(id: item_reward.id).count, "Expected item reward to be destroyed")
    assert_equal(0, ShipModuleReward.where(id: module_reward.id).count, "Expected ship module reward to be destroyed")
    assert_equal(0, Event.where(id: failure_event.id).count, "Expected failure event to be destroyed")
    assert_equal(0, EventResult.where(event: failure_event).count, "Expected event result to be destroyed")
    assert_equal(0, ShipEffectResult.where(id: ship_effect_result.id).count, "Expected ship effect result to be destroyed")

    assert_equal(1, ShipModule.where(id: ship_module.id).count, "Expected ship module to not be destroyed")
    assert_equal(1, Item.where(id: item.id).count, "Expected item to not be destroyed")
    assert_equal(1, ShipEffect.where(id: ship_effect.id).count, "Expected ship effect to not be destroyed")
  end
end
