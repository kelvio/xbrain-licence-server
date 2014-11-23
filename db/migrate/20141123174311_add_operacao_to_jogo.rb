class AddOperacaoToJogo < ActiveRecord::Migration
  def change
    add_column :jogos, :operacao, :string
  end
end
