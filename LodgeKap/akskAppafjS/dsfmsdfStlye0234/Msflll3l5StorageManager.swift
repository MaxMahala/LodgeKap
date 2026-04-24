import Foundation
import StoreKit

final class Msflll3l5StorageManager {
    static let shared = Msflll3l5StorageManager()

    private enum Keys {
        static let tasks = "mental_life_tasks_v1"
        static let stats = "mental_life_stats_v1"
    }

    private let defaults = UserDefaults.standard

    private init() {}

    func saveTasks(_ tasks: [MeerwetalTasksdfkk43534Item]) {
        guard let data = try? JSONEncoder().encode(tasks) else { return }
        defaults.set(data, forKey: Keys.tasks)
    }

    func loadTasks() -> [MeerwetalTasksdfkk43534Item] {
        guard
            let data = defaults.data(forKey: Keys.tasks),
            let tasks = try? JSONDecoder().decode([MeerwetalTasksdfkk43534Item].self, from: data)
        else {
            let fallback = Mentalsdfl43l535TaskFactory.makeDefaultTasks()
            saveTasks(fallback)
            return fallback
        }

        if tasks.isEmpty {
            let fallback = Mentalsdfl43l535TaskFactory.makeDefaultTasks()
            saveTasks(fallback)
            return fallback
        }

        return tasks
    }

    func saveStats(_ stats: Mentalsdf342eStadfgl4l3l5tsModel) {
        guard let data = try? JSONEncoder().encode(stats) else { return }
        defaults.set(data, forKey: Keys.stats)
    }

    func loadStats() -> Mentalsdf342eStadfgl4l3l5tsModel {
        guard
            let data = defaults.data(forKey: Keys.stats),
            let stats = try? JSONDecoder().decode(Mentalsdf342eStadfgl4l3l5tsModel.self, from: data)
        else {
            let fallback = makeDefaultStats()
            saveStats(fallback)
            return fallback
        }

        if isStatsEmptyOrZero(stats) {
            let fallback = makeDefaultStats()
            saveStats(fallback)
            return fallback
        }

        return stats
    }

    private func isStatsEmptyOrZero(_ stats: Mentalsdf342eStadfgl4l3l5tsModel) -> Bool {
        stats.completedTasksCount == 0 &&
        stats.totalPoints == 0 &&
        stats.focusScore == 0 &&
        stats.calmScore == 0 &&
        stats.growthScore == 0 &&
        stats.reflectionScore == 0 &&
        stats.currentStreak == 0 &&
        stats.lastCompletedDate == nil
    }

    private func makeDefaultStats() -> Mentalsdf342eStadfgl4l3l5tsModel {
        Mentalsdf342eStadfgl4l3l5tsModel(
            completedTasksCount: 0,
            totalPoints: 25,
            focusScore: 62,
            calmScore: 58,
            growthScore: 18,
            reflectionScore: 40,
            currentStreak: 1,
            lastCompletedDate: nil
        )
    }
}

enum sdfmskdfkkJDSJfkrtateRateApp2324 {
    static func dsfmsdjjREeview324() {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })
        else { return }

        SKStoreReviewController.requestReview(in: scene)
    }
}

final class Me43ntalsdf3Jou4rnalStorageManagerk987 {
    static let shared = Me43ntalsdf3Jou4rnalStorageManagerk987()

    private enum Me43ntalsdf3Jou4rnalKeys987 {
        static let entries = "mental_life_journal_entries_v1"
    }

    private let defaultsk987 = UserDefaults.standard

    private init() {}

    func saveEntriesk987(_ entries: [Me43ntalsdf3Jou4rnalEntryk987]) {
        guard let data = try? JSONEncoder().encode(entries) else { return }
        defaultsk987.set(data, forKey: Me43ntalsdf3Jou4rnalKeys987.entries)
    }

    func loadEntriesk987() -> [Me43ntalsdf3Jou4rnalEntryk987] {
        guard
            let data = defaultsk987.data(forKey: Me43ntalsdf3Jou4rnalKeys987.entries),
            let entries = try? JSONDecoder().decode([Me43ntalsdf3Jou4rnalEntryk987].self, from: data)
        else {
            let fallback = makeDefaultEntriesk987()
            saveEntriesk987(fallback)
            return fallback
        }

        if entries.isEmpty {
            let fallback = makeDefaultEntriesk987()
            saveEntriesk987(fallback)
            return fallback
        }

        return entries
    }

    private func makeDefaultEntriesk987() -> [Me43ntalsdf3Jou4rnalEntryk987] {
        [
            Me43ntalsdf3Jou4rnalEntryk987(
                title: "Too many thoughts",
                note: "Today I felt pressure from many unfinished things. I need to slow down and choose one clear step.",
                mood: .overwhelmed
            ),
            Me43ntalsdf3Jou4rnalEntryk987(
                title: "Quiet reflection",
                note: "I noticed that writing honestly makes my mind softer and more organized.",
                mood: .reflective
            ),
            Me43ntalsdf3Jou4rnalEntryk987(
                title: "Small control",
                note: "I stayed focused for 20 minutes and it gave me confidence.",
                mood: .focused
            )
        ]
    }
}

