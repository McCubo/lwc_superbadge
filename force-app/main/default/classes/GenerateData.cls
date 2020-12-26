/*************************************************************
*  @authors: James Hou        , james@sparkworks.io;
*            Matheus Goncalves, matheus.goncalves@salesforce.com
*  Date: 1-2020
*  Description: The current generator uses names and assigns the following randomly:
*               - Contact, Type, Year, Location
*               
*               The following are dependent on randomly assigned boat type:
*               - Length, Price, Picture
**************************************************************/
public class GenerateData {

    public static final Map<String, List<Double>> BOAT_NAMES_GEOLOCATIONS = new Map<String, List<Double>> {
        'Sounder' => new List<Double> { 47.630068, -122.335491 }, 
        'Gallifrey Falls' => new List<Double> { 34.201658, -83.987133 }, 
        'Geronimo' => new List<Double> { 41.087337, -112.444332 }, 
        'All in Family' => new List<Double> { 43.796036, -87.062663 }, 
        'The Old Man and the Sea' => new List<Double> { 34.005537, -118.517813 }, 
        'The Enterprise' => new List<Double> { 37.527853, -77.464128 }, 
        'Falcon of the Millennium' => new List<Double> { 30.108554, -90.069323 }, 
        'Friend of the friends' => new List<Double> { 36.083559, -114.76663 }, 
        'Excelsior' => new List<Double> { 29.645725, -94.987107 }, 
        'Home Suite Home' => new List<Double> { 20.217061, -103.027593 }, 
        'Solange' => new List<Double> { -22.817794, -43.143775 }, 
        'Gaviões Avante' => new List<Double> { -23.789544, -46.616 }, 
        'Boca del River' => new List<Double> { -34.868924, -57.164422 }, 
        'Porta Frevo' => new List<Double> { -8.076642, -34.883019 }, 
        'Matucana' => new List<Double> { -11.999057, -77.209785 }, 
        'Morada do Sol' => new List<Double> { -3.002061, -60.49673 }, 
        'Chorrera' => new List<Double> { 8.894959, -79.303494 }, 
        'Jaco' => new List<Double> { 9.914279, -84.794382 }, 
        'Rengo' => new List<Double> { -33.247554, -71.780931 }, 
        'Santina' => new List<Double> { -22.004072, -47.340266 }, 
        'Pastelzinho' => new List<Double> { 38.637111, -9.29738 }, 
        'Balearic' => new List<Double> { 39.947598, 7.035742 }, 
        'Boat is all you need' => new List<Double> { 53.445404, -3.115097 }, 
        'Saxony' => new List<Double> { 51.609471, 12.380581 }, 
        'Diemen' => new List<Double> { 52.516834, 5.162924 }, 
        'Baltic' => new List<Double> { 64.544993, 22.585715 }, 
        'Moldova' => new List<Double> { 49.267432, 32.768038 }, 
        'Anatolian' => new List<Double> { 39.496975, 23.251544 }, 
        'Santiago Nou' => new List<Double> { 41.343256, 2.242023 }, 
        'Continental Brigitte' => new List<Double> { 50.98218, 1.543883 }, 
        'Renata The Explorer' => new List<Double> { -8.798379, 13.03788 }, 
        'Casablanca' => new List<Double> { 29.599549, -6.878134 }, 
        'Tindouf' => new List<Double> { -0.545918, 32.765299 }, 
        'Habemus Hermanus' => new List<Double> { -33.877368, 18.442243 }, 
        'Quirimbas' => new List<Double> { -19.053286, 40.925164 }, 
        'Chala' => new List<Double> { 13.837292, 13.471121 }, 
        'Orapa' => new List<Double> { -20.643781, 25.171479 }, 
        'Lagoon of the Land of Palms' => new List<Double> { 33.687486, 8.54616 }, 
        'Dodi' => new List<Double> { 7.737874, 0.235301 }, 
        'Moritani' => new List<Double> { 16.578485, -17.242173 }, 
        'Telangana' => new List<Double> { 17.322607, 78.358517 }, 
        'INA Boat' => new List<Double> { 28.585518, 77.281642 }, 
        'Wangsiyingxiang' => new List<Double> { 38.961221, 117.999819 }, 
        'Sanya' => new List<Double> { 24.851329, 119.486241 }, 
        'Tongi' => new List<Double> { 22.853543, 92.241154 }, 
        'Jimo' => new List<Double> { 37.554442, 126.558543 }, 
        'Daiseidin Gozooma Bēsu' => new List<Double> { 35.606826, 139.84439 }, 
        'Shadao' => new List<Double> { 36.815748, 100.075952 }, 
        'Longxue' => new List<Double> { 22.621682, 113.763062 }, 
        'Arroyo Fernando' => new List<Double> { 12.635463, 122.72445 }, 
        'Surry Retreat' => new List<Double> { -33.862323, 151.218235 }, 
        'Bendigo' => new List<Double> { -37.850092, 144.905569 }, 
        'Osborne Rocker' => new List<Double> { -32.006699, 115.813699 }, 
        'Argila' => new List<Double> { -16.294595, 128.751683 }, 
        'Elliot Finger' => new List<Double> { -27.946596, 137.028738 }, 
        'Pierce Harbour' => new List<Double> { -41.262039, 174.83168 }, 
        'Condado in the Water' => new List<Double> { -36.831362, 174.734312 }, 
        'Hobartaz' => new List<Double> { -39.381617, 160.250805 }, 
        'Strathgordon ' => new List<Double> { -42.743743, 146.168099 }, 
        'Albert Leichhardt' => new List<Double> { -17.651486, 139.727076 }
    };

