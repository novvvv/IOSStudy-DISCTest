import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: Interface Builder에서 설정한 버튼 tag 열거형
    // * 버튼 항목 4개 Button1 ~ Button4
    enum ButtonTag: Int {
        case d = 101
        case i, s, c
    }

    // MARK: - Properties
    // * questionIndex : 현재 몇 번째 질문인지 확인할 프로퍼티
    // [] * 버튼 관련 IOS 기능도 함꼐 정리하면 좋을듯. 2025.03.03
    var questionIndex: Int!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.questionIndex = self.questionIndex ?? 0
        
        if self.questionIndex < 1 {
            self.backButton.isHidden = true
        }
        
        let question: Question = Question.all[questionIndex]
        
        // *viewWithTag : UIView Type을 반환하는 메서드.
        // 현재 view에서 버튼 태그(d~c)에 해당하는 코드를 가져와 제목을 설정해준다.
        guard let dButton: UIButton = self.view.viewWithTag(ButtonTag.d.rawValue) as? UIButton else {return}
        dButton.setTitle(question.d, for: .normal)
        
        guard let iButton: UIButton = self.view.viewWithTag(ButtonTag.i.rawValue) as? UIButton else {return}
        iButton.setTitle(question.i, for: .normal)
        
        guard let sButton: UIButton = self.view.viewWithTag(ButtonTag.s.rawValue) as? UIButton else {return}
        sButton.setTitle(question.s, for: .normal)
        
        guard let cButton: UIButton = self.view.viewWithTag(ButtonTag.c.rawValue) as? UIButton else {return}
        cButton.setTitle(question.c, for: .normal)
        
    }
    
    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpAnswerButton(_ sender: UIButton) {
        
        // * 메소드를 호출한 객체가 응답 버튼인지 확인한다.
        guard let tag: ButtonTag = ButtonTag(rawValue: sender.tag) else {return}
        
        switch tag {
        case .d:
            UserInfo.shared.score.d += 1
        case.i:
            UserInfo.shared.score.i += 1
        case.s:
            UserInfo.shared.score.s += 1
        case .c:
            UserInfo.shared.score.s += 1
        }
        
        let nextIndex: Int = self.questionIndex + 1
        
        // * StoryBoard ID?
        // 현재 질문 진행정도 (문항수)를 nextIndex와 비교후 네비게이션 전환 효과 로직을 분기.
        if Question.all.count > nextIndex,
           let nextViewController: QuestionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            nextViewController.questionIndex = nextIndex
            // nextPage animation
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.performSegue(withIdentifier: "ShowResult", sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
