import Combine
import SwiftUI
import StoreKit

@MainActor
final class Mentalsdf43ll5DashboardStatsViewModel: ObservableObject {
    @Published var stats: Mentalsdf342eStadfgl4l3l5tsModel = .empty

    func loadStats() {
        stats = Msflll3l5StorageManager.shared.loadStats()
    }
}

@MainActor
final class Mentalfsdgfl34l5TasksViewModel: ObservableObject {
    @Published var tasks: [MeerwetalTasksdfkk43534Item] = []
    @Published var stats: Mentalsdf342eStadfgl4l3l5tsModel = .empty

    private let storage = Msflll3l5StorageManager.shared

    init() {
        loadData()
    }

    var activeTasks: [MeerwetalTasksdfkk43534Item] {
        tasks.filter { !$0.isCompleted }
    }

    var completedTasks: [MeerwetalTasksdfkk43534Item] {
        tasks.filter { $0.isCompleted }
    }

    func loadData() {
        let savedTasks = storage.loadTasks()
        tasks = savedTasks.isEmpty ? Mentalsdfl43l535TaskFactory.makeDefaultTasks() : savedTasks
        stats = storage.loadStats()

        if savedTasks.isEmpty {
            storage.saveTasks(tasks)
        }
    }

    func toggleTask(_ task: MeerwetalTasksdfkk43534Item) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }

        let wasCompleted = tasks[index].isCompleted
        tasks[index].isCompleted.toggle()

        if !wasCompleted && tasks[index].isCompleted {
            applyCompletionStats(for: tasks[index])
        } else if wasCompleted && !tasks[index].isCompleted {
            removeCompletionStats(for: tasks[index])
        }

        storage.saveTasks(tasks)
        storage.saveStats(stats)
    }

    private func applyCompletionStats(for task: MeerwetalTasksdfkk43534Item) {
        stats.completedTasksCount += 1
        stats.totalPoints += task.rewardPoints
        stats.growthScore += task.rewardPoints

        switch task.category {
        case .focus:
            stats.focusScore += 8
        case .calm:
            stats.calmScore += 8
        case .reflection:
            stats.reflectionScore += 8
        case .mindfulness:
            stats.calmScore += 5
            stats.growthScore += 4
        case .discipline:
            stats.focusScore += 5
            stats.growthScore += 6
        }

        updateStreakAfterCompletion()
        clampStats()
    }

    private func removeCompletionStats(for task: MeerwetalTasksdfkk43534Item) {
        stats.completedTasksCount = max(0, stats.completedTasksCount - 1)
        stats.totalPoints = max(0, stats.totalPoints - task.rewardPoints)
        stats.growthScore = max(0, stats.growthScore - task.rewardPoints)

        switch task.category {
        case .focus:
            stats.focusScore = max(0, stats.focusScore - 8)
        case .calm:
            stats.calmScore = max(0, stats.calmScore - 8)
        case .reflection:
            stats.reflectionScore = max(0, stats.reflectionScore - 8)
        case .mindfulness:
            stats.calmScore = max(0, stats.calmScore - 5)
            stats.growthScore = max(0, stats.growthScore - 4)
        case .discipline:
            stats.focusScore = max(0, stats.focusScore - 5)
            stats.growthScore = max(0, stats.growthScore - 6)
        }

        clampStats()
    }

    private func updateStreakAfterCompletion() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if let lastDate = stats.lastCompletedDate {
            let lastDay = calendar.startOfDay(for: lastDate)

            if calendar.isDate(lastDay, inSameDayAs: today) {
            } else if let nextDay = calendar.date(byAdding: .day, value: 1, to: lastDay),
                      calendar.isDate(nextDay, inSameDayAs: today) {
                stats.currentStreak += 1
            } else {
                stats.currentStreak = 1
            }
        } else {
            stats.currentStreak = 1
        }

        stats.lastCompletedDate = today
    }

    private func clampStats() {
        stats.focusScore = min(stats.focusScore, 100)
        stats.calmScore = min(stats.calmScore, 100)
        stats.reflectionScore = min(stats.reflectionScore, 100)
        stats.growthScore = min(stats.growthScore, 9999)
    }
}

