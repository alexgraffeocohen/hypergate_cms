class EncounterPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def title
    encounter.title || default_title
  end

  def category
    encounter.category.name.titleize
  end

  def description
    encounter.description
  end

  def events
    encounter.events
  end

  private

  def default_title
    "Encounter ##{encounter.id}"
  end
end
