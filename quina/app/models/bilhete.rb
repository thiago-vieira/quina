class Bilhete < ActiveRecord::Base
  attr_accessible :concurso_final, :concurso_inicial, :tipo, :usuario, :jogos_attributes

  has_many :jogos

  accepts_nested_attributes_for :jogos

end
