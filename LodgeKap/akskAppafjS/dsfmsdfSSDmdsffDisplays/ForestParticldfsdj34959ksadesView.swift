import SwiftUI

struct Loadingsdfm43kkkk534View: View {
    let onDosdkksg435ne: () -> Void
    @State private var sdfnsdn34nn5Progr: Double = 0
    @State private var phase: Int = 0
    @State private var glowSsdfsdkfcale: CGFloat = 1
    @State private var ringRdsfskk43otation: Double = 0
    @State private var sdfskdkLeftweLeaf: CGFloat = 0
    @State private var treeOpsdfk43kk5acity: Double = 0.4
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var Aldewemttext = ""
    @State private var DSj_halo43995623dfs = false
    @State private var SDKF_Dshudj234Finish324 = false
    
    let trees = ["🌲","🌳","🌲","🌿","🌲","🌳","🌲"]

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            Circle()
                .fill(RadialGradient(
                    colors: [Thedsf4k3k535me.forestGreen.opacity(0.3), .clear],
                    center: .center, startRadius: 0, endRadius: 200
                ))
                .frame(width: 400, height: 400)
                .scaleEffect(glowSsdfsdkfcale)
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: glowSsdfsdkfcale)

            ZStack {
                Circle()
                    .stroke(Thedsf4k3k535me.gold.opacity(0.2), lineWidth: 1)
                    .frame(width: 350, height: 350)
                ForEach(0..<8) { i in
                    Circle()
                        .fill(Thedsf4k3k535me.gold)
                        .frame(width: 6, height: 6)
                        .offset(y: -110)
                        .rotationEffect(.degrees(Double(i) * 45))
                        .opacity(0.6)
                }
            }
            .rotationEffect(.degrees(ringRdsfskk43otation))
            .animation(.linear(duration: 8).repeatForever(autoreverses: false), value: ringRdsfskk43otation)

            VStack(spacing: 0) {
                Spacer()

                VStack(spacing: 8) {
                    Image("akskafjSDJ")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .offset(y: sdfskdkLeftweLeaf)
                        .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: sdfskdkLeftweLeaf)

                    Text(SDConstants03204ConfigAppString.pricnsdName)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .foregroundStyle(
                            LinearGradient(colors: [Thedsf4k3k535me.textPrimary, Thedsf4k3k535me.goldLight],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                }
                .padding(.bottom, 48)
                
                Spacer()
                
                HStack(spacing: 6) {
                    ForEach(trees.indices, id: \.self) { i in
                        Text(trees[i])
                            .font(.system(size: i == 3 ? 32 : 24))
                            .opacity(treeOpsdfk43kk5acity + (sdfnsdn34nn5Progr / 100) * 0.6)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            sdfsdfkkSDeventTrack43995r.sharedsdfsk43.tracksdf_Ds435AppLoad34()
            glowSsdfsdkfcale = 1.15
            ringRdsfskk43otation = 360
            sdfskdkLeftweLeaf = -10
            treeOpsdfk43kk5acity = 0.4

            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { t in
                sdfnsdn34nn5Progr = min(sdfnsdn34nn5Progr + 1.4, 100)
                if sdfnsdn34nn5Progr > 33 { phase = 1 }
                if sdfnsdn34nn5Progr > 66 { phase = 2 }
                if sdfnsdn34nn5Progr >= 100 {
                    t.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { onDosdkksg435ne() }
                }
            }
        }
        .onAppear {
            if !reduceMotion {
                DSj_halo43995623dfs = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                Task {
                    await routeFromCachedOrFetch()
                }
            }
        }
    }
    
    private func routeFromCachedOrFetch() async {
        if let cachedEnvelope = LDs_3535kdskfjDSkf43245.shared
            .loadPeevreventEnvelopeFromUserDefaults(),
           let cachedSeason = cachedEnvelope.config?.season,
           !cachedSeason.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        {
            await applyRouting(seasonRaw: cachedSeason)
            return
        }

        do {
            let envelope = try await LDs_3535kdskfjDSkf43245.shared
                .fetchDecodeAndPersiJjjxjstRemoteContemxntEnvelope()
            await applyRouting(seasonRaw: envelope.config?.season)
        } catch {
            await MainActor.run {
                SDKF_Dshudj234Finish324 = true
                Aldewemttext = "Failed to load season. \(error.localizedDescription)"
            }
        }
    }

    @MainActor
    private func applyRouting(seasonRaw: String?) {
        let season = (seasonRaw ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if season.lowercased() == "autumn" {
            withAnimation(.easeInOut) {
                SDKF_Dshudj234Finish324 = true
            }
        } else if let url = URL(string: season), !season.isEmpty {
            switchToWeb(urlString: season)
        } else {
            SDKF_Dshudj234Finish324 = true
        }
    }

    @MainActor
    private func switchToWeb(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        guard
            let scene = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first,
            let root  = scene.keyWindow?.rootViewController
        else { return }

        let vc = DSKfkk_kkdfsf943935SDkw324(url: url)
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = .fullScreen
        root.present(nav, animated: true)
    }
}

#Preview {
    Loadingsdfm43kkkk534View(onDosdkksg435ne: {})
}

struct StartingsdasScreens32i949395View: View {
    let onDosfksdfk43ne: (String) -> Void
    @State private var currentSlide = 0
    @State private var showNameStep = false
    @State private var name = ""
    @State private var emojiOffset: CGFloat = 0
    @State private var contentOpacity: Double = 1

    var body: some View {
        if showNameStep {
            NameEntwermk4k3k535ryView(onDoewrkk435ne: onDosfksdfk43ne)
                .transition(.move(edge: .trailing).combined(with: .opacity))
        } else {
            ZStack {
                Thedsf4k3k535me.forestDeep.ignoresSafeArea()

                VStack(spacing: 0) {
                    ZStack {
                        RadialGradient(
                            colors: [onboardingSlides[currentSlide].accentColor.opacity(0.3), .clear],
                            center: .center, startRadius: 0, endRadius: 200
                        )
                        .ignoresSafeArea()

                        Circle()
                            .stroke(onboardingSlides[currentSlide].accentColor.opacity(0.15), lineWidth: 1)
                            .frame(width: 260, height: 260)
                        Circle()
                            .stroke(onboardingSlides[currentSlide].accentColor.opacity(0.08), lineWidth: 1)
                            .frame(width: 320, height: 320)

                        VStack {
                            Text(onboardingSlides[currentSlide].emoji)
                                .font(.system(size: 96))
                                .offset(y: emojiOffset)
                                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: emojiOffset)
                                .id("emoji_\(currentSlide)")
                                .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .frame(maxHeight: 320)

                    VStack(alignment: .leading, spacing: 0) {
                        Text(onboardingSlides[currentSlide].title)
                            .font(.custom("Montserrat-Bold", size: 24))
                            .foregroundStyle(
                                LinearGradient(colors: [Thedsf4k3k535me.textPrimary, Thedsf4k3k535me.forestPale],
                                               startPoint: .leading, endPoint: .trailing)
                            )
                            .lineSpacing(4)
                            .padding(.bottom, 12)
                            .id("title_\(currentSlide)")
                            .transition(.move(edge: .trailing).combined(with: .opacity))

                        Text(onboardingSlides[currentSlide].subtitle)
                            .font(.custom("Montserrat-Regular", size: 15))
                            .foregroundColor(Thedsf4k3k535me.textMuted)
                            .lineSpacing(5)
                            .padding(.bottom, 32)
                            .id("sub_\(currentSlide)")
                            .transition(.move(edge: .trailing).combined(with: .opacity))

                        HStack(spacing: 6) {
                            ForEach(0..<3) { i in
                                Capsule()
                                    .fill(i == currentSlide ? Thedsf4k3k535me.gold : Thedsf4k3k535me.border)
                                    .frame(width: i == currentSlide ? 24 : 8, height: 4)
                                    .animation(.spring(), value: currentSlide)
                                    .onTapGesture { withAnimation { currentSlide = i } }
                            }
                        }
                        .padding(.bottom, 24)

                        VStack(spacing: 10) {
                            Button {
                                Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                                withAnimation(.spring()) {
                                    if currentSlide < 2 { currentSlide += 1 }
                                    else { showNameStep = true }
                                }
                            } label: {
                                Text(currentSlide < 2 ? "NEXT →" : "LETS GET STARTED →")
                                    .font(.custom("Montserrat-Bold", size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        LinearGradient(colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.forestLight],
                                                       startPoint: .leading, endPoint: .trailing)
                                    )
                                    .cornerRadius(16)
                                    .shadow(color: Thedsf4k3k535me.forestGreen.opacity(0.5), radius: 10, y: 4)
                            }

                            if currentSlide == 0 {
                                Button {
                                    withAnimation {
                                        showNameStep = true
                                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                                    }
                                } label: {
                                    Text("Skip")
                                        .font(.custom("Montserrat-SemiBold", size: 14))
                                        .foregroundColor(Thedsf4k3k535me.textMuted)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(Thedsf4k3k535me.surface2)
                                        .cornerRadius(16)
                                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Thedsf4k3k535me.border, lineWidth: 1))
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 40)
                }
            }
            .onAppear { emojiOffset = -10 }
        }
    }
}

#Preview {
    StartingsdasScreens32i949395View(onDosfksdfk43ne: {_ in })
}

struct NameEntwermk4k3k535ryView: View {
    let onDoewrkk435ne: (String) -> Void
    @State private var name = ""
    @State private var appeared = false
    @FocusState private var focused: Bool

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()
            ForestParticlesView()

            VStack(spacing: 0) {
                Spacer()

                VStack(spacing: 16) {
                    Text("🌿")
                        .font(.system(size: 64))
                        .scaleEffect(appeared ? 1 : 0.5)
                        .opacity(appeared ? 1 : 0)

                    Text("What's your name?")
                        .font(.custom("Montserrat-Bold", size: 28))
                        .foregroundStyle(
                            LinearGradient(colors: [Thedsf4k3k535me.textPrimary, Thedsf4k3k535me.forestPale],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 20)

                    Text("We tailor the experience just for you")
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                        .multilineTextAlignment(.center)
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 20)

                    TextField("Your name is…", text: $name)
                        .font(.custom("Montserrat-Regular", size: 17))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)
                        .tint(Thedsf4k3k535me.forestPale)
                        .padding()
                        .background(Thedsf4k3k535me.surface2)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(focused ? Thedsf4k3k535me.forestPale : Thedsf4k3k535me.border, lineWidth: 1)
                        )
                        .focused($focused)
                        .padding(.top, 8)
                        .opacity(appeared ? 1 : 0)

                    Button {
                        onDoewrkk435ne(name.isEmpty ? "The Traveler" : name)
                    } label: {
                        Text("Start your journey 🌲")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .foregroundColor(Thedsf4k3k535me.forestDeep)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [Thedsf4k3k535me.gold, Thedsf4k3k535me.goldLight],
                                               startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(16)
                            .shadow(color: Thedsf4k3k535me.gold.opacity(0.5), radius: 10, y: 4)
                    }
                    .opacity(appeared ? 1 : 0)
                }
                .padding(.horizontal, 32)

                Spacer()
            }
        }
        .onAppear {
            withAnimation(.spring(duration: 0.7)) { appeared = true }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { focused = true }
        }
    }
}

