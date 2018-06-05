ActiveAdmin.register User do
  menu priority: 11
  permit_params :email, :password, :password_confirmation, :roles_mask, :building_id

  actions :all, except: %i[show]

  index do
    column :email
    column :current_sign_in_at
    column :sign_in_count
    actions
  end

  config.filters = false

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles_mask, hint: I18n.t('roles_hint')
    end
    f.actions
  end

end
