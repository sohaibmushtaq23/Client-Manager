# Client Manager

A full‑stack client management application with a Go backend API and a Vue 3 + Vuetify frontend.

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

## Project Structure
Client-Manager/
├── backend/ # Go API
│ ├── cmd/
│ ├── internal/
│ ├── go.mod
│ └── ...
├── frontend/ # Vue application
│ ├── src/
│ ├── public/
│ ├── package.json
│ └── ...
├── database/ # SQL scripts
│ ├── schema.sql
│ └── sample_data.sql
├── .gitignore
└── README.md

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
Create a database (e.g., ClientDB) in your SQL Server instance.

Run the database/schema.sql script to create the tables.

(Optional) Run database/sample_data.sql to populate with test data.

### 3. Backend Configuration
The backend reads the database connection string from .env file also provided in the backend folder. Just set the credentials

### 4. Run the Backend
```bash
cd backend
go mod download
go run cmd/main.go



