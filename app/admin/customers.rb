ActiveAdmin.register Customer do
  belongs_to :company, optional: true
  permit_params :email, :full_name, :first_name, :last_name, :phone, :company_id

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone
    column :company
    column :created_at
    actions
  end

  filter :email
  filter :full_name

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
    end
    f.inputs "Company" do
      f.input :company
    end
    f.actions
  end
end