    private static final Map<Integer, String> BOAT_DESCRIPTION_MAP = new Map<Integer, String>{
        0 => 'Life without a boat is not fun. I love this boat.',
        1 => 'Being on a boat that is moving through the water is one of my favorite experiences ever. Totally recommended.',
        2 => 'I spent uncounted hours sitting at the bow looking at the water and the sky, and it helped me getting calmer for the days to come. Such a peace of mind. This boat is very reliable.',
        3 => 'There is nothing half so much worth doing as having fun in this boat.',
        4 => 'One big, beefy, bodacious, beast of a boat. We went fishing, and swimming, and the boat was our safe house. So comfortable!',
        5 => 'An affordable family weekender, designed for shorter trips without compromising on the essentials.',
        6 => 'This marvel tops multiple categories as both a capable sportfishing boat and a comfortable power cruiser.',
        7 => 'It was a shot in the dark, but we love it now!',
        8 => 'So much freedom. As they say, vessels of freedom, harbors of heeling.',
        9 => 'We had a band playing in this boat, we rocked the boat, this was a timeless experience.',
        10 => 'This boat is big enough for two. Just me and you. It was our wedding anniversary and my wife was so happy!',
        11 => 'Get on this boat now, people. She got room for a party with friends.',
        12 => 'This boat was the boat that took me back to my loving family. Only great memories.',
        13 => 'I used to be a boater like you, then I bumped my knee. Still, had a lot of fun.',
        14 => 'If you plan on going fishing, you are going to need a bigger boat.',
        15 => 'This boat comes as it is, so you come as you are, not fancy, but very reliable.',
        16 => 'We went on a trip accross the bay, and we felt safe at all times. Recommended.',
        17 => 'A boat that is so much fun, the world will speak for her.',
        18 => 'If you feel like going on an adventure, keep in mind that it is dangerous to go alone. Take this boat! She will be your companion.',
        19 => 'Just like my beloved Ellie once said: "This boat was made to endure and survive!"',
        20 => 'This boat will make you think things like: "Yeah, good luck, that is almost impossible to- oh, we did it. Nice.". Perfect endurance.' 
    };

