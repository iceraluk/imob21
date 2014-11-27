class Offer < ActiveRecord::Base
  attr_accessible :titlu,
                  :active,
                  :tip_oferta,
                  :tip_operatiune,
                  :nr_camere,
                  :dormitoare,
                  :confort,
                  :suprafata_utila_mp,
                  :nr_bai,
                  :nr_balcoane,
                  :etaj,
                  :nr_etaje,
                  :nr_bucatarii,
                  :parcare,
                  :locuri_parcare,
                  :conditii,
                  :incalzire,
                  :orientare,
                  :compartimentare,
                  :mansarda_imobil,
                  :demisol,
                  :acoperis,
                  :structura,
                  :nivele,
                  :anul_constructiei,
                  :disponibilitate,
                  :video,
                  :judet,
                  :localitate,
                  :cartier,
                  :zona,
                  :adresa,
                  :cod_postal,
                  :latitude,
                  :longitude,
                  :pret_vanzare,
                  :moneda, #'RON', 'EUR', 'USD'
                  :pret_inchiriere,
                  :pret_per,
                  :comision,
                  :negociabil,
                  :sursa,
                  :owner_id,
                  :status, #"Activ", "Inchiriat", "Tranzactionat"
                  :exclusiva

  belongs_to :owner
  has_many :offer_images


  def is_inactive?
    return true if !active
    return true if active && status != 'Activ'
    return false
  end
end
