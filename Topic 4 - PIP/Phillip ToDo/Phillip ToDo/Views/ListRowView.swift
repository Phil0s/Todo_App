//
//  ListRowView.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 8/9/21.
//

import SwiftUI

struct ListRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let item: ItemModel
    //Update the checkboxes to make them look cleaner.
    var body: some View {
          HStack{
            if colorScheme == .dark {
                Image(item.isCompleted  ? "Tea-Brewed-Light" : "Tea-Nom-Light")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 55, height: 55)
                  Text(item.title)
                  Spacer()
            } else {
                Image(item.isCompleted  ? "Tea-Brewed-Dark" : "Tea-Nom-Dark")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 55, height: 55)
                  Text(item.title)
                  Spacer()
            }
            

                
          }
          .listRowBackground(Color.clear)
          .background(Color.init("Transparent"))
          .font(.title2)
          .padding(.vertical, 1)
    }
    
    
    
    
}



struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item.", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }
        .previewLayout(.sizeThatFits)
    }
}
