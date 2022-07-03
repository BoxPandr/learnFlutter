import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    
    var methodChannel: FlutterMethodChannel?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      if let ctrl = window.rootViewController as? FlutterBinaryMessenger{
          let channel = FlutterMethodChannel(name: "_PageMineState", binaryMessenger: ctrl)
          let picker = UIImagePickerController()
          picker.modalPresentationStyle = .fullScreen
          picker.delegate = self
          channel.setMethodCallHandler { call, handler in
              switch call.method{
              case "pic":
                  if let vc = ctrl as? FlutterViewController{

                     
                      vc.present(picker, animated: true) {}
                       
                  }
              default:()
              }
          }
          methodChannel = channel
          
      }
      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}




extension AppDelegate: UINavigationControllerDelegate{
    
    
    
}



extension AppDelegate: UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if #available(iOS 11.0, *) {
            
            if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
                methodChannel?.invokeMethod("imgPath", arguments: url.path)
            }
            picker.dismiss(animated: true) {
                
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}


