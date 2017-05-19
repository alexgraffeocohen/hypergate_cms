require 'test_helper'

class ApiV1EncounterTest < ActionDispatch::IntegrationTest
  def setup
    @published_encounter = encounters(:ai_planet)
    @published_encounter.published = true
    @published_encounter.save

    get "/api/v1/encounters/"
    assert_response :success

    @encounters = JSON.parse(@response.body)
    @encounter_response = @encounters.first
  end

  test "only published encounters returned" do
    unpublished_encounter = encounters(:no_events)

    published_encounter_in_response = @encounters.
      any? { |attributes|
      attributes["id"] == @published_encounter.id
    }
    unpublished_encounter_in_response = @encounters.
      any? { |attributes|
      attributes["id"] == unpublished_encounter.id
    }

    assert(published_encounter_in_response)
    assert_not(unpublished_encounter_in_response)
  end

  test "only relevant encounter attributes are present" do
    irrelevant_attributes = %w[created_at updated_at published]
    relevant_attributes = %w[id description standalone title]

    irrelevant_attributes.each do |attribute|
      refute_includes(@encounter_response.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(@encounter_response.keys, attribute)
    end
  end

  test "category node is included" do
    category = @encounter_response["category"]

    assert(category, "Expected category node to be present")
    assert_includes(category.keys, "name")
  end

  test "starting_event node is included" do
    starting_event = @encounter_response["starting_event"]

    assert(starting_event, "Expected starting_event node to be present")
  end

  test "only relevant event attributes are present" do
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id title description]
    starting_event = @encounter_response["starting_event"]

    irrelevant_attributes.each do |attribute|
      refute_includes(starting_event.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(starting_event.keys, attribute)
    end
  end

  test "ship module on event is included" do
    starting_event = @encounter_response["starting_event"]
    ship_module = starting_event["ship_module_reward"]

    assert(ship_module, "Expected ship module node to be present")
  end

  test "only relevant attributes on ship module are present" do
    starting_event = @encounter_response["starting_event"]
    ship_module = starting_event["ship_module_reward"]
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id name role]

    relevant_attributes.each do |attribute|
      assert_includes(ship_module.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(ship_module.keys, attribute)
    end
  end

  test "options on event is included" do
    starting_event = @encounter_response["starting_event"]
    options = starting_event["options"]

    assert(options, "Expected options to be present")
  end

  test "only relevant attributes on option are present" do
    starting_event = @encounter_response["starting_event"]
    option = starting_event["options"].first

    irrelevant_attributes = %w[created_at updated_at event_id]
    relevant_attributes = %w[id text order]

    relevant_attributes.each do |attribute|
      assert_includes(option.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(option.keys, attribute)
    end
  end
end
