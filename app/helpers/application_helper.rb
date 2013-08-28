module ApplicationHelper
	def nav_link(link_text, link_path)
		class_name = current_page?(link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path
		end
	end
	
	def render_subnav
		temp = "app/views/#{controller_name}/_subnav.html.erb"
		render file: temp if File.exist? temp
	end
end
