class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :agent_id, :unsigned => true
      t.string :phone

      t.references :agents
      t.timestamps
    end
  end
end