    public static final Map<String, List<String>> BOAT_TYPE_TO_PICTURE_PATHS_MAP = new Map<String, List<String>>{
        'sailboat' => new List<String>{
            '/resource/Sailboats/sailboat1.png',
            '/resource/Sailboats/sailboat2.png',
            '/resource/Sailboats/sailboat3.jpg',
            '/resource/Sailboats/sailboat4.jpg',
            '/resource/Sailboats/sailboat5.jpg',
            '/resource/Sailboats/sailboat6.jpg',
            '/resource/Sailboats/sailboat8.jpg',
            '/resource/Sailboats/sailboat9.jpg',
            '/resource/Sailboats/sailboat10.jpg',
            '/resource/Sailboats/sailboat11.jpg',
            '/resource/Sailboats/sailboat12.jpg',
            '/resource/Sailboats/sailboat13.jpg',
            '/resource/Sailboats/sailboat14.jpg',
            '/resource/Sailboats/sailboat15.jpg'
        },
        'fishingboat' => new List<String>{
            '/resource/Houseboats/fishingboat1.png',
            '/resource/Houseboats/fishingboat2.jpg',
            '/resource/Houseboats/fishingboat3.jpg',
            '/resource/Houseboats/fishingboat4.jpg'
        },
        'jetski' => new List<String>{
            '/resource/Houseboats/jetski1.png',
            '/resource/Houseboats/jetski2.jpg'
        },
        'highperformance' => new List<String>{
            '/resource/Houseboats/partyboat1.png',
            '/resource/Houseboats/houseboat6.jpg',
            '/resource/PleasureBoats/pleasureboat2.png',
            '/resource/PleasureBoats/pleasureboat3.png'
        },
        'pleasureboat' => new List<String>{
            '/resource/Sailboats/sportboat1.png',
            '/resource/PleasureBoats/pleasureboat1.png',
            '/resource/PleasureBoats/pleasureboat2.png',
            '/resource/PleasureBoats/pleasureboat3.png',
            '/resource/PleasureBoats/pleasureboat4.jpg',
            '/resource/PleasureBoats/pleasureboat5.jpg',
            '/resource/PleasureBoats/pleasureboat6.jpg',
            '/resource/PleasureBoats/pleasureboat7.jpg',
            '/resource/PleasureBoats/pleasureboat8.jpg',
            '/resource/PleasureBoats/pleasureboat9.jpg',
            '/resource/PleasureBoats/pleasureboat10.jpg',
            '/resource/PleasureBoats/pleasureboat11.jpg',
            '/resource/PleasureBoats/pleasureboat12.jpg',
            '/resource/PleasureBoats/pleasureboat13.jpg',
            '/resource/PleasureBoats/pleasureboat14.jpg',
            '/resource/PleasureBoats/pleasureboat15.jpg',
            '/resource/PleasureBoats/pleasureboat16.jpg',
            '/resource/PleasureBoats/pleasureboat17.jpg'

        },
        'skiboat' => new List<String>{
            '/resource/Sailboats/skiboat1.png',
            '/resource/Sailboats/skiboat2.png',
            '/resource/PleasureBoats/pleasureboat16.jpg'
        },
        'yacht' => new List<String>{
            '/resource/Sailboats/yacht1.png',
            '/resource/Sailboats/yacht2.png',
            '/resource/PleasureBoats/pleasureboat14.jpg'
        },
        'houseboat' => new List<String>{
            '/resource/Houseboats/houseboat1.png',
            '/resource/Houseboats/houseboat2.png',
            '/resource/Houseboats/houseboat3.jpg',
            '/resource/Houseboats/houseboat4.jpg',
            '/resource/Houseboats/houseboat5.jpg',
            '/resource/Houseboats/houseboat6.jpg',
            '/resource/Houseboats/houseboat7.jpg',
            '/resource/Houseboats/houseboat8.jpg',
            '/resource/Houseboats/houseboat9.jpg',
            '/resource/Houseboats/partyboat2.jpg',
            '/resource/Houseboats/partyboat3.jpg',
            '/resource/Houseboats/partyboat4.jpg'
        }
    };
    
    public static void init() {
        deleteOldData();
        generateNewData();        
    }
    
    private static void deleteOldData() {
        DELETE [SELECT id FROM Opportunity];
        DELETE [SELECT id FROM Case];
        DELETE [SELECT id FROM Account];
        DELETE [SELECT id FROM Contact];
        DELETE [SELECT id FROM Boat__c];
        DELETE [SELECT id FROM BoatType__c];
        DELETE [SELECT id FROM BoatReview__c];
    }

