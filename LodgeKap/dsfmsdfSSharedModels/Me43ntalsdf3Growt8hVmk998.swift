import Combine
import SwiftUI

@MainActor
final class Me43ntalsdf3Growt8hVmk998: ObservableObject {
    @Published var statsk998: Mentalsdf342eStadfgl4l3l5tsModel = .empty

    func loadDatasdfk998() {
        statsk998 = Msflll3l5StorageManager.shared.loadStats()
    }

    var levelk998: Int {
        max(1, (statsk998.totalPoints / 50) + 1)
    }

    var currentLevelPointsk998: Int {
        statsk998.totalPoints % 50
    }

    var nextLevelNeedsk998: Int {
        50
    }

    var progressToNextLevelk998: CGFloat {
        CGFloat(currentLevelPointsk998) / CGFloat(nextLevelNeedsk998)
    }

    var growthTitlek998: String {
        switch levelk998 {
        case 1...2: return "Seed of Awareness"
        case 3...4: return "Rooted Mind"
        case 5...6: return "Forest Walker"
        case 7...9: return "Inner Guardian"
        default: return "Mind Architect"
        }
    }

    var milestoneItemsk998: [Me43ntalsdf3Growt8hMilestonek998] {
        [
            .init(
                title: "Focus Strength",
                valueText: "\(statsk998.focusScore)%",
                progress: CGFloat(min(statsk998.focusScore, 100)) / 100,
                imageName: "forest3"
            ),
            .init(
                title: "Calm Depth",
                valueText: "\(statsk998.calmScore)%",
                progress: CGFloat(min(statsk998.calmScore, 100)) / 100,
                imageName: "forest6"
            ),
            .init(
                title: "Reflection Power",
                valueText: "\(statsk998.reflectionScore)%",
                progress: CGFloat(min(statsk998.reflectionScore, 100)) / 100,
                imageName: "forest7"
            ),
            .init(
                title: "Growth Energy",
                valueText: "\(statsk998.growthScore)",
                progress: min(CGFloat(statsk998.growthScore) / 100, 1),
                imageName: "forest5"
            )
        ]
    }

    var weeklyBarsk998: [Me43ntalsdf3Growt8hWeekItemk998] {
        [
            .init(day: "M", value: min(CGFloat(max(statsk998.focusScore - 18, 10)) / 100, 1)),
            .init(day: "T", value: min(CGFloat(max(statsk998.calmScore - 12, 14)) / 100, 1)),
            .init(day: "W", value: min(CGFloat(max(statsk998.reflectionScore - 15, 18)) / 100, 1)),
            .init(day: "T", value: min(CGFloat(max(statsk998.focusScore - 6, 22)) / 100, 1)),
            .init(day: "F", value: min(CGFloat(max(statsk998.calmScore - 4, 28)) / 100, 1)),
            .init(day: "S", value: min(CGFloat(max(statsk998.reflectionScore - 2, 32)) / 100, 1)),
            .init(day: "S", value: min(CGFloat(max(statsk998.growthScore / 2, 35)) / 100, 1))
        ]
    }

    var nextUnlocksk998: [Me43ntalsdf3Growt8hUnlockItemk998] {
        [
            .init(title: "Deep Reflection Path", subtitle: "Unlock with 120 total points", imageName: "forest2"),
            .init(title: "Advanced Focus Training", subtitle: "Unlock with 180 total points", imageName: "forest1"),
            .init(title: "Inner Control Mastery", subtitle: "Unlock with 250 total points", imageName: "forest8")
        ]
    }
}

struct Me43ntalsdf3Growt8hMilestonek998: Identifiable {
    let id = UUID()
    let title: String
    let valueText: String
    let progress: CGFloat
    let imageName: String
}

struct Me43ntalsdf3Growt8hWeekItemk998: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct Me43ntalsdf3Growt8hUnlockItemk998: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

enum Me43ntalsdf3Refl3ctionMoodk554: String, Codable, CaseIterable {
    case calm
    case heavy
    case grateful
    case tired
    case hopeful

    var title: String {
        switch self {
        case .calm: return "Calm"
        case .heavy: return "Heavy"
        case .grateful: return "Grateful"
        case .tired: return "Tired"
        case .hopeful: return "Hopeful"
        }
    }

    var imageName: String {
        switch self {
        case .calm: return "forest6"
        case .heavy: return "_ (1)"
        case .grateful: return "forest1"
        case .tired: return "_ (2)"
        case .hopeful: return "_ (3)"
        }
    }

