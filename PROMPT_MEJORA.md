# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `Sources/Data/Repositories/TransferRepositoryImpl.swift` — `TransferAPIClient.executeTransfer`: Se invoca `executeTransfer` sobre `TransferAPIClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `Sources/Presentation/Views/TransferConfirmationView.swift` — `TransferViewModel.resetTransfer`: Se invoca `resetTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `Sources/Presentation/Views/TransferErrorView.swift` — `TransferViewModel.retryTransfer`: Se invoca `retryTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `Sources/Presentation/Views/TransferErrorView.swift` — `TransferViewModel.resetTransfer`: Se invoca `resetTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `Tests/UnitTests/Presentation/TransferViewModelTests.swift` — `TransferViewModel.submitTransfer`: Se invoca `submitTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
swift build
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología iOS, Senior

### Brecha de conocimiento
Separa la UI del dominio y modela el estado de la pantalla de forma testeable

### Misión / candidato
Reestructurar la pantalla de transferencias

### Datos adicionales
Candidato Senior en iOS

### Reto
- Tema: Arquitectura de una app iOS
- Seniority: senior-l2
- Tipo: practical
- Título: Reestructuración de la pantalla de transferencias en una app iOS
- Tiempo estimado: 10 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Análisis del dominio y separación de la UI — objetivo: Identificar y separar las responsabilidades de la UI y el dominio en la pantalla de transferencias. — entregable (NO resolver): Documento que describe la separación propuesta entre la UI y el dominio, incluyendo el modelado del estado de la pantalla.
- Fase 2: Implementación de la separación — objetivo: Implementar la separación propuesta entre la UI y el dominio en la pantalla de transferencias. — entregable (NO resolver): Código implementado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.
- Fase 3: Refactorización y optimización — objetivo: Refactorizar el código implementado para mejorar su legibilidad y rendimiento. — entregable (NO resolver): Código refactorizado y optimizado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: Package.swift ===
// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "TransferApp",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TransferApp",
            targets: ["App"]),
        .library(
            name: "Domain",
            targets: ["Domain"]),
        .library(
            name: "Data",
            targets: ["Data"]),
        .library(
            name: "Presentation",
            targets: ["Presentation"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),
        .package(url: "https://github.com/CombineCommunity/CombineExt.git", from: "1.8.1")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Domain",
                "Data",
                "Presentation",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources/App",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources/Domain",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                .product(name: "CombineExt", package: "CombineExt")
            ],
            path: "Sources/Data",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                "CombineExt"
            ],
            path: "Sources/Presentation",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            path: "Tests/UnitTests/Domain"
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"],
            path: "Tests/UnitTests/Presentation"
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"],
            path: "Tests/UnitTests/Data"
        )
    ],
    swiftLanguageVersions: [.v6]
)

// === ARCHIVO: Sources/Domain/Entities/Transfer.swift ===
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

// === ARCHIVO: Sources/Domain/Entities/TransferError.swift ===
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

// === ARCHIVO: Sources/Domain/Entities/IdempotencyKey.swift ===
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

// === ARCHIVO: Sources/Domain/Entities/Account.swift ===
import Foundation

public struct Account: Equatable, Sendable {
    public let id: String
    public let balance: Double
    public let currency: String

    public init(id: String, balance: Double, currency: String) {
        self.id = id
        self.balance = balance
        self.currency = currency
    }
}

// === ARCHIVO: Sources/Domain/UseCases/ExecuteTransferUseCase.swift ===
import Foundation
import Combine

public protocol TransferRepository {
    func executeTransfer(transfer: Transfer, idempotencyKey: IdempotencyKey) -> AnyPublisher<Transfer, TransferError>
}

public class ExecuteTransferUseCase {
    private let transferRepository: TransferRepository

    public init(transferRepository: TransferRepository) {
        self.transferRepository = transferRepository
    }

    public func execute(transfer: Transfer, idempotencyKey: IdempotencyKey) -> AnyPublisher<Transfer, TransferError> {
        return transferRepository.executeTransfer(transfer: transfer, idempotencyKey: idempotencyKey)
           .mapError { error in
                switch error {
                case.settlementRejected(let reason):
                    return TransferError.settlementRejected(reason: reason)
                default:
                    return error
                }
            }
           .eraseToAnyPublisher()
    }
}