    private static void generateNewData()  {
        List<Contact> contacts = GenerateData.insertAccountsAndContacts();
        Map<String, BoatType__c> boatTypeMap = GenerateData.insertBoatTypes();
        List<Boat__c> boatsToInsert = new List<Boat__c>();

        // Number of boat names drive how many boats to be created.
        // Contacts are randomized.
        // However, type and image are going to be aligned.
        for (String boatName : BOAT_NAMES_GEOLOCATIONS.keySet()) {
  
              // Any contact is fine
            Contact randomContact = contacts[GenerateData.getRandomInteger(0, (contacts.size() - 1))];

            // Leverage randomness from the keyset to derive type
            List<String> castKeys = new List<String>(BOAT_TYPE_TO_PICTURE_PATHS_MAP.keySet());
            String boatType = castKeys[GenerateData.getRandomInteger(0, (castKeys.size() - 1))];

            // Get the geolocation from the map based on the boat name
            List<Double> latitudeAndLongitude = BOAT_NAMES_GEOLOCATIONS.get(boatName);
            
            // Then we can decipher which random image to use
            List<String> resourcePaths = BOAT_TYPE_TO_PICTURE_PATHS_MAP.get(boatType);
            String picturePath = resourcePaths[GenerateData.getRandomInteger(0, (resourcePaths.size() - 1))];

            Boat__c boat = new Boat__c (
                Name = boatName,
                Contact__c =  randomContact.Id,
                BoatType__c = boatTypeMap.get(boatType).Id,
                Length__c = GenerateData.getLengthForBoatType(boatType),
                Price__c = GenerateData.getPriceForBoatType(boatType),
                Year_Built__c = GenerateData.getRandomInteger(2000, 2020),
                Picture__c = picturePath,
                Description__c = getNextBoatDescription(),
                Geolocation__Latitude__s = latitudeAndLongitude[0],
                Geolocation__Longitude__s = latitudeAndLongitude[1]
            );
            boatsToInsert.add(boat);
        }
        insert boatsToInsert;
    }

    private static Integer boatDescriptionIndex = 0; 
    private static String getNextBoatDescription() {
        if (boatDescriptionIndex > BOAT_DESCRIPTION_MAP.size() - 1) {
            boatDescriptionIndex = 0;
        }

        String boatDescription = BOAT_DESCRIPTION_MAP.get(boatDescriptionIndex);
        boatDescriptionIndex++;

        return boatDescription;
    }

    private static List<Contact> insertAccountsAndContacts() {
        List<Contact> contactsToInsert = new List<Contact>();
        
        Account newAccount = new Account (
            Name = 'Lightning Web Components Specialist Superbadge',
            BillingCity ='San Francisco',
            BillingCountry ='California'
        );
        insert newAccount;

        Contact contact1 = new Contact (
            FirstName = 'Jamie',
            LastName = 'Powell',
            AccountId = newAccount.Id,
            Email = 'jamie@example.com'
        );
        contactsToInsert.add(contact1);

        Contact contact2 = new Contact (
            FirstName = 'Gayatri',
            LastName = 'Bhatt',
            AccountId = newAccount.Id,
            Email = 'gayatri@example.com'
        );
        contactsToInsert.add(contact2);

        Contact contact3 = new Contact (
            FirstName = 'Aaron',
            LastName = 'Gray',
            AccountId = newAccount.Id,
            Email = 'aaron@example.com'
        );
        contactsToInsert.add(contact3);

        Contact contact4 = new Contact (
            FirstName = 'Emanuel',
            LastName = 'Manzanares',
            AccountId = newAccount.Id,
            Email = 'emanuel@example.com'
        );
        contactsToInsert.add(contact4);

        Contact contact5 = new Contact (
            FirstName = 'Rachel',
            LastName = 'King',
            AccountId = newAccount.Id,
            Email = 'rachel@example.com'
        );
        contactsToInsert.add(contact5);  

        Contact contact6 = new Contact (
            FirstName = 'Takuya',
            LastName = 'Watanabe',
            AccountId = newAccount.Id,
            Email = 'takuya@example.com'
        );
        contactsToInsert.add(contact6);  

        Contact contact7 = new Contact (
            FirstName = 'Byanca',
            LastName = 'Goncalves',
            AccountId = newAccount.Id,
            Email = 'byanca@example.com'
        );
        contactsToInsert.add(contact7);  

        Contact contact8 = new Contact (
            FirstName = 'Liam',
            LastName = 'Bates',
            AccountId = newAccount.Id,
            Email = 'Liam@example.com'
        );
        contactsToInsert.add(contact8);  

        Contact contact9 = new Contact (
            FirstName = 'Skye',
            LastName = 'Taylor',
            AccountId = newAccount.Id,
            Email = 'skye@example.com'
        );
        contactsToInsert.add(contact9);  

        Contact contact10 = new Contact (
            FirstName = 'Millie',
            LastName = 'Brooks',
            AccountId = newAccount.Id,
            Email = 'millie@example.com'
        );

        contactsToInsert.add(contact10);

        Contact contact11 = new Contact (
            FirstName = 'Jose',
            LastName = 'Weimar',
            AccountId = newAccount.Id,
            Email = 'weimar@example.com'
        );

        contactsToInsert.add(contact11);

        Contact contact12 = new Contact (
            FirstName = 'James',
            LastName = 'August',
            AccountId = newAccount.Id,
            Email = 'james@example.com'
        );

        contactsToInsert.add(contact12);

        Contact contact13 = new Contact (
            FirstName = 'Solange',
            LastName = 'Pereira',
            AccountId = newAccount.Id,
            Email = 'solange@example.com'
        );

        contactsToInsert.add(contact13);

        Contact contact14 = new Contact (
            FirstName = 'Matheus',
            LastName = 'Henrique',
            AccountId = newAccount.Id,
            Email = 'matheus@example.com'
        );

        contactsToInsert.add(contact14);

        Contact contact15 = new Contact (
            FirstName = 'Ronaldo',
            LastName = 'Nazario',
            AccountId = newAccount.Id,
            Email = 'ronaldo@example.com'
        );

        contactsToInsert.add(contact15);

        insert contactsToInsert;
        return contactsToInsert;
    }

