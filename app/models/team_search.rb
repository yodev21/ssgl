# frozen_string_literal: true

class TeamSearch
  include ActiveModel::Model

  attr_accessor :search_name

  def execute
    Team.ransack(name_cont: @search_name).result
  end
end
