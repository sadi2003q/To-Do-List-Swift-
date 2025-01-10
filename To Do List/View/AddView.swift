//
//  AddView.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import SwiftUI




struct AddView: View {
    
    @Environment(ListViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    
    @State var textFieldText: String = ""
    @State private var showAlert: Bool = false
    @State private var error: Error = .inappropropriateInput
    
    
    
    
    var body: some View {
        ScrollView {
            TextField_NewTask
            Button_AddTask
        }
        .navigationTitle("Add an Item ✍🏻")
        .alert(isPresented: $showAlert, error: error) { error in
            
        } message: { error in
            Text(error.failureReason ?? "Something went wrong, Please try again later")
        }

    }
    
    private var TextField_NewTask : some View {
        TextField("Type something here...", text: $textFieldText)
            .submitLabel(.go)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue.opacity(0.7), lineWidth: 1)
            )
            .padding()
            
    }
    
    private var Button_AddTask : some View {
        Button {
            SaveButtonPressed()
        } label: {
            Text("Save".uppercased())
                .foregroundStyle(Color.white)
                .font(.headline)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 20)
            
        }

    }
    
    func SaveButtonPressed() {
        if AppropriateText() {
            viewModel.addItem(title: textFieldText)
            textFieldText = ""
            dismiss()
        }
    }
    
    
    func AppropriateText() -> Bool {
        if textFieldText.count < 4 {
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environment(ListViewModel(dataSource: SwiftDataService.shared))
    
}
