class CreateSituacaoLicencas < ActiveRecord::Migration
  def change
    create_table :situacao_licencas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
