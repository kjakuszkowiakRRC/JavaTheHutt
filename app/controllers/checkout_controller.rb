class CheckoutController < ApplicationController
    def create
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"],
            success_url: checkout_success_url+"?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: checkout_cancel_url,
            line_items: [
                {
                    name: "TEST",
                    description: "TEST",
                    amount: 51,
                    currency: "cad",
                    quantity: 1
                },
                {
                    name: "GST",
                    description: "Goods and Services Tax",
                    amount: 51,
                    currency: "cad",
                    quantity: 1
                }
            ]
        )
        redirect_to @session.url.to_s
        # respond_to do |format|
        #     format.js # render app/views/checkout/create.js.erb
        # end
        #pass order id from form

    end

    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    end

    def cancel

    end
end
