class Message < ActiveRecord::Base
  attr_accessible :email, :mesaj, :nume, :offer_id

  belongs_to :offer
end
