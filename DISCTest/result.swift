// MARK: Return Json Type
// -- 딕셔너리 내부에 딕셔너리로 결과값이 정의되어있음 --
// -- result.json modeling --

// MARK: 다음 코드로부터 공부해야할 내용
// * 타입 프로퍼티를 콜백 클로저로 초기화하는 패턴 (소들이)
// * SingleTon design Pattern : 나중에 강의 보면서 분석 (인프런)
// * Failble Initilizer & self 키워드로 구조채 재할당하는 패턴 (소들이)
// * jsonDecoder & Codable (소들이,인프런)
// * Codable & Protocol 

import Foundation
import UIKit

struct Result: Codable {
    
    // SingleTon design Pattern : 나중에 다시 분석
    static let shared: Result? = Result()
    
    // Instance Properties
    let d: Info
    let i: Info
    let s: Info
    let c: Info
    
    // MARK: Failable Initializer 내용 다시 공부
    // Custom Failable Initializer
    private init?() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Result") else {
            return nil
        }
        
        // MARK: josnDecoder 동작방식
        // from: dataAsset.data로 부터 내부 json 파일을 불러온다.
        // Result type으로 변환을 시도한다.
        do {
            let result: Result = try JSONDecoder().decode(Result.self, from: dataAsset.data)
            self = result
        } catch {
            return nil
        }
    }
    
}

extension Result {
    struct Info: Codable {
        let title: String
        let typeDescription: String
    }
}
