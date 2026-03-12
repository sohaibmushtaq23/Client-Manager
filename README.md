# Client Manager

A full‑stack client management CRUD application with a Go backend API and a Vue 3 + Vuetify frontend.

## Features
- Manage clients (create, read, update, delete)
- Manage contacts per client (create, read, update, delete)
- Clean, responsive UI with tabs for client details and contacts
- RESTful API with SQL Server database

## Technology Stack
- **Backend**: Go (Golang) with `chi` router, `database/sql`, and `go-mssqldb` driver
- **Frontend**: Vue 3, TypeScript, Vuetify 3, Pinia, Vue Router, Axios
- **Database**: Microsoft SQL Server
- **Tools**: Vite, Git

## Architecture Overview

### Backend (Go)
The backend follows a clean layered architecture:
- **Repository layer**: Direct database interaction using `database/sql`. Each entity (Client, Contact) has its own repository.
- **Service layer**: Contains business logic and validation. Services call repositories and return results to handlers.
- **Handler layer**: HTTP handlers that parse requests, call services, and return JSON responses.
- **Router**: Uses `chi` to define RESTful endpoints and middleware (CORS).

### Frontend (Vue 3)
The frontend is organised into modular components and state management:
- **Views**: Top‑level pages (e.g., `ClientsView.vue`).
- **Components**: Reusable UI pieces (e.g., `ClientList.vue`, `ClientForm.vue`, `ContactTable.vue`).
- **Stores (Pinia)**: Manage global state for clients and contacts, and handle API calls via services.
- **API services**: Axios‑based modules that communicate with the backend.
- **Router**: Vue Router for navigation.
- **TypeScript**: Provides type safety across the application.

## Prerequisites
- [Go](https://golang.org/dl/) (1.21 or later)
- [Node.js](https://nodejs.org/) (18 or later) and npm
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (local or remote)
- [Git](https://git-scm.com/)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/sohaibmushtaq23/Client-Manager.git
cd Client-Manager
```

### 2. Database Setup
* Create a database (e.g., ClientDB) in your SQL Server instance.
* Run the database/schema.sql script to create the tables.
* (Optional) Run database/sample_data.sql to populate with test data.

### 3. Backend Configuration
The backend reads the database connection string from .env file also provided in the backend folder. Just set the credentials

### 4. Run the Backend
```bash
cd backend
go mod download
go run cmd/main.go
```
### 5. Run the Frontend
```bash
cd frontend
npm install
npm run dev
```
## API Endpoints
| Method | Endpoint                     | Description               |
|--------|------------------------------|---------------------------|
| GET    | `/clients`                   | List all clients          |
| POST   | `/clients`                   | Create a new client       |
| GET    | `/clients/{id}`              | Get a client by ID        |
| PUT    | `/clients/{id}`              | Update a client           |
| DELETE | `/clients/{id}`              | Delete a client           |
| GET    | `/clients/{clientId}/contacts` | List contacts for client |
| POST   | `/clients/{clientId}/contacts` | Create a contact         |
| GET    | `/clients/{clientId}/contacts/{id}` | Get contact by ID    |
| PUT    | `/clients/{clientId}/contacts/{id}` | Update contact       |
| DELETE | `/clients/{clientId}/contacts/{id}` | Delete contact       |







