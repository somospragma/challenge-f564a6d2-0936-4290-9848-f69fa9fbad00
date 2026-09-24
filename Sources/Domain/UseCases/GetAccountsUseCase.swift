import Foundation
import Combine

public protocol AccountRepository {
    func getAccounts() -> AnyPublisher<[Account], Error>
}

public class GetAccountsUseCase {
    private let accountRepository: AccountRepository

    public init(accountRepository: AccountRepository) {
        self.accountRepository = accountRepository
    }

    public func execute() -> AnyPublisher<[Account], Error> {
        return accountRepository.getAccounts()
           .mapError { error in
                // Manejo de error del ecosistema
                return error
            }
           .eraseToAnyPublisher()
    }
}