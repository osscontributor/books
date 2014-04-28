class BootStrap {

    def init = { servletContext ->

        new com.demo.Book(title: 'The Shining', author: 'Stephen King', sold: false).save(failOnError: true)
        new com.demo.Book(title: 'Infinite Jest', author: 'David Foster Wallace', sold: false).save(failOnError: true)
        new com.demo.Book(title: 'Wool', author: 'Hugh Howey', sold: false).save(failOnError: true)
    }
}
