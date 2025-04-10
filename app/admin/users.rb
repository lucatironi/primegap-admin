ActiveAdmin.register User do
  permit_params :email_address, :password, :password_confirmation, :company_id

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  index do
    selectable_column
    id_column
    column :email_address
    column :company
    column :created_at
    actions
  end

  filter :email_address
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email_address
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Company" do
      f.input :company
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email_address
      row :company
      row :created_at
      row :updated_at
    end
    panel "Sessions" do
      table_for user.sessions do
        column :ip_address
        column :user_agent
        column :created_at
      end
    end
  end
end
