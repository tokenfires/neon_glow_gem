module NeonGlow
  class Engine < ::Rails::Engine
    initializer "neon_glow.assets" do |app|
      app.config.assets.paths << root.join("app", "assets", "stylesheets")
    end
  end
end
