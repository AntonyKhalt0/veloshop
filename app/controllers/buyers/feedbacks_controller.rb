module Buyers
  class FeedbacksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_feedback, only: %i[new create destroy]

    def index
      @feedbacks = Feedback.where(buyer_id: current_user)
    end

    def new; end

    def create
      @feedback = current_user.feedbacks.build(feedback_params)

      if @feedback.save
        redirect_to @feedback.product
      else
        flash[:alert] = 'Возможна ошибка, отзыв не был оставлен!'
      end
    end

    def destroy
      @feedback.destroy
      redirect_to @feedback.product
    end

    private

    def feedback_params
      params.require(:feedback).permit(:body, :score, :product_id)
    end

    def get_feedback
      @feedback = params[:id] ? Feedback.find(params[:id]) : Feedback.new
    end
  end
end
