import Foundation

/// Clave de idempotencia para garantizar que una transferencia
/// se procese una única vez, incluso en casos de reintentos.
/// Compuesta por un operationId único y el canal desde el que
/// se originó la transferencia.
public struct IdempotencyKey: Hashable, Sendable, CustomStringConvertible {
    public let operationId: String
    public let channel: Channel
    
    /// Canales válidos desde los que puede originarse una transferencia.
    public enum Channel: String, Sendable, CaseIterable {
        case mobileApp
        case web
        case atm
        case branch
        case callCenter
    }
    
    /// Inicializador principal.
    /// - Parameters:
    ///   - operationId: Identificador único de la operación.
    ///   - channel: Canal desde el que se originó la transferencia.
    public init(operationId: String, channel: Channel) {
        self.operationId = operationId
        self.channel = channel
    }
    
    /// Representación en formato string de la clave.
    /// Formato: "operationId_channel"
    public var description: String {
        return "\(operationId)_\(channel.rawValue)"
    }
    
    /// Crea una clave a partir de su representación string.
    /// - Parameter description: String en formato "operationId_channel".
    /// - Throws: `IdempotencyKeyError.invalidFormat` si el formato es incorrecto.
    public init?(description: String) {
        let components = description.components(separatedBy: "_")
        guard components.count == 2,
              let channel = Channel(rawValue: components[1]) else {
            return nil
        }
        self.operationId = components[0]
        self.channel = channel
    }
}

/// Errores relacionados con la clave de idempotencia.
public enum IdempotencyKeyError: Error, Equatable {
    case invalidFormat
}