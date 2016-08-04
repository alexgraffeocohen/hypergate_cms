class EncounterPresenter
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

  def responses
    [].tap do |array|
      array << encounter.responses.to_a
      array.flatten!

      role_ids_responding = encounter.responses.pluck(:role_id)
      roles_not_responding = Role.where.not(id: role_ids_responding)

      roles_not_responding.each do |role|
        array << Response.new(role: role)
      end
    end
  end
end
