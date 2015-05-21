class CategoriesController < ApplicationController
  
  def update_categories
    if params[:service].present?
      service = Service.find(params[:service])
      categories = service.categories.order(:name).map { |c| [c.name, c.id] }
      respond_to do |format|
        format.json { render json: categories }
      end
    else
      respond_to do |format|
        format.json { render json: [] }
      end
    end
  end
end