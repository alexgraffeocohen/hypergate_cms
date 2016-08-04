require 'test_helper'

class NewEncounterPresenterTest < ActiveSupport::TestCase
  test "#options return 4 for a new encounter" do
    presenter = NewEncounterPresenter.new(Encounter.new)
    assert_equal 4, presenter.options.length
  end

  test "#options return 4 for an encounter with options" do
    encounter = encounters(:ai_planet)
    presenter = NewEncounterPresenter.new(encounter)
    assert_equal 4, presenter.options.length
  end

  test "#options returns existing options on encounter" do
    encounter = encounters(:ai_planet)
    presenter = NewEncounterPresenter.new(encounter)
    assert presenter.
      options.
      select { |o| o.text == "Fight the AI" }, true
  end

  test "#options returns existing options on encounter first" do
    encounter = encounters(:ai_planet)
    presenter = NewEncounterPresenter.new(encounter)
    assert_equal "Fight the AI", presenter.
      options.
      first.
      text
  end
end
