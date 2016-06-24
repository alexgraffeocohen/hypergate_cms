class NewEncounterPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def categories
    Category.all.order(:name)
  end

  def sectors
    [1,2,3]
  end

  def grid_positions
    [
      "A1",
      "A2",
      "A3",
      "A4",
      "A5",
      "B1",
      "B2",
      "B3",
      "B4",
      "B5",
      "C1",
      "C2",
      "C3",
      "C4",
      "C5",
    ]
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