final class Me43ntalsdf3MyControldf884StorageManager {
    static let shared = Me43ntalsdf3MyControldf884StorageManager()

    private enum Me43ntalsdf3MyControldf884Keys {
        static let snapshots = "mental_life_mycontrol_snapshots_v1"
    }

    private let defaultsdf884 = UserDefaults.standard

    private init() {}

    func saveSnapshotsdf884(_ items: [Me43ntalsdf3MyControldf884Snapshot]) {
        guard let data = try? JSONEncoder().encode(items) else { return }
        defaultsdf884.set(data, forKey: Me43ntalsdf3MyControldf884Keys.snapshots)
    }

    func loadSnapshotsdf884() -> [Me43ntalsdf3MyControldf884Snapshot] {
        guard
            let data = defaultsdf884.data(forKey: Me43ntalsdf3MyControldf884Keys.snapshots),
            let items = try? JSONDecoder().decode([Me43ntalsdf3MyControldf884Snapshot].self, from: data)
        else {
            return []
        }
        return items
    }
}

final class Me43ntalsdf3Refl3ctionStoragek554 {
    static let shared = Me43ntalsdf3Refl3ctionStoragek554()
    
    private enum Me43ntalsdf3Refl3ctionKeysk554 {
        static let entries = "mental_life_reflection_entries_v1"
    }
    
    private let defaultsdfk554 = UserDefaults.standard
    
    private init() {}
    
    func saveEntriesdfk554(_ entries: [Me43ntalsdf3Refl3ctionEntryk554]) {
        guard let data = try? JSONEncoder().encode(entries) else { return }
        defaultsdfk554.set(data, forKey: Me43ntalsdf3Refl3ctionKeysk554.entries)
    }
    
    func loadEntriesdfk554() -> [Me43ntalsdf3Refl3ctionEntryk554] {
        guard
            let data = defaultsdfk554.data(forKey: Me43ntalsdf3Refl3ctionKeysk554.entries),
            let entries = try? JSONDecoder().decode([Me43ntalsdf3Refl3ctionEntryk554].self, from: data)
        else {
            let fallback = makeDefaultEntriesdfk554()
            saveEntriesdfk554(fallback)
            return fallback
        }
        
        if entries.isEmpty {
            let fallback = makeDefaultEntriesdfk554()
            saveEntriesdfk554(fallback)
            return fallback
        }
        
        return entries
    }
    
    private func makeDefaultEntriesdfk554() -> [Me43ntalsdf3Refl3ctionEntryk554] {
        [
            Me43ntalsdf3Refl3ctionEntryk554(
                mood: .hopeful,
                selectedActions: [.gratitude, .oneStep],
                note: "Today I can move forward if I keep things simple and gentle."
            )
        ]
    }
}

final class Me43ntalsdf3Settin9gsManagerk991 {
    static let shared = Me43ntalsdf3Settin9gsManagerk991()

    private let defaults = UserDefaults.standard

    private init() {}

    var hapticsEnabled: Bool {
        get { defaults.object(forKey: Me43ntalsdf3Settin9gsKeysk991.hapticsEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: Me43ntalsdf3Settin9gsKeysk991.hapticsEnabled) }
    }

    var soundsEnabled: Bool {
        get { defaults.object(forKey: Me43ntalsdf3Settin9gsKeysk991.soundsEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: Me43ntalsdf3Settin9gsKeysk991.soundsEnabled) }
    }

    var tipsEnabled: Bool {
        get { defaults.object(forKey: Me43ntalsdf3Settin9gsKeysk991.tipsEnabled) as? Bool ?? true }
        set { defaults.set(newValue, forKey: Me43ntalsdf3Settin9gsKeysk991.tipsEnabled) }
    }
}

final class Me43ntalsdf3Hapti9csManagerk991 {
    static let shared = Me43ntalsdf3Hapti9csManagerk991()

    func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        guard Me43ntalsdf3Settin9gsManagerk991.shared.hapticsEnabled else { return }
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }

    func success() {
        guard Me43ntalsdf3Settin9gsManagerk991.shared.hapticsEnabled else { return }
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}

final class Me43ntalsdf3Prof4ileStoragek771 {
    static let shared = Me43ntalsdf3Prof4ileStoragek771()

    private enum Me43ntalsdf3Prof4ileKeys771 {
        static let profile = "mental_life_profile_v1"
    }

    private let defaultsdfk771 = UserDefaults.standard

    private init() {}

    func saveProfiledfk771(_ profile: Me43ntalsdf3Prof4ileDatak771) {
        guard let data = try? JSONEncoder().encode(profile) else { return }
        defaultsdfk771.set(data, forKey: Me43ntalsdf3Prof4ileKeys771.profile)
    }

    func loadProfiledfk771() -> Me43ntalsdf3Prof4ileDatak771 {
        guard
            let data = defaultsdfk771.data(forKey: Me43ntalsdf3Prof4ileKeys771.profile),
            let profile = try? JSONDecoder().decode(Me43ntalsdf3Prof4ileDatak771.self, from: data)
        else {
            let fallback = Me43ntalsdf3Prof4ileDatak771.defaultValuedfk771
            saveProfiledfk771(fallback)
            return fallback
        }
        return profile
    }
}
