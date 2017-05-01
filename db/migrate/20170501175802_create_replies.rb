class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
