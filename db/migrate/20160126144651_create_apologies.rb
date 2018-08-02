class CreateApologies < ActiveRecord::Migration[4.2]
  def change
    create_table :apologies do |t|
      t.text :body
      t.string :image

      t.timestamps null: false
    end
  end
end
