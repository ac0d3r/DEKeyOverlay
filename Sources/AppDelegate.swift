import AppKit

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    private let overlayController = OverlayWindowController()
    private var hotKeyManager: HotKeyManager?
    private var modifierMonitor: ModifierMonitor?
    private var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)

        overlayController.showIfNeededForSetup()
        overlayController.hide()

        hotKeyManager = HotKeyManager {
            self.overlayController.toggle()
        }

        modifierMonitor = ModifierMonitor { isShiftPressed in
            Task { @MainActor in
                self.overlayController.setShiftPressed(isShiftPressed)
            }
        }

        setupStatusItem()
    }

    private func setupStatusItem() {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        item.button?.title = "DEK"

        let menu = NSMenu()
        menu.addItem(
            withTitle: "Toggle Keyboard Overlay (⌥⌘K)",
            action: #selector(toggleOverlay),
            keyEquivalent: ""
        )
        menu.addItem(.separator())
        menu.addItem(
            withTitle: "Quit",
            action: #selector(quitApp),
            keyEquivalent: "q"
        )

        menu.items.forEach { $0.target = self }
        item.menu = menu
        statusItem = item
    }

    @objc private func toggleOverlay() {
        overlayController.toggle()
    }

    @objc private func quitApp() {
        NSApp.terminate(nil)
    }
}
