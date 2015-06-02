class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.integer :status
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
