class FailureEventPresenter
  attr_reader :option, :failure_event

  def initialize(event:, option:)
    @failure_event = event
    @option = option
  end

  def encounter
    option.event.encounter
  end

  def event
    option.event
  end
end
