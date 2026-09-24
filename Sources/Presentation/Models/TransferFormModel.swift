import Foundation

struct TransferFormModel: Identifiable {
    let id = UUID()
    var amount: Double
    var fromAccount: String
    var toAccount: String
    var idempotencyKey: IdempotencyKey

    init(amount: Double, fromAccount: String, toAccount: String, idempotencyKey: IdempotencyKey) {
        self.amount = amount
        self.fromAccount = fromAccount
        self.toAccount = toAccount
        self.idempotencyKey = idempotencyKey
    }

    func validate() throws {
        guard amount > 0 else {
            throw TransferFormValidationError.invalidAmount
        }
        guard!fromAccount.isEmpty,!toAccount.isEmpty else {
            throw TransferFormValidationError.invalidAccount
        }
    }
}

enum TransferFormValidationError: Error {
    case invalidAmount
    case invalidAccount
}