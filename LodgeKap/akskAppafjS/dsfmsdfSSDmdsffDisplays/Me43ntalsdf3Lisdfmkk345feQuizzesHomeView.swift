import SwiftUI

struct Me43ntalsdf3Lisdfmkk345feQuizzesHomeView: View {
    private let categoriesdfk34 = Me43ntalsdf3QuizFactoryk345.makeQuizCategories()

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()
            
            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.72),
                    Thedsf4k3k535me.forestDark.opacity(0.88),
                    Color.black.opacity(0.94)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    headersdfk34
                    ForEach(categoriesdfk34) { category in
                        NavigationLink {
                            Me43ntalsdf3Lisdfmkk345feQuizPlayView(categorysdfk34: category)
                        } label: {
                            categoryCardsdfk34(category)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 40)
            }
        }
    }

    private var headersdfk34: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Mental Quizzes")
                .font(.custom("Montserrat-Bold", size: 30))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text("Beautiful tests with choice answers and written answers to train awareness, focus and growth.")
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(4)

            HStack(spacing: 12) {
                topBadgesdfk34(title: "3 Paths", value: "Mind")
                topBadgesdfk34(title: "Mixed", value: "Choice + Write")
                topBadgesdfk34(title: "Reward", value: "Points")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func topBadgesdfk34(title: String, value: String) -> some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.custom("Montserrat-Bold", size: 15))
                .foregroundColor(Thedsf4k3k535me.goldLight)

            Text(title)
                .font(.custom("Montserrat-Regular", size: 11))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func categoryCardsdfk34(_ category: Me43ntalsdf3QuizCategoryk345) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(category.imageName)
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
                HStack(spacing: 8) {
                    Image(systemName: category.iconName)
                    Text("Quiz Path")
                }
                .font(.custom("Montserrat-SemiBold", size: 11))
                .foregroundColor(Thedsf4k3k535me.goldPale)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.24))
                .clipShape(Capsule())

                Text(category.title)
                    .font(.custom("Montserrat-Bold", size: 24))
                    .foregroundColor(.white)

                Text(category.subtitle)
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.82))

                HStack {
                    Text("\(category.questions.count) questions")
                    Spacer()
                    Text("Open")
                }
                .font(.custom("Montserrat-SemiBold", size: 12))
                .foregroundColor(.white.opacity(0.92))
            }
            .padding(18)
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }
}

struct Me43ntalsdf3Lisdfmkk345feQuizPlayView: View {
    let categorysdfk34: Me43ntalsdf3QuizCategoryk345
    @StateObject private var vmsdfk34: Me43ntalsdf3QuizFlowViewModelk345
    @Environment(\.dismiss) private var dismisssdfk34

    init(categorysdfk34: Me43ntalsdf3QuizCategoryk345) {
        self.categorysdfk34 = categorysdfk34
        _vmsdfk34 = StateObject(wrappedValue: Me43ntalsdf3QuizFlowViewModelk345(category: categorysdfk34))
    }

