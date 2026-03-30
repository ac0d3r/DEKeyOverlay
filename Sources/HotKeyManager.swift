import Carbon

final class HotKeyManager: @unchecked Sendable {
    private var hotKeyRef: EventHotKeyRef?
    private let hotKeyID = EventHotKeyID(signature: OSType(0x44454B59), id: 1)
    private let handler: @MainActor () -> Void

    init(handler: @escaping @MainActor () -> Void) {
        self.handler = handler
        installHandler()
        registerHotKey()
    }

    deinit {
        if let hotKeyRef {
            UnregisterEventHotKey(hotKeyRef)
        }
    }

    private func installHandler() {
        var eventSpec = EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyPressed))
        InstallEventHandler(
            GetApplicationEventTarget(),
            { _, event, userData in
                guard let event else { return noErr }

                var hotKeyID = EventHotKeyID()
                let status = GetEventParameter(
                    event,
                    EventParamName(kEventParamDirectObject),
                    EventParamType(typeEventHotKeyID),
                    nil,
                    MemoryLayout<EventHotKeyID>.size,
                    nil,
                    &hotKeyID
                )

                guard status == noErr,
                      let userData else { return noErr }

                let manager = Unmanaged<HotKeyManager>.fromOpaque(userData).takeUnretainedValue()
                if hotKeyID.id == manager.hotKeyID.id {
                    Task { @MainActor in
                        manager.handler()
                    }
                }
                return noErr
            },
            1,
            &eventSpec,
            UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()),
            nil
        )
    }

    private func registerHotKey() {
        RegisterEventHotKey(
            UInt32(kVK_ANSI_K),
            UInt32(optionKey | cmdKey),
            hotKeyID,
            GetApplicationEventTarget(),
            0,
            &hotKeyRef
        )
    }
}
