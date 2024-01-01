# frozen_string_literal: true

module ApplicationHelper
  def show_avatar(dimensions = [100, 100], class_name = 'inline-block h-[3.875rem] w-[3.875rem] rounded-full')
    return (render 'shared/default_avatar') unless @owner.avatar.attached?

    image_tag(@owner.avatar.variant(resize_to_limit: dimensions), class: class_name).html_safe
  end

  def set_published_posts
    @blog_posts = BlogPost.published
  end

  def comment; end
end
