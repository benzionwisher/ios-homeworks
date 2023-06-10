//
//  Post.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    static func createPost() -> [Post] {
        var post = [Post]()
    post.append(Post(author: "Чихуахуа",
                     description: "Чихуа́хуа (исп. Chihuahua [tʃiˈwawa]) — собака-компаньон. Считается самой маленькой собакой в мире и носит имя мексиканского штата Чиуауа.",
                     image: "1", likes: 1,
                     views: 2))
    post.append(Post(author: "Йоркширский терьер",
                     description: "Йоркширский терьер, или йорк (англ. yorkshire terrier), — порода декоративных собак, выведенная в Англии, в графстве Йоркшир в конце XIX века, на основе таких пород как манчестер-терьер, скайтерьер, мальтезе и др.",
                     image: "2", likes: 1,
                     views: 2))
    post.append(Post(author: "Шпиц",
                     description: "Померанский шпиц или миниатюрный шпиц (нем. deutsch Zwergspitz) — порода собак, относящаяся к категории «Шпицы и породы примитивного типа» по классификации МКФ.",
                     image: "3", likes: 1,
                     views: 2))
    post.append(Post(author: "Такса",
                     description: "Та́кса (нем. Dachshund, dackel) — порода южно-немецких норных охотничьих собак.",
                     image: "4", likes: 1,
                     views: 2))
    return post
    }
}
