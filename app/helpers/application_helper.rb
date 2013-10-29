module ApplicationHelper
   def authentication_menu #intelligen nav
    #Build a list of links depending on the user's permission.
    links = ""
    if @user_authenticated.present?
      if false # @user_authenticated.is_admin
        links += "<li>#{link_to('Show Users', users_path)}</li>"
      end
      links += "<li>#{link_to("#{@user_authenticated.name}", user_path(@user_authenticated))}</li>"
      links += "<li>#{link_to('Logout '+ @user_authenticated.name, login_path, :method => 'delete',
                                :confirm => 'Are you sure>') }</li>"
    elsif @company_authenticated.present?
       if false # @user_authenticated.is_admin
        links += "<li>#{link_to('Show Companies', users_path)}</li>"
      end
      links += "<li>#{link_to("Edit #{@company_authenticated.name}'s Profile", edit_companies_path)}</li>"
      links += "<li>#{link_to('Logout '+ @company_authenticated.name, company_login_path, :method => 'delete',
                                :confirm => 'Are you sure>') }</li>"

    else
      links += "<li>#{link_to('User Login', login_path) }</li>"
      links += "<li>#{link_to('Company Login', companies_login_path) }</li>"
    end

  end
end
