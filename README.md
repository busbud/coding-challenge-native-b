# Busbud Challenge: _*Osheaga Routes*_

![CI](https://github.com/samsegfault/coding-challenge-native-b/workflows/CI/badge.svg)

##### Hi, there! This repository hosts the challenge for the Busbud Challenge for iOS Development. 
###### _If you happen to cross in here and you're interested in some part of the code or simply curious, let me know and let's chat, I'd love to help you out if that's the case._
:-)
 ___

### About the challenge...
<details><summary>Understanding the challenge</summary>
<p>

##### Project requirements

- A simple app, must contain:
	- Onboarding
	- Bus ticket search for a specific date with a specific route
- That's pretty much it.

I felt that it was necessary to respect that and limit myself into not doing anything more than that. After all, a code challenge also works to understand how one does work in a day to day project. Therefore this repository hosts an app that indeed has only an on-boarding screen and another search screen.

As it was described by the requirements the ability to search for routes only **Quebec -> Montreal** at **July, 29 of 2021**. Therefore, the text fields, although ready to for user input, were intentionally disabled. 
</p>
</details>
<details><summary>Effort x Time consideration</summary>
<p>

##### Project requirements

It was given a full week to develop such app. As I know I'd only have the weekend to work on it I had to use my time wisely in order to demonstrate my abilities in the field as best I could. No project gets great if it wasn't properly planned before. I decided to go with a Gantt Diagram to help me out with that.

![Gantt Diagram](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Planning.jpg?raw=trueg)

</p>
</details>
<details><summary><b>SwiftUI && Storyboard</b>? <b>SwiftUI || Storyboard?</b></summary>
<p>
	
So... I decided to do differently in this step. I'm completely believe and love SwiftUI but I did not think it would be interesting to develop the whole app revolving in that because that wouldn't show how I work with code maintaining, in a certain way. By developing with classic Swift I believe I could share more of my work in details, as also to provide whoever evaluates my challenge a glimpse into how I do in a day-to-day project.

That doesn't mean I wouldn't try it out a little bit! :)

I created two targets for the project, one fully based on SwiftUI and another fully based on Classic Swift, both sharing common resources and entities. I deliberately chose not to use *UIHostingController* in here so there would be more content to read. And yes, that did took me way more time to finish the project because certain parts of the code I would have to rewrite completely, but I still think it was worth it.

In the end of the project, there were a little differences between them. I played a little with Combine in the SwiftUI and I decided for VIPER architecture in the storyboard one. I chose VIPER due to its potential in a large scale app such as Busbud itself. More scalable, better working in teams, etc.

**That being said, if I do have to chose I prefer to have my challenge reviewed as the Storyboard target.**
</p>
</details>
<details><summary>Tests</summary>
<p>
	
Honestly, I feel like I could have given a little bit more of attention for that, there's a few instrumental tests written and running. It is classic, the developer wishing for more time to develop more tests, and welll... that was the case as well, haha.
</p>
</details>
<details><summary>App details</summary>
<p>
	
App has dark mode and support for gestures here and there, animations were work on hard to look as smooth as possible, pretty much based on [this](https://developer.apple.com/videos/play/wwdc2018/803).
</p>
</details>
<details><summary>Self critic</summary>
<p>
	
Oh, well. There's a plenty of critic to do.

For starters something that is bothering me a lot in the project is that I didn't make as accessible as I could've. I really didn't have the time to validate the app for visually impaired users nor any other accessibility features that aren't hard at all to support.

I'm not really satisfied with the search results, the cells are too simple, I totally could've done a little bit more of UX refining. Perhaps I should have even implemented the quick ordering buttons that the Busbud has, they are pretty useful.

I didn't create a Splashscreen nor an App Icon. I could've done that, it isn't hard at all.

Perhaps I could've used an vibration feedback throughout the user journey, that would be a nice touch.

I guess these are the points I do have in mind, perhaps I have forgotten one or two. 
</p>
</details>
<details><summary>Github Actions CI/CD</summary>
	
I took the oportunity to implement a basic CI with Github Actions for the project. It basically runs the set of written tests every push or pull request.

<p>
</details>
<details><summary>Conclusion</summary>
	
Pretty fun. I felt like in a Hackathon, which I haven't attended in years. It was quite a nice feeling but also memories of me going bananas trying to deliver everything with a few hours of code. Anyway, I choose a more relaxed language because I thought it would be nice to talk like I do with my colleagues. Special thanks to Kacey Musgraves and Sufjan Stevens, I couldn't have done this project without listening to theirs songs over and over again.

Thanks for reading it all! =)
<p>
</details>

### Screenshots
Onboarding | Search
------------ | -------------
![Onboarding Step 1](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Onboarding1.png?raw=trueg) | ![Search Initial](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Search1.png?raw=trueg)
![Onboarding Step 1](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Onboarding2.png?raw=trueg) | ![Search Results](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Search2.png?raw=trueg)
![Onboarding Step 1](https://github.com/samsegfault/coding-challenge-native-b/blob/main/Screenshots/Onboarding3.png?raw=trueg) | 
