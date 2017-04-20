require 'test_helper'

class FailureEventPresenterTest < ActiveSupport::TestCase
  def setup
    @option = options(:fight_the_ai)
  end

  test "#responses returns objects for each role" do
    presenter = FailureEventPresenter.new(event: Event.new, option: @option)
    assert_equal 6, presenter.responses.length
  end

  test "#responses returns the same number when the event has responses" do
    event = events(:land_on_ai_planet)
    presenter = FailureEventPresenter.new(event: event, option: @option)

    assert_equal 6, presenter.responses.length
  end

  test "#responses returns existing responses on event" do
    event = events(:land_on_ai_planet)
    presenter = FailureEventPresenter.new(event: event, option: @option)

    assert presenter.
      responses.
      select { |response| response.text == "Let's hack them!" }, true
  end

  test "#responses returns existing responses on event first" do
    event = events(:land_on_ai_planet)
    presenter = FailureEventPresenter.new(event: event, option: @option)

    assert_equal "Let's hack them!", presenter.
      responses.
      first.
      text
  end
end
