class CreateJogos < ActiveRecord::Migration
  def change
    create_table :jogos do |t|
      t.string :jogador_a
      t.string :jogador_b
      t.decimal :pontuacao_jogador_a
      t.decimal :pontuacao_jogador_b

      t.timestamps
    end
  end
end
