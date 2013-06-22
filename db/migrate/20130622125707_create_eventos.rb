class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.text :descripcion
      t.references :persona, index: true

      t.timestamps
    end
  end
end
