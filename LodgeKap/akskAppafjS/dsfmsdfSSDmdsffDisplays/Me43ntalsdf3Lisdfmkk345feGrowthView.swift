import SwiftUI

struct Me43ntalsdf3Lisdfmkk345feGrowthView: View {
    @StateObject private var vmsdfk998 = Me43ntalsdf3Growt8hVmk998()

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
                    heroCardsdfk998
                    levelCardsdfk998
                    weeklyGrowthsdfk998
                    milestoneSectionsdfk998
                    unlockSectionk998
                    quoteSectionk998
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }
        }
        .onAppear {
            vmsdfk998.loadDatasdfk998()
        }
    }

    private var heroCardsdfk998: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest5")
                .resizable()
                .scaledToFill()
                .frame(height: 235)
                .frame(maxWidth: .infinity)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.18), .black.opacity(0.84)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Growth")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .foregroundColor(.white)

                Text(vmsdfk998.growthTitlek998)
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text("Watch your inner world evolve through focus, calm, reflection and consistency.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                HStack(spacing: 8) {
                    growthBadgesdfk998(title: "Level \(vmsdfk998.levelk998)")
                    growthBadgesdfk998(title: "\(vmsdfk998.statsk998.totalPoints) pts")
                    growthBadgesdfk998(title: "\(vmsdfk998.statsk998.currentStreak) day streak")
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

    private func growthBadgesdfk998(title: String) -> some View {
        Text(title)
            .font(.custom("Montserrat-SemiBold", size: 11))
            .foregroundColor(Thedsf4k3k535me.goldPale)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(Color.black.opacity(0.24))
            .clipShape(Capsule())
    }

    private var levelCardsdfk998: some View {
        HStack(spacing: 14) {
            levelRingCardk998
            growthInfoCardk998
        }
    }

    private var levelRingCardk998: some View {
        VStack(spacing: 14) {
            ZStack {
                Circle()
                    .stroke(Thedsf4k3k535me.surface2, lineWidth: 12)
                    .frame(width: 150, height: 150)

                Circle()
                    .trim(from: 0, to: vmsdfk998.progressToNextLevelk998)
                    .stroke(
                        LinearGradient(
                            colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.goldLight],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 12, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 150, height: 150)

                VStack(spacing: 4) {
                    Text("\(vmsdfk998.levelk998)")
                        .font(.custom("Montserrat-Bold", size: 34))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text("LEVEL")
                        .font(.custom("Montserrat-Bold", size: 11))
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                }
            }

            Text("\(vmsdfk998.currentLevelPointsk998) / \(vmsdfk998.nextLevelNeedsk998)")
                .font(.custom("Montserrat-SemiBold", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var growthInfoCardk998: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Evolution")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            growthInfoRowk998(title: "Total Points", value: "\(vmsdfk998.statsk998.totalPoints)")
            growthInfoRowk998(title: "Completed Tasks", value: "\(vmsdfk998.statsk998.completedTasksCount)")
            growthInfoRowk998(title: "Streak", value: "\(vmsdfk998.statsk998.currentStreak) days")
            growthInfoRowk998(title: "Next Rank", value: "\(vmsdfk998.nextLevelNeedsk998 - vmsdfk998.currentLevelPointsk998) pts left")

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func growthInfoRowk998(title: String, value: String) -> some View {
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

    private var weeklyGrowthsdfk998: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Weekly Evolution")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("+\(max(vmsdfk998.statsk998.growthScore / 5, 1))%")
                    .font(.custom("Montserrat-Bold", size: 13))
                    .foregroundColor(Thedsf4k3k535me.goldLight)
            }

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(vmsdfk998.weeklyBarsk998) { item in
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

    private var milestoneSectionsdfk998: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Milestones")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ForEach(vmsdfk998.milestoneItemsk998) { item in
                milestoneCardk998(item)
            }
        }
    }

    private func milestoneCardk998(_ item: Me43ntalsdf3Growt8hMilestonek998) -> some View {
        HStack(spacing: 14) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 76, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 18))

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(item.title)
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Spacer()

                    Text(item.valueText)
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
                                    colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.goldLight],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * item.progress, height: 10)
                    }
                }
                .frame(height: 10)
            }
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var unlockSectionk998: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Next Unlocks")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(vmsdfk998.nextUnlocksk998) { item in
                        unlockCardk998(item)
                    }
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

    private func unlockCardk998(_ item: Me43ntalsdf3Growt8hUnlockItemk998) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 180)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.80)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.custom("Montserrat-Bold", size: 17))
                    .foregroundColor(.white)

                Text(item.subtitle)
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(14)
        }
        .frame(width: 220, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.borderGold.opacity(0.6), lineWidth: 1)
        )
    }

    private var quoteSectionk998: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest1")
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
                Text("Growth Thought")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(.white)

                Text("Every small mindful action becomes part of a stronger inner forest.")
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

