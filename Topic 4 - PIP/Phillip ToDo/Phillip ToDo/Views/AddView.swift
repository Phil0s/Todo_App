//
//  AddView.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 8/9/21.
//

import SwiftUI


struct AddView: View {
    //Using enviroment presentation we can switch back to ListView after adding a new item
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var alertTitle: String = ""
    //Alert is set to false first so it doesnt pop up until the user types less than the required amount. 
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                //Textbox allowing user to type their new tasks
                TextField("Type here to add an task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                //Save Button, See if it is possible to customise it?
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding(.top, 4)
                })
                
                Text("\(Image(systemName: "lightbulb.fill")) If your teacup icon is brewed, that means your task has been completed!")
                    .padding(.top, 25)
                
                
                
               
                
            }
            //Padding for Vstack which includes button and add text button
            .padding(14)
            
            
        }
        .background(Image(colorScheme == .dark ? "NightMessyRoom" : "Blue Asthetic").opacity(1))
        .navigationTitle("Add an Task")
        .alert(isPresented: $showAlert, content: getAlert)
    } //End Body
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            //When Save button is pressed we are calling
            listViewModel.addItem(title: textFieldText)
            //Tell presentationmode to go back by 1 in the hierarchy
            presentationMode.wrappedValue.dismiss()
        }
    } // End of SaveButton
    
    //Word Count Function, to ensure items are at least more than 3 letters to avoid spam or misclick.
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your item must be atleast 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
} //End Struct AddView













struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            //Double Navigation for checking light and dark mode back to back.
            NavigationView{
                AddView()
            }
            //Preferred theme for this navigation
            .preferredColorScheme(.dark)
            //Preview doesnt have access to enviroment therefore we add it down here
            .environmentObject(ListViewModel())
            
            NavigationView{
                AddView()
            }
            //Preferred theme for this navigation
            .preferredColorScheme(.light)
            //Preview doesnt have access to enviroment therefore we add it down here
            .environmentObject(ListViewModel())
        }
    }
} //End of Preview

