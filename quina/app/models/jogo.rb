class Jogo < ActiveRecord::Base

  attr_accessible :bilhete_id, :numeros_attributes

  belongs_to :bilhete
  has_many :numeros

  accepts_nested_attributes_for :numeros
end
