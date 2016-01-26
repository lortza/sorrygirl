class CreateApologies < ActiveRecord::Migration
  def change
    create_table :apologies do |t|
      t.text :body
      t.string :image

      t.timestamps null: false
    end
  end
end
