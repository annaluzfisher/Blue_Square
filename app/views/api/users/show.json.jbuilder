json.user do 
  json.extract! @user, :id, :email, :first_name, :last_name, :company_name, :mailing_list
  json.cart  @user.cart ? @user.cart.id : 'null'
end