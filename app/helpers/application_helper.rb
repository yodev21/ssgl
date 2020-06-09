module ApplicationHelper
  def avatar_url(user)
    return user.image unless user.image.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end
end
