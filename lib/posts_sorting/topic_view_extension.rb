# frozen_string_literal: true

module DiscoursePostsSorting
  module TopicViewExtension
    def initialize(topic_or_topic_id, user = nil, options = {})
      super
      @posts = @posts.reorder(created_at: :asc)
    end
  end
end
