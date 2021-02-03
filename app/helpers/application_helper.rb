module ApplicationHelper

    def render_nav_bar
      if logged_in?
        render partial: 'layouts/logged_in_links'
      end
  end



end
