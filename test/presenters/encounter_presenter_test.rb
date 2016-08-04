require 'test_helper'

class EncounterPresenterTest < ActiveSupport::TestCase
  test "#options return 4 for a new encounter" do
    presenter = EncounterPresenter.new(Encounter.new)
    assert_equal 4, presenter.options.length
  end

  test "#options return 4 for an encounter with options" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)
    assert_equal 4, presenter.options.length
  end

  test "#options returns existing options on encounter" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)
    assert presenter.
      options.
      select { |o| o.text == "Fight the AI" }, true
  end

  test "#options returns existing options on encounter first" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)
    assert_equal "Fight the AI", presenter.
      options.
      first.
      text
  end

  test "#responses returns objects for each role" do
    presenter = EncounterPresenter.new(Encounter.new)
    assert_equal 6, presenter.responses.length
  end

  test "#responses returns the same number when the encounter has responses" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)

    assert_equal 6, presenter.responses.length
  end

  test "#responses returns existing responses on encounter" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)

    assert presenter.
      responses.
      select { |response| response.text == "Let's hack them!" }, true
  end

  test "#responses returns existing responses on encounter first" do
    encounter = encounters(:ai_planet)
    presenter = EncounterPresenter.new(encounter)

    assert_equal "Let's hack them!", presenter.
      responses.
      first.
      text
  end
end
