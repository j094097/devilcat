class HomeController < ApplicationController
  def index

    @results = {}

    Estate.order(custom_timestamp: :asc).find_each do |estate|
      @results.merge!( [ estate.role_id, estate.custom_timestamp.strftime('%Y-%m-%d %H-%M')] => estate.value)
    end

  end
end
