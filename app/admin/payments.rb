# frozen_string_literal: true

ActiveAdmin.register Payment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :credit_card_number, :amount, :order_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:credit_card_number, :amount, :order_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