@MainActor
final class Me43ntalsdf3QuizFlowViewModelk345: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var selectedOptionId: UUID?
    @Published var writtenAnswer: String = ""
    @Published var showResult: Bool = false
    @Published var correctCount: Int = 0
    @Published var earnedPoints: Int = 0

    let category: Me43ntalsdf3QuizCategoryk345

    init(category: Me43ntalsdf3QuizCategoryk345) {
        self.category = category
    }

    var currentQuestion: Me43ntalsdf3QuizQuestionk345 {
        category.questions[currentIndex]
    }

    var progressValue: CGFloat {
        guard !category.questions.isEmpty else { return 0 }
        return CGFloat(currentIndex + 1) / CGFloat(category.questions.count)
    }

    var canContinue: Bool {
        switch currentQuestion.type {
        case .choice:
            return selectedOptionId != nil
        case .written:
            return !writtenAnswer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    func submitCurrentQuestion() {
        let isCorrect = checkAnswer(for: currentQuestion)

        if isCorrect {
            correctCount += 1
            earnedPoints += currentQuestion.rewardPoints
        }

        if currentIndex < category.questions.count - 1 {
            currentIndex += 1
            selectedOptionId = nil
            writtenAnswer = ""
        } else {
            saveStatsToStorage()
            showResult = true
        }
    }

    private func checkAnswer(for question: Me43ntalsdf3QuizQuestionk345) -> Bool {
        switch question.type {
        case .choice:
            guard
                let selectedOptionId,
                let selectedOption = question.options.first(where: { $0.id == selectedOptionId })
            else {
                return false
            }
            return normalize(selectedOption.title) == normalize(question.correctAnswerText)

        case .written:
            return normalize(writtenAnswer) == normalize(question.correctAnswerText)
        }
    }

    private func normalize(_ value: String) -> String {
        value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
    }

    private func saveStatsToStorage() {
        let storagesdfk34 = Msflll3l5StorageManager.shared
        var statssdfk34 = storagesdfk34.loadStats()

        statssdfk34.totalPoints += earnedPoints
        statssdfk34.growthScore += earnedPoints
        statssdfk34.reflectionScore = min(100, statssdfk34.reflectionScore + correctCount * 4)
        statssdfk34.focusScore = min(100, statssdfk34.focusScore + correctCount * 3)
        statssdfk34.calmScore = min(100, statssdfk34.calmScore + correctCount * 2)

        storagesdfk34.saveStats(statssdfk34)
    }

    var resultsdfk34: Me43ntalsdf3QuizResultk345 {
        Me43ntalsdf3QuizResultk345(
            totalQuestions: category.questions.count,
            correctAnswers: correctCount,
            earnedPoints: earnedPoints
        )
    }
}

@MainActor
final class Me43ntalsdf3Jou4rnalViewModelk987: ObservableObject {
    @Published var entriesk987: [Me43ntalsdf3Jou4rnalEntryk987] = []

    private let storagek987 = Me43ntalsdf3Jou4rnalStorageManagerk987.shared

    init() {
        loadEntriesk987()
    }

    var recentEntriesk987: [Me43ntalsdf3Jou4rnalEntryk987] {
        entriesk987.sorted { $0.createdAt > $1.createdAt }
    }

    var totalEntriesCountk987: Int {
        entriesk987.count
    }

    var focusedEntriesCountk987: Int {
        entriesk987.filter { $0.mood == .focused }.count
    }

    var calmEntriesCountk987: Int {
        entriesk987.filter { $0.mood == .calm }.count
    }

    func loadEntriesk987() {
        entriesk987 = storagek987.loadEntriesk987()
    }

    func addEntryk987(title: String, note: String, mood: Me43ntalsdf3Jou4rnalMoodk987) {
        let newEntry = Me43ntalsdf3Jou4rnalEntryk987(
            title: title,
            note: note,
            mood: mood
        )
        entriesk987.insert(newEntry, at: 0)
        storagek987.saveEntriesk987(entriesk987)
    }

    func updateEntryk987(_ entry: Me43ntalsdf3Jou4rnalEntryk987) {
        guard let index = entriesk987.firstIndex(where: { $0.id == entry.id }) else { return }
        entriesk987[index] = entry
        storagek987.saveEntriesk987(entriesk987)
    }

    func deleteEntryk987(_ entry: Me43ntalsdf3Jou4rnalEntryk987) {
        entriesk987.removeAll { $0.id == entry.id }
        storagek987.saveEntriesk987(entriesk987)
    }
}

@MainActor
final class Me43ntalsdf3Settin9gsVmk991: ObservableObject {
    @Published var hapticsEnabled = Me43ntalsdf3Settin9gsManagerk991.shared.hapticsEnabled
    @Published var soundsEnabled = Me43ntalsdf3Settin9gsManagerk991.shared.soundsEnabled
    @Published var tipsEnabled = Me43ntalsdf3Settin9gsManagerk991.shared.tipsEnabled
    @Published var showResetAlert = false

    func toggleHaptics(_ value: Bool) {
        Me43ntalsdf3Settin9gsManagerk991.shared.hapticsEnabled = value
        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
    }

    func toggleSounds(_ value: Bool) {
        Me43ntalsdf3Settin9gsManagerk991.shared.soundsEnabled = value
    }

    func toggleTips(_ value: Bool) {
        Me43ntalsdf3Settin9gsManagerk991.shared.tipsEnabled = value
    }

    func openPrivacy() {
        guard let url = URL(string: SDConstants03204ConfigAppString.pricnsdPrivacy) else { return }
        UIApplication.shared.open(url)
    }

    func resetAllData() {
        let defaults = UserDefaults.standard
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

        Msflll3l5StorageManager.shared.saveStats(.empty)
    }

    func rateApp() {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })
        else { return }

        SKStoreReviewController.requestReview(in: scene)
    }
}

