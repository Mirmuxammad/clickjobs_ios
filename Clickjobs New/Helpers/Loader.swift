import UIKit
import Lottie


public class Loader {
    
    ///Shows custom Alert for a while
    class func start() {

        let loadV = LoaderView()
        loadV.tag = 19995
        loadV.frame = UIScreen.main.bounds
        loadV.isUserInteractionEnabled = true
        let customView = AnimationView()
        customView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
                
        loadV.animationView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.centerXAnchor.constraint(equalTo: loadV.animationView.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: loadV.animationView.centerYAnchor).isActive = true
        customView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-64).isActive = true
        customView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-64).isActive = true
        
        customView.backgroundColor = .defaultGray.withAlphaComponent(0.3)
        if let view = UIApplication.shared.keyWindow {
            view.addSubview(loadV)
            customView.animation = Animation.named("load")
            customView.animationSpeed = 1.5
            customView.loopMode = .loop
            customView.play()
        }
      
    }
    
    class func stop() {
        DispatchQueue.main.async {
            for i in UIApplication.shared.keyWindow!.subviews {
                if i.tag == 19995 {
                    if let view = i as? LoaderView {
                        UIView.animate(withDuration: 0.3) {
                            view.animationView.alpha = 0
                        } completion: { _ in
                            view.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
}


class LoaderView: UIView {
    
    var animationView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        animationView.clipsToBounds = true
//        animationView.layer.cornerRadius = 12
        animationView.backgroundColor = .defaultGray.withAlphaComponent(0.5)
        self.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


