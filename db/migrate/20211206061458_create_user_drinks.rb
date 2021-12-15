class CreateUserDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_drinks do |t|
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :drink, null: false, foreign_key: true

      t.timestamps
    end
  end
end
