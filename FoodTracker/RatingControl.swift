import UIKit

class RatingControl: UIView {

    // MARK: Initialization
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage  = UIImage(named: "emptyStar")

        for _ in 0..<stars {
            let button = UIButton()

            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            button.adjustsImageWhenHighlighted = false
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: .Highlighted)

            ratingButtons += [button]
            addSubview(button)
        }
    }

    // MARK: Properties
    var rating: Int = 0 {
        // property の変更後に処理を走らせる cf.willSet
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars   = 5

    // subview の render メソッドを上書きし、配列を渡してそれぞれ配置するようにしている
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)

         // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in enumerate(ratingButtons) {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars

        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        // index が 0 から始まるため +1 している(つらい
        // FIXME: swift2.0 以降を使えるようになったら indexOf を使うようにする
        rating = find(ratingButtons, button)! + 1

        updateButtonSelectStates()
    }
    
    func updateButtonSelectStates() {
        for (index, button) in enumerate(ratingButtons) {
            button.selected = index < rating
        }
    }
}
