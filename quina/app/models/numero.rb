class Numero < ActiveRecord::Base
  belongs_to :jogo
  attr_accessible :numero, :jogo_id

end
