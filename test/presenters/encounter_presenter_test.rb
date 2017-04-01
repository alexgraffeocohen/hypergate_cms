require 'test_helper'

class EncounterPresenterTest < ActiveSupport::TestCase
  def setup
    @encounter = encounters(:ai_planet)
    @presenter = EncounterPresenter.new(@encounter)
  end

  test "#title displays encounter title when it's not nil" do
    @encounter.title = "AI Planet"

    assert_equal(@presenter.title, "AI Planet")
  end

  test "#title has a default when encounter title is nil" do
    @encounter.title = nil
    @encounter.category = categories(:habitable_planet)

    assert_equal(
      @presenter.title,
      "Encounter ##{@encounter.id}"
    )
  end

  test "#category displays encounter category in title case" do
    @encounter.category = categories(:habitable_planet)

    assert_equal(@presenter.category, "Habitable Planet")
  end

  test "#description displays encounter description" do
    @encounter.description = "A Description"

    assert_equal(@presenter.description, "A Description")
  end

  test "#events returns encounter's events" do
    event = events(:land_on_ai_planet)
    @encounter.events << event

    assert_includes(@presenter.events, event)
  end
end