    private static Map<String, BoatType__c> insertBoatTypes() {
        BoatType__c sailboat = new BoatType__c (
            Name = 'Sailboat'
        ); 
        insert sailboat;
        
        BoatType__c fishingboat = new BoatType__c (
            Name = 'Fishing Boat'
        ); 
        insert fishingboat;
        
        BoatType__c jetski = new BoatType__c (
            Name = 'Jet Ski'
        );
        insert jetski;
        
        BoatType__c highperformance = new BoatType__c (
            Name = 'High Performance'
        ); 
        insert highperformance;
        
        BoatType__c pleasureboat = new BoatType__c (
            Name = 'Pleasure Boat'
        );
        insert pleasureboat;
        
        BoatType__c skiboat = new BoatType__c (
            Name = 'Ski Boat'
        );
        insert skiboat;
        
        BoatType__c yacht = new BoatType__c (
            Name = 'Yacht'
        );
        insert yacht;
        
        BoatType__c houseboat = new BoatType__c (
            Name = 'House Boat'
        );
        insert houseboat;

        Map<String, BoatType__c> boatTypeNameMap = new Map<String, BoatType__c>{
            'sailboat' => sailboat,
            'fishingboat' => fishingboat,
            'jetski' => jetski,
            'highperformance' => highperformance,
            'pleasureboat' => pleasureboat,
            'skiboat' => skiboat,
            'yacht' => yacht,
            'houseboat' => houseboat
        };

        return boatTypeNameMap; 
    }

    private static Integer getRandomInteger(Integer min, Integer max) {
        return Math.round(Math.random() * (max - min) + min);
    }

    private static Integer getRandomIntegerRoundToThousands(Integer min, Integer max) {
        Integer rawValue = GenerateData.getRandomInteger(min, max);
        return rawValue + (1000 - Math.mod(rawValue, 1000));
    }

    public static Integer getLengthForBoatType(String boatType) {
        Integer length;
        switch on boatType {
            when 'jetski' {
                length = getRandomInteger(5, 7);
            }
            when 'skiboat' {
                length = getRandomInteger(8, 15);
            }
            when 'houseboat' {
                length = getRandomInteger(10, 25);
            }
            when 'fishingboat' {
                length = getRandomInteger(13, 25);
            }
            when 'sailboat' {
                length = getRandomInteger(15, 25);
            }
            when 'pleasureboat' {
                length = getRandomInteger(15, 25);
            }
            when 'yacht' {
                length = getRandomInteger(25, 35);
            }
            when 'highperformance' {
                length = getRandomInteger(15, 25);
            }
            when else {
                length = 20;
            }
        }
        return length;
    }

    public static Integer getPriceForBoatType(String boatType) {
        Integer price;
        switch on boatType {
            when 'jetski' {
                price = getRandomInteger(500, 2000);
            }
            when 'skiboat' {
                price = getRandomIntegerRoundToThousands(20000, 25000);
            }
            when 'houseboat' {
                price = getRandomIntegerRoundToThousands(75000, 150000);
            }
            when 'fishingboat' {
                price = getRandomIntegerRoundToThousands(80000, 175000);
            }
            when 'sailboat' {
                price = getRandomIntegerRoundToThousands(50000, 250000);
            }
            when 'pleasureboat' {
                price = getRandomIntegerRoundToThousands(200000, 400000);
            }
            when 'yacht' {
                price = getRandomIntegerRoundToThousands(300000, 600000);
            }
            when 'highperformance' {
                price = getRandomIntegerRoundToThousands(300000, 500000);
            }
            when else {
                price = 15000;
            }
        }
        return price;
    }

}