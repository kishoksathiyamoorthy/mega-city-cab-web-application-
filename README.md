# Mega City Cab System

## Introduction
This project is an **interactive web-based car booking system** designed for seamless ride reservations. The system implements a **distributed architecture with web services** and follows best practices in **software engineering, test-driven development (TDD), and version control**.

## Features
### 1. **User Management**
- Customer and Admin registration/login
- Secure authentication
- Session management with auto-logout after 2 minutes of inactivity

### 2. **Cab Booking & Management**
- Customers can book rides by selecting pickup and drop locations
- Booking history tracking and report generation (CSV format)
- Admin can approve, modify, or cancel bookings
- Admin manages driver availability

### 3. **System Architecture**
- **Frontend**: JSP, Bootstrap
- **Backend**: Java Servlets, Spring Boot (REST APIs)
- **Database**: MySQL with JDBC (Prepared Statements for security)
- **Version Control**: GitHub for collaborative development

## UML Diagrams
- **Use Case Diagram**: Defines interactions between Customers, Admins, and the system
- **Class Diagram**: Object-oriented design structure
- **Sequence Diagram**: Defines the flow of customer booking & admin actions

## Design Patterns Used
- **Singleton Pattern**: User authentication and session management
- **Factory Pattern**: Object creation for various user types
- **Abstract Factory Pattern**: Consistent report generation and billing modules

## Test Plan & Development
### **Backend Testing**
- **JUnit**: Unit and integration tests


### **Frontend Testing**
- **Jest & React Testing Library**: Unit and integration tests for UI components


## Installation & Setup
1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-repo/mega-city-cab.git
   cd mega-city-cab
   ```
2. **Backend Setup**
   - Install Java 11+
   - Configure MySQL database
   - Run Spring Boot application

3. **Frontend Setup**
   - Install Node.js
   - Run `npm install` and `npm start`

4. **Run Tests**
   ```sh
   mvn test  # Run JUnit backend tests
   npm test  # Run Jest frontend tests
   ```

## Contributing
- Fork the repo and create a feature branch
- Commit your changes with meaningful messages
- Open a Pull Request (PR) for review


## References
- [JUnit](https://junit.org)
