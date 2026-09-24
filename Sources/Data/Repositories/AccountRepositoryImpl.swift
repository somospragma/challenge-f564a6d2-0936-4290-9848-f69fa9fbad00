import Foundation
import Combine
import Domain

public class AccountRepositoryImpl: AccountRepository {
    private let transferAPIClient: TransferAPIClient

    public init(transferAPIClient: TransferAPIClient) {
        self.transferAPIClient = transferAPIClient
    }

    public func getAccounts() -> AnyPublisher<[Account], NetworkError> {
        return transferAPIClient.getAccounts()
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }

    public func getAccount(by id: String) -> AnyPublisher<Account, NetworkError> {
        return transferAPIClient.getAccount(by: id)
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }

    public func updateAccount(_ account: Account) -> AnyPublisher<Void, NetworkError> {
        return transferAPIClient.updateAccount(account)
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }
}