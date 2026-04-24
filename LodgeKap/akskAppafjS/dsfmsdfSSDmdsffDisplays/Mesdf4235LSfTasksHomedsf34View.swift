import SwiftUI

struct Mesdf4235LSfTasksHomedsf34View: View {
    @StateObject private var vmds433 = Mentalfsdgfl34l5TasksViewModel()

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.72),
                    Thedsf4k3k535me.forestDark.opacity(0.88),
                    Color.black.opacity(0.93)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    topCard
                    progressCard
                    activeSection
                    completedSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 120)
            }
        }
    }

    private var topCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Daily Tasks")
                .font(.custom("Montserrat-Bold", size: 28))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text("Complete tasks, grow stats and build your mental balance every day.")
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            HStack(spacing: 12) {
                miniStat(title: "Done", value: "\(vmds433.stats.completedTasksCount)")
                miniStat(title: "Points", value: "\(vmds433.stats.totalPoints)")
                miniStat(title: "Streak", value: "\(vmds433.stats.currentStreak)")
            }
        }
        .padding(18)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private func miniStat(title: String, value: String) -> some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.custom("Montserrat-Bold", size: 20))
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

    private var progressCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Saved Stats")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            progressRow(title: "Focus", value: CGFloat(vmds433.stats.focusScore) / 100)
            progressRow(title: "Calm", value: CGFloat(vmds433.stats.calmScore) / 100)
            progressRow(title: "Reflection", value: CGFloat(vmds433.stats.reflectionScore) / 100)
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
                        .frame(width: geo.size.width * max(0, min(value, 1)), height: 10)
                }
            }
            .frame(height: 10)
        }
    }

    private var activeSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Active Tasks")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ForEach(vmds433.activeTasks) { task in
                taskCard(task)
            }
        }
    }

    private var completedSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Completed")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            if vmds433.completedTasks.isEmpty {
                Text("No completed tasks yet")
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            } else {
                ForEach(vmds433.completedTasks) { task in
                    taskCard(task)
                }
            }
        }
    }

    private func taskCard(_ task: MeerwetalTasksdfkk43534Item) -> some View {
        Button {
            Me43ntalsdf3Hapti9csManagerk991.shared.impact()
            vmds433.toggleTask(task)
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Thedsf4k3k535me.surface2)
                        .frame(width: 52, height: 52)

                    Image(systemName: task.category.icon)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(task.isCompleted ? Thedsf4k3k535me.goldLight : Thedsf4k3k535me.forestPale)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(task.title)
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text(task.subtitle)
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                        .lineLimit(2)

                    HStack(spacing: 8) {
                        Text(task.category.title)
                            .font(.custom("Montserrat-SemiBold", size: 10))
                            .foregroundColor(Thedsf4k3k535me.goldPale)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                            .background(Color.black.opacity(0.22))
                            .clipShape(Capsule())

                        Text("+\(task.rewardPoints) pts")
                            .font(.custom("Montserrat-SemiBold", size: 10))
                            .foregroundColor(Thedsf4k3k535me.forestPale)
                    }
                }

                Spacer()

                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(task.isCompleted ? Thedsf4k3k535me.goldLight : Thedsf4k3k535me.textMuted)
            }
            .padding(16)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(task.isCompleted ? Thedsf4k3k535me.borderGold : Thedsf4k3k535me.border, lineWidth: 1)
            )
        }
    }
}

struct Me43ntalsdf3Lisdfmkk345feJournalView: View {
    @StateObject private var vmsdfk987 = Me43ntalsdf3Jou4rnalViewModelk987()
    @State private var showCreateSheetsdfk987 = false
    @State private var selectedEntryForEditsdfk987: Me43ntalsdf3Jou4rnalEntryk987?

