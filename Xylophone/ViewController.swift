import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    let notes = ["C", "D", "E", "F", "G", "A", "B"]
    
    private enum Colors: CaseIterable {
        case red, orange, yellow, green, cyan, blue, purple
        
        var color: UIColor {
            switch self {
            case .red:
                return #colorLiteral(red: 1, green: 0.2332399487, blue: 0.1861645281, alpha: 1)
            case .orange:
                return #colorLiteral(red: 1, green: 0.5835773349, blue: 0, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 1, green: 0.8001160026, blue: 0.006338595878, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.2066813409, green: 0.7795598507, blue: 0.3491449356, alpha: 1)
            case .cyan:
                return #colorLiteral(red: 0.3468087614, green: 0.3369399607, blue: 0.8411970139, alpha: 1)
            case .blue:
                return #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.6851996183, green: 0.3207102418, blue: 0.8711986542, alpha: 1)
            }
        }
    }
    
    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 8 // Adjust this value if needed
        verticalStack.distribution = .fillEqually
        verticalStack.alignment = .center
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(verticalStack)
        createViews()
        setupVerticalStackConstraints()
    }
    
    private func setupVerticalStackConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createViews() {
        let totalCount = CGFloat(Colors.allCases.count)
        for (index, color) in Colors.allCases.enumerated() {
            let button = UIButton(type: .system)
            button.backgroundColor = color.color
            button.setTitleColor(.white, for: .normal)
            button.setTitle(notes[index], for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.translatesAutoresizingMaskIntoConstraints = false
            verticalStack.addArrangedSubview(button)
            button.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
            let multiplier = 1 - (CGFloat(index) / totalCount * 0.2)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalTo: verticalStack.widthAnchor, multiplier: multiplier)
            ])
        }
    }
    
    @objc func playSound(_ sender: UIButton) {
        let noteName = sender.titleLabel?.text // Использование tag для определения индекса ноты
        do {
            guard let url = Bundle.main.url(forResource: noteName, withExtension: "wav") else { return }
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
