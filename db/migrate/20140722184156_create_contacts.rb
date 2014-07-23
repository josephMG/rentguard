class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :agent_id, :unsigned => true
      t.string :email

      t.timestamps
    end
  end
end
