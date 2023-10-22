//
//  ListView.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 8/9/21.
//

import SwiftUI




    


struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.colorScheme) var colorScheme
//    @State var addbutton: Bool = false
//    @State var additems: Bool = false
//    Text("""
//        This SwiftLee example is combined with
//        a symbol \(Image(systemName: "chevron"))
//    """)
    
//    Image(systemName: "square.and.pencil")

    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    
    //Main Code in here
    var body: some View {
        
        
        
//Start of List Code which is placed inside a Zstack
        VStack{

            ZStack{
                //When there are no items use the NoItemsView page
                if listViewModel.items.isEmpty{
                    NoItemsView()
                        //This is the animation for when it appears/disappears. I might further customize this.
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List{
                        ForEach(listViewModel.items) { item in
                           ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            
            .background(Image(colorScheme == .dark ? "NightScene" : "AstheticBridge").opacity(1))
        
        .navigationTitle("Tasks")
        .navigationBarItems(
                leading: EditButton(),
                trailing:
//                    Button("Hi") {
//                        print("Hello")
//                    }

                            NavigationLink("New Task >", destination: AddView())
                        //Note figure out how to change the "Back" button, right now the tutorial doesnt tell you how to customize that button.
                        )
        }//Vstack
   

       
        
    } //End of Body: View
    
} // End of struct ListView





struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                ListView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            NavigationView{
                ListView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}

