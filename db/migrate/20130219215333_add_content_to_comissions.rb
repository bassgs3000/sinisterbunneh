class AddContentToComissions < ActiveRecord::Migration
  def change
    add_column :comissions, :content, :text
  end
end
