module PagesHelper
  def show_user_links(**_options)
    content = ''
    content << <<-CONTENT
    <span class="flex items-center gap-x-2 font-medium text-gray-500 hover:text-blue-600 md:border-s md:border-gray-300 md:my-6 md:ps-6 dark:border-gray-700 dark:text-gray-400 dark:hover:text-blue-500" href="#">
    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
    CONTENT
    if user_signed_in?
      content << link_to('Sign Out', destroy_user_session_path, data: { "turbo-method": :delete })
      content << '</span>'
    else
      content << link_to('Log In', new_user_session_path)
      content << '</span>'
      content << link_to('Register', new_user_registration_path,
                         class: 'font-medium text-gray-500 hover:text-blue-600 md:my-6 dark:text-gray-400 dark:hover:text-blue-500')
    end
    content.html_safe
  end
end
