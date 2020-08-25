import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func getAllPosts() -> [Post] {
        
        var posts = [Post]()
        let postRequest: NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            posts = try self.moc.fetch(postRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return posts
    }
    
}
