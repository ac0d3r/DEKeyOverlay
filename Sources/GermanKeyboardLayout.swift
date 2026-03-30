import AppKit
import Carbon
import Foundation

struct GermanKeyboardLayout {
    struct Key: Identifiable {
        let id: String
        let widthUnits: CGFloat
        let kind: Kind
    }

    enum Kind {
        case special(plistKey: String?, fallback: String)
        case printable(keyCode: UInt16, fallback: String)
    }

    let rows: [[Key]] = [
        [
            Key(id: "backtick", widthUnits: 1, kind: .printable(keyCode: 50, fallback: "^")),
            Key(id: "digit1", widthUnits: 1, kind: .printable(keyCode: 18, fallback: "1")),
            Key(id: "digit2", widthUnits: 1, kind: .printable(keyCode: 19, fallback: "2")),
            Key(id: "digit3", widthUnits: 1, kind: .printable(keyCode: 20, fallback: "3")),
            Key(id: "digit4", widthUnits: 1, kind: .printable(keyCode: 21, fallback: "4")),
            Key(id: "digit5", widthUnits: 1, kind: .printable(keyCode: 23, fallback: "5")),
            Key(id: "digit6", widthUnits: 1, kind: .printable(keyCode: 22, fallback: "6")),
            Key(id: "digit7", widthUnits: 1, kind: .printable(keyCode: 26, fallback: "7")),
            Key(id: "digit8", widthUnits: 1, kind: .printable(keyCode: 28, fallback: "8")),
            Key(id: "digit9", widthUnits: 1, kind: .printable(keyCode: 25, fallback: "9")),
            Key(id: "digit0", widthUnits: 1, kind: .printable(keyCode: 29, fallback: "0")),
            Key(id: "minus", widthUnits: 1, kind: .printable(keyCode: 27, fallback: "ß")),
            Key(id: "equal", widthUnits: 1, kind: .printable(keyCode: 24, fallback: "´")),
            Key(id: "delete", widthUnits: 1.6, kind: .special(plistKey: nil, fallback: ""))
        ],
        [
            Key(id: "tab", widthUnits: 1.6, kind: .special(plistKey: nil, fallback: "")),
            Key(id: "q", widthUnits: 1, kind: .printable(keyCode: 12, fallback: "Q")),
            Key(id: "w", widthUnits: 1, kind: .printable(keyCode: 13, fallback: "W")),
            Key(id: "e", widthUnits: 1, kind: .printable(keyCode: 14, fallback: "E")),
            Key(id: "r", widthUnits: 1, kind: .printable(keyCode: 15, fallback: "R")),
            Key(id: "t", widthUnits: 1, kind: .printable(keyCode: 17, fallback: "T")),
            Key(id: "y", widthUnits: 1, kind: .printable(keyCode: 16, fallback: "Y")),
            Key(id: "u", widthUnits: 1, kind: .printable(keyCode: 32, fallback: "U")),
            Key(id: "i", widthUnits: 1, kind: .printable(keyCode: 34, fallback: "I")),
            Key(id: "o", widthUnits: 1, kind: .printable(keyCode: 31, fallback: "O")),
            Key(id: "p", widthUnits: 1, kind: .printable(keyCode: 35, fallback: "P")),
            Key(id: "leftBracket", widthUnits: 1, kind: .printable(keyCode: 33, fallback: "Ü")),
            Key(id: "rightBracket", widthUnits: 1, kind: .printable(keyCode: 30, fallback: "+")),
            Key(id: "hash", widthUnits: 1, kind: .printable(keyCode: 42, fallback: "#"))
        ],
        [
            Key(id: "caps", widthUnits: 1.8, kind: .special(plistKey: nil, fallback: "")),
            Key(id: "a", widthUnits: 1, kind: .printable(keyCode: 0, fallback: "A")),
            Key(id: "s", widthUnits: 1, kind: .printable(keyCode: 1, fallback: "S")),
            Key(id: "d", widthUnits: 1, kind: .printable(keyCode: 2, fallback: "D")),
            Key(id: "f", widthUnits: 1, kind: .printable(keyCode: 3, fallback: "F")),
            Key(id: "g", widthUnits: 1, kind: .printable(keyCode: 5, fallback: "G")),
            Key(id: "h", widthUnits: 1, kind: .printable(keyCode: 4, fallback: "H")),
            Key(id: "j", widthUnits: 1, kind: .printable(keyCode: 38, fallback: "J")),
            Key(id: "k", widthUnits: 1, kind: .printable(keyCode: 40, fallback: "K")),
            Key(id: "l", widthUnits: 1, kind: .printable(keyCode: 37, fallback: "L")),
            Key(id: "semicolon", widthUnits: 1, kind: .printable(keyCode: 41, fallback: "Ö")),
            Key(id: "quote", widthUnits: 1, kind: .printable(keyCode: 39, fallback: "Ä")),
            Key(id: "return", widthUnits: 2.0, kind: .special(plistKey: nil, fallback: ""))
        ],
        [
            Key(id: "leftShift", widthUnits: 2.5, kind: .special(plistKey: nil, fallback: "")),
            Key(id: "z", widthUnits: 1, kind: .printable(keyCode: 6, fallback: "Z")),
            Key(id: "x", widthUnits: 1, kind: .printable(keyCode: 7, fallback: "X")),
            Key(id: "c", widthUnits: 1, kind: .printable(keyCode: 8, fallback: "C")),
            Key(id: "v", widthUnits: 1, kind: .printable(keyCode: 9, fallback: "V")),
            Key(id: "b", widthUnits: 1, kind: .printable(keyCode: 11, fallback: "B")),
            Key(id: "n", widthUnits: 1, kind: .printable(keyCode: 45, fallback: "N")),
            Key(id: "m", widthUnits: 1, kind: .printable(keyCode: 46, fallback: "M")),
            Key(id: "comma", widthUnits: 1, kind: .printable(keyCode: 43, fallback: ",")),
            Key(id: "period", widthUnits: 1, kind: .printable(keyCode: 47, fallback: ".")),
            Key(id: "slash", widthUnits: 1, kind: .printable(keyCode: 44, fallback: "-")),
            Key(id: "rightShift", widthUnits: 2.5, kind: .special(plistKey: nil, fallback: ""))
        ]
    ]

