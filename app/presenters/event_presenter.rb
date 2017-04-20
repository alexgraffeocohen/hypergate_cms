class EventPresenter
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def encounter
    event.encounter
  end

  def responses
    [].tap do |array|
      array << event.responses.to_a
      array.flatten!

      role_ids_responding = event.responses.pluck(:role_id)
      roles_not_responding = Role.where.not(id: role_ids_responding)

      roles_not_responding.each do |role|
        array << Response.new(role: role)
      end
    end
  end

  def starting_event?
    encounter.starting_event == event
  end
end
