ActiveAdmin.register Company do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name

  form do |f|
    f.inputs "Company Details" do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
    panel "Customers" do
      table_for company.customers do
        column :full_name
        column :email
        column :phone
        column :created_at
        column :updated_at
      end
    end
  end
end
