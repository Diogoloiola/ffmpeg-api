module AudioServices
  class CovertAudioService
    def initialize(params = {})
      @tempfile = params[:file].tempfile.path
      @output_file_name = "#{Project.last.base_directory}/audio/#{params[:output_file_name]}"
      @to_format = params[:to_format]
    end

    def call
      Services::AudioConversionService.new(input_file_name: @tempfile, output_file_name: @output_file_name,
                                           to_format: @to_format).execute
    end
  end
end
