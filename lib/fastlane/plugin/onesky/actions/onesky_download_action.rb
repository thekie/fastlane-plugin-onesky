module Fastlane
  module Actions
    class OneskyDownloadAction < Action
      def self.run(params)
        Actions.verify_gem!('onesky-ruby')
        require 'onesky'

        client = ::Onesky::Client.new(params[:public_key], params[:secret_key])
        project = client.project(params[:project_id])

        UI.success "Downloading translation '#{params[:locale]}' of file '#{params[:filename]}' from OneSky to: '#{params[:destination]}'"
        resp = project.export_translation(source_file_name: params[:filename], locale: params[:locale])
        File.open(params[:destination], 'w') { |file| file.write(resp)}
      end

      def self.description
        'Download a translation file from OneSky'
      end

      def self.authors
        ['danielkiedrowski']
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
                                         raise "No project id given, pass using `project_id: 'id'`".red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :locale,
                                       env_name: 'ONESKY_DOWNLOAD_LOCALE',
                                       description: 'Locale to download the translation for',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise 'No locale for translation given'.red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :filename,
                                       env_name: 'ONESKY_DOWNLOAD_FILENAME',
                                       description: 'Name of the file to download the localization for',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise "No filename given. Please specify the filename of the file you want to download the translations for using `filename: 'filename'`".red unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :destination,
                                       env_name: 'ONESKY_DOWNLOAD_DESTINATION',
                                       description: 'Destination file to write the downloaded file to',
                                       is_string: true,
                                       optional: false,
                                       verify_block: proc do |value|
                                         raise "Please specify the filename of the desrtination file you want to download the translations to using `destination: 'filename'`".red unless (value and not value.empty?)
                                       end)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end