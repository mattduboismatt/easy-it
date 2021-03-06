class TicketsController < ApplicationController
  before_action :load_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
    get_service_and_category_options
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.category = Category.find(params[:ticket][:category_id].to_i)
    @ticket.service = @ticket.category.service
    
    if @ticket.save
      flash[:notice] = "Ticket successfully created."
      redirect_to root_path
    else
      flash.now[:alert] = @ticket.errors.full_messages.to_sentence
      get_service_and_category_options
      render :new
    end
  end

  def show
  end

  def edit
    get_service_and_category_options
  end

  def update
    if @ticket.update_attributes(ticket_params)
      flash[:notice] = "Ticket successfully updated."
      redirect_to root_path
    else
      flash.now[:alert] = @ticket.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket successfully deleted"
    redirect_to root_path
  end

  private

  def load_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :title,
      :description,
    ).merge(user_id: current_user.id)
  end

  def get_service_and_category_options
    @services = Service.order(:name).map { |s| [s.name, s.id] }
    if @ticket.service.present?
      @categories = @ticket.service.categories.order(:name).map { |c| [c.name, c.id] }
    else
      @categories = []
    end
  end
end
