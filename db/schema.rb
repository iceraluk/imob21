# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141117161716) do

  create_table "clients", :force => true do |t|
    t.string   "titlu"
    t.string   "tip_cerere"
    t.string   "judet"
    t.string   "oras"
    t.string   "cartier"
    t.string   "zone"
    t.string   "tip_proprietate"
    t.datetime "data_limita"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "offers", :force => true do |t|
    t.string   "titlu"
    t.boolean  "active"
    t.string   "tip_oferta"
    t.string   "tip_operatiune"
    t.integer  "nr_camere"
    t.integer  "dormitoare"
    t.integer  "confort"
    t.integer  "suprafata_utila_mp"
    t.integer  "nr_bai"
    t.integer  "nr_balcoane"
    t.integer  "etaj"
    t.integer  "nr_etaje"
    t.integer  "nr_bucatarii"
    t.string   "parcare"
    t.integer  "locuri_parcare"
    t.string   "conditii"
    t.string   "incalzire"
    t.string   "orientare"
    t.string   "compartimentare"
    t.boolean  "mansarda_imobil"
    t.boolean  "demisol"
    t.string   "acoperis"
    t.string   "structura"
    t.integer  "nivele"
    t.integer  "anul_constructiei"
    t.string   "disponibilitate"
    t.string   "video"
    t.string   "judet"
    t.string   "localitate"
    t.string   "cartier"
    t.string   "zona"
    t.string   "adresa"
    t.string   "cod_postal"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "pret_vanzare"
    t.string   "moneda"
    t.integer  "pret_inchiriere"
    t.string   "pret_per"
    t.string   "comision"
    t.integer  "negociabil"
    t.boolean  "sursa"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
