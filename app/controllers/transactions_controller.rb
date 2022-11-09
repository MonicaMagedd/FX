class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    render json: @transactions.as_json()
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction.as_json()
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

    def update
      @transaction = Transaction.find_by_id(params[:id])
      if  @transaction.nil?
      render json: {"message": "not found"}, status: :not_found
      else
       if @transaction.update(transaction_params)
           render json: @transaction, status: :created
        else
           render json: @transaction.errors, status: :unprocessable_entity
        end
       end
    end

    def transaction_params
      params.permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency)
    end
end


