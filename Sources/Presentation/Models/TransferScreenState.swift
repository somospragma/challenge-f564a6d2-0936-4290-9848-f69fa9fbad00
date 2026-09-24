import Foundation
import Combine

public struct TransferScreenState: Equatable {
    public enum ScreenState: Equatable {
        case idle
        case loading
        case success(Transfer)
        case error(TransferError)
    }

    @Published public var screenState: ScreenState =.idle

    public init() {}

    public mutating func setLoading() {
        screenState =.loading
    }

    public mutating func setSuccess(transfer: Transfer) {
        screenState =.success(transfer)
    }

    public mutating func setError(error: TransferError) {
        screenState =.error(error)
    }
}