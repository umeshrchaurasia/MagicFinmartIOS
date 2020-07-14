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
import Alamofire

class commonWebVC: UIViewController,WKNavigationDelegate,UIScrollViewDelegate ,WKScriptMessageHandler ,UIDocumentInteractionControllerDelegate{

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var addType = ""
    var webfromScreen = ""
    var fromcontctWebsite = String()
    var ProposerPageUrl = ""
    var PaymentURL = ""
    var healthpckCode = ""
    var bankUrl = ""
    var bankName = ""
    
    var webTitle = ""
    
    var dynamicUrl = ""
    var dynamicName = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

//        print("fromcontctWebsite??=",fromcontctWebsite)
//        print("ProposerPageUrl=",ProposerPageUrl)
        
        // add activity
        self.webView.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.webView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
        
        let FBAId = UserDefaults.standard.string(forKey: "FBAId")
//        let SSID = UserDefaults.standard.string(forKey: "POSPNo")
       // let Url = UserDefaults.standard.string(forKey: "Url")
        let loanselfmobile = UserDefaults.standard.string(forKey: "loanselfmobile")
        let TwoWheelerUrl = UserDefaults.standard.string(forKey: "TwoWheelerUrl")
        let FourWheelerUrl = UserDefaults.standard.string(forKey: "FourWheelerUrl")
        
         let HealthUrl = UserDefaults.standard.string(forKey: "healthurl")
         let CVUrl = UserDefaults.standard.string(forKey: "CVUrl")
        
        let LoanId = UserDefaults.standard.string(forKey: "LoanId")
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        let appVersion = Configuration.appVersion
        
        // self.setupWKWebview()
        webView.configuration.userContentController.add(self, name: "finmartios")
      
        if(webfromScreen == "private")      //  PrdID =1
        {
            
            
            
            titleLbl.text! = "PRIVATE CAR"
            bindInsuranceUrl(strURL: FourWheelerUrl!,prdID: "1")
            
            
//            let myUrl = "http://qa.mgfm.in/images/rbasalesmaterial/testpagenew.html"
//            titleLbl.text! = "PRIVATE CAR"                                           // for testing
//            webView.load(URLRequest(url: URL(string: myUrl)!))
//            print("URL",myUrl)
            //////
            
            
            
//            webView.load(URLRequest(url: URL(string: FourWheelerUrl!+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id=1&device_id=594ad17c0ec7fd1e&login_ssid=")!))
//
//            print("URL", FourWheelerUrl!+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id=1&device_id=594ad17c0ec7fd1e&login_ssid=")
            
        }
        else if(webfromScreen == "twoWheeler")  //  PrdID =10
        {

            titleLbl.text! = "TWO WHEELER"
            bindInsuranceUrl(strURL: TwoWheelerUrl!,prdID: "10")
            
        }
        else if(webfromScreen == "COMMERCIALVEHICLE")
        {
            titleLbl.text! = "COMMERCIAL VEHICLE"
             bindInsuranceUrl(strURL: CVUrl!,prdID: "12")
            
            
        }
            
            
        else if(webfromScreen == "HealthInsurance")     //   PrdID = 2
        {
            titleLbl.text! = "HEALTH INSURANCE"
            bindInsuranceUrl(strURL: HealthUrl!,prdID: "2")
            
            

        }
      /********************************************Loan URL ******************************************************************/
            
            
        else if(webfromScreen == "credit")
        {
            
            let creditURL = "https://www.rupeeboss.com/finmart-credit-card-loan-new?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: creditURL)!))
            print("URL",creditURL)
            
             // webView.load(URLRequest(url: URL(string: dynamicUrl)!))
        }
            
        else if(webfromScreen == "personal")
        {
            
            let tempURL = "https://www.rupeeboss.com/finmart-personal-loan-new?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: tempURL)!))
            print("URL",tempURL)
            
        }
            
        else if(webfromScreen == "business")
        {
            
            let tempURL = "https://www.rupeeboss.com/finmart-business-loan-new?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: tempURL)!))
            print("URL",tempURL)
            
        }
            
       
            
            
        else if(webfromScreen == "home")
        {
            
            let tempURL = "https://www.rupeeboss.com/finmart-home-loan-new?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: tempURL)!))
            print("URL",tempURL)
            
        }
            
        else if(webfromScreen == "lap")
        {
            
            let tempURL = "https://www.rupeeboss.com/finmart-property-loan?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: tempURL)!))
            print("URL",tempURL)
            
        }
        else if(webfromScreen == "car")
        {
            
            let tempURL = "https://www.rupeeboss.com/car-loan-new?BrokerId="+(LoanId!)+"&client_source=finmart"
            
            titleLbl.text! = webTitle
            webView.load(URLRequest(url: URL(string: tempURL)!))
            print("URL",tempURL)
            
        }
            
 
     /**********************************************End   OF Loan ***********************************************************/
            
            
    /****************************** HTML ****************************************/
        else if(webfromScreen == "DISCLOSURE")
        {
            
            bindHTMLData()
        }
            
            
           
            
            
       
     ///////////////////////////////////////////////////////////////////////////////
                   //    Menu Saction //
      ///////////////////////////////////////////////////////////////////////////////
            
