import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -- Methods
    // MARK: Life Cycle
    // * 화며이 보여지기 이전에 초기화하는 로직
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nameField.text = nil
    }

    @IBAction func touchUpStartButton(_ sender: UIButton) {
        
        // MARK: Exception Check 1
        // * nameFiled가 비어있는지 체크하는 로직
        guard let name: String = self.nameField.text,
              name.isEmpty == false else {
            
            // * UIAlertCotnroller : 메시지 생성 객체
            // title: 메시지창 타이틀, message : 메시지 내용, preferredStyle: 메시지창 스타일
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "이름을 입력해주세요", preferredStyle: .alert)
            
            // * UIAlertAction 버튼 객체
            // title: 버튼 타이틀, style : 버튼 스타일 (취소, default 등..), handelr: 실행 로직 (함수 or 클로저)
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // MARK: Logic2
        // * 이름이 입력되어 있다면, 사용자 정보를 싱글톤객체에 저장하고, 화면 전환
        UserInfo.shared.name = self.nameField.text
        self.performSegue(withIdentifier: "PresentTest", sender: nil) // 화면전환
        
    }
    
    
}

