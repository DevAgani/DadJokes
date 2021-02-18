//
//  ViewController.swift
//  DadJokes
//
//  Created by George  on 18/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let apiService = ICanHazDadJokeNetworkApi()

    @IBOutlet weak var dadJokeTextView: UITextView!
    
    @IBOutlet weak var fetchNextJoke: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


}

