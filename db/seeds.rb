# Event
smash_event = Event.create(
  :name => 'SMASH! 2013',
  :tagline => "Get in before the bastards knock down SCEC.",
  :description => "SMASH! Sydney Manga and Anime Show is a Japanese pop culture convention that is devoted to artists, creators and fans alike.",
  :sales_opened_at => 1.week.ago,
  :sales_closed_at => 3.weeks.from_now,
  :began_at    => '2013-08-10 09:00:00',
  :finished_at => '2013-08-10 18:00:00'
)

# TicketType
smash_event.products.build(
  :name  => "Day Pass",
  :price => "29.00",
)
smash_event.save!

