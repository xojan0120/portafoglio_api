module CommonRegexp

  module_function

  def format_url
    /\Ahttp(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?/
  end
end
