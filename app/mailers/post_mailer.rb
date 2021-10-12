class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.new_post.subject
  #
  
def new_post
  # post = Post.find(post_id)
  # @post = Post.first
  post = Post.first
  attachments["post_#{post.id}.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(template: 'posts/show.html.erb', layout: 'pdf.html.erb', pdf: 'filename')
  )
  mail to: "to@example.org"
end
end