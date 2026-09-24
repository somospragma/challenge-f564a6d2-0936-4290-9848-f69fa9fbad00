# Reestructuración de la pantalla de transferencias en una app iOS

La aplicación iOS de un banco requiere una reestructuración de la pantalla de transferencias para separar la interfaz de usuario del dominio y modelar el estado de la pantalla de forma testeable. Los usuarios de la aplicación (clientes del banco) interactúan con la pantalla de transferencias para realizar transferencias entre cuentas. El dominio incluye actores como el 'core bancario', el'sistema de liquidación' y el 'gateway de pagos'. Las transferencias deben ser idempotentes con clave de operación y canal, y deben manejarse los casos de error específicos del dominio como timeout del core bancario o respuesta 5xx del gateway de pagos.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Arquitectura de una app iOS |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 10 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Análisis del dominio y separación de la UI

**Objetivo:** Identificar y separar las responsabilidades de la UI y el dominio en la pantalla de transferencias.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Analiza la pantalla de transferencias actual e identifica las responsabilidades de la UI y del dominio.
- Propón una separación clara entre la UI y el dominio, modelando el estado de la pantalla de forma testeable.

**Entregable:** Documento que describe la separación propuesta entre la UI y el dominio, incluyendo el modelado del estado de la pantalla.

<details>
<summary>Pistas de conocimiento</summary>

- Considera el uso de patrones de arquitectura como MVVM o VIPER para la separación de responsabilidades.
- Piensa en cómo los estados de la UI pueden ser modelados y testeados independientemente del dominio.

</details>

### Fase 2: Implementación de la separación

**Objetivo:** Implementar la separación propuesta entre la UI y el dominio en la pantalla de transferencias.

**Tiempo estimado:** 4 horas

**Instrucciones:**

- Implementa la separación entre la UI y el dominio siguiendo las propuestas del documento de la fase anterior.
- Modela el estado de la pantalla de forma testeable y asegura que las transferencias sean idempotentes con clave de operación y canal.

**Entregable:** Código implementado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza pruebas unitarias para validar el modelado del estado de la pantalla.
- Asegura que las transferencias sean idempotentes y manejes los casos de error específicos del dominio.

</details>

### Fase 3: Refactorización y optimización

**Objetivo:** Refactorizar el código implementado para mejorar su legibilidad y rendimiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Refactoriza el código implementado en la fase anterior para mejorar su legibilidad y rendimiento.
- Optimiza el manejo de errores y la idempotencia de las transferencias.

**Entregable:** Código refactorizado y optimizado que separa la UI del dominio y modela el estado de la pantalla de forma testeable.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza técnicas de refactorización como extracción de métodos o clases para mejorar la legibilidad del código.
- Aplica patrones de diseño para optimizar el manejo de errores y la idempotencia de las transferencias.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué implica la separación entre la UI y el dominio en la pantalla de transferencias?
- **paraQueSirve**: ¿Por qué es importante modelar el estado de la pantalla de forma testeable?
- **comoSeUsa**: ¿Cómo se asegura la idempotencia de las transferencias en la pantalla de transferencias?
- **erroresComunes**: ¿Qué casos de error del dominio deben ser manejados en la pantalla de transferencias?
- **queDecisionesImplica**: ¿Qué decisiones arquitectónicas se deben tomar para separar la UI del dominio y modelar el estado de la pantalla de forma testeable?

## Criterios de Evaluacion

- Proponer una separación clara entre la UI y el dominio en la pantalla de transferencias.
- Modelar el estado de la pantalla de forma testeable.
- Asegurar que las transferencias sean idempotentes con clave de operación y canal.
- Manejar los casos de error específicos del dominio en la pantalla de transferencias.
- Refactorizar y optimizar el código implementado para mejorar su legibilidad y rendimiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
swift build
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
