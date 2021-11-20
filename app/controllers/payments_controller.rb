class PaymentsController < ApplicationController
    def create
      @order = Order.find(params[:order_id])
      @payment = @order.payments.create(payment_params)
      redirect_to order_path(@order)
    end

    def show
      @payment = Payment.find(params[:id])
    end

    private
      def payment_params
        params.require(:payment).permit(:credit_card_number, :amount)
      end
  end
end
