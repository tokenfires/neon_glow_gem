require_relative "lib/neon_glow/version"

Gem::Specification.new do |spec|
  spec.name          = "neon_glow"
  spec.version       = NeonGlow::VERSION
  spec.authors       = ["Claude (Anthropic)", "TokenFires"]
  spec.email         = []

  spec.summary       = "A dark neon glow design system for Bootstrap and Tailwind CSS"
  spec.description   = "4 color palettes (Rainbow, Unicorn, Cinematic, Pink), 3 intensity " \
                        "levels (Subtle, Medium, Intense), and a full component library with " \
                        "glowing buttons, gradient borders, neon text, and more. Pure CSS " \
                        "custom properties -- works with any framework or standalone."
  spec.homepage      = "https://github.com/tokenfires/neon_glow_gem"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir[
    "lib/**/*",
    "app/**/*",
    "LICENSE",
    "README.md",
    "CHANGELOG.md"
  ]

  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 7.0"
end
