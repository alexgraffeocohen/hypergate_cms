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

  def responses
    [].tap do |array|
      array << failure_event.responses.to_a
      array.flatten!

      role_ids_responding = failure_event.responses.pluck(:role_id)
      roles_not_responding = Role.where.not(id: role_ids_responding)

      roles_not_responding.each do |role|
        array << Response.new(role: role)
      end
    end
  end
end
