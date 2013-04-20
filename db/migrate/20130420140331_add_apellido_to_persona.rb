class AddApellidoToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :apellido, :string
  end
end