// === ARCHIVO: Sources/Domain/UseCases/GetAccountsUseCase.swift ===
import Foundation
import Combine

public protocol AccountRepository {
    func getAccounts() -> AnyPublisher<[Account], Error>
}

public class GetAccountsUseCase {
    private let accountRepository: AccountRepository

    public init(accountRepository: AccountRepository) {
        self.accountRepository = accountRepository
    }

    public func execute() -> AnyPublisher<[Account], Error> {
        return accountRepository.getAccounts()
           .mapError { error in
                // Manejo de error del ecosistema
                return error
            }
           .eraseToAnyPublisher()
    }
}

// === ARCHIVO: Sources/Domain/Repositories/TransferRepository.swift ===
import Foundation

public protocol TransferRepository: AnyObject {
    func executeTransfer(transfer: Transfer, idempotencyKey: IdempotencyKey) async throws -> Transfer
    func getTransferStatus(idempotencyKey: IdempotencyKey) async throws -> TransferStatus
}

// === ARCHIVO: Sources/Domain/Repositories/AccountRepository.swift ===
import Foundation

public protocol AccountRepository: AnyObject {
    func getAccounts() async throws -> [Account]
}

// === ARCHIVO: Sources/Presentation/Models/TransferScreenState.swift ===
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

// === ARCHIVO: Sources/Presentation/Models/TransferFormModel.swift ===
import Foundation

struct TransferFormModel: Identifiable {
    let id = UUID()
    var amount: Double
    var fromAccount: String
    var toAccount: String
    var idempotencyKey: IdempotencyKey

    init(amount: Double, fromAccount: String, toAccount: String, idempotencyKey: IdempotencyKey) {
        self.amount = amount
        self.fromAccount = fromAccount
        self.toAccount = toAccount
        self.idempotencyKey = idempotencyKey
    }

    func validate() throws {
        guard amount > 0 else {
            throw TransferFormValidationError.invalidAmount
        }
        guard!fromAccount.isEmpty,!toAccount.isEmpty else {
            throw TransferFormValidationError.invalidAccount
        }
    }
}

enum TransferFormValidationError: Error {
    case invalidAmount
    case invalidAccount
}

// === ARCHIVO: Sources/App/TransferApp.swift ===
import SwiftUI
import Presentation

@main
struct TransferApp: App {
    var body: some Scene {
        WindowGroup {
            TransferView()
        }
    }
}

// === ARCHIVO: Sources/Data/Repositories/TransferRepositoryImpl.swift ===
import Foundation
import Combine
import Domain
import Data

class TransferRepositoryImpl: TransferRepository {
    private let apiClient: TransferAPIClient

    init(apiClient: TransferAPIClient) {
        self.apiClient = apiClient
    }

    func executeTransfer(_ transfer: Transfer) -> AnyPublisher<Transfer, TransferError> {
        return apiClient.executeTransfer(transfer)
           .mapError { error in
                switch error {
                case let networkError as NetworkError:
                    return.settlementRejected(reason: networkError.localizedDescription)
                default:
                    return.settlementRejected(reason: "Unknown error")
                }
            }
           .eraseToAnyPublisher()
    }
}

// === ARCHIVO: Sources/Data/Repositories/AccountRepositoryImpl.swift ===
import Foundation
import Combine
import Domain

public class AccountRepositoryImpl: AccountRepository {
    private let transferAPIClient: TransferAPIClient

    public init(transferAPIClient: TransferAPIClient) {
        self.transferAPIClient = transferAPIClient
    }

    public func getAccounts() -> AnyPublisher<[Account], NetworkError> {
        return transferAPIClient.getAccounts()
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }

    public func getAccount(by id: String) -> AnyPublisher<Account, NetworkError> {
        return transferAPIClient.getAccount(by: id)
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }

    public func updateAccount(_ account: Account) -> AnyPublisher<Void, NetworkError> {
        return transferAPIClient.updateAccount(account)
           .mapError { NetworkError.apiError($0) }
           .eraseToAnyPublisher()
    }
}

// === ARCHIVO: Sources/Data/Network/TransferAPIClient.swift ===
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

// === ARCHIVO: Sources/Data/Network/NetworkError.swift ===
import Foundation

public enum NetworkError: Error {
    case apiError(Error)
    case decodingError
    case unknown

    public init(_ error: Error) {
        if let urlError = error as? URLError {
            self =.apiError(urlError)
        } else if let decodingError = error as? DecodingError {
            self =.decodingError
        } else {
            self =.unknown
        }
    }
}

