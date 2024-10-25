import SwiftUI

struct Rawan: View {
    @State private var offset: CGFloat = 0
    @State private var name: String = "" // Make sure this is declared as @State

    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("exported backg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                Image("emojis")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .position(x: 200, y: 60)

                // Foreground image (stars)
                Image("stars")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding()
                    .position(x: 190, y: 248 + offset)

                VStack {
                    Spacer()

                    Image("Group 28-3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .padding()
                        .offset(y: offset)

                    // Text and input fields
                    HStack {
                        Text("Let ")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.973, green: 0.9647, blue: 0.9569))
                        +
                        Text("Samawy")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 200/255, green: 225/255, blue: 231/255))
                        +
                        Text(" help you track your moods and clear the skies for a brighter day!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.973, green: 0.9647, blue: 0.9569))
                    }
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                    TextField("Username", text: $name)
                        .padding()
                        .background(Color(red: 13/255, green: 9/255, blue: 57/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .frame(width: 292)
                        .padding(.top, 20)

                    VStack {
                        // NavigationLink to navigate to ContentView
                        NavigationLink(destination: pickcolor().navigationBarBackButtonHidden(true)) {
                            Text("Let’s Start")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 71/255, green: 71/255, blue: 74/255))
                                .padding()
                                .frame(width: 147, height: 41)
                                .background(name.isEmpty ? Color(red: 209/255, green: 233/255, blue: 246/255).opacity(0.45) : Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                .cornerRadius(21)
                        }
                        .disabled(name.isEmpty)
                        .padding(25)
                    }

                    Spacer()
                }
                .padding([.leading, .trailing])
            }
            .onAppear {
                startMoving()
            }
        }
    }

    func startMoving() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            offset = 10
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Rawan()
    }
}
