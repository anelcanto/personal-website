module BlogPostsHelper
  def read_time(blog_post)
    word_count = blog_post.content.body.to_plain_text.split.size
    (word_count / 200.0).ceil
  end

  def formatted_publication_date(blog_post)
    return blog_post.published_at.strftime('%b %e') if blog_post.published_at.year == Date.current.year

    blog_post.published_at.strftime('%b %e, %Y')
  end
end
