package com.demo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BookController {

    static allowedMethods = [update: "PUT"]

    def index(int max) {
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model:[bookInstanceCount: Book.count()]
    }

    @Transactional
    def update(Library library) {
        // this is naive and doesn't deal with things like error
        // handling but is intentially simplified to focus on the
        // question at hand...

        library.books*.save()

        redirect action: 'index'
    }
}

class Library {
    List<Book> books
}
