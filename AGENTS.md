# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Reestructuración de la pantalla de transferencias en una app iOS**.

| | |
|---|---|
| Tema | Arquitectura de una app iOS |
| Nivel | senior-l2 |
| Chapter | Móvil |
| Especialidad | iOS |
| Stack | Swift 6 / SwiftUI |
| Patron arquitectonico | MVVM con Clean Architecture |
| Tiempo estimado | 10 horas |

## Receta del stack

Esqueleto obligatorio:

- `Package.swift o el .xcodeproj`
- `App con @main y la escena raiz`
- `Views con SwiftUI`
- `ViewModels observables`
- `Services con los clientes de red`
- `Models del dominio`

Dependencias:

- swift-algorithms n/a
- swift-collections n/a

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `swift build` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `swift build` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Análisis del dominio y separación de la UI**: Documento que describe la separación propuesta entre la UI y el dominio, incluyendo el modelado del estado de la pantalla.
- **Fase 2 — Implementación de la separación**: Código implementado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.
- **Fase 3 — Refactorización y optimización**: Código refactorizado y optimizado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Lo que falta y tenes que completar

### 1. Referencias colgando (5)

Salieron de un analisis estatico del codigo que SI esta en el repo. Cada una rompe la compilacion:

- [ ] `Sources/Data/Repositories/TransferRepositoryImpl.swift` — `TransferAPIClient.executeTransfer`
      Se invoca `executeTransfer` sobre `TransferAPIClient`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `Sources/Presentation/Views/TransferConfirmationView.swift` — `TransferViewModel.resetTransfer`
      Se invoca `resetTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `Sources/Presentation/Views/TransferErrorView.swift` — `TransferViewModel.retryTransfer`
      Se invoca `retryTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `Sources/Presentation/Views/TransferErrorView.swift` — `TransferViewModel.resetTransfer`
      Se invoca `resetTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `Tests/UnitTests/Presentation/TransferViewModelTests.swift` — `TransferViewModel.submitTransfer`
      Se invoca `submitTransfer` sobre `TransferViewModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

### Presentes (25)

- `Package.swift`
- `Sources/Domain/Entities/Transfer.swift`
- `Sources/Domain/Entities/TransferError.swift`
- `Sources/Domain/Entities/IdempotencyKey.swift`
- `Sources/Domain/Entities/Account.swift`
- `Sources/Domain/UseCases/ExecuteTransferUseCase.swift`
- `Sources/Domain/UseCases/GetAccountsUseCase.swift`
- `Sources/Domain/Repositories/TransferRepository.swift`
- `Sources/Domain/Repositories/AccountRepository.swift`
- `Sources/Presentation/Models/TransferScreenState.swift`
- `Sources/Presentation/Models/TransferFormModel.swift`
- `Sources/App/TransferApp.swift`
- `Sources/Data/Repositories/TransferRepositoryImpl.swift`
- `Sources/Data/Repositories/AccountRepositoryImpl.swift`
- `Sources/Data/Network/TransferAPIClient.swift`
- `Sources/Data/Network/NetworkError.swift`
- `Sources/Presentation/ViewModels/TransferViewModel.swift`
- `Sources/Presentation/Views/TransferView.swift`
- `Sources/Presentation/Views/TransferFormView.swift`
- `Sources/Presentation/Views/TransferConfirmationView.swift`
- `Sources/Presentation/Views/TransferErrorView.swift`
- `Tests/UnitTests/Domain/ExecuteTransferUseCaseTests.swift`
- `Tests/UnitTests/Presentation/TransferViewModelTests.swift`
- `Tests/UnitTests/Presentation/TransferScreenStateTests.swift`
- `Tests/UnitTests/Data/TransferRepositoryTests.swift`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `Sources/App`
- `Sources/Domain/Entities`
- `Sources/Domain/UseCases`
- `Sources/Domain/Repositories`
- `Sources/Data/Repositories`
- `Sources/Data/Network`
- `Sources/Presentation/ViewModels`
- `Sources/Presentation/Views`
- `Sources/Presentation/Models`
- `Tests/UnitTests/Domain`
- `Tests/UnitTests/Presentation`
- `Tests/UnitTests/Data`

## Verificacion

```bash
swift build
```

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **MVVM con Clean Architecture**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Movil, Especialidad Desarrollador, Tecnología iOS, Senior
- Brecha que el reto ataca: Separa la UI del dominio y modela el estado de la pantalla de forma testeable
- Mision: Reestructurar la pantalla de transferencias

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
