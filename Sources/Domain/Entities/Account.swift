import Foundation

public struct Account: Equatable, Sendable {
    public let id: String
    public let balance: Double
    public let currency: String

    public init(id: String, balance: Double, currency: String) {
        self.id = id
        self.balance = balance
        self.currency = currency
    }
}