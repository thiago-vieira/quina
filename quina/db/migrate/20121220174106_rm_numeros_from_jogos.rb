class RmNumerosFromJogos < ActiveRecord::Migration
  def up
  	remove_column :jogos, :numeros
  end

  def down
  	add_column :jogos, :numeros, :string
  end
end
