require 'test_helper'

class OptionFlowTest < ActionDispatch::IntegrationTest
  test "creating option on an event" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event

    get "/encounters/#{encounter.id}/events/#{event.id}/options/new"
    assert_response :success

    post "/encounters/#{encounter.id}/events/#{event.id}/options",
      { option: { text: "test", order: 1 } }

    event.reload
    assert_includes(event.options.pluck(:text), "test")
  end

  test "creating option with valid skill check" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event
    role = roles(:engineer)

    post(
      "/encounters/#{encounter.id}/events/#{event.id}/options",
      {
        option: {
          text: "test with valid skill check",
          order: 2,
          skill_check_attributes: {
            role_id: role.id, difficulty: 3, description: ''
          }
        }
      }
    )

    event.reload
    option = event.options.where(text: "test with valid skill check").first

    assert_equal(3, option.skill_check.difficulty)
  end

  test "updating option with valid skill check" do
    option = options(:fight_the_ai)
    current_skill_check = option.skill_check
    event = option.event
    encounter = event.encounter
    role = roles(:engineer)

    assert_not_equal(role, current_skill_check.role)

    patch(
      "/encounters/#{encounter.id}/events/#{event.id}/options/#{option.id}",
      {
        option: {
          skill_check_attributes: {
            role_id: role.id, difficulty: 3, description: ''
          }
        }
      }
    )
    option.reload

    assert_equal(role, option.skill_check.role)
  end

  test "creating option with blank skill check" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event

    post(
      "/encounters/#{encounter.id}/events/#{event.id}/options",
      {
        option: {
          text: "test with valid skill check",
          order: 2,
          skill_check_attributes: {
            role_id: nil, difficulty: nil, description: nil
          }
        }
      }
    )
    assert_redirected_to encounter

    event.reload
    option = event.options.where(text: "test with valid skill check").first

    assert_nil(option.skill_check)
  end

  test "creating option with one attribute filled in for skill check" do
    encounter = encounters(:ai_planet)
    event = encounter.starting_event

    post(
      "/encounters/#{encounter.id}/events/#{event.id}/options",
      {
        option: {
          text: "test with valid skill check",
          order: 2,
          skill_check_attributes: {
            role_id: nil, difficulty: 3, description: nil
          }
        }
      }
    )
    assert_response :unprocessable_entity
  end
end
