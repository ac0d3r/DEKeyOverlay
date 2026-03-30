import SwiftUI

struct KeyboardOverlayView: View {
    @ObservedObject var state: KeyboardOverlayState
    private let layout = GermanKeyboardLayout()

    private let keyUnitWidth: CGFloat = 23
    private let keyHeight: CGFloat = 23
    private let rowSpacing: CGFloat = 4.5
    private let keySpacing: CGFloat = 4.5

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(nsColor: .windowBackgroundColor).opacity(0.92),
                            Color(nsColor: .underPageBackgroundColor).opacity(0.88)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.2), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: rowSpacing) {
                ForEach(Array(layout.rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: keySpacing) {
                        ForEach(row) { key in
                            KeycapView(
                                title: layout.legend(for: key, shifted: state.isShiftPressed),
                                width: key.widthUnits * keyUnitWidth,
                                height: keyHeight,
                                isSpecial: isSpecial(key)
                            )
                        }
                    }
                }
            }
            .padding(14)
        }
        .fixedSize()
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private func isSpecial(_ key: GermanKeyboardLayout.Key) -> Bool {
        switch key.kind {
        case .special:
            return true
        case .printable:
            return false
        }
    }
}

private struct KeycapView: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    let isSpecial: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(
                LinearGradient(
                    colors: isSpecial
                        ? [Color.white.opacity(0.16), Color.white.opacity(0.07)]
                        : [Color.white.opacity(0.28), Color.white.opacity(0.12)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(Color.white.opacity(isSpecial ? 0.12 : 0.2), lineWidth: 1)
            )
            .overlay {
                Text(title)
                    .font(.system(size: isSpecial ? 8 : 11, weight: isSpecial ? .medium : .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.55)
                    .padding(.horizontal, 4)
            }
            .frame(width: width, height: height)
            .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
    }
}
