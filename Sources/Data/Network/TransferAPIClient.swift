import Foundation
import Combine

public class TransferAPIClient {
    private let baseURL: URL

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }

    public func getAccounts() -> AnyPublisher<[Account], URLError> {
        let url = baseURL.appendingPathComponent("/accounts")
        return URLSession.shared.dataTaskPublisher(for: url)
           .map(\.data)
           .decode(type: [Account].self, decoder: JSONDecoder())
           .mapError { $0 as URLError }
           .eraseToAnyPublisher()
    }

    public func getAccount(by id: String) -> AnyPublisher<Account, URLError> {
        let url = baseURL.appendingPathComponent("/accounts/(id)")
        return URLSession.shared.dataTaskPublisher(for: url)
           .map(\.data)
           .decode(type: Account.self, decoder: JSONDecoder())
           .mapError { $0 as URLError }
           .eraseToAnyPublisher()
    }

    public func updateAccount(_ account: Account) -> AnyPublisher<Void, URLError> {
        let url = baseURL.appendingPathComponent("/accounts/(account.id)")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(account)
        return URLSession.shared.dataTaskPublisher(for: request)
           .map(\.data)
           .map { _ in }
           .mapError { $0 as URLError }
           .eraseToAnyPublisher()
    }
}