    /****************************** Home Section  ****************************************/
        else if(webfromScreen == "myFinbox")
        {
            
            let url = UserDefaults.standard.string(forKey: "finboxurl")
            //finboxurl
            titleLbl.text! = "MY FINBOX"
            guard let FINBOX = url else{
                
                return
            }
            
            webView.load(URLRequest(url: URL(string: FINBOX)!))
            print("URL",FINBOX)
        }
            
        else if(webfromScreen == "Finperks")
        {
            let url = UserDefaults.standard.string(forKey: "finboxurl")
            
         
            if let finperkurl = url {
                
                titleLbl.text! = "FINPERKS"
                webView.load(URLRequest(url: URL(string: finperkurl)!))
                print("URL",finperkurl)
            }
        }
            
      /******************************END OF HOME Section  ****************************************/
            
     /****************************** MY TRANSACTION  Section  ****************************************/
          
        else if(webfromScreen == "InsuranceBusiness")
        {
            insurancebusinessAPI()
        }
        else if(webfromScreen == "policyByCRN")
        {
            let url = UserDefaults.standard.string(forKey: "PBByCrnSearch")
        
            
            if let mainURL = url {
                
                titleLbl.text! = "Search CRN"
                webView.load(URLRequest(url: URL(string: mainURL)!))
                print("URL",mainURL)
            }
        }
          
        /******************************END****************************************/
    
        /****************************** MY LEAD Section  ****************************************/
            
