class CreateComissions < ActiveRecord::Migration
  def change
    create_table :comissions do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
