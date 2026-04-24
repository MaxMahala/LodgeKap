import SwiftUI

struct Thedsf4k3k535me {
    static let forestDeep = Color(hex: "#0d1f0f")
    static let forestDark = Color(hex: "#152818")
    static let forestMid = Color(hex: "#1e3d22")
    static let forestGreen = Color(hex: "#2d6a35")
    static let forestLight = Color(hex: "#3d8b47")
    static let forestPale = Color(hex: "#6abf74")
    static let goldDeep = Color(hex: "#8b6914")
    static let gold = Color(hex: "#c8961e")
    static let goldLight = Color(hex: "#e8b84b")
    static let goldPale = Color(hex: "#f5d98a")
    static let textPrimary = Color(hex: "#e8f0e9")
    static let textMuted = Color(hex: "#8aab8e")
    static let textDim = Color(hex: "#4a6b4e")
    static let surface1 = Color(hex: "#152818").opacity(0.95)
    static let surface2 = Color(hex: "#1d3722").opacity(0.8)
    static let border = Color(hex: "#6abf74").opacity(0.15)
    static let borderGold = Color(hex: "#c8961e").opacity(0.3)
}
 
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a,r,g,b) = (255,(int>>8)*17,(int>>4&0xF)*17,(int&0xF)*17)
        case 6: (a,r,g,b) = (255,int>>16,int>>8&0xFF,int&0xFF)
        case 8: (a,r,g,b) = (int>>24,int>>16&0xFF,int>>8&0xFF,int&0xFF)
        default:(a,r,g,b) = (255,0,0,0)
        }
        self.init(.sRGB,red:Double(r)/255,green:Double(g)/255,blue:Double(b)/255,opacity:Double(a)/255)
    }
}

enum AppPhase { case loading, onboarding, app }
 
enum Tab: String, CaseIterable {
    case home = "Дім"
    case tasks = "Таски"
    case quizzes = "Квізи"
    case journal = "Щоденник"
    case profile = "Профіль"
 
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .tasks: return "checkmark.circle.fill"
        case .quizzes: return "brain.head.profile"
        case .journal: return "book.closed.fill"
        case .profile: return "leaf.fill"
        }
    }
}
 
enum SubScreen {
    case insights, exercises, control, settings, growth
}

struct ForestParticlesView: View {
    let leaves = ["🍃", "🌿", "🍀", "🌱"]
    @State private var particles: [Particle] = (0..<10).map { i in
        Particle(
            x: CGFloat.random(in: 0.05...0.95),
            delay: Double(i) * 1.3,
            duration: Double.random(in: 6...10),
            leaf: ["🍃","🌿","🍀","🌱"][i % 4],
            size: CGFloat.random(in: 10...16)
        )
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                RadialGradient(
                    colors: [Thedsf4k3k535me.forestGreen.opacity(0.18), .clear],
                    center: .top, startRadius: 0, endRadius: geo.size.height * 0.7
                )
                ForEach(particles) { p in
                    LeafParticleView(particle: p, height: geo.size.height)
                }
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
}

struct LeafParticleView: View {
    let particle: Particle
    let height: CGFloat
    @State private var offset: CGFloat = -30
    @State private var opacity: Double = 0
    @State private var rotation: Double = 0

    var body: some View {
        Text(particle.leaf)
            .font(.system(size: particle.size))
            .position(x: UIScreen.main.bounds.width * particle.x,
                      y: offset)
            .opacity(opacity)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + particle.delay) {
                    withAnimation(.linear(duration: particle.duration).repeatForever(autoreverses: false)) {
                        offset = height + 40
                        rotation = 360
                    }
                    withAnimation(.easeIn(duration: 0.5).delay(particle.delay)) {
                        opacity = 0.7
                    }
                }
            }
    }
}

struct Me43ntalsdf3Jou4rnalCreateEntryViewk987: View {
    let onSavek987: (String, String, Me43ntalsdf3Jou4rnalMoodk987) -> Void

    @Environment(\.dismiss) private var dismissk987
    @State private var titlesdfk987 = ""
    @State private var notesdfk987 = ""
    @State private var moodsdfk987: Me43ntalsdf3Jou4rnalMoodk987 = .reflective
    @FocusState private var isNotesFocuseddfk987: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Thedsf4k3k535me.forestDeep.ignoresSafeArea()

