class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :telephone,  :validate => /\d[0-9]\)*\z/
  attribute :object
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Website Contact Form",
      :to => "yanisisma@msn.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
