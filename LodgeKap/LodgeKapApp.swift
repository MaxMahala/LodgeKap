import SwiftUI

@main
struct LodgeKapApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            sdfsdkfk43m5mgdsISD_1Screen()
        }
    }
}

struct sdfsdkfk43m5mgdsISD_1Screen: View {
    @StateObject private var sfdmjj34Router2324 = SDKKSDKRouterMasndnDosd23()
    @State private var sdkk4324ShowRootContent = false
    @State private var sdkk4324BackgroundScale: CGFloat = 1.08
    @State private var sdkk4324OverlayOpacity: Double = 0.0
    @State private var sdkk4324MainContentOpacity: Double = 0.0
    @State private var sdkk4324MainContentOffset: CGFloat = 24

    var body: some View {
        ZStack {
            sdkk4324BackgroundLayer
            sdkk4324AmbientOverlayLayer
            sdkk4324FloatingParticlesLayer

            if sdkk4324ShowRootContent {
                sdkk4324FlowContainer
                    .opacity(sdkk4324MainContentOpacity)
                    .offset(y: sdkk4324MainContentOffset)
                    .zIndex(5)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            sdkk4324RunRootIntroAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sdfmskdfkkJDSJfkrtateRateApp2324.dsfmsdjjREeview324()
            }
        }
        .animation(.easeInOut(duration: 0.35), value: sfdmjj34Router2324.flow)
    }

    private var sdkk4324BackgroundLayer: some View {
        ZStack {
            Image("forest3")
                .resizable()
                .scaledToFill()
                .frame(width: 350)
                .scaleEffect(sdkk4324BackgroundScale)
                .ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.58),
                    Thedsf4k3k535me.forestDark.opacity(0.82),
                    Color.black.opacity(0.94)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            RadialGradient(
                colors: [
                    Thedsf4k3k535me.forestLight.opacity(0.18),
                    .clear
                ],
                center: .topTrailing,
                startRadius: 0,
                endRadius: 420
            )
            .ignoresSafeArea()

            RadialGradient(
                colors: [
                    Thedsf4k3k535me.gold.opacity(0.08),
                    .clear
                ],
                center: .bottomLeading,
                startRadius: 0,
                endRadius: 300
            )
            .ignoresSafeArea()
        }
    }

    private var sdkk4324AmbientOverlayLayer: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Thedsf4k3k535me.forestGreen.opacity(0.14),
                            .clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 220
                    )
                )
                .frame(width: 380, height: 380)
                .offset(x: -120, y: -260)
                .blur(radius: 8)
                .opacity(sdkk4324OverlayOpacity)

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Thedsf4k3k535me.gold.opacity(0.10),
                            .clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 180
                    )
                )
                .frame(width: 300, height: 300)
                .offset(x: 130, y: 260)
                .blur(radius: 12)
                .opacity(sdkk4324OverlayOpacity)
        }
        .allowsHitTesting(false)
    }

    private var sdkk4324FloatingParticlesLayer: some View {
        ForestParticlesView()
            .opacity(0.9)
            .allowsHitTesting(false)
    }

    private var sdkk4324FlowContainer: some View {
        ZStack {
            switch sfdmjj34Router2324.flow {
            case .loading:
                Loadingsdfm43kkkk534View(
                    onDosdkksg435ne: {
                        withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                            sfdmjj34Router2324.flow = .onboarding
                        }
                    }
                )
                .transition(
                    .asymmetric(
                        insertion: .opacity.combined(with: .scale(scale: 1.02)),
                        removal: .opacity
                    )
                )

            case .onboarding:
                StartingsdasScreens32i949395View(
                    onDosfksdfk43ne: { name in
                        sfdmjj34Router2324.userName = name
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.84)) {
                            sfdmjj34Router2324.flow = .app
                        }
                    }
                )
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .opacity
                    )
                )

            case .app:
                ZStack {
                    MentalAppCosdfskdk353ntainerView()
                        .environmentObject(sfdmjj34Router2324)
                }
                .transition(
                    .asymmetric(
                        insertion: .opacity.combined(with: .scale(scale: 0.985)),
                        removal: .opacity
                    )
                )
            }
        }
    }

    private func sdkk4324RunRootIntroAnimation() {
        sdkk4324ShowRootContent = true

        withAnimation(.easeOut(duration: 1.2)) {
            sdkk4324BackgroundScale = 1.0
        }

        withAnimation(.easeInOut(duration: 1.0).delay(0.08)) {
            sdkk4324OverlayOpacity = 1.0
        }

        withAnimation(.spring(response: 0.8, dampingFraction: 0.86).delay(0.12)) {
            sdkk4324MainContentOpacity = 1.0
            sdkk4324MainContentOffset = 0
        }
    }
}

#Preview {
    sdfsdkfk43m5mgdsISD_1Screen()
}
