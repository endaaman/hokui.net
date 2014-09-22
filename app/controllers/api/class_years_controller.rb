class Api::ClassYearsController < Api::ApplicationController
  before_action :set_class_year, only: [:show, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @class_years = ClassYear.all
    render json: @class_years
  end

  def show
    render json: @class_year
  end

  def create
    @class_year = ClassYear.new(class_year_params)
    authorize @class_year
    if @class_year.save
      render json: @class_year, status: 201
    else
      render json: @class_year, status: 422
    end
  end

  def update
    authorize @class_year
    if @class_year.update(class_year_params)
      head 200
    else
      render json: @class_year, status: 422
    end
  end

  def destroy
    authorize @class_year
    @class_year.destroy
    head 200
  end

  private

  def set_class_year
    @class_year = ClassYear.find(params[:id])
  end

  def class_year_params
    ActionController::Parameters.new(JSON.parse(request.body.read)).
    require(:class_year).
    permit(
      :year
    )
  end
end