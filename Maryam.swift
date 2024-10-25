import SwiftUI

struct Maryam: View {
    let cardBackground = Color(red: 0.166, green: 0.136, blue: 0.362).opacity(0.346)
    
    // State to track current card index and image offset
    @State private var currentCardIndex = 0
    @State private var floatOffset: CGFloat = 0
    
    let cards = [
        "Take a moment to list five things around you that make you grateful.",
        "   "
    ]
    
    var body: some View {
        NavigationStack { // Use NavigationStack instead of NavigationView
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    headerView
                    greetingView
                    weeklyMoodsCard
                    favoriteCardsCard
                }
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        floatOffset = 10
                    }
                }
            }
        }
    }
    
    var headerView: some View {
        HStack {
            Image("top-icons")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 50)
                .padding(.leading, 99)
                .padding(.top, 55)
            
            Button(action: {}, label: {
                Image(systemName: "gear")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .padding(.leading, 40)
                    .padding(.top, 70)
            })
            Spacer()
        }
        .padding(.top, -30)
    }
    
    var greetingView: some View {
        VStack {
            Text("22 SEP, SUN")
                .font(.title2)
                .foregroundColor(.gray)
            Text("G'day Falak!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("samawy-home")
                .offset(y: floatOffset)  // Apply floating offset only here
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        floatOffset = 10
                    }
                }
                .padding(.top, -15)
        }
    }

    var weeklyMoodsCard: some View {
        ZStack(alignment: .topLeading) {
            cardBackgroundRectangle(width: 350, height: 130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Weekly Moods")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Spacer().frame(width: 165)
                    
                    NavigationLink(destination: Heba().navigationBarBackButtonHidden(true)) { // NavigationLink to the new view
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.gray)
//                            .padding(.top,10) // Adjust padding for better alignment
                    }
                }
                .padding([.leading, .top], 30)
                
                moodDaysView
                    .padding(.top, -6)
                    .padding(.leading, 35)
                
                Image("samawy - sad")
                    .resizable()
                    .frame(width: 30, height: 25)
                    .padding(.leading, 32)
                    .padding(.top, -5)
                
                HStack {
                    NavigationLink(destination: monthlycalendar()) { // NavigationLink to the new view
                        Text("More")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.leading, 300)
                            .padding(.top, -10)
                    }
                }
            }
        }
    }
    
    var moodDaysView: some View {
        HStack(spacing: 25.0) {
            ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                Text(day)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
    
    var favoriteCardsCard: some View {
        ZStack(alignment: .topLeading) {
            cardBackgroundRectangle(width: 350, height: 200)
                .padding(.leading, 5)
                .padding(.top, -35)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Favorite Cards")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.leading, 45)
                        .padding(.top, -5)
                    Spacer().frame(width: 180)
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .padding(.top, -5)
                            .padding(.trailing, 10)
                        
                    })
                }
                
                // The Cards View
                TabView(selection: $currentCardIndex) {
                    ForEach(0..<cards.count, id: \.self) { index in
                        Text(cards[index])
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hue: 0.684, saturation: 0.749, brightness: 0.387).opacity(1))
                            .frame(width: 200, height: 130)
                            .background(Color(red: 0.746, green: 0.741, blue: 0.788).opacity(0.6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.bottom, 30)
                            .padding(.trailing, 100)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 160)
                
                // Dot Indicators
                HStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentCardIndex ? Color.white : Color.gray)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 70)
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    // Reusable card background with shadow and border
    func cardBackgroundRectangle(width: CGFloat, height: CGFloat) -> some View {
        Rectangle()
            .fill(cardBackground)
            .frame(width: width, height: height)
            .cornerRadius(15)
            .overlay(
                Rectangle()
                    .stroke(.gray, lineWidth: 0.5)
                    .cornerRadius(10)
            )
            .padding()
    }
}

#Preview {
    Maryam()
}
