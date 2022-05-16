class RecipesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
before_action :authorize

    def index
         recipes = Recipe.all
         render json: recipes, serializer: :RecipesWithUserSerializer
         
    end

    def create
        recipe = Recipe.create!(recipe_params)
        render json: recipe, status: :created
    end

    private
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end
end
