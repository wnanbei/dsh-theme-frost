# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

A Skin Center v2 pure-asset directory: JSON and CSS, with no package manifest, runtime JavaScript, or build step. The user approved this community skin approach over a standalone DSH plugin.

## Users

Developers who spend extended periods reading and working in the DeepSeek Harness Web GUI or Desktop client.

## Product Purpose

Frost gives DSH a quiet, refined white workspace, with graphite black reserved for key actions and a complete dark counterpart. Success means the theme feels clear and restrained in daily use while covering both application color modes.

## Positioning

A minimal, content-first DSH skin that achieves refinement through neutral surfaces, typography, hairline borders, and restrained elevation rather than artwork, glass effects, or runtime customization.

## Operating Context

The skin is loaded by the community Skin Center plugin. Users install a real directory into the DSH skins folder and select Frost in the GUI. The repository also supports submission to the community dsh-skins catalog.

## Capabilities and Constraints

- Light and dark color modes are both required.
- Graphite black is the primary action color; no chromatic brand accent.
- The deliverable must remain declarative CSS with no hooks or executable client code.
- Styles must follow the Skin Center v2 manifest, token, and semantic-selector contracts.
- Validation is local; the user explicitly declined CI configuration.
- The skin directory cannot be installed as a symlink because the loader enumerates real directories.

## Brand Commitments

The name is Frost. The confirmed visual direction is concise, refined, white, and graphite black.

## Evidence on Hand

The local DSH installation contains five working v2 skins. The community dsh-skins contracts and validator are available under the gitignored .tooling directory. Light and dark preview assets have been generated from the community official-facade renderer.

## Product Principles

- Preserve the host application's information architecture and interaction behavior.
- Let content and typography carry hierarchy; decoration stays subordinate.
- Prefer durable semantic selectors and explicit token values over host-specific patches.
- Keep installation and validation understandable without requiring a plugin build toolchain.

## Accessibility & Inclusion

Aim for WCAG AA text contrast, visible keyboard focus, and reduced-motion-safe styling.
