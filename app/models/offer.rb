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
                  :exclusiva,
                  :offer_images_attributes

  attr_accessor :new_image_token

  belongs_to :owner
  has_many :offer_images
  accepts_nested_attributes_for :offer_images, allow_destroy: true

  scope :all_ordered_and_active, where("active IS true AND status LIKE 'Activ'").order(:created_at)

  ZONE = ['Ultracentral', 'Nord', 'Central', 'Vest', 'Exterior-Vest', 'Exterior-Est', 'Exterior-Nord', 'Exterior-Sud']
  CARTIERE = ['Cantacuzino', 'Cina', 'Republicii', 'Aurora', 'Mihai Bravu', 'Bariera-Obor', 'Bariera-Bucuresti', 'Independentei', 'Cioceanu', 'Bereasca', 'Albert', 'Malu Rosu']
  def is_inactive?
    return true if !active
    return true if active && status != 'Activ'
    return false
  end

  def self.zone
    all.uniq{|o| o.zona}.map{|o| o.zona}
  end

  def self.cartiere
    all.uniq{|o| o.cartier}.map{|o| o.cartier}
  end

  def self.tipuri_oferta
    ['Apartament','Garsioniera','Casa', 'Spatiu Comercial', "Birour", "Teren extravilan", "Teren Intravilan"]
  end

  def self.tipuri_operatiune
    all.uniq{|o| o.tip_operatiune}.map{|o| o.tip_operatiune}
  end

  def create_new_image_token
    self.new_image_token = self.secure_token
  end

  def secure_token
    SecureRandom.uuid
  end

end
