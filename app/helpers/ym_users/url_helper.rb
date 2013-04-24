module YmUsers::UrlHelper
   
  def link_if_can(*args, &block)
    options = args.extract_options!
    ability_or_resource = args[block_given? ? 0 : 1]
    if ability_or_resource.is_a?(Array)
      if ability_or_resource[1].is_a?(Class) && ability_or_resource[1] < ActiveRecord::Base      
        if Rails.env.development?
          raise Exception, "Error using CanCan: Don't use can?(:#{ability_or_resource[0]}, #{ability_or_resource[1]}), use can?(:#{ability_or_resource[0]}, #{ability_or_resource[1]}.new) instead"
        else
          # this is to make sure can?(:new, Page) is replaced with can?(:new, Page.new)
          ability_or_resource[1] = ability_or_resource[1].new
        end
      end
      return "" unless can?(*ability_or_resource)
      if ability_or_resource[0].to_s == "destroy"
        args[block_given? ? 0 : 1] = ability_or_resource[1]
        options[:method] ||= :delete
      elsif !ability_or_resource[1].is_a?(ActiveRecord::Base)
        ability_or_resource[1] = ability_or_resource[1].to_s.underscore
      elsif ability_or_resource[1].new_record?
        # link_to('New page', [:new, Page.new]) errors, so change to link_to('New page', [:new, :page])
        args[block_given? ? 0 : 1] = [ability_or_resource[0], ability_or_resource[1].class.to_s.underscore]
      end
    else
      return "" unless can?(:read, ability_or_resource)
    end
    args << options
    link_to(*args, &block)
  end
  
end