// === ARCHIVO: Sources/Presentation/ViewModels/TransferViewModel.swift ===
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

// === ARCHIVO: Sources/Presentation/Views/TransferView.swift ===
import SwiftUI
import Presentation

struct TransferView: View {
    @StateObject private var viewModel = TransferViewModel(executeTransferUseCase: ExecuteTransferUseCaseImpl())

    var body: some View {
        NavigationView {
            VStack {
                TransferFormView(viewModel: viewModel)
                   .padding()
                Spacer()
            }
           .navigationTitle("Transferir")
           .alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton:.default(Text("OK")))
            }
           .alert(isPresented: $viewModel.transferScreenState.isSuccess) {
                Alert(title: Text("Éxito"), message: Text("Transferencia realizada con éxito"), dismissButton:.default(Text("OK")))
            }
        }
    }
}

// === ARCHIVO: Sources/Presentation/Views/TransferFormView.swift ===
import SwiftUI

struct TransferFormView: View {
    @ObservedObject var viewModel: TransferViewModel
    @State private var fromAccount = ""n    @State private var toAccount = ""n    @State private var amount = ""n    @State private var operationId = UUID().uuidString
    @State private var channel = IdempotencyKey.Channel.allCases.first!

    var body: some View {
        Form {
            Section(header: Text("Cuenta de origen")) {
                TextField("Cuenta de origen", text: $fromAccount)
            }
            Section(header: Text("Cuenta de destino")) {
                TextField("Cuenta de destino", text: $toAccount)
            }
            Section(header: Text("Monto")) {
                TextField("Monto", text: $amount)
                   .keyboardType(.decimalPad)
            }
            Section(header: Text("Idempotency Key")) {
                HStack {
                    TextField("Operation ID", text: $operationId)
                       .disabled(true)
                    Picker("Channel", selection: $channel) {
                        ForEach(IdempotencyKey.Channel.allCases, id: \.self) { channel in
                            Text(channel.rawValue.capitalized)
                        }
                    }
                   .pickerStyle(SegmentedPickerStyle())
                }
            }
            Section {
                Button(action: {
                    guard let amount = Double(self.amount) else { return }
                    let idempotencyKey = IdempotencyKey(operationId: operationId, channel: channel)
                    viewModel.transfer(fromAccount: fromAccount, toAccount: toAccount, amount: amount, idempotencyKey: idempotencyKey)
                }) {
                    Text("Transferir")
                }
               .disabled(viewModel.transferScreenState ==.loading)
            }
        }
    }
}

// === ARCHIVO: Sources/Presentation/Views/TransferConfirmationView.swift ===
import SwiftUI
import Combine
import Domain

struct TransferConfirmationView: View {
    @ObservedObject var viewModel: TransferViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transferencia Confirmada")
               .font(.largeTitle)
               .fontWeight(.bold)
            Spacer()
            Button("Volver a Inicio") {
                viewModel.resetTransfer()
                dismiss()
            }
           .buttonStyle(PrimaryButtonStyle())
        }
       .padding()
       .navigationBarHidden(true)
    }
}

// === ARCHIVO: Sources/Presentation/Views/TransferErrorView.swift ===
import SwiftUI
import Combine
import Domain

struct TransferErrorView: View {
    @ObservedObject var viewModel: TransferViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Error en la Transferencia")
               .font(.largeTitle)
               .fontWeight(.bold)
            Text("Por favor, intenta de nuevo.")
               .font(.headline)
            Spacer()
            Button("Volver a Intentar") {
                viewModel.retryTransfer()
            }
           .buttonStyle(PrimaryButtonStyle())
            Button("Volver a Inicio") {
                viewModel.resetTransfer()
                dismiss()
            }
           .buttonStyle(PrimaryButtonStyle())
        }
       .padding()
       .navigationBarHidden(true)
    }
}

// === ARCHIVO: Tests/UnitTests/Domain/ExecuteTransferUseCaseTests.swift ===
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

// === ARCHIVO: Tests/UnitTests/Presentation/TransferViewModelTests.swift ===
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

// === ARCHIVO: Tests/UnitTests/Presentation/TransferScreenStateTests.swift ===
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

// === ARCHIVO: Tests/UnitTests/Data/TransferRepositoryTests.swift ===
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
```
