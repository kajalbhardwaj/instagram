class PostMailer < ApplicationMailer
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