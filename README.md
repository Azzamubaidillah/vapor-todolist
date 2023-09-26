# Vapor To-Do List API

A simple to-do list API built with Vapor, a server-side Swift web framework.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Running the Application](#running-the-application)
- [API Endpoints](#api-endpoints)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project is a server-side API for managing a to-do list. It allows you to create, read, update, and delete to-do items. It's built with Vapor, which is based on Swift, making it easy to extend and integrate with other Swift-based projects.

## Features

- Create new to-do items with titles and completion status.
- Retrieve a list of all to-do items.
- Update existing to-do items.
- Delete to-do items.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Swift and Vapor installed on your development machine.
- SQLite or another supported database system installed (for local development).
- An API testing tool like Postman or curl.

## Getting Started

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Azzamubaidillah/vapor-todolist.git

2. Change to the project directory:

   ```bash
   cd vapor-todolist

3. Install Dependencies

   ```bash
   vapor update

## Running the Application

1. Configure your database settings in configure.swift.

2. Apply migrations to create the necessary database tables:
   ```bash
   vapor update
   
3. Run the Application:
   ```bash
   vapor run

The application will start and be accessible at http://localhost:8080.

API Endpoints
- POST /todos: Create a new to-do item.
- GET /todos: Get a list of all to-do items.
- GET /todos/{todoID}: Get a specific to-do item by ID.
- PUT /todos/{todoID}: Update a specific to-do item by ID.
- DELETE /todos/{todoID}: Delete a specific to-do item by ID.
For detailed information on each endpoint and request/response examples, refer to the API documentation.

## Testing
Use an API testing tool like Postman to test the API endpoints. Follow the instructions in the Testing section of this README for guidance on testing CRUD operations.

## Contributing
Contributions are welcome! If you'd like to contribute to this project, please follow our contributing guidelines.

## License
This project is licensed under the MIT License.
