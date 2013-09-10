module ApplicationHelper
	
	def nav_link(link_text, link_path)
		class_name = current_page?(link_path) || ("/#{controller_name}" == link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path
		end
	end


	def active_controller_if(name)
		(controller_name == name)  ? 'active' : ''
	end

	def nav_page_link(link_text, link_path)
		class_name = current_page?(link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path
		end
	end

	def user_path
		"/#{current_user.username}"
	end

	def user_setting_path(user)
		"#{user_path}/setting"
	end

	def pagination_links(collection, options = {})
	   options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
	   options[:class] ||= 'pagination pagination-centered'
	   options[:inner_window] ||= 2
	   options[:outer_window] ||= 1
	   will_paginate(collection, options)
	 end
	
end
