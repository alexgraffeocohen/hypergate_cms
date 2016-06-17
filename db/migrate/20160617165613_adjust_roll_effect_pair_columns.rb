class AdjustRollEffectPairColumns < ActiveRecord::Migration
  INTEGER_COLUMNS = ["credits", "ellerium", "wilkinide", "galacite", "plasma_cells", "scrap_metal", "medical_supplies"]

  def up
    INTEGER_COLUMNS.each do |integer_column|
      change_column_null :roll_effect_pairs, integer_column, false
      change_column_default :roll_effect_pairs, integer_column, 0
    end

    change_column_null :roll_effect_pairs, :refugees, false
    change_column_default :roll_effect_pairs, :refugees, false
    change_column_null :roll_effect_pairs, :effect_id, false
  end

  def down
    INTEGER_COLUMNS.each do |integer_column|
      change_column_null :roll_effect_pairs, integer_column, true
      change_column_default :roll_effect_pairs, integer_column, nil
    end

    change_column_null :roll_effect_pairs, :refugees, true
    change_column_default :roll_effect_pairs, :refugees, nil
    change_column_null :roll_effect_pairs, :effect_id, true
  end
end
