class CustomersController < ApplicationController
  def index

  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer successfully created'
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :smoker)
  end
end
