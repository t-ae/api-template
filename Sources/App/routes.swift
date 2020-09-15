import Vapor

func routes(_ app: Application) throws {
    let router = app.grouped(DecodingMiddleware())
    router.post { req in
        return "It works!"
    }
}
