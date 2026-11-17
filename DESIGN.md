# Frost Design System

## Direction

Frost is an Operate surface: a calm, precise workspace for sustained reading and action. The visual world is cool archival paper and graphite instrumentation, translated into a restrained contemporary interface. It does not imitate a specific application or use decorative illustration.

## Palette

The light canvas is #FAFAFA. Primary content surfaces are #FFFFFF, with recessed surfaces at #F3F3F2 and #ECECEB. Primary text is #1F1F1F; secondary text is #5F5F5C. Borders are neutral and very light. Graphite #1F1F1F fills primary actions with #FFFFFF text.

The dark canvas is #141414. Content surfaces step through #1B1B1B, #222222, and #292929. Primary text is #F2F2F0. Primary actions invert to #F2F2F0 with #171717 text. Status colors are the only chromatic colors and remain muted.

## Typography

Use the host's native UI stack and Chinese system fallbacks. Code uses the system monospace stack. Do not download or bundle fonts. Typography changes are limited to smoothing, selection, caret, code, and focus treatment; the host owns scale and layout.

## Geometry and Elevation

Use the official radius tokens with an 8px to 16px ladder. Small controls remain compact; cards use 12px; the composer and major overlays use 16px. Elevation is soft, neutral, and sparse. Floating overlays combine a hairline with a soft shadow; ordinary content does not become a stack of nested cards.

## Surfaces and States

The sidebar is one quiet step below the canvas. Conversation content remains on the canvas. Inputs and selected content use white in light mode and elevated graphite in dark mode. Hover states are subtle neutral tints. Focus uses a visible neutral ring with sufficient contrast. Success, warning, and error retain semantic color without becoming brand decoration.

## Motion

No authored animation. Do not add transitions globally. Respect the host's motion and reduced-motion behavior.

## Implementation Contract

L1 token remaps live in skins/frost/skin.css. L3 refinements live in skins/frost/patches.css and use semantic attributes or stable roles. Never use generated class-name fragments, remote assets, runtime JavaScript, or self-written html-rooted state selectors. Light values belong on :root and dark values on body[data-ds-dark-theme].
