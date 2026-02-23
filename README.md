# Neon Glow

**A dark neon glow design system for Bootstrap and Tailwind CSS.**

4 color palettes. 3 intensity levels. Pure CSS custom properties. Works with any framework or standalone.

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

Import in your Tailwind entry point:

```css
@import "tailwindcss";
@import "neon_glow/tokens";
@import "neon_glow/components";
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

| Class | Vibe |
|-------|------|
| `neon-rainbow` | Full-spectrum neon. Arcade cabinets and light shows. |
| `neon-unicorn` | Pastel rainbow. Dreamy, soft, ethereal. |
| `neon-cinematic` | Electric blue + amber. The Blade Runner palette. |
| `neon-pink` | Hot pink + magenta. A power color for everyone. |

## Intensity Levels

| Class | Description |
|-------|-------------|
| `neon-subtle` | Gentle glow. Professional. Easy on the eyes. |
| `neon-medium` | Balanced glow. The sweet spot for most apps. |
| `neon-intense` | Maximum glow. Over the top. The WOW factor. |

---

## Switching Themes at Runtime

Swap classes on `<body>` -- all colors cascade instantly via CSS custom properties:

```javascript
document.body.classList.remove("neon-rainbow", "neon-unicorn", "neon-cinematic", "neon-pink");
document.body.classList.add("neon-cinematic");

document.body.classList.remove("neon-subtle", "neon-medium", "neon-intense");
document.body.classList.add("neon-intense");
```

---

## Live Demo

See the full kitchen sink demo with all components and palettes:

**[rails_neon_glow](https://github.com/tokenfires/rails_neon_glow)** -- Rails 8.1.2 app with Tailwind and Bootstrap showcases.

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
