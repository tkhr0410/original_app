class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.sent(@contact).deliver 
      ContactMailer.sent_maneger.deliver 
      
      flash[:success] = "送信完了です"
      redirect_to root_url
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content, :age)
    end
          
end
