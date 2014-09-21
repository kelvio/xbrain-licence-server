ActiveAdmin.register Licenca do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :nome, :email, :situacao_licenca_id, :preco

  menu :label => "Licenças"

  index do
    column :id
    column :codigo
    column :instalacoes
    column :nome
    column :email
    column :situacao_licenca
    column :created_at
    column :updated_at
    default_actions
  end

end
