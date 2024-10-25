//
//  monthlycalendar.swift
//  SAMAWY
//
//  Created by Maryam Amer Bin Siddique on 02/04/1446 AH.
//

import SwiftUI

struct monthlycalendar: View {
    let cardBackground = Color(red: 0.166, green: 0.136, blue: 0.362).opacity(0.346)
    
    // State to track current card index and image offset
    @State private var currentCardIndex = 0
    @State private var floatOffset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    let cards = [
        "What about listening to some Irish music?",
        "   "
    ]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                headerView
                greetingView
                monthlyMoodsCard
            }
        }
    }
    
    var headerView: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
            }
            .padding([.leading, .top], 20)
            Spacer()
            .navigationBarBackButtonHidden(true)

            Image("top-icons")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 50)
                .padding(.leading, 35)
                .padding(.top, 55)
            
            Button(action: {}, label: {
                Image(systemName: "house.fill")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .padding(.leading, 30)
                    .padding(.top, 25)
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
//                .onAppear {
//                    withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
//                        floatOffset = 10
//                    }
//                }
                .padding(.top, -15)
        }
    }
    
    var monthlyMoodsCard: some View { // Updated variable name
        ZStack(alignment: .topLeading) {
            cardBackgroundRectangle(width: 350, height: 130) // Height can be adjusted if needed
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Monthly Moods") // Title changed
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Spacer().frame(width: 95)
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                    })
                    Text("Sept")
                        .foregroundColor(.gray)
                    Button(action: {}, label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    })
                }
                .padding([.leading, .top], 30)
                
                ZStack {
                    moodDaysView
                        .padding(.top, -6)
                        .padding(.leading, 35)
                    Image("samawy - sad")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .padding(.leading, -140)
                        .padding(.top, 180 )
                }
            }
        }
    }
    
    var moodDaysView: some View {
        let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let subWeek = ["Sun", "Mon"]
        let weekOne = ["01", "02", "03", "04", "05", "06", "07"]
        let weekTwo = ["08", "09", "10", "11", "12", "13", "14"]
        let weekThree = ["15", "16", "17", "18", "19", "20", "21"]
        let weekFour = ["22", "23", "24", "25", "26", "27", "28"]
        let weekFive = ["29", "30", " ", " ", " ", " ", " "] // Padding empty spaces

        return VStack(spacing: 10) {
            // Week One
            HStack(spacing: 25.0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, -10)
                        .padding(.top, 15)
                }
            }
            HStack(spacing: 33) {
                ForEach(weekOne, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
            }
            // Week Two
            HStack(spacing: 25.0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, -10)
                }
            }
            HStack(spacing: 33.0) {
                ForEach(weekTwo, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, 20)
                }
            }

            // Week Three
            HStack(spacing: 25.0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, -10)
                }
            }
            HStack(spacing: 33.0) {
                ForEach(weekThree, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, 20)
                }
            }

            // Week Four
            HStack(spacing: 25.0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, -10)
                }
            }
            HStack(spacing: 33.0) {
                ForEach(weekFour, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, 20)
                }
            }
            // Week Five
            HStack(spacing: 50) {
                ForEach(subWeek, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, -10)
                        .padding(.leading, -130)
                }
            }
            HStack(spacing: 43.0) {
                ForEach(weekFive, id: \.self) { day in
                    Text(day)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, 20)
                }
            }
        }
    }


    
    // Reusable card background with shadow and border
    func cardBackgroundRectangle(width: CGFloat, height: CGFloat) -> some View {
        Rectangle()
            .fill(cardBackground)
            .frame(width: 350, height: 390)
            .cornerRadius(15)
            .overlay(
                Rectangle()
                    .stroke(.gray, lineWidth: 0.5)
                    .cornerRadius(10)
            )
            .padding()
            .padding(.bottom, 25)
    }
}

#Preview {
    monthlycalendar()
}
