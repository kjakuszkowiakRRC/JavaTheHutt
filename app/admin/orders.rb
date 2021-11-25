# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :price, :shipped_date, :status, :paid_date, :user_id, :tax_amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :shipped_date, :status, :paid_date, :user_id, :tax_amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