                LinearGradient(
                    colors: [
                        Thedsf4k3k535me.forestDeep.opacity(0.70),
                        Thedsf4k3k535me.forestDark.opacity(0.90),
                        Color.black.opacity(0.95)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        titleBlocksdfk987
                        moodPickersdfk987
                        titleFieldsdfk987
                        noteFieldsdfk987
                        saveButtonsdfk987
                    }
                    .padding(20)
                }
            }
            .navigationBarHidden(true)
        }
    }

    private var titleBlocksdfk987: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("New Journal Entry")
                .font(.custom("Montserrat-Bold", size: 28))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            Text("Write what happened inside your mind today.")
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(Thedsf4k3k535me.textMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var moodPickersdfk987: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select mood")
                .font(.custom("Montserrat-Bold", size: 16))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Me43ntalsdf3Jou4rnalMoodk987.allCases, id: \.self) { mood in
                        Button {
                            moodsdfk987 = mood
                        } label: {
                            VStack(spacing: 8) {
                                Image(mood.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 88, height: 110)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))

                                Text(mood.title)
                                    .font(.custom("Montserrat-SemiBold", size: 11))
                                    .foregroundColor(
                                        moodsdfk987 == mood
                                        ? Thedsf4k3k535me.goldLight
                                        : Thedsf4k3k535me.textMuted
                                    )
                            }
                            .padding(8)
                            .background(Thedsf4k3k535me.surface1)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(
                                        moodsdfk987 == mood
                                        ? Thedsf4k3k535me.borderGold
                                        : Thedsf4k3k535me.border,
                                        lineWidth: 1
                                    )
                            )
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var titleFieldsdfk987: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Title")
                .font(.custom("Montserrat-Bold", size: 15))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            TextField("Entry title", text: $titlesdfk987)
                .font(.custom("Montserrat-Regular", size: 16))
                .foregroundColor(Thedsf4k3k535me.textPrimary)
                .padding()
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var noteFieldsdfk987: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Your thoughts")
                .font(.custom("Montserrat-Bold", size: 15))
                .foregroundColor(Thedsf4k3k535me.textPrimary)

            TextEditor(text: $notesdfk987)
                .font(.custom("Montserrat-Regular", size: 15))
                .foregroundColor(Thedsf4k3k535me.textPrimary)
                .scrollContentBackground(.hidden)
                .frame(height: 180)
                .padding(10)
                .background(Thedsf4k3k535me.surface2)
                .clipShape(RoundedRectangle(cornerRadius: 18))
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
        }
        .padding(16)
        .background(Thedsf4k3k535me.surface1)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var saveButtonsdfk987: some View {
        VStack(spacing: 12) {
            Button {
                let finalTitle = titlesdfk987.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Untitled Entry" : titlesdfk987
                let finalNote = notesdfk987.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "No note added." : notesdfk987

                onSavek987(finalTitle, finalNote, moodsdfk987)
                dismissk987()
            } label: {
                Text("Save Entry")
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
                dismissk987()
            } label: {
                Text("Cancel")
                    .font(.custom("Montserrat-SemiBold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textMuted)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Thedsf4k3k535me.surface1)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct Me43ntalsdf3Jou4rnalEditEntryViewk987: View {
    let entryk987: Me43ntalsdf3Jou4rnalEntryk987
    let onSavek987: (Me43ntalsdf3Jou4rnalEntryk987) -> Void

    @Environment(\.dismiss) private var dismissk987
    @State private var titlesdfk987: String
    @State private var notesdfk987: String
    @State private var moodsdfk987: Me43ntalsdf3Jou4rnalMoodk987

    init(
        entryk987: Me43ntalsdf3Jou4rnalEntryk987,
        onSavek987: @escaping (Me43ntalsdf3Jou4rnalEntryk987) -> Void
    ) {
        self.entryk987 = entryk987
        self.onSavek987 = onSavek987
        _titlesdfk987 = State(initialValue: entryk987.title)
        _notesdfk987 = State(initialValue: entryk987.note)
        _moodsdfk987 = State(initialValue: entryk987.mood)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Thedsf4k3k535me.forestDeep.ignoresSafeArea()

                Image(entryk987.mood.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350)
                    .ignoresSafeArea()

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
                        Text("Edit Entry")
                            .font(.custom("Montserrat-Bold", size: 28))
                            .foregroundColor(Thedsf4k3k535me.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Me43ntalsdf3Jou4rnalCreateEntryInnerViewk987(
                            titlesdfk987: $titlesdfk987,
                            notesdfk987: $notesdfk987,
                            moodsdfk987: $moodsdfk987
                        )

                        Button {
                            var updated = entryk987
                            updated.title = titlesdfk987.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Untitled Entry" : titlesdfk987
                            updated.note = notesdfk987.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "No note added." : notesdfk987
                            updated.mood = moodsdfk987

                            onSavek987(updated)
                            dismissk987()
                        } label: {
                            Text("Update Entry")
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
            .navigationBarHidden(true)
        }
    }
}

struct Me43ntalsdf3Jou4rnalCreateEntryInnerViewk987: View {
    @Binding var titlesdfk987: String
    @Binding var notesdfk987: String
    @Binding var moodsdfk987: Me43ntalsdf3Jou4rnalMoodk987
    @FocusState private var isNotesFocuseddfk987: Bool
    
    var body: some View {
        VStack(spacing: 18) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Select mood")
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(Me43ntalsdf3Jou4rnalMoodk987.allCases, id: \.self) { mood in
                            Button {
                                moodsdfk987 = mood
                            } label: {
                                VStack(spacing: 8) {
                                    Image(mood.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 88, height: 110)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 16))

                                    Text(mood.title)
                                        .font(.custom("Montserrat-SemiBold", size: 11))
                                        .foregroundColor(
                                            moodsdfk987 == mood
                                            ? Thedsf4k3k535me.goldLight
                                            : Thedsf4k3k535me.textMuted
                                        )
                                }
                                .padding(8)
                                .background(Thedsf4k3k535me.surface1)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(
                                            moodsdfk987 == mood
                                            ? Thedsf4k3k535me.borderGold
                                            : Thedsf4k3k535me.border,
                                            lineWidth: 1
                                        )
                                )
                            }
                        }
                    }
                }
            }
            .padding(16)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 24))

            VStack(alignment: .leading, spacing: 10) {
                Text("Title")
                    .font(.custom("Montserrat-Bold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                TextField("Entry title", text: $titlesdfk987)
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
                Text("Your thoughts")
                    .font(.custom("Montserrat-Bold", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)

                TextEditor(text: $notesdfk987)
                    .font(.custom("Montserrat-Regular", size: 15))
                    .foregroundColor(Thedsf4k3k535me.textPrimary)
                    .scrollContentBackground(.hidden)
                    .frame(height: 180)
                    .padding(10)
                    .background(Thedsf4k3k535me.surface2)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
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
            }
            .padding(16)
            .background(Thedsf4k3k535me.surface1)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }
}
