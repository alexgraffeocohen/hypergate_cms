class SuccessEventPresenter
  attr_reader :option, :success_event

  def initialize(event:, option:)
    @success_event = event
    @option = option
  end

  def encounter
    option.event.encounter
  end

  def event
    option.event
  end
end
