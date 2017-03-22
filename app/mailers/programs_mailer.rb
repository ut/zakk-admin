class ProgramsMailer < ActionMailer::Base


  add_template_helper(PostsHelper)
  default from: "#{Settings.contact_email}"

  def program_email(program,email )
    @program = program
    email = email  || Settings.contact_email
    mail(to: "#{email}", subject: "#{Settings.app_name}: #{program.title}")
  end
end