    private let inputSourceID = "com.apple.keylayout.German-DIN-2137"
    private let plistURL = URL(fileURLWithPath: "/System/Library/TextInput/TextInput_de.bundle/Versions/A/Resources/Keyboard-de.plist")

    private let layoutData: CFData?
    private let uiLabels: [String: String]

    init() {
        layoutData = Self.loadLayoutData(inputSourceID: inputSourceID)
        uiLabels = Self.loadUILabels(from: plistURL)
    }

    func legend(for key: Key, shifted: Bool) -> String {
        switch key.kind {
        case let .special(plistKey, fallback):
            guard let plistKey else { return fallback }
            return uiLabels[plistKey] ?? fallback
        case let .printable(keyCode, fallback):
            return translatedCharacter(for: keyCode, shifted: shifted) ?? fallback
        }
    }

    private func translatedCharacter(for keyCode: UInt16, shifted: Bool) -> String? {
        guard let layoutData else { return nil }
        let keyboardLayout = unsafeBitCast(CFDataGetBytePtr(layoutData), to: UnsafePointer<UCKeyboardLayout>.self)
        let modifierState = shifted ? UInt32(shiftKey >> 8) : 0
        let keyboardType = UInt32(LMGetKbdType())

        var deadKeyState: UInt32 = 0
        var length = 0
        var chars = [UniChar](repeating: 0, count: 8)

        let status = UCKeyTranslate(
            keyboardLayout,
            keyCode,
            UInt16(kUCKeyActionDisplay),
            modifierState,
            keyboardType,
            OptionBits(kUCKeyTranslateNoDeadKeysBit),
            &deadKeyState,
            chars.count,
            &length,
            &chars
        )

        guard status == noErr, length > 0 else { return nil }
        let result = String(utf16CodeUnits: chars, count: Int(length))
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return result.isEmpty ? nil : result
    }

    private static func loadLayoutData(inputSourceID: String) -> CFData? {
        let filter = [kTISPropertyInputSourceID as String: inputSourceID] as CFDictionary
        let sources = TISCreateInputSourceList(filter, false).takeRetainedValue() as NSArray
        guard let source = sources.firstObject else {
            return nil
        }

        let inputSource = source as! TISInputSource
        guard let property = TISGetInputSourceProperty(inputSource, kTISPropertyUnicodeKeyLayoutData) else {
            return nil
        }

        return Unmanaged<CFData>.fromOpaque(property).takeUnretainedValue()
    }

    private static func loadUILabels(from url: URL) -> [String: String] {
        guard let dict = NSDictionary(contentsOf: url) as? [String: Any] else {
            return [:]
        }

        var labels: [String: String] = [:]
        for (key, value) in dict {
            if let text = value as? String {
                labels[key] = text
            }
        }
        return labels
    }
}
