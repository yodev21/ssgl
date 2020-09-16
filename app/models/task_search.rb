# frozen_string_literal: true

class TaskSearch
  include ActiveModel::Model

  attr_accessor :search_title

  def execute
    Task.ransack(title_cont: @search_title).result
  end
end
