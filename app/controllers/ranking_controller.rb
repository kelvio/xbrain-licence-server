class RankingController < ApplicationController

  def index

    operacao = params[:operacao]
    simbolo = '+'
    if operacao == 'soma'
      simbolo = '+'
    elsif operacao == 'subtracao'
      simbolo = '-'
    elsif operacao == 'multiplicacao'
      simbolo = '*'
    elsif operacao == 'divisao'
      simbolo = '/'
    end

    sql = "SELECT *, CASE WHEN pontuacao_jogador_a > pontuacao_jogador_b THEN pontuacao_jogador_a ELSE pontuacao_jogador_b END AS pontuacao_vencedor FROM jogos WHERE operacao LIKE '#{ simbolo }' ORDER BY pontuacao_vencedor DESC "
    @jogos = Jogo.paginate_by_sql(sql, :page => params[:page], :per_page => 5)
    respond_to do |format|
      format.xml { render :xml => @jogos }
    end
  end
  end


  def validate

    begin
      @licenca = Licenca.find(params[:code])


      if params[:mode] == '1' #NOVA INSTALAÇÃO

        if @licenca.instalacoes == nil
          @licenca.instalacoes = 1
        else
          @licenca.instalacoes = @licenca.instalacoes + 1
        end

        @licenca.save!
      end

      respond_to do |format|
        format.xml { render :xml => @licenca, :except => [:id, :created_at, :updated_at, :preco] }
      end
    rescue
      raise ActionController::RoutingError.new('Not Found')
    end
end
