class CreateEvent
  def initialize(event:, encounter:)
    @event = event
    @encounter = encounter
  end

  def save
    event.encounter = encounter
    return false if !event.save

    if encounter.events.count == 1
      return false if !encounter.update_attribute(
        :starting_event_id, event.id
      )
    end

    true
  end

  private

  attr_reader :event, :encounter
end
