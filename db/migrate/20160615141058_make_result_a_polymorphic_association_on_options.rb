class MakeResultAPolymorphicAssociationOnOptions < ActiveRecord::Migration
  def change
    add_reference(:options, :result, polymorphic: true, index: true, null: false)
  end
end
