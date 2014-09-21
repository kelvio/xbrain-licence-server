class SituacaoLicenca < ActiveRecord::Base

  def self.obter_aguardando_pagamento
    return SituacaoLicenca.find(1)
  end

  def self.obter_cancelada
    return SituacaoLicenca.find(2)
  end

  def self.obter_ativa
    return SituacaoLicenca.find(3)
  end

  def to_s
    return self.nome
  end

end
