module ApplicationHelper
  def avatar_url(user)
    if user.image.file.nil?
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    else
      user.image.url
    end
  end
end
