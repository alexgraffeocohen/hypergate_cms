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

  def responses
    attributes[:responses].select { |role_name, text|
      text.present?
    }.map do |role_name, text|
      Response.new(
        role: Role.find_by(name: role_name.titleize),
        text: text
      )
    end
  end

  def options
    attributes[:options].select { |order, text|
      text.present?
    }.map do |order, text|
      Option.new(
        order: order.to_i,
        text: text
      )
    end
  end
end
