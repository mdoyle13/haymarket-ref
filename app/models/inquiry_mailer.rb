class InquiryMailer < ActionMailer::Base

  def notification(inquiry)
    subject     "[HMBWEB] Contact Form Notification - #{Time.now.strftime("%Y%m%d%H%M%S")}"
    recipients  inquiry.send_to
    from        'website@haymarketbrewing.com'
		@headers['Reply-to'] = inquiry.email
    sent_on     Time.now
    body        :inquiry => inquiry
  end

end
