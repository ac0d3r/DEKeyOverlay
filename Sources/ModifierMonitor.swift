import AppKit

final class ModifierMonitor {
    private var globalMonitor: Any?
    private var localMonitor: Any?
    private let onShiftChanged: (Bool) -> Void

    init(onShiftChanged: @escaping (Bool) -> Void) {
        self.onShiftChanged = onShiftChanged
        start()
    }

    deinit {
        if let globalMonitor {
            NSEvent.removeMonitor(globalMonitor)
        }
        if let localMonitor {
            NSEvent.removeMonitor(localMonitor)
        }
    }

    private func start() {
        localMonitor = NSEvent.addLocalMonitorForEvents(matching: .flagsChanged) { [weak self] event in
            self?.handle(event.modifierFlags)
            return event
        }

        globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) { [weak self] event in
            self?.handle(event.modifierFlags)
        }
    }

    private func handle(_ flags: NSEvent.ModifierFlags) {
        onShiftChanged(flags.contains(.shift))
    }
}
