module ApplicationHelper

  def relay_errors(model)
    if model.errors.any?
      model.errors.messages.each do |column, problems|
        problems.each do |problem|
          return "#{column} - #{problem}"
        end
      end
    end
  end
end
