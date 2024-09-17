class ProgramsMailer < ActionMailer::Base


  add_template_helper(EventsHelper)
  default from: "#{Rails.application.config_for(:settings).contact_email}"

  def program_email(program,email )
    @program = program
    email = email  || Rails.application.config_for(:settings).contact_email
    mail(to: "#{email}", subject: "#{Rails.application.config_for(:settings).app_name}: #{program.title}")
  end
end
