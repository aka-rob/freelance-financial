class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.string :category
      t.date :date
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
