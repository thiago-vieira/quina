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

ActiveRecord::Schema.define(:version => 20121220174106) do

  create_table "bilhetes", :force => true do |t|
    t.integer  "usuario"
    t.string   "tipo"
    t.integer  "concurso_inicial"
    t.integer  "concurso_final"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "jogos", :force => true do |t|
    t.integer  "bilhete_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jogos", ["bilhete_id"], :name => "index_jogos_on_bilhete_id"

  create_table "numeros", :force => true do |t|
    t.integer  "numero"
    t.integer  "jogo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "numeros", ["jogo_id"], :name => "index_numeros_on_jogo_id"

end
