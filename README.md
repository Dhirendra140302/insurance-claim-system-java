# 🛡️ Insurance Claim Management System

A **Java-based web application** built using **JSP, Servlets, JDBC, and MySQL** that allows users to apply for insurance claims and enables admins to manage (approve/reject) those claims.

---

## 📌 Features

### 👤 User

* User Registration & Login
* Apply for Insurance Claim
* View submitted claims
* Secure Logout (Session-based)

### 🛠️ Admin

* Admin Login
* View all insurance claims
* Approve or Reject claims
* Secure Logout

---

## 🧰 Technologies Used

| Technology      | Purpose               |
| --------------- | --------------------- |
| Java (JDK 21)   | Backend logic         |
| JSP             | View layer            |
| Servlets        | Controller layer      |
| JDBC            | Database connectivity |
| MySQL           | Database              |
| Apache Tomcat 9 | Application server    |
| HTML / CSS      | Frontend              |
| Eclipse IDE     | Development           |

---

## 🏗️ Project Structure

```
Insurance_Claim_System/
│
├── src/
│   ├── com.insurance.controller
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── ClaimServlet.java
│   │   ├── AdminServlet.java
│   │   └── LogoutServlet.java
│   │
│   ├── com.insurance.dao
│   │   └── DBConnection.java
│   │
│   └── com.insurance.model
│       ├── User.java
│       └── Claim.java
│
├── WebContent/
│   ├── jsp/
│   │   ├── login.jsp
│   │   ├── register.jsp
│   │   ├── dashboard.jsp
│   │   ├── adminDashboard.jsp
│   │   ├── claim.jsp
│   │   └── viewClaims.jsp
│   │
│   ├── css/
│   │   └── style.css
│   │
│   └── WEB-INF/
│       └── web.xml
│
└── README.md
```

---

## 🗄️ Database Setup

### 📌 Create Database

```sql
CREATE DATABASE insurance_db;
USE insurance_db;
```

### 📌 Users Table

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20)
);
```

### 📌 Claims Table

```sql
CREATE TABLE claims (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    policy_no VARCHAR(100),
    claim_amount DOUBLE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

---

## ⚙️ Configuration

### 🔹 Database Connection (`DBConnection.java`)

```java
return DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/insurance_db",
    "root",
    "root"
);
```

➡️ Update username/password as per your MySQL setup.

---

## 🚀 How to Run the Project

1. Install **JDK 21**
2. Install **Apache Tomcat 9**
3. Import project into **Eclipse (Dynamic Web Project)**
4. Configure **Target Runtime → Tomcat 9**
5. Create database & tables
6. Start Tomcat
7. Open browser:

```
http://localhost:8080/insurance_claim_syatem/
```

---

## 🔐 Authentication & Session Management

* Session-based login
* Secure logout using `LogoutServlet`
* Admin access restricted via role checking
* Dashboard protected using session validation

---

## 🧪 Sample Admin Credentials

```
Email: admin@gmail.com
Password: admin123
Role: ADMIN
```

(Add manually in database)

---

## 📸 Screenshots 

* Registration Page
  <img width="1678" height="847" alt="Screenshot 2026-01-13 223829" src="https://github.com/user-attachments/assets/6d3c10f3-f164-458e-ac80-177eacdb8682" />

* Login Page
  <img width="1695" height="822" alt="Screenshot 2026-01-13 223852" src="https://github.com/user-attachments/assets/51bdb09f-7e68-485e-9002-1fd63d819b59" />

* User Dashboard
  <img width="1685" height="817" alt="Screenshot 2026-01-13 223918" src="https://github.com/user-attachments/assets/423e4b76-8cbe-48e8-b22e-d854a3d9b62d" />

* Admin Dashboard
  <img width="1713" height="860" alt="Screenshot 2026-01-13 224048" src="https://github.com/user-attachments/assets/698535ba-3847-4c66-b197-e1474611f781" />

* Claim Approval Page
  <img width="1620" height="801" alt="Screenshot 2026-01-13 224002" src="https://github.com/user-attachments/assets/ee5def0a-4544-4a40-a927-f6c87fd3172d" />


---

## 🔮 Future Enhancements

* Password encryption
* Pagination for claims
* Email notifications
* File upload for claim documents
* REST API version
* Spring Boot migration

---

## 👨‍💻 Author

**Dhirendra Yadav**

* GitHub: [https://github.com/Dhirendra140302](https://github.com/Dhirendra140302)
---

## 📄 License

This project is for **learning and academic purposes**.
Free to use and modify.