    var body: some View {
        ZStack {
            Image(vmsdfk34.currentQuestion.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 350)
                .ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.50),
                    Thedsf4k3k535me.forestDark.opacity(0.86),
                    Color.black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {
                topBarsdfk34
                progressCardsdfk34
                questionsdfk34
                Spacer()
                buttonsdfk34
            }
            .padding(.horizontal, 20)
            .padding(.top, 18)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $vmsdfk34.showResult) {
            Me43ntalsdf3Lisdfmkk345feQuizResultView(resultSdfk34: vmsdfk34.resultsdfk34)
        }
    }

    private var topBarsdfk34: some View {
        HStack {
            Button {
                dismisssdfk34()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Thedsf4k3k535me.goldPale)
                    .frame(width: 46, height: 46)
                    .background(Thedsf4k3k535me.surface2)
                    .clipShape(Circle())
            }

            Spacer()

            Text(categorysdfk34.title)
                .font(.custom("Montserrat-Bold", size: 16))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Spacer()

            Circle()
                .fill(Color.clear)
                .frame(width: 46, height: 46)
        }
    }

    private var progressCardsdfk34: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Question \(vmsdfk34.currentIndex + 1) / \(categorysdfk34.questions.count)")
                    .font(.custom("Montserrat-SemiBold", size: 13))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Text("+\(vmsdfk34.currentQuestion.rewardPoints) pts")
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
                        .frame(width: geo.size.width * vmsdfk34.progressValue, height: 10)
                }
            }
            .frame(height: 10)
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var questionsdfk34: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vmsdfk34.currentQuestion.title)
                .font(.custom("Montserrat-Bold", size: 28))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text(vmsdfk34.currentQuestion.subtitle)
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            switch vmsdfk34.currentQuestion.type {
            case .choice:
                VStack(spacing: 12) {
                    ForEach(vmsdfk34.currentQuestion.options) { option in
                        optionRowsdfk34(option)
                    }
                }

            case .written:
                writtenAnswersdfk34
            }
        }
        .padding(20)
        .background(.black.opacity(0.22))
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func optionRowsdfk34(_ option: Me43ntalsdf3QuizOptionk345) -> some View {
        Button {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            vmsdfk34.selectedOptionId = option.id
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(
                            vmsdfk34.selectedOptionId == option.id
                            ? Thedsf4k3k535me.goldLight
                            : Thedsf4k3k535me.textMuted,
                            lineWidth: 2
                        )
                        .frame(width: 24, height: 24)

                    if vmsdfk34.selectedOptionId == option.id {
                        Circle()
                            .fill(Thedsf4k3k535me.goldLight)
                            .frame(width: 12, height: 12)
                    }
                }

                Text(option.title)
                    .font(.custom("Montserrat-SemiBold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()
            }
            .padding(16)
            .background(
                vmsdfk34.selectedOptionId == option.id
                ? Thedsf4k3k535me.gold.opacity(0.12)
                : Thedsf4k3k535me.surface2
            )
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        vmsdfk34.selectedOptionId == option.id
                        ? Thedsf4k3k535me.borderGold
                        : Thedsf4k3k535me.border,
                        lineWidth: 1
                    )
            )
        }
    }

    private var writtenAnswersdfk34: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Write your answer")
                .font(.custom("Montserrat-SemiBold", size: 15))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            TextField("Type here...", text: $vmsdfk34.writtenAnswer)
                .font(.custom("Montserrat-Regular", size: 16))
                .foregroundColor(Thedsf4k3k535me.textPrimary)
                .padding()
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
                )

            Text("This quiz includes open answer input.")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
    }

    private var buttonsdfk34: some View {
        Button {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            vmsdfk34.submitCurrentQuestion()
        } label: {
            Text(vmsdfk34.currentIndex == categorysdfk34.questions.count - 1 ? "Finish Quiz" : "Next Question")
                .font(.custom("Montserrat-Bold", size: 16))
                .foregroundColor(vmsdfk34.canContinue ? .white : Thedsf4k3k535me.textMuted)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    Group {
                        if vmsdfk34.canContinue {
                            LinearGradient(
                                colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.forestLight],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        } else {
                            LinearGradient(
                                colors: [Thedsf4k3k535me.surface2, Thedsf4k3k535me.surface2],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        }
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .disabled(!vmsdfk34.canContinue)
    }
}

struct Me43ntalsdf3Lisdfmkk345feQuizResultView: View {
    let resultSdfk34: Me43ntalsdf3QuizResultk345
    @Environment(\.dismiss) private var dismisssdfk34

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.62),
                    Thedsf4k3k535me.forestDark.opacity(0.88),
                    Color.black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {
                Spacer()

                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Thedsf4k3k535me.gold.opacity(0.14))
                            .frame(width: 112, height: 112)

                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 42, weight: .bold))
                            .foregroundColor(Thedsf4k3k535me.goldLight)
                    }

                    Text(resultSdfk34.successTitle)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text("You completed the quiz and improved your mental growth path.")
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 12) {
                        resultsCardsdfk34(title: "Correct", value: "\(resultSdfk34.correctAnswers)/\(resultSdfk34.totalQuestions)")
                        resultsCardsdfk34(title: "Points", value: "+\(resultSdfk34.earnedPoints)")
                    }
                }
                .padding(24)
                .background(Thedsf4k3k535me.surface1)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
                )
                .padding(.horizontal, 24)

                Button {
                    dismisssdfk34()
                } label: {
                    Text("Back to Quizzes")
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
                .padding(.horizontal, 24)

                Spacer()
            }
        }
    }

    private func resultsCardsdfk34(title: String, value: String) -> some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.custom("Montserrat-Bold", size: 22))
                .foregroundColor(Thedsf4k3k535me.goldLight)

            Text(title)
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Thedsf4k3k535me.surface2)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct Me43ntalsdf3Lisdfmkk345feSettingsView: View {
    @StateObject private var vmsdfk991 = Me43ntalsdf3Settin9gsVmk991()

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.75),
                    Thedsf4k3k535me.forestDark.opacity(0.92),
                    Color.black.opacity(0.97)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {
                    header
                    preferencesSection
                    actionsSection
                    aboutSection
                }
                .padding(20)
            }
        }
        .alert("Reset all data?", isPresented: $vmsdfk991.showResetAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive) {
                vmsdfk991.resetAllData()
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Settings")
                .font(.custom("Montserrat-Bold", size: 30))
                .foregroundColor(.white)

            Text("Control your experience and privacy")
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var preferencesSection: some View {
        VStack(spacing: 14) {
            toggleRow(title: "Haptics", isOn: $vmsdfk991.hapticsEnabled) {
                vmsdfk991.toggleHaptics($0)
            }

            toggleRow(title: "Sounds", isOn: $vmsdfk991.soundsEnabled) {
                vmsdfk991.toggleSounds($0)
            }

            toggleRow(title: "Tips Overlay", isOn: $vmsdfk991.tipsEnabled) {
                vmsdfk991.toggleTips($0)
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var actionsSection: some View {
        VStack(spacing: 12) {
            buttonRow(title: "Privacy Policy", icon: "lock.fill") {
                vmsdfk991.openPrivacy()
            }

            buttonRow(title: "Rate App", icon: "star.fill") {
                vmsdfk991.rateApp()
            }

            buttonRow(title: "Reset Data", icon: "trash.fill", destructive: true) {
                vmsdfk991.showResetAlert = true
                Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var aboutSection: some View {
        VStack(spacing: 8) {
            Text(SDConstants03204ConfigAppString.pricnsdName)
                .font(.custom("Montserrat-Bold", size: 16))
                .foregroundColor(.white)

            Text("Version 1.0")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .padding(.top, 10)
    }

    private func toggleRow(title: String, isOn: Binding<Bool>, action: @escaping (Bool) -> Void) -> some View {
        Toggle(isOn: Binding(
            get: { isOn.wrappedValue },
            set: { newValue in
                isOn.wrappedValue = newValue
                action(newValue)
            }
        )) {
            Text(title)
                .font(.custom("Montserrat-SemiBold", size: 15))
                .foregroundColor(.white)
        }
        .toggleStyle(SwitchToggleStyle(tint: Thedsf4k3k535me.gold))
    }

    private func buttonRow(title: String, icon: String, destructive: Bool = false, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(destructive ? .red : Thedsf4k3k535me.goldLight)

                Text(title)
                    .font(.custom("Montserrat-SemiBold", size: 15))
                    .foregroundColor(destructive ? .red : .white)

                Spacer()
            }
        }
    }
}
