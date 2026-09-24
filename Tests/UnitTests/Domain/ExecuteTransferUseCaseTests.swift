import XCTest
@testable import Domain

final class ExecuteTransferUseCaseTests: XCTestCase {

    private var executeTransferUseCase: ExecuteTransferUseCase!
    private var mockTransferRepository: MockTransferRepository!

    override func setUp() {
        super.setUp()
        mockTransferRepository = MockTransferRepository()
        executeTransferUseCase = ExecuteTransferUseCase(transferRepository: mockTransferRepository)
    }

    func testExecuteTransfer_Success() async throws {
        let transfer = Transfer(id: UUID(), amount: 100, fromAccount: "123", toAccount: "456", status:.pending)
        mockTransferRepository.mockTransfers = [transfer]
        let result = try await executeTransferUseCase.execute(transfer: transfer)
        XCTAssertEqual(result, transfer)
        XCTAssertEqual(mockTransferRepository.callsToExecuteTransfer, 1)
    }

    func testExecuteTransfer_Failure() async throws {
        let transfer = Transfer(id: UUID(), amount: 100, fromAccount: "123", toAccount: "456", status:.pending)
        mockTransferRepository.shouldFail = true
        do {
            _ = try await executeTransferUseCase.execute(transfer: transfer)
            XCTFail("Expected error but received success.")
        } catch {
            XCTAssertTrue(error is TransferError)
        }
        XCTAssertEqual(mockTransferRepository.callsToExecuteTransfer, 1)
    }
}

private class MockTransferRepository: TransferRepository {
    var mockTransfers: [Transfer] = []
    var shouldFail: Bool = false
    var callsToExecuteTransfer: Int = 0

    func executeTransfer(transfer: Transfer) async throws -> Transfer {
        callsToExecuteTransfer += 1
        if shouldFail {
            throw TransferError.settlementRejected(reason: "Mock failure")
        }
        return transfer
    }
}