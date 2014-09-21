class Licenca < ActiveRecord::Base
  belongs_to :situacao_licenca

  obfuscate_id :spin => 73569015

  def codigo
    return self.to_param
  end

  def ativar
    self.situacao_licenca = SituacaoLicenca.obter_ativa
    self.save!
  end

  def cancelar
    self.situacao_licenca = SituacaoLicenca.obter_cancelada
    self.save!
  end

end
