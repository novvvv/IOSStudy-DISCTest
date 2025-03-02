//
//  Question.swift
//  DISCTest
//
//  Created by 최도일 on 2/28/25.
//

import Foundation
import UIKit

// Question 구조체 모델
struct Question: Codable {
    let d: String
    let i: String
    let s: String
    let c: String
}

// all 이라는 연산 프로퍼티를 통해서 데이터 에셋에 담긴 질문 정보를 질문 배열로 가져온다???
// 프로퍼티 관련 내용 다시 공부하고 코드 분석하기. 
// "타입 프로퍼티를 클로저로 초기화하는 패턴" ?

extension Question {
    
    static var all: [Question] = {
        
        // NSDataAsset -> Assets 폴더로부터 name이 "Questions"인 json 파일을 탐색
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Questions") else {
            return []
        }
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode([Question].self, from: dataAsset.data)
        } catch {
            return []
        }
             
    }()
}