    var iconName: String {
        switch self {
        case .calm: return "leaf.fill"
        case .heavy: return "cloud.rain.fill"
        case .grateful: return "sparkles"
        case .tired: return "moon.zzz.fill"
        case .hopeful: return "sun.max.fill"
        }
    }
}

enum Me43ntalsdf3Refl3ctionActionk554: String, Codable, CaseIterable {
    case breathe
    case gratitude
    case letGo
    case oneStep
    case pause

    var title: String {
        switch self {
        case .breathe: return "Breathe"
        case .gratitude: return "Gratitude"
        case .letGo: return "Let Go"
        case .oneStep: return "One Step"
        case .pause: return "Pause"
        }
    }

    var subtitle: String {
        switch self {
        case .breathe: return "Slow down for 30 seconds"
        case .gratitude: return "Notice one good thing"
        case .letGo: return "Release one heavy thought"
        case .oneStep: return "Choose one next action"
        case .pause: return "Stop and observe"
        }
    }

    var iconName: String {
        switch self {
        case .breathe: return "wind"
        case .gratitude: return "heart.fill"
        case .letGo: return "bird.fill"
        case .oneStep: return "figure.walk"
        case .pause: return "pause.fill"
        }
    }
}

struct Me43ntalsdf3Refl3ctionEntryk554: Identifiable, Codable, Equatable {
    let id: UUID
    var mood: Me43ntalsdf3Refl3ctionMoodk554
    var selectedActions: [Me43ntalsdf3Refl3ctionActionk554]
    var note: String
    var createdAt: Date

    init(
        id: UUID = UUID(),
        mood: Me43ntalsdf3Refl3ctionMoodk554,
        selectedActions: [Me43ntalsdf3Refl3ctionActionk554],
        note: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.mood = mood
        self.selectedActions = selectedActions
        self.note = note
        self.createdAt = createdAt
    }
}

@MainActor
final class Me43ntalsdf3Insi9ghtsVmk441: ObservableObject {
    @Published var statsk441: Mentalsdf342eStadfgl4l3l5tsModel = .empty
    @Published var reflectionCountk441: Int = 0
    @Published var journalCountk441: Int = 0
    @Published var myControlCountk441: Int = 0

    func loadDatasdfk441() {
        statsk441 = Msflll3l5StorageManager.shared.loadStats()
        reflectionCountk441 = Me43ntalsdf3Refl3ctionStoragek554.shared.loadEntriesdfk554().count
        journalCountk441 = Me43ntalsdf3Jou4rnalStorageManagerk987.shared.loadEntriesk987().count
        myControlCountk441 = Me43ntalsdf3MyControldf884StorageManager.shared.loadSnapshotsdf884().count
    }

    var dominantStatesdfk441: String {
        let pairs: [(String, Int)] = [
            ("Focus", statsk441.focusScore),
            ("Calm", statsk441.calmScore),
            ("Reflection", statsk441.reflectionScore)
        ]

        return pairs.max(by: { $0.1 < $1.1 })?.0 ?? "Balance"
    }

    var weakestAreasdfk441: String {
        let pairs: [(String, Int)] = [
            ("Focus", statsk441.focusScore),
            ("Calm", statsk441.calmScore),
            ("Reflection", statsk441.reflectionScore)
        ]

        return pairs.min(by: { $0.1 < $1.1 })?.0 ?? "Focus"
    }

    var mindRankTitlesdfk441: String {
        switch statsk441.totalPoints {
        case 0..<50: return "Awakening Mind"
        case 50..<120: return "Quiet Observer"
        case 120..<220: return "Inner Builder"
        case 220..<350: return "Forest Thinker"
        default: return "Deep Insight Keeper"
        }
    }

    var summaryTextk441: String {
        if statsk441.focusScore >= 70 && statsk441.calmScore >= 70 {
            return "Your current pattern suggests a stable and centered internal rhythm with good attention control."
        } else if statsk441.reflectionScore >= 70 {
            return "You are processing experiences deeply. Reflection is becoming one of your strongest qualities."
        } else if statsk441.calmScore < 45 {
            return "Your inner system may need more rest and softness. Calm-building rituals could help right now."
        } else {
            return "You are building a more aware and structured inner world step by step."
        }
    }

    var weeklyBarItemsk441: [Me43ntalsdf3Insi9ghtsWeekItemk441] {
        [
            .init(day: "M", value: min(CGFloat(max(statsk441.focusScore - 20, 18)) / 100, 1)),
            .init(day: "T", value: min(CGFloat(max(statsk441.calmScore - 16, 22)) / 100, 1)),
            .init(day: "W", value: min(CGFloat(max(statsk441.reflectionScore - 14, 20)) / 100, 1)),
            .init(day: "T", value: min(CGFloat(max(statsk441.focusScore - 10, 24)) / 100, 1)),
            .init(day: "F", value: min(CGFloat(max(statsk441.calmScore - 8, 28)) / 100, 1)),
            .init(day: "S", value: min(CGFloat(max(statsk441.reflectionScore - 4, 32)) / 100, 1)),
            .init(day: "S", value: min(CGFloat(max(statsk441.growthScore / 2, 35)) / 100, 1))
        ]
    }

