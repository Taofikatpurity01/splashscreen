import 'package:flutter/material.dart';

/// ProfileScreen is a StatelessWidget because it displays fixed data only —
/// it does not need to manage any changing state.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// build describes the entire UI of the profile screen.
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual layout structure of the screen.
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 245, 245, 249), // Consistent light grey background

      // SafeArea ensures content is not hidden behind system UI (notch, status bar).
      body: SafeArea(
        // SingleChildScrollView makes the whole screen scrollable
        // so content is not cut off on smaller screens.
        child: SingleChildScrollView(
          // Padding adds equal spacing around all sides of the content.
          child: Padding(
            padding: const EdgeInsets.all(18),

            // Column stacks all profile sections vertically.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the left

              children: [

                // --- Top Bar ---
                // Row arranges the title and menu icon horizontally,
                // with the title centered and the icon on the right.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Empty SizedBox balances the Row so the title stays centered.
                    SizedBox(width: 30),

                    // Page title text
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Three-dot menu icon on the right
                    Icon(Icons.more_horiz),
                  ],
                ),

                const SizedBox(height: 20), // Spacing below the top bar

                // --- Profile Section ---
                // Row places the avatar on the left and the stats (Recipe/Followers/Following) on the right.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // CircleAvatar displays the profile photo in a circular frame.
                    CircleAvatar(
                      radius: 45, // Controls the size of the circle
                      backgroundImage: AssetImage("assets/profile.jpg"), // Loads photo from assets
                    ),

                    const SizedBox(width: 20), // Spacing between avatar and stats

                    // Expanded fills the remaining horizontal space for the stats row.
                    Expanded(
                      // Inner Row distributes the three stat columns evenly.
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [

                          // Recipe count stat — Column stacks the number above the label.
                          Column(
                            children: [
                              Text(
                                "4",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text("Recipe"),
                            ],
                          ),

                          // Followers count stat
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Text(
                                  "2.5M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text("Followers"),
                              ],
                            ),
                          ),

                          // Following count stat
                          Column(
                            children: [
                              Text(
                                "259",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text("Following"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // --- Name and Bio ---
                // Displays the user's full name in large bold text.
                const Text(
                  "Taofikat Oyedepo",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Displays the user's title/role in grey below the name.
                const Text(
                  "Chef",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 15),

                // Displays a secondary label for the user's profession.
                const Text(
                  "Private Chef",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 8),

                // Short bio text displayed in grey.
                const Text(
                  "Passionate about food and life 🍲🍛🥘",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 5),

                // "More..." link styled in teal to indicate it is tappable.
                const Text(
                  "More...",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // --- Tab Bar ---
                // Row displays three content category tabs side by side.
                // "Recipe" is the active tab (highlighted with a teal pill),
                // while "Videos" and "Tag" are inactive (grey text).
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    // Active tab: wrapped in a Container with a teal rounded background.
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.teal, // Active tab background color
                        borderRadius: BorderRadius.circular(30), // Pill shape
                      ),
                      child: const Text(
                        "Recipe",
                        style: TextStyle(
                          color: Colors.white, // White text on teal background
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Inactive tab — plain grey text with no background.
                    const Text(
                      "Videos",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Inactive tab — plain grey text with no background.
                    const Text(
                      "Tag",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // --- Recipe Cards ---
                // Each recipeCard call builds a full-width image card for one recipe.
                recipeCard(
                  image: "assets/food1.jpg",
                  title: "Jollof Rice garnished with vegies",
                  author: "Chef Oyedepo",
                ),

                const SizedBox(height: 20), // Spacing between the two cards

                recipeCard(
                  image: "assets/food2.jpg",
                  title: "Sweet beans and fried plantain with chicken",
                  author: "Chef Taofikat",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// recipeCard builds a single recipe card widget.
  /// It takes an [image] asset path, a [title], and an [author] name,
  /// and returns a styled Container with the food image as background
  /// and overlaid text details at the bottom.
  Widget recipeCard({
    required String image,   // Asset path for the food photo
    required String title,   // Name of the recipe
    required String author,  // Name of the recipe author
  }) {
    // Outer Container sets the card size and applies the background food image.
    return Container(
      height: 210, // Fixed card height in logical pixels
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded card corners
        image: DecorationImage(
          image: AssetImage(image), // Loads the food image from assets
          fit: BoxFit.cover,        // Scales image to fill the card without distortion
        ),
      ),

      // Inner Container adds a semi-transparent dark overlay so white text is readable.
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black38, // 38% opacity black overlay
        ),

        // Column places the text details at the bottom of the card.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end, // Pushes content to the bottom
          children: [

            // Recipe title in large white bold text.
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Author name prefixed with "By ".
            Text(
              "By $author",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 10),

            // Row shows the cook time on the left and a bookmark icon on the right.
            const Row(
              children: [

                // Clock icon indicating time-related information.
                Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: 18,
                ),

                SizedBox(width: 5),

                // Cook time label next to the clock icon.
                Text(
                  "20 min",
                  style: TextStyle(color: Colors.white),
                ),

                // Spacer pushes the bookmark icon to the far right.
                Spacer(),

                // Bookmark icon allows users to save the recipe.
                Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}