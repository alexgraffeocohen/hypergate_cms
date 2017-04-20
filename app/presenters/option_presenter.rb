class OptionPresenter
  attr_reader :option, :event

  def initialize(option)
    @option = option
  end

  def event
    option.event
  end

  def encounter
    event.encounter
  end

  def skill_check
    option.skill_check || SkillCheck.new
  end
end
