// 1.
db.listings.find().limit(2)
/*
[
  {
    _id: ObjectId("61a9cb061d973d7ea0637b98"),
    id: 5121,
    listing_url: 'https://www.airbnb.com/rooms/5121',
    scrape_id: Long("20211102175544"),
    last_scraped: '2021-11-03',
    name: 'BlissArtsSpace!',
    description: "<b>The space</b><br />HELLO EVERYONE AND THANKS FOR VISITING BLISS ART SPACE! <br /><br />Thank you all for your support. I've traveled a lot in the last year few years, to the  U.K. G
*/

// 2.
db.listings.distinct("host_name")
/*
[
    NaN,
    123,
    475,
    '',
    "'Cil",
    '(Ari) HENRY LEE',
    '(Email hidden by Airbnb)',
    '-TheQueensCornerLot',
    '2018Serenity',
*/

// 3.
db.listings.find(
    {
        "host_name":"Toby"
    }, 
    {
        _id:0,
        "listing_url":1,
        "name":1,
        "host_name":1
    }
)
/*
[
  {
    listing_url: 'https://www.airbnb.com/rooms/4778638',
    name: 'Affordable room in a friendly house',
    host_name: 'Toby'
  },
  {
    listing_url: 'https://www.airbnb.com/rooms/5284341',
    name: 'Quiet Cottage with Private Yard',
    host_name: 'Toby'
*/

// 4.
db.listings.find(
    {
        "host_name":
        {
            $in:["Toby", "Adelma", "Addie"]
        }
    }, 
        {
            _id:0,
            "name":1,
            "host_name":1,
            "neighbourhood_cleansed":1,
            "price":1
    }
).sort({"host_name":1})
/*
[
  {
    name: '~Room for Guest in Stunning BK Apt~',
    host_name: 'Addie',
    neighbourhood_cleansed: 'Bedford-Stuyvesant',
    price: '$39.00'
  },
  {
    name: 'PRIVATE ROOM IN SHARED APARTMENT, UN VICINITY',
    host_name: 'Adelma',
*/

// 5.
db.listings.find(
    {
        "bedrooms":{$gte:2},
        "neighbourhood_group_cleansed":"Brooklyn"
    },
    {
        _id:0,
        "name":1,
        "neighbourhood_cleansed":1,
        "bedrooms":1,
        "price":1,
    }
).sort({"review_scores_rating":-1}).limit(10)
/*
[
  {
    name: 'Gracious Brooklyn Limestone',
    neighbourhood_cleansed: 'Prospect-Lefferts Gardens',
    bedrooms: 4,
    price: '$175.00'
  },
  {
    name: 'Penthouse in Bedford Stuyvesant',
    neighbourhood_cleansed: 'Bedford-Stuyvesant',
*/

// 6. why diff?
db.listings.aggregate(
    [
        {
            $group:{
                _id:"$host_name", 
                listingsCount:{$sum:1}
            }
        }

    ]
)
/*
[
  { _id: 'Keisy', listingsCount: 1 },
  { _id: 'Neil & Katie', listingsCount: 1 },
  { _id: 'Dung', listingsCount: 1 },
  { _id: 'Kristie', listingsCount: 2 },
  { _id: 'Marshall', listingsCount: 1 },
  { _id: 'Sammy', listingsCount: 9 },
  { _id: 'Beatriz', listingsCount: 2 },
  { _id: 'Amapola', listingsCount: 1 },
  { _id: 'Dali', listingsCount: 1 },
*/

// 7.
db.listings.aggregate(
    [
        {
            $group:{
                _id:"$host_name",
                listingsCount:{$sum:1}
            }
        },
        {
            $project:{
                listingsCount:1,
                _id:0,
                host:"$_id"
            }
        }
    ]
).sort(
    {
        "listingsCount":-1
    }
)
/*
[
  { listingsCount: 400, host: 'June' },
  { listingsCount: 311, host: 'Michael' },
  { listingsCount: 304, host: 'Blueground' },
  { listingsCount: 251, host: 'Karen' },
  { listingsCount: 238, host: 'David' },
  { listingsCount: 222, host: 'Jeniffer' },
  { listingsCount: 210, host: 'Alex' },
  { listingsCount: 178, host: 'Daniel' },
  { listingsCount: 175, host: 'John' },
*/

// 8.
db.listings.aggregate(
    [
        {
           $match:{
                $and:[
                    {"neighbourhood_group_cleansed":"Brooklyn"},
                    {"bedrooms":{$gte:1}},
                    {"beds":{$gte:1}},
                ]
           }
        },
        {
            $project:{
                _id:0,
                "name":1,
                "neighbourhood_cleansed":1,
                "bedrooms":1,
                "beds":1,
                "bedroomBedRatio":{$divide:["$bedrooms","$beds"]}
           }
        }
    ]
).sort({"neighbourhood_cleansed":1})
/*
[
  {
    name: 'Brand New small 1 Bedroom apt in Brooklyn',
    neighbourhood_cleansed: 'Bath Beach',
    bedrooms: 1,
    beds: 1,
    bedroomBedRatio: 1
  },
  {
    name: 'Private Queen room&bathroom in NEW Luxury Building',
*/

// 9.
db.listings.aggregate(
    [
        {
            $match:{
                 $and:[
                     {"bedrooms":{$gte:1}},
                     {"beds":{$gte:1}},
                 ]
            }
        },
        {
            $project:{
                "bedroomBedRatio":{$divide:["$bedrooms","$beds"]},
                "neighbourhood_group_cleansed":1
           }
        }, 
        {
            $group:{
                _id:"$neighbourhood_group_cleansed",
                avgBedRatio:{$avg:"$bedroomBedRatio"}
            }
        }
    ]
).sort({"avgBedRatio":-1})
/*
[
  { _id: 'Brooklyn', avgBedRatio: 0.925893863719455 },
  { _id: 'Manhattan', avgBedRatio: 0.9020413600110374 },
  { _id: 'Queens', avgBedRatio: 0.88898632498287 },
  { _id: 'Bronx', avgBedRatio: 0.8876594739329029 },
  { _id: 'Staten Island', avgBedRatio: 0.83395660461987 }
]
*/

// 10.
db.listings.aggregate(
    [
        {
            $match:{
                "neighbourhood_group_cleansed":"Manhattan",
            }
        },
        {
            $group:{
                _id:"$neighbourhood_cleansed",
                avgRating:{$avg:"$review_scores_rating"},
                countListings:{$sum:1}
            }
        },
        {
            $match:{
                "countListings":{$gte:100}
            }
        }
    ]
)
/*
[
  {
    _id: 'Theater District',
    avgRating: 4.361166666666667,
    countListings: 283
  },
  {
    _id: 'Greenwich Village',
    avgRating: 4.545862068965517,
    countListings: 241
*/