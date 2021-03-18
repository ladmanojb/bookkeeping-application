class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = Transaction.order('created_at desc').page params[:page]
    if params[:transaction_type]
      @transactions = @transactions.where(transaction_type: params[:transaction_type])
    end
    if params[:contact_id]
      @transactions = @transactions.where(contact_id: params[:contact_id])
    end
    @contactsHash = Contact.get_contacts
  end

  def new
    @transaction = Transaction.new
    @contactsHash = Contact.get_contacts
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save 
      redirect_to transactions_path, notice: "Transaction Created Successfully."
    else
      render :new
    end
  end

  def update
     if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: "Transaction Updated Successfully."
    else
      render action: "edit"
    end
  end

  def destroy
    if @transaction.destroy
      redirect_to transactions_path, notice: "Transaction Deleted Successfully."
    end
  end

  def show
  end

  def edit
  end

  def filter
  end
  
  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :contact_id)
  end
end
