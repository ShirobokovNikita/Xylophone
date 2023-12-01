import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    let notes: [Note] = [
           Note(name: "C", color: #colorLiteral(red: 1, green: 0.2332399487, blue: 0.1861645281, alpha: 1)),
           Note(name: "D", color: #colorLiteral(red: 1, green: 0.5835773349, blue: 0, alpha: 1)),
           Note(name: "E", color: #colorLiteral(red: 1, green: 0.8001160026, blue: 0.006338595878, alpha: 1)),
           Note(name: "F", color: #colorLiteral(red: 0.2066813409, green: 0.7795598507, blue: 0.3491449356, alpha: 1)),
           Note(name: "G", color: #colorLiteral(red: 0.3468087614, green: 0.3369399607, blue: 0.8411970139, alpha: 1)),
           Note(name: "A", color: #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)),
           Note(name: "B", color: #colorLiteral(red: 0.6851996183, green: 0.3207102418, blue: 0.8711986542, alpha: 1)),
       ]
    
    private lazy var verticalStack: UIStackView = {
           let stack = UIStackView()
           stack.axis = .vertical
           stack.spacing = 8
           stack.distribution = .fillEqually
           stack.alignment = .center
           stack.translatesAutoresizingMaskIntoConstraints = false
           return stack
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
           for (index, note) in notes.enumerated() {
               let button = NoteButton(type: .system)
               button.configure(with: note, index: index, totalCount: CGFloat(notes.count))
               verticalStack.addArrangedSubview(button)
               button.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
           }
       }
       
       @objc func playSound(_ sender: UIButton) {
           let noteName = sender.titleLabel?.text
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

