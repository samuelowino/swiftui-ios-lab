//
//  ScrollToPosition.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 28/12/2021.
//

import SwiftUI

struct ScrollToPositionView: View {
    
    @State private var students: [StudentRecord] = [
        StudentRecord(name: "James Gosling", score: 100),
        StudentRecord(name: "Guido van Rossum", score: 50),
        StudentRecord(name: "Bjarne Stroustrup", score: 20),
        StudentRecord(name: "James Gosling", score: 10),
        StudentRecord(name: "Guido van Rossum", score: 5),
        StudentRecord(name: "Guido van Rossum", score: 1),
        StudentRecord(name: "Bjarne Stroustrup", score: 200),
        StudentRecord(name: "James Gosling", score: 10),
        StudentRecord(name: "Guido van Rossum", score: 11),
        StudentRecord(name: "Bjarne Stroustrup", score: 1000)
    ]
    
    @State private var topStudentUuid: UUID = UUID()
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to top Student"){
                    value.scrollTo(topStudentUuid, anchor: .center)
                }
                
                ForEach(students) { student in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.green)
                        
                        HStack{
                            Text(student.name)
                                .font(.headline)
                            Spacer()
                            Text("\(student.score)")
                                .bold()
                        }.foregroundColor(.white)
                    }.frame(height: 200)
                    
                }
            }
        }.onAppear {
            topStudentUuid = determineTopStudent()
        }
    }
    
    func determineTopStudent() -> UUID {
        let sortedList = students.sorted { (student1, student2) in
            student1.score > student2.score
        }
        print("Top student uuid \(sortedList[0].id) score \(sortedList[0].score)")
        return sortedList[0].id
    }
}

struct StudentRecord: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var score: Int = 0
}

struct ScrollToPosition_Previews: PreviewProvider {
    static var previews: some View {
        ScrollToPositionView()
    }
}
