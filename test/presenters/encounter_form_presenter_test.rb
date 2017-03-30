require 'test_helper'

class EncounterFormPresenterTest < ActiveSupport::TestCase
  test "#categories order categories by name" do
    encounter = encounters(:ai_planet)
    presenter = EncounterFormPresenter.new(encounter)

    categories = Category.all

    assert_equal(categories.first, categories(:habitable_planet))
    assert_equal(categories.second, categories(:gas_planet))

    presented_categories = presenter.categories

    assert_equal(presented_categories.first, categories(:gas_planet))
    assert_equal(presented_categories.second, categories(:habitable_planet))
  end
end
