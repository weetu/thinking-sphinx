class ThinkingSphinx::Search::Merger
  def initialize(search)
    @search = search
  end

  def merge!(query = nil, options = {})
    @search.query = query unless query.nil?
    options.each do |key, value|
      case key
      when :conditions, :with, :without
        @search.options[key] ||= {}
        @search.options[key].merge! value
      when :without_ids
        @search.options[key] ||= []
        @search.options[key] += value
      else
        @search.options[key] = value
      end
    end

    @search
  end
end
