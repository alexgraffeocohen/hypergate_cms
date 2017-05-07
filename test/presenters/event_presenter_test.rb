require 'test_helper'

class EventPresenterTest < ActiveSupport::TestCase
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

  test "#event_results returns objects for each ship effect" do
    presenter = EventPresenter.new(Event.new)
    assert_equal 3, presenter.event_results.length
  end

  test "#event_results sets amount to 0 for new event results" do
    presenter = EventPresenter.new(Event.new)

    assert presenter.
      event_results.
      map(&:amount).all? { |amount| amount == 0 }
  end

  test "#event_results returns the same number when the event has event results" do
    event = events(:cannot_defeat_the_ai)
    presenter = EventPresenter.new(event)

    assert_equal 3, presenter.event_results.length
  end

  test "#event_results returns existing event results on event" do
    event = events(:cannot_defeat_the_ai)
    existing_event_result = event.event_results.last
    presenter = EventPresenter.new(event)

    assert_includes presenter.event_results, existing_event_result
  end

  test "#encounter returns event's encounter" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)

    assert_equal presenter.encounter, event.encounter
  end

  test "#starting_event? when event is starting event" do
    event = events(:land_on_ai_planet)
    presenter = EventPresenter.new(event)

    assert(presenter.starting_event?)
  end

  test "#starting_event? when event is not starting event" do
    event = events(:defeat_the_ai)
    presenter = EventPresenter.new(event)

    assert_not(presenter.starting_event?)
  end
end
