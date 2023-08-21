//
//  GroupView.swift
//  MathApp
//
//  Created by Oleg Yakushin on 8/5/23.
//

import SwiftUI
struct GroupView: View {
    @ObservedObject var lessonsViewModel = LessonsViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                TopicView(level: "Group lesson", levelDecs: "Basic Matematics")
                VStack(spacing: 20) {
                    ForEach(lessonsViewModel.lesson.chunked(into: 2), id: \.self) { chunk in
                        HStack(spacing: 20) {
                            ForEach(chunk) { lesson in
                                GroupLevelView(lessonName: lesson.lesson, lessonDesc: lesson.lessonDesc, image: lesson.image, isActive: lesson.isActive)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            lessonsViewModel.loadLevelsFromJSON()
        }
    }
}

// Extension to chunk an array into smaller arrays
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
