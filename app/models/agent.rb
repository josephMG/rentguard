class Agent < ActiveRecord::Base
  has_many :contacts
  belongs_to :contact, class_name: "Contact", :foreign_key => "default_contact_id"
  accepts_nested_attributes_for :contact, :allow_destroy => false, :reject_if => :all_blank
end
