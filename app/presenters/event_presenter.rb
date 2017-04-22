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

  def event_results
    [].tap do |array|
      array << event.event_results.to_a
      array.flatten!

      existing_effect_ids = event.event_results.map(&:ship_effect_result).map(&:ship_effect_id)
      non_existent_effects = ShipEffect.where.not(id: existing_effect_ids)

      non_existent_effects.each do |ship_effect|
        array << EventResult.new(
          event: event,
          ship_effect_result: ShipEffectResult.new(
            ship_effect: ship_effect,
            amount: nil
          )
        )
      end
    end
  end

  def starting_event?
    encounter.starting_event == event
  end
end
