//
//  ViewController.swift
//  StopWatch
//
//  Created by MAEDAHAJIME on 2015/07/10.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 時間表示用のラベル
    @IBOutlet weak var lbTimeLabel: UILabel!
    
    // NSTimeInterval：時間を計算するメソッド
    var startTime = NSTimeInterval()
    
    // NSTimer：タイマーを管理するクラス
    var timer:NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // スタートボタンが押された時の設定
    @IBAction func StartAction(sender: UIButton) {
        //もし、〔スタートボタン：StartAction〕が押されたら〔関数：StartTime〕を呼び出す
        if (!timer.valid) {
            
            // NSTimer：タイマーを管理するクラス
            timer = NSTimer.scheduledTimerWithTimeInterval(
                0.01,                                   // 時間の間隔〔0.01〕
                target: self,                           // タイマーの実際の処理の場所
                selector: Selector("StartTime"),        // メソッド タイマーの実際の処理
                userInfo: nil,
                repeats: true)                          // 繰り返し
            
            // NSDate：日付と時間を管理するクラス
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }

    // ストップボタンが押された時の設定
    @IBAction func StopAction(sender: UIButton) {
        // 無効化〔invalidate：無効化〕
        timer.invalidate()
    }
    
    // Timeスタート
    func StartTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // 現在の時間を調べるためにスタートします
        var Time: NSTimeInterval = currentTime - startTime
        
        //〔分〕を計算
        // UInt8：8 ビット符号なし整数への変換
        // NSTimeInterval：引数に時間の長さを示す値
        let minutes = UInt8(Time / 60.0)
        Time -= (NSTimeInterval(minutes) * 60)
        
        //〔秒〕を計算
        let seconds = UInt8(Time)
        Time -= NSTimeInterval(seconds)
        
        //〔ミリ秒〕を計算
        let fraction = UInt8(Time * 100)
        
        //〔分〕〔秒〕〔ミリ秒〕を文字列にします
        let timeMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let timeSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        // 時間表示用のラベルに〔分〕〔秒〕〔ミリ秒〕を表示
        lbTimeLabel.text = "\(timeMinutes):\(timeSeconds):\(timeFraction)"
    }
}

