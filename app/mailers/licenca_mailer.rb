class LicencaMailer < ActionMailer::Base
  default from: "licencas@xbrain.com"

  def pagamento(licenca)
    @licenca = licenca
    mail(to: @licenca.email, subject: 'Xbrain Licence')
  end

end