struct Me43ntalsdf3Lisdfmkk345feReflectionView: View {
    @StateObject private var vmsdfk554 = Me43ntalsdf3Refl3ctionVmk554()
    @State private var shareTextdfk554: String = ""
    @State private var showShareSheetdfk554 = false
    @FocusState private var isNotesFocuseddfk987: Bool

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
                    heroCarddfk554
                    promptCarddfk554
                    moodSectiondfk554
                    actionSectiondfk554
                    noteSectiondfk554
                    saveSectiondfk554
                    historySectiondfk554
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }

            if vmsdfk554.showSavedBannerdfk554 {
                VStack {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Reflection saved")
                            .font(.custom("Montserrat-Bold", size: 14))
                    }
                    .foregroundColor(Thedsf4k3k535me.forestDeep)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Thedsf4k3k535me.goldLight)
                    .clipShape(Capsule())
                    .padding(.top, 10)

                    Spacer()
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .sheet(isPresented: $showShareSheetdfk554) {
            Me43ntalsdf3Refl3ctionShareSheetk554(itemsk554: [shareTextdfk554])
        }
    }

    private var heroCarddfk554: some View {
        ZStack(alignment: .bottomLeading) {
            Image(vmsdfk554.selectedMooddfk554.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 230)
                .frame(width: 350)
                .clipped()
                .scaleEffect(vmsdfk554.selectedActionsdfk554.contains(.breathe) ? vmsdfk554.breathPulseScaledfk554 : 1)

            LinearGradient(
                colors: [.clear, .black.opacity(0.24), .black.opacity(0.84)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                Text("Reflection")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .foregroundColor(.white)

                Text("Pause, notice, write and move forward more clearly.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                HStack(spacing: 8) {
                    heroChipdfk554(title: vmsdfk554.selectedMooddfk554.title)
                    heroChipdfk554(title: "\(vmsdfk554.entriesdfk554.count) saved")
                }
            }
            .padding(18)
        }
        .frame(height: 230)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private func heroChipdfk554(title: String) -> some View {
        Text(title)
            .font(.custom("Montserrat-SemiBold", size: 11))
            .foregroundColor(Thedsf4k3k535me.goldPale)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(Color.black.opacity(0.24))
            .clipShape(Capsule())
    }

    private var promptCarddfk554: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Daily Prompt")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    vmsdfk554.useQuickActiondfk554(.pause)
                } label: {
                    Image(systemName: "sparkles")
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                }
            }

            Text(vmsdfk554.todaysPromptdfk554)
                .font(.custom("Montserrat-Regular", size: 15))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(5)
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var moodSectiondfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Choose Your Mood")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Me43ntalsdf3Refl3ctionMoodk554.allCases, id: \.self) { mood in
                        Button {
                            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                            withAnimation(.spring()) {
                                vmsdfk554.selectedMooddfk554 = mood
                            }
                        } label: {
                            ZStack(alignment: .bottomLeading) {
                                Image(mood.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 175)
                                    .clipped()

                                LinearGradient(
                                    colors: [.clear, .black.opacity(0.8)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )

                                VStack(alignment: .leading, spacing: 4) {
                                    Image(systemName: mood.iconName)
                                        .foregroundColor(Thedsf4k3k535me.goldLight)
                                    Text(mood.title)
                                        .font(.custom("Montserrat-Bold", size: 14))
                                        .foregroundColor(.white)
                                }
                                .padding(12)
                            }
                            .frame(width: 150, height: 175)
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(
                                        vmsdfk554.selectedMooddfk554 == mood
                                        ? Thedsf4k3k535me.borderGold
                                        : Thedsf4k3k535me.border,
                                        lineWidth: 1.4
                                    )
                            )
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

    private var actionSectiondfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Choose Small Actions")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ForEach(Me43ntalsdf3Refl3ctionActionk554.allCases, id: \.self) { action in
                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    vmsdfk554.useQuickActiondfk554(action)
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: action.iconName)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(
                                vmsdfk554.selectedActionsdfk554.contains(action)
                                ? Thedsf4k3k535me.goldLight
                                : Thedsf4k3k535me.forestPale
                            )
                            .frame(width: 42, height: 42)
                            .background(Thedsf4k3k535me.surface2)
                            .clipShape(RoundedRectangle(cornerRadius: 14))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(action.title)
                                .font(.custom("Montserrat-Bold", size: 15))
                                .foregroundColor(Thedsf4k3k535me.textPrimary)

                            Text(action.subtitle)
                                .font(.custom("Montserrat-Regular", size: 12))
                                .foregroundColor(Thedsf4k3k535me.textMuted)
                        }

                        Spacer()

                        Image(systemName: vmsdfk554.selectedActionsdfk554.contains(action) ? "checkmark.circle.fill" : "circle")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(
                                vmsdfk554.selectedActionsdfk554.contains(action)
                                ? Thedsf4k3k535me.goldLight
                                : Thedsf4k3k535me.textMuted
                            )
                    }
                    .padding(14)
                    .background(Thedsf4k3k535me.surface2)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                vmsdfk554.selectedActionsdfk554.contains(action)
                                ? Thedsf4k3k535me.borderGold
                                : Thedsf4k3k535me.border,
                                lineWidth: 1
                            )
                    )
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

    private var noteSectiondfk554: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Write Reflection")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            TextEditor(text: $vmsdfk554.notedfk554)
                .font(.custom("Montserrat-Regular", size: 15))
                .foregroundColor(Thedsf4k3k535me.textPrimary)
                .scrollContentBackground(.hidden)
                .frame(height: 160)
                .padding(10)
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Thedsf4k3k535me.border, lineWidth: 1)
                )
                .focused($isNotesFocuseddfk987)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isNotesFocuseddfk987 = false
                        }
                        .font(.custom("Montserrat-Bold", size: 14))
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                    }
                }

            Text("Tap actions above to quickly fill ideas like gratitude, pause or one next step.")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var saveSectiondfk554: some View {
        VStack(spacing: 12) {
            Button {
                Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                vmsdfk554.saveReflectiondfk554()
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.down.fill")
                    Text("Save Reflection")
                }
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
                let tempsdfk554 = Me43ntalsdf3Refl3ctionEntryk554(
                    mood: vmsdfk554.selectedMooddfk554,
                    selectedActions: vmsdfk554.selectedActionsdfk554,
                    note: vmsdfk554.notedfk554.isEmpty ? "A quiet reflection." : vmsdfk554.notedfk554
                )
                shareTextdfk554 = vmsdfk554.shareTextdfk554(for: tempsdfk554)
                showShareSheetdfk554 = true
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Share Reflection")
                }
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

    private var historySectiondfk554: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Saved Reflections")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ForEach(vmsdfk554.sortedEntriesdfk554) { entry in
                historyCarddfk554(entry)
            }
        }
    }

    private func historyCarddfk554(_ entry: Me43ntalsdf3Refl3ctionEntryk554) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(entry.mood.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.mood.title)
                        .font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text(dateTextdfk554(entry.createdAt))
                        .font(.custom("Montserrat-Regular", size: 11))
                        .foregroundColor(Thedsf4k3k535me.textDim)
                }

                Spacer()

                Menu {
                    Button("Share") {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        shareTextdfk554 = vmsdfk554.shareTextdfk554(for: entry)
                        showShareSheetdfk554 = true
                    }

                    Button("Delete", role: .destructive) {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        vmsdfk554.deleteEntrydfk554(entry)
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                        .frame(width: 36, height: 36)
                        .background(Thedsf4k3k535me.surface2)
                        .clipShape(Circle())
                }
            }

            if !entry.selectedActions.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(entry.selectedActions, id: \.self) { action in
                            Text(action.title)
                                .font(.custom("Montserrat-SemiBold", size: 10))
                                .foregroundColor(Thedsf4k3k535me.goldPale)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                                .background(Color.black.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                }
            }

            Text(entry.note)
                .font(.custom("Montserrat-Regular", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(4)
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func dateTextdfk554(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