    var body: some View {
        ZStack {
            Thedsf4k3k535me.forestDeep.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Thedsf4k3k535me.forestDeep.opacity(0.72),
                    Thedsf4k3k535me.forestDark.opacity(0.90),
                    Color.black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    headersdfk987
                    statssdfk987
                    moodPathsdfk987
                    recentEntriesSectionk987
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }
        }
        .sheet(isPresented: $showCreateSheetsdfk987) {
            Me43ntalsdf3Jou4rnalCreateEntryViewk987 { title, note, mood in
                vmsdfk987.addEntryk987(title: title, note: note, mood: mood)
            }
        }
        .sheet(item: $selectedEntryForEditsdfk987) { entry in
            Me43ntalsdf3Jou4rnalEditEntryViewk987(entryk987: entry) { updatedEntry in
                vmsdfk987.updateEntryk987(updatedEntry)
            }
        }
    }

    private var headersdfk987: some View {
        ZStack(alignment: .bottomLeading) {
            Image("_")
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
                Text("Journal")
                    .font(.custom("Montserrat-Bold", size: 30))
                    .foregroundColor(.white)

                Text("Write fears, insights, thoughts and quiet truths. Your inner world deserves a place.")
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)

                Button {
                    showCreateSheetsdfk987 = true
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                        Text("New Entry")
                    }
                    .font(.custom("Montserrat-Bold", size: 14))
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
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var statssdfk987: some View {
        HStack(spacing: 12) {
            statCardk987(title: "Entries", value: "\(vmsdfk987.totalEntriesCountk987)")
            statCardk987(title: "Focus", value: "\(vmsdfk987.focusedEntriesCountk987)")
            statCardk987(title: "Calm", value: "\(vmsdfk987.calmEntriesCountk987)")
        }
    }

    private func statCardk987(title: String, value: String) -> some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.custom("Montserrat-Bold", size: 20))
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

    private var moodPathsdfk987: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Mood Paths")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Me43ntalsdf3Jou4rnalMoodk987.allCases, id: \.self) { mood in
                        moodCardk987(mood)
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

    private func moodCardk987(_ mood: Me43ntalsdf3Jou4rnalMoodk987) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(mood.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 175)
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
        .frame(width: 145, height: 175)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private var recentEntriesSectionk987: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Recent Entries")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                Spacer()

                Button {
                    Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                    showCreateSheetsdfk987 = true
                } label: {
                    Text("Add")
                        .font(.custom("Montserrat-SemiBold", size: 13))
                        .foregroundColor(Thedsf4k3k535me.goldLight)
                }
            }

            ForEach(vmsdfk987.recentEntriesk987) { entry in
                entryCardk987(entry)
            }
        }
    }

    private func entryCardk987(_ entry: Me43ntalsdf3Jou4rnalEntryk987) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(entry.mood.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.title)
                        .font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Thedsf4k3k535me.textPrimary)

                    Text(entry.mood.title)
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(Thedsf4k3k535me.textMuted)
                }

                Spacer()

                Menu {
                    Button("Edit") {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        selectedEntryForEditsdfk987 = entry
                    }

                    Button("Delete", role: .destructive) {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        vmsdfk987.deleteEntryk987(entry)
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

            Text(entry.note)
                .font(.custom("Montserrat-Regular", size: 13))
                .foregroundColor(Thedsf4k3k535me.textMuted)
                .lineSpacing(4)

            Text(dateTextk987(entry.createdAt))
                .font(.custom("Montserrat-Regular", size: 11))
                .foregroundColor(Thedsf4k3k535me.textDim)
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.border, lineWidth: 1)
        )
    }

    private func dateTextk987(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct Me43ntalsdf3Lisdfmkk345feProfileView: View {
    @StateObject private var vmsdfk771 = Me43ntalsdf3Prof4ileVmk771()

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
                    heroProfileSectiondfk771
                    levelSectiondfk771
                    activitySectiondfk771
                    badgeSectiondfk771
                    quoteSectiondfk771
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 130)
            }
        }
        .onAppear {
            vmsdfk771.loadDatasdfk771()
        }
        .sheet(isPresented: $vmsdfk771.showEditSheetdfk771) {
            Me43ntalsdf3Prof4ileEditSheetk771(vmsdfk771: vmsdfk771)
        }
    }

    private var heroProfileSectiondfk771: some View {
        ZStack(alignment: .bottomLeading) {
            Image(vmsdfk771.profiledfk771.avatarImagedfk771)
                .resizable()
                .scaledToFill()
                .frame(height: 255)
                .frame(width: 350)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.2), .black.opacity(0.86)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .bottom) {
                    profileAvatarViewdfk771

                    Spacer()

                    Button {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        vmsdfk771.showEditSheetdfk771 = true
                    } label: {
                        Image(systemName: "pencil")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Thedsf4k3k535me.forestDeep)
                            .frame(width: 42, height: 42)
                            .background(Thedsf4k3k535me.goldLight)
                            .clipShape(Circle())
                    }
                }

                Text(vmsdfk771.profiledfk771.namedfk771)
                    .font(.custom("Montserrat-Bold", size: 28))
                    .foregroundColor(.white)

                Text(vmsdfk771.rankTextdfk771)
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Thedsf4k3k535me.goldPale)

                Text(vmsdfk771.profiledfk771.quoteSdfk771)
                    .font(.custom("Montserrat-Regular", size: 13))
                    .foregroundColor(.white.opacity(0.82))
                    .lineSpacing(4)
            }
            .padding(18)
        }
        .frame(height: 255)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Thedsf4k3k535me.borderGold, lineWidth: 1)
        )
    }

    private var profileAvatarViewdfk771: some View {
        ZStack {
            Circle()
                .fill(Thedsf4k3k535me.gold.opacity(0.18))
                .frame(width: 76, height: 76)

            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(Thedsf4k3k535me.goldLight)
        }
    }

    private var levelSectiondfk771: some View {
        HStack(spacing: 14) {
            VStack(spacing: 14) {
                ZStack {
                    Circle()
                        .stroke(Thedsf4k3k535me.surface2, lineWidth: 10)
                        .frame(width: 130, height: 130)

                    Circle()
                        .trim(from: 0, to: vmsdfk771.levelProgressdfk771)
                        .stroke(
                            LinearGradient(
                                colors: [Thedsf4k3k535me.forestGreen, Thedsf4k3k535me.goldLight],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(width: 130, height: 130)

                    VStack(spacing: 4) {
                        Text("\(vmsdfk771.leveldfk771)")
                            .font(.custom("Montserrat-Bold", size: 28))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)

                        Text("LEVEL")
                            .font(.custom("Montserrat-Bold", size: 10))
                            .foregroundColor(Thedsf4k3k535me.goldLight)
                    }
                }

                Text("\(vmsdfk771.statsk771.totalPoints % 50) / 50")
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
            }
            .frame(maxWidth: .infinity)
            .padding(18)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Thedsf4k3k535me.border, lineWidth: 1)
            )

            VStack(alignment: .leading, spacing: 14) {
                profileInfodfk771(title: "Total Points", value: "\(vmsdfk771.statsk771.totalPoints)")
                profileInfodfk771(title: "Completed Tasks", value: "\(vmsdfk771.statsk771.completedTasksCount)")
                profileInfodfk771(title: "Current Streak", value: "\(vmsdfk771.statsk771.currentStreak) days")
                profileInfodfk771(title: "Growth Score", value: "\(vmsdfk771.statsk771.growthScore)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(18)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Thedsf4k3k535me.border, lineWidth: 1)
            )
        }
    }

    private func profileInfodfk771(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(Thedsf4k3k535me.textMuted)

            Spacer()

            Text(value)
                .font(.custom("Montserrat-Bold", size: 12))
                .foregroundColor(Thedsf4k3k535me.goldLight)
        }
    }

    private var activitySectiondfk771: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Activity")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(vmsdfk771.activityItemsdfk771) { item in
                    activityCarddfk771(item)
                }
            }
        }
    }

    private func activityCarddfk771(_ item: Me43ntalsdf3Prof4ileActivityItemk771) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: item.icon)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Thedsf4k3k535me.goldLight)

            Text(item.value)
                .font(.custom("Montserrat-Bold", size: 22))
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

    private var badgeSectiondfk771: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Badges")
                .font(.custom("Montserrat-Bold", size: 18))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(vmsdfk771.badgeItemsdfk771) { item in
                        badgeCarddfk771(item)
                    }
                }
            }
        }
    }

    private func badgeCarddfk771(_ item: Me43ntalsdf3Prof4ileBadgeItemk771) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 210, height: 175)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.custom("Montserrat-Bold", size: 17))
                    .foregroundColor(.white)

                Text(item.subtitle)
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(.white.opacity(0.82))
            }
            .padding(14)
        }
        .frame(width: 210, height: 175)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Thedsf4k3k535me.borderGold.opacity(0.6), lineWidth: 1)
        )
    }

    private var quoteSectiondfk771: some View {
        ZStack(alignment: .bottomLeading) {
            Image("forest5")
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
                Text("Profile Thought")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(.white)

                Text("The person you become is shaped quietly by the small choices you repeat.")
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

struct Me43ntalsdf3Prof4ileEditSheetk771: View {
    @ObservedObject var vmsdfk771: Me43ntalsdf3Prof4ileVmk771
    @Environment(\.dismiss) private var dismissdfk771
    @FocusState private var isNotesFocuseddfk987: Bool

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
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Edit Profile")
                            .font(.custom("Montserrat-Bold", size: 28))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)
                        
                        Text("Update your name and personal quote.")
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(Thedsf4k3k535me.textMuted)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name")
                            .font(.custom("Montserrat-Bold", size: 15))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)
                        
                        TextField("Your name", text: $vmsdfk771.draftNamedfk771)
                            .font(.custom("Montserrat-Regular", size: 16))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)
                            .padding()
                            .background(Thedsf4k3k535me.surface2)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .padding(16)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Quote")
                            .font(.custom("Montserrat-Bold", size: 15))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)
                        
                        ZStack(alignment: .topTrailing) {
                            TextEditor(text: $vmsdfk771.draftQuotedfk771)
                                .font(.custom("Montserrat-Regular", size: 15))
                                .foregroundColor(Thedsf4k3k535me.textPrimary)
                                .scrollContentBackground(.hidden)
                                .frame(height: 140)
                                .padding(10)
                                .background(Thedsf4k3k535me.surface2)
                                .focused($isNotesFocuseddfk987)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            
                            if isNotesFocuseddfk987 {
                                Button("Done") {
                                    isNotesFocuseddfk987 = false
                                }
                                .font(.custom("Montserrat-Bold", size: 14))
                                .foregroundColor(Thedsf4k3k535me.goldLight)
                                .padding()
                            }
                        }
                    }
                    .padding(16)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                    Button {
                        Me43ntalsdf3Hapti9csManagerk991.shared.impact()
                        vmsdfk771.saveProfiledfk771()
                        dismissdfk771()
                    } label: {
                        Text("Save Profile")
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
                }
                .padding(20)
            }
        }
    }
}
