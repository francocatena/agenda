class AddPasswordDigestToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :password_digest, :string
  end
end
