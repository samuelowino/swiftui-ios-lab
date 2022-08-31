# AVFoundation

* **Work with audio visual assets**
* **Control device cameras**
* **Process Audio**
* **Configure system audio interactions**

AVFoundation works with other technologies to bring support for **audiovisual** capabilities to the Apple platform.

# AVFoundation Components
# Common

**Media Assets**

Load media assets from files and streams to inspect their attributes, tracks and embedded metadata.

**Media Reading and Writing**

Read images from video. Perform sample level processing of media and assets

**Media Types and Utitlities**

Identify content type that AVFoundation supports

**Video Settings**

Configure video processing settings using standard key and value constraints.

**Audio Settings**

Configure audio processing settings using standard key and value constraints.

# Playback

**Media Playback**

Manage playback of media assets.

**Streaming and Airplay**
Stream content wirelessly to other devices using AirPlay.

**Offline  Playback and Storage**
Download streamed content to disk to allow offline playback.

# Capture

**Capture Setup**

Configure built in cameras and microphones.

**Photo Capture**

Capture high quality  still images, live photos and supporting photo data.

**Audio and Video Capture**

Capture audio and video directly to media files.

**Additional Data Capture**

Capture additional data including depth and metadata.

# Editing

**Composite Assets**

Combine tracks and segments of tracks from multiple sources into a composite asset that you can playback.

**Quick Time Movies**

Access the contents of QuickTime movie file.

**Video Effects**

Define video transition effects.

**Audio Mixing**

Define how to mix audio level from multiple audio tracks over an asset duration

# Audio

Audio Playback, recording and processing

Speech synthesis

# Errors

**AVFoundatioErrorDomain**

**AVError**

- - -

# Capturing Still and Live Photos

Capture and configure single or multiple still images live photos and other forms of photography.

AVFoundation supports many ways to capture photos:

* **Capture still images with HEIF or JPEG images**
* **Capture in raw format for custom processing**
* **Snap several images in one shot**
* **Capture Live Photos with Motion and Sound**

> In iOS all photography workflows use the **AVCapturePhotoOutput** class.

> macOS uses **AVCaptureStillImageOutput**

# Prepare for photo capture

**1. Set up an AVCaptureSession containing a supported camera device as one of it's inputs**

**2. Set up an AVCapturePhotoOutput as one of it's outputs**

The main components of the capture framework are: **Sessions, inputs and outputs**. Capture sessions connect inputs to outputs. Inputs are source of media such as cameras and microphones. Outputs acquire media from inputs to produce useful data.

![AVFoundation Input , Output and Sessions ](/4ecf0924-ea2b-4faa-aea8-7bfc0b3fe419.png)

# Requesting Capture Authorization/ Permissions

In iOS a user must explicitly grant your app access to capture photos, video and audio.

![iOS Photo Capture Permission Request Dialog](/2958897~dark@2x.png)

## 1. Configure Your App's Info.plist File

iOS requires that your app provides static messages to display to the user when the system asks for permissions.

If your app uses the Camera add the **NSCameraUsageDescription key** in your app's info.plist.

If your app uses the device microphone include the **NSMicrophoneUsageDescription** key in your app's info.plist.

## 2. Verify and Request Authorization for Capture

Always test the **AVCaptureDevice authorizationStatus(for:)** before setting up a capture session. If the user has not granted nor denied capture permission, the authorization status is **AVAuthorizationStatus.notDetermined**. In this case use the **requestAccess()** method to tell iOS to prompt the user for the permission.

```swift
    func checkCameraPermissionStatus() -> AVAuthorizationStatus {
        AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    }
    
    func requestCameraPermission(completion: @escaping(Bool) -> ()){
        AVCaptureDevice.requestAccess(for: AVMediaType.video){ granted in
            completion(granted)
        }
    }
```

## 3. Request Authorization Before Saving Media

When you compelete a photo capture with **AVCapturePhotoOutput**, you receive an **AVCapturePhoto object**, that contains not only the *still image data* but also *camera metadata and any auxillary images*.

You can retrive pieces of data individiaully from the **AVCapturePhoto** or simply call it's **fileDataRepresentation()** method to get the **Data object** ready for writing to disc.

Typically, after capturing a photo you will want to add it to the user's photo library. This can be done using **PhotoKit**/**Photo Framework**.

