//
//  LessonOneText.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 01/06/2022.
//

import SwiftUI

struct LessonOneText: View {
    var body: some View {
        ScrollView {
            VStack {
                
                Group {
                    Text("Text: Fonts")
                        .bold()
                }
                
                Group {
                    Text("Title Font")
                        .font(.title)
                    
                    Text("Title 2 Font")
                        .font(.title2)
                    
                    Text("Title 3 Font")
                        .font(.title3)
                }
                .padding()
                
                Group {
                    Text("Headline Font")
                        .font(.headline)
                    
                    Text("Sub Headline Font")
                        .font(.subheadline)
                }
                .padding()
                
                Group {
                    Text("Body Font")
                        .font(.body)
                }
                .padding()
                
                                
                Group {
                    Text("Callout Font")
                        .font(.callout)
                    
                    Text("Footnote Font")
                        .font(.footnote)
                    
                    Text("Caption Font")
                        .font(.caption)
                    
                    Text("Caption 2 Font")
                        .font(.caption2)
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct LessonOneText_Previews: PreviewProvider {
    static var previews: some View {
        LessonOneText()
    }
}
