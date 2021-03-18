class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit destroy update]
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Contact Created Successfully."
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact Updated Successfully."
    else
      render action: 'edit'
    end
  end

  def destroy
    if @contact.destroy
      redirect_to contacts_path, notice: "Contact Deleted Successfully."
    end
  end

  def index
    @contacts = Contact.all
  end

  def show
  end

  def edit
  end

  private
  def set_contact
    @contact = Contact.find(params[:id]) 
  end

  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end
end