    var recommendationCardsk441: [Me43ntalsdf3Insi9ghtsRecommendationk441] {
        [
            .init(
                title: "Build Calm",
                subtitle: "Breathing and pause rituals can stabilize your emotional rhythm.",
                imageName: "forest6",
                accentValue: "\(statsk441.calmScore)%"
            ),
            .init(
                title: "Train Focus",
                subtitle: "Single-task exercises may strengthen your attention and clarity.",
                imageName: "forest3",
                accentValue: "\(statsk441.focusScore)%"
            ),
            .init(
                title: "Reflect Deeply",
                subtitle: "Journaling and short prompts can reveal patterns beneath the surface.",
                imageName: "forest7",
                accentValue: "\(statsk441.reflectionScore)%"
            )
        ]
    }

    var quickInsightsk441: [Me43ntalsdf3Insi9ghtsQuickItemk441] {
        [
            .init(title: "Tasks Done", value: "\(statsk441.completedTasksCount)", icon: "checkmark.seal.fill"),
            .init(title: "Reflections", value: "\(reflectionCountk441)", icon: "sparkles"),
            .init(title: "Journal Notes", value: "\(journalCountk441)", icon: "book.closed.fill"),
            .init(title: "Mind Scans", value: "\(myControlCountk441)", icon: "brain.head.profile")
        ]
    }
}

struct Me43ntalsdf3Insi9ghtsWeekItemk441: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct Me43ntalsdf3Insi9ghtsRecommendationk441: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let accentValue: String
}

struct Me43ntalsdf3Insi9ghtsQuickItemk441: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let icon: String
}

enum Me43ntalsdf3Settin9gsKeysk991 {
    static let hapticsEnabled = "mental_life_haptics_enabled_v1"
    static let soundsEnabled = "mental_life_sounds_enabled_v1"
    static let tipsEnabled = "mental_life_tips_enabled_v1"
}

struct Me43ntalsdf3Prof4ileDatak771: Codable {
    var namedfk771: String
    var quoteSdfk771: String
    var avatarImagedfk771: String

    static let defaultValuedfk771 = Me43ntalsdf3Prof4ileDatak771(
        namedfk771: UserDefaults.standard.string(forKey: "ml_user_name") ?? "Traveler",
        quoteSdfk771: "Small mindful steps create a stronger inner forest.",
        avatarImagedfk771: "forest1"
    )
}

struct Me43ntalsdf3Prof4ileBadgeItemk771: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

struct Me43ntalsdf3Prof4ileActivityItemk771: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let icon: String
}

enum Me43ntalsdf3MindM4pAreak882: String, CaseIterable, Identifiable {
    case focus
    case calm
    case reflection
    case growth

    var id: String { rawValue }

    var title: String {
        switch self {
        case .focus: return "Focus"
        case .calm: return "Calm"
        case .reflection: return "Reflection"
        case .growth: return "Growth"
        }
    }

    var iconName: String {
        switch self {
        case .focus: return "scope"
        case .calm: return "leaf.fill"
        case .reflection: return "sparkles"
        case .growth: return "tree.fill"
        }
    }

    var imageName: String {
        switch self {
        case .focus: return "img_map_1"
        case .calm: return "img_map_2"
        case .reflection: return "img_map_3"
        case .growth: return "img_map_4"
        }
    }

    var accentColor: Color {
        switch self {
        case .focus: return Thedsf4k3k535me.goldLight
        case .calm: return Thedsf4k3k535me.forestPale
        case .reflection: return Thedsf4k3k535me.goldPale
        case .growth: return Thedsf4k3k535me.forestLight
        }
    }

    var descriptionText: String {
        switch self {
        case .focus:
            return "Your ability to stay directed, attentive and clear."
        case .calm:
            return "Your emotional softness, steadiness and inner balance."
        case .reflection:
            return "Your habit of noticing, understanding and processing experience."
        case .growth:
            return "Your overall long-term progress through habits and awareness."
        }
    }
}

struct Me43ntalsdf3MindM4pNodek882: Identifiable {
    let id = UUID()
    let area: Me43ntalsdf3MindM4pAreak882
    let progress: CGFloat
    let position: CGPoint
}
