class CreateBilhetes < ActiveRecord::Migration
  def change
    create_table :bilhetes do |t|
      t.integer :usuario
      t.string :tipo
      t.integer :concurso_inicial
      t.integer :concurso_final

      t.timestamps
    end
  end
end
