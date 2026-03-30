import AppKit
import SwiftUI

@MainActor
final class OverlayWindowController {
    private let state = KeyboardOverlayState()
    private var panel: NSPanel?

    func showIfNeededForSetup() {
        if panel == nil {
            buildPanel()
        }
    }

    func toggle() {
        showIfNeededForSetup()

        guard let panel else { return }
        if panel.isVisible {
            hide()
        } else {
            show()
        }
    }

    func show() {
        showIfNeededForSetup()
        guard let panel else { return }
        panel.orderFrontRegardless()
    }

    func hide() {
        panel?.orderOut(nil)
    }

    func setShiftPressed(_ value: Bool) {
        state.isShiftPressed = value
    }

    private func buildPanel() {
        let contentView = KeyboardOverlayView(state: state)
        let hostingView = NSHostingView(rootView: contentView)
        hostingView.wantsLayer = true
        hostingView.layer?.cornerRadius = 22
        hostingView.layer?.cornerCurve = .continuous
        hostingView.layer?.masksToBounds = true
        hostingView.layoutSubtreeIfNeeded()

        let contentSize = hostingView.fittingSize

        let panel = NSPanel(
            contentRect: NSRect(origin: .zero, size: contentSize),
            styleMask: [.nonactivatingPanel, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )

        panel.isFloatingPanel = true
        panel.level = .statusBar
        panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        panel.backgroundColor = .clear
        panel.isOpaque = false
        panel.hasShadow = true
        panel.hidesOnDeactivate = false
        panel.titleVisibility = .hidden
        panel.titlebarAppearsTransparent = true
        panel.isMovableByWindowBackground = true
        panel.standardWindowButton(.closeButton)?.isHidden = true
        panel.standardWindowButton(.miniaturizeButton)?.isHidden = true
        panel.standardWindowButton(.zoomButton)?.isHidden = true
        panel.contentView = hostingView
        panel.setContentSize(contentSize)
        panel.center()

        self.panel = panel
    }
}
