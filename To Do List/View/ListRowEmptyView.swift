//
//  ListRowEmptyView.swift
//  To Do List
//
//  Created by Sadi on 11/01/2025.
//

import SwiftUI

/// A view that is displayed when the to-do list is empty.
///
/// `ListRowEmptyView` serves as a placeholder screen with a motivational message and an animated button
/// encouraging the user to add new tasks.
///
/// - Features:
///   - A congratulatory message when the task list is empty.
///   - An animated button to navigate to the `AddView` for creating new tasks.
///   - Smooth animation effects to attract user interaction.
struct ListRowEmptyView: View {
    
    /// Controls the animation state of the "Add Task" button.
    @State private var animation: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            View_EmptyMessage
            Button_AddTask
        }
        .onAppear {
            // Start animation when the view appears
            animation.toggle()
        }
    }
    
    /// A view displaying a motivational message when the task list is empty.
    ///
    /// - Includes a bold title with an underline and a detailed encouragement message.
    private var View_EmptyMessage: some View {
        VStack(spacing: 20) {
            Text("List is Empty😮‍💨")
                .font(.title)
                .bold()
                .underline(color: .red)
            
            Text("Congratulations!! 🥳 You have completed all of your tasks. Keep up the great work and stay productive! New goals are waiting for you to conquer! 🚀")
                .multilineTextAlignment(.center)
        }
        .padding(40)
        .frame(maxWidth: 400)
        .foregroundStyle(.primary)
    }
    
    /// A navigation button that leads to the `AddView` for adding new tasks.
    ///
    /// - Features animated scaling, rotation, and colour transitions to attract attention.
    private var Button_AddTask: some View {
        NavigationLink {
            AddView()
        } label: {
            ZStack {
                // Animated background with gradient colour
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient: animation ? Gradient(colors: [Color.purple, Color.blue])
                            : Gradient(colors: [Color.green, Color.brown]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: animation ? 260 : 220, height: 70)
                    .shadow(
                        color: animation ? Color.blue.opacity(0.7) : Color.black.opacity(0.3),
                        radius: animation ? 20 : 10,
                        x: 0,
                        y: animation ? 10 : 5
                    )
                    .overlay {
                        /// Button text with a glowing effect during animation.
                        Text("➕ Add Task 🥺")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .shadow(color: animation ? Color.white.opacity(0.8) : Color.clear, radius: 10)
                    }
                    .scaleEffect(animation ? 1.1 : 1.0)
                    .rotationEffect(.degrees(animation ? 3 : 0))
                    .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animation)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListRowEmptyView()
    }
    .toolbarVisibility(.hidden, for: .navigationBar)
}
