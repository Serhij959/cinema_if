module Admin
  class PromotionsController < BaseController
    before_action :set_promotion, only: [ :edit, :update, :destroy ]

    def index
      @promotions = Promotion.order(created_at: :desc)
    end

    def new
      @promotion = Promotion.new(active: true)
    end

    def create
      @promotion = Promotion.new(promotion_params)

      if @promotion.save
        redirect_to admin_promotions_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @promotion.update(promotion_params)
        redirect_to admin_promotions_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @promotion.destroy
      redirect_to admin_promotions_path
    end

    private

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(
        :title,
        :title_en,
        :image,
        :description,
        :description_en,
        :active
      )
    end
  end
end
