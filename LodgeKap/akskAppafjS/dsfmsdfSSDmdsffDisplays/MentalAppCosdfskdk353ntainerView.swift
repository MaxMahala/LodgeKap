import SwiftUI

struct MentalAppCosdfskdk353ntainerView: View {
    @EnvironmentObject private var routsdfnn35er: SDKKSDKRouterMasndnDosd23

    var body: some View {
        NavigationStack(path: $routsdfnn35er.path) {
            ZStack(alignment: .bottom) {
                Thedsf4k3k535me.forestDeep.ignoresSafeArea()

                Group {
                    switch routsdfnn35er.selectedTab {
                    case .dashboard:
                        Me43ntalsdf3Lisdfmkk345feDashboardView()
                    case .tasks:
                        Mesdf4235LSfTasksHomedsf34View()
                    case .quizzes:
                        Me43ntalsdf3Lisdfmkk345feQuizzesHomeView()
                    case .journal:
                        Me43ntalsdf3Lisdfmkk345feJournalView()
                    case .profile:
                        Me43ntalsdf3Lisdfmkk345feProfileView()
                    }
                }
                .padding(.bottom, 92)

                MentalsdfeTdfmsm3435abBar(selectedTab: $routsdfnn35er.selectedTab)
            }
            .navigationDestination(for: Mentalsdfsdmm34D324Route.self) { route in
                sdfk334RouteDestinationView(route)
            }
        }
    }
    
    @ViewBuilder
    private func sdfk334RouteDestinationView(_ route: Mentalsdfsdmm34D324Route) -> some View {
        switch route {
        case .insights:
            Me43ntalsdf3Lisdfmkk345feInsightsView()

        case .exercises:
            Me43ntalsdf3Lisdfmkk345feExercisesView()

        case .dailyTasks:
            Mesdf4235LSfTasksHomedsf34View()

        case .quizzes:
            Me43ntalsdf3Lisdfmkk345feQuizzesHomeView()

        case .journal:
            Me43ntalsdf3Lisdfmkk345feJournalView()

        case .reflection:
            Me43ntalsdf3Lisdfmkk345feReflectionView()

        case .myControl:
            Me43ntalsdf3Lisdfmkk345feMyControlView()

        case .settings:
            Me43ntalsdf3Lisdfmkk345feSettingsView()

        case .growth:
            Me43ntalsdf3Lisdfmkk345feGrowthView()

        case .taskDetails(let title):
            Me43ntalsdf3Tas4kDetaisdfk554View(titlesdfk554: title)

        case .quizDetails(let title):
            Me43ntalsdf3Qui5zDetaisdfk554View(titlesdfk554: title)

        case .MindMapsdf:
            Me43ntalsdf3Lisdfmkk345feMindMapView()
        }
    }
}

#Preview {
    MentalAppCosdfskdk353ntainerView()
        .environmentObject(SDKKSDKRouterMasndnDosd23())
}

struct Me43ntalsdf3Lisdfmkk345feDashboardView: View {
    @StateObject private var statsvm433 = Mentalsdf43ll5DashboardStatsViewModel()
    @EnvironmentObject private var routsdfnn35er: SDKKSDKRouterMasndnDosd23

    private let forestCards = [
        "forest1", "forest2", "forest3", "forest5", "forest6", "forest7"
    ]

