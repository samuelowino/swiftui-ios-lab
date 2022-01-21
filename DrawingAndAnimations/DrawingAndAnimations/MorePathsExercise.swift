//
//  MorePathsExercise.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 21/01/2022.
//

import SwiftUI

struct MorePathsExercise: View {
    var body: some View {
        VStack {
            
            //*******************************
            //SHAPE
            //*******************************
            Text("Shape: Circle and RoundedRectangle from x:1, y: 1, w-> 100 h->100")
                .bold()
            HStack {
                //========================================================
                // RoundedRectangle shape in reference frame path(CGRect)
                //========================================================
                let roundedRectShape: Shape = RoundedRectangle(cornerRadius: 12)
                roundedRectShape.path(in: CGRect(origin: CGPoint(x: 1, y: 1),
                                      size: CGSize(width: 100, height: 100)))
                
                //========================================================
                // Circle shape in reference frame path(CGRect) with trim
                //========================================================
                let circleShape: Shape = Circle()
                circleShape.path(in: CGRect(x: 1, y: 1, width: 100, height: 100))
                
                
            }
            .foregroundColor(.pink)
            
            //*******************************
            //TRIM
            //*******************************
            Text("Trim from:0.0 to 0.7")
                .bold()
            HStack {
                //========================================================
                // RoundedRectangle shape in reference frame path(CGRect)
                //========================================================
                let roundedRectShape: Shape = RoundedRectangle(cornerRadius: 12)
                roundedRectShape.path(in: CGRect(origin: CGPoint(x: 1, y: 1),
                                      size: CGSize(width: 100, height: 100)))
                    .trim(from: 0.0, to: 0.7)
                
                //========================================================
                // Circle shape in reference frame path(CGRect) with trim
                //========================================================
                let circleShape: Shape = Circle()
                circleShape.path(in: CGRect(x: 1, y: 1, width: 100, height: 100))
                    .trim(from: 0.0, to: 0.7)
                
            }
            .foregroundColor(.purple)
            

            //*******************************
            //TRANSFORMATION
            //*******************************
            Text("12 Degree Affine tranformation")
                .bold()
            HStack {
                //========================================================
                // RoundedRectangle shape in reference frame path(CGRect)
                //========================================================
                let roundedRectShape: Shape = RoundedRectangle(cornerRadius: 12)
                roundedRectShape.path(in: CGRect(origin: CGPoint(x: 1, y: 1),
                                      size: CGSize(width: 100, height: 100)))
                    .trim(from: 0.0, to: 0.6)
                    .transform(CGAffineTransform(rotationAngle: 12))
                
                //========================================================
                // Circle shape in reference frame path(CGRect) with trim
                //========================================================
                let circleShape: Shape = Circle()
                circleShape.path(in: CGRect(x: 1, y: 1, width: 100, height: 100))
                    .trim(from: 0.0, to: 0.7)
                    .transform(CGAffineTransform(rotationAngle: 12))
                
            }
            .foregroundColor(.green)
        }
        .padding()
        
    }
}

struct MorePathsExercise_Previews: PreviewProvider {
    static var previews: some View {
        MorePathsExercise()
    }
}
