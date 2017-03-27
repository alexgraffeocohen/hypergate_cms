require 'test_helper'

class EncounterTest < ActiveSupport::TestCase
  def setup
    @encounter = Encounter.new(
      category: categories(:habitable_planet),
      description: "Just a bunch of dumb humans.",
      starting_event: nil
    )
  end

  test "skips starting_event presence validation if not published" do
    @encounter.published = false

    assert(@encounter.save, "Encounter was invalid and did not save.")
  end

  test "requires starting_event when published" do
    @encounter.published = true

    assert_not(@encounter.save, "Encounter was valid and saved.")
  end

  test "published defaults to false" do
    @encounter.save

    assert_not(@encounter.published)
  end

  test "standalone defaults to true" do
    @encounter.save

    assert(@encounter.standalone)
  end
end