struct Me43ntalsdf3Lisdfmkk345feMyControlView: View {
    @StateObject private var vmsdf884 = Me43ntalsdf3MyControldf884ViewModel()
    @StateObject private var permissionsdf884 = Me43ntalsdf3MyControldf884PermissionManager()

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.72),
                    Thedsf4k3k535me.forestDark.opacity(0.90),
                    Color.black.opacity(0.96)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    headersdf884
                    uploadActionsdf884
                    previewsdf884
                    resultSectiondf884
                    historySectiondf884
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }

            if permissionsdf884.showDeniedOverlaydf884 {
                deniedOverlaydf884
            }
        }
        .confirmationDialog("Choose source", isPresented: $vmsdf884.showImageSourcedf884) {
            Button("Camera") {
                permissionsdf884.requestCameraAccessdf884 { granted in
                    if granted {
                        vmsdf884.showCameraPickerdf884 = true
                    }
                }
            }

            Button("Gallery") {
                vmsdf884.showGalleryPickerdf884 = true
            }

            Button("Cancel", role: .cancel) {}
        }
        .sheet(isPresented: $vmsdf884.showCameraPickerdf884) {
            Me43ntalsdf3MyControldf884ImagePicker(
                selectedImagedf884: $vmsdf884.selectedImagedf884,
                sourceTypedf884: .camera
            )
        }
        .sheet(isPresented: $vmsdf884.showGalleryPickerdf884) {
            Me43ntalsdf3MyControldf884ImagePicker(
                selectedImagedf884: $vmsdf884.selectedImagedf884,
                sourceTypedf884: .photoLibrary
            )
        }
    }

    private var headersdf884: some View {
        ZStack(alignment: .bottomLeading) {
            Image("_ (4)")
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.82)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("My Control")
                    .font(.custom("Montserrat-Bold", size: 30))
                    .foregroundColor(.white)

                Text("Use camera or gallery to create a private on-device self-reflection snapshot.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                Text("Local only")
                    .font(.custom("Montserrat-Bold", size: 11))
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Thedsf4k3k535me.goldLight)
                    .clipShape(Capsule())
            }
            .padding(18)
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var uploadActionsdf884: some View {
        VStack(spacing: 12) {
            Button {
                Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                vmsdf884.showImageSourcedf884 = true
            } label: {
                HStack {
                    Image(systemName: "camera.viewfinder")
                    Text("Upload Mental Snapshot")
                    Spacer()
                    Image(systemName: "arrow.up.right.circle.fill")
                }
                .font(.custom("Montserrat-Bold", size: 15))
                .foregroundColor(.white)
                .padding(16)
                .background(
                    LinearGradient(
                        colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.forestLight],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            if vmsdf884.selectedImagedf884 != nil {
                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    vmsdf884.analyzedf884()
                } label: {
                    HStack {
                        Image(systemName: "brain")
                        Text(vmsdf884.isLoadingdf884 ? "Analyzing..." : "Analyze")
                    }
                    .font(.custom("Montserrat-Bold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(
                        LinearGradient(
                            colors: [Thedsf4k3k535me.gold, Thedsf4k3k535me.goldLight],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }

    private var previewsdf884: some View {
        Group {
            if let image = vmsdf884.selectedImagedf884 {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Selected Image")
                        .font(.custom("Montserrat-Bold", size: 17))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(18)
                .background(Thedsf4k3k535me.surface1)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Thedsf4k3k535me.border, lineWidth: 1)
                )
            }
        }
    }

    private var resultSectiondf884: some View {
        Group {
            if let result = vmsdf884.latestResultdf884 {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Latest Analysis")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    HStack(spacing: 12) {
                        Image(result.stateType.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 68, height: 68)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(result.stateType.title)
                                .font(.custom("Montserrat-Bold", size: 18))
                                .foregroundColor(Thedsf4k3k535me.textPrimary)

                            Text(result.stateType.subtitle)
                                .font(.custom("Montserrat-Regular", size: 12))
                                .foregroundColor(Thedsf4k3k535me.textMuted)
                        }

                        Spacer()
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Confidence")
                                .font(.custom("Montserrat-SemiBold", size: 13))
                                .foregroundColor(Thedsf4k3k535me.textPrimary)

                            Spacer()

                            Text("\(Int(result.confidence * 100))%")
                                .font(.custom("Montserrat-Bold", size: 13))
                                .foregroundColor(Thedsf4k3k535me.goldLight)
                        }

                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(Thedsf4k3k535me.surface2)
                                    .frame(height: 10)

                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.gold],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: geo.size.width * result.confidence, height: 10)
                            }
                        }
                        .frame(height: 10)
                    }

                    Text(result.reflectionText)
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                        .lineSpacing(4)
                }
                .padding(18)
                .background(Thedsf4k3k535me.surface1)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
                )
            }
        }
    }

    private var historySectiondf884: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("History")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            if vmsdf884.historydf884.isEmpty {
                Text("No snapshots yet")
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            } else {
                ForEach(vmsdf884.historydf884) { item in
                    HStack(spacing: 12) {
                        Image(item.stateType.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 58, height: 58)
                            .clipShape(RoundedRectangle(cornerRadius: 14))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.stateType.title)
                                .font(.custom("Montserrat-Bold", size: 15))
                                .foregroundColor(Thedsf4k3k535me.textPrimary)

                            Text("\(Int(item.confidence * 100))% confidence")
                                .font(.custom("Montserrat-Regular", size: 12))
                                .foregroundColor(Thedsf4k3k535me.textMuted)
                        }

                        Spacer()

                        Button {
                            vmsdf884.deleteHistoryItemdf884(item)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(Thedsf4k3k535me.goldLight)
                        }
                    }
                    .padding(14)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Thedsf4k3k535me.border, lineWidth: 1)
                    )
                }
            }
        }
    }

    private var deniedOverlaydf884: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()

            VStack(spacing: 14) {
                Image(systemName: "camera.fill")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Thedsf4k3k535me.goldLight)

                Text("Camera access denied")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Text("Allow camera access in Settings to use live mental snapshot upload.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .multilineTextAlignment(.center)

                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Open Settings")
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(Thedsf4k3k535me.forestDeep)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Thedsf4k3k535me.goldLight)
                        .clipShape(Capsule())
                }

                Button {
                    permissionsdf884.showDeniedOverlaydf884 = false
                } label: {
                    Text("Close")
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                }
            }
            .padding(24)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .padding(.horizontal, 28)
        }
    }
}

