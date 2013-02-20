class AddDeviantartAndLuluToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :deviantart, :string
    add_column :posts, :lulu, :string
  end
end
