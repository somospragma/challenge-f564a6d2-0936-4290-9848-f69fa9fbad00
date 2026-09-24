import Foundation

/// Entidad de dominio que representa una transferencia bancaria.
/// Encapsula todos los atributos necesarios para realizar una transferencia
/// y garantizar su unicidad mediante la clave de idempotencia.
public struct Transfer: Equatable, Sendable {
    public let id: UUID
    public let sourceAccountId: String
    public let destinationAccountId: String
    public let amount: Decimal
    public let currency: String
    public let concept: String
    public let scheduledDate: Date?
    public let idempotencyKey: IdempotencyKey
    public let createdAt: Date
    public let status: TransferStatus
    
    /// Estados posibles de una transferencia bancaria.
    public enum TransferStatus: String, Sendable, Equatable {
        case pending
        case processing
        case completed
        case failed
    }
    
    /// Inicializador principal de la entidad.
    /// - Parameters:
    ///   - id: Identificador único de la transferencia.
    ///   - sourceAccountId: ID de la cuenta origen.
    ///   - destinationAccountId: ID de la cuenta destino.
    ///   - amount: Monto a transferir.
    ///   - currency: Moneda de la transferencia.
    ///   - concept: Concepto de la transferencia.
    ///   - scheduledDate: Fecha programada (nil para transferencias inmediatas).
    ///   - idempotencyKey: Clave de idempotencia para garantizar unicidad.
    ///   - createdAt: Fecha de creación de la transferencia.
    ///   - status: Estado inicial de la transferencia.
    public init(
        id: UUID = UUID(),
        sourceAccountId: String,
        destinationAccountId: String,
        amount: Decimal,
        currency: String,
        concept: String,
        scheduledDate: Date? = nil,
        idempotencyKey: IdempotencyKey,
        createdAt: Date = Date(),
        status: TransferStatus = .pending
    ) {
        self.id = id
        self.sourceAccountId = sourceAccountId
        self.destinationAccountId = destinationAccountId
        self.amount = amount
        self.currency = currency
        self.concept = concept
        self.scheduledDate = scheduledDate
        self.idempotencyKey = idempotencyKey
        self.createdAt = createdAt
        self.status = status
    }
    
    /// Crea una nueva transferencia con estado actualizado.
    /// - Parameter status: Nuevo estado de la transferencia.
    /// - Returns: Nueva instancia con el estado actualizado.
    public func with(status: TransferStatus) -> Transfer {
        Transfer(
            id: id,
            sourceAccountId: sourceAccountId,
            destinationAccountId: destinationAccountId,
            amount: amount,
            currency: currency,
            concept: concept,
            scheduledDate: scheduledDate,
            idempotencyKey: idempotencyKey,
            createdAt: createdAt,
            status: status
        )
    }
}