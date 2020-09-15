import Foundation
import Vapor

class DecodingMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        var f = request.eventLoop.future()
        
//        f = f.flatMap {
//            request.body.collect(max: nil).transform(to: ())
//        }
        
        f = f.flatMapThrowing {
            _ = try request.content.decode(MyContent.self)
        }
        
        
        return f.flatMap {
            next.respond(to: request)
        }
    }
}

struct MyContent: Codable {
    
}
