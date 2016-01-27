class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.string :heading
      t.text :body

      t.timestamps null: false
    end
  end
end
