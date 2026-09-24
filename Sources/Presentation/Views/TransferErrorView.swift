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