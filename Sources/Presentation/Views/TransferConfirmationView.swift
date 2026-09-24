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