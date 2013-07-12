class InquiryMailer < ActionMailer::Base

  def notification(inquiry)
    subject     "[HMBWEB] Contact Form Notification - #{Time.now.strftime("%Y%m%d%H%M%S")}"
    recipients  inquiry.send_to
    from        'website@haymarketbrewing.com'
		@headers['Reply-to'] = inquiry.email
    sent_on     Time.now
    body        :inquiry => inquiry
  end
  
  def event_inquiry_notification(event_inquiry)
    subject     "[HMBWEB] Contact Form Notification - #{Time.now.strftime("%Y%m%d%H%M%S")}"
    recipients  "events@haymarketbrewing.com"
    from        'website@haymarketbrewing.com'
		@headers['Reply-to'] = event_inquiry.email
    sent_on     Time.now
    body        :event_inquiry => event_inquiry
  end
end
