class Offer < ActiveRecord::Base
  attr_accessible :titlu,
                  :active,
                  :tip_oferta,
                  :tip_operatiune,
                  :nr_camere,
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
                  :addresa,
                  :cod_postal,
                  :latitude,
                  :longitude,
                  :pret_vanzare,
                  :moneda,
                  :pret_inchiriere,
                  :pret_per,
                  :commission,
                  :negociabil,
                  :sursa
end
