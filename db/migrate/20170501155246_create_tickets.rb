class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tickets, :status
  end
end
