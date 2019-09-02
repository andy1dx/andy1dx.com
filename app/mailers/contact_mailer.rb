class ContactMailer < ApplicationMailer
  default from: "andy.haz3@gmail.com"

  def contact_mail(content)
  	@content = content
    mail(to: "andy.haz3@gmail.com", subject: 'Email  From Blog SITE')
  end
end
