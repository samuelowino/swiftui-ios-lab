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

- - -

# Audio Capture

## AVCaptureAudioFileOutput

A capture output that records audio and saves the recorded audio to a file. Use **startRecording(to,outputFileType, recordingDelegate)**.

```swift
#if OS = macOS
func startRecording(
    to outputFileURL: URL,
    outputFileType fileType: AVFileType,
    recordingDelegate delegate: AVCaptureFileOutputRecordingDelegate
)

#endif

//not available in iOS
```

## AVCaptureAudioDataOutput

A capture output that records audio and provides access to audio sample buffers as they are recorded.

```swift
func startRecording(file url: URL, delegate: AVCaptureAudioDataOutputSampleBufferDelegate, thread: DispatchQueue){
        let audioCaptureOutput = AVCaptureAudioDataOutput()
        audioCaptureOutput.setSampleBufferDelegate(delegate, queue: thread)
    }
```

## AVAssetWriter

An object that writes media data to a container file. An AssetWrite is a **single-use object** that writes to one output file. Create multiple asset writers if you want to write to multiple output files.

**Create a writer**

```swift
convenience init(
    url outputURL: URL,
    fileType outputFileType: AVFileType) throws

let writer = AVAssetWriter(url: file, fileType: AVFileType.mp3)
```

- - -

# Loading Media Data Asynchronously

AVFoundation uses **AVAsset** to model *timed audiovisual media*. AVAsset defers loading the media until the data is required. 

> You must load media data asynchronously to avoid blocking the main thread.

## Load properties asynchronously

The framework builds it's asynchronouse property loading capabilities around two key types: **AVAsyncProperty** and **AVAsynchronouseKeyValueLoading**. 

* **AVAsyncProperty** - An Asynchronous property that constrains it's type and value.

```swift
class AVAsyncProperty<Root, Value> : AVPartialAsyncProperty<Root>
```

* **AVAsynchronouseKeyValueLoading** - A protocol that defines the interface to load media data synchronously.

```swift
protocol AVAsynchronouseKeyValueLoading
```

Call the **AVAsynchronouseKeyValueLoading.load()** method to retrieve the values of the media properties, or to determine the loaded status of a property by calling the **status(of:)** method.

**AVAsset**, **AVAssetTrack** and **AVMetadataItem** adopt the **AVAsynchronouseKeyValueLoading** protocol, which provides them the asynchronouse **load()** method.

```swift
public func load<T>(_ property: AVAsyncProperty<Self, T>) async throws -> T
```

Call this method in an asynchronouse context

```swift
let videoDuration = try await asset.load(AVAsyncProperty.duration)

let metadata = try await asset.load(AVAsyncProperty.metadata)
```

To load multiple properties at the same time, use a variation of the load() method and tuples.

```swift
let (duration, metadata) = try await asset.load(.duration, .metadata)
```

## Determin a property status

**AVAsynchronousKeyValueLoading** also provides a **status(of:)** method that returns the status of a property identifier. It returns an **AVAscyncProperty.Status** value which can be: **AVAscyncProperty.Status.notYetLoaded**, **AVAscyncProperty.Status.loading**, **AVAscyncProperty.Status.loaded(metadata)**, **AVAscyncProperty.Status.failed(error)**.

```swift
switch asset.status(of: .metadata) {
    case .notYeLoaded:

    case .loading:

    case .loaded(let metadata):

    case failed(let error):
}
```

## Filter Property collections

Some properties provide arrays of values such as an asset's track and/or it's metadata.

```swift
let audioTracks = try await asset.loadTracks(withMediaType: .audio)

var allDescriptions = [CMFormatDescription]()

for track in audioTracks {
    allDescriptions.append(contentsOf: try await track.load(.formatDescriptions))
}

let sampleRates = Set(allDescriptions).map { formatDescription in 
    Float(formatDescription.audioStreamBasicDescription?.mSampleRate ?? 0)
}.sorted(by: {
    $0 < $1
})
```

- - -

# AVFAudio

> Play, record and process audio; configure your app's system audio behaviour.

## Components

