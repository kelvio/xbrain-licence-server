class AddPrecoToLicenca < ActiveRecord::Migration
  def change
    add_column :licencas, :preco, :decimal
  end
end
