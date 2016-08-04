class SiteConfig

  class MissingConfigurationError < RuntimeError; end

  def self.method_missing(method_name, *args, &block)
    if respond_to?(method_name)
      self.class.send(:define_method, method_name) do
        site_config[method_name]
      end
      return send(method_name)
    end
    raise MissingConfigurationError.new("No site configuration exists for `#{method_name}'")
  end

  def self.respond_to?(*args)
    site_config.has_key?(args[0])
  end

  def self.config_file_path
    File.join(Rails.root, 'config/site.yml')
  end

  private

  def self.site_config
    @site_config ||= HashWithIndifferentAccess.new(YAML.load(File.read(config_file_path)))
  end

end