        else if(webfromScreen == "leadDashboard")
        {
            let url = UserDefaults.standard.string(forKey: "LeadDashUrl")
            
            
            if let mainURL = url {
                
                titleLbl.text! = "LEAD DASHBOARD"
                webView.load(URLRequest(url: URL(string: mainURL)!))
                print("URL",mainURL)
            }
        }
            
            
            
      
        /******************************END****************************************/
            
            
      
            
     /********************************************Not in used ****************************************/
        else if(webfromScreen == "loanAgreement")
        {
            titleLbl.text! = "LOAN AGREEMENT"
            webView.load(URLRequest(url: URL(string: "https://docs.google.com/viewer?url=http://erp.rupeeboss.com/FM/Franchise_Agreement.pdf")!))
              print("URL",CVUrl!+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id=12")
        }
        else if(webfromScreen == "messageCenter")
        {
            titleLbl.text! = "MESSAGE CENTER"
            webView.load(URLRequest(url: URL(string: "http://d3j57uxn247eva.cloudfront.net/Health_Web/sms_list.html?ss_id=5999&fba_id="+(FBAId!)+"&ip_address=10.0.0.1&app_version="+(appVersion)+"&device_id="+(deviceID!))!))
              print("URL",CVUrl!+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id=12")
        }
        else if(webfromScreen == "myBusiness")
        {
           
        }
        else if(webfromScreen == "Training")
        {
            titleLbl.text! = "TRAINING"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/training-schedule-calendar/"+(FBAId!))!))
            
            print("URL","http://bo.magicfinmart.com/training-schedule-calendar/"+(FBAId!))
        }
        else if(webfromScreen == "leadDetails")
        {
            titleLbl.text! = "LEAD DETAILS"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/motor-lead-details/"+(FBAId!))!))
            print("URL",CVUrl!+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id=12")
        }
            
             /**************************************************************************************************************/
        
        else if(webfromScreen == "freeCreditCard")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "https://www.rupeeboss.com/equii?BrokerId=58745&source_type=IOS")!))
             print("URL","https://www.rupeeboss.com/equii?BrokerId=58745&source_type=IOS")
        }
        else if(webfromScreen == "cashLoan")
        {
            titleLbl.text! = "CASH LOAN"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/gopaysense?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
             print("URL","http://www.rupeeboss.com/gopaysense?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")
        }
        else if(webfromScreen == "businessLoan")
        {
            titleLbl.text! = "BUSINESS LOAN"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/lendingkart?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
             print("URL","http://www.rupeeboss.com/lendingkart?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")
        }
        else if(webfromScreen == "rectifyCredit")
        {
            titleLbl.text! = "RECTIFY CREDIT"
            webView.load(URLRequest(url: URL(string: "http://www.rupeeboss.com/rectifycredit?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")!))
            print("URL","http://www.rupeeboss.com/rectifycredit?fbaid="+(FBAId!)+"&type=finmart&loan_id=64635")
        }
            
        
        else if(webfromScreen == "fin-Peace")
        {
            let finperkurl = UserDefaults.standard.string(forKey: "finperkurl")

            guard let FINPERK = finperkurl else{
                
                return
            }
            titleLbl.text! = "FIN-PEACE"
            webView.load(URLRequest(url: URL(string: FINPERK)!))
    
        
        }
        else if(webfromScreen == "healthAssure")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/health-packages?FBAID="+(FBAId!)+"&FBAName=&FBAMobile="+(loanselfmobile!)+"&PackCode="+healthpckCode)!))
            
            print("URL","http://bo.magicfinmart.com/health-packages?FBAID="+(FBAId!)+"&FBAName=&FBAMobile="+(loanselfmobile!)+"&PackCode="+healthpckCode)
        }
        else if(webfromScreen == "contactWebsites")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "http://"+fromcontctWebsite)!))
            print("URL","http://"+fromcontctWebsite)
        }
        else if(webfromScreen == "loanonMessanger")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: "https://yesbankbot.buildquickbots.com/chat/rupeeboss/staff/?userid="+(FBAId!)+"&usertype=FBA&vkey=b34f02e9-8f1c")!))
            print("URL","https://yesbankbot.buildquickbots.com/chat/rupeeboss/staff/?userid="+(FBAId!)+"&usertype=FBA&vkey=b34f02e9-8f1c")
        }
        else if(webfromScreen == "otherInvestmentproductp2p")
        {
            titleLbl.text! = "OTHER INVESTMENT PRODUCT-P2P"
            webView.load(URLRequest(url: URL(string: "http://bo.magicfinmart.com/liquiloan/main_2.html?fbaid="+(FBAId!)+"&type=finmart&loan_id=38054")!))
            print("URL","http://bo.magicfinmart.com/liquiloan/main_2.html?fbaid="+(FBAId!)+"&type=finmart&loan_id=38054")
        }
        else if(webfromScreen == "lyfinsQuote"){
//            let ProposerPageUrl = UserDefaults.standard.string(forKey: "ProposerPageUrl")
            titleLbl.text! = "CLICK TO PROTECT 3D"
            webView.load(URLRequest(url: URL(string: ProposerPageUrl)!))
            print("URL",ProposerPageUrl)

        }
        else if(webfromScreen == "lyfinshdfcnetPremium"){
            titleLbl.text! = "CLICK TO PROTECT 3D"
            webView.load(URLRequest(url: URL(string: ProposerPageUrl)!))
            print("URL",ProposerPageUrl)
        }
        else if(webfromScreen == "payforgetMPS")
        {
            titleLbl.text! = "BACK"
            webView.load(URLRequest(url: URL(string: PaymentURL)!))
            print("URL",PaymentURL)
        }
       
        
       
        else if(webfromScreen == "homeLoanapplyNow"){
            titleLbl.text! = bankName
            webView.load(URLRequest(url: URL(string: bankUrl)!))
            print("URL",bankUrl)
        }
        
        else if(webfromScreen == "Dynamic"){
            titleLbl.text! = dynamicName
            webView.load(URLRequest(url: URL(string: dynamicUrl)!))
            print("URL",dynamicUrl)
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
        
        if(addType == "CHILD"){
            
            self.remove()
     
        }else{
//            let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
//            present(KYDrawer, animated: true, completion: nil)
            
              dismiss(animated: true)

        }
     
    }
    
    @IBAction func webbackBtnCliked(_ sender: Any)
    {
        if(addType == "CHILD"){
             self.remove()
        }
        else{
            if(webfromScreen == "contactWebsites")
            {
                let hnfcontactUs : hnfcontactUsVC = self.storyboard?.instantiateViewController(withIdentifier: "stbhnfcontactUsVC") as! hnfcontactUsVC
                present(hnfcontactUs, animated: true, completion: nil)
            }
            else{
                
//                let value = UIInterfaceOrientation.portrait.rawValue
//                UIDevice.current.setValue(value, forKey: "orientation")
//                let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
//                present(KYDrawer, animated: true, completion: nil)
                
                 dismiss(animated: true)
                
            }
        }
        

    }
    
    
    func bindInsuranceUrl(strURL : String, prdID : String ){
        
         let appVersion = Configuration.appVersion
        
          let insURL = strURL+"&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version="+(appVersion)+"&product_id="+(prdID)+"&device_id=594ad17c0ec7fd1e&login_ssid="
        
        webView.load(URLRequest(url: URL(string: insURL)!))
        
        print("URL",insURL )
    }
    
    
    func bindHTMLData(){
        
        if let resourceURL = Bundle.main.url(forResource: "Disclosure", withExtension: "html") {
            
            let urlRequest  = URLRequest.init(url: resourceURL)
            
             titleLbl.text! = "DISCLOSURE"
            webView.load(urlRequest)
        }
    }
 
    ///////////////////////////////////////////////////////
    
    
    //  Event
    
    // Method is used For Preview
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        
        return self
    }
    
    
    
    // Handler for JavaScript Communication
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
           print("JAVASCRIPT CALLED")
       print("Message",  message.body)
