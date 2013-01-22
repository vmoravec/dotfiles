module IrbRc
  module Helpers
    module Object
      def methods_
        self.methods.sort - Object.methods
      end
    end
  end
end

Object.send :include, IrbRc::Helpers::Object
