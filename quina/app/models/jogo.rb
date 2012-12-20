class Jogo < ActiveRecord::Base
  belongs_to :bilhete
  attr_accessible :numeros
  serialize :numeros, Array
end
