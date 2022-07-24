import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    NavigationLink(destination: DefaultTelescopePicker()) {
                        Label("Telescopes Default Picker", systemImage: "bolt.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                    
                    NavigationLink(destination: InlineTelescopePicker()) {
                        Label("Telescopes Inline Picker", systemImage: "bolt.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                    
                    NavigationLink(destination: MenuTelescopePicker()) {
                        Label("Telescopes Menu Picker", systemImage: "bolt.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                    
                    Group {
                        
                        NavigationLink(destination: SegmentedTelescopePicker()) {
                            Label("Telescopes Segmented Picker", systemImage: "bolt.fill")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: MonthsSegmentedPicker()) {
                            Label("Months Picker", systemImage: "bolt.fill")
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: WheelTelescopePicker()) {
                        Label("Telescopes Wheel Picker", systemImage: "bolt.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                }
                
                Spacer()
                
            }
        }
        .navigationTitle("Telescopes")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
