//
//  ContentView.swift
//  WatchKitLab Watch App
//
//  Created by Samuel Owino on 14/02/2024.
//
import SwiftUI
struct ContentView: View {
    @State var activity: SelectedTab = .cycling
    var body: some View {
        TabView {
            VStack {
                HStack {
                    Text("Cycling")
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(.red)
                }
                .padding()
                Spacer()
            }
            .background(.pink.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.vertical)
            .tag(SelectedTab.cycling)
            
            VStack {
                HStack {
                    Text("Cycling")
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(.red)
                }
                .padding()
                Spacer()
            }
            .background(.cyan.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.vertical, 2)
            .tag(SelectedTab.outdorrwalk)
            
            VStack {
                HStack {
                    Text("Cycling")
                    Spacer()
                    Image(systemName: "circle.fill")
                        .foregroundColor(.red)
                }
                .padding()
                Spacer()
            }
            .background(.blue.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.vertical, 2)
            .tag(SelectedTab.yoga)
            Spacer()
        }
        .tabViewStyle(.verticalPage)
        .padding()
    }
}
enum SelectedTab {
    case cycling
    case outdorrwalk
    case yoga
}
#Preview {
    ContentView()
}
