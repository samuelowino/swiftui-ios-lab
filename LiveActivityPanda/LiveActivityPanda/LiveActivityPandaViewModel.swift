//
//  LiveActivityPandaViewModel.swift
//  LiveActivityPanda
//
//  Created by Samuel Owino on 08/02/2024.
//
import Foundation
import ActivityKit
class LiveActivityPandaViewModel:ObservableObject{
    @Published var healthLevel: Double = 100
    @Published var eventDescription: String = "Wake Up"
    @Published var activityState: AdventureAttributes.ContentState?
    @Published var liveActivity: Activity<AdventureAttributes>?
    func requestLiveActivity(){
        let adventureAttributes = AdventureAttributes(hero: "🐼")
        activityState = AdventureAttributes.ContentState(
            currentHealthLevel: healthLevel,
            eventDescription: eventDescription
        )
        guard let activityState else { return }
        let content = ActivityContent(state: activityState, staleDate: nil, relevanceScore: 0.0)
        do {
            liveActivity = try Activity.request(
                attributes: adventureAttributes,
                content: content,
                pushType: nil
            )
        } catch { dump(error) }
    }
    func updateLiveActivity(){
        activityState = AdventureAttributes.ContentState(
            currentHealthLevel: healthLevel,
            eventDescription: eventDescription
        )
        let alertConfig = AlertConfiguration(
            title: "\(eventDescription)",
            body: "Open the app and use portion to heal the hero",
            sound: .default
        )
        if liveActivity != nil {
            Task {
                await liveActivity!.update(
                    ActivityContent<AdventureAttributes.ContentState>(
                        state: activityState!, staleDate: nil
                    )
                    ,alertConfiguration: alertConfig
                )
            }
        }
    }
    func endActivity(){
        activityState = AdventureAttributes.ContentState(
            currentHealthLevel: healthLevel,
            eventDescription: "Ending Hero's Journey"
        )
        if liveActivity != nil {
            Task {
                await liveActivity!.end(
                    ActivityContent(state: activityState!, staleDate: nil),
                    dismissalPolicy: ActivityUIDismissalPolicy.default
                )
            }
        }
    }
    func observeActivityState() async {
        for await activityState in liveActivity!.activityStateUpdates {
            switch activityState {
            case .dismissed:
                print("Activity dismissed")
            case .active:
                print("Activity is active now")
            case .ended:
                print("Activity has been ended")
            case .stale:
                print("Stale activity")
            @unknown default:
                print("Unknown activity state")
            }
        }
    }
}
struct AdventureAttributes: ActivityAttributes {
    let hero: String
    struct ContentState: Codable & Hashable {
        let currentHealthLevel: Double
        let eventDescription: String
    }
}
