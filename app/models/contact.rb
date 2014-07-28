class Contact < ActiveRecord::Base
  validates :email, :email => true
  belongs_to :agent
  has_one :default_agent, class_name: "Agent", :foreign_key => "default_contact_id"
end
