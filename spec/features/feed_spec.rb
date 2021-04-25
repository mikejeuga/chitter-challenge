require_relative "./web_helper.rb"

feature "The feed page" do
		scenario "have a massage box" do
			 visit("/feed")
			 expect(page).to have_content("Chitter")
			 expect(page).to have_content("Compose new Peep")
			 expect(page).to have_button("Peep")
		end
end

feature "The peeps" do
	scenario "should be seen on the feed page" do
		add_peeps
		visit("/feed")
		expect(page).to have_content("This is the first Peep")
		expect(page).to have_content("I am feeling good today.")
	end
end

feature "When the user writes and clicks" do
  scenario "The peep should appear in the feed." do
    visit("/feed")
    fill_in("message", with: "This my first peep!!!")
    click_button("Peep")
    expect(page).to have_content("This my first peep!!!")
  end
end


feature "When the user writes a peep and clicks" do
  scenario "we should see the time stamp." do
		peepsy = Peep.create(message: "I want to check the time stamp")
    visit("/feed")
    fill_in("message", with: "This my first peep!!!")
    click_button("Peep")
    expect(page).to have_content("#{peepsy.create_date}")
  end
end