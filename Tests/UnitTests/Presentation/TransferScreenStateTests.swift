import XCTest
@testable import Presentation

final class TransferScreenStateTests: XCTestCase {

    func testTransferScreenState_Initial() {
        let initialState = TransferScreenState.initial
        XCTAssertEqual(initialState,.initial)
    }

    func testTransferScreenState_Loading() {
        let loadingState = TransferScreenState.loading
        XCTAssertEqual(loadingState,.loading)
    }

    func testTransferScreenState_Success() {
        let transfer = Transfer(id: UUID(), amount: 100, fromAccount: "123", toAccount: "456", status:.completed)
        let successState = TransferScreenState.success(transfer)
        XCTAssertEqual(successState,.success(transfer))
    }

    func testTransferScreenState_Failure() {
        let error = TransferError.settlementRejected(reason: "Test failure")
        let failureState = TransferScreenState.failure(error)
        XCTAssertEqual(failureState,.failure(error))
    }
}