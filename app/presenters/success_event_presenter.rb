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

  def responses
    [].tap do |array|
      array << success_event.responses.to_a
      array.flatten!

      role_ids_responding = success_event.responses.pluck(:role_id)
      roles_not_responding = Role.where.not(id: role_ids_responding)

      roles_not_responding.each do |role|
        array << Response.new(role: role)
      end
    end
  end

  def event_results
    ShipEffect.all.map do |ship_effect|
      EventResult.new(
        amount: 0,
        ship_effect: ship_effect,
        event: event
      )
    end
  end
end
