module PagesHelper
  def show_user_links(**_options)
    content = ''
    content << <<-CONTENT
    CONTENT
    if user_signed_in?

      content << link_to('Sign Out', destroy_user_session_path,
                         class: ' hover:text-blue-600 dark:hover:text-blue-500',
                         data: { "turbo-method": :delete, turbo_confirm: 'Are you sure?' })
      content << '</span>'
    else
      content << link_to('Log In', new_user_session_path, class: 'hover:text-blue-600 dark:hover:text-blue-500')
      content << '</span>'
      content << link_to('Register', new_user_registration_path,
                         class: 'font-medium text-gray-500 hover:text-blue-600 md:my-6 dark:text-gray-400 hover:text-blue-600 dark:hover:text-blue-500')
    end
    content.html_safe
  end
end
