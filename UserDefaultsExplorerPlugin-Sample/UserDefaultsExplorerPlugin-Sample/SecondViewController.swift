import UIKit

final class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = try? (UIApplication.shared.delegate as! AppDelegate).userDefaultsExplorerPlugin.convertXMLString()
        textView.text = text
    }
    @IBOutlet private weak var textView: UITextView!
    @IBAction private func saveButtonTapped(_ sender: Any) {
        guard let data = textView.text.data(using: .utf8) else {
            return
        }
        _ = try? (UIApplication.shared.delegate as! AppDelegate).userDefaultsExplorerPlugin.saveToUserDefaults(xmlData: data)
        navigationController?.popViewController(animated: true)
    }
}
