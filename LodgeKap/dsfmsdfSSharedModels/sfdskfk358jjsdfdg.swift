import SwiftUI
import Foundation
import Combine

public struct AppUserSettings: Codable {
    public var isSoundEnabled: Bool = true
    public var isHapticsEnabled: Bool = true
    public var contentScale: Double = 1.0
}

public struct AppPers_tContainer: Codable {
    public var userSettings: AppUserSettings = .init()
    public var hasCompletedOnboarding: Bool = false
}

@MainActor
public final class KDSKF_fm4359jjsfdsk435: ObservableObject {
    @Published public private(set) var state: AppPers_tContainer
    private let fileURL: URL

    public init(filename: String = "app_persistent_container.json") {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        try? FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
        self.fileURL = base.appendingPathComponent(filename)

        if let loaded = Self.load(from: fileURL) {
            self.state = loaded
        } else {
            self.state = .init()
            persist()
        }
    }

    private static func load(from url: URL) -> AppPers_tContainer? {
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(AppPers_tContainer.self, from: data)
    }

    public func persist() {
        Task.detached(priority: .background) { [state, fileURL] in
            do {
                let data = try JSONEncoder().encode(state)
                try data.write(to: fileURL, options: [.atomic])
            } catch {
                print("Persist error:", error)
            }
        }
    }

    public func updateSettings(_ transform: (inout AppUserSettings) -> Void) {
        transform(&state.userSettings)
        persist()
    }

    public func setOnboardingCompleted() {
        state.hasCompletedOnboarding = true
        persist()
    }
}
