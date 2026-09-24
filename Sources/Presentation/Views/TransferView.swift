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