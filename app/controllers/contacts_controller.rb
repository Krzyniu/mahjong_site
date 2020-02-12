class ContactsController < ApplicationController

  def new
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        @contact = Contact.new
        format.js { flash[:success] =  "Dziękujemy za wiadomość, wkrótce się odezwiemy"}
        redirect_to new_contact_path 
       
      else
        format.js { flash[:success] =  "Wystąpił błąd, wiadomość nie została przesłana"}
        redirect_to new_contact_path 
      end
    end
  end
end