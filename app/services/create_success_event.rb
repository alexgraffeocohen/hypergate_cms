class CreateSuccessEvent
  def initialize(event:, option:)
    @event = event
    @option = option
  end

  def save
    if option.success_event
      event.errors.add(:base, message: "This Option already has a Success Event.")
      return false
    end

    return false if !event.save
    return false if !option.update_attribute(:success_event_id, event.id)

    true
  end

  private

  attr_reader :event, :option
end
