# 🛒 **ProductZo**

A modern **Flutter app** built with **Bloc**, **HTTP**, and a clean **MVVM** architecture to **display and manage products**.

---

## 🚀 **Features**

**✅ Fetch & Display Products**  
- Retrieves product data from the [DummyJSON API](https://dummyjson.com/products)  
- Beautiful grid UI with images, title, price, and description

**✅ View Product Details**  
- Users can view individual product details with clear, structured information

**✅ Edit Products**  
- Users can edit product information through a validated form  
- Form uses `TextEditingController` with real-time validation

**✅ State Management with Bloc**  
- Cleanly separates business logic with `flutter_bloc`  
- Scalable and maintainable structure

**✅ MVVM Architecture**  
- Follows best practices with **Model–View–ViewModel**  
- Keeps UI, state, and business logic well-organized

---

## ⚙️ **Dependencies**

- **`flutter_bloc`** – Predictable state management
- **`http`** – REST API calls
- **Flutter SDK** – Stable channel

---

## 🔗 **API**

- **Base URL:** [`https://dummyjson.com/products`](https://dummyjson.com/products)

> **Note:** The DummyJSON API does **not persist edits on the server**.  
> Edited product data will show locally, but the API does not store them permanently.  
> This is a known API limitation.

---

## 📝 **Known Issues**

⚠️ **Editing Not Persisted** 

The DummyJSON API is for demonstration only – it does **not** save changes on the backend.  
Your edits will show in the app but re-fetching will reset them.

---

