import Foundation

public protocol AccountRepository: AnyObject {
    func getAccounts() async throws -> [Account]
}