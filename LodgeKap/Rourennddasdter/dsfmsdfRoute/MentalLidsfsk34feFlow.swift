import SwiftUI
import UIKit

enum MentalLidsfsk34feFlow {
    case loading
    case onboarding
    case app
}

enum Mentalsdfsdmm34D324Route: Hashable {
    case insights
    case exercises
    case dailyTasks
    case quizzes
    case journal
    case reflection
    case myControl
    case settings
    case growth
    case MindMapsdf
    case taskDetails(String)
    case quizDetails(String)
}

enum MentalLdsfm435Tab: String, CaseIterable {
    case dashboard = "Home"
    case tasks = "Tasks"
    case quizzes = "Quizzes"
    case journal = "Journal"
    case profile = "Profile"

    var icon: String {
        switch self {
        case .dashboard: return "leaf.circle.fill"
        case .tasks: return "checkmark.seal.fill"
        case .quizzes: return "brain.head.profile"
        case .journal: return "book.closed.fill"
        case .profile: return "person.crop.circle.fill"
        }
    }
}

struct Me43ntalsdf3Refl3ctionShareSheetk554: UIViewControllerRepresentable {
    let itemsk554: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: itemsk554, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