    private let weekStats: [DayMentalStat] = [
        .init(day: "Mon", value: 0.62),
        .init(day: "Tue", value: 0.74),
        .init(day: "Wed", value: 0.58),
        .init(day: "Thu", value: 0.81),
        .init(day: "Fri", value: 0.69),
        .init(day: "Sat", value: 0.88),
        .init(day: "Sun", value: 0.76)
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 18) {
                header
                heroCard
                statsGrid
                imageMomentsSection
                quickGrid
                weeklyProgressSection
                journeySection
                reflectionCard
            }
            .padding(.horizontal, 20)
            .padding(.top, 18)
            .padding(.bottom, 130)
        }
        .onAppear {
            statsvm433.loadStats()
        }
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Hello, \(routsdfnn35er.userName.isEmpty ? "Traveler" : routsdfnn35er.userName)")
                    .font(.custom("Montserrat-Bold", size: 28))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Text("Your forest of self-growth is waiting today")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
            }

            Spacer()

            HStack(spacing: 10) {
                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    routsdfnn35er.push(.growth)
                } label: {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Thedsf4k3k535me.goldPale)
                        .frame(width: 46, height: 46)
                        .background(Thedsf4k3k535me.surface2)
                        .clipShape(Circle())
                }

                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    routsdfnn35er.push(.settings)
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Thedsf4k3k535me.goldPale)
                        .frame(width: 46, height: 46)
                        .background(Thedsf4k3k535me.surface2)
                        .clipShape(Circle())
                }
            }
        }
    }

    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest1")
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .clipped()

            LinearGradient(
                colors: [
                    .clear,
                    Color.black.opacity(0.15),
                    Color.black.opacity(0.78)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                    Text("TODAY")
                        .font(.custom("Montserrat-Bold", size: 11))
                        .foregroundColor(Thedsf4k3k535me.forestDeep)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Thedsf4k3k535me.goldLight)
                        .clipShape(Capsule())

                    Text("Streak \(statsvm433.stats.currentStreak) days")
                        .font(.custom("Montserrat-SemiBold", size: 11))
                        .foregroundColor(Thedsf4k3k535me.goldPale)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.black.opacity(0.28))
                        .clipShape(Capsule())
                }

                Text("Your mind is calmer than yesterday")
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(.white)

                Text("Keep your rhythm with reflection, breathing and one mindful task.")
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.84))
                    .lineSpacing(4)

                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    routsdfnn35er.push(.dailyTasks)
                } label: {
                    HStack(spacing: 8) {
                        Text("Open Daily Flow")
                            .font(.custom("Montserrat-Bold", size: 14))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Thedsf4k3k535me.goldLight)
                    .clipShape(Capsule())
                }
            }
            .padding(18)
        }
        .frame(height: 220)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
        .shadow(color: Thedsf4k3k535me.forestGreen.opacity(0.18), radius: 16, y: 8)
    }

    private var statsGrid: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Mental Stats")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("Updated today")
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                statCard(title: "Focus", value: "\(statsvm433.stats.focusScore)", subtitle: "Very stable", icon: "scope")
                statCard(title: "Calm", value: "\(statsvm433.stats.calmScore)", subtitle: "Good balance", icon: "leaf.fill")
                statCard(title: "Streak", value: "\(statsvm433.stats.currentStreak)", subtitle: "Rising", icon: "shield.fill")
                statCard(title: "Energy", value: "\(statsvm433.stats.growthScore)", subtitle: "High today", icon: "bolt.fill")
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func statCard(title: String, value: String, subtitle: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Thedsf4k3k535me.goldLight)

                Spacer()

                Circle()
                    .fill(Thedsf4k3k535me.forestLight.opacity(0.22))
                    .frame(width: 8, height: 8)
            }

            Text(value)
                .font(.custom("Montserrat-Bold", size: 24))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Text(subtitle)
                    .font(.custom("Montserrat-Regular", size: 11))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                colors: [
                    Thedsf4k3k535me.surface2,
                    Thedsf4k3k535me.forestDark.opacity(0.7)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var imageMomentsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Forest Moments")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text("Visual spaces for calm, focus and reflection")
                .font(.custom("Montserrat-Regular", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(forestCards, id: \.self) { image in
                        imageMiniCard(image: image)
                            .onTapGesture {
                                routsdfnn35er.push(.taskDetails("Morning breathing"))
                            }
                    }
                }
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func imageMiniCard(image: String) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 170)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.75)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(image.capitalized)
                    .font(.custom("Montserrat-Bold", size: 14))
                    .foregroundColor(.white)

                Text("Mind reset")
                    .font(.custom("Montserrat-Regular", size: 11))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(12)
        }
        .frame(width: 150, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Thedsf4k3k535me.border.opacity(0.7), lineWidth: 1)
        )
    }

    private var quickGrid: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Quick Access")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                dashboardButton(
                    title: "Insights",
                    subtitle: "Daily patterns",
                    icon: "sparkles",
                    image: "forest3",
                    action: { routsdfnn35er.push(.insights) }
                )
                dashboardButton(
                    title: "Exercises",
                    subtitle: "Breathing & calm",
                    icon: "figure.mind.and.body",
                    image: "forest5",
                    action: { routsdfnn35er.push(.exercises) }
                )
                dashboardButton(
                    title: "Quizzes",
                    subtitle: "Check your state",
                    icon: "brain",
                    image: "forest2",
                    action: { routsdfnn35er.push(.quizzes) }
                )
                dashboardButton(
                    title: "My Control",
                    subtitle: "Build discipline",
                    icon: "shield.lefthalf.filled",
                    image: "forest6",
                    action: { routsdfnn35er.push(.myControl) }
                )
                
                dashboardButton(
                    title: "Mind Map",
                    subtitle: "Explore your inner branches",
                    icon: "point.3.connected.trianglepath.dotted",
                    image: "img_map_1",
                    action: {
                        routsdfnn35er.push(.MindMapsdf)
                    }
                )
            }
        }
    }

    private func dashboardButton(
        title: String,
        subtitle: String,
        icon: String,
        image: String,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            action()
        } label: {
            ZStack(alignment: .bottomLeading) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .frame(width: 150)
                    .clipped()

                LinearGradient(
                    colors: [.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                )

                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Thedsf4k3k535me.goldLight)

                    Text(title)
                        .font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(.white.opacity(0.78))
                }
                .padding(14)
            }
            .frame(width: 150, height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Thedsf4k3k535me.border, lineWidth: 1)
            )
        }
    }

    private var weeklyProgressSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Weekly Balance")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("+18% this week")
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .foregroundColor(Thedsf4k3k535me.goldLight)
            }

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(weekStats) { item in
                    VStack(spacing: 8) {
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Thedsf4k3k535me.surface2)
                                .frame(height: 110)

                            RoundedRectangle(cornerRadius: 12)
                                .fill(
                                    LinearGradient(
                                        colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.goldLight],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .frame(height: 110 * item.value)
                        }

                        Text(item.day)
                            .font(.custom("Montserrat-Regular", size: 11))
                            .foregroundColor(Thedsf4k3k535me.textMuted)
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            VStack(spacing: 10) {
                progressRow(title: "Mindfulness", value: 0.84)
                progressRow(title: "Focus training", value: 0.71)
                progressRow(title: "Reflection consistency", value: 0.63)
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func progressRow(title: String, value: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.custom("Montserrat-SemiBold", size: 13))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("\(Int(value * 100))%")
                    .font(.custom("Montserrat-Bold", size: 12))
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
                        .frame(width: geo.size.width * value, height: 10)
                }
            }
            .frame(height: 10)
        }
    }

    private var journeySection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Your Journey")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            journeyRow(
                title: "Reflection",
                subtitle: "Write what you felt today",
                image: "forest7",
                route: .reflection
            )

            journeyRow(
                title: "Journal",
                subtitle: "Save your thoughts and progress",
                image: "forest6",
                route: .journal
            )

            journeyRow(
                title: "Growth",
                subtitle: "Track your self-improvement path",
                image: "forest2",
                route: .growth
            )
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func journeyRow(
        title: String,
        subtitle: String,
        image: String,
        route: Mentalsdfsdmm34D324Route
    ) -> some View {
        Button {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            routsdfnn35er.push(route)
        } label: {
            HStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 58, height: 58)
                    .clipShape(RoundedRectangle(cornerRadius: 14))

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.custom("Montserrat-SemiBold", size: 15))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text(subtitle)
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(Thedsf4k3k535me.gold)
            }
            .padding()
            .background(Thedsf4k3k535me.surface2)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }

    private var reflectionCard: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest5")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .frame(maxWidth: .infinity)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.82)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Reflection of the day")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(.white)

                Text("A small calm thought today can become a strong inner forest tomorrow.")
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                HStack(spacing: 8) {
                    Image(systemName: "sparkles")
                    Text("Growth starts with awareness")
                }
                .font(.custom("Montserrat-SemiBold", size: 12))
                .foregroundColor(Thedsf4k3k535me.goldPale)
            }
            .padding(18)
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
        .onTapGesture {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            routsdfnn35er.push(.quizDetails("Reflection path"))
        }
    }
}

