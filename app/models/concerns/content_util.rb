module ContentUtil
    extend ActiveSupport::Concern
  
  
    def reading_time(text)
      (text.split.size / 180.0).ceil
    end
  
end