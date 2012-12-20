class CreateNumeros < ActiveRecord::Migration
  def change
    create_table :numeros do |t|
      t.integer :numero
      t.references :jogo

      t.timestamps
    end
    add_index :numeros, :jogo_id
  end
end
