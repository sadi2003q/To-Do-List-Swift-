# ``To_Do_List``

@Metadata {
    @CallToAction(
                  purpose: link,
                  url: "https://github.com/sadi2003q/To-Do-List-Swift-",
                  label: "View on GitHub"
                  ),
    @PageKind(sampleCode)
    @PageColor(red)
    
}

## Overview

**ToDoListApp** is a SwiftUI-based application designed to help users manage their daily tasks efficiently. It allows users to add, update, delete, and reorder tasks with an intuitive and interactive interface. The app leverages **SwiftData** for seamless data persistence, ensuring tasks are saved and managed effectively.

@TabNavigator {
    @Tab("Opening Page") {
        ![image1](img1)
    }
    @Tab("Adding Page") {
        ![image2](img2)
    }
}

## Features

- ✅ **Add New Tasks:** Users can create new tasks with ease.  
- ✏️ **Edit Tasks:** Tap on a task to mark it as complete or incomplete.  
- 🗑 **Delete Tasks:** Remove completed or unwanted tasks.  
- 🔄 **Reorder Tasks:** Organise tasks by dragging and dropping.  
- 🎨 **Interactive UI:** Dynamic animations and responsive design.  

---

## Important Components

### 1. `SwiftData`  
SwiftData is a modern data management framework that simplifies data persistence in Swift applications.  
- It provides seamless model management and CRUD operations.  
- In this app, it manages the storage and retrieval of tasks.

### 2. `ItemModel`  
A data model representing each task in the list.  
- Contains properties for the task ID, title, and completion status.  
- Enables toggling the completion state of tasks.

### 3. `ListViewModel`  
Handles the app's business logic and data manipulation.  
- Fetches, adds, updates, deletes, and reorders tasks.  
- Connects the UI with the data layer.

### 4. `SwiftDataService`  
Manages data persistence with SwiftData.  
- Handles database operations like fetching, adding, updating, and deleting tasks.  
- Centralised data service for better scalability.

### 5. `ListView`  
Displays the list of tasks and manages user interactions.  
- Provides toolbar actions for adding and editing tasks.  
- Integrates task completion toggling and animations.

### 6. `AddView`  
User interface for adding new tasks.  
- Validates input and triggers task creation.  
- Uses alerts for user feedback on invalid input.

### 7. `ListRowView`  
Represents each task in the task list.  
- Displays task titles and completion status with icons.  
- Provides interactive gestures for updating tasks.

### 8. `ListRowEmptyView`  
A placeholder view when the task list is empty.  
- Encourages users to add new tasks.  
- Features an animated button to navigate to the Add Task view.

---

## App Flow

1. **Launch App:** Displays the `ListView` with existing tasks.  
2. **Add Task:** Navigates to `AddView` where users can input new tasks.  
3. **Update Task:** Tap on a task in `ListView` to toggle completion.  
4. **Delete/Move Task:** Swipe to delete or drag to reorder tasks.  
5. **Persist Data:** All changes are saved using `SwiftDataService`.

---

## Data Management Workflow

1. **Add Task** → `AddView` → `ListViewModel.addItem()` → `SwiftDataService.AddTask()`  
2. **Update Task** → `ListView` (Tap) → `ListViewModel.updateItem()` → `SwiftDataService.UpdateTask()`  
3. **Delete Task** → `ListView` (Swipe) → `ListViewModel.onDelete()` → `SwiftDataService.DeleteTask()`  
4. **Fetch Tasks** → On App Launch → `ListViewModel` → `SwiftDataService.FetchTask()`

---

## Code Structure

📂 ToDoListApp

├── 📄 [`To_Do_ListApp.swift`](doc:To_Do_ListApp)        // App entry point

├── 📄 [`ItemModel.swift`](doc:ItemModel)             // Data model for tasks

├── 📄 [`ListViewModel.swift`](doc:ListViewModel)         // Business logic and data handling

├── 📄 [`SwiftDataService.swift`](doc:SwiftDataService)      // Data persistence management

├── 📄 [`ListView.swift`](doc:ListView)              // Main view displaying tasks

├── 📄 [`AddView`](doc:AddView)              // View for adding new tasks

├── 📄 [`ListRowView.swift`](doc:ListRowView)           // View for displaying each task row

└── 📄 [`ListRowEmptyView.swift`](doc:ListRowEmptyView)      // View when task list is 

---

## Technologies Used

- **SwiftUI** for UI components and user interactions.  
- **SwiftData** for data persistence.  
- **MVVM Architecture** for clean separation of concerns.

---

## Future Enhancements

- 📅 **Add Due Dates** for tasks.  
- 🔔 **Reminders and Notifications** for pending tasks.  
- 🌙 **Dark Mode Support**.  
- ☁️ **iCloud Sync** for cross-device data sync.

---

## Conclusion

**ToDoListApp** is a simple yet powerful task management tool that demonstrates effective use of **SwiftUI** and **SwiftData**. Its clean design, smooth animations, and persistent data management make it a solid foundation for further feature expansion and real-world applications.

---
