module ApplicationHelper

  def navigation_partial
    "layouts/navigation_#{user_signed_in? ? 'signedin' : 'anon'}"
  end
end
