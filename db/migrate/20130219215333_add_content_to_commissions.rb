class AddContentToCommissions < ActiveRecord::Migration
  def change
    add_column :commissions, :content, :text, default: "Content goes here"
  end
end
