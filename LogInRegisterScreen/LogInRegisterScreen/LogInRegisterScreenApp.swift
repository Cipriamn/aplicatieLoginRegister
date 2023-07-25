

import SwiftUI

@main
struct LogInRegisterScreenApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
           LoginView()
                .environmentObject(viewModel)
        }
    }
}
