class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
