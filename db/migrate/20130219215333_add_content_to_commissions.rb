class AddContentToCommissions < ActiveRecord::Migration
  def change
    add_column :commissions, :content, :text
  end
end
