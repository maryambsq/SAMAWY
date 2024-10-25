//import SwiftUI
//
//struct ContentView: View {
//    @State private var selectedColor: Color = Color(hex: "DAD8D6") ?? .clear
//    
//    var body: some View {
//        ZStack {
//            // Background image spanning the entire view
//            Image("background")
//                .resizable()              // Ensure the image resizes to fit the screen
//                .scaledToFill()           // Make the image cover the entire view
//                .ignoresSafeArea()
//        // Ignore safe area for full-screen background
//            VStack{
//                Spacer()
//
//                HStack{
//                    Button(action: {
//                        print("Back button tapped")
//                    }) {
//                        Image(systemName: "chevron.backward")
//                            .font(.system(size: 24))
//                            .foregroundColor(.white)
//                            .padding([.top, .leading], 20)
//                    }
//                    Spacer()
//
//                    Image("Icons")
//                        .resizable()
//                       // .padding(.top, 50)
//                        .position(x: 80, y: 55)
//                        .scaledToFit()
//                        .frame(width:150, height:135)
//                    Spacer()
//                    
//                    Button(action: {
//                        print("Back button tapped")
//                    }) {
//                        Image(systemName: "house.fill")
//                            .font(.system(size: 24))
//                            .foregroundColor(.white)
//                            .padding([.top, .trailing], 20)
//                    }
//                }
//                
//                Text("Pleased to meet you Falak!")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color(hue: 0.083, saturation: 0.016, brightness: 0.973))
//                    .multilineTextAlignment(.center)
//                    .position(x:200, y:10)
//                
//                
//            }
//            Text("Dress me in colors!")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .foregroundColor(Color(hue: 0.083, saturation: 0.016, brightness: 0.973))
//                .padding(.top, 200)
//                
//            
//            VStack {
//                // Color Picker View
//                CustomColor(selectedColor: $selectedColor)
//                    .padding()
//                //.background(.ultraThinMaterial)
//                    .cornerRadius(15)
//                    .shadow(radius: 10)
//                    .position(x:219, y:500)
//                
//                Spacer()
//                
//                
//
//                // Done Button
//                Button(action: {
//                    // Add your action for the "Done" button here (e.g., dismissing the view)
//                    print("Done button tapped!")
//                }) {
//                    Text("Done")
//                        .foregroundColor(.black)
//                        .padding()
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.white) // Button color
//                        .frame(width: 133, height: 41)
//                        .cornerRadius(22)
//                        .shadow(radius: 10)
//                        .padding(.horizontal, 20) // Padding around the button
//                }
//                .padding(.bottom, 10) // Adjust bottom padding if needed
//                
//                
//                Button(action: {
//                    print("Skip button tapped!")
//                }) {
//                    Text("Skip")
//                        .fontWeight(.semibold) // Set font weight to semibold
//                        .foregroundColor(.white) // Set text color to white
//                        .padding()
//                        .frame(width: 133, height: 41)
//                        .cornerRadius(22)
//                        .shadow(radius: 10)
//                        .padding(.horizontal, 20)
//                }
//                .padding(.bottom, 40)
//            }
//        }
//        .padding(.bottom, 40)
//    }
//    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
//}
//#Preview {
//    ContentView()
//}
