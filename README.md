### Steps to Run the App

There are three states I would like you to run my app in: 
1. Run the app as is (with the goodResponse being used in the NetworkManager). Feel free to play around with the UI. Sort and Filter at the same time, reload, click the play or read buttons, etc.

2. Uncomment the section in line 21 of the NetworkManager. This will show you the app in it's error state when the response returns invalid data. When you press Try Again on my error screen you should then receive a good response. Feel free to play around from there again if you want.

3. Change "malformedResponse" on line 21 of the NetworkManager to "emptyResponse". This will show you the app in it's empty state when the response returns successfully but with an empty array. Pressing Try Again should once again give you a good response with a full array. Note that both the error screen and empty screen have specific copy that relates to the specific state.

4. Run the tests in FetchRecipeTests. I'm specifically testing my RecipeListViewModel which contains the business logic of the app. 

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I spent the most time on the details of my UI. I wanted to make the simple recipe list useful. I hopefully did that by adding in sorting and filtering functionality and the ability to quickly navigate to the Youtube and Source urls. I also spent a good amount of time making sure I was covering all my bases in my tests.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent about 4 hours on this project. I started by setting up my networking and just making sure I could get a successful response. That took about 20 minutes. I like to do networking first because that allows me to set up my models and decide what I'll use from the response for my UI. I then moved on to setting up the list UI. With SwiftUI, getting your data presentable in list form is fairly trivial and refreshing is as simple as adding the refreshable modifier with an action. I took more time on setting up image caching and then my sorting and filtering functionality. From there, I created my three supplementary views, Loading, Empty and Error, which were pretty straightforward. I moved on to implementing tests about 2ish hours in and spent about a half hour there. I then spent the rest of my time cleaning up my code (moving strings to Constants, making reusuable views, etc.) and working on small, pesky bugs (I had one bug where both buttons in my HStack were getting pressed. Solved it by giving them the borderless button style).

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

I have some duplicate code in my FilterSortSheet for both the sort and filter cases. I know there's a better way for me to make the sheet more generic and reusable but for the sake of time + the fact that's there's only two cases for the sheet (sort and filter) I decided it was okay to just double the code.

### Weakest Part of the Project: What do you think is the weakest part of your project?

I'm switching between potential states (loading, error, empty, full recipes) on my Recipe List View using an if, else if, else logic flow. While completely functional, a cleaner, more Swifty way to do this might be to use a State enum and switch between cases. 

Also the doubled code mentioned above ^ in the FilterSortSheet.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

No, looked up some help for solving a bug with two buttons being pressed in the same HStack but other than that this is all me.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I really enjoyed this project. It's always fun to try and make a simple app as clean and useful as you can. Hope you guys enjoy my work!

