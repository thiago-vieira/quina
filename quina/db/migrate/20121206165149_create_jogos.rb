class CreateJogos < ActiveRecord::Migration
  def change
    create_table :jogos do |t|
      t.references :bilhete
      t.string :numeros

      t.timestamps
    end
    add_index :jogos, :bilhete_id
  end
end
