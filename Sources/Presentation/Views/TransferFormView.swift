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