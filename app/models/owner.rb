class Owner < ActiveRecord::Base
  attr_accessible :nume,
                  :prenume,
                  :telefon1,
                  :telefon2,
                  :email1,
                  :email2,
                  :cnp,
                  :adresa,
                  :judet,
                  :localitate,
                  :tara,
                  :nume_firma,
                  :adresa_firma,
                  :nr_inregistrare,
                  :cui,
                  :comentarii,
                  :data_nasterii

  has_many :offers

  validates_presence_of :nume, :prenume, :telefon1

  scope :all_ordered, order(:nume, :prenume)
end
