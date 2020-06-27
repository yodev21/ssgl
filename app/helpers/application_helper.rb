# frozen_string_literal: true

module ApplicationHelper
  def avatar_url(user)
    if user.nil? || user.image.file.nil?
      gravatar_id = Digest::MD5.hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    else
      user.image.url
    end
  end

  def team_icon_url(team)
    if team.nil? || team.image.file.nil?
      gravatar_id = Digest::MD5.hexdigest(team.user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    else
      team.image.url
    end
  end
end
