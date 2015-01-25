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
                  :admin_id,
                  :status, #"Activ", "Inchiriat", "Tranzactionat"
                  :exclusiva,
                  :offer_images_attributes,
                  :descriere

  attr_accessor :new_image_token

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  belongs_to :owner
  belongs_to :admin
  has_many :offer_images
  accepts_nested_attributes_for :offer_images, allow_destroy: true

  scope :all_ordered_and_active, where("active IS true AND status LIKE 'Activ'").order(:created_at)

  ZONE = ['Ultracentral', 'Nord', 'Central', 'Vest', 'Exterior-Vest', 'Exterior-Est', 'Exterior-Nord', 'Exterior-Sud']
  CARTIERE = ['Cantacuzino', 'Cina', 'Republicii', 'Aurora', 'Mihai Bravu', 'Bariera-Obor', 'Bariera-Bucuresti', 'Independentei', 'Cioceanu', 'Bereasca', 'Albert', 'Malu Rosu']
  TIPURI_OFERTA = ['Apartament','Garsioniera','Casa', 'Spatiu Comercial', "Birouri", "Teren extravilan", "Teren Intravilan"]

  def full_street_address
    adresa.to_s + ', ' + localitate.to_s + ', Prahova, Romania'
  end

  def is_inactive?
    return true if !active
    return true if active && status != 'Activ'
    return false
  end

  def create_new_image_token
    self.new_image_token = self.secure_token
  end

  def secure_token
    SecureRandom.uuid
  end

  def self.zone
    all.uniq{|o| o.zona}.map{|o| o.zona}
  end

  def self.cartiere
    all.uniq{|o| o.cartier}.map{|o| o.cartier}
  end

  def self.tipuri_operatiune
    all.uniq{|o| o.tip_operatiune}.map{|o| o.tip_operatiune}
  end

  def self.search(search)
    # "zone"=>"oricare",
    #     "cartier"=>"oricare",
    #     "tip-operatiune"=>"oricare",
    #     "tip-oferta"=>"oricare",
    #     "nr-camere"=>"oricat",
    #     "min-price"=>"Oricat",
    #     "max-price"=>"Oricat",
    condition = ""
    if search['zone'] && search['zone'] != "oricare"
      condition << "lower(zona) LIKE '" + search["zone"].downcase.to_s + "'"
    end

    if search['tip-operatiune'] && search['tip-operatiune'] != "oricare"
      condition << " AND " if !condition.empty?
      condition << "lower(tip_operatiune) LIKE '" + search["tip-operatiune"].downcase.to_s + "'"
    end

    if search['cartier'] && search['cartier'] != "oricare"
      condition << " AND " if !condition.empty?
      condition << "lower(cartier) LIKE '" + search["cartier"].downcase.to_s + "'"
    end

    if search['tip-oferta'] && search['tip-oferta'] != "oricare"
      condition << " AND " if !condition.empty?
      condition << "lower(tip_oferta) LIKE '" + search["tip-oferta"].downcase.to_s + "'"
    end

    if search['nr-camere'] && search['nr-camere'] != "oricat"
      condition << " AND " if !condition.empty?
      condition << "nr_camere = " + search["nr-camere"].to_i.to_s
    end

    if search['min-price'] && search['min-price'] != ""
      condition << " AND " if !condition.empty?
      if search["max-price"].include?('.')
        price = search["min-price"].gsub!(/\./,"")
      elsif search["min-price"].include?(',')
        price = search["min-price"].gsub!(/\,/,"")
      else
        price = search["min-price"]
      end
      if search['tip-operatiune'].downcase == "inchiriere"
        condition << "pret_inchiriere > " + price.to_i.to_s
      elsif search['tip-operatiune'].downcase == "vanzare"
        condition << "pret_vanzare > " + price.to_i.to_s
      else
        condition << "(pret_vanzare > " + price.to_i.to_s + " OR pret_inchiriere > " + price.to_i.to_s + ")"
      end
    end

    if search['max-price'] && search['max-price'] != ""
      condition << " AND " if !condition.empty?
      if search["max-price"].include?('.')
        price = search["max-price"].gsub!(/\./,"")
      elsif search["max-price"].include?(',')
        price = search["max-price"].gsub!(/\,/,"")
      else
        price = search["max-price"]
      end
      if search['tip-operatiune'].downcase == "inchiriere"
        condition << "pret_inchiriere < " + price.to_i.to_s
      elsif search['tip-operatiune'].downcase == "inchiriere"
        condition << "pret_vanzare < " + price.to_i.to_s
      else
        condition << "(pret_vanzare < " + price.to_i.to_s + " AND pret_inchiriere < " + price.to_i.to_s + ")"
      end
    end

    if !condition.empty?
      find(:all, :conditions => [condition])
    else
      find(:all)
    end

  end

end
