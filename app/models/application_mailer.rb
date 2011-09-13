class ApplicationMailer < ActionMailer::Base
  def application_notification(application)
    recipients 'jrivera@sccadv.com'
    from 'website@haymarketbrewing.com'
  	@headers['Reply-to'] = application.email
    subject '[HMBWEB] New Job Applicant'
    body :application => application
  end
  # def applicant_notification(application)
  #   recipients application.email
  #   from 'website@haymarketbrewing.com'
  #   subject 'Thanks for your Interest'
  #   body :application => application
  # end
end