* **System Audio** - *AVAudioSession*, *AVAudioRoutingArbiter*
* **Basic Playback and Recording** - *AVAudioPlayer*, *AVAudioRecorder*, *AVMIDIPlayer*
* **Advanced Audio Processing** - *AudioEngine*

## System Audio
- - -
## 1. AVAudioSession

> An object that communicates to the system how you intend to use audio in your app.

```swift
class AVAudioSession : NSObject
```

An audio session acts as an intermediary between your app and the operating system - and, in turn, the underlying audio hardware. Use audio session to communicate the nature of your audio with the operating system and hardware without detailing specific behaviour.

To configure your app's audio session, you set the audio session category. 

> There are six possible audio session categories:

**AVAudioSession.Category._**

* **ambient** - The category for an app where sound playback in **nonprimary**, that is- your app also works with the sound turned off. When you use this category, audio from other apps also mixes with your audio.

* **multiRoute** - The category for routing distinct streams of data to different output devices at the same time. The category can be used for input, output or both.

* **playAndRecord** - The category used for recording (input) and playback (output) such as for a VoIP(Voice Over IP) app.

* **record** - The category for recording audio while also silencing playback audio. The user must grant permission for audio recording.

* **playback** - The category for playing sound.

* **soloambient (default category)** - The default audio session category.

Use **AVAudioSession** object to configure an audio session for your app.

```swift
let audioSession = AVAudioSession.sharedInstance()

do {
    try audioSession.setCategory(.record)
} catch {
    print("Failed to set audio session category: cause \(error)")
}
```
 - - -

 ## 2. AVAudioRoutingArbiter

 > An object for configuring macOS apps to participate in automatic audio switching.

 ```swift
func startVoiceCall(){
    let arbiter = AVAudioRoutineArbiter.shared
    arbiter.begin(category: .playAndRecordVoice) { deviceChanged, error in
        //run voice call here
    }
}

func endCall(){
    AVAudioRoutingArbiter.shared.leave()
}
 ```

 - - -

## 3. AVAudioPlayer

> An object that plays audio data from a file or a buffer.

```swift
class AVAudioPlayer : NSObject
```
You can use the audio player to achieve the following:

* Play audio of any duration from a file or buffer
* Control the volume, rate and looping behaviour.
* Access playback-level metering data
* Play multiple sounds simultaneously by synchronizing the playback of multiple players.

**Create a Media Player**

```swift
let soundFile = URL("path/to/audio.m4a")
let audioPlayer = try AVAudioPlayer(contentsOf: soundFile) 

// or include fileTypeHints

let audioPlayer = try AVAudioPlayer(contentsOf: soundFile, fileTypeHint: "public.data")

//or init with in memory audio/sound data

let inMemoryAudioData = Data()
let audioPlayer = try AVAudioPlayer(data: inMemoryAudioData)

//or init with sound data and file type hints

let audioPlayer = try AVAudioPlayer(data: inMemoryAudioData, fileTypeHints: "public.data")
```

> Read More ℹ️

> Apple UTI File Type Hints: https://en.wikipedia.org/wiki/Uniform_Type_Identifier

**Controlling Playback**

```swift
func AVAudioPlayer.prepareToPlay() -> Bool
```

Prepares the player for audio playback.

Returns true if the system successfully prepares the audio player, otherwise false.

> The system calls this method while using the method **play()**, but calling it in advance minimizes the delay between calling **play()** and the start of sound output.

```swift
func AVAudioPlayer.play() -> Bool
```

Plays audio asynchronously. 

Returns true if audio play started successfully otherwise false. This method implicitly calls, **AVAudioPlayer.prepareToPlay()** if the audio player is unprepared for audio playback.

```swift
func AVAudioPlayer.play(atTime time: TimeInterval) -> Bool
```
Play audio asynchronously starting at the specified point in the audio device's timeline.

```swift
func AVAudioPlayer.pause()
```
Pause audio playback. Calling pause does not deallocate hardware resources, it pauses ready to resume.

```swift
func AVAudioPlayer.stop()
```
Stops playback and undoes the setup the system requires for playback.

```swift
AVAudioPlayer.isPlaying: Bool { get }
```

A Boolean value that indicates whether the player is currencly playing any audio.

- - -

