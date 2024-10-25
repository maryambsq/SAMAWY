import SwiftUI

struct Heba: View {
    @State private var floatOffset: CGFloat = 0
    @State private var activeButton: ButtonType? // Track the active button state
    @State private var homeButtonColor: Color = .white // Track the home button color
    @State private var isViewLoaded = false
    @Environment(\.dismiss) private var dismiss // For back navigation
    
    enum ButtonType {
        case sad, angry, bored, fine
    }

    var body: some View {
        NavigationStack {  // Wrapping the view in NavigationStack for proper navigation
            ZStack {
                // Background image
                Image("exported backg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                // Icons image
                Image("Icons")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .position(x: 200, y: 70)

                // Back button (Use NavigationLink to go back to PickColor)
                NavigationLink(destination: pickcolor().navigationBarBackButtonHidden(true)) { // Navigate back to PickColor view
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .position(x: 50, y: 70) // Position in the top left corner

                // Home button (NavigationLink to Maryam view)
                NavigationLink(destination: Maryam().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "house.fill")
                        .foregroundColor(homeButtonColor)
                        .font(.system(size: 24))
                }
                .position(x: 340, y: 70) // Position in the top right corner

                // Floating foreground image
                Image("r")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260, height: 260)
                    .padding()
                    .offset(y: floatOffset)
                    .position(x: 200, y: 350)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isViewLoaded = true
                            startFloating()
                        }
                    }

                // Greeting text
                Text("Pleased to meet you Falak!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 500)

                // Subtext
                Text("How are you feeling today?")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.top)
                    .position(x: 200, y: 480)

                // Sad button (NavigationLink to Needhpage view)
                NavigationLink(destination: Needhpage().navigationBarBackButtonHidden(true)) {
                    Text("Sad")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 133, height: 41)
                        .background(Color.white)
                        .cornerRadius(22)
                }
                .position(x: 200, y: 570)

                // Other emotion buttons
                buttonView(title: "Angry", type: .angry)
                    .position(x: 200, y: 620)

                buttonView(title: "Bored", type: .bored)
                    .position(x: 200, y: 670)

                buttonView(title: "Fine", type: .fine)
                    .position(x: 200, y: 720)
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
        }
    }

    private func buttonView(title: String, type: ButtonType) -> some View {
        Button(action: {
            activeButton = (activeButton == type) ? nil : type
        }) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(width: 133, height: 41)
                .background(activeButton == type ? Color(red: 251/255, green: 235/255, blue: 139/255) : Color.white)
                .cornerRadius(22)
        }
    }

    private func startFloating() {
        // Apply floating animation to only the foreground image
        if isViewLoaded {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                floatOffset = 10
            }
        }
    }
}

#Preview {
    Heba()
}
