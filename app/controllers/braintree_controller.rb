class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
  end

  def new_six
    @client_token = Braintree::ClientToken.generate
  end

  def new_one
    @client_token = Braintree::ClientToken.generate
  end

  def pricing
  end

  def checkout_one
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    customer = current_user.find_or_create_braintree_customer(nonce_from_the_client)

    result = Braintree::Subscription.create(
      :plan_id => 'hr8m',
      :payment_method_token => customer.payment_methods[0].token
      )

    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

  def checkout_six
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    customer = current_user.find_or_create_braintree_customer(nonce_from_the_client)

    result = Braintree::Subscription.create(
      :plan_id => '9s3g',
      :payment_method_token => customer.payment_methods[0].token
      )
    byebug

    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    customer = current_user.find_or_create_braintree_customer(nonce_from_the_client)

    result = Braintree::Subscription.create(
      :plan_id => 'qqfr',
      :payment_method_token => customer.payment_methods[0].token
      )
    byebug

    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
