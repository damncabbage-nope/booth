require 'securerandom'

module Auth
  module Token
    module_function

    def param
      :tk
    end

    def generate
      SecureRandom.urlsafe_base64(72)
    end
  end
end
