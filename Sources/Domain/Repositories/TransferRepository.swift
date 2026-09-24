import Foundation

public protocol TransferRepository: AnyObject {
    func executeTransfer(transfer: Transfer, idempotencyKey: IdempotencyKey) async throws -> Transfer
    func getTransferStatus(idempotencyKey: IdempotencyKey) async throws -> TransferStatus
}