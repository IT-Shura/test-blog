module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def comment_approve_button(comment)
    url = approve_comment_url(comment)
    comment_action_button(url, :approve, t('comments.approve'))
  end
  
  def comment_decline_button(comment)
    url = decline_comment_path(comment)
    comment_action_button(url, :decline, t('comments.decline'))
  end
  
  def comment_action_button(url, action, text)
    %Q{
      <span class="waves-effect waves-light btn comment" data-url="#{url}" data-act="#{action}">#{text}</span>     
    }.html_safe
  end      
  
  
  def show_tags(post)
    return unless post.tags.any?

    out = ''
    post.tags.each do |tag|
      out << link_to(tag.name, posts_path(tag: tag.name), class: "chip")
    end
    out.html_safe
  end
  
end
