class Api::V1::MealsController < ApplicationController
  before_action :set_meal, only: %i[show update destroy]

  # GET /meals
  def index
    @meals = Meal.all

    if (filter = params[:filter])
      @meals = @meals.where('eaten_on > ?', filter.dig(:eaten_on, :gte)) if filter.dig(:eaten_on, :gte)
      @meals = @meals.where('eaten_on < ?', filter.dig(:eaten_on, :lte)) if filter.dig(:eaten_on, :lte)
    end

    render json: MealSerializer.new(@meals)
  end

  # GET /meals/1
  def show
    render json: MealSerializer.new(@meal)
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      render json: MealSerializer.new(@meal), status: :created, location: api_v1_meal_url(@meal)
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      render json: MealSerializer.new(@meal)
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def meal_params
    restify_param(:meal).require(:meal).permit(
      :id,
      :eaten_on,
      :meal_type,
      :details
    )
  end
end
