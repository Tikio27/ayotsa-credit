ActiveAdmin.register Client do
  menu priority: 2

  permit_params :name, :address, :phone_number, :account_number, :age, :date_of_birth, :rfc,
                :employer, :work_seniority

  actions :all
  config.batch_actions = true
  batch_action :destroy, false

  index do
    column :name
    column :address
    column :phone_number
    column :account_number
    column :date_of_birth
    column :age
    column :rfc
    column :employer
    column :work_seniority
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :phone_number
      f.input :account_number
      f.input :date_of_birth, start_year: Date.today.year - 80, end_year: Date.today.year
      f.input :age
      f.input :rfc
      f.input :employer
      f.input :work_seniority

    end
    f.actions
  end

  filter :name

end

