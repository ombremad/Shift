//
//  InspirationDetailView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

struct InspirationDetailView: View {
    let women: [Inspirations]
    @State var currentIndex: Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let woman = women[currentIndex]

        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    //MARK: Anchor to the top of the page for the navigation Buttons
                    Color.clear
                        .frame(height: 0)
                        .id("top")
                    
                    //MARK: Custom back button
                    Button(action: { dismiss() }) {
                        Text("< Timeline")
                            .font(.custom("HelveticaNeue", size: 17))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 30)
                    .padding(.trailing)
                    
                    
                    //MARK: Image
                    ZStack() {
                        Circle()
                            .fill(Color("NeonGreen"))
                            .frame(width: 301, height: 301)
                            .opacity(0.15)
                        
                        Circle()
                            .fill(Color("NeonGreen"))
                            .frame(width: 250, height: 250)
                            .opacity(0.30)
                        
                        Image(woman.imageGreen)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .frame(width: 207, height: 207)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top)
                    
                    //MARK: Name + Field
                    Text(woman.name)
                        .font(.custom("Safiro-SemiBold", size: 34))
                        .foregroundColor(.white)
                    
                    Text(woman.field)
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 372, height: 1)
                        .background(Color("NeonGreen"))
                    
                    //MARK: Birth – Death - Achievement
                    HStack{
                        Image("baby")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("NeonGreen"))
                        
                        
                        Text(woman.birth)
                    }
                    .font(.custom("HelveticaNeue", size: 14))
                    .foregroundColor(.white)
                    .padding(.top, 9)
                    
                    HStack{
                        Image("cross")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("NeonGreen"))
                        
                        Text(woman.death ?? "Present")
                    }
                    .font(.custom("HelveticaNeue", size: 14))
                    .foregroundColor(.white)
                    
                    HStack{
                        Image("sketch-logo")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("NeonGreen"))
                        
                        Text(woman.achievement)
                    }
                    .font(.custom("HelveticaNeue", size: 14))
                    .foregroundColor(.white)
                    .padding(.bottom, 9)
                    
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 372, height: 1)
                        .background(Color("NeonGreen"))
                    
                    //MARK: Biography
                    Text("Biography")
                        .font(.custom("Safiro-SemiBold", size: 24))
                        .foregroundColor(.white)
                        .padding(.top, 9)
                        .padding(.bottom, 10)
                    
                    Text(woman.biography)
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundColor(.white)
                    
                    //MARK: Why Inspiring
                    Text("Why She's Inspiring")
                        .font(.custom("Safiro-SemiBold", size: 24))
                        .foregroundColor(.white)
                        .padding(.top, 9)
                        .padding(.bottom, 10)
                    
                    Text(woman.whyInspiring)
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundColor(.white)
                    
                    // MARK: Navigation Buttons
                    HStack {
                        Button(action: {
                            if currentIndex > 0 {
                                currentIndex -= 1
                                withAnimation {
                                    proxy.scrollTo("top", anchor: .top)
                                }
                            }
                        }) {
                            Text("Previous")
                                .foregroundColor(Color("Violet"))
                                .padding()
                                .frame(width: 176, height: 40)
                                .background(Color("NeonGreen"))
                                .cornerRadius(12)
                        }
                        .disabled(currentIndex == 0)
                        
                        Spacer()
                        
                        Button(action: {
                            if currentIndex < women.count - 1 {
                                currentIndex += 1
                                withAnimation {
                                    proxy.scrollTo("top", anchor: .top)
                                }
                            }
                        }) {
                            Text("Next")
                                .foregroundColor(Color("Violet"))
                                .padding()
                                .frame(width: 176, height: 40)
                                .background(Color("NeonGreen"))
                                .cornerRadius(12)
                        }
                        .disabled(currentIndex == women.count - 1)
                    }
                    .padding(.top, 35)
                    .padding(.bottom, 32)
                    .font(.custom("Safiro-SemiBold", size: 16))
                }
                .padding()
            }
            .background(Color("Violet"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }

       }
   }

#Preview {
    InspirationDetailView(
        women: [
            Inspirations(
                id: 1,
                name: "Ada Lovelace",
                field: "Mathematician",
                imageWhite: "ada_lovelace",
                imageGreen: "ada_lovelace_g",
                birth: "December 10, 1815, England",
                death: "November 27, 1852, England",
                achievement: "First computer programer",
                biography: "Ada Lovelace was a 19th-century visionary who worked on Charles Babbage’s Analytical Engine.",
                whyInspiring: "She saw a future where computers could create music, art, and more."
            ),
            Inspirations(
                id: 2,
                name: "Grace Hopper",
                field: "Computer Scientist",
                imageWhite: "grace_hopper",
                imageGreen: "grace_hopper_g",
                birth: "December 9, 1906, USA",
                death: "January 1, 1992, USA",
                achievement: "Developed first compiler for a programming language",
                biography: "Grace Hopper was a rear admiral and computer scientist...",
                whyInspiring: "She broke barriers in both military and tech worlds."
            )
        ],
        currentIndex: 0
    )
}
