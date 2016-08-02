class NewEncounterPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def categories
    Category.all.order(:name)
  end

  def response_fields_text
    response_roles.each_with_object([]) do |role, array|
      array << {
        role_name: role.name,
        input_name: role.name.underscore
      }
    end
  end

  private

  def response_roles
    Role.where.not(name: "Communications Officer").order(:name)
  end
end