@MainActor
final class Me43ntalsdf3MindM4pVmk882: ObservableObject {
    @Published var statsk882: Mentalsdf342eStadfgl4l3l5tsModel = .empty
    @Published var selectedAreadfk882: Me43ntalsdf3MindM4pAreak882? = nil

    func loadDatasdfk882() {
        statsk882 = Msflll3l5StorageManager.shared.loadStats()
    }

    var nodeItemsdfk882: [Me43ntalsdf3MindM4pNodek882] {
        [
            .init(area: .focus, progress: CGFloat(min(statsk882.focusScore, 100)) / 100, position: CGPoint(x: 0.22, y: 0.27)),
            .init(area: .calm, progress: CGFloat(min(statsk882.calmScore, 100)) / 100, position: CGPoint(x: 0.78, y: 0.30)),
            .init(area: .reflection, progress: CGFloat(min(statsk882.reflectionScore, 100)) / 100, position: CGPoint(x: 0.28, y: 0.72)),
            .init(area: .growth, progress: min(CGFloat(statsk882.growthScore) / 100, 1), position: CGPoint(x: 0.76, y: 0.72))
        ]
    }

    var coreLevelTextdfk882: String {
        let total = statsk882.focusScore + statsk882.calmScore + statsk882.reflectionScore
        switch total {
        case 0..<90: return "Awakening Core"
        case 90..<170: return "Rooted Core"
        case 170..<240: return "Living Forest Core"
        default: return "Deep Inner Core"
        }
    }

    func valueTextdfk882(for area: Me43ntalsdf3MindM4pAreak882) -> String {
        switch area {
        case .focus:
            return "\(statsk882.focusScore)%"
        case .calm:
            return "\(statsk882.calmScore)%"
        case .reflection:
            return "\(statsk882.reflectionScore)%"
        case .growth:
            return "\(statsk882.growthScore)"
        }
    }

    func recommendationTextdfk882(for area: Me43ntalsdf3MindM4pAreak882) -> String {
        switch area {
        case .focus:
            return "Single-tasking and short attention drills can strengthen this branch."
        case .calm:
            return "Breathing resets and quieter routines can deepen this area."
        case .reflection:
            return "Journal entries and daily prompts can help this part expand."
        case .growth:
            return "Consistency across tasks, quizzes and reflections will grow this path."
        }
    }
}
