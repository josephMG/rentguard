class Contact < ActiveRecord::Base
  belongs_to :agent
  has_one :agent_contact, :foreign_key => "default_contact_id"
end
