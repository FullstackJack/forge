module Forgecms
  module PostsHelper
    def timeago(time, options = {})
      options[:class] ||= "timeago"
      content_tag(:time, time.to_s, options.merge(datetime: time.getutc.iso8601)) if time
    end

    def save_button(form)
      if form.object.new_record?
        submit_text = 'New Post'
      elsif form.object.draft?
        submit_text = 'Save Draft'
      else
        submit_text = 'Update Post'
      end
      form.submit submit_text, { class: "submit btn btn-primary" }
    end
  end
end
