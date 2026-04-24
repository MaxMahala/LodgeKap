import SwiftUI
import Combine

final class SDKKSDKRouterMasndnDosd23: ObservableObject {
    @Published var flow: MentalLidsfsk34feFlow = .loading
    @Published var path = NavigationPath()
    @Published var selectedTab: MentalLdsfm435Tab = .dashboard
    @Published var userName: String = UserDefaults.standard.string(forKey: "ml_user_name") ?? ""

    func finishLoading() {
        let didOnboard = UserDefaults.standard.bool(forKey: "ml_did_onboard")
        flow = didOnboard ? .app : .onboarding
    }

    func finishOnboarding(name: String) {
        userName = name
        UserDefaults.standard.set(true, forKey: "ml_did_onboard")
        UserDefaults.standard.set(name, forKey: "ml_user_name")
        flow = .app
    }

    func push(_ route: Mentalsdfsdmm34D324Route) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func resetToDashboard() {
        path = NavigationPath()
        selectedTab = .dashboard
    }
}
