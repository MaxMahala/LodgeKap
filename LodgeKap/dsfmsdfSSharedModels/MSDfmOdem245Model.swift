import SwiftUI

struct OnboardingSlide {
    let emoji: String
    let title: String
    let subtitle: String
    let imageName: String
    let accentColor: Color
}

let onboardingSlides: [OnboardingSlide] = [
    OnboardingSlide(
        emoji: "🌱",
        title: "Your personal forest grows with you",
        subtitle: "Daily practices, reflection, and tasks—all in one place.",
        imageName: "leaf.fill",
        accentColor: Thedsf4k3k535me.forestGreen
      ),
      OnboardingSlide(
          emoji: "✨",
          title: "Grow through mindfulness",
          subtitle: "Quizzes, insights, and exercises will help you get to know yourself better.",
          imageName: "sparkles",
          accentColor: Thedsf4k3k535me.gold
      ),
      OnboardingSlide(
          emoji: "🏆",
          title: "Track your progress and build habits",
          subtitle: "Monitor your growth and celebrate every step forward.",
          imageName: "chart.line.uptrend.xyaxis",
          accentColor: Thedsf4k3k535me.forestPale
      )
]

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var delay: Double
    var duration: Double
    var leaf: String
    var size: CGFloat
}

struct DayMentalStat: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

enum MentalTaskCategory: String, Codable, CaseIterable {
    case mindfulness
    case focus
    case reflection
    case discipline
    case calm

    var title: String {
        switch self {
        case .mindfulness: return "Mindfulness"
        case .focus: return "Focus"
        case .reflection: return "Reflection"
        case .discipline: return "Discipline"
        case .calm: return "Calm"
        }
    }

    var icon: String {
        switch self {
        case .mindfulness: return "leaf.fill"
        case .focus: return "scope"
        case .reflection: return "sparkles"
        case .discipline: return "shield.fill"
        case .calm: return "moon.stars.fill"
        }
    }
}

struct MeerwetalTasksdfkk43534Item: Identifiable, Codable, Equatable {
    let id: UUID
    let title: String
    let subtitle: String
    let category: MentalTaskCategory
    let rewardPoints: Int
    var isCompleted: Bool
    let createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        category: MentalTaskCategory,
        rewardPoints: Int,
        isCompleted: Bool = false,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.rewardPoints = rewardPoints
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}

struct Mentalsdf342eStadfgl4l3l5tsModel: Codable {
    var completedTasksCount: Int
    var totalPoints: Int
    var focusScore: Int
    var calmScore: Int
    var growthScore: Int
    var reflectionScore: Int
    var currentStreak: Int
    var lastCompletedDate: Date?

    static let empty = Mentalsdf342eStadfgl4l3l5tsModel(
        completedTasksCount: 0,
        totalPoints: 0,
        focusScore: 0,
        calmScore: 0,
        growthScore: 0,
        reflectionScore: 0,
        currentStreak: 0,
        lastCompletedDate: nil
    )
}

enum Mentalsdfl43l535TaskFactory {
    static func makeDefaultTasks() -> [MeerwetalTasksdfkk43534Item] {
        [
            MeerwetalTasksdfkk43534Item(
                title: "Morning breathing",
                subtitle: "Take 3 calm breaths and relax your shoulders",
                category: .calm,
                rewardPoints: 8
            ),
            MeerwetalTasksdfkk43534Item(
                title: "Focus session",
                subtitle: "Work without distraction for 15 minutes",
                category: .focus,
                rewardPoints: 12
            ),
            MeerwetalTasksdfkk43534Item(
                title: "Reflection note",
                subtitle: "Write one thing you learned today",
                category: .reflection,
                rewardPoints: 10
            ),
            MeerwetalTasksdfkk43534Item(
                title: "Mindful walk",
                subtitle: "Walk slowly for 5 minutes and observe nature",
                category: .mindfulness,
                rewardPoints: 9
            ),
            MeerwetalTasksdfkk43534Item(
                title: "Small discipline action",
                subtitle: "Finish one postponed task right now",
                category: .discipline,
                rewardPoints: 14
            )
        ]
    }
}

enum Me43ntalsdf3QuizTypek345: String, Codable {
    case choice
    case written
}

struct Me43ntalsdf3QuizOptionk345: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String

    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}

