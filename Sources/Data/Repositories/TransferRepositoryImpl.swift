import Foundation
import Combine
import Domain
import Data

class TransferRepositoryImpl: TransferRepository {
    private let apiClient: TransferAPIClient

    init(apiClient: TransferAPIClient) {
        self.apiClient = apiClient
    }

    func executeTransfer(_ transfer: Transfer) -> AnyPublisher<Transfer, TransferError> {
        return apiClient.executeTransfer(transfer)
           .mapError { error in
                switch error {
                case let networkError as NetworkError:
                    return.settlementRejected(reason: networkError.localizedDescription)
                default:
                    return.settlementRejected(reason: "Unknown error")
                }
            }
           .eraseToAnyPublisher()
    }
}