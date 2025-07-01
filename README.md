:

🛒 ProductZo
A modern Flutter app built with Bloc, HTTP, and a clean MVVM architecture to display and manage products.

🚀 Features
✅ Fetch & Display Products

Retrieves product data from DummyJSON API

Beautiful grid UI with images, title, price, and description

✅ View Product Details

Users can view individual product details with clear, structured information

✅ Edit Products

Users can edit product information through a validated form

Form uses TextEditingController with real-time validation

✅ State Management with Bloc

Cleanly separates business logic with flutter_bloc

Scalable and maintainable structure

✅ MVVM Architecture

Follows best practices with Model–View–ViewModel

Keeps UI, state, and business logic well-organized

⚙️ Dependencies
flutter_bloc – predictable state management

http – REST API calls

Flutter SDK – stable channel

🔗 API
Base URL: https://dummyjson.com/products

Note: The DummyJSON API does not persist edits on the server. You will see updated responses locally, but the API does not store them permanently.

This is a known API limitation.

📂 Project Structure
bash
Copy
Edit
lib/
 ├── core/           # App-level colors, constants, extensions
 ├── features/
 │   └── products/
 │        ├── models/   # Product data models
 │        ├── views/    # UI screens & widgets
 │        ├── viewmodel/# MVVM logic
 │        └── bloc/     # Bloc states, events, and bloc classes
 ├── main.dart      # Entry point
✨ Screenshots
Add your UI screenshots here — grid view, product details, edit form, etc.

📝 Known Issues
⚠️ Editing Not Persisted
The DummyJSON API is for testing only — it does not save changes. Edited product data will show locally, but re-fetching resets it. This is expected behavior from the API side.

