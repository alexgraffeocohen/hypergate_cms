class NewEncounterService
  attr_reader :encounter

  def initialize(attributes)
    @attributes = attributes
    @encounter = Encounter.new(
      category: Category.find(attributes[:category_id]),
      description: attributes[:description],
      options_attributes: attributes[:options_attributes],
      responses_attributes: attributes[:responses_attributes]
    )
  end

  def save
    if encounter.valid?
      encounter.save
    else
      false
    end
  end

  private

  attr_reader :attributes
end
