# Neon Glow

**A dark neon glow design system for Bootstrap and Tailwind CSS.**

12 color palettes. 4 intensity levels. Pure CSS custom properties. Works with any framework or standalone.

[![Gem Version](https://badge.fury.io/rb/neon_glow.svg)](https://rubygems.org/gems/neon_glow)

**[See the live demo](https://github.com/tokenfires/rails_neon_glow)** -- Kitchen sink showcases for both Tailwind and Bootstrap with all palettes and intensities.

<p align="center">
  <a href="https://github.com/tokenfires/rails_neon_glow">
    <img src="https://raw.githubusercontent.com/tokenfires/rails_neon_glow/main/docs/gifs/home_800x560.gif" alt="Neon Glow demo -- palette switching">
  </a>
</p>

---

## Installation

Add to your Gemfile:

```ruby
gem "neon_glow"
```

Then run:

```bash
bundle install
```

The gem is a Rails Engine that automatically adds the stylesheets to your asset paths.

---

## Usage in Rails

### With Propshaft / Importmap (Rails 7+)

Link the stylesheets in your layout:

```erb
<%= stylesheet_link_tag "neon_glow/tokens", "data-turbo-track": "reload" %>
<%= stylesheet_link_tag "neon_glow/components", "data-turbo-track": "reload" %>
```

### With Tailwind CSS

Link the gem stylesheets after your compiled Tailwind stylesheet, so Tailwind does not need to resolve a Ruby gem path:

```erb
<%= stylesheet_link_tag "tailwind", "neon_glow/tokens", "neon_glow/components", "data-turbo-track": "reload" %>
```

### With Sprockets (older Rails)

Add to your `application.css`:

```css
/*
 *= require neon_glow/tokens
 *= require neon_glow/components
 */
```

### Set the Theme

Add palette and intensity classes to your `<body>`:

```html
<body class="neon-glow-body neon-rainbow neon-medium">
```

---

## Palettes

### Classic

| Class | Palette | Vibe |
|-------|---------|------|
| `neon-rainbow` | **Rainbow** | Full-spectrum neon. Arcade cabinets and light shows. |
| `neon-unicorn` | **Unicorn** | Pastel rainbow. Dreamy, soft, ethereal. |
| `neon-cinematic` | **Cinematic** | Electric blue + amber. The Blade Runner palette. |
| `neon-pink` | **Pink** | Hot pink + magenta. A power color for everyone. |

### Decades (each with themed dark backgrounds)

| Class | Palette | Vibe |
|-------|---------|------|
| `neon-retrowave` | **80's Retrowave** | Synthwave sunsets, neon grid lines, Outrun aesthetic. |
| `neon-grunge` | **90's Grunge** | Flannel and feedback. Raw amber on dirty surfaces. |
| `neon-y2k` | **2000's Y2K** | Frosted glass, chrome, bubblegum iridescence. |
| `neon-social` | **2010's Social** | Platform colors. Notification pings and viral moments. |
| `neon-cyberpunk` | **2020's Cyberpunk** | Toxic neon against corporate steel. Glitch aesthetic. |

### Hardware

| Class | Palette | Vibe |
|-------|---------|------|
| `neon-vfd` | **VFD Display** | Monochromatic phosphor glow with adjustable hue. |
| `neon-cherenkov` | **Cherenkov** | Deep blue light, reactor pools, and instrument panels. |
| `neon-nixie` | **Nixie** | Warm orange tubes with a violet mercury glow. |

Add a VFD preset: `<body class="neon-glow-body neon-vfd neon-vfd-amber neon-medium">`

Presets: `neon-vfd-red`, `neon-vfd-amber`, `neon-vfd-yellow`, `neon-vfd-green`, `neon-vfd-cyan` (default), `neon-vfd-blue`, `neon-vfd-purple`, `neon-vfd-pink`

Or set any hue: `style="--ng-vfd-hue: 45"`

## Intensity Levels

| Class | Description |
|-------|-------------|
| `neon-subtle` | Gentle glow. Professional. Easy on the eyes. |
| `neon-medium` | Balanced glow. The sweet spot for most apps. |
| `neon-intense` | Strong glow for expressive interfaces. |
| `neon-overdrive` | Extended bloom for luminous hardware palettes and high-impact displays. |

---

## Typography and Nixie Effects

Palette-specific font stacks are included in the tokens. The stylesheet imports Google Fonts; system fonts remain available as fallbacks. Tailwind v4 removes remote CSS imports, so add this link to your HTML `<head>` when using Tailwind:

```html
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=JetBrains+Mono:wght@400;700&amp;family=B612+Mono:wght@400;700&amp;family=Montserrat+Underline:wght@400;700&amp;family=Orbitron:wght@400;700&amp;family=Syncopate:wght@400;700&amp;family=Space+Grotesk:wght@400;700&amp;family=Rubik+Glitch&amp;family=VT323&amp;family=Megrim&amp;family=Special+Elite&amp;display=swap">
```

These packages contain CSS only. The demo's theme picker and automatic Nixie character wrapping are application JavaScript, not part of either package. Nixie card headings have a CSS fallback; for individual tube cells, wrap characters explicitly:

```html
<body class="neon-glow-body neon-nixie neon-medium">
  <span class="ng-nixie-digit">4</span><span class="ng-nixie-digit">2</span>
</body>
```

Keep palette and intensity classes on `<body>`, alongside `neon-glow-body`, so the token values inherit consistently.

## Switching Themes at Runtime

Swap classes on `<body>` -- all colors cascade instantly via CSS custom properties:

```javascript
const palettes = ["rainbow", "unicorn", "cinematic", "pink", "retrowave", "grunge",
  "y2k", "social", "cyberpunk", "vfd", "cherenkov", "nixie"];
document.body.classList.remove(...palettes.map(name => `neon-${name}`));
document.body.classList.add("neon-cinematic");

document.body.classList.remove("neon-subtle", "neon-medium", "neon-intense", "neon-overdrive");
document.body.classList.add("neon-intense");
```

---

## Live Demo

See the full kitchen sink demo with all components and palettes:

**[rails_neon_glow](https://github.com/tokenfires/rails_neon_glow)** -- Rails app with Tailwind and Bootstrap showcases.

---

## Component Classes

```
ng-card              -- Dark surface card
ng-card-raised       -- Elevated surface card
ng-border-glow       -- Gradient border with glow
ng-glow-primary      -- Primary color box-shadow glow
ng-glow-secondary    -- Secondary color box-shadow glow
ng-text-glow         -- Glowing text (primary)
ng-gradient-text     -- Rainbow gradient text
ng-btn               -- Base button
ng-btn-primary       -- Primary glowing button
ng-btn-secondary     -- Secondary glowing button
ng-btn-outline       -- Outline button with glow
ng-btn-ghost         -- Ghost button
ng-input             -- Form input with focus glow
ng-select            -- Select dropdown
ng-switch            -- Toggle switch
ng-badge-*           -- Badges (primary, secondary, success, warning, danger, info)
ng-alert-*           -- Alerts with glowing left border
ng-table             -- Dark themed table
ng-progress          -- Progress bar container
ng-progress-bar      -- Gradient progress bar
ng-navbar            -- Sticky navbar with backdrop blur
ng-divider           -- Gradient divider line
ng-animate-pulse     -- Pulsing glow animation
ng-animate-gradient  -- Rotating gradient border animation
```

---

## Development and Verification

The CSS is copied verbatim from [`rails_neon_glow` at `6b6e419`](https://github.com/tokenfires/rails_neon_glow/tree/6b6e419f11104b7eb376802178ee9b7a5dfe9978). When syncing a later demo revision, update both stylesheets and the reference commit in CI together.

With Ruby 4.0.10, run `bundle install` and `bundle exec rake test`. The tests build and extract the gem, boot a Rails 8.1.4.1 app, and request both stylesheets through Propshaft. `bundle exec bundler-audit check --update` audits the locked development dependencies. The gem's consumer requirements remain Ruby 3.1+ and Rails 7+.

## Design

**Designed by Claude** (Anthropic) in collaboration with [TokenFires](https://github.com/tokenfires).

The Neon Glow design system was created through an AI-human collaboration. Claude designed the color palettes, glow effects, component styles, and the overall dark neon aesthetic. TokenFires provided creative direction, reference materials, and review.

---

## License

MIT License -- See [LICENSE](LICENSE)

---

## Also Available

- **npm**: [`neon-glow-css`](https://github.com/tokenfires/neon_glow_npm)
- **Demo**: [`rails_neon_glow`](https://github.com/tokenfires/rails_neon_glow)

---

*Built with care by Claude and TokenFires. 2026.*