struct Me43ntalsdf3QuizQuestionk345: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String
    let subtitle: String
    let imageName: String
    let type: Me43ntalsdf3QuizTypek345
    let options: [Me43ntalsdf3QuizOptionk345]
    let correctAnswerText: String
    let rewardPoints: Int

    init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        imageName: String,
        type: Me43ntalsdf3QuizTypek345,
        options: [Me43ntalsdf3QuizOptionk345] = [],
        correctAnswerText: String,
        rewardPoints: Int
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.type = type
        self.options = options
        self.correctAnswerText = correctAnswerText
        self.rewardPoints = rewardPoints
    }
}

struct Me43ntalsdf3QuizCategoryk345: Identifiable, Hashable {
    static func == (lhs: Me43ntalsdf3QuizCategoryk345, rhs: Me43ntalsdf3QuizCategoryk345) -> Bool {
        return true
    }
    
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let iconName: String
    let questions: [Me43ntalsdf3QuizQuestionk345]
}

enum Me43ntalsdf3QuizFactoryk345 {
    static func makeQuizCategories() -> [Me43ntalsdf3QuizCategoryk345] {
        [
            Me43ntalsdf3QuizCategoryk345(
                title: "Inner Balance",
                subtitle: "Calm, emotions and self-awareness",
                imageName: "forest1",
                iconName: "leaf.fill",
                questions: [
                    Me43ntalsdf3QuizQuestionk345(
                        title: "What helps calm the mind fastest?",
                        subtitle: "Choose the most mindful answer",
                        imageName: "forest1",
                        type: .choice,
                        options: [
                            .init(title: "Deep slow breathing"),
                            .init(title: "Scrolling social media"),
                            .init(title: "Ignoring emotions"),
                            .init(title: "Doing everything at once")
                        ],
                        correctAnswerText: "Deep slow breathing",
                        rewardPoints: 10
                    ),
                    Me43ntalsdf3QuizQuestionk345(
                        title: "Write one word connected to peace",
                        subtitle: "Type the expected answer",
                        imageName: "forest6",
                        type: .written,
                        correctAnswerText: "calm",
                        rewardPoints: 14
                    )
                ]
            ),
            Me43ntalsdf3QuizCategoryk345(
                title: "Focus Power",
                subtitle: "Attention, routine and discipline",
                imageName: "forest3",
                iconName: "scope",
                questions: [
                    Me43ntalsdf3QuizQuestionk345(
                        title: "What improves focus most?",
                        subtitle: "Pick the best answer",
                        imageName: "forest3",
                        type: .choice,
                        options: [
                            .init(title: "Single-tasking"),
                            .init(title: "Multitasking"),
                            .init(title: "Phone interruptions"),
                            .init(title: "Random switching")
                        ],
                        correctAnswerText: "Single-tasking",
                        rewardPoints: 12
                    ),
                    Me43ntalsdf3QuizQuestionk345(
                        title: "Type the word that means attention on one goal",
                        subtitle: "Short written answer",
                        imageName: "forest5",
                        type: .written,
                        correctAnswerText: "focus",
                        rewardPoints: 15
                    )
                ]
            ),
            Me43ntalsdf3QuizCategoryk345(
                title: "Reflection Path",
                subtitle: "Thoughts, learning and growth",
                imageName: "forest7",
                iconName: "sparkles",
                questions: [
                    Me43ntalsdf3QuizQuestionk345(
                        title: "Reflection helps you...",
                        subtitle: "Choose the most accurate idea",
                        imageName: "forest7",
                        type: .choice,
                        options: [
                            .init(title: "Understand your actions"),
                            .init(title: "Avoid every emotion"),
                            .init(title: "Forget all mistakes"),
                            .init(title: "Stop learning")
                        ],
                        correctAnswerText: "Understand your actions",
                        rewardPoints: 11
                    ),
                    Me43ntalsdf3QuizQuestionk345(
                        title: "Type the word connected to personal improvement",
                        subtitle: "One-word answer",
                        imageName: "forest2",
                        type: .written,
                        correctAnswerText: "growth",
                        rewardPoints: 16
                    )
                ]
            )
        ]
    }
}

struct Me43ntalsdf3QuizResultk345 {
    let totalQuestions: Int
    let correctAnswers: Int
    let earnedPoints: Int

    var successTitle: String {
        if correctAnswers == totalQuestions {
            return "Perfect Mind Step"
        } else if correctAnswers >= max(1, totalQuestions / 2) {
            return "Strong Progress"
        } else {
            return "Keep Growing"
        }
    }
}

enum Me43ntalsdf3Jou4rnalMoodk987: String, Codable, CaseIterable {
    case overwhelmed
    case anxious
    case reflective
    case focused
    case calm

