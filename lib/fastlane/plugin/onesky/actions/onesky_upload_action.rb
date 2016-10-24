module Fastlane
  module Actions
    class OneskyUploadAction < Action
      def self.run(params)
        Actions.verify_gem!('onesky-ruby')
        require 'onesky'

        client = ::Onesky::Client.new(params[:public_key], params[:secret_key])

        project = client.project(params[:project_id])

        UI.success 'Starting the upload to OneSky'
        resp = project.upload_file(
          file: params[:strings_file_path], 
          file_format: params[:strings_file_format], 
          is_keeping_all_strings: !params[:deprecate_missing],
        )

        if resp.code == 201
          UI.success "#{File.basename params[:strings_file_path]} was successfully uploaded to project #{params[:project_id]} in OneSky"
        else
          UI.error "Error uploading file to OneSky, Status code is #{resp.code}"
        end

      end

      def self.description
        'Upload a strings file to OneSky'
      end

      def self.authors
        ['JMoravec', 'joshrlesch']
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :public_key,
                                       env_name: 'ONESKY_PUBLIC_KEY',
                                       description: 'Public key for OneSky',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise "No Public Key for OneSky given, pass using `public_key: 'token'`".red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :secret_key,
                                       env_name: 'ONESKY_SECRET_KEY',
                                       description: 'Secret Key for OneSky',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise "No Secret Key for OneSky given, pass using `secret_key: 'token'`".red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :project_id,
                                       env_name: 'ONESKY_PROJECT_ID',
                                       description: 'Project Id to upload file to',
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise 'No project id given'.red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :strings_file_path,
                                       env_name: 'ONESKY_STRINGS_FILE_PATH',
                                       description: 'Base file path for the strings file to upload',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise "Couldn't find file at path '#{value}'".red unless File.exist?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :strings_file_format,
                                       env_name: 'ONESKY_STRINGS_FORMAT',
                                       description: 'Format of the strings file: see https://github.com/onesky/api-documentation-platform/blob/master/reference/format.md',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise 'No file format given'.red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :deprecate_missing,
                                       env_name: 'ONESKY_DEPRECATE_MISSING',
                                       description: 'Should missing phrases be marked as deprecated in OneSky?',
                                       is_string: false,
                                       optional: true,
                                       default_value: false)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end