//        generatePdf(strUrl: message.body as! String)
    }
    
    // Configuratyion for Script
    
    private func setupWKWebview() {
        
        let wkWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20) , configuration: self.getWKWebViewConfiguration())
        // wkWebView.translatesAutoresizingMaskIntoConstraints = false
        
        //        self.webView = WKWebView(frame: self.view.frame, configuration: self.getWKWebViewConfiguration())
        
        
        // self.view.addSubview(self.webView)
        
        self.view.addSubview(wkWebView)
        
        
    }
    private func getWKWebViewConfiguration() -> WKWebViewConfiguration {
        let userController = WKUserContentController()
        userController.add(self, name: "finmartios")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userController
        return configuration
    }
    
    // PDF generation
    
    private func generatePdf(strUrl : String){
        
        
        let alertView:CustomIOSAlertView = FinmartStyler.getLoadingAlertViewWithMessage("Please Wait...")
        if let parentView = self.navigationController?.view
        {
            alertView.parentView = parentView
        }
        else
        {
            alertView.parentView = self.view
        }
        alertView.show()
        
        var filename = "policyBoss"
        
        let request = URLRequest(url:  URL(string: strUrl )!)
        let config = URLSessionConfiguration.default
        let session =  URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            if error == nil{
                if let pdfData = data {
                    let pathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(filename).pdf")
                    do {
                        print("open \(pathURL.path)")
                        try pdfData.write(to: pathURL, options: .atomic)
                        
                        alertView.close()
                    }catch{
                        print("Error while writting")
                        alertView.close()
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.sharePdf(path: pathURL)
                    }
                    
                    
                }
            }else{
                print(error?.localizedDescription ?? "")
                alertView.close()
            }
        }); task.resume()
    }
    
    
    
    // Share Pdf Using Path
    func sharePdf(path:URL) {
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: path.path) {
            
            // Below is Default Sharing
            //            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
            //            activityViewController.popoverPresentationController?.sourceView = self.view
            //            self.present(activityViewController, animated: true, completion: nil)
            
            // For Showing Preview
            
            let controller = UIDocumentInteractionController(url: path)
            controller.delegate = self
            controller.presentPreview(animated: true)
            
        }
    }
    
    
    
    ///////////////////////////////////////////////////////////////////////
    
    
    func insurancebusinessAPI()
    {
        
        if Connectivity.isConnectedToInternet()
        {
            print("Yes! internet is available.")
            
            
            let alertView:CustomIOSAlertView = FinmartStyler.getLoadingAlertViewWithMessage("Please Wait...")
            if let parentView = self.navigationController?.view
            {
                alertView.parentView = parentView
            }
            else
            {
                alertView.parentView = self.view
            }
            
            
            alertView.show()
            
            let ERPID = UserDefaults.standard.string(forKey: "ERPID")
            let fba_uid = UserDefaults.standard.string(forKey: "fba_uid")
            let fba_campaign_id = UserDefaults.standard.string(forKey: "fba_campaign_id")
            let fba_campaign_name = UserDefaults.standard.string(forKey: "fba_campaign_name")
            
            
            let params: [String: AnyObject] = ["Id": ERPID as AnyObject,
                                               "fba_uid": fba_uid as AnyObject,
                                               "fba_campaign_id": fba_campaign_id as AnyObject,
                                               "fba_campaign_name": fba_campaign_name as AnyObject,]
            
            let url = "/LeadCollection.svc/GetEncryptedErpId"
            
            FinmartRestClient.sharedInstance.authorisedPost(url, parameters: params, onSuccess: { (userObject, metadata) in
                alertView.close()
                
                self.view.layoutIfNeeded()
                
                let Url = userObject as! String
                print("INSURANCE Url=",Url)
                let value = UIInterfaceOrientation.landscapeLeft.rawValue
                UIDevice.current.setValue(value, forKey: "orientation")
                self.titleLbl.text! = "MY BUSINESS"
                self.webView.load(URLRequest(url: URL(string: Url)!))
               
                
            }, onError: { errorData in
                alertView.close()
                //            let snackbar = TTGSnackbar.init(message: errorData.errorMessage, duration: .long)
                //            snackbar.show()
            }, onForceUpgrade: {errorData in},checkStatus: true)
            
        }else{
            let snackbar = TTGSnackbar.init(message: "No Internet Access Avaible", duration: .long)
            snackbar.show()
        }
        
    }
    

}


