import XCTest
@testable import Presentation

final class TransferViewModelTests: XCTestCase {

    private var viewModel: TransferViewModel!
    private var mockExecuteTransferUseCase: MockExecuteTransferUseCase!

    override func setUp() {
        super.setUp()
        mockExecuteTransferUseCase = MockExecuteTransferUseCase()
        viewModel = TransferViewModel(executeTransferUseCase: mockExecuteTransferUseCase)
    }

    func testSubmitTransfer_Success() async throws {
        let transfer = Transfer(id: UUID(), amount: 100, fromAccount: "123", toAccount: "456", status:.pending)
        mockExecuteTransferUseCase.mockTransfer = transfer
        await viewModel.submitTransfer(transfer: transfer)
        XCTAssertEqual(viewModel.screenState,.success(transfer))
        XCTAssertEqual(mockExecuteTransferUseCase.callsToExecuteTransfer, 1)
    }

    func testSubmitTransfer_Failure() async throws {
        let transfer = Transfer(id: UUID(), amount: 100, fromAccount: "123", toAccount: "456", status:.pending)
        mockExecuteTransferUseCase.shouldFail = true
        await viewModel.submitTransfer(transfer: transfer)
        XCTAssertTrue(viewModel.screenState is TransferScreenState.failure)
        XCTAssertEqual(mockExecuteTransferUseCase.callsToExecuteTransfer, 1)
    }
}

private class MockExecuteTransferUseCase: ExecuteTransferUseCase {
    var mockTransfer: Transfer?
    var shouldFail: Bool = false
    var callsToExecuteTransfer: Int = 0

    func execute(transfer: Transfer) async throws -> Transfer {
        callsToExecuteTransfer += 1
        if shouldFail {
            throw TransferError.settlementRejected(reason: "Mock failure")
        }
        return mockTransfer!
    }
}