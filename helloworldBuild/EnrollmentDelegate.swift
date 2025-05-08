//
//  EnrollmentDelegate.swift
//  helloworldBuild
//
//  Created by Raheem Chisman on 5/4/25.
//
import IntuneMAMSwift


class EnrollmentDelegate: NSObject, IntuneMAMEnrollmentDelegate {
    
    var presentingViewController: UIViewController?
    
    override init() {
        super.init()
        self.presentingViewController = UIApplication.shared.windows.first?.rootViewController
    }
    
    init(viewController : UIViewController){
        super.init( )
        self.presentingViewController = viewController
    }
    
    /*
     This is a method of the delegate that is triggered when an instance of this class is set as the delegate of the IntuneMAMEnrollmentManager and an enrollment is attempted.
     The status parameter is a member of the IntuneMAMEnrollmentStatus class. This object can be used to check for the status of an attempted enrollment
     If successful, logic for enrollment is initiated
     */
    func enrollmentRequest(with status: IntuneMAMEnrollmentStatus) {
        
        var msg = ""
        if status.didSucceed {
            msg = "Enrollment successful!"
        } else {
            //In the case unenrollment failed, log error
            msg = ("Enrollment result for identity \(status.identity) with status code \(status.statusCode)") + (" Debug message: \(String(describing: status.errorString))")
        }
        print(msg)
        
        let alert = UIAlertController(title: "Enrollment Result", message: msg, preferredStyle: .alert)
        let closeAlert = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(closeAlert)
        
        if nil != self.presentingViewController {
                self.presentingViewController!.present(alert, animated: true, completion: nil)
        } else {
            UIUtils.getCurrentViewController().present(alert, animated: true, completion: nil)
        }
    }
    
    /*
     This is a method of the delegate that is triggered when an instance of this class is set as the delegate of the IntuneMAMEnrollmentManager and an unenrollment is attempted.
     The status parameter is a member of the IntuneMAMEnrollmentStatus class. This object can be used to check for the status of an attempted unenrollment.
     Logic for logout/token clearing is initiated here.
     */
    func unenrollRequest(with status: IntuneMAMEnrollmentStatus) {
  
        var msg = ""
        if status.didSucceed {
            msg = "Unenrollment successful!"
        } else {
            //In the case unenrollment failed, log error
            msg = ("Unenrollment result for identity \(status.identity) with status code \(status.statusCode)") + (" Debug message: \(String(describing: status.errorString))")
        }
        print(msg)
        
        let alert = UIAlertController(title: "Enrollment Result", message: msg, preferredStyle: .alert)
        let closeAlert = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(closeAlert)
        
        if nil != self.presentingViewController {
                self.presentingViewController!.present(alert, animated: true, completion: nil)
        } else {
            UIUtils.getCurrentViewController().present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func policyRequest(with status: IntuneMAMEnrollmentStatus) {
        var msg = ""
        if status.didSucceed {
            msg = "Policy fetch successful!"
        } else {
            msg = ("Policy fetch result for identity \(status.identity) with status code \(status.statusCode)") + (" Debug message: \(String(describing: status.errorString))")
        }
        print(msg)
    }
}
