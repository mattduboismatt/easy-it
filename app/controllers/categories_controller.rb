class CategoriesController < ApplicationController
  
  def update_categories
    service = Service.find(params[:service])
    categories = service.categories.order(:name).map { |c| [c.name, c.id] }
    respond_to do |format|
      format.json { render json: categories }
    end
  end
end