# DEKeyOverlay

A macOS menu bar utility that renders a compact German keyboard overlay.

![](./docs/preview.png)

## Features

- `Option + Command + K` toggles the overlay
- translucent floating panel with rounded corners
- fully rendered keyboard overlay, no image assets required
- live `Shift` layer switching
- menu bar extra labeled `DEK`

## Development

```bash
swift run
```

## Build A Release App

Use the local packaging script:

```bash
./scripts/build-app.sh
```

This produces:

`dist/DEKeyOverlay.app`
