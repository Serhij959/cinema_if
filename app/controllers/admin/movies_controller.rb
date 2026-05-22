module Admin
  class MoviesController < BaseController
    before_action :set_movie, only: [ :edit, :update, :destroy ]

    def index
      @movies = Movie.order(:title)
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)

      if @movie.save
        redirect_to admin_movies_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @movie.update(movie_params)
        redirect_to admin_movies_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @movie.destroy
      redirect_to admin_movies_path
    end

    private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(
        :title,
        :title_en,
        :genre,
        :genre_en,
        :duration,
        :duration_en,
        :age,
        :poster,
        :description,
        :description_en
      )
    end
  end
end
