# name: discourse-posts-sorting-plugin
# about: Updates posts sorting based on created_at field
# version: 0.0.1
# authors: Awesome Plugin Developer
# url: https://github.com/CochOrg/discourse-posts-sorting-plugin

after_initialize do
  module ::DiscoursePostsSorting
    PLUGIN_NAME = "discourse-posts-sorting"

    class Engine < ::Rails::Engine
      isolate_namespace DiscoursePostsSorting
    end
  end

  %w[
    lib/posts_sorting/topic_view_extension.rb
    lib/posts_sorting/reviewable_queued_post_extension.rb
  ].each { |path| require_relative path }

  reloadable_patch do
    TopicView.class_eval { prepend DiscoursePostsSorting::TopicViewExtension }
    ReviewableQueuedPost.class_eval { prepend DiscoursePostsSorting::ReviewableQueuedPostExtension }
  end
end
