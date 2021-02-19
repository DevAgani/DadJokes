//
//  ViewController.swift
//  DadJokes
//
//  Created by George  on 18/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let apiService = ICanHazDadJokeNetworkApi()
    
    lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()

    @IBOutlet weak var jokeContainerView: UITextView!
    @IBOutlet weak var dadJokeTextView: UITextView!
    
    @IBOutlet weak var fetchNextJoke: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewLookAndFeel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        apiService.fetchRandomDadJoke { [weak self] (result) in
            switch result {
            case .success(let dadJoke):
                DispatchQueue.main.async {
                    self?.dadJokeTextView.text = dadJoke.joke ?? ""
                }
            case .failure:
                print("Unable to fetch JOke")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = jokeContainerView.bounds
    }
    
    // View look and feel
    func viewLookAndFeel() {

        jokeContainerView.layer.cornerRadius = 15
        jokeContainerView.layer.shadowOpacity = 1
        jokeContainerView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    


}

