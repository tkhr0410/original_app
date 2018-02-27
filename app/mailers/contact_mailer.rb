class ContactMailer < ActionMailer::Base
  default from: "tkhr0410h@gmail.com"
  
  def sent(contact)

    @contact = contact

    mail(to: @contact.email, subject: "お問い合わせありがとうございます")
         
  end
  
  def sent_maneger
    @contact = contact
    mail(to: "tkhr0410h@gmail.com", subject: "お問い合わせメールが来ました")
  end

end
