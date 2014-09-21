class LicencaController < ApplicationController
  def get
    @licenca = Licenca.new
  end

  def thank_you
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

  def checkout

    @licenca = Licenca.new(params.require(:licenca).permit!)
    @licenca.situacao_licenca = SituacaoLicenca.obter_aguardando_pagamento
    @licenca.preco = 20
    @licenca.instalacoes = 0
    @licenca.save!

    payment = PagSeguro::Payment.new('llucca54@gmail.com', '5B2E2FB55F154A84A6F5615FD0938726', id: @licenca.to_param)

    payment.items = [
        PagSeguro::Item.new(id: @licenca.to_param, description: "XBrain Licence", amount: @licenca.preco,  quantity: 1, shipping_cost: 0,  weight: 0)
    ]

    redirect_to payment.checkout_payment_url

  end
end