struct MentalsdfeTdfmsm3435abBar: View {
    @Binding var selectedTab: MentalLdsfm435Tab

    var body: some View {
        HStack {
            ForEach(MentalLdsfm435Tab.allCases, id: \.self) { tab in
                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    withAnimation(.spring()) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 18, weight: .bold))
                        Text(tab.rawValue)
                            .font(.custom("Montserrat-SemiBold", size: 11))
                    }
                    .foregroundColor(selectedTab == tab ? Thedsf4k3k535me.goldLight : Thedsf4k3k535me.textMuted)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        Group {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Thedsf4k3k535me.surface2)
                            }
                        }
                    )
                }
            }
        }
        .padding(10)
        .background(.black.opacity(0.35))
        .background(Thedsf4k3k535me.surface1)
        .clipShape(Capsule())
        .overlay(
            Capsule().stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
    }
}

struct Me43ntalsdf3Lisdfmkk345feMindMapView: View {
    @StateObject private var vmsdfk882 = Me43ntalsdf3MindM4pVmk882()

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
                    heroSectiondfk882
                    mapSectiondfk882
                    if let selected = vmsdfk882.selectedAreadfk882 {
                        selectedDetailSectiondfk882(selected)
                    }
                    quickLegendSectiondfk882
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }
        }
        .onAppear {
            vmsdfk882.loadDatasdfk882()
        }
    }

    private var heroSectiondfk882: some View {
        ZStack(alignment: .bottomLeading) {
            Image("img_map_1")
                .resizable()
                .scaledToFill()
                .frame(height: 235)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.22), .black.opacity(0.84)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Mind Map")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .foregroundColor(.white)

                Text(vmsdfk882.coreLevelTextdfk882)
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text("Tap each branch of your inner map to explore strengths, balance and next steps.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)
            }
            .padding(18)
        }
        .frame(height: 235)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var mapSectiondfk882: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Thedsf4k3k535me.surface1)

                RoundedRectangle(cornerRadius: 30)
                    .stroke(Thedsf4k3k535me.border, lineWidth: 1)

                coreConnectionsdfk882(in: geo.size)

                coreNodeViewdfk882
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)

                ForEach(vmsdfk882.nodeItemsdfk882) { node in
                    nodeButtondfk882(node)
                        .position(
                            x: geo.size.width * node.position.x,
                            y: geo.size.height * node.position.y
                        )
                }
            }
        }
        .frame(height: 520)
    }

    private func coreConnectionsdfk882(in size: CGSize) -> some View {
        ZStack {
            ForEach(vmsdfk882.nodeItemsdfk882) { node in
                Path { path in
                    let center = CGPoint(x: size.width / 2, y: size.height / 2)
                    let target = CGPoint(
                        x: size.width * node.position.x,
                        y: size.height * node.position.y
                    )

                    path.move(to: center)
                    path.addLine(to: target)
                }
                .stroke(
                    node.area.accentColor.opacity(0.35),
                    style: StrokeStyle(lineWidth: 2, dash: [6, 8])
                )
            }
        }
    }

    private var coreNodeViewdfk882: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Thedsf4k3k535me.gold.opacity(0.25),
                            Thedsf4k3k535me.forestGreen.opacity(0.18),
                            Thedsf4k3k535me.surface1
                        ],
                        center: .center,
                        startRadius: 10,
                        endRadius: 90
                    )
                )
                .frame(width: 150, height: 150)

            Circle()
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1.5)
                .frame(width: 150, height: 150)

            VStack(spacing: 8) {
                Image(systemName: "tree.fill")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Thedsf4k3k535me.goldLight)

                Text("Inner Core")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Text(vmsdfk882.coreLevelTextdfk882)
                    .font(.custom("Montserrat-Regular", size: 11))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 12)
        }
    }

    private func nodeButtondfk882(_ node: Me43ntalsdf3MindM4pNodek882) -> some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                vmsdfk882.selectedAreadfk882 = node.area
            }
        } label: {
            ZStack(alignment: .bottomLeading) {
                Image(node.area.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 138, height: 148)
                    .clipped()

                LinearGradient(
                    colors: [.clear, .black.opacity(0.82)],
                    startPoint: .top,
                    endPoint: .bottom
                )

                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Image(systemName: node.area.iconName)
                            .foregroundColor(node.area.accentColor)
                        Spacer()
                        Text(vmsdfk882.valueTextdfk882(for: node.area))
                            .font(.custom("Montserrat-Bold", size: 11))
                            .foregroundColor(Thedsf4k3k535me.goldPale)
                    }

                    Text(node.area.title)
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(.white)

                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.white.opacity(0.14))
                                .frame(height: 6)

                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [node.area.accentColor, Thedsf4k3k535me.goldLight],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geo.size.width * max(0.08, node.progress), height: 6)
                        }
                    }
                    .frame(height: 6)
                }
                .padding(12)
            }
            .frame(width: 138, height: 148)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        vmsdfk882.selectedAreadfk882 == node.area
                        ? Thedsf4k3k535me.borderGold
                        : Thedsf4k3k535me.border,
                        lineWidth: 1.4
                    )
            )
            .shadow(color: node.area.accentColor.opacity(0.18), radius: 12, y: 6)
        }
    }

    private func selectedDetailSectiondfk882(_ area: Me43ntalsdf3MindM4pAreak882) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(area.title)
                    .font(.custom("Montserrat-Bold", size: 22))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text(vmsdfk882.valueTextdfk882(for: area))
                    .font(.custom("Montserrat-Bold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.goldLight)
            }

            Text(area.descriptionText)
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(4)

            Text(vmsdfk882.recommendationTextdfk882(for: area))
                .font(.custom("Montserrat-SemiBold", size: 13))
                .foregroundColor(area.accentColor)
                .lineSpacing(4)

            HStack(spacing: 12) {
                detailMiniCarddfk882(title: "Branch", value: area.title)
                detailMiniCarddfk882(title: "State", value: vmsdfk882.valueTextdfk882(for: area))
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private func detailMiniCarddfk882(title: String, value: String) -> some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.goldLight)

            Text(title)
                .font(.custom("Montserrat-Regular", size: 11))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Thedsf4k3k535me.surface2)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var quickLegendSectiondfk882: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Map Meaning")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ForEach(Me43ntalsdf3MindM4pAreak882.allCases) { area in
                HStack(spacing: 12) {
                    Image(systemName: area.iconName)
                        .foregroundColor(area.accentColor)
                        .frame(width: 38, height: 38)
                        .background(Thedsf4k3k535me.surface2)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(area.title)
                            .font(.custom("Montserrat-Bold", size: 14))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)

                        Text(area.descriptionText)
                            .font(.custom("Montserrat-Regular", size: 12))
                            .foregroundColor(Thedsf4k3k535me.textMuted)
                            .lineLimit(2)
                    }

                    Spacer()
                }
                .padding(12)
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }
}
