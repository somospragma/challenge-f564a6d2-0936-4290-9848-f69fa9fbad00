import XCTest
@testable import Data

final class TransferRepositoryTests: XCTestCase {

    private var sut: TransferRepositoryImpl!
    private var mockTransferAPIClient: MockTransferAPIClient!

    override func setUp() {
        super.setUp()
        mockTransferAPIClient = MockTransferAPIClient()
        sut = TransferRepositoryImpl(transferAPIClient: mockTransferAPIClient)
    }

    override func tearDown() {
        sut = nil
        mockTransferAPIClient = nil
        super.tearDown()
    }

    func test_executeTransfer_success() {
        // Given
        let transfer = Transfer(id: "123", amount: 100, fromAccount: "account1", toAccount: "account2", status:.pending)
        mockTransferAPIClient.executeTransferResult =.success(transfer)
        let idempotencyKey = IdempotencyKey(operationId: "op123", channel:.mobile)

        // When
        let expectation = XCTestExpectation(description: "Transfer executed")
        sut.executeTransfer(transfer: transfer, idempotencyKey: idempotencyKey) { result in
            switch result {
            case.success(let executedTransfer):
                XCTAssertEqual(executedTransfer, transfer)
                expectation.fulfill()
            case.failure(let error):
                XCTFail("Unexpected error: (error)")
            }
        }

        // Then
        wait(for: [expectation], timeout: 1.0)
    }

    func test_executeTransfer_failure() {
        // Given
        let transfer = Transfer(id: "123", amount: 100, fromAccount: "account1", toAccount: "account2", status:.pending)
        let error = TransferError.settlementRejected(reason: "Insufficient funds")
        mockTransferAPIClient.executeTransferResult =.failure(error)
        let idempotencyKey = IdempotencyKey(operationId: "op123", channel:.mobile)

        // When
        let expectation = XCTestExpectation(description: "Transfer failed")
        sut.executeTransfer(transfer: transfer, idempotencyKey: idempotencyKey) { result in
            switch result {
            case.success(let transfer):
                XCTFail("Unexpected success: (transfer)")
            case.failure(let transferError):
                XCTAssertEqual(transferError as? TransferError, error)
                expectation.fulfill()
            }
        }

        // Then
        wait(for: [expectation], timeout: 1.0)
    }

    func test_executeTransfer_idempotencyKeyCollision() {
        // Given
        let transfer = Transfer(id: "123", amount: 100, fromAccount: "account1", toAccount: "account2", status:.pending)
        let idempotencyKey = IdempotencyKey(operationId: "op123", channel:.mobile)
        mockTransferAPIClient.executeTransferResult =.success(transfer)
        mockTransferAPIClient.idempotencyKeyCollision = true

        // When
        let expectation = XCTestExpectation(description: "Idempotency key collision")
        sut.executeTransfer(transfer: transfer, idempotencyKey: idempotencyKey) { result in
            switch result {
            case.success(let executedTransfer):
                XCTAssertEqual(executedTransfer, transfer)
                expectation.fulfill()
            case.failure(let error):
                XCTFail("Unexpected error: (error)")
            }
        }

        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

final class MockTransferAPIClient: TransferAPIClient {
    var executeTransferResult: Result<Transfer, Error>!
    var idempotencyKeyCollision: Bool = false

    func executeTransfer(transfer: Transfer, idempotencyKey: IdempotencyKey) async throws -> Transfer {
        if idempotencyKeyCollision {
            throw IdempotencyKeyError.collision
        }
        return try executeTransferResult.get()
    }
}