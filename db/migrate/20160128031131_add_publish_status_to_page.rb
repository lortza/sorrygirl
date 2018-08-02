class AddPublishStatusToPage < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :publish_status, :string, default: "Published"
  end
end
