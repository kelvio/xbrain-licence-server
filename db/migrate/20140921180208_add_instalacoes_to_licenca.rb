class AddInstalacoesToLicenca < ActiveRecord::Migration
  def change
    add_column :licencas, :instalacoes, :integer
  end
end
