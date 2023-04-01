//
//  TestView.swift
//  Learning App (Recap)
//
//  Created by Almat Alibekov on 01.04.2023.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                
                // Question
                CodeTextView()
                
                
                //Answers
                
                
                // Button
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else {
            
            // Test hasn't loadd yet
            ProgressView()
            
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
