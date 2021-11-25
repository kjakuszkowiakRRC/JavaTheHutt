# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           []
    )
    redirect_to @session.url.to_s
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end
end
