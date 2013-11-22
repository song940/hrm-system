module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 , class:'gravatar' })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}"
    image_tag(gravatar_url, alt: user.fullname, class: options[:class])
  end
=begin
  def user_path
	"/#{current_user.username}"
  end

  def user_setting_path
	"#{user_path}/setting"
  end
=end
end
