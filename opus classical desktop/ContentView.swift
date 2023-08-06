//
//  ContentView.swift
//  opus classical desktop
//
//  Created by Denis Rodionov on 6.8.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var periodsLabel = "Not loaded"
    
    func loadPeriod() async -> Void {
        do {
            let periods = try await fetchPeriods()
            let onlyNames = periods
                .map { $0.name }
                .joined(separator: ", ")
            periodsLabel = onlyNames
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            Button("Button") {
                Task {
                    await loadPeriod()
                }
            }
            Text(periodsLabel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
