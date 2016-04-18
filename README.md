# The great trading post timesaver

This is a really basic app to make the process of exporting offers and requests from the community weaver software into a nice engaging email newsletter a little less tedious.

## Here's how it works

### Upload the latest contacts

The timebank uses a Google spreadsheet to track all the people in the system. You can export from Google as a .csv, then upload that to the timesaver: https://trading-post-time-saver.herokuapp.com/contacts

When you upload a new file, it will run `Contact.import()`, from `models/contact.rb`, which ignores everything apart from the columns named "First Name", "Surname", "Preferred contact", and "Address 2". For each row in the spreadsheet, it cleans up any whitespace, then merges the fields together into a `Contact` hash which has `name`, `details` and `suburb`.

### Upload latest offers and requests

"Offers and requests" are collectively called "services". You can download a .csv of all services from the Community Weaver software, and upload it to the timesaver here: https://trading-post-time-saver.herokuapp.com/services

This runs `Service.import()` from `models/service.rb`, which is a very similar process to importing contacts: it scrapes out the .csv and spits out a lot of `Service` hashes with: `service_type`, `category`, `title`, `body` and `name`.

### Offers

Now you have contacts and services loaded into the system, when you visit https://trading-post-time-saver.herokuapp.com/offers you'll see a categorised list of the offers.

If you look in `views/offers/index.html.erb` you'll see how this list is composed:

* there's a global variable called `@offers`, which is populated by the `index` action on `controllers/offers_controller.rb`. We loop through all of the offers, and for each one, print out:
* the category as a header, if it is the first offer in that category
* the body of the offer, after scrubbing out whitespace from the `offer.body`, and any html other than a few safe formatting tags
* the contact details

There's an option to show or hide the contact details, which is handled by javascript in `javascripts/offers.js.coffee`.

Also, if you want to make the list shorter, you can just click to remove any of the entries (reloading the page will restore them all). This is handled by `javascripts/requests.js.coffee`


### Requests

Works the same as Offers.

### Reset everything

There's a hosted version here: https://trading-post-time-saver.herokuapp.com/

There's no access control on that site so be sure to hit "Reset everything" when you are done, to scrub out any private information. This clears out the database so it's safe to leave this site lying around on the internet :)

### Disclaimer

This is terrible code, but it works. Please feel free to [log any issues](https://github.com/rdbartlett/timebank/issues), or preferably submit patches if you think of improvements :)
