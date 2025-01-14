//
//  AddView.swift
//  To Do List
//
//  Created by Sadi on 09/01/2025.
//

import SwiftUI

/// A view that allows users to add new tasks to the to-do list.
///
/// `AddView` provides a user interface to input a task title and save it.
/// It includes input validation to ensure meaningful task entries.
///
/// - Features:
///   - A text field for entering a task.
///   - A save button to add the task.
///   - Input validation to check if the task is at least 4 characters long.
///   - Error handling with user-friendly alerts.
struct AddView: View {
    
    /// The shared view model for managing the to-do list.
    @Environment(ListViewModel.self) var viewModel
    
    /// Dismisses the current view when the task is successfully saved.
    @Environment(\.dismiss) var dismiss
    
    /// The text input from the user for the new task.
    @State var textFieldText: String = ""
    
    /// A Boolean that controls the display of the error alert.
    @State private var showAlert: Bool = false
    
    /// The error state for input validation.
    @State private var error: Error = .inappropropriateInput
    
    var body: some View {
        ScrollView {
            TextField_NewTask
            Button_AddTask
        }
        .navigationTitle("Add an Item ✍🏻")
        .alert(isPresented: $showAlert, error: error) { _ in
            // No additional action on alert dismissal
        } message: { error in
            Text(error.failureReason ?? "Something went wrong, Please try again later")
        }
    }
    
    /// A styled text field for entering a new task.
    private var TextField_NewTask: some View {
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
    
    /// A button that triggers the task-saving process.
    private var Button_AddTask: some View {
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
    
    /// Saves the task if the input passes validation.
    ///
    /// - If the input is valid, the task is added, and the view is dismissed.
    /// - If invalid, an alert is displayed.
    func SaveButtonPressed() {
        if AppropriateText() {
            viewModel.addItem(title: textFieldText)
            textFieldText = ""
            dismiss()
        }
    }
    
    /// Validates the input text to ensure it's appropriate.
    ///
    /// - Returns: `true` if the input is at least 4 characters long, `false` otherwise.
    ///
    /// - Example:
    /// ```swift
    /// AppropriateText() // Returns false if input is less than 4 characters
    /// ```
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