## 4. AVAudioPlayerDelegate

A **protocol** that defines methods to respond to audio playback events and decoding errors.

```swift
protocol AVAudioPlayerDelegate
```

> All of the methods under this protocol are optional

```swift
class AudioPlaybackDelegate: NSObject, AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("▶️audioPlayerDidFinishPlaying with success flag \(flag)")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("▶️audioPlayerDecodeErrorDidOccur")
        if let error = error {
            print("\(error)")
        }
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("▶️audioPlayerBeginInterruption")
    }
    
    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        print("▶️audioPlayerBeginInterruption")
    }
}
```
- - -
## 5. AVAudioRecorder

> An object that records audio data to a file.

```swift
class AVAudioRecorder
```

You can use an audio recorder to perform the following functions:

* Record audio from a system's active input device
* Record for a specified duration or until the user stops recording
* Pause and resume recording
* Access recording-level metering data

**Creating an audio recorder**

The system supports the following settings for creating an audio recorder.

| Key                   | PossibleValues            |
|-----------------------|---------------------------|
| AVFormatIDKey         | kAudioFormatLinearPCM     |
| AVFormatIDKey         | kAudioFormatMPEG4AAC      |
| AVFormatIDKey         | kAudioFormatAppleLossless |
| AVFormatIDKey         | kAudioFormatAppleIMA4     |
| AVFormatIDKey         | kAudioFormatiLBC          |
| AVFormatIDKey         | kAudioFormatULaw          |
| | |
| AVSampleRateKey       | 8 kHz to 192 kHz          |
| | |
| AVNumberOfChannelsKey | 1 to 64                   |


**kAudioFormatMPEG4AAC**
> A key that specified an MPEG-4 AAC codec. AAC stands for **Advanced Audio Coding**. AAC is the successor of MP3. MPEG4 AAC achieves a higher sound quality than MP3 encoders at the same bit rate.

**kAudioFormatLinearPCM**
> A key that specifies linear PCM, a non compressed audio data format with one frame per packet. PCM stands for **Pulse Code Manipulation**. This format allows sampling the incoming audio from the mic.

**kAudioFormatAppleLossless**
> This will record the audio with apple losseless codec and provides losseless data compression. All currenct apple devices can play apple losseless audio.

**kAudioFormatAppleIMA4**
> A key that specifies use of Apple's implementation of the **IMA 4:1 ADPCM codec**. This uses pulse control manipulation as well.

```swift
//IMA decoding table
int ima_step_table[89] = { 
  7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 
  19, 21, 23, 25, 28, 31, 34, 37, 41, 45, 
  50, 55, 60, 66, 73, 80, 88, 97, 107, 118, 
  130, 143, 157, 173, 190, 209, 230, 253, 279, 307,
  337, 371, 408, 449, 494, 544, 598, 658, 724, 796,
  876, 963, 1060, 1166, 1282, 1411, 1552, 1707, 1878, 2066, 
  2272, 2499, 2749, 3024, 3327, 3660, 4026, 4428, 4871, 5358,
  5894, 6484, 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899, 
  15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767 
};
```
**kAudioFormatiLBC**
> **Internet Low Bitrate Codec** is a narrow band speech codec. ILBC handles lost frames through sound quiality degradation.

**kAudioFormatULaw**
> Apple's implementation of **μLaw 2:1** used in 8-bit PCM (Pulse Control Manipulation). μLaw 2:1 uses **companding** which reduces the dynamic range of an audio signal.

**AVSampleRateKey**
> A floating point value that represents the sample rate in hertz.

![Sound Signal Processing, Sampling](/640px-Signal_Sampling.svg.png)

**AVEncoderAudioQualityKey**
> Specify the sample rate  audio quality for encoding and conversion. Can be **min,low,medium,high or max**

```swift
//Create settings
let settings = [
    AVFormatIDKey : Int(kAudioFormatAppleIMA4),
    AVSampleRateKey : 48_000,
    AVNumberOfChannelsKey : 1,
    AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
]


let recordingFileUrl= URl(string: "file://path/to/file")
let audioRecorder = AVAudioRecorder(url: recordingFileUrl, settings: [String, Any])
```
























