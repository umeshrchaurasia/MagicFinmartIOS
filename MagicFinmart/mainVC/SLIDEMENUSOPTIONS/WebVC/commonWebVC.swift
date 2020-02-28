//
//  commonWebVC.swift
//  MagicFinmart
//
//  Created by Admin on 30/01/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit
import WebKit
import CustomIOSAlertView
import TTGSnackbar

class commonWebVC: UIViewController,WKNavigationDelegate,UIScrollViewDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

   
    var webfromScreen = ""
    var fromcontctWebsite = String()
    var ProposerPageUrl = ""
    var PaymentURL = ""
    var healthpckCode = ""
    var bankUrl = ""
    var bankName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("fromcontctWebsite??=",fromcontctWebsite)
        print("ProposerPageUrl=",ProposerPageUrl)
        
        // add activity
        self.webView.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.webView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
        
        let FBAId = UserDefaults.standard.string(forKey: "FBAId")
//        let SSID = UserDefaults.standard.string(forKey: "POSPNo")
        let Url = UserDefaults.standard.string(forKey: "Url")
        let loanselfmobile = UserDefaults.standard.string(forKey: "loanselfmobile")
        let TwoWheelerUrl = UserDefaults.standard.string(forKey: "TwoWheelerUrl")
        let FourWheelerUrl = UserDefaults.standard.string(forKey: "FourWheelerUrl")
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        
        if(webfromScreen == "private")
        {
//            "http://www.policyboss.com/Finmart/TW_Web/tw-main-page.html?ss_id=5&fba_id=65057"
            titleLbl.text! = "PRIVATE CAR"
            webView.load(URLRequest(url: URL(string: TwoWheelerUrl!+"&ip_address=10.0.3.64&mac_address=10.0.3.64&app_version_ios=2.0&product_id=1")!))
            
//            webView.load(URLRequest(url: URL(string: "http://www.policyboss.com/Finmart/TW_Web/tw-main-page.html?ss_id="+(SSID!)+"&fba_id="+(FBAId!)+"&ip_address=10.0.3.64&mac_address=10.0.3.64&app_version=2.2.0")!))
        }
        if(webfromScreen == "twoWheeler")
        {
//            "http://www.policyboss.com/Finmart/TW_Web/tw-main-page.html?ss_id=5&fba_id=65057"
            titleLbl.text! = "TWO WHEELER"
            webView.load(URLRequest(url: URL(string: FourWheelerUrl!+"&ip_address=10.0.3.64&mac_address=10.0.3.64&app_version_ios=2.0&product_id=10")!))
        }
        else if(webfromScreen == "loanAgreement")
        {
            titleLbl.text! = "LOAN AGREEMENT"
            webView.load(URLRequest(url: URL(string: "https://docs.google.com/viewer?url=http://erp.rupeeboss.com/FM/Franchise_Agreement.pdf")!))
        }
        else if(webfromScreen == "messageCenter")
        {
            titleLbl.text! = "MESSAGE CENTER"
            webView.load(URLRequest(url: URL(string: "http://d3j57uxn247eva.cloudfront.net/Health_Web/sms_list.html?ss_id=5999&fba_id="+(FBAId!)+"&ip_address=10.0.6.13.&app_version=1.0&device_id="+(deviceID!))!))
        }
        else if(webfromScreen == "myBusiness")
        {
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            titleLbl.text! = "MY BUSINESS"
            webView.load(URLRequest(url: URL(string: Url!)!))
        }
        else if(webfromScreen == "Training")
        {
            titleLbl.text! = "TRAINING"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/training-schedule-calendar/"+(FBAId!))!))
        }
        else if(webfromScreen == "leadDetails")
        {
            titleLbl.text! = "LEAD DETAILS"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/motor-lead-details/"+(FBAId!))!))
        }
        else if(webfromScreen == "HealthInsurance")
        {
            titleLbl.text! = "HEALTH INSURANCE"
            webView.load(URLRequest(url: URL(string: "http://d3j57uxn247eva.cloudfront.net/Health_Web/quote_list.html?ss_id=5999&fba_id="+(FBAId!)+"&ip_address=10.0.6.13.&mac_address=38:c9:86:e9:76:da&app_version=1.0")!))
            
        }
        else if(webfromScreen == "freeCreditCard")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "https://www.rupeeboss.com/equii?BrokerId=58745&source_type=IOS")!))
        }
        else if(webfromScreen == "cashLoan")
        {
            titleLbl.text! = "CASH LOAN"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/gopaysense?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
        }
        else if(webfromScreen == "businessLoan")
        {
            titleLbl.text! = "BUSINESS LOAN"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/lendingkart?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
        }
        else if(webfromScreen == "rectifyCredit")
        {
            titleLbl.text! = "RECTIFY CREDIT"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/rectifycredit?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
        }
        else if(webfromScreen == "fin-Peace")
        {
            titleLbl.text! = "FIN-PEACE"
            webView.load(URLRequest(url: URL(string: "https://10oqcnw.finpeace.ind.in/app#/53686"+(FBAId!))!))
        }
        else if(webfromScreen == "healthAssure")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/health-packages?FBAID="+(FBAId!)+"&FBAName=&FBAMobile="+(loanselfmobile!)+"&PackCode="+healthpckCode)!))
        }
        else if(webfromScreen == "contactWebsites")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "http://"+fromcontctWebsite)!))
        }
        else if(webfromScreen == "loanonMessanger")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "https://yesbankbot.buildquickbots.com/chat/rupeeboss/staff/?userid="+(FBAId!)+"&usertype=FBA&vkey=b34f02e9-8f1c")!))
        }
        else if(webfromScreen == "otherInvestmentproductp2p")
        {
            titleLbl.text! = "OTHER INVESTMENT PRODUCT-P2P"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/liquiloan/main_2.html?fbaid="+(FBAId!)+"&type=finmart&loan_id=38054")!))
        }
        else if(webfromScreen == "lyfinsQuote"){
//            let ProposerPageUrl = UserDefaults.standard.string(forKey: "ProposerPageUrl")
            titleLbl.text! = "CLICK TO PROTECT 3D"
            webView.load(URLRequest(url: URL(string: ProposerPageUrl)!))

        }
        else if(webfromScreen == "lyfinshdfcnetPremium"){
            titleLbl.text! = "CLICK TO PROTECT 3D"
            webView.load(URLRequest(url: URL(string: ProposerPageUrl)!))
        }
        else if(webfromScreen == "payforgetMPS")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: PaymentURL)!))
        }
        else if(webfromScreen == "leadDashboard")
        {
            titleLbl.text! = "LEAD DASHBOARD"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/motor-lead-details/"+(FBAId!))!))
        }
        else if(webfromScreen == "myFinbox")
        {
            titleLbl.text! = "MY FINBOX"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/marketing-campaign/12CI63")!))
        }
        else if(webfromScreen == "Finperks")
        {
            titleLbl.text! = "FINPERKS"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/finperks/index.html?1")!))
        }
        else if(webfromScreen == "homeLoanapplyNow"){
            titleLbl.text! = bankName
            webView.load(URLRequest(url: URL(string: bankUrl)!))
        }
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.delegate = self
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = true
    }
    
    
    @IBAction func homeBtnCliked(_ sender: Any)
    {
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
    @IBAction func webbackBtnCliked(_ sender: Any)
    {
        if(webfromScreen == "contactWebsites")
        {
            let hnfcontactUs : hnfcontactUsVC = self.storyboard?.instantiateViewController(withIdentifier: "stbhnfcontactUsVC") as! hnfcontactUsVC
            present(hnfcontactUs, animated: true, completion: nil)
        }
        else{
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
            present(KYDrawer, animated: true, completion: nil)
        }

    }
    
    
}

