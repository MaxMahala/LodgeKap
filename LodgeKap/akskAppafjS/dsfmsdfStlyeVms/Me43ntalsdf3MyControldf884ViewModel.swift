import SwiftUI
import Combine
import UIKit

@MainActor
final class Me43ntalsdf3MyControldf884ViewModel: ObservableObject {
    @Published var selectedImagedf884: UIImage?
    @Published var latestResultdf884: Me43ntalsdf3MyControldf884Snapshot?
    @Published var historydf884: [Me43ntalsdf3MyControldf884Snapshot] = []
    @Published var isLoadingdf884 = false
    @Published var errorTextdf884: String?
    @Published var showImageSourcedf884 = false
    @Published var showCameraPickerdf884 = false
    @Published var showGalleryPickerdf884 = false

    private let analyzerdf884: Me43ntalsdf3MyControldf884AnalyzerProtocol
    private let storagedf884 = Me43ntalsdf3MyControldf884StorageManager.shared

    init(analyzerdf884: Me43ntalsdf3MyControldf884AnalyzerProtocol = Me43ntalsdf3MyControldf884MockAnalyzer()) {
        self.analyzerdf884 = analyzerdf884
        loadHistorydf884()
    }

    func loadHistorydf884() {
        historydf884 = storagedf884.loadSnapshotsdf884().sorted { $0.createdAt > $1.createdAt }
    }

    func analyzedf884() {
        guard let selectedImagedf884 else { return }

        isLoadingdf884 = true
        errorTextdf884 = nil

        Task {
            do {
                let result = try await analyzerdf884.analyzeImagedf884(selectedImagedf884)
                latestResultdf884 = result
                historydf884.insert(result, at: 0)
                storagedf884.saveSnapshotsdf884(historydf884)
                isLoadingdf884 = false

                saveStatsdf884(from: result)
            } catch {
                errorTextdf884 = "Unable to analyze image."
                isLoadingdf884 = false
            }
        }
    }

    func deleteHistoryItemdf884(_ item: Me43ntalsdf3MyControldf884Snapshot) {
        historydf884.removeAll { $0.id == item.id }
        storagedf884.saveSnapshotsdf884(historydf884)
    }

    private func saveStatsdf884(from result: Me43ntalsdf3MyControldf884Snapshot) {
        var statsdf884 = Msflll3l5StorageManager.shared.loadStats()

        switch result.stateType {
        case .calm:
            statsdf884.calmScore = min(100, statsdf884.calmScore + 8)
            statsdf884.growthScore += 6
        case .focused:
            statsdf884.focusScore = min(100, statsdf884.focusScore + 8)
            statsdf884.growthScore += 6
        case .reflective:
            statsdf884.reflectionScore = min(100, statsdf884.reflectionScore + 8)
            statsdf884.growthScore += 5
        case .tense:
            statsdf884.growthScore += 2
        case .overwhelmed:
            statsdf884.growthScore += 2
        }

        statsdf884.totalPoints += Int((result.confidence * 10).rounded())
        Msflll3l5StorageManager.shared.saveStats(statsdf884)
    }
}

@MainActor
final class Me43ntalsdf3Exercisekl45ViewModel: ObservableObject {
    @Published var timeLeft: Int = 0
    @Published var isRunning = false
    @Published var isFinished = false

    private var timer: Timer?
    private var currentExercise: Me43ntalsdf3Exercisekl45Item?

    func startExercise(_ exercise: Me43ntalsdf3Exercisekl45Item) {
        currentExercise = exercise
        timeLeft = exercise.type.duration
        isRunning = true
        isFinished = false

        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task { @MainActor in
                self.tick()
            }
        }
    }

    private func tick() {
        guard timeLeft > 0 else {
            finish()
            return
        }
        timeLeft -= 1
    }

    private func finish() {
        timer?.invalidate()
        isRunning = false
        isFinished = true
        saveStats()
    }

    private func saveStats() {
        guard let exercise = currentExercise else { return }

        var stats = Msflll3l5StorageManager.shared.loadStats()

        stats.totalPoints += exercise.reward
        stats.completedTasksCount += 1
        stats.growthScore += 5

        switch exercise.type {
        case .breathing:
            stats.calmScore += 6
        case .focus:
            stats.focusScore += 7
        case .reflection:
            stats.reflectionScore += 8
        case .control:
            stats.growthScore += 6
        }

        Msflll3l5StorageManager.shared.saveStats(stats)
    }
}

