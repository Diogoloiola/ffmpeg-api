module Web
  module V1
    class AudiosController < ApplicationController
      def create; end

      private

      def audio_params
        params.require(:audio).permit(:file)
      end
    end
  end
end
