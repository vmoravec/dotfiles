module IrbRc
  module Helpers
    module Object
      def methods_
        (self.methods - Object.methods).sort
      end
    end
  end
end

Object.send :include, IrbRc::Helpers::Object
