class Autocomplete
  def autocomplete(content, model, attr)
    unless content == '' || content == ' '
      response = model.where("#{attr} ILIKE ?", "%#{content}%")
    end
  end
end