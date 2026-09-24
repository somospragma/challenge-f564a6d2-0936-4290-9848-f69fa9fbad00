import Foundation

/// Errores específicos del dominio de transferencias bancarias.
/// Representa los fallos que pueden ocurrir durante el procesamiento
/// de una transferencia y que son responsabilidad del dominio.
public enum TransferError: Error, Equatable, Sendable {
    /// Tiempo de espera agotado al comunicarse con el core bancario.
    case coreTimeout
    
    /// El gateway de pagos devolvió un error 5xx.
    case gatewayError
    
    /// La cuenta origen no tiene fondos suficientes.
    case insufficientFunds
    
    /// La cuenta destino no existe o está bloqueada.
    case invalidDestinationAccount
    
    /// La transferencia fue rechazada por el sistema de liquidación.
    case settlementRejected(reason: String)
    
    /// La clave de idempotencia ya existe para otra transferencia.
    case duplicateIdempotencyKey
    
    /// Error desconocido del dominio.
    case unknown
    
    /// Descripción legible del error para logging y UI.
    public var localizedDescription: String {
        switch self {
        case .coreTimeout:
            return "Timeout al comunicarse con el core bancario"
        case .gatewayError:
            return "Error en el gateway de pagos"
        case .insufficientFunds:
            return "Fondos insuficientes en la cuenta origen"
        case .invalidDestinationAccount:
            return "Cuenta destino inválida o bloqueada"
        case .settlementRejected(let reason):
            return "Transferencia rechazada por liquidación: \(reason)"
        case .duplicateIdempotencyKey:
            return "Ya existe una transferencia con esta clave de idempotencia"
        case .unknown:
            return "Error desconocido en la transferencia"
        }
    }
}