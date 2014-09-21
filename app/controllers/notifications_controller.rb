class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    return unless request.post?

    email = "llucca54@gmail.com"
    token = "5B2E2FB55F154A84A6F5615FD0938726"
    notification_code = params[:notificationCode]

    notification = PagSeguro::Notification.new(email, token, notification_code)

    if notification.approved?
      # Idealmente faça alguns testes de sanidade, como notification.gross_amount, notification.item_count, etc
      # notification.id referencia o id do payment/invoice, caso tenha sido configurado
      # transacation_id identifica o código da transação no pag seguro
      #Invoice.find(notification.id).approve!(notification.transaction_id)
      @licenca = Licenca.find(notification.id)
      @licenca.ativar
      LicencaMailer.pagamento(@licenca).deliver
    end

    if notification.cancelled? || notification.returned?
      Licenca.find(notification.id).cancelar
    end

    render :nothing => true
  end
end
