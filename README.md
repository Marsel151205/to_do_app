# 📝 ToDo App (Open Source)

A modern cross-platform **ToDo application** for **Android** and **iOS** built as an **open-source learning project**.  
Includes a **custom backend** and an open **Figma design** prototype.

---

## 🚀 Overview

The ToDo App helps users:
- Create, edit, and delete tasks
- Mark tasks as completed
- Filter and sort by priority or date
- Sync data with the backend
- Use the app seamlessly across Android and iOS

---

## 🧩 Architecture

The project follows a **Clean Architecture** approach with separation of concerns:
- **Presentation Layer** — UI built with Flutter Widgets
- **Domain Layer** — Business logic and entities
- **Data Layer** — Network and local persistence
- **Dependency Injection** via `get_it`
- **Navigation** handled by `go_router`
- **Networking** with `dio`
- **Async operations** using `Future` and `FutureBuilder`

---

## 🛠️ Tech Stack

| Layer | Technologies |
|-------|--------------|
| **Mobile (Flutter)** | Flutter, Dart, Dio, get_it, go_router, FutureBuilder |
| **Architecture** | Clean Architecture |
| **State Management** | Flutter Bloc |
| **Design** | [Figma Prototype](https://www.figma.com/design/ErGGmOpO5XtbAEdzaq4QoD/Mobile-Apps-%E2%80%93-Prototyping-Kit--Community-?node-id=101-306&p=f&t=T6TQcWBRKWipS6Ym-0) |

---