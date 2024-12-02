//
//  AddView.swift
//  DoneYet
//
//  Created by Kerem Türközü on 26.10.2024.
//

import SwiftUI


struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save" .uppercased())
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(12)
        }
        .navigationTitle("Done Yet? ")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    func saveButtonPressed() {
        if textAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
        
    }
    
    func textAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new to-do must be at least 3 characters!! "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