@MainActor
final class Me43ntalsdf3Refl3ctionVmk554: ObservableObject {
    @Published var selectedMooddfk554: Me43ntalsdf3Refl3ctionMoodk554 = .calm
    @Published var selectedActionsdfk554: [Me43ntalsdf3Refl3ctionActionk554] = []
    @Published var notedfk554: String = ""
    @Published var entriesdfk554: [Me43ntalsdf3Refl3ctionEntryk554] = []
    @Published var todaysPromptdfk554: String = "What feeling needs your attention today?"
    @Published var showSavedBannerdfk554 = false
    @Published var breathPulseScaledfk554: CGFloat = 1

    private let storagedfk554 = Me43ntalsdf3Refl3ctionStoragek554.shared

    init() {
        loadEntriesdfk554()
        refreshPromptdfk554()
    }

    var sortedEntriesdfk554: [Me43ntalsdf3Refl3ctionEntryk554] {
        entriesdfk554.sorted { $0.createdAt > $1.createdAt }
    }

    func loadEntriesdfk554() {
        entriesdfk554 = storagedfk554.loadEntriesdfk554()
    }

    func toggleActiondfk554(_ action: Me43ntalsdf3Refl3ctionActionk554) {
        if selectedActionsdfk554.contains(action) {
            selectedActionsdfk554.removeAll { $0 == action }
        } else {
            selectedActionsdfk554.append(action)
        }
    }

    func saveReflectiondfk554() {
        let finalNote = notedfk554.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        ? "A quiet reflection was saved."
        : notedfk554

        let entry = Me43ntalsdf3Refl3ctionEntryk554(
            mood: selectedMooddfk554,
            selectedActions: selectedActionsdfk554,
            note: finalNote
        )

        entriesdfk554.insert(entry, at: 0)
        storagedfk554.saveEntriesdfk554(entriesdfk554)

        updateStatsdfk554(using: entry)

        withAnimation(.spring()) {
            showSavedBannerdfk554 = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.easeInOut) {
                self.showSavedBannerdfk554 = false
            }
        }

        notedfk554 = ""
        selectedActionsdfk554 = []
        refreshPromptdfk554()
    }

    func deleteEntrydfk554(_ entry: Me43ntalsdf3Refl3ctionEntryk554) {
        entriesdfk554.removeAll { $0.id == entry.id }
        storagedfk554.saveEntriesdfk554(entriesdfk554)
    }

    func useQuickActiondfk554(_ action: Me43ntalsdf3Refl3ctionActionk554) {
        toggleActiondfk554(action)

        switch action {
        case .breathe:
            withAnimation(.easeInOut(duration: 1.4).repeatCount(2, autoreverses: true)) {
                breathPulseScaledfk554 = 1.16
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                self.breathPulseScaledfk554 = 1
            }
        case .gratitude:
            if notedfk554.isEmpty {
                notedfk554 = "Today I am grateful for "
            }
        case .letGo:
            if notedfk554.isEmpty {
                notedfk554 = "I can let go of "
            }
        case .oneStep:
            if notedfk554.isEmpty {
                notedfk554 = "My next small step is "
            }
        case .pause:
            if notedfk554.isEmpty {
                notedfk554 = "Right now I notice "
            }
        }
    }

    func shareTextdfk554(for entry: Me43ntalsdf3Refl3ctionEntryk554) -> String {
        let actionText = entry.selectedActions.map(\.title).joined(separator: ", ")

        return """
        Reflection
        Mood: \(entry.mood.title)
        Actions: \(actionText.isEmpty ? "None" : actionText)
        Note: \(entry.note)
        """
    }

    private func refreshPromptdfk554() {
        let prompts = [
            "What feeling needs your attention today?",
            "What are you carrying that can become lighter?",
            "What helped you stay steady today?",
            "What truth are you ready to admit gently?",
            "What is one kind thing you can do for yourself now?"
        ]
        todaysPromptdfk554 = prompts.randomElement() ?? prompts[0]
    }

    private func updateStatsdfk554(using entry: Me43ntalsdf3Refl3ctionEntryk554) {
        var statssdfk554 = Msflll3l5StorageManager.shared.loadStats()

        statssdfk554.reflectionScore = min(100, statssdfk554.reflectionScore + 8)
        statssdfk554.growthScore += 6
        statssdfk554.totalPoints += 12

        if entry.mood == .calm || entry.mood == .hopeful {
            statssdfk554.calmScore = min(100, statssdfk554.calmScore + 4)
        }

        if entry.selectedActions.contains(.oneStep) {
            statssdfk554.focusScore = min(100, statssdfk554.focusScore + 3)
        }

        Msflll3l5StorageManager.shared.saveStats(statssdfk554)
    }
}

