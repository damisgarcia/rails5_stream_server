class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :chatroom, foreign_key: true
      t.string :user
      t.text :content

      t.timestamps
    end
  end
end
