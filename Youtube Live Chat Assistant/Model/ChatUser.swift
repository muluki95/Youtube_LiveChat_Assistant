//
//  ChatUser.swift
//  Youtube Live Chat Assistant
//
//  Created by Esther Nzomo on 3/10/26.
//

struct ChatUser: Identifiable {
    let id: String
    let username: String
    let profileImageURL: String?
}


extension ChatUser {
    static let john = ChatUser(
            id: "u1",
            username: "John",
            profileImageURL: nil
        )
    static let mary = ChatUser(
            id: "u2",
            username: "Mary",
            profileImageURL: nil
        )

        static let alex = ChatUser(
            id: "u3",
            username: "Alex",
            profileImageURL: nil
        )

        static let esther = ChatUser(
            id: "u4",
            username: "Esther",
            profileImageURL: nil
        )
}
