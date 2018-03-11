class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.date :date
      t.string :client
      t.text :description
      t.string :location
      t.decimal :amount
      t.boolean :paid
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
