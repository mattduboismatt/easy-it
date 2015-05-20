class ServicesController < ApplicationController

  def update_categories
    if params[:service].present?
      service = Service.find(params[:service])
      @categories = service.categories
    else
      @categories = []
    end
  end
end