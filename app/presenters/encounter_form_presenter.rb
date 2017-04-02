class EncounterFormPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def categories
    Category.all.order(:name)
  end
end
