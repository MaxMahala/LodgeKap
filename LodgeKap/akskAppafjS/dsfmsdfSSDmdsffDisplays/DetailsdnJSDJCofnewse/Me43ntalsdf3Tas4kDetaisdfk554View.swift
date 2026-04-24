import SwiftUI

struct Me43ntalsdf3Tas4kDetaisdfk554View: View {
    let titlesdfk554: String
    @State private var isCompleteddfk554 = false
    @State private var showSharedfk554 = false

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
                    heroCardsdfk554
                    overviewCarddfk554
                    actionsCarddfk554
                    rewardsCarddfk554
                    buttonsCarddfk554
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 120)
            }
        }
        .sheet(isPresented: $showSharedfk554) {
            Me43ntalsdf3Refl3ctionShareSheetk554(
                itemsk554: [
                    "Task: \(titlesdfk554)\nStatus: \(isCompleteddfk554 ? "Completed" : "In progress")"
                ]
            )
        }
    }

    private var heroCardsdfk554: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest1")
                .resizable()
                .scaledToFill()
                .frame(height: 230)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.2), .black.opacity(0.82)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Task Details")
                    .font(.custom("Montserrat-Bold", size: 30))
                    .foregroundColor(.white)

                Text(titlesdfk554)
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text("A small mindful action can create meaningful inner progress.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)
            }
            .padding(18)
        }
        .frame(height: 230)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var overviewCarddfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Overview")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            detailRowsdfk554(title: "Type", value: "Daily Growth Task")
            detailRowsdfk554(title: "Difficulty", value: "Medium")
            detailRowsdfk554(title: "Duration", value: "10–15 min")
            detailRowsdfk554(title: "Status", value: isCompleteddfk554 ? "Completed" : "Active")
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var actionsCarddfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Suggested Actions")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            actionsRowsdfk554(icon: "leaf.fill", title: "Pause and observe")
            actionsRowsdfk554(icon: "wind", title: "Take 3 slow breaths")
            actionsRowsdfk554(icon: "checkmark.seal.fill", title: "Complete one intentional step")
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var rewardsCarddfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Rewards")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            HStack(spacing: 12) {
                rewardMiniCarddfk554(title: "Points", value: "+12")
                rewardMiniCarddfk554(title: "Growth", value: "+6")
                rewardMiniCarddfk554(title: "Focus", value: "+3")
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

    private var buttonsCarddfk554: some View {
        VStack(spacing: 12) {
            Button {
                isCompleteddfk554.toggle()
            } label: {
                Text(isCompleteddfk554 ? "Mark as Active" : "Mark as Completed")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [Thedsf4k3k535me.gold, Thedsf4k3k535me.goldLight],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            Button {
                showSharedfk554 = true
            } label: {
                Text("Share Task")
                    .font(.custom("Montserrat-Bold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
                    )
            }
        }
    }

    private func detailRowsdfk554(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.custom("Montserrat-Regular", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            Spacer()

            Text(value)
                .font(.custom("Montserrat-Bold", size: 13))
                .foregroundColor(Thedsf4k3k535me.goldLight)
        }
    }

    private func actionsRowsdfk554(icon: String, title: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(Thedsf4k3k535me.goldLight)
                .frame(width: 38, height: 38)
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(title)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Spacer()
        }
        .padding(12)
        .background(Thedsf4k3k535me.surface2)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private func rewardMiniCarddfk554(title: String, value: String) -> some View {
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
}

struct Me43ntalsdf3Qui5zDetaisdfk554View: View {
    let titlesdfk554: String
    @State private var isFavoriteSdfk554 = false
    @State private var showSharedfk554 = false

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
                    heroCardsdfk554
                    infoCarddfk554
                    previewQuestionCarddfk554
                    rewardCarddfk554
                    actionButtonsdfk554
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 120)
            }
        }
        .sheet(isPresented: $showSharedfk554) {
            Me43ntalsdf3Refl3ctionShareSheetk554(
                itemsk554: [
                    "Quiz: \(titlesdfk554)\nMode: Mixed Answers\nStatus: Ready to play"
                ]
            )
        }
    }

    private var heroCardsdfk554: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest7")
                .resizable()
                .scaledToFill()
                .frame(height: 235)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.2), .black.opacity(0.84)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Quiz Details")
                    .font(.custom("Montserrat-Bold", size: 30))
                    .foregroundColor(.white)

                Text(titlesdfk554)
                    .font(.custom("Montserrat-Bold", size: 21))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text("Challenge your awareness through choice questions and written answers.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)
            }
            .padding(18)
        }
        .frame(height: 235)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var infoCarddfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Quiz Info")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            detailRowsdfk554(title: "Questions", value: "5")
            detailRowsdfk554(title: "Type", value: "Choice + Written")
            detailRowsdfk554(title: "Difficulty", value: "Interesting")
            detailRowsdfk554(title: "Reward", value: "+25 pts")
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var previewQuestionCarddfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Preview")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            VStack(alignment: .leading, spacing: 10) {
                Text("What helps calm the mind fastest?")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Text("One part of this quiz includes writing your own answer too, not only tapping options.")
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .lineSpacing(4)
            }
            .padding(14)
            .background(Thedsf4k3k535me.surface2)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var rewardCarddfk554: some View {
        HStack(spacing: 12) {
            rewardMiniCarddfk554(title: "Points", value: "+25")
            rewardMiniCarddfk554(title: "Focus", value: "+6")
            rewardMiniCarddfk554(title: "Reflection", value: "+8")
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var actionButtonsdfk554: some View {
        VStack(spacing: 12) {
            Button {
                isFavoriteSdfk554.toggle()
            } label: {
                Text(isFavoriteSdfk554 ? "Remove from Favorites" : "Add to Favorites")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [Thedsf4k3k535me.gold, Thedsf4k3k535me.goldLight],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            Button {
                showSharedfk554 = true
            } label: {
                Text("Share Quiz")
                    .font(.custom("Montserrat-Bold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
                    )
            }
        }
    }

    private func detailRowsdfk554(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.custom("Montserrat-Regular", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            Spacer()

            Text(value)
                .font(.custom("Montserrat-Bold", size: 13))
                .foregroundColor(Thedsf4k3k535me.goldLight)
        }
    }

    private func rewardMiniCarddfk554(title: String, value: String) -> some View {
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
}

struct Me43ntalsdf3Lisdfmkk345feInsightsView: View {
    @StateObject private var vmsdfk441 = Me43ntalsdf3Insi9ghtsVmk441()
    @State private var selectedCardIndexk441: Int = 0

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.70),
                    Thedsf4k3k535me.forestDark.opacity(0.88),
                    Color.black.opacity(0.96)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    heroSectionk441
                    quickInsightsSectionk441
                    summarySectionk441
                    strengthWeaknessSectionk441
                    weeklySectionk441
                    recommendationSectionk441
                    finalQuoteSectionk441
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }
        }
        .onAppear {
            vmsdfk441.loadDatasdfk441()
        }
    }

    private var heroSectionk441: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest1")
                .resizable()
                .scaledToFill()
                .frame(height: 235)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.18), .black.opacity(0.84)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Insights")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .foregroundColor(.white)

                Text(vmsdfk441.mindRankTitlesdfk441)
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text("Understand your patterns through growth, reflection, focus and calm.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                HStack(spacing: 8) {
                    heroChipk441(title: "Dominant: \(vmsdfk441.dominantStatesdfk441)")
                    heroChipk441(title: "\(vmsdfk441.statsk441.totalPoints) pts")
                }
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

    private func heroChipk441(title: String) -> some View {
        Text(title)
            .font(.custom("Montserrat-SemiBold", size: 11))
            .foregroundColor(Thedsf4k3k535me.goldPale)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(Color.black.opacity(0.24))
            .clipShape(Capsule())
    }

    private var quickInsightsSectionk441: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Quick Insights")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(vmsdfk441.quickInsightsk441) { item in
                    quickCardk441(item)
                }
            }
        }
    }

    private func quickCardk441(_ item: Me43ntalsdf3Insi9ghtsQuickItemk441) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: item.icon)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Thedsf4k3k535me.goldLight)

            Text(item.value)
                .font(.custom("Montserrat-Bold", size: 24))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text(item.title)
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var summarySectionk441: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Mind Summary")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text(vmsdfk441.summaryTextk441)
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(5)

            HStack(spacing: 12) {
                summaryMiniCardk441(title: "Focus", value: "\(vmsdfk441.statsk441.focusScore)%")
                summaryMiniCardk441(title: "Calm", value: "\(vmsdfk441.statsk441.calmScore)%")
                summaryMiniCardk441(title: "Reflection", value: "\(vmsdfk441.statsk441.reflectionScore)%")
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

    private func summaryMiniCardk441(title: String, value: String) -> some View {
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

    private var strengthWeaknessSectionk441: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 14) {
                bigStatusCardk441(
                    title: "Strongest Area",
                    value: vmsdfk441.dominantStatesdfk441,
                    imageName: "forest5",
                    accent: Thedsf4k3k535me.goldLight
                )
                
                bigStatusCardk441(
                    title: "Needs Care",
                    value: vmsdfk441.weakestAreasdfk441,
                    imageName: "forest6",
                    accent: Thedsf4k3k535me.forestPale
                )
            }
        }
    }

    private func bigStatusCardk441(title: String, value: String, imageName: String, accent: Color) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(.white.opacity(0.78))

                Text(value)
                    .font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(accent)
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.borderGold.opacity(0.5), lineWidth: 1)
        )
    }

    private var weeklySectionk441: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Weekly Balance")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("+\(max(vmsdfk441.statsk441.growthScore / 5, 1))%")
                    .font(.custom("Montserrat-Bold", size: 13))
                    .foregroundColor(Thedsf4k3k535me.goldLight)
            }

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(vmsdfk441.weeklyBarItemsk441) { item in
                    VStack(spacing: 8) {
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Thedsf4k3k535me.surface2)
                                .frame(height: 120)

                            RoundedRectangle(cornerRadius: 14)
                                .fill(
                                    LinearGradient(
                                        colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.gold],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .frame(height: max(18, 120 * item.value))
                        }

                        Text(item.day)
                            .font(.custom("Montserrat-Regular", size: 11))
                            .foregroundColor(Thedsf4k3k535me.textMuted)
                    }
                    .frame(maxWidth: .infinity)
                }
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

    private var recommendationSectionk441: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Recommended Paths")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            TabView(selection: $selectedCardIndexk441) {
                ForEach(Array(vmsdfk441.recommendationCardsk441.enumerated()), id: \.element.id) { index, item in
                    recommendationCardk441(item)
                        .tag(index)
                }
            }
            .frame(height: 220)

            HStack(spacing: 6) {
                ForEach(0..<vmsdfk441.recommendationCardsk441.count, id: \.self) { index in
                    Capsule()
                        .fill(index == selectedCardIndexk441 ? Thedsf4k3k535me.goldLight : Thedsf4k3k535me.surface2)
                        .frame(width: index == selectedCardIndexk441 ? 24 : 8, height: 5)
                }
            }
        }
    }

    private func recommendationCardk441(_ item: Me43ntalsdf3Insi9ghtsRecommendationk441) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.82)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.custom("Montserrat-Bold", size: 22))
                    .foregroundColor(.white)

                Text(item.subtitle)
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                Text(item.accentValue)
                    .font(.custom("Montserrat-Bold", size: 13))
                    .foregroundColor(Thedsf4k3k535me.goldPale)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(Color.black.opacity(0.22))
                    .clipShape(Capsule())
            }
            .padding(18)
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold.opacity(0.6), lineWidth: 1)
        )
    }

    private var finalQuoteSectionk441: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest8")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.82)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Insight Thought")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(.white)

                Text("Awareness grows when you stop running from your patterns and start understanding them.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.84))
                    .lineSpacing(4)
            }
            .padding(18)
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }
}
