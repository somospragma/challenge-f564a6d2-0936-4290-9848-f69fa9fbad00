import Foundation
import Combine
import Domain

class TransferViewModel: ObservableObject {
    @Published var transferScreenState: TransferScreenState =.initial
    @Published var error: TransferError?
    private var cancellables = Set<AnyCancellable>()
    private let executeTransferUseCase: ExecuteTransferUseCase

    init(executeTransferUseCase: ExecuteTransferUseCase) {
        self.executeTransferUseCase = executeTransferUseCase
    }

    func transfer(fromAccount: String, toAccount: String, amount: Double, idempotencyKey: IdempotencyKey) {
        transferScreenState =.loading
        executeTransferUseCase.execute(fromAccount: fromAccount, toAccount: toAccount, amount: amount, idempotencyKey: idempotencyKey)
           .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case.finished:
                    self?.transferScreenState =.success
                case.failure(let error):
                    self?.error = error as? TransferError
                    self?.transferScreenState =.error
                }
            }, receiveValue: { _ in })
           .store(in: &cancellables)
    }
}