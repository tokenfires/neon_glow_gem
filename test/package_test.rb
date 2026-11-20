ENV["RAILS_ENV"] = "test"

require "minitest/autorun"
require "tmpdir"
require "fileutils"
require "open3"
require "rubygems/package"
require "rack/mock"

ROOT = File.expand_path("..", __dir__)
PACKAGE_TEMP = File.realpath(Dir.mktmpdir("neon-glow-gem-"))
Minitest.after_run { FileUtils.remove_entry(PACKAGE_TEMP) if File.directory?(PACKAGE_TEMP) }
gem_path = File.join(PACKAGE_TEMP, "neon_glow.gem")
output, result = Open3.capture2e(Gem.ruby, "-S", "gem", "build", "neon_glow.gemspec", "--output", gem_path, chdir: ROOT)
raise output unless result.success?
PACKAGED_ROOT = File.join(PACKAGE_TEMP, "extracted")
Gem::Package.new(gem_path).extract_files(PACKAGED_ROOT)

# Load the built gem, not the checkout's lib/ or stylesheet directory.
$LOAD_PATH.unshift(File.join(PACKAGED_ROOT, "lib"))
require "neon_glow"
require "action_controller/railtie"
require "propshaft"

class PackageTestApp < Rails::Application
  config.root = File.join(PACKAGE_TEMP, "app")
  config.eager_load = false
  config.secret_key_base = "neon-glow-package-test-secret"
  config.hosts.clear
  config.logger = Logger.new(nil)
end
FileUtils.mkdir_p(PackageTestApp.config.root)
PackageTestApp.initialize!

class PackageTest < Minitest::Test
  def test_gem_preserves_stylesheets_and_documentation
    %w[tokens.css components.css].each do |name|
      path = "app/assets/stylesheets/neon_glow/#{name}"
      assert_equal File.binread(File.join(ROOT, path)), File.binread(File.join(PACKAGED_ROOT, path))
    end
    %w[README.md LICENSE CHANGELOG.md].each do |name|
      assert File.size?(File.join(PACKAGED_ROOT, name)), "missing #{name}"
    end
  end

  def test_engine_registers_the_packaged_assets
    asset_root = File.join(PACKAGED_ROOT, "app/assets/stylesheets")
    assert_includes PackageTestApp.config.assets.paths.map(&:to_s), asset_root
    assert_equal PACKAGED_ROOT, NeonGlow::Engine.root.to_s
  end

  def test_propshaft_serves_both_stylesheets_from_the_built_gem
    %w[tokens.css components.css].each do |name|
      path = ActionController::Base.helpers.stylesheet_path("neon_glow/#{name}")
      response = Rack::MockRequest.new(PackageTestApp).get(path)
      assert_equal 200, response.status, response.body
      assert_includes response.content_type, "text/css"
      assert_equal File.binread(File.join(PACKAGED_ROOT, "app/assets/stylesheets/neon_glow", name)), response.body
    end
  end
end
