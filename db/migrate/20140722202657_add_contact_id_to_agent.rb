class AddContactIdToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :default_contact_id, :integer, :nullable=>true, :unsigned => true
  end
end
