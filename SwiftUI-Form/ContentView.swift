//
//  ContentView.swift
//  Swift-UI
//
//  Created by Esteban Rodríguez Alonso on 10/04/20.
//  Copyright © 2020 Esteban Rodríguez Alonso. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var showAlert: Bool = false
    @State private var showActionSheet: Bool = false
    @ObservedObject var userTest = User()
    
    var alert: Alert {
        Alert(title: Text("Button_About"),
              message: Text("About_Text"),
              dismissButton: .default(Text("Button_Ok")
            )
        )
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Button_Help"),
                    message: Text("Help_Text"),
                    buttons: [
                        .default(Text("Go to developer site"), action: {
                            UIApplication.shared.open(URL(string: self.userTest.url)!)
                        }),
                        .cancel(Text("Button_Cancel"))]
        )
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30.0){
            Text("App_Title")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("App_SubTitle")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
            VStack(alignment: .leading, spacing: 30.0) {
                Form {
                    Section(header: Text("Form_Title")) {
                        HStack(alignment: .center) {
                            Text("Form_Name")
                            TextField("Name", text: $userTest.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        DatePicker(selection: $userTest.birthDay,
                                   displayedComponents: .date,
                                   label: { Text("Form_BirthDate") })
                        
                        
                    }
                }            }
            if userTest.checkAge(birthDate: userTest.birthDay) && !userTest.name.isEmpty {
                VStack(alignment: .center) {
                    Text("Greet_Text \(userTest.name)")
                        .multilineTextAlignment(.center)
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 40.0) {
                Button(action: {
                    self.showAlert.toggle()
                }) {
                    Image(systemName: "info.circle")
                    Text("Button_About")
                }
                .cornerRadius(20)
                .alert(isPresented: self.$showAlert) {
                    () -> Alert in self.alert
                }
                Spacer()
                Button(action: {
                    self.showActionSheet.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
                    Text("Button_Help")
                }
                .actionSheet(isPresented: self.$showActionSheet) {
                    () -> ActionSheet in self.actionSheet
                }
            }
            .padding(.all)
        }
        .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
