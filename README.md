# Sorry Girl

[![CircleCI](https://circleci.com/gh/lortza/sorrygirl.svg?style=svg)](https://circleci.com/gh/lortza/sorrygirl)

[![Maintainability](https://api.codeclimate.com/v1/badges/73d94f9055777a075fcf/maintainability)](https://codeclimate.com/github/lortza/sorrygirl/maintainability)

The apology you needed to hear, but from Ryan Gosling.

Write an apology... and it comes from Ryan Gosling. Send it to a friend via social media. https://sorrygirl.herokuapp.com/

* Ruby 2.7.2
* Rails 6.1.3
* Postgres
* RSpec

### Deployment Note
Run the seeds file in order to set up the Home and About pages.

## Tour of the App

The concept of the app is that a user writes a short apology note with a picture of Ryan Gosling to send to a friend via social media. So silly.

![alt text](/public/screenshots/home.png "home page")


### Write an Apology

![alt text](/public/screenshots/apology1.gif "writing an apology")

A little Javascript helps you to keep it short and sweet.

![alt text](/public/screenshots/apology2.gif "character count validations")

### Send it via Social Media

![alt text](/public/screenshots/apology3.gif "sending via social media")


### The Basic Mechanics

1. A user submits `body` data on the `apology` form.
2. The `Image` class is prompted to select a random image from the `app/assets/images` directory.
3. The `apology.image` attribute is set to that random image file and the `apology` object is saved.
4. After save, the `apologies#show` page is rendered where the user can share it via social media links.


## About the Codebase

To me, the most interesting part of this codebase is the `Image` class as it's not tied to a database model, and it still neatly delivers an image to the `apology`.

Photos are stored in the app's `/assets/images` directory. In order to access those photos, I got to take advantage of a couple of Ruby libraries:

* `Dir` to read the contents of the images directory
* `File` to parse the image file paths into file names

Grabbing a `.sample` from that array of image file names is now super straight-forward.

```ruby
# app/models/image.rb

class Image

  IMAGES_DIRECTORY = '/assets/images/'
  ACCEPTABLE_FORMATS = %w(jpg jpeg png)

  # Use the new array of file names to grab a ramdom file name
  def self.sample
    self.image_file_names.sample
  end

  private

  # Map the array into just the image file names
  def self.image_file_names
    self.filepaths.map { |path| File.basename(path) }
  end

  def self.filepaths
    Dir.glob("*#{IMAGES_DIRECTORY}*.{#{ACCEPTABLE_FORMATS.join(',')}}")    
  end

end
```

It also makes assigning that random image in the `Apology` interface very straight-forward.


```ruby
# app/models/apology.rb

class Apology < ActiveRecord::Base
  ...

  before_validation :assign_image, on: :create
  ...

  def assign_image
    self.image = Image.sample
  end

end
```

I also how this approach is scalable and built to be future-flexible. It doesn't really matter how many images of Ryan Gosling I put in that directory. The app will work the same. And should I ever decide to expand this class and have it pull images from an API or other source, only the `private` methods will need to change. The `Apology` interface is good to go as-is.

### And speaking of maintainability...

This application is not terribly complex, but that's no reason to get lax on how many places to manually enter a form field's max character count. The `Apology` model's `CHARACTER_MAX` stores the maximum character count for the `apology.body` field and for 2 important reasons:

1. it's in an easy-to-find and predictable location, making future updates to that value, well, easy and predictable
2. it consolidates that value into ONE easy-to-access location so it can be referenced across all segments of the app:
 * model validations
 * HTML in the form view
 * Javascript displaying the current character count   
 * test suite

### But why didn't you...?

But why didn't I make the `Image` class a fully-instantiable, database-backed model? Good question. I considered it. I decided that it was overkill to have a whole table dedicated to a single `filename` field when I have no plans to allow users to upload their own photos or for an admin person to need this feature. It adds complexity to the database. It adds complexity to the relationship between `Apology` and `Image`. And for the foreseeable future, it's not necessary.

But why didn't I make a `@character_max = Apologies::CHARACTER_MAX` instance variable in the `apologies_controller` for the apologies views and javascript to access instead of adding it as an attribute on the `@apology` object? An instance variable in a controller is wild wild beast. It's essentially global, which is awesome if you're able to confirm that there won't be collisions in other parts of the app. But I'm not app-omniscient (yet... right ;) ) and I'm not sure what technical debt it might bring. So right now, I like to try to release as few wild beasts as possible into the views.

## Performance

[RubyCritic](https://github.com/whitesmith/rubycritic) gives this current codebase a score of 96/100 with all `A`-level files.

![alt text](/public/screenshots/rubycritic.png "rubycritic metrics")

Ideally, all files would be dark green and clustered into the lower left quadrant. Most files are in that quadrant and there are no `B`, `C`, `D`, nor `F` files. However, there is a trend towards complexity (top left quadrant) that I'll need to address. Additionally the `UsersController` is an outlier in the top right quadrant, indicating both complexity and churn, so this is slated for refactor next.  
