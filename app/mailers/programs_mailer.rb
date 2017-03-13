class ProgramsMailer < ActionMailer::Base


  add_template_helper(PostsHelper)
  default from: "#{Settings.contact_email}"

  def program_email(program)
    @program = program
    mail(to: "#{Settings.contact_email}", subject: "#{Settings.app_name}: #{program.title}")
  end
end
