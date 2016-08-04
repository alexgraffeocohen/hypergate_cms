class NewEncounterPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def categories
    Category.all.order(:name)
  end

  def response_fields_text
    Role.order(:name).each_with_object([]) do |role, array|
      array << {
        role_name: role.name,
        input_name: role.name.underscore
      }
    end
  end

  def options
    [].tap do |array|
      array << encounter.options.to_a
      array.flatten!
      while array.length < 4 do
        array << Option.new
      end
    end
  end
end
