import SwiftUI

struct pickcolor: View {
    @State private var selectedColor: Color = Color(hex: "DAD8D6") ?? .clear
    @State private var isColorSelected: Bool = false // Track if any color has been selected
    @State private var navigateToHeba = false  // Track navigation to Heba page
    @State private var navigateToMaryam = false  // Track navigation to Maryam page
    @State private var navigateToRawan = false  // Track navigation to Rawan page
    
    @Environment(\.presentationMode) var presentationMode  // To control navigation
    
    var body: some View {
        ZStack {
            // Background image spanning the entire view
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // Ignore safe area for full-screen background
            
            VStack {
                headerView
                Spacer()

                Text("Pleased to meet you Falak!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.083, saturation: 0.016, brightness: 0.973))
                    .multilineTextAlignment(.center)
                    .padding(.top, 40) // Adjust padding

                Spacer()

                // Color Picker View
                CustomColor(selectedColor: $selectedColor)
                    .onChange(of: selectedColor) { newValue in
                        // Mark color as selected if it's not the default color
                        isColorSelected = true
                    }
                    .padding()
                    .cornerRadius(15)
                    .shadow(radius: 10)

                // Done Button to navigate to Heba page
                Button(action: {
                    navigateToHeba = true  // Trigger navigation to Heba
                }) {
                    Text("Done")
                        .foregroundColor(.black)
                        .padding()
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .frame(width: 133, height: 41)
                        .cornerRadius(22)
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                }
                .disabled(!isColorSelected)  // Disable until a color is selected
                .opacity(isColorSelected ? 1.0 : 0.5)  // Change opacity based on color selection
                .background(
                    NavigationLink(destination: Heba().navigationBarBackButtonHidden(true), isActive: $navigateToHeba) {
                        EmptyView()
                    }
                )
                .padding(.bottom, 10)

                // Skip Button to also navigate to Heba page
                Button(action: {
                    navigateToHeba = true  // Trigger navigation to Heba
                }) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 133, height: 41)
                        .cornerRadius(22)
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)
            }
            .padding(.bottom, 40)
            .navigationBarBackButtonHidden(true) // Hides the default back button
            .navigationTitle("") // Ensure the title is empty
        }
    }
    
    var headerView: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the current view
            }) {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
            }
            .padding([.leading, .top], 40)
            
            Spacer()
            
            Image("Icons")  // Top icons image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 50)
                .padding(.top, 30)
                .padding(.leading, 2)
            
            Spacer()
            
            NavigationLink(destination: Maryam().navigationBarBackButtonHidden(true)) {
                Image(systemName: "house.fill")
                    .foregroundColor(.white) // Change color based on active state
                    .font(.system(size: 24)) // Same size for the icon
                    .padding([.top, .trailing], 30)
            }
        }
        .padding(.top, 20)
    }
}

struct pickcolor_Previews: PreviewProvider {
    static var previews: some View {
        pickcolor()
    }
}
