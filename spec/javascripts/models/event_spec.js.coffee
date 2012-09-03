#= require spec_helper

describe "Event", ->

  it "defines a model", ->
    expect(Booth.Event).toBeDefined()

  describe "when retrieving records", ->
    beforeEach ->
      @store = DS.Store.create
        revision: 4,
        adapter: DS.FixtureAdapter.create()

      @event = Booth.Event.create(title: "Test")
      Booth.Event.FIXTURES = [
        {id: 1, title: "SMASH!"},
        {id: 2, title: "Cafe Bookings"},
      ]

    it "retrieves all events with findAll()", ->
      expect(@store.findAll(Booth.Event).length).toEqual(2)

    it "retrieves a single event with find()", ->
      cafe = @store.find(Booth.Event, 2)
      expect(cafe.get('id')).toEqual(2)
      expect(cafe.get('title')).toEqual("Cafe Bookings")

