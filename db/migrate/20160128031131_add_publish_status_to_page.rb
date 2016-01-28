class AddPublishStatusToPage < ActiveRecord::Migration
  def change
    add_column :pages, :publish_status, :string, default: "Published"
  end
end