@MainActor
final class Me43ntalsdf3Prof4ileVmk771: ObservableObject {
    @Published var profiledfk771: Me43ntalsdf3Prof4ileDatak771 = .defaultValuedfk771
    @Published var statsk771: Mentalsdf342eStadfgl4l3l5tsModel = .empty

    @Published var showEditSheetdfk771 = false
    @Published var draftNamedfk771: String = ""
    @Published var draftQuotedfk771: String = ""

    func loadDatasdfk771() {
        profiledfk771 = Me43ntalsdf3Prof4ileStoragek771.shared.loadProfiledfk771()
        statsk771 = Msflll3l5StorageManager.shared.loadStats()
        draftNamedfk771 = profiledfk771.namedfk771
        draftQuotedfk771 = profiledfk771.quoteSdfk771
    }

    func saveProfiledfk771() {
        profiledfk771.namedfk771 = draftNamedfk771.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Traveler" : draftNamedfk771
        profiledfk771.quoteSdfk771 = draftQuotedfk771.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Small mindful steps create a stronger inner forest." : draftQuotedfk771

        Me43ntalsdf3Prof4ileStoragek771.shared.saveProfiledfk771(profiledfk771)
        UserDefaults.standard.set(profiledfk771.namedfk771, forKey: "ml_user_name")
    }

    var leveldfk771: Int {
        max(1, (statsk771.totalPoints / 50) + 1)
    }

    var levelProgressdfk771: CGFloat {
        CGFloat(statsk771.totalPoints % 50) / 50
    }

    var rankTextdfk771: String {
        switch leveldfk771 {
        case 1...2: return "Seed of Awareness"
        case 3...4: return "Rooted Mind"
        case 5...6: return "Forest Walker"
        case 7...9: return "Inner Guardian"
        default: return "Mind Architect"
        }
    }

    var badgeItemsdfk771: [Me43ntalsdf3Prof4ileBadgeItemk771] {
        [
            .init(
                title: "Focus Keeper",
                subtitle: "\(statsk771.focusScore)% focus",
                imageName: "forest3"
            ),
            .init(
                title: "Calm Builder",
                subtitle: "\(statsk771.calmScore)% calm",
                imageName: "forest6"
            ),
            .init(
                title: "Reflection Path",
                subtitle: "\(statsk771.reflectionScore)% reflection",
                imageName: "forest7"
            )
        ]
    }

    var activityItemsdfk771: [Me43ntalsdf3Prof4ileActivityItemk771] {
        [
            .init(title: "Tasks Completed", value: "\(statsk771.completedTasksCount)", icon: "checkmark.seal.fill"),
            .init(title: "Total Points", value: "\(statsk771.totalPoints)", icon: "sparkles"),
            .init(title: "Current Streak", value: "\(statsk771.currentStreak) days", icon: "flame.fill"),
            .init(title: "Growth Score", value: "\(statsk771.growthScore)", icon: "leaf.fill")
        ]
    }
}