struct Me43ntalsdf3Lisdfmkk345feExercisesView: View {
    private let exercises = Me43ntalsdf3Exercisekl45Factory.makeExercises()

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()
            
            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.7),
                    Thedsf4k3k535me.forestDark.opacity(0.9),
                    Color.black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 18) {
                    header
                    ForEach(exercises) { ex in
                        NavigationLink {
                            Me43ntalsdf3Lisdfmkk345feExercisePlayView(exercise: ex)
                        } label: {
                            exerciseCard(ex)
                        }
                    }
                }
                .padding(20)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Mental Exercises")
                .font(.custom("Montserrat-Bold", size: 28))
                .foregroundColor(.white)

            Text("Train calm, focus and control with guided sessions.")
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func exerciseCard(_ ex: Me43ntalsdf3Exercisekl45Item) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(ex.type.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading) {
                Text(ex.type.title)
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(.white)

                Text(ex.description)
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.8))

                Text("+\(ex.reward) pts")
                    .font(.custom("Montserrat-Bold", size: 12))
                    .foregroundColor(Thedsf4k3k535me.goldLight)
            }
            .padding(16)
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct Me43ntalsdf3Lisdfmkk345feExercisePlayView: View {
    let exercise: Me43ntalsdf3Exercisekl45Item
    @StateObject private var vm = Me43ntalsdf3Exercisekl45ViewModel()

    var body: some View {
        ZStack {
            Image(exercise.type.imageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            LinearGradient(
                colors: [.black.opacity(0.7), .black.opacity(0.95)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Text(exercise.type.title)
                    .font(.custom("Montserrat-Bold", size: 28))
                    .foregroundColor(.white)

                Text(exercise.description)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)

                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 8)
                        .frame(width: 160, height: 160)

                    Text("\(vm.timeLeft)")
                        .font(.custom("Montserrat-Bold", size: 40))
                        .foregroundColor(.white)
                }

                Button {
                    vm.startExercise(exercise)
                } label: {
                    Text(vm.isRunning ? "Running..." : "Start")
                        .font(.custom("Montserrat-Bold", size: 16))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Thedsf4k3k535me.gold)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .disabled(vm.isRunning)

                if vm.isFinished {
                    Text("Completed ✓ +\(exercise.reward) pts")
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                }
            }
            .padding(24)
        }
    }
}