    var title: String {
        switch self {
        case .overwhelmed: return "Overwhelmed"
        case .anxious: return "Anxious"
        case .reflective: return "Reflective"
        case .focused: return "Focused"
        case .calm: return "Calm"
        }
    }

    var imageName: String {
        switch self {
        case .overwhelmed: return "_ (1)"
        case .anxious: return "_ (2)"
        case .reflective: return "_ (3)"
        case .focused: return "_ (4)"
        case .calm: return "_"
        }
    }

    var iconName: String {
        switch self {
        case .overwhelmed: return "bolt.heart.fill"
        case .anxious: return "eye.trianglebadge.exclamationmark"
        case .reflective: return "sparkles"
        case .focused: return "scope"
        case .calm: return "leaf.fill"
        }
    }
}

struct Me43ntalsdf3Jou4rnalEntryk987: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var note: String
    var mood: Me43ntalsdf3Jou4rnalMoodk987
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        note: String,
        mood: Me43ntalsdf3Jou4rnalMoodk987,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.note = note
        self.mood = mood
        self.createdAt = createdAt
    }
}

enum Me43ntalsdf3MyControldf884StateType: String, Codable, CaseIterable {
    case calm
    case focused
    case reflective
    case tense
    case overwhelmed

    var title: String {
        switch self {
        case .calm: return "Calm"
        case .focused: return "Focused"
        case .reflective: return "Reflective"
        case .tense: return "Tense"
        case .overwhelmed: return "Overwhelmed"
        }
    }

    var subtitle: String {
        switch self {
        case .calm: return "Soft and balanced state"
        case .focused: return "Directed and attentive state"
        case .reflective: return "Deep internal processing"
        case .tense: return "Elevated pressure signals"
        case .overwhelmed: return "Heavy cognitive load"
        }
    }

    var imageName: String {
        switch self {
        case .calm: return "_"
        case .focused: return "_ (4)"
        case .reflective: return "_ (3)"
        case .tense: return "_ (2)"
        case .overwhelmed: return "_ (1)"
        }
    }
}

struct Me43ntalsdf3MyControldf884Snapshot: Identifiable, Codable, Equatable {
    let id: UUID
    let stateType: Me43ntalsdf3MyControldf884StateType
    let confidence: Double
    let createdAt: Date
    let reflectionText: String

    init(
        id: UUID = UUID(),
        stateType: Me43ntalsdf3MyControldf884StateType,
        confidence: Double,
        createdAt: Date = Date(),
        reflectionText: String
    ) {
        self.id = id
        self.stateType = stateType
        self.confidence = confidence
        self.createdAt = createdAt
        self.reflectionText = reflectionText
    }
}

enum Me43ntalsdf3Exercisekl45Type: String, Codable, CaseIterable {
    case breathing
    case focus
    case reflection
    case control

    var title: String {
        switch self {
        case .breathing: return "Breathing Reset"
        case .focus: return "Focus Drill"
        case .reflection: return "Reflection Depth"
        case .control: return "Inner Control"
        }
    }

    var imageName: String {
        switch self {
        case .breathing: return "img1Exe"
        case .focus: return "img2Exe"
        case .reflection: return "img3Exe"
        case .control: return "img4Exe"
        }
    }

    var duration: Int {
        switch self {
        case .breathing: return 60
        case .focus: return 90
        case .reflection: return 120
        case .control: return 75
        }
    }
}

struct Me43ntalsdf3Exercisekl45Item: Identifiable, Codable {
    let id: UUID
    let type: Me43ntalsdf3Exercisekl45Type
    let description: String
    let reward: Int

    init(
        id: UUID = UUID(),
        type: Me43ntalsdf3Exercisekl45Type,
        description: String,
        reward: Int
    ) {
        self.id = id
        self.type = type
        self.description = description
        self.reward = reward
    }
}

enum Me43ntalsdf3Exercisekl45Factory {
    static func makeExercises() -> [Me43ntalsdf3Exercisekl45Item] {
        [
            .init(
                type: .breathing,
                description: "Slow inhale 4s → hold → exhale 6s. Repeat and stabilize mind.",
                reward: 12
            ),
            .init(
                type: .focus,
                description: "Fix attention on one point. No distraction allowed.",
                reward: 14
            ),
            .init(
                type: .reflection,
                description: "Think about your last decision and why you made it.",
                reward: 16
            ),
            .init(
                type: .control,
                description: "Observe emotions without reacting. Just notice.",
                reward: 15
            )
        ]
    }
}
