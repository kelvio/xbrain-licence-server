class CreateLicencas < ActiveRecord::Migration
  def change
    create_table :licencas do |t|
      t.string :nome
      t.string :email
      t.references :situacao_licenca, index: true

      t.timestamps
    end
  end
end
