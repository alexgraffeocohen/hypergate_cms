require 'test_helper'

class SuccessSuccessEventPresenterTest < ActiveSupport::TestCase
  def setup
    @option = options(:fight_the_ai)
  end

  test "#responses returns objects for each role" do
    presenter = SuccessEventPresenter.new(event: Event.new, option: @option)
    assert_equal 6, presenter.responses.length
  end

  test "#responses returns the same number when the event has responses" do
    event = events(:land_on_ai_planet)
    presenter = SuccessEventPresenter.new(event: event, option: @option)

    assert_equal 6, presenter.responses.length
  end

  test "#responses returns existing responses on event" do
    event = events(:land_on_ai_planet)
    presenter = SuccessEventPresenter.new(event: event, option: @option)

    assert presenter.
      responses.
      select { |response| response.text == "Let's hack them!" }, true
  end

  test "#responses returns existing responses on event first" do
    event = events(:land_on_ai_planet)
    presenter = SuccessEventPresenter.new(event: event, option: @option)

    assert_equal "Let's hack them!", presenter.
      responses.
      first.
      text
  end

  test "#event_results returns objects for each ship effect" do
    presenter = SuccessEventPresenter.new(
      event: Event.new,
      option: @option
    )
    assert_equal 3, presenter.event_results.length
  end

  test "#event_results sets amount to 0 for new event results" do
    presenter = SuccessEventPresenter.new(
      event: Event.new,
      option: @option
    )

    assert presenter.
      event_results.
      map(&:amount).all? { |amount| amount == 0 }
  end

  test "#event_results returns the same number when the event has event results" do
    event = events(:cannot_defeat_the_ai)
    presenter = SuccessEventPresenter.new(
      event: event,
      option: @option
    )

    assert_equal 3, presenter.event_results.length
  end
end
