class AddCaffeineToDrinks < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :caffeine, :integer
  end
end
