//
//  ContentView.swift
//  ModernNavigationLab Watch App
//
//  Created by Samuel Owino on 29/02/2024.
//
import SwiftUI
struct ContentView: View {
    @AppStorage("ONBOARDING_COMPLETED") var onboardingComplete: Bool = false
    var body: some View {
        NavigationStack {
            if onboardingComplete {
                MainDashboardView()
            } else {
                OnboardingView()
            }
        }
    }
}
struct SplashScreenView:View {
    var body: some View {
        Text("Splash.. Loading ...")
    }
}
struct OnboardingView:View {
    var body: some View {
        Text("Welcome to this WatchOS App")
            .multilineTextAlignment(.center)
        NavigationLink(destination: TermsAndConditions()){
            Text("Get Started")
                .padding()
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}
struct TermsAndConditions:View {
    var body: some View {
        Text("Terms and Conditions")
        NavigationLink(destination: MainDashboardView()){
            Text("Accept")
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        NavigationLink(destination: OnboardingView()){
            Text("Not now🥲")
                .padding()
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}
struct MainDashboardView:View {
    var body: some View {
        Text("App Dashboard😁")
    }
}
#Preview {
    ContentView()
}
