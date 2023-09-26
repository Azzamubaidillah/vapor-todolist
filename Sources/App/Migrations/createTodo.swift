//
//  createTodo.swift
//  
//
//  Created by Azzam Ubaidillah on 26/09/23.
//

import Fluent

struct CreateTodo: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("todos")
            .id()
            .field("title", .string, .required)
            .field("isCompleted", .bool, .required)
            .field("createdAt", .datetime)
            .field("updatedAt", .datetime)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("todos").delete()
    }
}
