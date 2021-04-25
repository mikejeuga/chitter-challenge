feature "The homepage" do
		scenario "should greet the user" do
				visit("/")
				expect(page).to have_content("Welcome to Chitter")
				expect(page).to have_button("Let's peep!")
		end
end
