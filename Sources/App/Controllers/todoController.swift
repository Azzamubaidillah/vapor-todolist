//
//  todoController.swift
//  
//
//  Created by Azzam Ubaidillah on 26/09/23.
//

import Vapor

struct TodoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todosRoute = routes.grouped("todos")

        todosRoute.post(use: create)
        todosRoute.get(use: index)
        todosRoute.group(":todoID") { todoRoute in
            todoRoute.get(use: show)
            todoRoute.put(use: update)
            todoRoute.delete(use: delete)
        }
    }

    func create(req: Request) throws -> EventLoopFuture<Todo> {
        let todo = try req.content.decode(Todo.self)
        return todo.save(on: req.db).map { todo }
    }

    func index(req: Request) throws -> EventLoopFuture<[Todo]> {
        return Todo.query(on: req.db).all()
    }

    func show(req: Request) throws -> EventLoopFuture<Todo> {
        guard let todoID = req.parameters.get("todoID", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Todo.find(todoID, on: req.db).unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<Todo> {
        guard let todoID = req.parameters.get("todoID", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        let updatedTodo = try req.content.decode(Todo.self)
        return Todo.find(todoID, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { todo in
                todo.title = updatedTodo.title
                todo.isCompleted = updatedTodo.isCompleted
                return todo.save(on: req.db).map { todo }
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        guard let todoID = req.parameters.get("todoID", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Todo.find(todoID, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { todo in
                return todo.delete(on: req.db).transform(to: .noContent)
            }
    }
}
