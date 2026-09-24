import Foundation
import Combine

public protocol TransferRepository {
    func executeTransfer(transfer: Transfer, idempotencyKey: IdempotencyKey) -> AnyPublisher<Transfer, TransferError>
}

public class ExecuteTransferUseCase {
    private let transferRepository: TransferRepository

    public init(transferRepository: TransferRepository) {
        self.transferRepository = transferRepository
    }

    public func execute(transfer: Transfer, idempotencyKey: IdempotencyKey) -> AnyPublisher<Transfer, TransferError> {
        return transferRepository.executeTransfer(transfer: transfer, idempotencyKey: idempotencyKey)
           .mapError { error in
                switch error {
                case.settlementRejected(let reason):
                    return TransferError.settlementRejected(reason: reason)
                default:
                    return error
                }
            }
           .eraseToAnyPublisher()
    }
}