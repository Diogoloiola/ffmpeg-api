module Web
  module V1
    class AudiosController < ApplicationController
      def create
        result = AudioServices::CovertAudioService.new(audio_params).call
        if result
          render json: { message: 'Conversion finished' }, status: :created
        else
          render status: :unprocessable_entity
        end
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      def audio_params
        params.require(:audio).permit(:file, :output_file_name, :to_format, :quality)
      end
    end
  end
end
