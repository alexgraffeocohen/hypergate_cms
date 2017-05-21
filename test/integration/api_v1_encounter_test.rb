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
    @starting_event = @encounter_response["starting_event"]
    @option = @starting_event["options"].first
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

  test "@starting_event node is included" do
    assert(@starting_event, "Expected @starting_event node to be present")
  end

  test "only relevant event attributes are present" do
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id title description next_encounter_id]

    irrelevant_attributes.each do |attribute|
      refute_includes(@starting_event.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(@starting_event.keys, attribute)
    end
  end

  test "responses on event are present" do
    assert(@starting_event["responses"])
  end

  test "only relevant attributes on response are included" do
    response = @starting_event["responses"].first

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id text role]

    irrelevant_attributes.each do |attribute|
      refute_includes(response.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(response.keys, attribute)
    end
  end

  test "event results on event are present" do
    assert(@starting_event["results"], "Results node not present")
  end

  test "only relevant attributes on results are present" do
    result = @starting_event["results"].first

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id amount ship_effect]

    irrelevant_attributes.each do |attribute|
      refute_includes(result.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(result.keys, attribute)
    end
  end

  test "only relevant attributes on ship effect are present" do
    result = @starting_event["results"].first
    ship_effect = result["ship_effect"]

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[name id]

    irrelevant_attributes.each do |attribute|
      refute_includes(ship_effect.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(ship_effect.keys, attribute)
    end
  end

  test "ship module on event is included" do
    ship_module = @starting_event["ship_module_reward"]

    assert(ship_module, "Expected ship module node to be present")
  end

  test "only relevant attributes on ship module are present" do
    ship_module = @starting_event["ship_module_reward"]
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id name role]

    relevant_attributes.each do |attribute|
      assert_includes(ship_module.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(ship_module.keys, attribute)
    end
  end

  test "only relevant attributes on role are present" do
    ship_module = @starting_event["ship_module_reward"]
    role = ship_module["role"]
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id name]

    relevant_attributes.each do |attribute|
      assert_includes(role.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(role.keys, attribute)
    end
  end

  test "item on event is included" do
    item = @starting_event["item_reward"]

    assert(item, "Expected item node to be present")
  end

  test "only relevant attributes on item are present" do
    item = @starting_event["item_reward"]
    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id name role]

    relevant_attributes.each do |attribute|
      assert_includes(item.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(item.keys, attribute)
    end
  end

  test "options on event is included" do
    options = @starting_event["options"]

    assert(options, "Expected options to be present")
  end

  test "only relevant attributes on option are present" do
    irrelevant_attributes = %w[created_at updated_at event_id]
    relevant_attributes = %w[id text order required_role]

    relevant_attributes.each do |attribute|
      assert_includes(@option.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(@option.keys, attribute)
    end
  end

  test "only relevant attributes on skill check are present" do
    skill_check = @option["skill_check"]

    assert(skill_check, "Expected skill check to be present")

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[role description difficulty]

    relevant_attributes.each do |attribute|
      assert_includes(skill_check.keys, attribute)
    end

    irrelevant_attributes.each do |attribute|
      refute_includes(skill_check.keys, attribute)
    end
  end

  test "success event on option present" do
    assert(@option["success_event"])
  end

  test "only relevant attributes on success event are present" do
    success_event = @option["success_event"]

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id title description]

    irrelevant_attributes.each do |attribute|
      refute_includes(success_event.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(success_event.keys, attribute)
    end
  end

  test "failure event on option present" do
    assert(@option["failure_event"])
  end

  test "only relevant attributes on failure event are present" do
    failure_event = @option["failure_event"]

    irrelevant_attributes = %w[created_at updated_at]
    relevant_attributes = %w[id title description]

    irrelevant_attributes.each do |attribute|
      refute_includes(failure_event.keys, attribute)
    end

    relevant_attributes.each do |attribute|
      assert_includes(failure_event.keys, attribute)
    end
  end
end
