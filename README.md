# Description
This is a counter web app built in Ruby using Sinatra and Capybara.

# Kerri's notes
Updated the exercise with a decrementing button, showing the time the counter gets updated and a reset button for the counter - run the app via the instructions below. My notes and working process can be found below. 

# How to run the app
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rackup`
5. Navigate to `http://localhost:9292/` in your browser

# How to run the tests
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rspec`

# Questions to explore
1. Where are each of the three components of the MVC framework found in this application?
Model is found in in `counter.rb`
Views is handled in `index.erb`
Controller is in `app.rb`

2. What parts of the code run when we run the app in our browser? You could test your assumption by adding `p` lines and checking that you see the output you expect.
The an instance of the Counter class counter is running, when you but `p @counter` inside the '/' route you get an output like below when the app is running in the browser and the user is pressing the increment button:
```
#<Counter:0x00007ffae8a2e2f8 @count=0>
::1 - - [16/Apr/2021:14:04:20 +0100] "GET / HTTP/1.1" 200 263 0.0020
::1 - - [16/Apr/2021:14:04:22 +0100] "POST /increment HTTP/1.1" 303 - 0.0078
#<Counter:0x00007ffae8a2e2f8 @count=1>
::1 - - [16/Apr/2021:14:04:22 +0100] "GET / HTTP/1.1" 200 263 0.0026
::1 - - [16/Apr/2021:14:04:23 +0100] "POST /increment HTTP/1.1" 303 - 0.0022
#<Counter:0x00007ffae8a2e2f8 @count=2>
```

3. What part of the code runs when we click the "Increment" button?
The `increment` method in the Counter class runs on a new instance of itself running `@count += 1` 

4. Can you add a "Decrement" button which decreases the count by 1 each time it is pressed?
```ruby
# in app.rb
post '/decrement' do
    @counter.decrement
    redirect '/'
  end
# in index.erb
<form action="/decrement" method="post">
      <input type="submit" value="Decrement">
    </form>
# in counter.rb
def decrement
    @count -= 1
  end
# in counter_spec.rb
describe '#decrement' do
    it 'takes 1 away from the count' do
      counter = Counter.new
      counter.decrement
      expect(counter.count).to eq -1
    end 
  end
# in spec/feature/incrementing_decrementing_spec.rb
feature "decrement the count" do
  scenario "click the Decrement button and see the number Decrement" do
    visit("/")
    expect(page).to have_button('Decrement')
    click_button "Decrement"
    click_button "Decrement"
    expect(page).to have_content -1
  end
end
```

5. Can you update the app to display the time that the count was last updated?
```ruby
# in time_shown_spec.rb
feature 'the app updates and displays the time when the count is changed' do
  scenario 'the user updates the count' do
    visit("/")
    click_button "Increment"
    expect(page).to have_content "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end
end
# in counter_spec.rb
describe '#time_update' do
  it 'updates the time when the counter is changed' do
    counter = Counter.new
    counter.increment
    expect(counter.time_update).to eq "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end 
end
# in counter.rb
def time_update
  "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
end
# in index.erb
<em><%= @counter.time_update %></em>
```

6. Can you add a "Reset" button which will put the count back to zero?
```ruby
# in time_shown_spec.rb
feature 'the app updates and displays the time when the count is changed' do
  scenario 'the user updates the count' do
    visit("/")
    click_button "Increment"
    expect(page).to have_content "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end
end
# in counter_spec.rb
describe '#time_update' do
  it 'updates the time when the counter is changed' do
    counter = Counter.new
    counter.increment
    expect(counter.time_update).to eq "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end 
end
# in counter.rb
def time_update
  "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
end
# in index.erb
<em><%= @counter.time_update %></em>
```
