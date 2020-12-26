@isTest
public with sharing class BoatDataServiceTest {
    @testSetup
    static void createData(){
        Test.startTest();
        GenerateData.init();
        Test.stopTest();
    }

    @isTest
    static void testGetBoatsWithBoatId(){
        List<BoatType__c> boatTypes = BoatDataService.getBoatTypes();
        System.assertEquals(false, boatTypes.isEmpty(),'The there are no Boat Type records.');
    
        String boatTypeId = boatTypes.get(0).Id;
        List<Boat__c> boatsToTest = BoatDataService.getBoats(boatTypeId);
        List<Boat__c> boatsWithIdExpected = [SELECT Id FROM Boat__c WHERE BoatType__c = :boatTypeId];
        System.assertEquals(boatsWithIdExpected.size(), boatsToTest.size(), 'The boat query did not return the right about of boats');
    }

    @isTest
    static void testGetBoatsWithoutBoatId(){
        List<Boat__c> boatsToTest = BoatDataService.getBoats(null);
        List<Boat__c> boatsWithIdExpected = [SELECT Id FROM Boat__c];
        System.assertEquals(boatsWithIdExpected.size(), boatsToTest.size(), 'The boat query did not return the right about of boats');

    }

    @isTest
    static void testGetSimilarBoatsByLength(){
        List<Boat__c> boat = [SELECT Id, Length__c FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');
        List<Boat__c> boatsByLength =  BoatDataService.getSimilarBoats(boat.get(0).Id,  BoatDataService.LENGTH_TYPE);
        List<Boat__c> boatsByLengthExpected = [
                SELECT Id,Length__c
                FROM Boat__c
                WHERE Id != :boat.get(0).Id
                AND (Length__c >= :boat.get(0).Length__c / 1.2)
                AND (Length__c <= :boat.get(0).Length__c * 1.2)
            ];
        System.assertEquals(boatsByLengthExpected.size(), boatsByLength.size(), 'The query did not return the expected similar boats by length.');
    }

    @isTest
    static void testGetSimilarBoatsByPrice(){
        List<Boat__c> boat = [SELECT Id, Price__c FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');
        List<Boat__c> boatsByPrice =  BoatDataService.getSimilarBoats(boat.get(0).Id,  BoatDataService.PRICE_TYPE);
        List<Boat__c> boatsByPriceExpected = [
                SELECT Id,Price__c
                FROM Boat__c
                WHERE Id != :boat.get(0).Id
                AND (Price__c >= :boat.get(0).Price__c / 1.2)
                AND (Price__c <= :boat.get(0).Price__c * 1.2)
            ];
        System.assertEquals(boatsByPriceExpected.size(), boatsByPrice.size(), 'The query did not return the expected similar boats by Price.');
    }

    @isTest
    static void testGetSimilarBoatsByType(){
        List<BoatType__c> boatTypes = BoatDataService.getBoatTypes();
        System.assertEquals(false, boatTypes.isEmpty(),'The there are no Boat Type records.');
    
        String boatTypeId = boatTypes.get(0).Id;
        List<Boat__c> boatsWithTypeId = BoatDataService.getBoats(boatTypeId);
        System.assertEquals(false, boatsWithTypeId.isEmpty(), 'There are no botes with specified boat Id');
        
        List<Boat__c> boatsByTYPE =  BoatDataService.getSimilarBoats(boatsWithTypeId.get(0).Id,  BoatDataService.TYPE_TYPE);
        System.assertEquals(boatsWithTypeId.size() - 1, boatsByTYPE.size(), 'The similar boats by type query did not return the right amount.');

    }

    @isTest
    static void testGetSimilarBoatsParentBoatEmpty(){
        List<Boat__c> emptyBoat = BoatDataService.getSimilarBoats(null, '');
        System.assertEquals(true, emptyBoat.isEmpty(), 'The similar boats should be empty.');
    }

    @isTest
    static void testGetBoatReviews(){
        List<Boat__c> boat = [SELECT Id, Price__c FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');

        BoatReview__c review = new BoatReview__c(Boat__c = boat.get(0).Id, Comment__c = '', Rating__c = 2);
        insert review;

        List<BoatReview__c> reviews = BoatDataService.getAllReviews(boat.get(0).Id);
        System.assertEquals(1, reviews.size(), 'There reviews where not queries correctly.');

    }

    @isTest
    static void testGetBoatsByLocation(){
        List<Boat__c> boat = [SELECT Id, Geolocation__Latitude__s, Geolocation__Longitude__s,BoatType__r.Id FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');

        String locationSerial = BoatDataService.getBoatsByLocation(boat.get(0).Geolocation__Latitude__s, boat.get(0).Geolocation__Longitude__s, boat.get(0).BoatType__r.Id);
        List<Object> boatsByLocation = (List<Object>)JSON.deserializeUntyped(locationSerial);
        List<Boat__c> boatsExpected = [SELECT Id FROM Boat__c WHERE BoatType__c = :boat.get(0).BoatType__r.Id ORDER BY DISTANCE(Geolocation__c, GEOLOCATION(:boat.get(0).Geolocation__Latitude__s, :boat.get(0).Geolocation__Longitude__s), 'mi') LIMIT 10];
        System.assertEquals(boatsExpected.size(), boatsByLocation.size(), 'The Boats were not queried correctly depending on their localization.');
    }



}