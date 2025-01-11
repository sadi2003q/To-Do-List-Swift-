//
//  ListRowEmptyView.swift
//  To Do List
//
//  Created by  Sadi on 11/01/2025.
//


import SwiftUI

struct ListRowEmptyView: View {
    
    @State private var animation: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            View_EmptyMessage
            Button_AddTask
        }
    }
    
    private var View_EmptyMessage: some View {
        VStack(spacing: 20) {
            Text("List is Empty😮‍💨")
                .font(.title)
                .bold()
                .underline(color: .red)
            
            Text("Congratulations!! 🥳 You have completed all of your tasks. Keep up the great work and stay productive! New goals are waiting for you to conquer! 🚀")
        }
        .padding(40)
        .frame(maxWidth: 400)
        .foregroundStyle(.primary)
//        .onAppear {
//            animation = true
//        }
//        .onDisappear {
//            animation = false
//        }
    }
    
    private var Button_AddTask: some View {
        NavigationLink {
            AddView()
        } label: {
            ZStack {
                
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
                    .shadow(color: animation ? Color.blue.opacity(0.7) : Color.black.opacity(0.3),
                            radius: animation ? 20 : 10,
                            x: 0,
                            y: animation ? 10 : 5)
                    .overlay {
                        // Button Text with Glow Effect
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

