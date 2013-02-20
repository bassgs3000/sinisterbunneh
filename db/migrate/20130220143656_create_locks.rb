class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
