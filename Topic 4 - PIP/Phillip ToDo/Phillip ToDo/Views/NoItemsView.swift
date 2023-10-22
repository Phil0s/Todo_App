//
//  NoItemsView.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 26/9/21.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false //if animation is to be deleted delet this too
    
    @Environment(\.colorScheme) var colorScheme
    
    let secondaccentColor = Color("SecondAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("\(Image(systemName: "lightbulb.fill")) Your list is currently empty")
               
                //.font(.title)
                //.fontWeight(.semibold)
                Text("Go be productive and add new tasks! New tasks will show up here when created")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Task")
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaccentColor: Color.accentColor) // change this back to one color if deleting animation
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, animate ? 30: 50) //delete these 2 if deleting animation
                    .shadow(color: animate ? secondaccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0, y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1: 1.0)
                    .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation) //delete this if deleting animation
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        
        
    }
    //Might get rid of animation function
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    } //end of animation functiin
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        .preferredColorScheme(.light)
        
    }
}