To get permission to use the Photo Library:

* Configure your info.plist, include **NSPhotoLibraryUsageDescription key**.
* Verify or request authorization. Use the **PHPhotoLibrary requestAuthorization.

```swift
PHPhotoLibrary.requestAuthorization { status in
    guard status == .authorized else { return c}
}
```

## 4. Use a creation request to add a photo to the Photo Library

```swift
func addPhotoToLibrary(photo: AVCapturePhoto, completion: @escaping(Bool, Error?) -> ()){

        guard let photoData = photo.fileDataRepresentation() else {
            completion(false, PhotoStorageError.STORAGE_FAILED)
            return
        }
                
        PHPhotoLibrary.shared().performChanges({
            let creatRequest = PHAssetCreationRequest.forAsset()
            creatRequest.addResource(with: PHAssetResourceType.photo, data: photoData, options: nil)
        }, completionHandler: completion)
    }
```

# 5. Set up a Capture Session

**AVCaptureSession** manages the flow of data from input devices to media outputs. 

![iOS Photo Capture Permission Request Dialog](/b9c65b62-3728-43f1-8d25-08fd42bc6bb7.png)

## 1. Connect Inputs And Outputs to the Capture Session

All capture sessions need atleast **one capture input** and **one capture output**.

> Capture inputs **(AVCaptureInput subclasses) are media sources such as cameras and microphones** built into the iOS device or Mac.

> Capture outputs **(AVCaptureOutput subclasses) use data provided by capture inputs** to produce media, such as image and movie files.

> Add the kinds of media you would like to capture from the camera you selected.
> To enable capturing photos add **AVCapturePhotoOutput**

A session can have multiple inputs and output.

```
Important!

Call beginConfiguration() before changing a session's inputs and outputs. Call commitConfiguration() after making changes.
```

# 6. Display A Camera Preview

You can provide a capture preview by connecting your **AVCaptureSession** to an **AVCaptureVideoPreviewLayer**. This displays a live video feed of the camera while the session is running.

- - -

#  Capture Still and Live Photos

## 1. Choose Settings

Create an **AVCapturePhotoSettings** object describing the settings you want to use for that shot and the data format for the resulting still photo.

With settings you can automatic flash and image stabilization.

```swift
let photoSettings = AVCapturePhotoSettings()

if self.photoOutput.availablePhotoCodecTypes.contains(.hevc) {
    photoSettings = AVCapturePhotoSettings(format:
        [AVVideoCodecKey: AVVideoCodecType.hevc])
} else {
    //Fallback to JPEG
    photoSettings = AVCapturePhotoSettings()
}

photoSettings.flashMode = .auto

photoSettings.isAutoStillImageStabilizationEnabled =  self.photoOutput.isStillImageStabilizationSupported
```


## 2. Capture the Photo

Pass your photo capture settings **AVCapturePhotoSettings** object to the **capturePhoto(with: settings, delegate: protocol)** method to trigger a photo capture with the settings provided.

## 3. Handle Capture Results

The delegate you pass to **capturePhoto(with: settings, delegate:)** method is an object to track the progress of and handle results from that photo capture. Capturing a photo is asynchronous. 

```swift
class PhotoCaptureProcessor: NSObject, AVCapturePhotoCaptureDelegate {
    // ...
}

let captureProcessor = PhotoCaptureProcessor()

self.photoOutput.capturePhoto(with: photoSettings, delegate: captureProcessor)
```

When your captured photo is ready to use, the photo output calls your delegate's **photoOutput(output, didFinishProcessingPhoto, error)** method. You can use the resulting **AVCapturePhoto object** there to display, process and save the image.


- - -

# Tracking Photo Capture Progress

Monitor key events during capture to provide feedback in your camera UI. While it's possible for your app to ignore many stages of this process and simply wait for the final result, you can create a more responsive camera interface by monitoring each step.

After you call **capturePhoto(with settings, delegate)** your delegate object can follow along with five major steps in the process (or more, depending on your photo settings).

![iOS Photo Capture Permission Request Dialog](/aa3686ea-ef3e-4bbd-946f-071cb995a25d.png)

**1. Settings Resolved**

**2. Exposure started**

**3. Exposure complete**

**4. Result data delivery**

**5. Capture complete**

