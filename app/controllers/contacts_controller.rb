class ContactsController < ApplicationController
  def send_mail
  	validate = validate_contact_input
  	if validate.present? 
  	  @errors = validate
  	  render :show
  	else
      ContactMailer.contact_mail(params).deliver
      redirect_to contact_path, notice: 'Your message is delivered!'
  	end
  end

  private

  def validate_contact_input
  	errors = []
  	errors << 'Please input your name' if params[:cName].blank?
  	errors << 'Please input your email' if params[:cEmail].blank?
  	errors << 'Please input your website' if params[:cWebsite].blank?
  	errors << 'Please input your message' if params[:cMessage].blank?
  end
end
