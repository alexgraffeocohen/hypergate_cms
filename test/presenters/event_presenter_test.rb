require 'test_helper'

class EventPresenterTest < ActiveSupport::TestCase
  test "#options return 4 for a new event" do
    presenter = EventPresenter.new(Event.new)
    assert_equal 4, presenter.options.length
  end

  test "#options return 4 for an event with options" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)
    assert_equal 4, presenter.options.length
  end

  test "#options returns existing options on event" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)
    assert presenter.
      options.
      select { |o| o.text == "Fight the AI" }, true
  end

  test "#options returns existing options on event first" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)
    assert_equal "Fight the AI", presenter.
      options.
      first.
      text
  end

  test "#responses returns objects for each role" do
    presenter = EventPresenter.new(Event.new)
    assert_equal 6, presenter.responses.length
  end

  test "#responses returns the same number when the event has responses" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)

    assert_equal 6, presenter.responses.length
  end

  test "#responses returns existing responses on event" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)

    assert presenter.
      responses.
      select { |response| response.text == "Let's hack them!" }, true
  end

  test "#responses returns existing responses on event first" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)

    assert_equal "Let's hack them!", presenter.
      responses.
      first.
      text
  end
end
