

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if scene is UIWindowScene {

            // create viewController code...
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
                    let rightViewController = storyboard.instantiateViewController(withIdentifier: "RightViewController") as! RightViewController
                    
                    let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
                    
                    UINavigationBar.appearance().tintColor = UIColor(red: 32, green: 25, blue: 124, alpha: 1.0)
                    
            //        leftViewController.mainViewController = nvc
                    
                    let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
                    slideMenuController.automaticallyAdjustsScrollViewInsets = true
            //        slideMenuController.delegate = mainViewController as! SlideMenuControllerDelegate
                    self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
                    self.window?.rootViewController = slideMenuController
                    self.window?.makeKeyAndVisible()
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

