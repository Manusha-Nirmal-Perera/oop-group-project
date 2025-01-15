# OOP Group Project

Welcome to the OOP Group Project! This project is a Maven-based web application designed to demonstrate object-oriented programming principles in a practical setting.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Project Overview

This project serves as a comprehensive example of applying object-oriented programming concepts in a web application. It includes functionalities such as user management, product listings, and order processing, all structured to showcase best practices in OOP design.

## Features

### Admin Features
- Add new products
- Edit product information
- Deliver or reject orders
- View and delete reviews
- View and delete reports
- See user reviews

### User Features
- Add to wishlist
- Add to cart
- Edit cart
- Checkout and place orders
- Accept or reject orders
- Review orders
- Send reports
- View sent reports and their status
- Edit personal information

## Installation

To set up this project locally, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Manusha-Nirmal-Perera/oop-group-project.git

---

2. **Navigate to the project directory**:

   ```bash
   cd "path/to/your/location/oop-group-project"

---

3. **Import the Project into Your IDE**:

   - Open your IDE (e.g., Eclipse, IntelliJ IDEA).
   - Import the project as a Maven project.

---

4. **Set Up the Database**:

   - Locate the `online_store.sql` file in the project root.
   - Use this file to create the necessary database schema in your preferred database management system.

---

5. **Configure Database Connection**:

1. Open the `src/main/resources/application.properties` file.
2. Update the database connection properties to match your local setup.

---

6. **Build and Run the Project**:

   - Use Maven to build the project:
     ```bash
     mvn clean install
     ```
   - Deploy the application on your local server.
---

## Usage

### Once the Application is Running:

- Access the web application through your browser at:  
  `http://localhost:8080`
- Register a new user.
- Registe a new Admin
- Explore the product listings, add items to your cart, add items to wishlist, and proceed to checkout. Also try editing personal info.
- From admin side ty adding a new product, edit product info, cancel or deliver orders

## Contributing

We welcome contributions to enhance this project. To contribute:

1. **Fork the repository**.
 
---

2. **Create a new branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
---

3. **Make your changes**:

---

4. **Commit your changes:**:
    ```bash
   git commit -m "Add feature: your feature name"
   ```

---

5. **Push to your branch**:
     ```bash
     git push origin feature/your-feature-name
     ```

---

6. **Create a Pull Request**:
