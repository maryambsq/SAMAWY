import SwiftUI

struct Splash_Page: View {
    @State private var animateLogo = false // State for logo animation
    @State private var animateSymbols = false // State for symbols animation
    @State private var currentSymbolIndex = 0 // To track the current symbol index
    @State private var navigateToNextScreen = false // State to control navigation

    var body: some View {
        ZStack {
            // Background Image
            Image("exported backg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                // Icon Stack
                HStack(spacing: 15) {
                    ForEach(0..<4) { index in
                        Image("Symbol\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .offset(y: animateSymbols && currentSymbolIndex == index ? -20 : 0) // Jump effect
                            .opacity(animateSymbols && currentSymbolIndex == index ? 1 : 0) // Fade in effect
                            .animation(.easeIn(duration: 0.5), value: animateSymbols)
                    }
                }
                .padding(.bottom, -30)

                // Text Logo with Animation
                Image("TEXT LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .scaleEffect(animateLogo ? 1.0 : 0.5)
                    .opacity(animateLogo ? 1 : 0)
                    .animation(.easeIn(duration: 1.0), value: animateLogo)
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .onAppear {
            // Trigger animation for logo first
            animateLogo = true
            
            // After the logo animation completes, start the symbols animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                animateSymbols = true
                currentSymbolIndex = 0 // Start with Symbol1
                animateNextSymbol() // Start the loop
                
                // Transition to the next screen after a specific time
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Total duration (1s + 3s for symbols)
                    navigateToNextScreen = true
                }
            }
        }
        .fullScreenCover(isPresented: $navigateToNextScreen) {
            Rawan() // Navigate to Rawan page instead of NextView
        }
    }
    
    // Function to animate symbols in a loop
    func animateNextSymbol() {
        guard animateSymbols else { return }
        
        withAnimation {
            currentSymbolIndex = currentSymbolIndex < 3 ? currentSymbolIndex + 1 : 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateNextSymbol()
        }
    }
}

struct NextView: View {
    var body: some View {
        // Your next app interface goes here
        Text("Welcome to the Next Screen!")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
   Splash_Page()
}
