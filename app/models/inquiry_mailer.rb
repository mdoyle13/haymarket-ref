class InquiryMailer < ActionMailer::Base

  def notification(inquiry, request)
    subject     '[HMBWEB] Contact Form Notification'
    recipients  inquiry.send_to
    from        'website@haymarketbrewing.com'
		@headers['Reply-to'] = contact.email
    sent_on     Time.now
    body        :inquiry => inquiry
  end

end
